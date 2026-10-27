import numpy as np
import pytest
import alc
from helpers import info

@pytest.mark.parametrize("p", [1, 2, 3, 'inf'])
def test_norma_vs_numpy(p):
    x = np.array([3.0, -4.0, 1.0, 2.0])
    ref = np.linalg.norm(x, np.inf if p == 'inf' else p)
    assert alc.norma(x, p) == pytest.approx(ref)

def test_normaliza_deja_norma_1():
    X = [np.array([3.0, 4.0]), np.array([1.0, 1.0, 1.0])]
    for p in [1, 2, 'inf']:
        for y in alc.normaliza(X, p):
            assert alc.norma(y, p) == pytest.approx(1.0)

@pytest.mark.parametrize("p", [1, 'inf'])
def test_normaExacta_vs_numpy(p):
    A = np.random.default_rng(0).random((4, 4))
    ref = np.linalg.norm(A, np.inf if p == 'inf' else 1)
    assert alc.normaExacta(A, p) == pytest.approx(ref)

def test_normaExacta_default_devuelve_ambas():
    A = np.random.default_rng(0).random((3, 3))
    n1, ninf = alc.normaExacta(A)
    assert n1 == pytest.approx(np.linalg.norm(A, 1))
    assert ninf == pytest.approx(np.linalg.norm(A, np.inf))

def test_normaMatMC_aproxima_norma_2():
    np.random.seed(0)
    A = np.array([[2.0, 1.0], [0.0, 1.0]])
    est, x = alc.normaMatMC(A, 2, 2, 20000)
    ref = np.linalg.norm(A, 2)
    info(f"MC={est:.5f}  exacta={ref:.5f}")
    assert est <= ref + 1e-9          # nunca puede pasarse
    assert est >= 0.97 * ref

@pytest.mark.parametrize("p", [1, 'inf'])
def test_condExacto_vs_numpy(p):
    A = np.random.default_rng(5).random((4, 4)) + np.eye(4)
    ref = np.linalg.cond(A, np.inf if p == 'inf' else 1)
    assert alc.condExacto(A, p) == pytest.approx(ref)

def test_condMC_es_cota_inferior_del_condicionamiento():
    np.random.seed(1)
    A = np.array([[2.0, 1.0], [0.0, 1.0]])
    c = alc.condMC(A, 2)
    ref = np.linalg.cond(A, 2)
    info(f"condMC={c:.4f}  exacto={ref:.4f}")
    assert c <= ref + 1e-9
    assert c >= 0.9 * ref
