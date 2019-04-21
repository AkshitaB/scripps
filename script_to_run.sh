#!/bin/bash

# ===========================================================================================================================================
echo '==============================================EPOCH 1=================================================='
echo 'RUN BEGINS'

cd utils
echo "$PWD"
python new_labels.py ../graphical/theta_values.txt -0.108469535871 hyperparam_m2c_new_labels
cd ../../dilated-cnn-ner
echo "$PWD"
export DILATED_CNN_NER_ROOT=`pwd`
export DATA_DIR=data
cat data/phenotype_enhanced/HPO_training_abstract_CoNLL.txt ../scripps/dataset/M2C_new_labels/hyperparam_m2c_new_labels_-0.108469535871.txt > data/phenotype_enhanced/phenotype_enhanced_training_abstract_CoNLL.txt

./bin/preprocess.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/train-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/eval-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf test models/bilstm-viterbi_phenotype_enhanced_one_rnd_/.tf --print_preds data/phenotype_enhanced/annotations.txt
cd ../scripps

# ===========================================================================================================================================
echo 'RUN BEGINS'

cd utils
python new_labels.py ../graphical/theta_values.txt 0.392028417503 hyperparam_m2c_new_labels
cd ../../dilated-cnn-ner
echo "$PWD"
export DILATED_CNN_NER_ROOT=`pwd`
export DATA_DIR=data
cat data/phenotype_enhanced/HPO_training_abstract_CoNLL.txt ../scripps/dataset/M2C_new_labels/hyperparam_m2c_new_labels_0.392028417503.txt > ../dphenotype_enhanced/phenotype_enhanced_training_abstract_CoNLL.txt

./bin/preprocess.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/train-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/eval-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf test models/bilstm-viterbi_phenotype_enhanced_one_rnd_/.tf --print_preds data/phenotype_enhanced/annotations.txt
cd ../scripps
# ===========================================================================================================================================
echo 'RUN BEGINS'

cd utils
python new_labels.py ../graphical/theta_values.txt -0.608967489245 hyperparam_m2c_new_labels
cd ../../dilated-cnn-ner
echo "$PWD"
export DILATED_CNN_NER_ROOT=`pwd`
export DATA_DIR=data
cat data/phenotype_enhanced/HPO_training_abstract_CoNLL.txt ../scripps/dataset/M2C_new_labels/hyperparam_m2c_new_labels_-0.608967489245.txt > data/phenotype_enhanced/phenotype_enhanced_training_abstract_CoNLL.txt

./bin/preprocess.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/train-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/eval-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf test models/bilstm-viterbi_phenotype_enhanced_one_rnd_/.tf --print_preds data/phenotype_enhanced/annotations.txt
cd ../scripps
# ===========================================================================================================================================
echo 'RUN BEGINS'

cd utils
python new_labels.py ../graphical/theta_values.txt 0.892526370877 hyperparam_m2c_new_labels
cd ../../dilated-cnn-ner

echo "$PWD"
export DILATED_CNN_NER_ROOT=`pwd`
export DATA_DIR=data
cat data/phenotype_enhanced/HPO_training_abstract_CoNLL.txt ../scripps/dataset/M2C_new_labels/hyperparam_m2c_new_labels_0.892526370877.txt > ../dphenotype_enhanced/phenotype_enhanced_training_abstract_CoNLL.txt

./bin/preprocess.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/train-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/eval-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf test models/bilstm-viterbi_phenotype_enhanced_one_rnd_/.tf --print_preds data/phenotype_enhanced/annotations.txt
cd ../scripps
# ===========================================================================================================================================
echo 'RUN BEGINS'

cd utils
python new_labels.py ../graphical/theta_values.txt -1.10946544262 hyperparam_m2c_new_labels
cd ../../dilated-cnn-ner
echo "$PWD"
export DILATED_CNN_NER_ROOT=`pwd`
export DATA_DIR=data
cat data/phenotype_enhanced/HPO_training_abstract_CoNLL.txt ../scripps/dataset/M2C_new_labels/hyperparam_m2c_new_labels_-1.10946544262.txt > data/phenotype_enhanced/phenotype_enhanced_training_abstract_CoNLL.txt

./bin/preprocess.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/train-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/eval-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf test models/bilstm-viterbi_phenotype_enhanced_one_rnd_/.tf --print_preds data/phenotype_enhanced/annotations.txt
cd ../scripps
# ===========================================================================================================================================
echo 'RUN BEGINS'

cd utils
python new_labels.py ../graphical/theta_values.txt -1.60996339599 hyperparam_m2c_new_labels
cd ../../dilated-cnn-ner
echo "$PWD"
export DILATED_CNN_NER_ROOT=`pwd`
export DATA_DIR=data
cat data/phenotype_enhanced/HPO_training_abstract_CoNLL.txt ../scripps/dataset/M2C_new_labels/hyperparam_m2c_new_labels_-1.60996339599.txt > data/phenotype_enhanced/phenotype_enhanced_training_abstract_CoNLL.txt

./bin/preprocess.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/train-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/eval-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf test models/bilstm-viterbi_phenotype_enhanced_one_rnd_/.tf --print_preds data/phenotype_enhanced/annotations.txt
cd ../scripps

echo '==============================================EPOCH 2=================================================='
echo 'RUN BEGINS'

cd utils
python new_labels.py ../graphical/theta_values.txt -0.108469535871 hyperparam_m2c_new_labels
cd ../../dilated-cnn-ner
echo "$PWD"
export DILATED_CNN_NER_ROOT=`pwd`
export DATA_DIR=data
cat data/phenotype_enhanced/HPO_training_abstract_CoNLL.txt ../scripps/dataset/M2C_new_labels/hyperparam_m2c_new_labels_-0.108469535871.txt > data/phenotype_enhanced/phenotype_enhanced_training_abstract_CoNLL.txt

./bin/preprocess.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/train-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/eval-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf test models/bilstm-viterbi_phenotype_enhanced_one_rnd_/.tf --print_preds data/phenotype_enhanced/annotations.txt
cd ../scripps

# ===========================================================================================================================================
echo 'RUN BEGINS'

cd utils
python new_labels.py ../graphical/theta_values.txt 0.392028417503 hyperparam_m2c_new_labels
cd ../../dilated-cnn-ner
echo "$PWD"
export DILATED_CNN_NER_ROOT=`pwd`
export DATA_DIR=data
cat data/phenotype_enhanced/HPO_training_abstract_CoNLL.txt ../scripps/dataset/M2C_new_labels/hyperparam_m2c_new_labels_0.392028417503.txt > ../dphenotype_enhanced/phenotype_enhanced_training_abstract_CoNLL.txt

./bin/preprocess.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/train-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/eval-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf test models/bilstm-viterbi_phenotype_enhanced_one_rnd_/.tf --print_preds data/phenotype_enhanced/annotations.txt
cd ../scripps
# ===========================================================================================================================================
echo 'RUN BEGINS'

cd utils
python new_labels.py ../graphical/theta_values.txt -0.608967489245 hyperparam_m2c_new_labels
cd ../../dilated-cnn-ner
echo "$PWD"
export DILATED_CNN_NER_ROOT=`pwd`
export DATA_DIR=data
cat data/phenotype_enhanced/HPO_training_abstract_CoNLL.txt ../scripps/dataset/M2C_new_labels/hyperparam_m2c_new_labels_-0.608967489245.txt > data/phenotype_enhanced/phenotype_enhanced_training_abstract_CoNLL.txt

./bin/preprocess.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/train-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/eval-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf test models/bilstm-viterbi_phenotype_enhanced_one_rnd_/.tf --print_preds data/phenotype_enhanced/annotations.txt
cd ../scripps
# ===========================================================================================================================================
echo 'RUN BEGINS'

cd utils
python new_labels.py ../graphical/theta_values.txt 0.892526370877 hyperparam_m2c_new_labels
cd ../../dilated-cnn-ner
echo "$PWD"
export DILATED_CNN_NER_ROOT=`pwd`
export DATA_DIR=data
cat data/phenotype_enhanced/HPO_training_abstract_CoNLL.txt ../scripps/dataset/M2C_new_labels/hyperparam_m2c_new_labels_0.892526370877.txt > ../dphenotype_enhanced/phenotype_enhanced_training_abstract_CoNLL.txt

./bin/preprocess.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/train-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/eval-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf test models/bilstm-viterbi_phenotype_enhanced_one_rnd_/.tf --print_preds data/phenotype_enhanced/annotations.txt
cd ../scripps
# ===========================================================================================================================================
echo 'RUN BEGINS'

cd utils
python new_labels.py ../graphical/theta_values.txt -1.10946544262 hyperparam_m2c_new_labels
cd ../../dilated-cnn-ner
echo "$PWD"
export DILATED_CNN_NER_ROOT=`pwd`
export DATA_DIR=data
cat data/phenotype_enhanced/HPO_training_abstract_CoNLL.txt ../scripps/dataset/M2C_new_labels/hyperparam_m2c_new_labels_-1.10946544262.txt > data/phenotype_enhanced/phenotype_enhanced_training_abstract_CoNLL.txt

./bin/preprocess.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/train-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/eval-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf test models/bilstm-viterbi_phenotype_enhanced_one_rnd_/.tf --print_preds data/phenotype_enhanced/annotations.txt
cd ../scripps
# ===========================================================================================================================================
echo 'RUN BEGINS'

cd utils
python new_labels.py ../graphical/theta_values.txt -1.60996339599 hyperparam_m2c_new_labels
cd ../../dilated-cnn-ner
echo "$PWD"
export DILATED_CNN_NER_ROOT=`pwd`
export DATA_DIR=data
cat data/phenotype_enhanced/HPO_training_abstract_CoNLL.txt ../scripps/dataset/M2C_new_labels/hyperparam_m2c_new_labels_-1.60996339599.txt > data/phenotype_enhanced/phenotype_enhanced_training_abstract_CoNLL.txt

./bin/preprocess.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/train-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/eval-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf test models/bilstm-viterbi_phenotype_enhanced_one_rnd_/.tf --print_preds data/phenotype_enhanced/annotations.txt
cd ../scripps

echo '==============================================EPOCH 3=================================================='
echo 'RUN BEGINS'

cd utils
python new_labels.py ../graphical/theta_values.txt -0.108469535871 hyperparam_m2c_new_labels
cd ../../dilated-cnn-ner
echo "$PWD"
export DILATED_CNN_NER_ROOT=`pwd`
export DATA_DIR=data
cat data/phenotype_enhanced/HPO_training_abstract_CoNLL.txt ../scripps/dataset/M2C_new_labels/hyperparam_m2c_new_labels_-0.108469535871.txt > data/phenotype_enhanced/phenotype_enhanced_training_abstract_CoNLL.txt

./bin/preprocess.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/train-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/eval-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf test models/bilstm-viterbi_phenotype_enhanced_one_rnd_/.tf --print_preds data/phenotype_enhanced/annotations.txt
cd ../scripps

# ===========================================================================================================================================
echo 'RUN BEGINS'

cd utils
python new_labels.py ../graphical/theta_values.txt 0.392028417503 hyperparam_m2c_new_labels
cd ../../dilated-cnn-ner
echo "$PWD"
export DILATED_CNN_NER_ROOT=`pwd`
export DATA_DIR=data
cat data/phenotype_enhanced/HPO_training_abstract_CoNLL.txt ../scripps/dataset/M2C_new_labels/hyperparam_m2c_new_labels_0.392028417503.txt > ../dphenotype_enhanced/phenotype_enhanced_training_abstract_CoNLL.txt

./bin/preprocess.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/train-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/eval-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf test models/bilstm-viterbi_phenotype_enhanced_one_rnd_/.tf --print_preds data/phenotype_enhanced/annotations.txt
cd ../scripps
# ===========================================================================================================================================
echo 'RUN BEGINS'

cd utils
python new_labels.py ../graphical/theta_values.txt -0.608967489245 hyperparam_m2c_new_labels
cd ../../dilated-cnn-ner
echo "$PWD"
export DILATED_CNN_NER_ROOT=`pwd`
export DATA_DIR=data
cat data/phenotype_enhanced/HPO_training_abstract_CoNLL.txt ../scripps/dataset/M2C_new_labels/hyperparam_m2c_new_labels_-0.608967489245.txt > data/phenotype_enhanced/phenotype_enhanced_training_abstract_CoNLL.txt

./bin/preprocess.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/train-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/eval-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf test models/bilstm-viterbi_phenotype_enhanced_one_rnd_/.tf --print_preds data/phenotype_enhanced/annotations.txt
cd ../scripps
# ===========================================================================================================================================
echo 'RUN BEGINS'

cd utils
python new_labels.py ../graphical/theta_values.txt 0.892526370877 hyperparam_m2c_new_labels
cd ../../dilated-cnn-ner
echo "$PWD"
export DILATED_CNN_NER_ROOT=`pwd`
export DATA_DIR=data
cat data/phenotype_enhanced/HPO_training_abstract_CoNLL.txt ../scripps/dataset/M2C_new_labels/hyperparam_m2c_new_labels_0.892526370877.txt > ../dphenotype_enhanced/phenotype_enhanced_training_abstract_CoNLL.txt

./bin/preprocess.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/train-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/eval-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf test models/bilstm-viterbi_phenotype_enhanced_one_rnd_/.tf --print_preds data/phenotype_enhanced/annotations.txt
cd ../scripps
# ===========================================================================================================================================
echo 'RUN BEGINS'

cd utils
python new_labels.py ../graphical/theta_values.txt -1.10946544262 hyperparam_m2c_new_labels
cd ../../dilated-cnn-ner
echo "$PWD"
export DILATED_CNN_NER_ROOT=`pwd`
export DATA_DIR=data
cat data/phenotype_enhanced/HPO_training_abstract_CoNLL.txt ../scripps/dataset/M2C_new_labels/hyperparam_m2c_new_labels_-1.10946544262.txt > data/phenotype_enhanced/phenotype_enhanced_training_abstract_CoNLL.txt

./bin/preprocess.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/train-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/eval-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf test models/bilstm-viterbi_phenotype_enhanced_one_rnd_/.tf --print_preds data/phenotype_enhanced/annotations.txt
cd ../scripps
# ===========================================================================================================================================
echo 'RUN BEGINS'

cd utils
python new_labels.py ../graphical/theta_values.txt -1.60996339599 hyperparam_m2c_new_labels
cd ../../dilated-cnn-ner
echo "$PWD"
export DILATED_CNN_NER_ROOT=`pwd`
export DATA_DIR=data
cat data/phenotype_enhanced/HPO_training_abstract_CoNLL.txt ../scripps/dataset/M2C_new_labels/hyperparam_m2c_new_labels_-1.60996339599.txt > data/phenotype_enhanced/phenotype_enhanced_training_abstract_CoNLL.txt

./bin/preprocess.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/train-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/eval-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf test models/bilstm-viterbi_phenotype_enhanced_one_rnd_/.tf --print_preds data/phenotype_enhanced/annotations.txt
cd ../scripps

echo '==============================================EPOCH 4=================================================='
echo 'RUN BEGINS'

cd utils
python new_labels.py ../graphical/theta_values.txt -0.108469535871 hyperparam_m2c_new_labels
cd ../../dilated-cnn-ner
echo "$PWD"
export DILATED_CNN_NER_ROOT=`pwd`
export DATA_DIR=data
cat data/phenotype_enhanced/HPO_training_abstract_CoNLL.txt ../scripps/dataset/M2C_new_labels/hyperparam_m2c_new_labels_-0.108469535871.txt > data/phenotype_enhanced/phenotype_enhanced_training_abstract_CoNLL.txt

./bin/preprocess.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/train-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/eval-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf test models/bilstm-viterbi_phenotype_enhanced_one_rnd_/.tf --print_preds data/phenotype_enhanced/annotations.txt
cd ../scripps

# ===========================================================================================================================================
echo 'RUN BEGINS'

cd utils
python new_labels.py ../graphical/theta_values.txt 0.392028417503 hyperparam_m2c_new_labels
cd ../../dilated-cnn-ner
echo "$PWD"
export DILATED_CNN_NER_ROOT=`pwd`
export DATA_DIR=data
cat data/phenotype_enhanced/HPO_training_abstract_CoNLL.txt ../scripps/dataset/M2C_new_labels/hyperparam_m2c_new_labels_0.392028417503.txt > ../dphenotype_enhanced/phenotype_enhanced_training_abstract_CoNLL.txt

./bin/preprocess.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/train-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/eval-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf test models/bilstm-viterbi_phenotype_enhanced_one_rnd_/.tf --print_preds data/phenotype_enhanced/annotations.txt
cd ../scripps
# ===========================================================================================================================================
echo 'RUN BEGINS'

cd utils
python new_labels.py ../graphical/theta_values.txt -0.608967489245 hyperparam_m2c_new_labels
cd ../../dilated-cnn-ner
echo "$PWD"
export DILATED_CNN_NER_ROOT=`pwd`
export DATA_DIR=data
cat data/phenotype_enhanced/HPO_training_abstract_CoNLL.txt ../scripps/dataset/M2C_new_labels/hyperparam_m2c_new_labels_-0.608967489245.txt > data/phenotype_enhanced/phenotype_enhanced_training_abstract_CoNLL.txt

./bin/preprocess.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/train-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/eval-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf test models/bilstm-viterbi_phenotype_enhanced_one_rnd_/.tf --print_preds data/phenotype_enhanced/annotations.txt
cd ../scripps
# ===========================================================================================================================================
echo 'RUN BEGINS'

cd utils
python new_labels.py ../graphical/theta_values.txt 0.892526370877 hyperparam_m2c_new_labels
cd ../../dilated-cnn-ner
echo "$PWD"
export DILATED_CNN_NER_ROOT=`pwd`
export DATA_DIR=data
cat data/phenotype_enhanced/HPO_training_abstract_CoNLL.txt ../scripps/dataset/M2C_new_labels/hyperparam_m2c_new_labels_0.892526370877.txt > ../dphenotype_enhanced/phenotype_enhanced_training_abstract_CoNLL.txt

./bin/preprocess.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/train-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/eval-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf test models/bilstm-viterbi_phenotype_enhanced_one_rnd_/.tf --print_preds data/phenotype_enhanced/annotations.txt
cd ../scripps
# ===========================================================================================================================================
echo 'RUN BEGINS'

cd utils
python new_labels.py ../graphical/theta_values.txt -1.10946544262 hyperparam_m2c_new_labels
cd ../../dilated-cnn-ner
echo "$PWD"
export DILATED_CNN_NER_ROOT=`pwd`
export DATA_DIR=data
cat data/phenotype_enhanced/HPO_training_abstract_CoNLL.txt ../scripps/dataset/M2C_new_labels/hyperparam_m2c_new_labels_-1.10946544262.txt > data/phenotype_enhanced/phenotype_enhanced_training_abstract_CoNLL.txt

./bin/preprocess.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/train-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/eval-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf test models/bilstm-viterbi_phenotype_enhanced_one_rnd_/.tf --print_preds data/phenotype_enhanced/annotations.txt
cd ../scripps
# ===========================================================================================================================================
echo 'RUN BEGINS'

cd utils
python new_labels.py ../graphical/theta_values.txt -1.60996339599 hyperparam_m2c_new_labels
cd ../../dilated-cnn-ner
echo "$PWD"
export DILATED_CNN_NER_ROOT=`pwd`
export DATA_DIR=data
cat data/phenotype_enhanced/HPO_training_abstract_CoNLL.txt ../scripps/dataset/M2C_new_labels/hyperparam_m2c_new_labels_-1.60996339599.txt > data/phenotype_enhanced/phenotype_enhanced_training_abstract_CoNLL.txt

./bin/preprocess.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/train-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/eval-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf test models/bilstm-viterbi_phenotype_enhanced_one_rnd_/.tf --print_preds data/phenotype_enhanced/annotations.txt
cd ../scripps

echo '==============================================EPOCH 5=================================================='
echo 'RUN BEGINS'

cd utils
python new_labels.py ../graphical/theta_values.txt -0.108469535871 hyperparam_m2c_new_labels
cd ../../dilated-cnn-ner
echo "$PWD"
export DILATED_CNN_NER_ROOT=`pwd`
export DATA_DIR=data
cat data/phenotype_enhanced/HPO_training_abstract_CoNLL.txt ../scripps/dataset/M2C_new_labels/hyperparam_m2c_new_labels_-0.108469535871.txt > data/phenotype_enhanced/phenotype_enhanced_training_abstract_CoNLL.txt

./bin/preprocess.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/train-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/eval-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf test models/bilstm-viterbi_phenotype_enhanced_one_rnd_/.tf --print_preds data/phenotype_enhanced/annotations.txt
cd ../scripps

# ===========================================================================================================================================
echo 'RUN BEGINS'

cd utils
python new_labels.py ../graphical/theta_values.txt 0.392028417503 hyperparam_m2c_new_labels
cd ../../dilated-cnn-ner
echo "$PWD"
export DILATED_CNN_NER_ROOT=`pwd`
export DATA_DIR=data
cat data/phenotype_enhanced/HPO_training_abstract_CoNLL.txt ../scripps/dataset/M2C_new_labels/hyperparam_m2c_new_labels_0.392028417503.txt > ../dphenotype_enhanced/phenotype_enhanced_training_abstract_CoNLL.txt

./bin/preprocess.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/train-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/eval-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf test models/bilstm-viterbi_phenotype_enhanced_one_rnd_/.tf --print_preds data/phenotype_enhanced/annotations.txt
cd ../scripps
# ===========================================================================================================================================
echo 'RUN BEGINS'

cd utils
python new_labels.py ../graphical/theta_values.txt -0.608967489245 hyperparam_m2c_new_labels
cd ../../dilated-cnn-ner
echo "$PWD"
export DILATED_CNN_NER_ROOT=`pwd`
export DATA_DIR=data
cat data/phenotype_enhanced/HPO_training_abstract_CoNLL.txt ../scripps/dataset/M2C_new_labels/hyperparam_m2c_new_labels_-0.608967489245.txt > data/phenotype_enhanced/phenotype_enhanced_training_abstract_CoNLL.txt

./bin/preprocess.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/train-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/eval-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf test models/bilstm-viterbi_phenotype_enhanced_one_rnd_/.tf --print_preds data/phenotype_enhanced/annotations.txt
cd ../scripps
# ===========================================================================================================================================
echo 'RUN BEGINS'

cd utils
python new_labels.py ../graphical/theta_values.txt 0.892526370877 hyperparam_m2c_new_labels
cd ../../dilated-cnn-ner
echo "$PWD"
export DILATED_CNN_NER_ROOT=`pwd`
export DATA_DIR=data
cat data/phenotype_enhanced/HPO_training_abstract_CoNLL.txt ../scripps/dataset/M2C_new_labels/hyperparam_m2c_new_labels_0.892526370877.txt > ../dphenotype_enhanced/phenotype_enhanced_training_abstract_CoNLL.txt

./bin/preprocess.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/train-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/eval-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf test models/bilstm-viterbi_phenotype_enhanced_one_rnd_/.tf --print_preds data/phenotype_enhanced/annotations.txt
cd ../scripps
# ===========================================================================================================================================
echo 'RUN BEGINS'

cd utils
python new_labels.py ../graphical/theta_values.txt -1.10946544262 hyperparam_m2c_new_labels
cd ../../dilated-cnn-ner
echo "$PWD"
export DILATED_CNN_NER_ROOT=`pwd`
export DATA_DIR=data
cat data/phenotype_enhanced/HPO_training_abstract_CoNLL.txt ../scripps/dataset/M2C_new_labels/hyperparam_m2c_new_labels_-1.10946544262.txt > data/phenotype_enhanced/phenotype_enhanced_training_abstract_CoNLL.txt

./bin/preprocess.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/train-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/eval-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf test models/bilstm-viterbi_phenotype_enhanced_one_rnd_/.tf --print_preds data/phenotype_enhanced/annotations.txt
cd ../scripps
# ===========================================================================================================================================
echo 'RUN BEGINS'

cd utils
python new_labels.py ../graphical/theta_values.txt -1.60996339599 hyperparam_m2c_new_labels
cd ../../dilated-cnn-ner
echo "$PWD"
export DILATED_CNN_NER_ROOT=`pwd`
export DATA_DIR=data
cat data/phenotype_enhanced/HPO_training_abstract_CoNLL.txt ../scripps/dataset/M2C_new_labels/hyperparam_m2c_new_labels_-1.60996339599.txt > data/phenotype_enhanced/phenotype_enhanced_training_abstract_CoNLL.txt

./bin/preprocess.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/train-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf

./bin/eval-cnn.sh conf/phenotype_enhanced/bilstm-viterbi_multi_gold.conf test models/bilstm-viterbi_phenotype_enhanced_one_rnd_/.tf --print_preds data/phenotype_enhanced/annotations.txt
cd ../scripps