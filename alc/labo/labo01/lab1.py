import numpy as np

def error(x, y):
    x = np.float32(x)

    return abs(x-y)

def error_relativo(x, y):
    x = np.float32(x)
    
    return abs(x-y)/abs(x)

def matricesIguales(A,B):
    if (A.shape[0] == B.shape[0] & A.shape[1] == B.shape[1]):
        for i in range(0, A.shape[0]):
            for j in range(0, A.shape[1],1):
                elemA = A[i][j]
                elemB = B[i][j]
                if (elemA != elemB):
                    if (error(elemA, elemB) > 0.1):
                        return False

        return True
        
    return False