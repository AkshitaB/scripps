#!/bin/bash

export THRESHOLD=$1
export RUN=$2

$DILATED_CNN_NER_ROOT/bin/train-cnn.sh $DILATED_CNN_NER_ROOT/conf/bilstm-viterbi_multi_gold.conf
$DILATED_CNN_NER_ROOT/bin/eval-cnn.sh $DILATED_CNN_NER_ROOT/conf/bilstm-viterbi_multi_gold.conf test
