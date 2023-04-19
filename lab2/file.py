import numpy as np


def create_interpolation_hermite_polynomial(X, Y, Y_):
    n = len(X)
    d = np.zeros((n, n))
    d[:, 0] = 1
    for j in range(1, n):
        for i in range(j, n):
            if X[i] == X[i-j]:
                d[i, j] = j * d[i-1, j-1]
            else:
                d[i, j] = (d[i, j-1] - d[i-1, j-1]) / (X[i] - X[i-j])
    def hermite(x):
        H = np.zeros(n)
        for i in range(n):
            p = 1
            for j in range(i):
                p *= (x - X[j])
            H[i] = (1 - 2*p*d[i, i-1]) * (1 - 2*p*d[i, i]) * Y[i] + \
                   p * (1 - 2*(x - X[i])*d[i, i]) * Y_[i] + \
                   p * (x - X[i]) * (1 - 2*(x - X[i])*d[i, i-1]) * Y[i]
        return np.sum(H)
    return hermite