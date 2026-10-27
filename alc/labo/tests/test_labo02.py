import numpy as np
import pytest
import alc

def test_rota_90_grados():
    assert np.allclose(alc.rota(np.pi / 2), np.array([[0, -1], [1, 0]]), atol=1e-12)

def test_rota_es_ortogonal():
    R = alc.rota(0.7)
    assert np.allclose(R @ R.T, np.eye(2))

def test_escala():
    assert np.array_equal(alc.escala([2, 3]), np.diag([2.0, 3.0]))

def test_rota_y_escala_es_escala_por_rotacion():
    th, s = 0.5, [2.0, 3.0]
    assert np.allclose(alc.rota_y_escala(th, s), np.diag(s) @ alc.rota(th))

def test_afin_tiene_forma_homogenea():
    M = alc.afin(0.5, [2.0, 3.0], [4.0, 5.0])
    assert M.shape == (3, 3)
    assert np.allclose(M[2], [0, 0, 1])
    assert np.allclose(M[:2, 2], [4, 5])
    assert np.allclose(M[:2, :2], alc.rota_y_escala(0.5, [2.0, 3.0]))

def test_trans_afin_ejemplo_a_mano():
    # R(90) * (1,0) = (0,1) -> escala (3,2) -> (0,2) -> + (4,5) = (4,7)
    r = alc.trans_afin(np.array([1.0, 0.0]), np.pi / 2, [3.0, 2.0], [4.0, 5.0])
    assert np.allclose(r, [4.0, 7.0])
