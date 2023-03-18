import math
import numpy as np
import matplotlib.pyplot as plt

def f1(x):
    return math.pow(x,8) - 8*math.pow(x,7) + 28*math.pow(x,6) - 56*math.pow(x,5) + 70*math.pow(x,4) - 56*math.pow(x,3) + 28*math.pow(x,2) -8*x + 1

def f2(x):
    return (((((((x - 8)* x + 28) * x - 56) * x + 70) * x - 56) * x + 28) * x - 8)* x + 1

def f3(x):
    return math.pow((x - 1),8)

def f4(x):
    return np.exp((8 * np.log(abs(x-1))))

if __name__ == "__main__":
    floatArray = np.single(np.arange(0.99, 1.01, 0.0002))
    doubleArray = np.double(np.arange(0.99, 1.01, 0.0002))
    longDoubleArray = np.longdouble(np.arange(0.99, 1.01, 0.0002))
    Arrays = [floatArray, doubleArray, longDoubleArray]

    # F1 = [[f1(x) for x in arr] for arr in Arrays]
    F1 = [[f1(Arrays[0][i]), f1(Arrays[1][i]), f1(Arrays[2][i])] for i in range(101)]
    F2 = [[f2(Arrays[0][i]), f2(Arrays[1][i]), f2(Arrays[2][i])] for i in range(101)]
    F3 = [[f3(Arrays[0][i]), f3(Arrays[1][i]), f3(Arrays[2][i])] for i in range(101)]
    F4 = [[f4(Arrays[0][i]), f4(Arrays[1][i]), f4(Arrays[2][i])] for i in range(101)]    
    # F2 = [[f2(x) for x in arr] for arr in Arrays]
    # F3 = [[f3(x) for x in arr] for arr in Arrays]
    # F4 = [[f4(x) for x in arr] for arr in Arrays]

    for i,arr in enumerate(F3):
        print(i, end=" | ")
        for e in arr:
            if e == 0.0:
                print(f"{e}                 ", end="\t")
            else:
                print(f"{e}", end="\t")
        print("")








    