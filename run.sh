#!/bin/bash

module load python2/current
module load tensorflow/1.0.1

cd ../dilated-cnn-ner
echo "$PWD"
export DILATED_CNN_NER_ROOT=`pwd`
export DATA_DIR=data

thresholds=( -1.38029725729 -0.690625864818 -0.000954472342939 0.688716920132 1.37838831261 2.06805970508)

if [ "$2" != "--skip-preprocess" ]; then
    for threshold in "${thresholds[@]}"
    do
        export THRESHOLD=$threshold
        cat data/phenotype_enhanced/HPO_training_abstract_CoNLL.txt ../scripps/dataset/M2C_new_labels/glad_combined_m2c_new_labels_${threshold}.txt > data/phenotype_enhanced/phenotype_enhanced_training_abstract_CoNLL_${threshold}.txt
        srun --partition=titanx-short --gres=gpu:1 ./bin/preprocess.sh conf/bilstm-viterbi_multi_gold.conf    
    done
fi

run_id=$1
for threshold in "${thresholds[@]}"
do
    sbatch --job-name=glad_ideal_${run_id}_${threshold} --output=../scripps/logs/glad_ideal_${run_id}_${threshold}_%j.txt -e ../scripps/logs/glad_ideal_${run_id}_${threshold}_%j.err --partition=m40-short --gres=gpu:1 --mem=40G ../scripps/run_train_eval.sh $threshold $run_id
done

