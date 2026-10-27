import numpy as np
import pytest
import alc
from helpers import info, no_implementada

# ---------- matrices de transicion ----------
@pytest.mark.parametrize("n", [3, 10, 50])
def test_transiciones_continuas(n):
    T = alc.transiciones_al_azar_continuas(n)
    s = T.sum(axis=0)
    info(f"n={n}: suma de columnas entre {s.min():.12f} y {s.max():.12f}")
    assert T.shape == (n, n) and (T >= 0).all() and (T <= 1).all()
    assert np.allclose(s, 1.0)

@pytest.mark.parametrize("thres", [0.3, 0.7])
def test_transiciones_uniformes(thres):
    T = alc.transiciones_al_azar_uniformes(30, thres)
    for j in range(30):
        no_nulos = T[:, j][T[:, j] > 0]
        if len(no_nulos):
            assert np.allclose(no_nulos, 1 / len(no_nulos))
            assert np.isclose(T[:, j].sum(), 1.0)

# ---------- nucleo ----------
def test_nucleo_rango_deficiente():
    A = np.array([[1.0, 1.0, 0.0], [0.0, 1.0, 1.0], [1.0, 2.0, 1.0]])   # fila3 = fila1 + fila2
    N = alc.nucleo(A, tol=1e-8)
    assert N is not None, "nucleo devolvio None"
    info(f"dim del nucleo={N.shape[1]}  |A N|={np.abs(A @ N).max():.2e}")
    assert N.shape == (3, 1)
    assert np.allclose(A @ N, 0, atol=1e-5)

def test_nucleo_trivial():
    N = alc.nucleo(np.array([[2.0, 0.0], [0.0, 3.0]]), tol=1e-8)
    assert N is not None and N.shape == (2, 0)

# ---------- matrices ralas ----------
def test_crear_ala():
    res = alc.crea_rala([[0, 1, 2], [1, 0, 2], [5.0, 0.0, 7.0]], 3, 3)
    no_implementada(res, "crear_ala")
    dic, dims = res
    assert dims == (3, 3)
    assert dic == {(0, 1): 5.0, (2, 2): 7.0}     # el 0.0 se descarta

def test_multiplica_rala_vector():
    A = np.array([[0.0, 2.0, 0.0], [1.0, 0.0, 0.0], [0.0, 0.0, 3.0]])
    ii, jj = np.nonzero(A)
    ala = alc.crea_rala([list(ii), list(jj), list(A[ii, jj])], 3, 3)
    no_implementada(ala, "crear_ala")
    v = np.array([1.0, 2.0, 3.0])
    w = alc.multiplica_rala_vector(ala, v)
    no_implementada(w, "multiplicar_ala_vector")
    assert np.allclose(w, A @ v) # type: ignore
