#!/bin/bash

echo 'RUN BEGINS 0.1'

cat ../dilated-cnn-ner/data/phenotype_enhanced/HPO_training_abstract_CoNLL_shuffled_short.txt ../dilated-cnn-ner/data/phenotype_enhanced/ready_dataset_threshold_0.1.txt > ../dilated-cnn-ner/data/phenotype_enhanced/phenotype_enhanced_training_abstract_CoNLL.txt

./bin/preprocess.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/train-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/eval-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf test models/bilstm-viterbi_phenotype_enhanced_one_rnd_/.tf --print_preds data/phenotype_enhanced/annotations_0.1.txt

echo 'RUN BEGINS 0.2'

cat ../dilated-cnn-ner/data/phenotype_enhanced/HPO_training_abstract_CoNLL_shuffled_short.txt ../dilated-cnn-ner/data/phenotype_enhanced/ready_dataset_threshold_0.2.txt > phenotype_enhanced_training_abstract_CoNLL.txt

./bin/preprocess.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/train-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/eval-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf test models/bilstm-viterbi_phenotype_enhanced_one_rnd_/.tf --print_preds data/phenotype_enhanced/annotations_0.2.txt

echo 'RUN BEGINS 0.3'

cat ../dilated-cnn-ner/data/phenotype_enhanced/HPO_training_abstract_CoNLL_shuffled_short.txt ../dilated-cnn-ner/data/phenotype_enhanced/ready_dataset_threshold_0.3.txt > phenotype_enhanced_training_abstract_CoNLL.txt

./bin/preprocess.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/train-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/eval-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf test models/bilstm-viterbi_phenotype_enhanced_one_rnd_/.tf --print_preds data/phenotype_enhanced/annotations_0.3.txt

echo 'RUN BEGINS 0.4'

cat ../dilated-cnn-ner/data/phenotype_enhanced/HPO_training_abstract_CoNLL_shuffled_short.txt ../dilated-cnn-ner/data/phenotype_enhanced/ready_dataset_threshold_0.4.txt > phenotype_enhanced_training_abstract_CoNLL.txt

./bin/preprocess.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/train-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/eval-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf test models/bilstm-viterbi_phenotype_enhanced_one_rnd_/.tf --print_preds data/phenotype_enhanced/annotations_0.4.txt

echo 'RUN BEGINS 0.5'

cat ../dilated-cnn-ner/data/phenotype_enhanced/HPO_training_abstract_CoNLL_shuffled_short.txt ../dilated-cnn-ner/data/phenotype_enhanced/ready_dataset_threshold_0.5.txt > phenotype_enhanced_training_abstract_CoNLL.txt

./bin/preprocess.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/train-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/eval-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf test models/bilstm-viterbi_phenotype_enhanced_one_rnd_/.tf --print_preds data/phenotype_enhanced/annotations_0.5.txt

echo 'RUN BEGINS 0.6'


cat ../dilated-cnn-ner/data/phenotype_enhanced/HPO_training_abstract_CoNLL_shuffled_short.txt ../dilated-cnn-ner/data/phenotype_enhanced/ready_dataset_threshold_0.6.txt > phenotype_enhanced_training_abstract_CoNLL.txt

./bin/preprocess.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/train-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/eval-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf test models/bilstm-viterbi_phenotype_enhanced_one_rnd_/.tf --print_preds data/phenotype_enhanced/annotations_0.6.txt

echo 'RUN BEGINS 0.7'

cat ../dilated-cnn-ner/data/phenotype_enhanced/HPO_training_abstract_CoNLL_shuffled_short.txt ../dilated-cnn-ner/data/phenotype_enhanced/ready_dataset_threshold_0.7.txt > phenotype_enhanced_training_abstract_CoNLL.txt

./bin/preprocess.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/train-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/eval-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf test models/bilstm-viterbi_phenotype_enhanced_one_rnd_/.tf --print_preds data/phenotype_enhanced/annotations_0.7.txt

echo 'RUN BEGINS 0.8'

cat ../dilated-cnn-ner/data/phenotype_enhanced/HPO_training_abstract_CoNLL_shuffled_short.txt ../dilated-cnn-ner/data/phenotype_enhanced/ready_dataset_threshold_0.8.txt > phenotype_enhanced_training_abstract_CoNLL.txt

./bin/preprocess.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/train-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/eval-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf test models/bilstm-viterbi_phenotype_enhanced_one_rnd_/.tf --print_preds data/phenotype_enhanced/annotations_0.8.txt

echo 'RUN BEGINS 0.9'

cat ../dilated-cnn-ner/data/phenotype_enhanced/HPO_training_abstract_CoNLL_shuffled_short.txt ../dilated-cnn-ner/data/phenotype_enhanced/ready_dataset_threshold_0.9.txt > phenotype_enhanced_training_abstract_CoNLL.txt

./bin/preprocess.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/train-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/eval-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf test models/bilstm-viterbi_phenotype_enhanced_one_rnd_/.tf --print_preds data/phenotype_enhanced/annotations_0.9.txt