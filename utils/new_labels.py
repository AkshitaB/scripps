import os
import sys
import pandas as pd

import read_datasets

CF = read_datasets.get_configuration()

def get_new_labels(pos_annos, theta_thresh):
    new_labels = pd.DataFrame()
    new_labels = pd.concat([new_labels, pos_annos['Token']])
    new_labels['col1'] = '?'
    new_labels['col2'] = '?'
    new_labels['Label'] = 'O'
    new_labels.loc[(pos_annos['theta'] < theta_thresh), 'Label'] = 'I-phenotype'
    return new_labels

def save_new_labels(pos_annos, theta_thresh):
    new_labels = get_new_labels(pos_annos, theta_thresh)
    new_file = os.path.join(read_datasets.get_dataset_folder(), CF.get('m2c_new_labels', 'path'), 'm2c_new_labels_{}.txt'.format(theta_thresh))
    new_labels.to_csv(new_file, sep=' ', index=False, header=False)
    new_labels[new_labels['Label'] == 'I-phenotype'].count()


if __name__ == '__main__':
    theta_vals = sys.argv[1]
    theta_thresh = sys.argv[2]
    pos_annos = pd.read_csv(theta_vals)
    save_new_labels(pos_annos, float(theta_thresh))
