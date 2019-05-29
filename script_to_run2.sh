#!/bin/bash

# ===========================================================================================================================================
echo 'RUN BEGINS: Threshold=-1.38029725729'

cd ../dilated-cnn-ner-2
echo "$PWD"
export DILATED_CNN_NER_ROOT=`pwd`
export DATA_DIR=data
cat data/phenotype_enhanced/HPO_training_abstract_CoNLL.txt ../scripps/dataset/M2C_new_labels/glad_combined_m2c_new_labels_-1.38029725729.txt > data/phenotype_enhanced/phenotype_enhanced_training_abstract_CoNLL.txt

./bin/preprocess.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/train-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/eval-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf test models/bilstm-viterbi_phenotype_enhanced_one_rnd_/.tf --print_preds data/phenotype_enhanced/annotations.txt
cd ../scripps

# ===========================================================================================================================================
echo 'RUN BEGINS: Threshold=-0.690625864818'

cd ../dilated-cnn-ner-2
echo "$PWD"
export DILATED_CNN_NER_ROOT=`pwd`
export DATA_DIR=data
cat data/phenotype_enhanced/HPO_training_abstract_CoNLL.txt ../scripps/dataset/M2C_new_labels/glad_combined_m2c_new_labels_-0.690625864818.txt > ../dphenotype_enhanced/phenotype_enhanced_training_abstract_CoNLL.txt

./bin/preprocess.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/train-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/eval-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf test models/bilstm-viterbi_phenotype_enhanced_one_rnd_/.tf --print_preds data/phenotype_enhanced/annotations.txt
cd ../scripps
# ===========================================================================================================================================
echo 'RUN BEGINS: Threshold=-0.000954472342939'

cd ../dilated-cnn-ner-2
echo "$PWD"
export DILATED_CNN_NER_ROOT=`pwd`
export DATA_DIR=data
cat data/phenotype_enhanced/HPO_training_abstract_CoNLL.txt ../scripps/dataset/M2C_new_labels/glad_combined_m2c_new_labels_-0.000954472342939.txt > data/phenotype_enhanced/phenotype_enhanced_training_abstract_CoNLL.txt

./bin/preprocess.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/train-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/eval-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf test models/bilstm-viterbi_phenotype_enhanced_one_rnd_/.tf --print_preds data/phenotype_enhanced/annotations.txt
cd ../scripps
# ===========================================================================================================================================
echo 'RUN BEGINS: Threshold=0.688716920132'

cd ../dilated-cnn-ner-2

echo "$PWD"
export DILATED_CNN_NER_ROOT=`pwd`
export DATA_DIR=data
cat data/phenotype_enhanced/HPO_training_abstract_CoNLL.txt ../scripps/dataset/M2C_new_labels/glad_combined_m2c_new_labels_0.688716920132.txt > data/phenotype_enhanced/phenotype_enhanced_training_abstract_CoNLL.txt

./bin/preprocess.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/train-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/eval-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf test models/bilstm-viterbi_phenotype_enhanced_one_rnd_/.tf --print_preds data/phenotype_enhanced/annotations.txt
cd ../scripps
# ===========================================================================================================================================
echo 'RUN BEGINS: Threshold=1.37838831261'

cd ../dilated-cnn-ner-2
echo "$PWD"
export DILATED_CNN_NER_ROOT=`pwd`
export DATA_DIR=data
cat data/phenotype_enhanced/HPO_training_abstract_CoNLL.txt ../scripps/dataset/M2C_new_labels/glad_combined_m2c_new_labels_1.37838831261.txt > data/phenotype_enhanced/phenotype_enhanced_training_abstract_CoNLL.txt

./bin/preprocess.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/train-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/eval-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf test models/bilstm-viterbi_phenotype_enhanced_one_rnd_/.tf --print_preds data/phenotype_enhanced/annotations.txt
cd ../scripps
# ===========================================================================================================================================
echo 'RUN BEGINS: Threshold=2.06805970508'

cd ../dilated-cnn-ner-2
echo "$PWD"
export DILATED_CNN_NER_ROOT=`pwd`
export DATA_DIR=data
cat data/phenotype_enhanced/HPO_training_abstract_CoNLL.txt ../scripps/dataset/M2C_new_labels/glad_combined_m2c_new_labels_2.06805970508.txt > data/phenotype_enhanced/phenotype_enhanced_training_abstract_CoNLL.txt

./bin/preprocess.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/train-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/eval-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf test models/bilstm-viterbi_phenotype_enhanced_one_rnd_/.tf --print_preds data/phenotype_enhanced/annotations.txt
cd ../scripps
