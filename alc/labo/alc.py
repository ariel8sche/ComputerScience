import numpy as np

# Labo 00

# Ejercicio 1
def esCuadrada(A):
    if (A.ndim > 1):
        matrixShape = A.shape
        return matrixShape[0]==matrixShape[1]
    else:
        return False

# Ejercicio 6
def traspuesta(A):
    if (A.ndim > 1):
        matrizTraspuesta = np.zeros((A.shape[1],A.shape[0]))
    
        for i in range (0,A.shape[0],1):
            for j in range (0,A.shape[1],1):
                matrizTraspuesta[j][i] = A[i][j]
        
        return matrizTraspuesta

# Ejercicio 7
def esSimetrica(A):
    
    if (esCuadrada(A)):
        matrizTraspuesta = traspuesta(A)
        
        for i in range (0,A.shape[0],1):
            for j in range (0,A.shape[1],1):
                if (A[i][j] != matrizTraspuesta[i][j]): # type: ignore
                    return False
        return True
        
    return False

# Labo 01

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

def mult_matrices(A, B):
    C = np.zeros((A.shape[0],B.shape[1]))
    
    for i in range(0,A.shape[0],1):
        for j in range(0,B.shape[1],1):
            for k in range(0,A.shape[1],1):
                C[i][j] += A[i][k] * B[k][j]
                
    return C

# Labo 02

def rota(tetha):
    matriz_rotacion = np.zeros((2,2))
    
    matriz_rotacion[0][0] = np.cos(tetha)
    matriz_rotacion[0][1] = -np.sin(tetha)
    matriz_rotacion[1][0] = np.sin(tetha)
    matriz_rotacion[1][1] = np.cos(tetha)
    
    return matriz_rotacion
    
def escala(s):
    n = len(s)
    
    matriz_escala = np.zeros((n,n))
    
    for i in range(0,n,1):
        matriz_escala[i][i] = s[i]
    
    return matriz_escala

def rota_y_escala(theta, s):
    matriz_rotacion = rota(theta)
    
    matriz_escala = escala(s)
    
    return mult_matrices(matriz_escala, matriz_rotacion)

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

def trans_afin(v, theta, s, b):
    matriz_afin = afin(theta, s, b)

    v_homogeneo = np.array([v[0], v[1], 1])

    v_homogeneo = v_homogeneo.reshape(3, 1)

    resultado = mult_matrices(
        matriz_afin,
        v_homogeneo
    )
    
    return resultado[:2].reshape(2)