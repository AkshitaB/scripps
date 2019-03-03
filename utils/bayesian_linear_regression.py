'''
Created on Apr 17, 2016

@author: samke
'''

from __future__ import division
import numpy as np
#from scipy.stats import norm
import norm1d
import math
import matplotlib.pylab as plt
"""
Example starter code for Bayesian linear regression implementations.
"""

def linreg_mle(X,Y):
    # returns one vector of the inferred MLE weights.
    # X: matrix shape (N x J)
    # Y: vector length N
    
    N = X.shape[0]
    J = X.shape[1]
    assert N==len(Y)
    XT=X.transpose()
    XTX=np.dot(XT,X)
    pseudo_inv=np.dot(np.linalg.inv(XTX),XT)
    print "Compute pseudo inverse correctly: ",np.allclose(pseudo_inv,np.linalg.pinv(X))
    v_infer=np.dot(pseudo_inv,Y)
    return v_infer
    
    # TODO

def linreg_post(X,Y, priormean, priorvar_scalar, emissionvar_scalar):
    # returns (PosteriorMean, PosteriorCovar)
    # where PosteriorMean is a J-length vector
    # where PosteriorCovar is a (J x J) shaped matrix
    N = X.shape[0]
    J = X.shape[1]
    assert N==len(Y)
    V0_inv=np.eye(J)/priorvar_scalar
    XT=X.transpose()
    XTX=np.dot(XT,X)
    #create a bug
    #VN=2*(emissionvar_scalar)*np.linalg.inv((emissionvar_scalar)*V0_inv+XTX)
    VN=emissionvar_scalar*np.linalg.inv((emissionvar_scalar)*V0_inv+XTX)
    WN=np.dot(np.dot(VN,V0_inv),priormean)+np.dot(np.dot(VN,XT),Y)/emissionvar_scalar
    return WN,VN
    # TODO

# def eval_prob(w_sample,WN,VN):
#     J=WN.shape[0]
#     VN_inv=np.linalg.inv(VN)
#     d2mean=(w_sample-WN)
#     p=np.exp(-np.dot(np.dot(d2mean.transpose(),VN_inv),d2mean)/2)/( math.sqrt( np.linalg.det(VN)*(2*math.pi)**J ) )
#     return p

def cook_linreg(priormean, priorvar_scalar, emissionvar_scalar, Nsim):
    """Runs Nsim simulations and returns list length Nsim of results for each one.
    Each result might contain the posterior mean/covar calculation,
    and/or the marginal posterior CDF of the "true" weight variable you're
    interested in, etc.
    (obviously there are lots of alternative ways to structure this.)
    """
    
    X = np.array([ [1,1], [1,2], [1,3] ])
    N = X.shape[0]
    J = X.shape[1]
    assert J==len(priormean)
    
    testing_ind=[0,-1]
    result_arr=[]
    
    for i in range(Nsim):
        V0=np.eye(J)*priorvar_scalar
        w_sample=np.random.multivariate_normal(priormean.reshape((J)),V0)
        w_sample=w_sample.reshape((J,1))
        y_samples=np.dot(X,w_sample)+np.random.randn(N,1)*math.sqrt(emissionvar_scalar)
        WN,VN=linreg_post(X,y_samples, priormean, priorvar_scalar, emissionvar_scalar)
        good_prob_portion=[]
        for j in testing_ind:
            q=float(1-2*norm1d.normcdf(-abs(w_sample[j]-WN[j]),0,math.sqrt(VN[j,j])))
            good_prob_portion.append(q)
        result_arr.append([WN,VN,good_prob_portion,w_sample])
    
    CDF_1=[x[2][0] for x in result_arr]
    plt.hist(CDF_1)
    plt.figure()
    CDF_2=[x[2][1] for x in result_arr]
    plt.hist(CDF_2)
    plt.show()



if __name__ == '__main__':
    N=9
    J=6
    X = np.random.randn(N, J)
    X = np.hstack((X,np.ones((N,1))))
    w = np.random.randn(J+1, 1)
    Y = np.dot(X,w)
    w_infer=linreg_mle(X,Y)
    w_infer_lib=np.linalg.lstsq(X,Y)[0]
    print "Infer original vector correctly: ",np.allclose(w_infer,w_infer_lib)
    print "Infer original close to ground truth: ",np.allclose(w_infer,w)
    emissionvar_scalar=1
    priormean=np.zeros((J+1,1))
    priorvar_scalar_arr=[1000,100,10,1,0.1]
    for priorvar_scalar in priorvar_scalar_arr: 
        w_map,w_var=linreg_post(X,Y, priormean, priorvar_scalar, emissionvar_scalar)
        print "When the variance of prior is", priorvar_scalar, ", the 2-norm distance between MAP and MLE is",np.linalg.norm(w_infer-w_map)
        print np.linalg.norm(w_map)
    
    
    Nsim=10000
    J=2
    priormean=np.zeros((J,1))
    cook_linreg(priormean, priorvar_scalar, emissionvar_scalar, Nsim)
    