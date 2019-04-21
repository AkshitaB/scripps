#!/usr/bin/env python
# coding: utf-8

# ### README
# This script is used to convert the true labels obtained via GLAD back to a format that can be readable by dilated cnn ner. The only hyperparameter is the threshold value which needs to be set each time. I will change this notebook to a script so I can directly run it on gypsum to make new datsets with different hyperparameters.

# In[14]:


import sys


# In[16]:


threshold = float(sys.argv[1]) # any P above this will be set to 1
# threshold = 0.1
labels = ['O', 'I-Phenotype']


# In[17]:


data_file = 'dataset/Mark2Cure_citizen_phenotype/M2C1-Disease_Phen_Preliminary_Run_1st_pass.txt' # don't care about the annotator


# In[18]:


label_file = 'Results/Results for word_idx/label_word_idx_independant.csv'


# In[19]:


corpus = ''
with open(data_file) as f:
    corpus = f.read().split('\n')


# In[20]:


text = '' # the output of this script


# In[21]:


true_labels = ''
with open(label_file) as f:
    true_labels = f.read().split('\n')

# true_labels = true_labels[1:] #skip header


# In[28]:


# true_labels[0]


# In[23]:


vocab = {}
for label in true_labels:
    label = label.split('\t')
    try:
        vocab[label[0]] = float(label[2])
    except:
        pass


# In[26]:


threshold = 0.1
for i, line in enumerate(corpus):
    try:
        word = line.split()[0]
        label = labels[vocab[word.lower()+'_{}'.format(i)] > threshold]
        if i != len(corpus) - 1:
            text = text + '{} {} {} {}\n'.format(word, '?', '?', label)
        else:
            text = text + '{} {} {} {}'.format(word, '?', '?', label)
    except:
        pass


# In[27]:


with open('ready_dataset.txt', 'w') as f:
    f.write(text)

