import numpy as np
import pytest
import alc
from helpers import info

def test_error_absoluto():
    assert alc.error(2.0, 5.0) == pytest.approx(3.0)

def test_error_relativo():
    assert alc.error_relativo(2.0, 3.0) == pytest.approx(0.5)

def test_error_usa_float32():
    # 0.1 en float32 no es 0.1 en float64: el error tiene que ser > 0
    # (y se pasa como np.float64 porque con numpy 2 un float de Python se adapta al float32)
    e = alc.error(0.1, np.float64(0.1))
    info(f"error(0.1, 0.1) = {e:.2e} (distinto de 0 por float32)")
    assert 0 < e < 1e-6

def test_matricesIguales():
    A = np.eye(3)
    assert alc.matricesIguales(A, A.copy())
    assert alc.matricesIguales(A, A + 1e-5)
    assert not alc.matricesIguales(A, A + 1.0)
    assert not alc.matricesIguales(A, np.eye(2))

@pytest.mark.parametrize("m, k, n", [(2, 2, 2), (3, 4, 2), (5, 1, 5)])
def test_mult_matrices(m, k, n):
    rng = np.random.default_rng(1)
    A, B = rng.random((m, k)), rng.random((k, n))
    assert np.allclose(alc.mult_matrices(A, B), A @ B)

def test_mult_matriz_vector():
    rng = np.random.default_rng(2)
    A, v = rng.random((4, 3)), rng.random(3)
    assert np.allclose(alc.mult_matriz_vector(A, v), A @ v)

def test_mult_matriz_vector_dimension_incorrecta():
    with pytest.raises(ValueError):
        alc.mult_matriz_vector(np.ones((3, 3)), np.ones(2))

def test_mult_vector_matriz():
    rng = np.random.default_rng(3)
    v, A = rng.random(4), rng.random((4, 3))
    assert np.allclose(alc.mult_vector_matriz(v, A), v @ A)

def test_mult_vector_matriz_dimension_incorrecta():
    with pytest.raises(ValueError):
        alc.mult_vector_matriz(np.ones(2), np.ones((3, 3)))

def test_producto_punto():
    # Segun tu implementacion: v es columna (n,1) y w es 1D (asi lo usa metpot2k)
    v = np.array([[1.0], [2.0], [3.0]])
    w = np.array([4.0, 5.0, 6.0])
    assert alc.producto_punto(v, w) == pytest.approx(32.0)
