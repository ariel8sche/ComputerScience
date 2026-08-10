import numpy as np

A = np.array([[1,2,3,4,5],
              [0,1,2,3,4],
              [2,3,4,5,6],
              [0,0,1,2,3],
              [0,0,0,0,1]])

B = np.array([[1, -5, 2],
              [-3, 1, -2]])

def traza(matriz:np.ndarray):
    tamaño:tuple[int,int] = matriz.shape

    if (tamaño[0] == tamaño[1]):
        traza:int = 0
        for i in range(tamaño[0]):
            traza += matriz[i, i]
        return traza
    else:
        print("B no es cuadrada")

print("------------------------- Inciso a -------------------------")
print("\nMatriz A =",A)
print("Tr(A) =", traza(A))
print("(Funcion traza de numpy) np.trace(A) =",np.trace(A))
print("\nMatriz B =",B)
print("Matriz B, no es cuadrada")

def sumatoria(matriz: np.ndarray) -> int:
    filas, columnas = matriz.shape
    total = 0

    for i in range(filas):
        for j in range(columnas):
            total += matriz[i, j]

    return total
print("\n------------------------- Inciso b -------------------------")
print("\nMatriz A =",A)
print("Sumatoria(A) =", sumatoria(A))
print("(Funcion sumatoria de numpy) np.sum(A) =",np.sum(A))
print("\nMatriz B =",B)
print("Sumatoria(A) =", sumatoria(B))
print("(Funcion sumatoria de numpy) np.sum(B) =",np.sum(B))

def sumaPositivosMayorNegativos(matriz:np.ndarray):
    sumatoriaPositivos:int = 0
    sumatoriaNegativos:int = 0

    filas, columnas = matriz.shape

    for i in range(filas):
        for j in range(columnas):
            if (matriz[i, j] > 0):
                sumatoriaPositivos += matriz[i, j]
            else:
                sumatoriaNegativos += matriz[i, j]

    return sumatoriaPositivos > abs(sumatoriaNegativos)
print("\n-------------------------Inciso c -------------------------")
print("\nMatriz A =",A)
print("sumaPositivosMayorNegativos(A) =", sumaPositivosMayorNegativos(A))
print("\nMatriz B =",B)
print("sumaPositivosMayorNegativos(B) =", sumaPositivosMayorNegativos(B))