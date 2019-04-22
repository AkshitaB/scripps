import os
import glob
import sys


HPO_TRAINING_FILE = 'data/phenotype_enhanced/HPO_training_abstract_one_CoNLL_shuffled_short.txt'
TARGET_TRAINING_FILE = 'data/phenotype_enhanced/phenotype_enhanced_training_abstract_CoNLL.txt'

def cat_files(new_labels_file):
	return '\ncat {} {} > {}'.format(HPO_TRAINING_FILE, new_labels_file, TARGET_TRAINING_FILE)

def ner_runs():
	runs = '\n'
	runs += '\n./bin/preprocess.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf'
	runs += '\n./bin/train-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf'
	runs += '\n./bin/eval-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf test models/bilstm-viterbi_phenotype_enhanced_one_rnd_/.tf --print_preds data/phenotype_enhanced/annotations.txt'
	return runs

def generate_script(folder):
	content = '#!/bin/bash'
	for file in glob.glob(folder+'/*'):
		content += '\necho \'RUN BEGINS\''
		content += '\necho {}'.format(file)
		content += cat_files(file)
		content += ner_runs()
		content += '\n\n\n\n\n'
	return content

if __name__ == '__main__':
	print(generate_script(sys.argv[1]))
