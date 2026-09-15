import sys
from pathlib import Path

# Agrega la carpeta 'labo' (un nivel arriba del archivo actual)
sys.path.append(str(Path(__file__).resolve().parent.parent))

from alc import *

from elim_gaussiana import elim_gaussiana
import numpy as np

def calculaLU(A):
    L, U, cantOps = elim_gaussiana(A) # type: ignore
    return L,U, cantOps

def res_tri(L, b, inferior=True):
    
    n = L.shape[0]
    x = np.zeros(n, dtype=float)
    
    if (inferior):
        x[0] = b[0]/L[0, 0]
        for i in range(n):
            suma = 0.0
            for j in range(i):
                suma += L[i, j] * x[j]
            x[i] = (b[i] - suma) / L[i, i]
    else:
        x[n-1] = b[n-1]/L[n-1, n-1]
        for i in range(n - 1, -1, -1):
            suma = 0.0
            for j in range(i + 1, n):
                suma += L[i, j] * x[j]
            x[i] = (b[i] - suma) / L[i, i]
        
    
    return x
    
def inversa(A):
    
    if A is None or not isinstance(A, np.ndarray) or A.ndim != 2:
        return None
    
    m, n = A.shape
    if m != n:
        return None
    
    L, U, cantOps = calculaLU(A)
    if L is None or U is None:
        return None
    
    if np.any(np.isclose(np.diag(U), 0.0)):
        return None
    
    inv = np.zeros((n, n), dtype=float)
    e = np.zeros(n, dtype=float)
    
    for j in range (0,n,1):
        e_j = e.copy()
        e_j[j] = 1.0
        
        y_j = res_tri(L, e_j)
        
        x_j = res_tri(U, y_j, inferior=False)
        
        inv[:, j] = x_j

    return inv
    
def calculaLDV(A):
    
    if A is None or not isinstance(A, np.ndarray) or A.ndim != 2:
        return None, None, None
    
    L, U, cantOps = calculaLU(A)
    
    if L is None or U is None:
        return None, None, None
    
    V, D, cantOps2 = calculaLU(traspuesta(U))
    
    if D is None or V is None:
        return None, None, None
    
    V = traspuesta(V)
    
    return L, D, V
    
def esSDP(A, atol=1e-8):
    
    if A is None or not isinstance(A, np.ndarray) or A.ndim != 2:
        return False
    
    n = A.shape[0]
    
    L, D, V = calculaLDV(A)
    
    if L is None or D is None or V is None:
        return False
    
    if (not matricesIguales(L, traspuesta(V))):
        return False
    
    for i in range (0,n,1):
        if (D[i, i] <= 0):
            return False
    
    return True