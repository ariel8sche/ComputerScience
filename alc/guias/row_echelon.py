import numpy as np

def row_echelon(A):
    """Return Row Echelon Form (REF) of matrix A"""

    A = A.astype(float).copy()  # importante: no modificar la matriz original

    r, c = A.shape
    if r == 0 or c == 0:
        return A

    # buscar pivote en la primera columna
    for i in range(len(A)):
        if A[i, 0] != 0:
            break
    else:
        # si toda la columna es cero, aplicar recursión a la submatriz
        B = row_echelon(A[:, 1:])
        return np.hstack([A[:, :1], B])

    # intercambiar filas si hace falta
    if i > 0:
        A[[0, i]] = A[[i, 0]]

    # normalizar pivote
    A[0] = A[0] / A[0, 0]

    # eliminación hacia abajo
    for j in range(1, r):
        A[j] = A[j] - A[j, 0] * A[0]

    # recursión sobre submatriz
    B = row_echelon(A[1:, 1:])
    A = np.vstack([A[:1], np.hstack([A[1:, :1], B])])

    return A


def rref(A):
    """Return Reduced Row Echelon Form (RREF) of matrix A"""

    A = row_echelon(A)  # primero llevamos a REF

    r, c = A.shape

    # eliminación hacia arriba (Gauss-Jordan)
    for n in range(1, r):
        A[n-1::-1] -= A[n] * A[n-1::-1, n:n+1]

    return A