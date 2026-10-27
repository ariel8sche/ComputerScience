"""Funciones comunes a todos los tests. Importar con: from helpers import ..."""
import numpy as np
import pytest

AMARILLO, RESET = "\033[93m", "\033[0m"

def info(msg):
    """Linea de feedback en pantalla (se ve con -s, que run_tests.py ya activa)."""
    print(f"   {AMARILLO}->{RESET} {msg}")

def sim_random(n, rng):
    """Matriz simetrica aleatoria de n x n."""
    C = rng.random((n, n))
    return (C + C.T) / 2

def dd_random(n, rng):
    """Matriz aleatoria diagonalmente dominante: segura para LU sin pivoteo."""
    return rng.random((n, n)) + n * np.eye(n)

def sdp_random(n, rng):
    """Matriz simetrica definida positiva."""
    C = rng.random((n, n))
    return C.T @ C + np.eye(n)

def no_implementada(res, nombre):
    """Si la funcion todavia devuelve None (esqueleto), salta el test en vez de fallar."""
    if res is None:
        pytest.skip(f"{nombre} todavia no esta implementada")
