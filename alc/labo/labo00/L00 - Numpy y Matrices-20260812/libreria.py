import numpy as np
import matplotlib.pyplot as plt

# Matrices ejemplo
matriz_cuadrada = np.array([
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
])

matriz_no_cuadrada = np.array([
    [1, 2, 3],
    [4, 5, 6]
])

array_1d = np.array([1, 2, 3, 4, 5])

matriz_sim = np.array([
    [1, 2, 3],
    [2, 5, 6],
    [3, 6, 9]
])

A = np.array([
    [1, 2, 3],
    [4, 5, 6]
])

x = np.array([10, 20, 30])

diagDom = np.array([
    [10, 2, 3],
    [1, 20, 4],
    [2, 3, 15]])


# Ejercicio 1
def esCuadrada(A):
    if (A.ndim > 1):
        matrixShape = A.shape
        return matrixShape[0]==matrixShape[1]
    else:
        return False
    
# print(esCuadrada(matriz_cuadrada))
# print(esCuadrada(matriz_no_cuadrada))
# print(esCuadrada(array_1d))

# Ejercicio 2
def triangSup(A):
    if (esCuadrada(A)):

        U = np.zeros(A.shape)

        for i in range (0,A.shape[0],1):
            for j in range (0,A.shape[1],1):
                if (i < j):
                    U[i][j] = A[i][j]

        return U

# print(triangSup(matriz_cuadrada))
# print(triangSup(matriz_no_cuadrada))
# print(triangSup(array_1d))

# Ejercicio 3
def triangInf(A):
    if (esCuadrada(A)):

        L = np.zeros(A.shape)

        for i in range (0,A.shape[0],1):
            for j in range (0,A.shape[1],1):
                if (i > j):
                    L[i][j] = A[i][j]

        return L

# print(triangInf(matriz_cuadrada))
# print(triangInf(matriz_no_cuadrada))
# print(triangInf(array_1d))

# Ejercicio 4
def diagonal(A):
    if (esCuadrada(A)):

        D = np.zeros(A.shape)

        for i in range (0,A.shape[0],1):
            for j in range (0,A.shape[0],1):
                if (i == j):
                    D[i][j] = A[i][j]

        return D

# print(diagonal(matriz_cuadrada))
# print(diagonal(matriz_no_cuadrada))
# print(diagonal(array_1d))

# Ejercicio 5
def traza(A):

    if esCuadrada(A):

        D = diagonal(A)
        traza = 0

        for i in range(A.shape[0]):
            traza += D[i][i] # type: ignore

        return traza

# print(traza(matriz_cuadrada))
# print(traza(matriz_no_cuadrada))
# print(traza(array_1d))

# Ejercicio 6
def transpuesta(A):
    if (A.ndim > 1):
        matrizTranspuesta = np.zeros((A.shape[1],A.shape[0]))
    
        for i in range (0,A.shape[0],1):
            for j in range (0,A.shape[1],1):
                matrizTranspuesta[j][i] = A[i][j]
        
        return matrizTranspuesta

# print(matriz_cuadrada)
# print(transpuesta(matriz_cuadrada))
# print(matriz_no_cuadrada)
# print(transpuesta(matriz_no_cuadrada))
# print(array_1d)
# print(transpuesta(array_1d))

# Ejercicio 7
def esSimetrica(A):
    
    if (esCuadrada(A)):
        matrizTranspuesta = transpuesta(A)
        
        for i in range (0,A.shape[0],1):
            for j in range (0,A.shape[1],1):
                if (A[i][j] != matrizTranspuesta[i][j]): # type: ignore
                    return False
        return True
        
    return False

# print(esSimetrica(matriz_cuadrada))
# print(esSimetrica(matriz_sim))

# Ejercicio 8
def calcularAx(A,x):
    if not (A.shape[1] == x.shape[0] and A.ndim == 2 and x.ndim == 1):
        raise ValueError("Dimensiones incorrectas")
    
    b = np.zeros((A.shape[0],))

    for i in range(A.shape[0]):
        for j in range(A.shape[1]):
            b[i] += A[i][j] * x[j]
    
    return b

# print(calcularAx(A,x))

# Ejercicio 9
def intercambiarFilas(A,i,j):
    for y in range(A.shape[1]):
        aux = A[i][y]
        A[i][y] = A[j][y]
        A[j][y] = aux

# print(matriz_cuadrada)
# intercambiarFilas(matriz_cuadrada,0,1)
# print(matriz_cuadrada)

# Ejercicio 10
def sumar_fila_multiplo(A, i, j, s):
    for y in range (0,A.shape[1],1):
        A[i][y] = A[i][y] + A[j][y]*s


# Ejercicio 11
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

# print(esDiagonalmenteDominante(diagDom))
# print(esDiagonalmenteDominante(matriz_cuadrada))

# Ejercicio 12
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

# print(matrizCirculante(np.array([1,2,3,4])))

# Ejercicio 13
def matrizVandermonde(v):
    if (v.ndim == 1):
        A = np.zeros((v.shape[0],v.shape[0]))
        
        for i in range (0, v.shape[0],1):
            for j in range (0, v.shape[0],1):
                A[i][j] = v[j]**i
    
        return A

#print(matrizVandermonde(np.array([2, 3, 4])))

def fibonacci(n):
    if (n == 0):
        return 0
    if (n == 1):
        return 1
    else:
        return fibonacci(n-1) + fibonacci(n-2)

def fibonacci_sucesion(n):
    sucesion = np.zeros((n+1,))
    
    def fibonacci_aux(n):
        if (n == 0):
            return 0
        if (n == 1):
            return 1
        else:
            return fibonacci_aux(n-1) + fibonacci_aux(n-2)
        
    for i in range (0,n+1,1):
        sucesion[i] = fibonacci_aux(i)
        
    return sucesion

#print(fibonacci(10))
# Ejercicio 14
def numeroAureo(n):
    M = np.array([
        [1, 1],
        [1, 0]
    ])
    
    F = np.array([1, 0])
    
    for i in range(0, n, 1):
        F = calcularAx(M, F)
    
    return F[0] / F[1]

#print(numeroAureo(10))

# Ejercicio 15
def matrizFiboncacci(n):
    A = np.zeros((n,n))
    
    for i in range (0,n,1):
        for j in range (0,n,1):
            A[i][j] =  fibonacci(i+j)
    
    return A

#print(matrizFiboncacci(8))

# Ejercicio 16
def matrizHilbert(n):
    h = np.zeros((n,n))
    
    for i in range (0,n,1):
        for j in range (0,n,1):
            h[i][j] =  1/(i+j+1)
            
    return h

# Ejercicio 17
def calcularPolinomios():
    numeros = np.linspace(-1,1,100)
    
    p1 = []
    p2 = []
    p3 = []
    
    for x in numeros:
        #p1 = x**5 - x**4 + x**3 - x**2 + x - 1
        #print(f"polinomio 1 con valor {x} = {p1}\n")
        #p2 = x**2 + 3
        #print(f"polinomio 2 con valor {x} = {p2}\n")
        #p3 = x**10 -2
        #print(f"polinomio 3 con valor {x} = {p3}\n")
        p1.append(x**5 - x**4 + x**3 - x**2 + x - 1)
        p2.append(x**2 + 3)
        p3.append(x**10 -2)
        
    plt.plot(numeros, p1, label="P1")
    plt.plot(numeros, p2, label="P2")
    plt.plot(numeros, p3, label="P3")

    plt.xlabel("x")
    plt.ylabel("P(x)")
    plt.title("Polinomios")
    plt.legend()
    plt.grid()

    plt.show()
    
calcularPolinomios()