import numpy as np
import pytest
import alc
from helpers import info, dd_random, sdp_random

@pytest.mark.parametrize("n", [2, 4, 7])
def test_LU_reconstruye_A(n):
    A = dd_random(n, np.random.default_rng(n))
    L, U, ops = alc.calculaLU(A)
    assert L is not None
    info(f"n={n}: |A-LU|={np.abs(A - L @ U).max():.2e}  operaciones={ops}")
    assert np.allclose(L @ U, A)
    assert np.allclose(L, np.tril(L)) and np.allclose(np.diag(L), 1)
    assert np.allclose(U, np.triu(U))

def test_LU_pivote_nulo_devuelve_None():
    L, U, ops = alc.calculaLU(np.array([[0.0, 1.0], [1.0, 0.0]]))
    assert L is None and U is None and ops == 0

def test_LU_no_cuadrada_devuelve_None():
    L, U, ops = alc.calculaLU(np.ones((2, 3)))
    assert L is None and U is None and ops == 0

@pytest.mark.parametrize("inferior", [True, False])
def test_res_tri(inferior):
    rng = np.random.default_rng(3)
    M = dd_random(5, rng)
    T = np.tril(M) if inferior else np.triu(M)
    b = rng.random(5)
    assert np.allclose(alc.res_tri(T, b, inferior), np.linalg.solve(T, b))

def test_res_tri_diagonal_nula_o_dimension_mala():
    assert alc.res_tri(np.array([[0.0, 0.0], [1.0, 1.0]]), np.ones(2)) is None
    assert alc.res_tri(np.eye(3), np.ones(2)) is None

def test_calcularAxConLU():
    rng = np.random.default_rng(4)
    A, b = dd_random(5, rng), rng.random(5)
    L, U, _ = alc.calculaLU(A)
    assert np.allclose(alc.calcularAxConLU(L, U, b), np.linalg.solve(A, b))

@pytest.mark.parametrize("n", [2, 5, 8])
def test_inversa_vs_numpy(n):
    A = dd_random(n, np.random.default_rng(n))
    assert np.allclose(alc.inversa(A), np.linalg.inv(A))

def test_inversa_singular_devuelve_None():
    assert alc.inversa(np.array([[1.0, 2.0], [2.0, 4.0]])) is None

def test_LDV_reconstruye_A():
    A = dd_random(5, np.random.default_rng(6))
    L, D, V = alc.calculaLDV(A)
    assert np.allclose(L @ D @ V, A)
    assert np.allclose(D, np.diag(np.diag(D)))
    assert np.allclose(np.diag(V), 1)

def test_LDV_pivote_nulo():
    assert alc.calculaLDV(np.array([[0.0, 1.0], [1.0, 0.0]])) == (None, None, None)

def test_esSDP():
    assert alc.esSDP(sdp_random(5, np.random.default_rng(1)))
    assert not alc.esSDP(np.array([[1.0, 2.0], [2.0, 1.0]]))     # indefinida
    assert not alc.esSDP(np.array([[2.0, 1.0], [0.0, 2.0]]))     # no simetrica
    assert not alc.esSDP(np.ones((2, 3)))

def test_Cholesky_vs_numpy():
    A = sdp_random(5, np.random.default_rng(2))
    Lt, LtT = alc.calculaCholesky(A)
    assert np.allclose(Lt, np.linalg.cholesky(A))
    assert np.allclose(Lt @ LtT, A)

def test_Cholesky_no_SDP_devuelve_None():
    assert alc.calculaCholesky(np.array([[1.0, 2.0], [2.0, 1.0]])) is None
