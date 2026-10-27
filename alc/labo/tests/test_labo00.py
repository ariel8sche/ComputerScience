import numpy as np
import pytest
import alc
from helpers import info

def test_esCuadrada():
    assert alc.esCuadrada(np.eye(3))
    assert not alc.esCuadrada(np.ones((2, 3)))
    assert not alc.esCuadrada(np.array([1, 2, 3]))

def test_triangSup_es_estrictamente_superior():
    A = np.arange(1.0, 10.0).reshape(3, 3)
    assert np.array_equal(alc.triangSup(A), np.triu(A, 1))

def test_triangInf_es_estrictamente_inferior():
    A = np.arange(1.0, 10.0).reshape(3, 3)
    assert np.array_equal(alc.triangInf(A), np.tril(A, -1))

def test_diagonal():
    A = np.arange(1.0, 10.0).reshape(3, 3)
    assert np.array_equal(alc.diagonal(A), np.diag(np.diag(A)))

def test_traza():
    A = np.arange(1.0, 10.0).reshape(3, 3)
    assert alc.traza(A) == pytest.approx(np.trace(A))

def test_traza_no_cuadrada_devuelve_None():
    assert alc.traza(np.ones((2, 3))) is None

def test_traspuesta_matriz():
    A = np.arange(6.0).reshape(2, 3)
    assert np.array_equal(alc.traspuesta(A), A.T)

def test_traspuesta_vector_da_columna():
    v = np.array([1.0, 2.0, 3.0])
    T = alc.traspuesta(v)
    assert T.shape == (3, 1)

def test_esSimetrica():
    assert alc.esSimetrica(np.array([[1, 2], [2, 1]]))
    assert not alc.esSimetrica(np.array([[1, 2], [3, 1]]))
    assert not alc.esSimetrica(np.ones((2, 3)))

def test_calcularAx():
    rng = np.random.default_rng(0)
    A, x = rng.random((4, 3)), rng.random(3)
    assert np.allclose(alc.calcularAx(A, x), A @ x)

def test_calcularAx_dimensiones_incompatibles():
    assert alc.calcularAx(np.ones((3, 3)), np.ones(2)) is None

def test_intercambiarFilas():
    A = np.array([[1.0, 2.0], [3.0, 4.0], [5.0, 6.0]])
    alc.intercambiarFilas(A, 0, 2)
    assert np.array_equal(A, np.array([[5.0, 6.0], [3.0, 4.0], [1.0, 2.0]]))

def test_sumar_fila_multiplo():
    A = np.array([[1.0, 2.0], [3.0, 4.0]])
    alc.sumar_fila_multiplo(A, 1, 0, 2.0)          # fila1 += 2 * fila0
    assert np.array_equal(A, np.array([[1.0, 2.0], [5.0, 8.0]]))

def test_esDiagonalmenteDominante():
    assert alc.esDiagonalmenteDominante(np.array([[3, 1], [1, 3]]))
    assert not alc.esDiagonalmenteDominante(np.array([[1, 3], [3, 1]]))

def test_matrizCirculante():
    C = alc.matrizCirculante(np.array([1.0, 2.0, 3.0]))
    esperado = np.array([[1, 2, 3], [3, 1, 2], [2, 3, 1]], dtype=float)
    assert np.array_equal(C, esperado)

def test_matrizVandermonde():
    v = np.array([1.0, 2.0, 3.0, 4.0])
    assert np.allclose(alc.matrizVandermonde(v), np.vander(v, increasing=True).T)

def test_numeroAureo_converge():
    r = alc.numeroAureo(30)
    info(f"numeroAureo(30)={r:.10f}  esperado={(1 + 5 ** 0.5) / 2:.10f}")
    assert r == pytest.approx((1 + 5 ** 0.5) / 2, abs=1e-8)

def test_fibonacci():
    assert [alc.fibonacci(i) for i in range(10)] == [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]

def test_matrizFibonacci():
    F = alc.matrizFiboncacci(4)
    assert F[0, 0] == 0 and F[1, 2] == alc.fibonacci(3) and F[3, 3] == alc.fibonacci(6)
    assert alc.esSimetrica(F)

def test_matrizHilbert():
    H = alc.matrizHilbert(4)
    assert H[0, 0] == 1 and H[2, 3] == pytest.approx(1 / 6)
    assert alc.esSimetrica(H)
