# tests01.py
# Archivo de testeo para las funciones del Laboratorio 1.
# Contiene los tests provistos en el enunciado original.
import numpy as np

# Se asume que el módulo implementado se llama lab1 y se encuentra en el mismo directorio
from lab1 import error, error_relativo, matricesIguales, esSimetrica

# Este módulo debe contener las implementaciones de:
# - error(x, y)
# - error_relativo(x, y)
# - matricesIguales(A, B)

# Función auxiliar 'sonIguales' provista en el enunciado para testear 'error'.
def sonIguales(x, y, atol=1e-08):
    # Se asume que la función error(x,y) retorna |x-y|
    return np.allclose(error(x, y), 0, atol=atol)

# Bloque de Aserciones
print("\nIniciando serie de tests del enunciado...")

assert(not sonIguales(1, 1.1))
assert(sonIguales(1, 1 + np.finfo('float64').eps))
assert(not sonIguales(1, 1 + np.finfo('float32').eps))
assert(not sonIguales(np.float16(1), np.float16(1) + np.finfo('float32').eps))
assert(sonIguales(np.float16(1), np.float16(1) + np.finfo('float16').eps, atol=1e-3))

assert(np.allclose(error_relativo(1, 1.1), 0.1))
assert(np.allclose(error_relativo(2, 1), 0.5))
assert(np.allclose(error_relativo(-1, -1), 0))
assert(np.allclose(error_relativo(1, -1), 2))

assert(matricesIguales(np.diag([1, 1]), np.eye(2)))
assert(matricesIguales(np.linalg.inv(np.array([[1, 2], [3, 4]])) @ np.array([[1, 2], [3, 4]]), np.eye(2)))
assert(not matricesIguales(np.array([[1, 2], [3, 4]]).T, np.array([[1, 2], [3, 4]])))

print("¡Todos los tests iniciales del archivo han pasado exitosamente!")