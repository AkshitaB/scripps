# -*- encoding: utf-8 -*-
"""
1d Normal functions:
  - sample from truncated normal
  - CDF and inverse CDF for 1d normal

2016-04-11: I (brendan) put this together because the scipy.stats versions are
SLOW which is really bad for Gibbs sampling.

CHECK: yes they give the same answer.

In [180]: scipy.stats.norm(1,2).cdf(0)
Out[180]: 0.30853753872598688

In [181]: norm1d.normcdf(0,1,2)
Out[181]: 0.3085375372760062

TIMING: omg!!!  one millisecond is way too slow for this.

In [184]: timeit scipy.stats.norm(1,2).cdf(0)
1000 loops, best of 3: 1.36 ms per loop

In [185]: timeit norm1d.cdf(0,1,2)
100000 loops, best of 3: 2.03 µs per loop

This is >500 times faster.  scipy sucks, once again
note that the gaussian inverse CDF is generally considered to be slow; that's
the 2 microseconds there.

CDF and invCDF implementations from
http://www.johndcook.com/blog/python_phi_inverse/
http://www.johndcook.com/blog/python_phi/

and those are probably slow compared to C versions!
todo: should switch to math.erf() where possible which will be faster.
see examples on
http://stackoverflow.com/questions/809362/how-to-calculate-cumulative-normal-distribution-in-python
"""
from __future__ import division
import math
import numpy as np

def truncnormal(mean, sd, L,R):
    """
    sample from truncated normal, trunctated to range [L,R]
    NOTE this takes STD DEV (**not** variance!)
    use L=0, R=100 to pretty-good approximate [0,+inf)
    pg21 of https://www2.stat.duke.edu/courses/Fall03/sta216/lecture10.pdf
    """
    assert R >= L
    L,R = phi((L-mean)/sd), phi((R-mean)/sd)
    r = np.random.random() * (R-L) + L
    return mean+sd*normal_CDF_inverse(r)
 
def normcdf(x, mean=0.0, sd=1.0):
    return phi( (x-mean)/sd )
 
def phi(x):
    """CDF for N(0,1)"""
    # constants
    a1 =  0.254829592
    a2 = -0.284496736
    a3 =  1.421413741
    a4 = -1.453152027
    a5 =  1.061405429
    p  =  0.3275911

    # Save the sign of x
    sign = 1
    if x < 0:
        sign = -1
    x = abs(x)/math.sqrt(2.0)

    # A&S formula 7.1.26
    t = 1.0/(1.0 + p*x)
    y = 1.0 - (((((a5*t + a4)*t) + a3)*t + a2)*t + a1)*t*math.exp(-x*x)

    return 0.5*(1.0 + sign*y)
 
def rational_approximation(t):
    # Abramowitz and Stegun formula 26.2.23.
    # The absolute value of the error should be less than 4.5 e-4.
    c = [2.515517, 0.802853, 0.010328]
    d = [1.432788, 0.189269, 0.001308]
    numerator = (c[2]*t + c[1])*t + c[0]
    denominator = ((d[2]*t + d[1])*t + d[0])*t + 1.0
    return t - numerator / denominator
 
 
def normal_CDF_inverse(p):
    assert p > 0.0 and p < 1
 
    if p < 0.5:
        # F^-1(p) = - G^-1(p)
        return -rational_approximation( math.sqrt(-2.0*math.log(p)) )
    else:
        # F^-1(p) = G^-1(1-p)
        return rational_approximation( math.sqrt(-2.0*math.log(1.0-p)) )
 
def normal_CDF_inverse_demo():
 
    print "\nShow that the NormalCDFInverse function is accurate at"
    print "0.05, 0.15, 0.25, ..., 0.95 and at a few extreme values.\n\n"
 
    p = [
        0.0000001,
        0.00001,
        0.001,
        0.05,
        0.15,
        0.25,
        0.35,
        0.45,
        0.55,
        0.65,
        0.75,
        0.85,
        0.95,
        0.999,
        0.99999,
        0.9999999
    ]
 
    # Exact values computed by Mathematica.
    exact = [
        -5.199337582187471,
        -4.264890793922602,
        -3.090232306167813,
        -1.6448536269514729,
        -1.0364333894937896,
        -0.6744897501960817,
        -0.38532046640756773,
        -0.12566134685507402,
         0.12566134685507402,
         0.38532046640756773,
         0.6744897501960817,
         1.0364333894937896,
         1.6448536269514729,
         3.090232306167813,
         4.264890793922602,
         5.199337582187471
    ]
 
    maxerror = 0.0
    num_values = len(p)
    print "p, exact CDF inverse, computed CDF inverse, diff\n\n";
     
    for i in range(num_values):
        computed = normal_CDF_inverse(p[i])
        error = exact[i] - computed
        print p[i], ",", exact[i], ",", computed, ",", error
        if (abs(error) > maxerror):
            maxerror = abs(error)
 
    print "\nMaximum error:" , maxerror , "\n"
 
if __name__ == "__main__":
    demo()
