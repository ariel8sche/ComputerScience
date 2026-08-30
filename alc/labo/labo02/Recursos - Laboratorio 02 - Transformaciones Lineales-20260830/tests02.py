
import numpy as np
from lab2 import rota, escala, rota_y_escala, afin, trans_afin


# --- Tests extraídos del enunciado ---

print("\nIniciando serie de tests del Laboratorio 2...")

# Tests para rota
assert(np.allclose(rota(0), np.eye(2)))
assert(np.allclose(rota(np.pi/2), np.array([[0, -1],[1, 0]])))
assert(np.allclose(rota(np.pi), np.array([[-1, 0],[0, -1]])))

# Tests para escala
assert(np.allclose(escala([2,3]), np.array([[2,0],[0,3]])))
assert(np.allclose(escala([1,1,1]), np.eye(3)))
assert(
    np.allclose(escala([0.5,0.25]), np.array([[0.5,0],[0,0.25]]))
)

# Tests para rota_y_escala
assert(
    np.allclose(rota_y_escala(0,[2,3]), np.array([[2,0],[0,3]]))
)
assert(np.allclose(
    rota_y_escala(np.pi/2,[1,1]), np.array([[0,-1],[1,0]]) 
))
assert(np.allclose(
    rota_y_escala(np.pi,[2,2]), np.array([[-2,0],[0,-2]]) 
))

# Tests para afin
assert(np.allclose(
    afin(0,[1,1],[1,2]),
    np.array([  [1,0,1],
                [0,1,2],
                [0,0,1]])))
assert(np.allclose(afin(np.pi/2,[1,1],[0,0]), 
    np.array([  [0,-1,0],
                [1,0,0],
                [0,0,1]])))
assert(np.allclose(afin(0,[2,3],[1,1]),
    np.array([  [2,0,1],
                [0,3,1],
                [0,0,1]])))

# # Tests para trans_afina

assert(np.allclose(
    trans_afin(np.array([1,0]), np.pi/2,[1,1],[0,0]),
    np.array([0,1])
))
assert(np.allclose(
    trans_afin(np.array([1,1]), 0,[2,3],[0,0]),
    np.array([2,3])
))
assert(np.allclose(
    trans_afin(np.array([1,0]), np.pi/2,[3,2],[4,5]),
    np.array([4,7])
))

print("¡Todos los tests del Laboratorio 2 han pasado exitosamente!")