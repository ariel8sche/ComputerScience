import numpy as np
import pytest
import alc
from helpers import info, dd_random

@pytest.mark.parametrize("n", [2, 4, 7])
def test_QR_GS(n):
    A = np.random.default_rng(n).random((n, n)) + np.eye(n)
    Q, R = alc.QR_con_GS(A)
    info(f"n={n}: |A-QR|={np.abs(A - Q @ R).max():.2e}  |QtQ-I|={np.abs(Q.T @ Q - np.eye(n)).max():.2e}")
    assert np.allclose(Q @ R, A)
    assert np.allclose(Q.T @ Q, np.eye(n), atol=1e-8)
    assert np.allclose(R, np.triu(R))

def test_QR_GS_nops_y_no_cuadrada():
    A = np.random.default_rng(0).random((3, 3)) + np.eye(3)
    res = alc.QR_con_GS(A, retorna_nops=True)
    assert len(res) == 3 and res[2] > 0
    assert alc.QR_con_GS(np.ones((3, 2))) is None

@pytest.mark.parametrize("m, n", [(3, 3), (5, 3), (6, 6), (8, 4)])
def test_QR_HH(m, n):
    A = np.random.default_rng(m * 10 + n).random((m, n))
    Q, R = alc.QR_con_HH(A)
    info(f"{m}x{n}: |A-QR|={np.abs(A - Q @ R).max():.2e}  |QtQ-I|={np.abs(Q.T @ Q - np.eye(m)).max():.2e}")
    assert np.allclose(Q @ R, A, atol=1e-8)
    assert np.allclose(Q.T @ Q, np.eye(m), atol=1e-8)
    assert np.allclose(R, np.triu(R), atol=1e-8)

def test_QR_HH_m_menor_que_n_devuelve_None():
    assert alc.QR_con_HH(np.ones((2, 4))) is None

def test_QR_HH_extras():
    A = np.random.default_rng(0).random((4, 4))
    Q, R, extra = alc.QR_con_HH(A, extras=True)
    assert len(extra['R_matrices']) == len(extra['Q_matrices']) > 0

@pytest.mark.parametrize("metodo", ['RH', 'GS'])
def test_calculaQR_metodos(metodo):
    A = np.random.default_rng(1).random((4, 4)) + np.eye(4)
    Q, R = alc.calculaQR(A, metodo=metodo)
    assert np.allclose(Q @ R, A, atol=1e-8)

def test_calculaQR_metodo_invalido():
    assert alc.calculaQR(np.eye(3), metodo='XX') is None

@pytest.mark.parametrize("fact", ['LU', 'QR'])
def test_resolver_inversa(fact):
    A = dd_random(5, np.random.default_rng(9))
    assert np.allclose(alc.resolver_inversa(A, fact), np.linalg.inv(A), atol=1e-8)

def test_resolver_inversa_singular_o_invalida():
    assert alc.resolver_inversa(np.array([[1.0, 2.0], [2.0, 4.0]]), 'LU') is None
    assert alc.resolver_inversa(np.eye(3), 'XX') is None
    assert alc.resolver_inversa(np.ones((2, 3)), 'LU') is None

@pytest.mark.parametrize("metodo", ['LU', 'RH'])
def test_nucleo2_matriz_de_rango_deficiente(metodo):
    A = np.array([[1.0, 1.0, 0.0], [0.0, 1.0, 1.0], [1.0, 2.0, 1.0]])   # fila3 = fila1 + fila2
    N = alc.nucleo2(A, metodo=metodo)
    assert N is not None, "nucleo2 devolvio None"
    info(f"{metodo}: dim del nucleo={N.shape[1]}  |A N|={np.abs(A @ N).max():.2e}")
    assert N.shape == (3, 1)
    assert np.allclose(A @ N, 0, atol=1e-8)

def test_nucleo2_nucleo_trivial():
    N = alc.nucleo2(np.eye(3), metodo='LU')
    assert N is not None and np.size(N) in (0, 3) and np.allclose(N, 0)
