import numpy as np
import sys
from pathlib import Path

sys.path.append(str(Path(__file__).resolve().parent.parent))

from alc import *

    
# Matrices al azar
def genera_matriz_para_test(m,n=2,tam_nucleo=0):
    if tam_nucleo == 0:
        A = np.random.random((m,n))
    else:
        A = np.random.random((m,tam_nucleo))
        A = np.hstack([A,A])
    return(A)

def test_svd_reducida_mn(A,tol=1e-15):
    print(f"A = {A}")
    m,n = A.shape
    print("##########################################")
    hU,hS,hV = svd_reducida(A,tol=tol)
    print(f"U = {hU}\n Sigma = {hS}\n V = {hV}")
    print("==========================================")
    nU,nS,nVT = np.linalg.svd(A)
    print(f"U = {nU}\n Sigma = {nS}\n V = {nVT}")
    r = len(hS)+1 # type: ignore
    assert hU is not None
    assert np.all(np.abs(np.abs(np.diag(hU.T @ nU))-1)<10**r*tol), 'Revisar calculo de hat U en ' + str((m,n))
    assert np.all(np.abs(np.abs(np.diag(nVT @ hV))-1)<10**r*tol), 'Revisar calculo de hat V en ' + str((m,n))
    assert len(hS) == len(nS[np.abs(nS)>tol]), 'Hay cantidades distintas de valores singulares en ' + str((m,n)) # type: ignore
    assert np.all(np.abs(hS-nS[np.abs(nS)>tol])<10**r*tol), 'Hay diferencias en los valores singulares en ' + str((m,n))
    print("TEST PASSED")

for m in [2,5,10,20]:
    for n in [2,5,10,20]:
        for _ in range(10):
            A = genera_matriz_para_test(m,n)
            test_svd_reducida_mn(A)


# Matrices con nucleo

m = 12
for tam_nucleo in [2,4,6]:
    for _ in range(10):
        A = genera_matriz_para_test(m,tam_nucleo=tam_nucleo)
        test_svd_reducida_mn(A)

# Tamaños de las reducidas
A = np.random.random((8,6))
for k in [1,3,5]:
    hU,hS,hV = svd_reducida(A,k=k) # type: ignore
    assert hU.shape[0] == A.shape[0], 'Dimensiones de hU incorrectas (caso a)' # type: ignore
    assert hV.shape[0] == A.shape[1], 'Dimensiones de hV incorrectas(caso a)'# type: ignore
    assert hU.shape[1] <= k, 'Dimensiones de hU incorrectas (caso a)'# type: ignore
    assert hV.shape[1] <= k, 'Dimensiones de hV incorrectas(caso a)'# type: ignore
    assert len(hS) <= k, 'Tamaño de hS incorrecto'# type: ignore
