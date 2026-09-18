import sys
from pathlib import Path

# Agrega la carpeta 'labo' (un nivel arriba del archivo actual)
sys.path.append(str(Path(__file__).resolve().parent.parent))

from alc import *
import numpy as np

def producto_punto(v, w):
    
    if (v.shape != w.shape):
        return None
    
    n = v.shape[1]
    
    res = 0
    
    for i in range (0,n,1):
        res = v[i]*w[i]
    
    return res

def proyeccion(v, w):
    res = (traspuesta(v)@w/traspuesta(v)@v) * v
    
def gram_schmidt(A):
    
    if (not esCuadrada(A)):
        return None, None
    
    n = A.shape[0]
    
    Q = np.zeros((n,n))
    
    R = np.zeros((n,n))
    
    Q[0] = normaliza(A[0], 2)
    
    R[0, 0] = norma(A[0],2)
    
    for j in range (2, n, 1):
        q_j_temp = A[j]
        
        for k in range (0, j-1, 1):
            R[k, j] = traspuesta(Q[k])@ q_j_temp
            
            q_j_temp = q_j_temp - R[k, j]@Q[k]
        
        R[j, j] =  norma(q_j_temp,2)
        
        Q[j] = q_j_temp / R[j,j]
    
    return traspuesta(Q), R
    
    