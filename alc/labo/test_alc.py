"""
Tests para alc.py con feedback en pantalla.

Uso:
    python test_alc.py          -> corre todo con resumen
    pytest -v -s                -> igual, pero con pytest directo
    pytest -v -s -k diagRH      -> solo los tests que tengan 'diagRH' en el nombre
    pytest -x                   -> se detiene en el primer fallo
"""
import numpy as np
import pytest
import alc

# ---------- helpers de feedback ----------
VERDE, ROJO, AMARILLO, RESET = "\033[92m", "\033[91m", "\033[93m", "\033[0m"

def info(msg):
    """Linea de feedback (se ve con -s)."""
    print(f"   {AMARILLO}->{RESET} {msg}")

def sim_random(n, rng):
    C = rng.random((n, n))
    return (C + C.T) / 2

def prod(A, B):
    return alc.mult_matrices(A, B)

def reconstruir(S, D):
    return prod(S, prod(D, alc.traspuesta(S)))

# ============================================================
# metpot2k
# ============================================================
@pytest.mark.parametrize("A, esperado", [
    (np.array([[2.0, 0.0], [0.0, 1.0]]), 2.0),
    (np.array([[2.0, 1.0], [1.0, 2.0]]), 3.0),
    (np.array([[1.0, 3.0, 5.0], [3.0, 2.0, 7.0], [5.0, 7.0, 3.0]]), 12.1),
])
def test_metpot2k_autovalor_dominante(A, esperado):
    res = alc.metpot2k(A, tol=1e-12, K=5000)
    assert res is not None, "metpot2k devolvio None (no deberia)"
    v, lam, k, err = res
    ref = np.linalg.eigvalsh(A)[np.argmax(abs(np.linalg.eigvalsh(A)))]
    info(f"lambda={lam:.8f}  numpy={ref:.8f}  iteraciones={k}  err={err:.2e}")
    assert lam == pytest.approx(ref, abs=1e-5)

# ============================================================
# diagRH
# ============================================================
@pytest.mark.parametrize("A", [
    np.array([[0.5, 0.5], [0.5, 0.5]]),
    np.array([[1.5, 0.5, 0.0], [0.5, 1.5, 0.0], [0.0, 0.0, 1.0]]),
    np.array([[1.0, 3.0, 5.0], [3.0, 2.0, 7.0], [5.0, 7.0, 3.0]]),
], ids=["A1_2x2", "A2_3x3", "A3_3x3"])
def test_diagRH_matrices_del_enunciado(A):
    S, D = alc.diagRH(A, tol=1e-12, K=5000)
    assert S is not None, "diagRH devolvio None para una matriz simetrica"
    obt = np.sort(np.diag(D)); esp = np.sort(np.linalg.eigvalsh(A)) # type: ignore
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
        peor = max(peor, np.abs(A - reconstruir(S, D)).max())
    info(f"n={n}: {20 - nones}/20 ok, None={nones}, peor error |A-SDS^t|={peor:.2e}")
    assert nones == 0, f"{nones}/20 matrices devolvieron None"
    assert peor < 1e-3

@pytest.mark.parametrize("n", [3, 6, 10])
def test_diagRH_S_ortogonal_y_D_diagonal(n):
    A = sim_random(n, np.random.default_rng(7))
    S, D = alc.diagRH(A, tol=1e-12, K=5000)
    assert S is not None
    err_orto = np.abs(prod(S, alc.traspuesta(S)) - np.eye(n)).max()
    fuera_diag = np.abs(D - np.diag(np.diag(D))).max() # type: ignore
    info(f"n={n}: |SS^t-I|={err_orto:.2e}  fuera de diagonal en D={fuera_diag:.2e}")
    assert err_orto < 1e-8
    assert fuera_diag == 0.0

def test_diagRH_no_simetrica_devuelve_None():
    S, D = alc.diagRH(np.array([[1.0, 2.0], [3.0, 4.0]]))
    assert S is None and D is None

# ============================================================
# transiciones (labo 7)
# ============================================================
@pytest.mark.parametrize("n", [3, 10, 50])
def test_transiciones_continuas_columnas_suman_1(n):
    T = alc.transiciones_al_azar_continuas(n)
    suma = T.sum(axis=0)
    info(f"n={n}: suma columnas entre {suma.min():.12f} y {suma.max():.12f}")
    assert np.allclose(suma, 1.0)
    assert (T >= 0).all()

@pytest.mark.parametrize("thres", [0.3, 0.7])
def test_transiciones_uniformes(thres):
    T = alc.transiciones_al_azar_uniforme(30, thres)
    for j in range(30):
        no_nulos = T[:, j][T[:, j] > 0]
        if len(no_nulos):
            assert np.allclose(no_nulos, 1 / len(no_nulos))
            assert np.isclose(T[:, j].sum(), 1.0)

# ============================================================
if __name__ == "__main__":
    import sys
    sys.exit(pytest.main(["-v", "-s", "--tb=short", "-p", "no:cacheprovider", __file__]))