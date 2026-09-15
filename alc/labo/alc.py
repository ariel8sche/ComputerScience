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
    if (A.ndim > 1):
        matrizTraspuesta = np.zeros((A.shape[1],A.shape[0]))
    
        for i in range (0,A.shape[0],1):
            for j in range (0,A.shape[1],1):
                matrizTraspuesta[j][i] = A[i][j]
        
        return matrizTraspuesta

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
    n = len(x)

    norma = 0

    if (p == 'inf'):
        return max(abs(xi) for xi in x)

    for i in range (0, n, 1):
        norma += (abs(x[i]))**p

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
    X = [np.random.randn(n) for _ in range(Np)]
    
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

    # Retorna la norma estimada y el vector x que la maximiza
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

#
# LABO 04
# 

# EJERCICIO 0

def elim_gaussiana(A):
    
    if (A is None):
        return None, None, 0
    
    cant_op = 0
    m=A.shape[0]
    n=A.shape[1]
    Ac = A.copy().astype(float)
    
    if m!=n:
        return None, None, 0
    
    L = np.zeros((n,n))
    U = np.zeros((n,n))
    
    for k in range (0,n,1):
        L[k, k] = 1
    
    for i in range (0,n-1,1):
        
        fila_ref = Ac[i]
        
        if np.isclose(Ac[i, i], 0.0, atol=1e-15):
            return None, None, 0
        
        for j in range (i+1,n,1):
            if (np.isclose(Ac[j, i], 0.0, atol=1e-15)):
                continue
            else:
                m = Ac[j, i] / Ac[i, i]
                cant_op+=1    
                for col in range(i + 1, n):
                    Ac[j, col] -= m * Ac[i, col]
                    cant_op += 2 
                Ac[j ,i] = m
                    
    for i in range(n):
        L[i, i] = 1.0  
        for j in range(n):
            if i > j:
                
                L[i, j] = Ac[i, j]
            else:
                
                U[i, j] = Ac[i, j]    
    
    return L, U, cant_op

# EJERCICIO 1

def calculaLU(A):
    L, U, cantOps = elim_gaussiana(A) # type: ignore
    return L,U, cantOps

# EJERCICIO 2

def res_tri(L, b, inferior=True):
    
    n = L.shape[0]
    x = np.zeros(n, dtype=float)
    
    if (inferior):
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

# EJERCICIO 3

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

# EJERCICIO 4

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

# EJERCICIO 5

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