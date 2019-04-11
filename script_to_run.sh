#!/bin/bash

echo 'RUN BEGINS'

cat ../dilated-cnn-ner/data/phenotype_enhanced/HPO_training_abstract_CoNLL.txt ../dilated-cnn-ner/data/phenotype_enhanced/hyperparam_m2c_new_labels_-0.108469535871.txt > ../dilated-cnn-ner/data/phenotype_enhanced/phenotype_enhanced_training_abstract_CoNLL.txt

./bin/preprocess.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/train-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/eval-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf test models/bilstm-viterbi_phenotype_enhanced_one_rnd_/.tf --print_preds data/phenotype_enhanced/annotations.txt

echo 'RUN BEGINS'

cat ../dilated-cnn-ner/data/phenotype_enhanced/HPO_training_abstract_CoNLL.txt ../dilated-cnn-ner/data/phenotype_enhanced/hyperparam_m2c_new_labels_-0.108469535871.txt > phenotype_enhanced_training_abstract_CoNLL.txt

./bin/preprocess.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/train-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/eval-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf test models/bilstm-viterbi_phenotype_enhanced_one_rnd_/.tf --print_preds data/phenotype_enhanced/annotations.txt

echo 'RUN BEGINS'

cat ../dilated-cnn-ner/data/phenotype_enhanced/HPO_training_abstract_CoNLL.txt ../dilated-cnn-ner/data/phenotype_enhanced/hyperparam_m2c_new_labels_0.392028417503.txt > phenotype_enhanced_training_abstract_CoNLL.txt

./bin/preprocess.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/train-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/eval-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf test models/bilstm-viterbi_phenotype_enhanced_one_rnd_/.tf --print_preds data/phenotype_enhanced/annotations.txt

echo 'RUN BEGINS'

cat ../dilated-cnn-ner/data/phenotype_enhanced/HPO_training_abstract_CoNLL.txt ../dilated-cnn-ner/data/phenotype_enhanced/hyperparam_m2c_new_labels_-0.608967489245.txt > phenotype_enhanced_training_abstract_CoNLL.txt

./bin/preprocess.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/train-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/eval-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf test models/bilstm-viterbi_phenotype_enhanced_one_rnd_/.tf --print_preds data/phenotype_enhanced/annotations.txt

echo 'RUN BEGINS'

cat ../dilated-cnn-ner/data/phenotype_enhanced/HPO_training_abstract_CoNLL.txt ../dilated-cnn-ner/data/phenotype_enhanced/hyperparam_m2c_new_labels_0.892526370877.txt > phenotype_enhanced_training_abstract_CoNLL.txt

./bin/preprocess.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/train-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/eval-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf test models/bilstm-viterbi_phenotype_enhanced_one_rnd_/.tf --print_preds data/phenotype_enhanced/annotations.txt

echo 'RUN BEGINS'


cat ../dilated-cnn-ner/data/phenotype_enhanced/HPO_training_abstract_CoNLL.txt ../dilated-cnn-ner/data/phenotype_enhanced/hyperparam_m2c_new_labels_-1.10946544262.txt > phenotype_enhanced_training_abstract_CoNLL.txt

./bin/preprocess.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/train-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/eval-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf test models/bilstm-viterbi_phenotype_enhanced_one_rnd_/.tf --print_preds data/phenotype_enhanced/annotations.txt

echo 'RUN BEGINS'

cat ../dilated-cnn-ner/data/phenotype_enhanced/HPO_training_abstract_CoNLL.txt ../dilated-cnn-ner/data/phenotype_enhanced/hyperparam_m2c_new_labels_-1.60996339599.txt > phenotype_enhanced_training_abstract_CoNLL.txt

./bin/preprocess.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/train-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/eval-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf test models/bilstm-viterbi_phenotype_enhanced_one_rnd_/.tf --print_preds data/phenotype_enhanced/annotations.txt