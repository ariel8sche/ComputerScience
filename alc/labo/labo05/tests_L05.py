import sys
from pathlib import Path

sys.path.append(str(Path(__file__).resolve().parent.parent))

from alc import *
import numpy as np

### Funciones L05-QR
def QR_con_GS(A,tol=1e-12,retorna_nops=False):
    """
    A una matriz de n x n 
    tol la tolerancia con la que se filtran elementos nulos en R
    retorna_nops permite (opcionalmente) retornar el numero de operaciones realizado
    retorna matrices Q y R calculadas con Gram Schmidt (y como tercer argumento opcional, el numero de operaciones).
    Si la matriz A no es de n x n, debe retornar None
    """
    # Guardas para verificar la correctitud de la entrada
    if A is None or not isinstance(A, np.ndarray) or A.ndim != 2:
        return None
    
    if (not esCuadrada(A)):
        return None
    
    # Dimensiones de la matriz A
    n = A.shape[0]
    
    # Contador para las operaciones
    cant_ops = 0
    
    # Matriz Q donde voy a ir guardando los q_i
    Q = np.zeros((n,n), dtype=np.float64)
    
    # Matriz R donde voy a ir guardando los valores r_ij
    R = np.zeros((n,n), dtype=np.float64)
    
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
        u_j_col = u_j.reshape(n, 1)
        
        # Itero sobre las columnas de Q ya calculadas
        for k in range (0, j, 1):
            
            # Me guardo la columna k de Q
            q_k = Q[:,k].reshape(n, 1)
            
            # Coeficiente R[k, j] = q_k^T * a_j (sin usar @)
            R[k, j] = mult_matrices(traspuesta(q_k), u_j_col)[0, 0]
            cant_ops += 2 * n - 1  # n productos y n-1 sumas
            
            u_j_col -= R[k,j]*q_k
            cant_ops += 2*n  # n restas del vector
        
        # Norma del vector resultante
        r_jj = norma(u_j_col, 2)
        cant_ops += 2 * n  # n mult, n-1 sumas, 1 raíz
        
        # Normalización y guardado en la columna j de Q
        if r_jj > tol:
            R[j, j] = r_jj
            Q[:, j] = (u_j_col / r_jj).reshape(-1)
            cant_ops += n  # n divisiones
        else:
            R[j, j] = 0.0
            Q[:, j] = 0.0

    # Limpieza de valores por debajo de la tolerancia en R
    R[np.abs(R) < tol] = 0.0

    if retorna_nops:
        return Q, R, cant_ops
    return Q, R

def QR_con_HH(A,tol=1e-12,extras=False):
    """
    A una matriz de m x n (m>=n)
    tol la tolerancia con la que se filtran elementos nulos en R
    retorna matrices Q y R calculadas con reflexiones de Householder
    Si la matriz A no cumple m>=n, debe retornar None
    extras : bool, opcional
        Si es True, devuelve informacion extra sobre el proceso de factorizacion.
        Por defecto es False. Esto lo hacemos para poder graficar el proceso.
    Devuelve la factorizacion QR de A usando reflectores de Householder.
    Devuelve: 
        Q, R, extra_info (si extras es True)
        Q, R (si extras es False)
    extra_info es un diccionario con la clave:
        'R_matrices': lista de las matrices R en cada paso
        'Q_matrices': lista de las matrices Q en cada paso
    """
    
    if A is None or not isinstance(A, np.ndarray) or A.ndim != 2:
        return None
    
    m, n = A.shape
    
    if (m < n):
        return None
    
    R = A.copy().astype(float)
    
    R_matrices = []
    
    Q = np.identity(m)
    
    Q_matrices = []
    
    for k in range (0,n,1):
        x = R[k:m, k]
        
        norma_x = norma(x,2)
        
        if norma_x < tol:
            if extras:
                R_matrices.append(R.copy())
                Q_matrices.append(Q.copy())
            continue
        
        # alpha = -sign(x1) * ||x||2
        signo = 1.0 if x[0] >= 0 else -1.0
        alpha = -signo * norma_x
        
        u = x.copy()
        u[0] -= alpha
        
        norma_u = norma(u,2)
        
        if (norma_u > tol):
            u = u / norma_u
            
            # Dimension del bloque: (m - k)
            dim_bloque = m - k
            u_col = u.reshape(dim_bloque, 1)
            
            # Hk = I - 2 * u * u^T (sin usar @)
            u_uT = mult_matrices(u_col, traspuesta(u_col))
            H_k = np.eye(dim_bloque, dtype=float) - 2.0 * u_uT

            # H_tilde_k de m x m
            H_tilde = np.eye(m, dtype=float)
            H_tilde[k:m, k:m] = H_k

            # Actualizacion de R y Q (sin usar @)
            R = mult_matrices(H_tilde, R)
            Q = mult_matrices(Q, traspuesta(H_tilde))
        else:
            return None

        if extras:
            R_matrices.append(R.copy())
            Q_matrices.append(Q.copy())
            
    extra_info = {
            'R_matrices': R_matrices,
            'Q_matrices': Q_matrices
        }
    
    if extras:
        return Q, R, extra_info
    else:
        return Q, R


def calculaQR(A,metodo='RH',tol=1e-12, extra=False):
    """
    A una matriz de n x n 
    tol la tolerancia con la que se filtran elementos nulos en R    
    metodo = ['RH','GS'] usa reflectores de Householder (RH) o Gram Schmidt (GS) para realizar la factorizacion
    retorna matrices Q y R calculadas con Gram Schmidt (y como tercer argumento opcional, el numero de operaciones)
    Si el metodo no esta entre las opciones, retorna None
    """
    
    if (metodo == "RH"):
        if (extra):
            return QR_con_HH(A, extras=True)
        else:
            return QR_con_HH(A)
            
    elif (metodo == "GS"):
        if (extra):
            return QR_con_GS(A, retorna_nops=True)
        else:
            return QR_con_GS(A)
    else:
        return None
    

# Tests L05-QR:

# --- Funciones auxiliares para los tests ---
def check_QR(Q,R,A,tol=1e-10):
    # Comprueba ortogonalidad y reconstrucción
    assert np.allclose(Q.T @ Q, np.eye(Q.shape[1]), atol=tol)
    assert np.allclose(Q @ R, A, atol=tol)

# ---------------------------------------------------------
# Funciones auxiliares de validación
# ---------------------------------------------------------
def assert_valid_QR(Q, R, A, tol=1e-8, metodo_nombre="QR"):
    """
    Verifica las propiedades fundamentales de la factorización QR:
    1. Q es ortonormal: Q.T @ Q == I
    2. R es triangular superior: R[i, j] == 0 para todo i > j
    3. Reconstrucción: Q @ R == A
    """
    m, n = A.shape
    
    # 1. Dimensiones y ortogonalidad de Q
    assert Q.ndim == 2, f"[{metodo_nombre}] Q debe ser bidimensional"
    # Q puede ser (m x m) en Householder o (m x n) en GS con m == n
    dim_k = Q.shape[1]
    identidad = np.eye(dim_k)
    error_orto = np.max(np.abs(Q.T @ Q - identidad))
    assert np.allclose(Q.T @ Q, identidad, atol=tol), (
        f"[{metodo_nombre}] Q no es ortogonal. Error máx ortogonalidad: {error_orto:.2e}"
    )

    # 2. Estructura triangular de R
    assert R.shape == (dim_k, n), (
        f"[{metodo_nombre}] Dimensión de R incorrecta: {R.shape} != {(dim_k, n)}"
    )
    for i in range(dim_k):
        for j in range(n):
            if i > j:
                assert abs(R[i, j]) < tol, (
                    f"[{metodo_nombre}] R no es triangular superior en ({i}, {j}): {R[i, j]}"
                )

    # 3. Reconstrucción A = Q @ R
    error_rec = np.max(np.abs(Q @ R - A))
    assert np.allclose(Q @ R, A, atol=tol), (
        f"[{metodo_nombre}] Reconstrucción fallida (A != Q @ R). Error máx: {error_rec:.2e}"
    )


# ---------------------------------------------------------
# SUITE 1: Tests para QR_con_GS (Gram-Schmidt)
# ---------------------------------------------------------
def suite_QR_con_GS():
    print("\n--- TEST SUITE: QR_con_GS ---")
    
    # 1. Guardas y casos borde
    assert QR_con_GS(None) is None, "QR_con_GS debe retornar None ante None"
    assert QR_con_GS(np.array([1.0, 2.0])) is None, "QR_con_GS debe retornar None ante array 1D"
    assert QR_con_GS([[1, 2], [3, 4]]) is None, "QR_con_GS debe retornar None ante listas puras"
    # Rectangular (no cuadrada) debe retornar None
    A_rect = np.array([[1.0, 2.0], [3.0, 4.0], [5.0, 6.0]])
    assert QR_con_GS(A_rect) is None, "QR_con_GS debe retornar None si la matriz no es cuadrada"

    # 2. Matrices de prueba clásicas de la cátedra
    A2 = np.array([[1., 2.], [3., 4.]])
    A3 = np.array([[1., 0., 1.], [0., 1., 1.], [1., 1., 0.]])
    A4 = np.array([[2., 0., 1., 3.], [0., 1., 4., 1.], [1., 0., 2., 0.], [3., 1., 0., 2.]])
    
    for idx, A in enumerate([A2, A3, A4], start=2):
        Q, R = QR_con_GS(A)
        assert_valid_QR(Q, R, A, metodo_nombre=f"GS A{idx}")

    # 3. Prueba con retorna_nops=True
    res = QR_con_GS(A3, retorna_nops=True)
    assert isinstance(res, tuple) and len(res) == 3, "QR_con_GS debe devolver 3 elementos si retorna_nops=True"
    Q, R, nops = res
    assert_valid_QR(Q, R, A3, metodo_nombre="GS retorna_nops")
    assert isinstance(nops, (int, np.integer)) and nops > 0, "nops debe ser un entero positivo"

    # 4. Matriz Identidad
    I4 = np.eye(4)
    QI, RI = QR_con_GS(I4)
    assert_valid_QR(QI, RI, I4, metodo_nombre="GS Identidad")
    assert np.allclose(QI, I4) and np.allclose(RI, I4), "Con la matriz Identidad, Q y R deben ser I"

    print("  [✓] QR_con_GS pasó todas las pruebas.")


# ---------------------------------------------------------
# SUITE 2: Tests para QR_con_HH (Reflexiones de Householder)
# ---------------------------------------------------------
def suite_QR_con_HH():
    print("\n--- TEST SUITE: QR_con_HH ---")

    # 1. Guardas y casos no válidos
    assert QR_con_HH(None) is None, "QR_con_HH debe retornar None ante None"
    assert QR_con_HH(np.array([1.0, 2.0, 3.0])) is None, "QR_con_HH debe retornar None ante vector 1D"
    # Si m < n debe retornar None
    A_m_menor_n = np.array([[1.0, 2.0, 3.0], [4.0, 5.0, 6.0]])  # 2 x 3
    assert QR_con_HH(A_m_menor_n) is None, "QR_con_HH debe retornar None si m < n"

    # 2. Matrices cuadradas de la cátedra
    A2 = np.array([[1., 2.], [3., 4.]])
    A3 = np.array([[1., 0., 1.], [0., 1., 1.], [1., 1., 0.]])
    A4 = np.array([[2., 0., 1., 3.], [0., 1., 4., 1.], [1., 0., 2., 0.], [3., 1., 0., 2.]])
    
    for idx, A in enumerate([A2, A3, A4], start=2):
        Q, R = QR_con_HH(A)
        assert_valid_QR(Q, R, A, metodo_nombre=f"HH A{idx}")

    # 3. Matrices rectangulares m x n con m > n
    A_rect = np.array([
        [1.0, -1.0],
        [1.0,  4.0],
        [1.0, -1.0],
        [1.0,  4.0]
    ])  # 4 x 2
    Q_rect, R_rect = QR_con_HH(A_rect)
    assert_valid_QR(Q_rect, R_rect, A_rect, metodo_nombre="HH Rectangular 4x2")
    assert Q_rect.shape == (4, 4), "Q en Householder debe ser de m x m (4x4)"
    assert R_rect.shape == (4, 2), "R en Householder debe ser de m x n (4x2)"

    # 4. Parámetro extras=True
    res = QR_con_HH(A3, extras=True)
    assert isinstance(res, tuple) and len(res) == 3, "Debe devolver (Q, R, extra_info) si extras=True"
    Q, R, extra_info = res
    assert_valid_QR(Q, R, A3, metodo_nombre="HH extras")
    assert isinstance(extra_info, dict), "extra_info debe ser un diccionario"
    assert "R_matrices" in extra_info and "Q_matrices" in extra_info, "extra_info debe contener las claves pedidas"
    assert len(extra_info["R_matrices"]) == A3.shape[1], "Debe almacenar una matriz R por cada paso de k"
    assert len(extra_info["Q_matrices"]) == A3.shape[1], "Debe almacenar una matriz Q por cada paso de k"

    print("  [✓] QR_con_HH pasó todas las pruebas.")


# ---------------------------------------------------------
# SUITE 3: Tests para calculaQR (Wrapper)
# ---------------------------------------------------------
def suite_calculaQR():
    print("\n--- TEST SUITE: calculaQR ---")

    A3 = np.array([[1., 0., 1.], [0., 1., 1.], [1., 1., 0.]])
    A4 = np.array([[2., 0., 1., 3.], [0., 1., 4., 1.], [1., 0., 2., 0.], [3., 1., 0., 2.]])

    # 1. Opción por defecto o 'RH'
    Q_rh_def, R_rh_def = calculaQR(A3)
    assert_valid_QR(Q_rh_def, R_rh_def, A3, metodo_nombre="calculaQR (default RH)")

    Q_rh, R_rh = calculaQR(A4, metodo='RH')
    assert_valid_QR(Q_rh, R_rh, A4, metodo_nombre="calculaQR ('RH')")

    # 2. Opción 'GS'
    Q_gs, R_gs = calculaQR(A3, metodo='GS')
    assert_valid_QR(Q_gs, R_gs, A3, metodo_nombre="calculaQR ('GS')")

    # 3. Métodos inválidos (debe retornar None)
    assert calculaQR(A3, metodo='INVALIDO') is None, "Debe retornar None si el método no es 'RH' o 'GS'"
    assert calculaQR(A3, metodo='LU') is None, "Debe retornar None ante métodos ajenos"

    # 4. Matrices inválidas o no cuadradas
    A_rect = np.array([[1.0, 2.0], [3.0, 4.0], [5.0, 6.0]])
    assert calculaQR(A_rect, metodo='GS') is None, "calculaQR con GS sobre matriz no cuadrada debe retornar None"
    assert calculaQR(None) is None, "calculaQR ante None debe retornar None"

    print("  [✓] calculaQR pasó todas las pruebas.")


# ---------------------------------------------------------
# SUITE 4: Test aleatorio de estrés y consistencia numérica
# ---------------------------------------------------------
def suite_aleatoria_estres():
    print("\n--- TEST SUITE: Estrés Numérico con Matrices Aleatorias ---")
    np.random.seed(42)

    for n in [5, 12, 25]:
        # Generar matriz aleatoria no singular
        A_rand = np.random.uniform(-4.0, 4.0, size=(n, n))
        while np.linalg.matrix_rank(A_rand) < n:
            A_rand = np.random.uniform(-4.0, 4.0, size=(n, n))

        # GS
        Q_gs, R_gs = QR_con_GS(A_rand)
        assert_valid_QR(Q_gs, R_gs, A_rand, tol=1e-8, metodo_nombre=f"GS Random n={n}")

        # HH
        Q_hh, R_hh = QR_con_HH(A_rand)
        assert_valid_QR(Q_hh, R_hh, A_rand, tol=1e-8, metodo_nombre=f"HH Random n={n}")

        # Wrapper calculaQR
        Q_w, R_w = calculaQR(A_rand, metodo='RH')
        assert_valid_QR(Q_w, R_w, A_rand, tol=1e-8, metodo_nombre=f"Wrapper Random n={n}")

    print("  [✓] Pruebas aleatorias de estrés aprobadas.")


# ---------------------------------------------------------
# Ejecución general
# ---------------------------------------------------------
if __name__ == "__main__":
    print("=========================================================")
    print("     INICIANDO BATERÍA COMPLETA DE PRUEBAS LABO 05       ")
    print("=========================================================")

    suite_QR_con_GS()
    suite_QR_con_HH()
    suite_calculaQR()
    suite_aleatoria_estres()

    print("\n" + "=" * 57)
    print("  ¡TODOS LOS TESTS DEL MÓDULO ALC PASARON EXITOSAMENTE!  ")
    print("=" * 57 + "\n")