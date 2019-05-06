import os
import configparser

import pandas as pd

CONFIGURATIONS = '../configurations'
DATASET = '../dataset'

def get_configuration():
    config = configparser.ConfigParser()
    config.read(os.path.join(CONFIGURATIONS, 'data.config'))
    return config


def __load_path(path, splitter=' '):
    with open(path) as file_handle:
        contents = file_handle.read()
        lines = contents.split('\n')
        annos = []
        for line in lines:
            if line:
                annos.append(line.split(splitter))
        data = pd.DataFrame(annos)
    return data

def __get_path(dataset, mode):
    CF = get_configuration()
    assert dataset in ['disease', 'phenotype', 'm2c', 'm2c_citizen_disease', \
                       'm2c_citizen_phenotype', 'm2c_expert_disease', 'm2c_expert_phenotype']
    path = os.path.join(CF.get(dataset, 'path'), CF.get(dataset, mode))
    return os.path.join(DATASET, path)

def load_dataset(dataset='disease', mode='train'):
    data = __load_path(__get_path(dataset, mode))
    #data = pd.read_csv(os.path.join(DATASET, path), sep=' ', header=None) #misses some rows for some reason.
    return data

def load_glad_results(dataset='disease'):
    CF = get_configuration()
    path = os.path.join(CF.get('glad_results', 'path'), CF.get('glad_results', dataset))
    path = os.path.join(DATASET, path)
    data = __load_path(path, '\t')
    return data

def get_dataset_folder():
    return DATASET

def get_statistics(data, true_label='I-Disease'):
    num_train = len(data)
    num_true = len(data.loc[data[3] == true_label])
    perc = (float(num_true)/float(num_train)) * 100
    #print 'Number of training samples: {}'.format(num_train)
    print 'Percent of {}: {}%'.format(true_label, perc)
