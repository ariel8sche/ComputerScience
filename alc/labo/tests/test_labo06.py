import numpy as np
import pytest
import alc
from helpers import info, sim_random

# ---------- f_A ----------
def test_f_A_normaliza():
    A = np.array([[2.0, 0.0], [0.0, 1.0]])
    w = alc.f_A(A, np.array([1.0, 1.0]))
    assert np.linalg.norm(w) == pytest.approx(1.0)

def test_f_A_vector_nulo():
    assert np.allclose(alc.f_A(np.zeros((2, 2)), np.array([1.0, 1.0])), 0)

def test_f_A_en_autovector():
    A = np.array([[2.0, 0.0], [0.0, 1.0]])
    assert np.allclose(alc.f_A(A, np.array([1.0, 0.0])), [1.0, 0.0])
    assert np.allclose(alc.f_A(-A, np.array([1.0, 0.0])), [-1.0, 0.0])   # signo(lambda)

# ---------- metpot2k ----------
@pytest.mark.parametrize("A", [
    np.array([[2.0, 0.0], [0.0, 1.0]]),
    np.array([[2.0, 1.0], [1.0, 2.0]]),
    np.array([[1.0, 3.0, 5.0], [3.0, 2.0, 7.0], [5.0, 7.0, 3.0]]),
])
def test_metpot2k_autovalor_dominante(A):
    res = alc.metpot2k(A, tol=1e-12, K=5000)
    assert res is not None, "metpot2k devolvio None (deberia devolver su ultima estimacion)"
    v, lam, k, err = res
    w = np.linalg.eigvalsh(A)
    ref = w[np.argmax(abs(w))]
    info(f"lambda={lam:.8f}  numpy={ref:.8f}  iteraciones={k}  err={err:.2e}")
    assert lam == pytest.approx(ref, abs=1e-5)
    assert np.allclose(A @ v, lam * v, atol=1e-5)

def test_metpot2k_no_cuadrada():
    assert alc.metpot2k(np.ones((2, 3))) is None

# ---------- producto externo y Householder ----------
def test_producto_externo():
    v, w = np.array([1.0, 2.0, 3.0]), np.array([4.0, 5.0, 6.0])
    assert np.allclose(alc.producto_externo(v, w), np.outer(v, w))

def test_producto_externo_invalido():
    assert alc.producto_externo(np.ones(3), np.ones(2)) is None
    assert alc.producto_externo(np.ones((2, 2)), np.ones(2)) is None

@pytest.mark.parametrize("n", [2, 3, 6])
def test_householder_ortogonal_simetrica_y_lleva_v_a_e1(n):
    v = np.random.default_rng(n).standard_normal(n)
    v = v / np.linalg.norm(v)
    H = alc.reflexionHouseHolder(v)
    Hv = H @ v
    e1 = np.zeros(n); e1[0] = 1
    info(f"n={n}: |HHt-I|={np.abs(H @ H.T - np.eye(n)).max():.2e}  Hv={np.round(Hv, 4)}")
    assert np.allclose(H @ H.T, np.eye(n))
    assert np.allclose(H, H.T)
    assert np.allclose(abs(Hv), e1, atol=1e-10)      # +-e1

# ---------- diagRH ----------
@pytest.mark.parametrize("A", [
    np.array([[0.5, 0.5], [0.5, 0.5]]),
    np.array([[1.5, 0.5, 0.0], [0.5, 1.5, 0.0], [0.0, 0.0, 1.0]]),
    np.array([[1.0, 3.0, 5.0], [3.0, 2.0, 7.0], [5.0, 7.0, 3.0]]),
], ids=["A1_2x2", "A2_3x3", "A3_3x3"])
def test_diagRH_matrices_del_enunciado(A):
    S, D = alc.diagRH(A, tol=1e-12, K=5000)
    assert S is not None, "diagRH devolvio None para una matriz simetrica"
    obt, esp = np.sort(np.diag(D)), np.sort(np.linalg.eigvalsh(A))
    info(f"obtenidos={np.round(obt, 6)}  esperados={np.round(esp, 6)}")
    assert np.allclose(obt, esp, atol=1e-5)

@pytest.mark.parametrize("n", [2, 3, 5, 8, 12])
def test_diagRH_reconstruye_A(n):
    rng = np.random.default_rng(42)
    peor, nones = 0.0, 0
    for _ in range(20):
        A = sim_random(n, rng)
        S, D = alc.diagRH(A, tol=1e-12, K=5000)
        if S is None:
            nones += 1
            continue
        peor = max(peor, np.abs(A - S @ D @ S.T).max())
    info(f"n={n}: {20 - nones}/20 ok, None={nones}, peor error |A-SDSt|={peor:.2e}")
    assert nones == 0, f"{nones}/20 matrices devolvieron None"
    assert peor < 1e-3

@pytest.mark.parametrize("n", [3, 6, 10])
def test_diagRH_S_ortogonal_y_D_diagonal(n):
    S, D = alc.diagRH(sim_random(n, np.random.default_rng(7)), tol=1e-12, K=5000)
    assert S is not None
    err_orto = np.abs(S @ S.T - np.eye(n)).max()
    fuera = np.abs(D - np.diag(np.diag(D))).max()
    info(f"n={n}: |SSt-I|={err_orto:.2e}  fuera de diagonal en D={fuera:.2e}")
    assert err_orto < 1e-8 and fuera == 0.0

def test_diagRH_no_simetrica_devuelve_None():
    S, D = alc.diagRH(np.array([[1.0, 2.0], [3.0, 4.0]]))
    assert S is None and D is None

def test_diagRH_menor_tol_menor_error():
    """Ejercicio 3d: el error baja al bajar tol (n=10)."""
    A = sim_random(10, np.random.default_rng(11))
    errs = []
    for tol in [1e-2, 1e-6, 1e-10]:
        S, D = alc.diagRH(A, tol=tol, K=20000)
        assert S is not None
        errs.append(np.abs(A - S @ D @ S.T).max())
    info("error segun tol (1e-2, 1e-6, 1e-10): " + "  ".join(f"{e:.1e}" for e in errs))
    assert errs[2] < errs[0]
