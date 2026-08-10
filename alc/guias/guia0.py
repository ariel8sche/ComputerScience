import numpy as np
from row_echelon import row_echelon

# Configuración de impresión
np.set_printoptions(precision=6, suppress=True)

# ==============================
# FUNCIONES AUXILIARES
# ==============================

def titulo(txt):
    print("\n" + "="*50)
    print(txt)
    print("="*50)

def mostrar(nombre, valor):
    print(f"{nombre} =\n{valor}\n")


# ==============================
# VECTORES
# ==============================

titulo("VECTORES")

v1 = np.array([10, 5, -7, 1])
v2 = np.array([5, 0, 3/2, 2])
v3 = np.array([1, 2, 5, 10])

mostrar("v1", v1)
mostrar("v2", v2)
mostrar("v3", v3)

print(f"Elemento v3[2] = {v3[2]}  (tercer elemento)\n")

v4 = np.array([10, 5, -7, 1])
v5 = np.array([5, 0, 7, 2])

mostrar("v4", v4)
mostrar("v5", v5)
mostrar("v4 + v5", v4 + v5)


# ==============================
# MATRICES
# ==============================

titulo("MATRICES")

A = np.array([[1, 2],
              [3, 4]])

B = np.array([[1, 2, 3, 4],
              [7, 1, 2, -1]])

C = np.array([[1],
              [7],
              [1/3]])

D = np.array([[1, 2, 3, 4],
              [5, 6, 7, 8],
              [9, 10, 11, 12]])

mostrar("A", A)
mostrar("B", B)
mostrar("C", C)
mostrar("D", D)

print(f"Elemento D[2,3] = {D[2,3]}  (fila 2, columna 3)\n")


# ==============================
# OPERACIONES CON MATRICES
# ==============================

titulo("OPERACIONES CON MATRICES")

A1 = np.array([[1, 2],
               [3, 4]])

A2 = np.array([[2, 7],
               [1, 0]])

A3 = np.array([[2, 7, 1, 0]])

mostrar("A1", A1)
mostrar("A2", A2)
mostrar("A3", A3)

mostrar("A1 + A2", A1 + A2)

# Ejemplo inválido:
# print(A1 + A3)  # ❌ distinto tamaño


# ==============================
# MATRIZ ESCALONADA (EJEMPLO)
# ==============================

titulo("MATRIZ ESCALONADA (E)")

E = np.array([[1,2,3,4],
              [5,6,7,8],
              [9,10,11,12]])

mostrar("E", E)
mostrar("row_echelon(E)", row_echelon(E))


# ==============================
# SISTEMA COMPATIBLE DETERMINADO
# ==============================

titulo("SISTEMA COMPATIBLE DETERMINADO")

F = np.array([[1,5,5],
              [2,2,-3],
              [-1,-9,2]])

g = np.array([2, -1, 9])

Fg = np.c_[F, g]

mostrar("F", F)
mostrar("g", g)
mostrar("Matriz ampliada Fg", Fg)
mostrar("Matriz escalonada", row_echelon(Fg))

print("➡ Sistema compatible determinado\n")


# ==============================
# SISTEMA COMPATIBLE INDETERMINADO
# ==============================

titulo("SISTEMA COMPATIBLE INDETERMINADO")

G = np.array([[5,3,11],
              [15,9,33],
              [20,12,44]])

mostrar("G", G)
mostrar("Matriz escalonada", row_echelon(G))

print("➡ Sistema compatible indeterminado\n")


# ==============================
# SISTEMA INCOMPATIBLE
# ==============================

titulo("SISTEMA INCOMPATIBLE")

H = np.array([[5,3,11],
              [15,9,33],
              [20,12,55]])

mostrar("H", H)
mostrar("Matriz escalonada", row_echelon(H))

print("➡ Sistema incompatible\n")


# ==============================
# FIN
# ==============================

titulo("FIN DEL PROGRAMA")
