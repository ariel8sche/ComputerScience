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
    v_col = v.reshape(-1, 1)
    w_col = w.reshape(-1, 1)
    
    v_t = traspuesta(v_col)
    
    # Numerador: v^T * w
    num = mult_matrices(v_t, w_col)[0, 0]
    # Denominador: v^T * v
    den = mult_matrices(v_t, v_col)[0, 0]
    
    if abs(den) < 1e-15:
        return np.zeros_like(w)
        
    return (num / den) * v  

def QR_con_GS(A,tol=1e-12,retorna_nops=False):
    
    # Guardas para verificar la correctitud de la entrada
    if A is None or not isinstance(A, np.ndarray) or A.ndim != 2:
        return None, None
    
    if (not esCuadrada(A)):
        return None, None
    
    # Dimensiones de la matriz A
    n = A.shape[0]
    
    # Contador para las operaciones
    cant_ops = 0
    
    # Matriz Q donde voy a ir guardando los q_i
    Q = np.zeros((n,n))
    
    # Matriz R donde voy a ir guardando los valores r_ij
    R = np.zeros((n,n))
    
    # Primer paso
    
    # Col_0 de A
    a_0 = A[:, 0].copy()
    
    # r_00 es la norma 2 de la columna 0 de A
    r_00 = norma(a_0,2)
    # es el resultado de n-1 sumas, n multiplicaciones y 1 raiz cuadrada
    cant_ops += 2 * n
    
    # q_0 es el valor a la columna 0 de A normalizada
    q_0 = a_0 / r_00
    # sumo las n divisiones 
    cant_ops += n
    
    # de esta forma si multiplicamos q_0 por r_00 no devuelve la col_0 de A
    
    # guardo q_0 y r_00 en las matrices Q y R
    if r_00 > tol:
        Q[:, 0] = q_0
        R[0,0] = r_00
    else:
        Q[:, 0] = 0.0
        R[0,0] = 0.00
    
    for j in range (1, n, 1):
        
        # Llamo al vector ǭ como u_j
        # ǭ no esta normalizado
        # Por las definiciones es la columna j de A 
        # y le voy restando las proyecciones de la columna j de A sobre las columnas de Q ya calculadas
        u_j = A[:,j].copy()
        u_j = u_j.reshape(n, 1)
        
        # Itero sobre las columnas de Q ya calculadas
        for k in range (0, j, 1):
            
            # Me guardo la columna k de Q
            q_k = Q[:,k].reshape(n, 1)
            
            # Coeficiente R[k, j] = q_k^T * a_j (sin usar @)
            R[k, j] = mult_matrices(traspuesta(q_k), u_j)[0, 0]
            cant_ops += 2 * n - 1  # n productos y n-1 sumas
            
            u_j -= R[k,j]*q_k
            cant_ops += n  # n restas del vector
        
        # Norma del vector resultante
        r_jj = norma(u_j, 2)
        cant_ops += 2 * n  # n mult, n-1 sumas, 1 raíz
        
        # Normalización y guardado en la columna j de Q
        if r_jj > tol:
            R[j, j] = r_jj
            Q[:, j] = u_j / r_jj
            cant_ops += n  # n divisiones
        else:
            Q[j, j] = 0.0
            R[:, j] = 0.0

    # Limpieza de valores por debajo de la tolerancia en R
    R[np.abs(R) < tol] = 0.0

    if retorna_nops:
        return Q, R, cant_ops
    return Q, R
    
    