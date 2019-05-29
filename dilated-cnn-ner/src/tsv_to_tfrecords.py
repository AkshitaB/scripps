from __future__ import absolute_import
from __future__ import division
from __future__ import print_function

import re, os
import sys
import tensorflow as tf
import random
import numpy as np
from glob import glob

tf.app.flags.DEFINE_string('in_file', 'naacl-data.tsv', 'tsv file containing string data')
tf.app.flags.DEFINE_string('vocab', '', 'file containing vocab (empty means make new vocab)')
tf.app.flags.DEFINE_string('labels', '', 'file containing labels (but always add new labels)')
tf.app.flags.DEFINE_string('shapes', '', 'file containing shapes (add new shapes only when adding new vocab)')
tf.app.flags.DEFINE_string('chars', '', 'file containing characters')

tf.app.flags.DEFINE_string('embeddings', '', 'pretrained embeddings')

tf.app.flags.DEFINE_string('out_dir', '', 'export tf protos')

tf.app.flags.DEFINE_integer('window_size', 3, 'window size (for computing padding)')
tf.app.flags.DEFINE_boolean('lowercase', False, 'whether to lowercase')

tf.app.flags.DEFINE_boolean('debug', False, 'print debugging output')

tf.app.flags.DEFINE_boolean('predict_pad', False, 'whether to predict padding labels')

tf.app.flags.DEFINE_boolean('documents', False, 'whether to grab documents rather than sentences')

tf.app.flags.DEFINE_boolean('update_maps', False, 'whether to update maps')

tf.app.flags.DEFINE_string('update_vocab', '', 'file to update vocab with tokens from training data')

tf.app.flags.DEFINE_string('dataset', 'conll', 'which dataset')


FLAGS = tf.app.flags.FLAGS

ZERO_STR = "<ZERO>"
PAD_STR = "<PAD>"
OOV_STR = "<OOV>"
NONE_STR = "<NONE>"
SENT_START = "<S>"
SENT_END = "</S>"

pad_strs = [PAD_STR, SENT_START, SENT_END, ZERO_STR, NONE_STR]

DOC_MARKER_CONLL = "-DOCSTART-"
DOC_MARKER_ONTONOTES = "#begin document"
DOC_MARKER = DOC_MARKER_CONLL if FLAGS.dataset == "conll2003" else DOC_MARKER_ONTONOTES

label_int_str_map = {}
token_int_str_map = {}
char_int_str_map = {}

pad_width = int(FLAGS.window_size/2)
onto_genre = ["bn", "bc", "nw", "mz", "tc", "wb"]

def _int64_feature(value): return tf.train.Feature(int64_list=tf.train.Int64List(value=value))


def shape(string):
    if all(c.isupper() for c in string):
        return "AA"
    if string[0].isupper():
        return "Aa"
    if any(c for c in string if c.isupper()):
        return "aAa"
    else:
        return "a"


def get_str_label_from_line_conll(line):
    token_str, _, _, label_str = line.strip().split(' ')
    return token_str, label_str, ''


def get_str_label_from_line_ontonotes(line, current_tag):
    parts = line.split()
    try:
        token_str = parts[3]
        onto_label_str = parts[10]
        if onto_label_str.startswith('('):
            if onto_label_str.endswith(')'):
                label_str = 'U-%s' % onto_label_str[1:-1]
                current_tag = ''
            else:
                current_tag = onto_label_str[1:-1]
                label_str = 'B-%s' % current_tag
        elif onto_label_str.endswith(')'):
            label_str = 'L-%s' % current_tag
            current_tag = ''
        elif current_tag != '':
            label_str = 'I-%s' % current_tag
        else:
            label_str = 'O'
        return token_str, label_str, current_tag
    except Exception as e:
        print("Caught exception: %s" % e.message)
        print("Line: %s" % line)
        raise


def make_example(writer, lines, label_map, token_map, shape_map, char_map, update_vocab, update_chars):
    # data format is:
    # token pos phrase ner
    # LONDON NNP I-NP I-LOC
    # 1996-08-30 CD I-NP O

    # West NNP I-NP I-MISC
    # Indian NNP I-NP I-MISC
    # all-rounder NN I-NP O
    # ...

    sent_len = len(lines)
    num_breaks = sum([1 if line.strip() == "" else 0 for line in lines])
    max_len_with_pad = pad_width * (num_breaks + 2) + (sent_len - num_breaks)
    max_word_len = max(map(len, lines))

    oov_count = 0
    if sent_len == 0:
        return 0, 0, 0

    tokens = np.zeros(max_len_with_pad, dtype=np.int64)
    shapes = np.zeros(max_len_with_pad, dtype=np.int64)
    chars = np.zeros(max_len_with_pad*max_word_len, dtype=np.int64)
    intmapped_labels = np.zeros(max_len_with_pad, dtype=np.int64)
    sent_lens = []
    tok_lens = []

    # initial padding
    tokens[:pad_width] = token_map[PAD_STR]
    shapes[:pad_width] = shape_map[PAD_STR]
    chars[:pad_width] = char_map[PAD_STR]
    if FLAGS.predict_pad:
        intmapped_labels[:pad_width] = label_map[PAD_STR]
    tok_lens.extend([1]*pad_width)

    last_label = "O"
    labels = []
    current_sent_len = 0
    char_start = pad_width
    idx = pad_width
    current_tag = ''
    for i, line in enumerate(lines):
        line = line.strip()
        if line:
            token_str, label_str, current_tag = get_str_label_from_line_conll(line) if FLAGS.dataset == 'conll2003' else get_str_label_from_line_ontonotes(line, current_tag)

            # skip docstart markers
            if token_str == DOC_MARKER:
                return 0, 0, 0

            current_sent_len += 1

            # process tokens to match Collobert embedding preprocessing:
            # - normalize the digits to 0
            # - lowercase
            token_str_digits = re.sub("\d", "0", token_str)

            # get capitalization features
            token_shape = shape(token_str_digits)

            token_str_normalized = token_str_digits.lower() if FLAGS.lowercase else token_str_digits

            if token_shape not in shape_map:
                shape_map[token_shape] = len(shape_map)

            # Don't use normalized token str -- want digits
            for char in token_str:
                if char not in char_map and update_chars:
                    char_map[char] = len(char_map)
                    char_int_str_map[char_map[char]] = char
            tok_lens.append(len(token_str))

            # convert label to BILOU encoding
            label_bilou = label_str
            # handle cases where we need to update the last token we processed
            if label_str == "O" or label_str[0] == "B" or (last_label != "O" and label_str[2] != last_label[2]):
                if last_label[0] == "I":
                    labels[-1] = "L" + labels[-1][1:]
                elif last_label[0] == "B":
                    labels[-1] = "U" + labels[-1][1:]
            if label_str[0] == "I":
                if last_label == "O" or label_str[2] != last_label[2]:
                    label_bilou = "B-" + label_str[2:]

            if token_str_normalized not in token_map:
                oov_count += 1
                if update_vocab:
                    token_map[token_str_normalized] = len(token_map)
                    token_int_str_map[token_map[token_str_normalized]] = token_str_normalized

            tokens[idx] = token_map.get(token_str_normalized, token_map[OOV_STR])
            shapes[idx] = shape_map[token_shape]
            chars[char_start:char_start+tok_lens[-1]] = [char_map.get(char, char_map[OOV_STR]) for char in token_str]
            char_start += tok_lens[-1]
            labels.append(label_bilou)
            last_label = label_bilou
            idx += 1
        elif current_sent_len > 0:
            sent_lens.append(current_sent_len)
            current_sent_len = 0
            tokens[idx:idx + pad_width] = token_map[PAD_STR]
            shapes[idx:idx + pad_width] = shape_map[PAD_STR]
            chars[char_start:char_start + pad_width] = char_map[PAD_STR]
            char_start += pad_width
            tok_lens.extend([1] * pad_width)
            labels.extend([PAD_STR if FLAGS.predict_pad else "O"] * pad_width)
            idx += pad_width

            last_label = "O"

    if last_label[0] == "I":
        labels[-1] = "L" + labels[-1][1:]
    elif last_label[0] == "B":
        labels[-1] = "U" + labels[-1][1:]

    if not FLAGS.documents:
        sent_lens.append(sent_len)

    # final padding
    if not FLAGS.documents:
        tokens[idx:idx+pad_width] = token_map[PAD_STR]
        shapes[idx:idx+pad_width] = shape_map[PAD_STR]
        chars[char_start:char_start+pad_width] = char_map[PAD_STR]
        char_start += pad_width
        tok_lens.extend([1] * pad_width)
        if FLAGS.predict_pad:
            intmapped_labels[idx:idx + pad_width] = label_map[PAD_STR]

    for label in labels:
        if label not in label_map:
            label_map[label] = len(label_map)
            label_int_str_map[label_map[label]] = label

    intmapped_labels[pad_width:pad_width+len(labels)] = map(lambda s: label_map[s], labels)

    # chars = chars.flatten()

    # print(sent_lens)

    padded_len = (len(sent_lens)+1)*pad_width+sum(sent_lens)
    intmapped_labels = intmapped_labels[:padded_len]
    tokens = tokens[:padded_len]
    shapes = shapes[:padded_len]
    chars = chars[:sum(tok_lens)]

    if FLAGS.debug:
        print("sent lens: ", sent_lens)
        print("tok lens: ", tok_lens, len(tok_lens), sum(tok_lens))
        print("labels", map(lambda t: label_int_str_map[t], intmapped_labels), len(intmapped_labels))
        print("tokens", map(lambda t: token_int_str_map[t], tokens), len(tokens))
        print("chars", map(lambda t: char_int_str_map[t], chars), len(chars))

    example = tf.train.SequenceExample()

    fl_labels = example.feature_lists.feature_list["labels"]
    for l in intmapped_labels:
        fl_labels.feature.add().int64_list.value.append(l)

    fl_tokens = example.feature_lists.feature_list["tokens"]
    for t in tokens:
        fl_tokens.feature.add().int64_list.value.append(t)

    fl_shapes = example.feature_lists.feature_list["shapes"]
    for s in shapes:
        fl_shapes.feature.add().int64_list.value.append(s)

    fl_chars = example.feature_lists.feature_list["chars"]
    for c in chars:
        fl_chars.feature.add().int64_list.value.append(c)

    fl_seq_len = example.feature_lists.feature_list["seq_len"]
    for seq_len in sent_lens:
        fl_seq_len.feature.add().int64_list.value.append(seq_len)

    fl_tok_len = example.feature_lists.feature_list["tok_len"]
    for tok_len in tok_lens:
        fl_tok_len.feature.add().int64_list.value.append(tok_len)

    writer.write(example.SerializeToString())
    return sum(sent_lens), oov_count, 1


def tsv_to_examples():
    label_map = {}
    token_map = {}
    shape_map = {}
    char_map = {}

    update_vocab = True
    update_chars = True

    token_map[PAD_STR] = len(token_map)
    token_int_str_map[token_map[PAD_STR]] = PAD_STR
    char_map[PAD_STR] = len(char_map)
    char_int_str_map[char_map[PAD_STR]] = PAD_STR
    shape_map[PAD_STR] = len(shape_map)
    if FLAGS.predict_pad:
        label_map[PAD_STR] = len(label_map)
        label_int_str_map[label_map[PAD_STR]] = PAD_STR

    token_map[OOV_STR] = len(token_map)
    token_int_str_map[token_map[OOV_STR]] = OOV_STR
    char_map[OOV_STR] = len(char_map)
    char_int_str_map[char_map[OOV_STR]] = OOV_STR

    # load vocab if we have one
    if FLAGS.vocab != '':
        update_vocab = False
        with open(FLAGS.vocab, 'r') as f:
            for line in f.readlines():
                word = line.strip().split(" ")[0]
                if word not in token_map:
                    # print("adding word %s" % word)
                    token_map[word] = len(token_map)
                    token_int_str_map[token_map[word]] = word
    if FLAGS.update_vocab != '':
        with open(FLAGS.update_vocab, 'r') as f:
            for line in f.readlines():
                word = line.strip().split(" ")[0]
                if word not in token_map:
                    # print("adding word %s" % word)
                    token_map[word] = len(token_map)
                    token_int_str_map[token_map[word]] = word

    # load labels if given
    if FLAGS.labels != '':
        with open(FLAGS.labels, 'r') as f:
            for line in f.readlines():
                label, idx = line.strip().split("\t")
                label_map[label] = int(idx)
                label_int_str_map[label_map[label]] = label

    # load shapes if given
    if FLAGS.shapes != '':
        with open(FLAGS.shapes, 'r') as f:
            for line in f.readlines():
                shape, idx = line.strip().split("\t")
                shape_map[shape] = int(idx)

    # load chars if given
    if FLAGS.chars != '':
        update_chars = FLAGS.update_maps
        with open(FLAGS.chars, 'r') as f:
            for line in f.readlines():
                char, idx = line.strip().split("\t")
                char_map[char] = int(idx)
                char_int_str_map[char_map[char]] = char

    num_tokens = 0
    num_sentences = 0
    num_oov = 0
    num_docs = 0

    # TODO refactor this!!!
    if FLAGS.dataset == "conll2003":
        if not os.path.exists(FLAGS.out_dir):
            print("Output directory not found: %s" % FLAGS.out_dir)
        writer = tf.python_io.TFRecordWriter(FLAGS.out_dir + '/examples.proto')
        with open(FLAGS.in_file) as f:
            line_buf = []
            line = f.readline()
            line_idx = 1
            while line:
                line = line.strip()

                if FLAGS.documents:
                    if line.split(" ")[0] == DOC_MARKER:
                        if line_buf:
                            # reached the end of a document; process the lines
                            toks, oov, sent = make_example(writer, line_buf, label_map, token_map, shape_map, char_map, update_vocab, update_chars)
                            num_tokens += toks
                            num_oov += oov
                            num_sentences += sent
                            num_docs += 1
                            line_buf = []
                    else:
                        # print(line)
                        line_buf.append(line)
                        line_idx += 1

                else:
                    # if the line is not empty, add it to the buffer
                    if line:
                        line_buf.append(line)
                        line_idx += 1
                    # otherwise, if there's stuff in the buffer, process it
                    elif line_buf:
                        # reached the end of a sentence; process the line
                        toks, oov, sent = make_example(writer, line_buf, label_map, token_map, shape_map, char_map, update_vocab, update_chars)
                        num_tokens += toks
                        num_oov += oov
                        num_sentences += sent
                        line_buf = []
                # print("reading line %d" % line_idx)
                line = f.readline()
            if line_buf:
                make_example(writer, line_buf, label_map, token_map, shape_map, char_map, update_vocab, update_chars)
        writer.close()

        # export the string->int maps to file
        for f_str, id_map in [('label', label_map), ('token', token_map), ('shape', shape_map), ('char', char_map)]:
            with open(FLAGS.out_dir + '/' + f_str + '.txt', 'w') as f:
                [f.write(s + '\t' + str(i) + '\n') for (s, i) in id_map.items()]

        # export data sizes to file
        with open(FLAGS.out_dir + "/sizes.txt", 'w') as f:
            print(num_sentences, file=f)
            print(num_tokens, file=f)
            print(num_docs, file=f)

    else:
        if not os.path.exists(FLAGS.out_dir):
            print("Output directory not found: %s" % FLAGS.out_dir)
        if not os.path.exists(FLAGS.out_dir + "/protos"):
            os.mkdir(FLAGS.out_dir + "/protos")             
        for data_type in onto_genre:
            num_tokens = 0
            num_sentences = 0
            num_oov = 0
            num_docs = 0
            writer = tf.python_io.TFRecordWriter('%s/protos/%s_examples.proto' % (FLAGS.out_dir, data_type))
            file_list = [y for x in os.walk(FLAGS.in_file) for y in glob(os.path.join(x[0], '*_gold_conll'))\
                         if "/"+data_type+"/" in y and "/english/" in y]
            
            for f_path in file_list:

                with open(f_path) as f:
                    line_buf = []
                    line = f.readline()
                    line_idx = 1
                    while line:
                        line = line.strip()
    
                        if FLAGS.documents:
                            if line.startswith("#"):
                                if line_buf:
                                    # reached the end of a document; process the lines
                                    toks, oov, sent = make_example(writer, line_buf, label_map, token_map, shape_map,
                                                                   char_map, update_vocab, update_chars)
                                    num_tokens += toks
                                    num_oov += oov
                                    num_sentences += sent
                                    num_docs += 1
                                    line_buf = []
                            else:
                                # print(line)
                                if line_buf or (not line_buf and line):
                                    line_buf.append(line)
                                    line_idx += 1
                        else:
                            # if the line is not empty, add it to the buffer
                            if line:
                                if not line.startswith("#"):
                                    line_buf.append(line)
                                    line_idx += 1
                            # otherwise, if there's stuff in the buffer, process it
                            elif line_buf:
                                # reached the end of a sentence; process the line
                                toks, oov, sent = make_example(writer, line_buf, label_map, token_map, shape_map, char_map,
                                                               update_vocab, update_chars)
                                num_tokens += toks
                                num_oov += oov
                                num_sentences += sent
                                line_buf = []
                        # print("reading line %d" % line_idx)
                        line = f.readline()
                    if line_buf:
                        make_example(writer, line_buf, label_map, token_map, shape_map, char_map, update_vocab,
                                     update_chars)
                    # print("Processed %d sentences" % num_sentences)
            writer.close()

            # export the string->int maps to file
            for f_str, id_map in [('label', label_map), ('token', token_map), ('shape', shape_map), ('char', char_map)]:
                with open("%s/%s.txt" % (FLAGS.out_dir, f_str), 'w') as f:
                    [f.write(s + '\t' + str(i) + '\n') for (s, i) in id_map.items()]
    
            # export data sizes to file
            with open("%s/%s_sizes.txt" % (FLAGS.out_dir, data_type), 'w') as f:
                print(num_sentences, file=f)
                print(num_tokens, file=f)
                print(num_docs, file=f)
            
    print("Embeddings coverage: %2.2f%%" % ((1-(num_oov/num_tokens)) * 100))


def main(argv):
    if FLAGS.out_dir == '':
        print('Must supply out_dir')
        sys.exit(1)
    tsv_to_examples()


if __name__ == '__main__':
    random.seed(1234)
    np.random.seed(1234)
    tf.set_random_seed(1234)
    tf.app.run()
