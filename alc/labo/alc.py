import numpy as np

# LABO 00

# EJERCICIO 1

def esCuadrada(A):
    if (A.ndim > 1):
        matrixShape = A.shape
        return matrixShape[0]==matrixShape[1]
    else:
        return False

# EJERCICIO 2

def triangSup(A):
    if (esCuadrada(A)):

        U = np.zeros(A.shape)

        for i in range (0,A.shape[0],1):
            for j in range (0,A.shape[1],1):
                if (i < j):
                    U[i][j] = A[i][j]

        return U

# EJERCICIO 3

def triangInf(A):
    if (esCuadrada(A)):

        L = np.zeros(A.shape)

        for i in range (0,A.shape[0],1):
            for j in range (0,A.shape[1],1):
                if (i > j):
                    L[i][j] = A[i][j]

        return L

# EJERCICIO 4

def diagonal(A):
    if (esCuadrada(A)):

        D = np.zeros(A.shape)

        for i in range (0,A.shape[0],1):
            for j in range (0,A.shape[0],1):
                if (i == j):
                    D[i][j] = A[i][j]

        return D

# EJERCICIO 5

def traza(A):

    if esCuadrada(A):

        D = diagonal(A)
        traza = 0

        for i in range(A.shape[0]):
            traza += D[i][i] # type: ignore

        return traza

# EJERCICIO 6

def traspuesta(A):
    if A is None:
        return None
    if (A.ndim > 1):
        matrizTraspuesta = np.zeros((A.shape[1],A.shape[0]))
    
        for i in range (0,A.shape[0],1):
            for j in range (0,A.shape[1],1):
                matrizTraspuesta[j][i] = A[i][j]
        
        return matrizTraspuesta
    else:
        v = A
        n = v.shape[0]
        columna = np.zeros((n, 1))
    
        for i in range(n):
            columna[i][0] = v[i]
            
        return columna

# EJERCICIO 7

def esSimetrica(A):
    
    if (esCuadrada(A)):
        matrizTraspuesta = traspuesta(A)
        
        for i in range (0,A.shape[0],1):
            for j in range (0,A.shape[1],1):
                if (A[i][j] != matrizTraspuesta[i][j]): # type: ignore
                    return False
        return True
        
    return False

# EJERCICIO 8

def calcularAx(A,x):
    if not (A.shape[1] == x.shape[0] and A.ndim == 2 and x.ndim == 1):
        return None
    
    b = np.zeros((A.shape[0],))

    for i in range(A.shape[0]):
        for j in range(A.shape[1]):
            b[i] += A[i][j] * x[j]
    
    return b

# EJERCICIO 9

def intercambiarFilas(A,i,j):
    for y in range(A.shape[1]):
        aux = A[i][y]
        A[i][y] = A[j][y]
        A[j][y] = aux


# EJERCICIO 10

def sumar_fila_multiplo(A, i, j, s):
    for y in range (0,A.shape[1],1):
        A[i][y] = A[i][y] + A[j][y]*s

# EJERCICIO 11

def esDiagonalmenteDominante(A):
    if (esCuadrada(A)):
        
        D = diagonal(A)
        
        for i in range (0, A.shape[0], 1):
            
            valor_restante = 0
            
            for j in range (0, A.shape[1], 1):
                if (i != j):
                    valor_restante += abs(A[i][j])
            
            if (abs(D[i][i]) < valor_restante): # type: ignore
                return False
            
        return True

# EJERCICIO 12

def matrizCirculante(v):
    n = v.shape[0]
    A = np.zeros((n, n))

    for i in range(n):
        for j in range(n):
            A[i][j] = v[j]

        v2 = np.zeros(n)

        v2[0] = v[v.shape[0]-1]
        for x in range(0,v.shape[0]-1,1):
            v2[x + 1] = v[x]

        v = v2

    return A

# EJERCICIO 13

def matrizVandermonde(v):
    if (v.ndim == 1):
        A = np.zeros((v.shape[0],v.shape[0]))
        
        for i in range (0, v.shape[0],1):
            for j in range (0, v.shape[0],1):
                A[i][j] = v[j]**i
    
        return A

# EJERCICIO 14

def numeroAureo(n):
    M = np.array([
        [1, 1],
        [1, 0]
    ])
    
    F = np.array([1, 0])
    
    for i in range(0, n, 1):
        F = calcularAx(M, F)
    
    return F[0] / F[1] # type: ignore

# EJERCICIO 15

def fibonacci(n):
    if (n == 0):
        return 0
    if (n == 1):
        return 1
    else:
        return fibonacci(n-1) + fibonacci(n-2)

def matrizFiboncacci(n):
    A = np.zeros((n,n))
    
    for i in range (0,n,1):
        for j in range (0,n,1):
            A[i][j] =  fibonacci(i+j)
    
    return A

# EJERCICIO 16

def matrizHilbert(n):
    h = np.zeros((n,n))
    
    for i in range (0,n,1):
        for j in range (0,n,1):
            h[i][j] =  1/(i+j+1)
            
    return h

# LABO 01

# EJERCICIO 1

def error(x, y):
    x = np.float32(x)

    return abs(x-y)

# EJERCICIO 2

def error_relativo(x, y):
    x = np.float32(x)

    return abs(x-y)/abs(x)

# EJERCICIO 3

def matricesIguales(A,B):
    if (A.shape == B.shape):
        for i in range(0, A.shape[0]):
            for j in range(0, A.shape[1],1):
                elemA = A[i][j]
                elemB = B[i][j]
                if (elemA != elemB):
                    if (error(elemA, elemB) > 1e-3):
                        return False

        return True
        
    return False

# EJERCICIO 4

def mult_matrices(A, B):
    C = np.zeros((A.shape[0],B.shape[1]))
    
    for i in range(0,A.shape[0],1):
        for j in range(0,B.shape[1],1):
            for k in range(0,A.shape[1],1):
                C[i][j] += A[i][k] * B[k][j]
                
    return C

def mult_matriz_vector(A, v):
    if A.shape[1] != v.shape[0]:
        raise ValueError("Las columnas de la matriz deben coincidir con la dimensión del vector.")
    
    c = np.zeros(A.shape[0])
    
    for i in range(A.shape[0]):
        for k in range(A.shape[1]):
            c[i] += A[i][k] * v[k]
            
    return c

def mult_vector_matriz(v, A):
    if v.shape[0] != A.shape[0]:
        raise ValueError("La dimensión del vector debe coincidir con las filas de la matriz.")
    
    c = np.zeros(A.shape[1])
    
    for j in range(A.shape[1]):    
        for k in range(A.shape[0]):  
            c[j] += v[k] * A[k][j]
            
    return c

def producto_punto(v, w):
    
    if (v is None or w is None):
        return None
    
    m,n = v.shape
    
    valor = 0
    
    for i in range (0, m, 1):
        valor += v[i,0] * w[i]
    
    return valor

#
# LABO 02
# 

# EJERCICIO 1

def rota(tetha):
    matriz_rotacion = np.zeros((2,2))
    
    matriz_rotacion[0][0] = np.cos(tetha)
    matriz_rotacion[0][1] = -np.sin(tetha)
    matriz_rotacion[1][0] = np.sin(tetha)
    matriz_rotacion[1][1] = np.cos(tetha)
    
    return matriz_rotacion

# EJERCICIO 2

def escala(s):
    n = len(s)
    
    matriz_escala = np.zeros((n,n))
    
    for i in range(0,n,1):
        matriz_escala[i][i] = s[i]
    
    return matriz_escala

# EJERCICIO 3

def rota_y_escala(theta, s):
    matriz_rotacion = rota(theta)
    
    matriz_escala = escala(s)
    
    return mult_matrices(matriz_escala, matriz_rotacion)

# EJERCICIO 4

def afin(theta, s, b):
    matriz_afin = np.zeros((3,3))
    
    matriz_rotacion_escala = rota_y_escala(theta, s)
    
    matriz_afin[0][0] = matriz_rotacion_escala[0][0]
    matriz_afin[0][1] = matriz_rotacion_escala[0][1]
    matriz_afin[1][0] = matriz_rotacion_escala[1][0]
    matriz_afin[1][1] = matriz_rotacion_escala[1][1]
    
    matriz_afin[0][2] = b[0]
    matriz_afin[1][2] = b[1]
    
    matriz_afin[2][2] = 1
    
    return matriz_afin

# EJERCICIO 5

def trans_afin(v, theta, s, b):
    matriz_afin = afin(theta, s, b)

    v_homogeneo = np.array([v[0], v[1], 1])

    v_homogeneo = v_homogeneo.reshape(3, 1)

    resultado = mult_matrices(
        matriz_afin,
        v_homogeneo
    )
    
    return resultado[:2].reshape(2)

#
# LABO 03
# 

# EJERCICIO 1

def norma(x, p):
    v = np.array(x, dtype=float).reshape(-1)
    
    n = len(v)

    norma = 0

    if (p == 'inf'):
        return max(abs(vi) for vi in v)

    for i in range (0, n, 1):
        norma += (abs(v[i]))**p

    return norma**(1/p)

# EJERCICIO 2

def normaliza(X,p):
    Y = []

    for x in X:

        Y.append(np.array(x)/norma(x,p))

    return Y

# EJERCICIO 3

def normaMatMC(A, q, p, Np):
    # Me guardo el n pq los vectores tienen que ser de R^n
    n = A.shape[1]
    
    # Genera Np vectores aleatorios en R^n
    X = [np.random.uniform(-1, 1, n) for _ in range(Np)]
    
    # Normalizo los vectores
    X = normaliza(X, p)
    
    max_norma = 0
    best_x = 0
    for x in X:
        # Obtengo b, multuplicando A por el vector x (Ax = b)
        b = A @ x
        
        # Calculo la norma de b ( ||b||q )
        norma_b = norma(b,q)
        
        # Busco el maximo
        if (norma_b > max_norma):
            max_norma = norma_b
            best_x = x
            
    # devolvemos la norma estimada y el vector x que la maximiza
    return [max_norma, best_x]

# EJERCICIO 4

def normaExacta(A, p=[1,'inf']):
    n, m = A.shape

    if p == 'inf':
        sum_filas = []
        for i in range(n):
            fila = 0
            for j in range(m):
                fila += abs(A[i][j])
            sum_filas.append(fila)
        return max(sum_filas)

    elif p == 1:
        sum_columnas = []
        for j in range(m):
            columna = 0
            for i in range(n):
                columna += abs(A[i][j])
            sum_columnas.append(columna)
        return max(sum_columnas)

    elif p == [1, 'inf']:
        return [normaExacta(A, 1), normaExacta(A, 'inf')]

    else:
        return None

# EJERCICIO 5

def condMC(A, p):
    A_inv = np.linalg.inv(A)
    
    norma_A = normaMatMC(A,p,p,1000)[0]
    norma_A_inv = normaMatMC(A_inv,p,p,1000)[0]
    
    return (norma_A)*(norma_A_inv)

# EJERCICIO 6

def condExacto(A, p):
    A_inv = np.linalg.inv(A)
    
    norma_A = normaExacta(A, p)
    norma_A_inv = normaExacta(A_inv, p)
    
    return norma_A * norma_A_inv # type: ignore

############################################################################################
# LABO 04
############################################################################################

#======================#
#      Ejercicio 0     #
#======================#

def elim_gaussiana(A):
    """
    A una matriz de n x n
    Calcula la factorizacion LU de A (sin pivoteo) por eliminacion gaussiana.
    Retorna L (triangular inferior con unos en la diagonal), U (triangular superior)
    y la cantidad de operaciones realizadas (divisiones, productos y restas).
    Retorna None, None, 0 si A no es una matriz cuadrada o si aparece un pivote nulo
    (la factorizacion LU no se puede calcular sin pivoteo).
    """
    
    if (A is None or not isinstance(A, np.ndarray) or A.ndim != 2 or not esCuadrada(A)) :
        return None, None, 0
    
    m, n = A.shape
    
    cant_op = 0
    Ac = A.copy().astype(float)
    
    for i in range(0, n - 1, 1):

        # pivote nulo: no se puede seguir sin intercambiar filas
        if abs(Ac[i, i]) <= 1e-15:
            return None, None, 0

        for j in range(i + 1, n, 1):

            if abs(Ac[j, i]) <= 1e-15:
                Ac[j, i] = 0.0                  # multiplicador exactamente 0
                continue

            mult = Ac[j, i] / Ac[i, i]          # multiplicador l_ji
            cant_op += 1

            for col in range(i + 1, n, 1):
                Ac[j, col] -= mult * Ac[i, col]
                cant_op += 2                    # un producto y una resta

            Ac[j, i] = mult                     # guardo l_ji debajo de la diagonal

    L = np.eye(n)
    U = np.zeros((n, n))

    for i in range(n):
        for j in range(n):
            if i > j:
                L[i, j] = Ac[i, j]
            else:
                U[i, j] = Ac[i, j]

    return L, U, cant_op

#======================#
#      Ejercicio 1     #
#======================#

def calculaLU(A):
    """
    A una matriz de n x n
    Calcula la factorizacion A = LU usando elim_gaussiana.
    Retorna L, U y la cantidad de operaciones.
    Retorna None, None, 0 si A no es cuadrada o si no se puede factorizar sin pivoteo.
    """
    L, U, cantOps = elim_gaussiana(A)
    return L,U, cantOps

#======================#
#     Ejercicio 3.a    #
#======================#

def res_tri(L, b, inferior=True):
    """
    L una matriz triangular de n x n (inferior si inferior=True, superior si no)
    b un vector de n elementos (array de una dimension)
    inferior indica que tipo de triangular es L
    Resuelve el sistema L x = b por sustitucion hacia adelante (inferior=True)
    o hacia atras (inferior=False).
    Retorna el vector x de n elementos.
    Retorna None si L no es una matriz cuadrada, si b no es un vector de largo n,
    o si L tiene un cero en la diagonal (el sistema no tiene solucion unica).
    """
    if L is None or not isinstance(L, np.ndarray) or L.ndim != 2:
        return None

    if b is None or not isinstance(b, np.ndarray) or b.ndim != 1:
        return None

    n = L.shape[0]

    if L.shape[1] != n or b.shape[0] != n:
        return None

    for i in range(n):
        if L[i, i] == 0.0:
            return None

    x = np.zeros(n, dtype=float)

    if inferior:
        for i in range(n):
            suma = 0.0
            for j in range(i):
                suma += L[i, j] * x[j]
            x[i] = (b[i] - suma) / L[i, i]
    else:
        for i in range(n - 1, -1, -1):
            suma = 0.0
            for j in range(i + 1, n):
                suma += L[i, j] * x[j]
            x[i] = (b[i] - suma) / L[i, i]

    return x

#======================#
#     Ejercicio 3.b    #
#======================#

def calcularAxConLU(L, U, b):
    """
    L una matriz triangular inferior de n x n (con diagonal no nula)
    U una matriz triangular superior de n x n (con diagonal no nula)
    b un vector de n elementos
    Resuelve el sistema A x = b, siendo A = LU, en dos pasos:
    L y = b (sustitucion hacia adelante) y U x = y (sustitucion hacia atras).
    Retorna el vector x de n elementos.
    Retorna None si alguna de las entradas no es valida o si el sistema
    no tiene solucion unica (diagonal nula en L o U).
    """
    y = res_tri(L, b, inferior=True)

    if y is None:
        return None

    x = res_tri(U, y, inferior=False)

    return x

#======================#
#     Ejercicio 3.c    #
#======================#

def inversa(A):
    """
    A una matriz de n x n
    Calcula la inversa de A usando su factorizacion A = LU: para cada canonico e_j
    resuelve L y = e_j (hacia adelante) y U x = y (hacia atras); x es la columna j de A^{-1}.
    Retorna la matriz A^{-1} de n x n.
    Retorna None si A no es una matriz cuadrada, si no se puede calcular su
    factorizacion LU o si A es singular (algun elemento de la diagonal de U es nulo).
    """
    if A is None or not isinstance(A, np.ndarray) or A.ndim != 2:
        return None

    n = A.shape[0]

    if A.shape[1] != n:
        return None

    L, U, _ = calculaLU(A)

    if L is None or U is None:
        return None

    for i in range(n):
        if abs(U[i, i]) < 1e-12:                 # A singular
            return None

    inv = np.zeros((n, n), dtype=float)

    for j in range(n):
        e_j = np.zeros(n, dtype=float)
        e_j[j] = 1.0

        y_j = res_tri(L, e_j, inferior=True)     # L y = e_j
        x_j = res_tri(U, y_j, inferior=False)    # U x = y
        inv[:, j] = x_j

    return inv

#======================#
#     Ejercicio 4.a    #
#======================#

def calculaLDV(A):
    """
    A una matriz de n x n
    Calcula la factorizacion A = L D V, con L triangular inferior con unos en la
    diagonal, D diagonal y V triangular superior con unos en la diagonal.
    Primero calcula A = L U; luego factoriza U^T = V^T D (LU de la traspuesta de U)
    y traspone el resultado para obtener V.
    Retorna las matrices L, D y V de n x n.
    Retorna None, None, None si A no es una matriz cuadrada o si no se puede
    calcular su factorizacion LU (por ejemplo, por un pivote nulo).
    """
    if A is None or not isinstance(A, np.ndarray) or A.ndim != 2:
        return None, None, None
    
    L, U, _ = calculaLU(A)
    
    if L is None or U is None:
        return None, None, None
    
    V, D, _ = calculaLU(traspuesta(U))
    
    if D is None or V is None:
        return None, None, None
    
    V = traspuesta(V)
    
    return L, D, V

#======================#
#     Ejercicio 4.b    #
#======================#

def esSDP(A, atol=1e-8):
    """
    A una matriz de n x n
    atol la tolerancia por debajo de la cual un pivote se considera no positivo
    Una matriz es simetrica definida positiva (SDP) si es simetrica y todos los
    pivotes de su factorizacion A = L D V son estrictamente positivos.
    Calcula A = L D V y verifica que L = V^T (A simetrica) y que D[i,i] > atol.
    Retorna True si A es SDP y False en caso contrario (incluyendo entradas
    invalidas, matrices no cuadradas o con un pivote nulo en la factorizacion).
    """
    if A is None or not isinstance(A, np.ndarray) or A.ndim != 2:
        return False
    
    n = A.shape[0]
    
    L, D, V = calculaLDV(A)
    
    if L is None or D is None or V is None:
        return False
    
    if (not matricesIguales(L, traspuesta(V))):
        return False
    
    for i in range(0, n, 1):
        if D[i, i] <= atol:
            return False
        
    return True

#======================#
#     Ejercicio 6      #
#======================#

def calculaCholesky(A, atol=1e-10):
    """
    A una matriz de n x n
    atol la tolerancia con la que esSDP decide si un pivote es positivo
    Calcula la factorizacion de Cholesky de una matriz simetrica definida positiva:
    A = L~ L~^T, con L~ = L D^{1/2}, siendo A = L D L^T su factorizacion LDV.
    Retorna L~ (triangular inferior de n x n) y su traspuesta L~^T.
    Retorna None si A no es una matriz cuadrada, si no es simetrica definida
    positiva o si no se puede calcular su factorizacion.
    """
    if A is None or not isinstance(A, np.ndarray) or A.ndim != 2 or not esCuadrada(A):
        return None

    if not esSDP(A, atol):
        return None

    n = A.shape[0]

    L, D, _ = calculaLDV(A)

    if L is None or D is None:
        return None, None

    D_raiz = np.zeros((n, n))
    for i in range(n):
        D_raiz[i, i] = np.sqrt(D[i, i])

    L_tilde = mult_matrices(L, D_raiz)         # L~ = L D^{1/2}
    L_tilde_T = traspuesta(L_tilde)            # L~^T = D^{1/2} L^T

    return L_tilde, L_tilde_T

############################################################################################
#                                       LABO 05
############################################################################################

#======================#
# Funciones auxiliares #
#======================#

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

def rango_escalonado(R):
    
    if R is None or not isinstance(R, np.ndarray) or R.ndim != 2:
        return None
    
    m,n = R.shape
    
    if m < n:
        return None
    
    r = 0
    for i in range(0, m, 1):
        for j in range(0, n, 1):
            if R[i, j] != 0.0:
                r = i + 1
                break

    for i in range(0, r, 1):
        if R[i, i] == 0.0:
            return None
    
    return r

#======================#
#      Ejercicio 1     #
#======================#

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

#======================#
#     Ejercicio 1.b    #
#======================#

def resolver_inversa_LU(L, U):
    """Calcula A^(-1) resolviendo L * U * x_i = e_i para cada canonico."""
    n = L.shape[0]
    A_inv = np.zeros((n, n), dtype=float)
    I = np.eye(n)
    
    for i in range(n):
        e_i = I[:, i]
        # Sustitucion hacia adelante (L es triangular inferior con diagonal 1)
        y = res_tri(L, e_i, inferior=True)
        # Sustitucion hacia atras (U es triangular superior)
        x_i = res_tri(U, y, inferior=False)
        A_inv[:, i] = x_i
        
    return A_inv

def resolver_inversa_QR(Q, R):
    """Calcula A^(-1) resolviendo R * x_i = Q^T * e_i para cada canonico."""
    n = R.shape[0]
    A_inv = np.zeros((n, n), dtype=float)
    
    # Q^T * e_i equivale a la fila i de Q (o columna i de Q^T)
    for i in range(n):
        b = Q.T[:, i]
        x_i = res_tri(R, b, inferior=False)
        A_inv[:, i] = x_i
        
    return A_inv

def resolver_inversa(A, factorizacion='LU', metodo='RH'):
    if A is None or not isinstance(A, np.ndarray) or A.ndim != 2 or not esCuadrada(A):
        return None

    if factorizacion == 'LU':
        L, U, _ = calculaLU(A)
        if L is None or U is None:
            return None
        if np.any(np.isclose(np.diag(U), 0.0)):
            return None
        return resolver_inversa_LU(L, U)

    elif factorizacion == 'QR':
        res = calculaQR(A, metodo=metodo)
        if res is None:
            return None
        Q, R = res
        if np.any(np.isclose(np.diag(R), 0.0)):
            return None
        return resolver_inversa_QR(Q, R)

    return None

#======================#
#     Ejercicio 2      #
#======================#

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

            # Actualizacion de R y Q
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

#======================#
#     Ejercicio 2.c    #
#======================#

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

#======================#
# Ejercicio 3 (EXTRAS) #
#======================#

def nucleo2(A, tol= 1e-12, metodo=['RH','LU']):
    """
    A una matriz de m x n (m >= n)
    tol la tolerancia con la que se consideran nulos los elementos de R (o U)
    metodo = ['RH','LU'] usa reflectores de Householder (RH) o la factorizacion LU (LU) para escalonar A. 
    Por defecto se usa 'RH'.

    Factoriza A = QR (o A = LU), anula los elementos de R (o U) menores a tol y
    calcula r, la cantidad de filas no nulas de R (o U). Si el primer elemento no
    nulo de cada fila esta en la diagonal, escribe R = (R1 R2; 0 0) con R1 de r x r
    y R2 de r x (n-r), y arma los generadores del nucleo como las columnas de
    x = (-R1^{-1} R2 ; I_{n-r}).
    El nucleo de R (o U) coincide con el de A, porque Q (o L) es inversible.

    Retorna una matriz de n x (n-r) cuyas columnas generan el nucleo de A.
    Si el nucleo es trivial (r == n), retorna una matriz de n x 0.
    Retorna None si A no es una matriz 2D, si m < n, si el metodo no es valido,
    si la factorizacion falla (por ejemplo, LU con A no cuadrada o con un pivote
    nulo) o si R (o U) no tiene el primer elemento no nulo de cada fila en la diagonal.
    """
    
    if A is None or not isinstance(A, np.ndarray) or A.ndim != 2:
        return None
    
    m,n = A.shape
    
    if isinstance(metodo, (list, tuple)):       # valor por defecto
        metodo = 'RH'
    
    if (metodo == 'LU'):
        _,U,cantOps = calculaLU(A)              # Obtengo la descomposicion LU de A
        
        if U is None:      
            return None
        
        R = U.copy()
    elif (metodo == 'RH'):
        _,R = calculaQR(A, metodo='RH', tol=tol)
        
        if (R is None):
            return None
        
        R = R.copy()
    else:
        return None
    
    # Limpio los valores de R menores que tol
    R[np.abs(R) < tol] = 0.0 
    
    # Busco r = la cantidad de filas no nulas de R
    r = rango_escalonado(R)
    
    if (r is None or r > n):
        return None 
    
    if (r == n):
        return np.zeros(n)
    
    R1 = R[ :r,  :r]                        # Armo R1 (r x r)
    R2 = R[ :r, r: ]                        # Armo R2 (r x n-r)
    
    R1_inv = inversa(R1)                    # R1^{-1}
    
    if R1_inv is None:                     
        return None
    
    arriba = -mult_matrices(R1_inv, R2)      # -R1^{-1} R2     (r x (n-r))
    
    abajo = np.eye(n - r)                    # I_{n-r}
    
    # Armo x = [arriba ; abajo]
    N = np.zeros((n, n - r))
    for i in range(r):
        for j in range(n - r):
            N[i, j] = arriba[i, j]
    for i in range(n - r):
        for j in range(n - r):
            N[r + i, j] = abajo[i, j]
            
    return N

def imagen(A, tol=1e-12,metodo=['RH','LU']):
    return None

############################################################################################
#                                       LABO 06                                            #
############################################################################################

def esSimetricaTol(A, atol=1e-8):
    if not esCuadrada(A):
        return False
    n = A.shape[0]
    for i in range(n):
        for j in range(i + 1, n):
            if abs(A[i, j] - A[j, i]) > atol * (1 + abs(A[i, j]) + abs(A[j, i])):
                return False
    return True

def f_A(A, v):
    """Aplica f_A(v) = A v / ||A v||_2 (si la norma es > 0)"""
    w = mult_matriz_vector(A, v)
    # Cant ops: 2n^{2} -n
    norma_w = norma(w,2)
    # Cant ops: 2n - 1
    if norma_w > 0:
        return w / norma_w
        # Cant ops: n diviciones 
    return np.zeros(v.shape)
    # Total ops: 2n^{2}+2n-1

def f_A_2(A, v):
    """Aplica f_A^2(v) = f_A(f_A(v))"""
    return f_A(A, f_A(A, v))
    # Total ops: 4n^{2}+4n-2

def metpot2k(A, tol=1e-8, K=1000):
    """"
    A una matriz de nxn
    tol la tolerancia en la diferencia entre un paso y el siguiente de la estimacion autovector.
    K e l numero maximo de iteraciones a realizarse.
    Retorna vector v, autovalor lambda y numero de iteracion realizadas k
    """
    
    if A is None or not isinstance(A, np.ndarray) or A.ndim != 2 or not esCuadrada(A):
        return None
    
    n,m = A.shape

    for intento in range(5):
        v = np.random.randn(n)
        norma_v = norma(v, 2)
        if norma_v > 0:
            v = v / norma_v

        v_tilde = f_A_2(A, v)
        e = producto_punto(traspuesta(v_tilde), v)
        
        if e is None:
            continue
        
        k = 0
        while (abs(e - 1) > tol and k < K):
            v = v_tilde
            v_tilde = f_A_2(A, v)
            e = producto_punto(traspuesta(v_tilde), v)
            if e is None:
                break
            k += 1
        
        if e is None:
            continue
        
        if abs(e - 1) <= tol:
            v = v_tilde
            Av = mult_matriz_vector(A, v)
            autovalor = producto_punto(traspuesta(v), Av)
            error = abs(e - 1)
            return v, autovalor, k, error

    return None

def producto_externo(v, w):
    """
    Calcula U = v * w^t para dos vectores 1D (v y w de forma (n,)).
    Retorna una matriz U de n x n.
    """
    if v is None or not isinstance(v, np.ndarray) or v.ndim != 1:
        return None
    if w is None or not isinstance(w, np.ndarray) or w.ndim != 1:
        return None
    
    if (v.shape[0] != w.shape[0]):
        return None
    
    n = v.shape[0]
    
    U = np.zeros((n,n),dtype=np.float64)
    
    for i in range (n):
        for j in range(n):
            U[i, j] = v[i] * w[j]
    
    return U
    
def reflexionHouseHolder(v):
    """
    v: autovector 1D (de dimensión n)
    Calcula H = I - 2 * (u * u^t) / ||u||_2^2 con u = e1 - v
    """
    n = len(v)
    
    norma_v1 = norma(v, 2)
    if norma_v1 < 1e-12:
        return np.eye(n, dtype=np.float64)
    
    # Elección del signo opuesto al primer elemento para garantizar estabilidad
    signo = 1.0 if v[0] >= 0 else -1.0
    alpha = -signo * norma_v1
    
    # u = v1 - alpha * e1
    u = v.copy()
    u[0] -= alpha
    
    norma_u_cuadrada = norma(u, 2)**2
    I = np.eye(n, dtype=float)
    
    if norma_u_cuadrada < 1e-15:
        return I
    
    U_tilde = producto_externo(u, u)
    if U_tilde is None:
        return I
    
    H = I - 2.0 * (U_tilde / norma_u_cuadrada)
    return H

def diagRH(A, tol=1e-8, K=1000):
    """
    A una matriz simetrica de nxn
    tol la tolerancia en la diferencia entre un paso y el siguiente autovector.
    K el numero maximo de iteraciones a realizarse
    retorna matriz de autovectores S y matriz de autovalores D, tal Si la matriz A no es simetrica , debe retornar None
    """
    if A is None or not isinstance(A, np.ndarray) or A.ndim != 2 or not esSimetricaTol(A, tol):
        return None, None
    
    m, n = A.shape
    
    autovector, autovalor, _, _ = metpot2k(A, tol=tol, K=K)
    
    if (autovector is None or autovalor is None):
        return None, None
    
    H = reflexionHouseHolder(autovector)
    
    if H is None:
        return None, None
    
    if (n == 2):
        S = H
        D = mult_matrices(H, mult_matrices(A, traspuesta(H)))
    else:
        B = mult_matrices(H, mult_matrices(A, traspuesta(H)))
            
        A_tilde = B[1:n, 1:n].copy()
        
        S_tilde, D_tilde = diagRH(A_tilde, tol=tol, K=K)
        if S_tilde is None or D_tilde is None:
            return None, None
        
        D = np.zeros((n, n), dtype=np.float64)
        D[0, 0] = autovalor
        D[1:n, 1:n] = D_tilde
        D = diagonal(D)
        
        
        S_bloque = np.zeros((n, n), dtype=np.float64)
        S_bloque[0, 0] = 1.0
        S_bloque[1:n, 1:n] = S_tilde
        
        S = mult_matrices(H, S_bloque)
    
    return S, D

# A3 = np.array([[1, 3, 5],[3, 2, 7],[5, 7, 3]])
# S, D = diagRH(A3)

# print(f"S = {S}\n")
# print(f"D = {D}\n")
# print(matricesIguales(A3, mult_matrices(S, mult_matrices(D, traspuesta(S)))))

############################################################################################
#                                       LABO 07                                            #
############################################################################################

def transiciones_al_azar_continuas(n):
    """
    n la cantidad de filas ( columnas ) de la matriz de transicion .
    Retorna matriz T de nxn normalizada por columnas , y con entrada al en el intervalo [0 ,1]
    """
    
    T = np.random.default_rng().random((n,n))
    
    for j in range (n):
        columna_j = T[:,j]
        
        norma_col_j = norma(columna_j, 1)
        
        if (norma_col_j > 0.0):
        
            columna_j = columna_j/norma_col_j
            
            T[:, j] = columna_j
    
    return T


def transiciones_al_azar_uniforme(n, thres):
    """
    n: la cantidad de filas (columnas) de la matriz de transicion.
    thres: probabilidad de que una entrada sea distinta de cero.
    Retorna matriz T de n x n normalizada por columnas. El elemento i, j es distinto de
    cero si el numero generado al azar para i, j es menor o igual a thres. Todos los
    elementos de la columna j son iguales (a 1 sobre el numero de elementos distintos
    de cero en la columna).
    """
    T = np.random.default_rng().random((n,n))
    
    for i in range (n):
        for j in range (n):
            if (T[i, j] > thres):
                T[i, j] = 0.0 
            elif (T[i, j] <= thres):
                T[i, j] = 1.0 
    
    for j in range (n):
        columna_j = T[:,j]
        
        norma_col_j = norma(columna_j, 1)
        
        if (norma_col_j > 0.0):
        
            columna_j = columna_j/norma_col_j
            
            T[:, j] = columna_j

    return T

# print(transiciones_al_azar_uniforme(6, 0.50))

def nucleo(A, tol=1e-15):
    """
    A: una matriz de m x n.
    tol: la tolerancia para asumir que un vector esta en el nucleo.
    Calcula el nucleo de la matriz A diagonalizando la matriz traspuesta(A) * A (* la
    multiplicacion matricial), usando el metodo diagRH. El nucleo corresponde a los
    autovectores de autovalor con modulo <= tol.
    Retorna los autovectores en cuestion, como una matriz de n x k, con k el numero de
    autovectores en el nucleo.
    """
    
    if A is None or not isinstance(A, np.ndarray) or A.ndim != 2:
        return None
    
    m, n = A.shape
    
    # 1. Calculamos A_T_A = A^T * A (matriz cuadrada de n x n, simétrica real)
    A_T_A = mult_matrices(traspuesta(A), A)
    
    S, D = diagRH(A_T_A, tol=tol)
    
    if (S is None or D is None):
        return None
    
    columnas_nucleo = []
    for i in range (n):
        if (abs(D[i, i]) <= tol):
            columnas_nucleo.append(S[:,i])
    
    k = len(columnas_nucleo)
    
    if k == 0:
        return np.zeros((n, 0), dtype=np.float64)
    
    res_nucleo = np.zeros((n,k))
    for j in range(k):
        v = columnas_nucleo[j]
        for i in range(n):
            res_nucleo[i, j] = v[i]

    return res_nucleo

def punto_fijo(T, tol=1e-15):
    
    if T is None or not isinstance(T, np.ndarray) or T.ndim != 2:
        return None
    
    n = T.shape[0]
    
    I = np.eye(n)
    
    T_menos_I = T-I
    
    T_prima = mult_matrices(traspuesta(T_menos_I),T_menos_I)
    
    autovectores = nucleo(T_prima)
    
    return autovectores

def crear_ala(listado, m_filas, n_columnas, tol=1e-15):
    """
    Recibe una lista listado, con tres elementos: lista con indices i, lista con indices
    j, y lista con valores Aij de la matriz A. Tambien las dimensiones de la matriz a
    traves de m_filas y n_columnas. Los elementos menores a tol se descartan.
    Idealmente, el listado debe incluir unicamente posiciones correspondientes a valores
    distintos de cero. Retorna una lista con:
    - Diccionario {(i, j): Aij} que representa los elementos no nulos de la matriz A. Los
    elementos con modulo menor a tol deben descartarse por default.
    - Tupla (m_filas, n_columnas) que permita conocer las dimensiones de la matriz.
    """
    if listado is None or len(listado) != 3:
        return None
    
    filas, columnas, valores = listado
    
    dict = {(int,int):np.float64}
    
    for k in range (len(valores)):
        i = filas[k]
        j = columnas[k]
        valor = valores[k]
        
        if (abs(valor) >= tol):
            dict[(i,j)]=valor
    
    dimension = (m_filas, n_columnas)
    
    return [dict, dimension]


def multiplicar_ala_vector(A, v):
    """
    Recibe una matriz rala creada con crear_ala y un vector v.
    Retorna un vector w resultado de multiplicar A con v.
    """
    
    if A is None or not isinstance(A, (list, tuple)) or len(A) != 2:
        return None
    
    dict_A, dimensiones = A
    if not isinstance(dimensiones, (tuple, list)) or len(dimensiones) != 2:
        return None
    
    if v is None or not isinstance(v, np.ndarray) or v.ndim != 1:
        return None
    
    m_filas, n_columnas = dimensiones
    
    if v.shape[0] != n_columnas:
        return None
    
    w = np.zeros(m_filas, dtype=np.float64)
    
    for (i, j), val in dict_A.items():
        w[i] += val * v[j]
        
    return w





