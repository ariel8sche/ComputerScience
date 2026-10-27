"""
test_alc.py - tests de ALC por labo, con feedback en pantalla.  Solo necesita numpy (no hace falta pytest).

Poné este archivo en la misma carpeta que alc.py y ejecutá:

    python test_alc.py               -> corre TODOS los labos
    python test_alc.py 6             -> solo el labo 6
    python test_alc.py 4 5 6         -> los labos 4, 5 y 6
    python test_alc.py 4-6           -> rango de labos (4 al 6)
    python test_alc.py 6 -k diagRH   -> solo los tests cuyo nombre contenga 'diagRH'
    python test_alc.py -x            -> se detiene en el primer fallo
    python test_alc.py -f            -> muestra solo los que fallan (oculta los OK)
    python test_alc.py --lista       -> lista los labos disponibles y cuantos tests tiene cada uno
    python test_alc.py --ruido       -> muestra tambien los print() de tu codigo (por defecto se ocultan)
    python test_alc.py --sin-color   -> sin colores (por si tu consola muestra caracteres raros)

Para agregar un labo nuevo: escribi tus tests mas abajo con el decorador @labo(N), por ejemplo

    @labo(8)
    def test_mi_funcion():
        assert alc.mi_funcion(2) == 4

y si queres probar varios casos con la misma funcion:

    @labo(8)
    @parametrize("n", [1, 2, 3])
    def test_otra(n):
        assert alc.otra(n) > 0

Dentro de un test podes usar info("texto") para mostrar un dato en pantalla.
"""
import sys, os, io, time, traceback, contextlib
import numpy as np

AQUI = os.path.dirname(os.path.abspath(__file__))
if AQUI not in sys.path:
    sys.path.insert(0, AQUI)

try:                                   # para que ✓ ✗ se vean bien en Windows
    sys.stdout.reconfigure(encoding="utf-8")
except Exception:
    pass
os.system("")                          # habilita colores ANSI en la consola de Windows

# ---------------------------------------------------------------------------
# Colores
# ---------------------------------------------------------------------------
_COLOR = "--sin-color" not in sys.argv and not os.environ.get("NO_COLOR")
def _c(codigo, txt):
    return f"\033[{codigo}m{txt}\033[0m" if _COLOR else txt
def verde(t):    return _c("92", t)
def rojo(t):     return _c("91", t)
def amarillo(t): return _c("93", t)
def gris(t):     return _c("90", t)
def negrita(t):  return _c("1", t)

# ---------------------------------------------------------------------------
# Importar alc.py (silenciando los print() que tenga al importarse)
# ---------------------------------------------------------------------------
try:
    with contextlib.redirect_stdout(io.StringIO()):
        import alc
except ModuleNotFoundError as e:
    if e.name == "alc":
        sys.exit(rojo(f"No encuentro alc.py. Poné test_alc.py en la misma carpeta que alc.py ({AQUI})"))
    raise
except Exception as e:
    sys.exit(rojo(f"alc.py da un error al importarse: {type(e).__name__}: {e}"))

# ---------------------------------------------------------------------------
# Mini framework de tests
# ---------------------------------------------------------------------------
class Saltar(Exception):
    pass

def skip(msg=""):
    raise Saltar(msg)

def labo(n):
    """Asigna el test a un labo."""
    def deco(f):
        f._labo = n
        return f
    return deco

def parametrize(nombres, valores, ids=None):
    """Corre el mismo test con varios casos (igual que pytest.mark.parametrize)."""
    def deco(f):
        f._casos = (nombres, valores, ids)
        return f
    return deco

class approx:
    """x == approx(y, abs=...) es True si |x-y| <= max(abs, rel*|y|)."""
    __array_ufunc__ = None
    def __init__(self, esperado, abs=1e-12, rel=1e-6):
        self.esperado, self.abs_, self.rel = esperado, abs, rel
    def __eq__(self, otro):
        tol = max(self.abs_, self.rel * builtins_abs(self.esperado))
        return builtins_abs(otro - self.esperado) <= tol
    def __repr__(self):
        return f"{self.esperado} ± {max(self.abs_, self.rel * builtins_abs(self.esperado)):.1e}"
builtins_abs = abs

class raises:
    """with raises(ValueError): ...   -> falla si no se lanza esa excepcion."""
    def __init__(self, exc):
        self.exc = exc
    def __enter__(self):
        return self
    def __exit__(self, tipo, valor, tb):
        if tipo is None:
            raise AssertionError(f"se esperaba que se lanzara {self.exc.__name__} y no paso")
        return issubclass(tipo, self.exc)

_buf = []
def info(msg):
    """Muestra una linea de feedback debajo del test."""
    _buf.append(str(msg))

# ---------------------------------------------------------------------------
# Helpers para generar matrices de prueba
# ---------------------------------------------------------------------------
def sim_random(n, rng):
    C = rng.random((n, n))
    return (C + C.T) / 2

def dd_random(n, rng):
    """Diagonalmente dominante: LU sin pivoteo siempre funciona."""
    return rng.random((n, n)) + n * np.eye(n)

def sdp_random(n, rng):
    """Simetrica definida positiva."""
    C = rng.random((n, n))
    return C.T @ C + np.eye(n)

def no_implementada(res, nombre):
    if res is None:
        skip(f"{nombre} todavia no esta implementada")

def f_alc(nombre):
    """Devuelve alc.<nombre>, o falla con un mensaje claro si no existe."""
    if not hasattr(alc, nombre):
        raise AssertionError(f"alc.py no tiene la funcion '{nombre}' (la consigna la llama asi)")
    return getattr(alc, nombre)

# ===========================================================================
#                                  TESTS
# ===========================================================================
# ======================================================================
# LABO 0
# ======================================================================
@labo(0)
def test_esCuadrada():
    assert alc.esCuadrada(np.eye(3))
    assert not alc.esCuadrada(np.ones((2, 3)))
    assert not alc.esCuadrada(np.array([1, 2, 3]))

@labo(0)
def test_triangSup_es_estrictamente_superior():
    A = np.arange(1.0, 10.0).reshape(3, 3)
    assert np.array_equal(alc.triangSup(A), np.triu(A, 1)) # type: ignore

@labo(0)
def test_triangInf_es_estrictamente_inferior():
    A = np.arange(1.0, 10.0).reshape(3, 3)
    assert np.array_equal(alc.triangInf(A), np.tril(A, -1)) # type: ignore

@labo(0)
def test_diagonal():
    A = np.arange(1.0, 10.0).reshape(3, 3)
    assert np.array_equal(alc.diagonal(A), np.diag(np.diag(A))) # type: ignore

@labo(0)
def test_traza():
    A = np.arange(1.0, 10.0).reshape(3, 3)
    assert alc.traza(A) == approx(np.trace(A))

@labo(0)
def test_traza_no_cuadrada_devuelve_None():
    assert alc.traza(np.ones((2, 3))) is None

@labo(0)
def test_traspuesta_matriz():
    A = np.arange(6.0).reshape(2, 3)
    assert np.array_equal(alc.traspuesta(A), A.T) # type: ignore

@labo(0)
def test_traspuesta_vector_da_columna():
    v = np.array([1.0, 2.0, 3.0])
    T = alc.traspuesta(v)
    assert T.shape == (3, 1) # type: ignore

@labo(0)
def test_esSimetrica():
    assert alc.esSimetrica(np.array([[1, 2], [2, 1]]))
    assert not alc.esSimetrica(np.array([[1, 2], [3, 1]]))
    assert not alc.esSimetrica(np.ones((2, 3)))

@labo(0)
def test_calcularAx():
    rng = np.random.default_rng(0)
    A, x = rng.random((4, 3)), rng.random(3)
    assert np.allclose(alc.calcularAx(A, x), A @ x) # type: ignore

@labo(0)
def test_calcularAx_dimensiones_incompatibles():
    assert alc.calcularAx(np.ones((3, 3)), np.ones(2)) is None

@labo(0)
def test_intercambiarFilas():
    A = np.array([[1.0, 2.0], [3.0, 4.0], [5.0, 6.0]])
    alc.intercambiarFilas(A, 0, 2)
    assert np.array_equal(A, np.array([[5.0, 6.0], [3.0, 4.0], [1.0, 2.0]]))

@labo(0)
def test_sumar_fila_multiplo():
    A = np.array([[1.0, 2.0], [3.0, 4.0]])
    alc.sumar_fila_multiplo(A, 1, 0, 2.0)          # fila1 += 2 * fila0
    assert np.array_equal(A, np.array([[1.0, 2.0], [5.0, 8.0]]))

@labo(0)
def test_esDiagonalmenteDominante():
    assert alc.esDiagonalmenteDominante(np.array([[3, 1], [1, 3]]))
    assert not alc.esDiagonalmenteDominante(np.array([[1, 3], [3, 1]]))

@labo(0)
def test_matrizCirculante():
    C = alc.matrizCirculante(np.array([1.0, 2.0, 3.0]))
    esperado = np.array([[1, 2, 3], [3, 1, 2], [2, 3, 1]], dtype=float)
    assert np.array_equal(C, esperado)

@labo(0)
def test_matrizVandermonde():
    v = np.array([1.0, 2.0, 3.0, 4.0])
    assert np.allclose(alc.matrizVandermonde(v), np.vander(v, increasing=True).T) # type: ignore

@labo(0)
def test_numeroAureo_converge():
    r = alc.numeroAureo(30)
    info(f"numeroAureo(30)={r:.10f}  esperado={(1 + 5 ** 0.5) / 2:.10f}")
    assert r == approx((1 + 5 ** 0.5) / 2, abs=1e-8)

@labo(0)
def test_fibonacci():
    assert [alc.fibonacci(i) for i in range(10)] == [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]

@labo(0)
def test_matrizFibonacci():
    F = alc.matrizFiboncacci(4)
    assert F[0, 0] == 0 and F[1, 2] == alc.fibonacci(3) and F[3, 3] == alc.fibonacci(6)
    assert alc.esSimetrica(F)

@labo(0)
def test_matrizHilbert():
    H = alc.matrizHilbert(4)
    assert H[0, 0] == 1 and H[2, 3] == approx(1 / 6)
    assert alc.esSimetrica(H)


# ======================================================================
# LABO 1
# ======================================================================
@labo(1)
def test_error_absoluto():
    assert alc.error(2.0, 5.0) == approx(3.0)

@labo(1)
def test_error_relativo():
    assert alc.error_relativo(2.0, 3.0) == approx(0.5)

@labo(1)
def test_error_usa_float32():
    # 0.1 en float32 no es 0.1 en float64: el error tiene que ser > 0
    # (y se pasa como np.float64 porque con numpy 2 un float de Python se adapta al float32)
    e = alc.error(0.1, np.float64(0.1))
    info(f"error(0.1, 0.1) = {e:.2e} (distinto de 0 por float32)")
    assert 0 < e < 1e-6

@labo(1)
def test_matricesIguales():
    A = np.eye(3)
    assert alc.matricesIguales(A, A.copy())
    assert alc.matricesIguales(A, A + 1e-5)
    assert not alc.matricesIguales(A, A + 1.0)
    assert not alc.matricesIguales(A, np.eye(2))

@parametrize("m, k, n", [(2, 2, 2), (3, 4, 2), (5, 1, 5)])
@labo(1)
def test_mult_matrices(m, k, n):
    rng = np.random.default_rng(1)
    A, B = rng.random((m, k)), rng.random((k, n))
    assert np.allclose(alc.mult_matrices(A, B), A @ B)

@labo(1)
def test_mult_matriz_vector():
    rng = np.random.default_rng(2)
    A, v = rng.random((4, 3)), rng.random(3)
    assert np.allclose(alc.mult_matriz_vector(A, v), A @ v)

@labo(1)
def test_mult_matriz_vector_dimension_incorrecta():
    with raises(ValueError):
        alc.mult_matriz_vector(np.ones((3, 3)), np.ones(2))

@labo(1)
def test_mult_vector_matriz():
    rng = np.random.default_rng(3)
    v, A = rng.random(4), rng.random((4, 3))
    assert np.allclose(alc.mult_vector_matriz(v, A), v @ A)

@labo(1)
def test_mult_vector_matriz_dimension_incorrecta():
    with raises(ValueError):
        alc.mult_vector_matriz(np.ones(2), np.ones((3, 3)))

@labo(1)
def test_producto_punto():
    # Segun tu implementacion: v es columna (n,1) y w es 1D (asi lo usa metpot2k)
    v = np.array([[1.0], [2.0], [3.0]])
    w = np.array([4.0, 5.0, 6.0])
    assert alc.producto_punto(v, w) == approx(32.0)


# ======================================================================
# LABO 2
# ======================================================================
@labo(2)
def test_rota_90_grados():
    assert np.allclose(alc.rota(np.pi / 2), np.array([[0, -1], [1, 0]]), atol=1e-12)

@labo(2)
def test_rota_es_ortogonal():
    R = alc.rota(0.7)
    assert np.allclose(R @ R.T, np.eye(2))

@labo(2)
def test_escala():
    assert np.array_equal(alc.escala([2, 3]), np.diag([2.0, 3.0]))

@labo(2)
def test_rota_y_escala_es_escala_por_rotacion():
    th, s = 0.5, [2.0, 3.0]
    assert np.allclose(alc.rota_y_escala(th, s), np.diag(s) @ alc.rota(th))

@labo(2)
def test_afin_tiene_forma_homogenea():
    M = alc.afin(0.5, [2.0, 3.0], [4.0, 5.0])
    assert M.shape == (3, 3)
    assert np.allclose(M[2], [0, 0, 1])
    assert np.allclose(M[:2, 2], [4, 5])
    assert np.allclose(M[:2, :2], alc.rota_y_escala(0.5, [2.0, 3.0]))

@labo(2)
def test_trans_afin_ejemplo_a_mano():
    # R(90) * (1,0) = (0,1) -> escala (3,2) -> (0,2) -> + (4,5) = (4,7)
    r = alc.trans_afin(np.array([1.0, 0.0]), np.pi / 2, [3.0, 2.0], [4.0, 5.0])
    assert np.allclose(r, [4.0, 7.0])


# ======================================================================
# LABO 3
# ======================================================================
@parametrize("p", [1, 2, 3, 'inf'])
@labo(3)
def test_norma_vs_numpy(p):
    x = np.array([3.0, -4.0, 1.0, 2.0])
    ref = np.linalg.norm(x, np.inf if p == 'inf' else p)
    assert alc.norma(x, p) == approx(ref)

@labo(3)
def test_normaliza_deja_norma_1():
    X = [np.array([3.0, 4.0]), np.array([1.0, 1.0, 1.0])]
    for p in [1, 2, 'inf']:
        for y in alc.normaliza(X, p):
            assert alc.norma(y, p) == approx(1.0)

@parametrize("p", [1, 'inf'])
@labo(3)
def test_normaExacta_vs_numpy(p):
    A = np.random.default_rng(0).random((4, 4))
    ref = np.linalg.norm(A, np.inf if p == 'inf' else 1)
    assert alc.normaExacta(A, p) == approx(ref)

@labo(3)
def test_normaExacta_default_devuelve_ambas():
    A = np.random.default_rng(0).random((3, 3))
    n1, ninf = alc.normaExacta(A)
    assert n1 == approx(np.linalg.norm(A, 1))
    assert ninf == approx(np.linalg.norm(A, np.inf))

@labo(3)
def test_normaMatMC_aproxima_norma_2():
    np.random.seed(0)
    A = np.array([[2.0, 1.0], [0.0, 1.0]])
    est, x = alc.normaMatMC(A, 2, 2, 20000)
    ref = np.linalg.norm(A, 2)
    info(f"MC={est:.5f}  exacta={ref:.5f}")
    assert est <= ref + 1e-9          # nunca puede pasarse
    assert est >= 0.97 * ref

@parametrize("p", [1, 'inf'])
@labo(3)
def test_condExacto_vs_numpy(p):
    A = np.random.default_rng(5).random((4, 4)) + np.eye(4)
    ref = np.linalg.cond(A, np.inf if p == 'inf' else 1)
    assert alc.condExacto(A, p) == approx(ref)

@labo(3)
def test_condMC_es_cota_inferior_del_condicionamiento():
    np.random.seed(1)
    A = np.array([[2.0, 1.0], [0.0, 1.0]])
    c = alc.condMC(A, 2)
    ref = np.linalg.cond(A, 2)
    info(f"condMC={c:.4f}  exacto={ref:.4f}")
    assert c <= ref + 1e-9
    assert c >= 0.9 * ref


# ======================================================================
# LABO 4
# ======================================================================
@parametrize("n", [2, 4, 7])
@labo(4)
def test_LU_reconstruye_A(n):
    A = dd_random(n, np.random.default_rng(n))
    L, U, ops = alc.calculaLU(A)
    assert L is not None
    info(f"n={n}: |A-LU|={np.abs(A - L @ U).max():.2e}  operaciones={ops}") # type: ignore
    assert np.allclose(L @ U, A) # type: ignore
    assert np.allclose(L, np.tril(L)) and np.allclose(np.diag(L), 1)
    assert np.allclose(U, np.triu(U)) # type: ignore

@labo(4)
def test_LU_pivote_nulo_devuelve_None():
    L, U, ops = alc.calculaLU(np.array([[0.0, 1.0], [1.0, 0.0]]))
    assert L is None and U is None and ops == 0

@labo(4)
def test_LU_no_cuadrada_devuelve_None():
    L, U, ops = alc.calculaLU(np.ones((2, 3)))
    assert L is None and U is None and ops == 0

@parametrize("inferior", [True, False])
@labo(4)
def test_res_tri(inferior):
    rng = np.random.default_rng(3)
    M = dd_random(5, rng)
    T = np.tril(M) if inferior else np.triu(M)
    b = rng.random(5)
    assert np.allclose(alc.res_tri(T, b, inferior), np.linalg.solve(T, b)) # type: ignore

@labo(4)
def test_res_tri_diagonal_nula_o_dimension_mala():
    assert alc.res_tri(np.array([[0.0, 0.0], [1.0, 1.0]]), np.ones(2)) is None
    assert alc.res_tri(np.eye(3), np.ones(2)) is None

@labo(4)
def test_calcularAxConLU():
    rng = np.random.default_rng(4)
    A, b = dd_random(5, rng), rng.random(5)
    L, U, _ = alc.calculaLU(A)
    assert np.allclose(alc.calcularAxConLU(L, U, b), np.linalg.solve(A, b)) # type: ignore

@parametrize("n", [2, 5, 8])
@labo(4)
def test_inversa_vs_numpy(n):
    A = dd_random(n, np.random.default_rng(n))
    assert np.allclose(alc.inversa(A), np.linalg.inv(A)) # type: ignore

@labo(4)
def test_inversa_singular_devuelve_None():
    assert alc.inversa(np.array([[1.0, 2.0], [2.0, 4.0]])) is None

@labo(4)
def test_LDV_reconstruye_A():
    A = dd_random(5, np.random.default_rng(6))
    L, D, V = alc.calculaLDV(A)
    assert np.allclose(L @ D @ V, A) # type: ignore
    assert np.allclose(D, np.diag(np.diag(D))) # type: ignore
    assert np.allclose(np.diag(V), 1)

@labo(4)
def test_LDV_pivote_nulo():
    assert alc.calculaLDV(np.array([[0.0, 1.0], [1.0, 0.0]])) == (None, None, None)

@labo(4)
def test_esSDP():
    assert alc.esSDP(sdp_random(5, np.random.default_rng(1)))
    assert not alc.esSDP(np.array([[1.0, 2.0], [2.0, 1.0]]))     # indefinida
    assert not alc.esSDP(np.array([[2.0, 1.0], [0.0, 2.0]]))     # no simetrica
    assert not alc.esSDP(np.ones((2, 3)))

@labo(4)
def test_Cholesky_vs_numpy():
    A = sdp_random(5, np.random.default_rng(2))
    Lt, LtT = alc.calculaCholesky(A) 
    assert np.allclose(Lt, np.linalg.cholesky(A)) # type: ignore
    assert np.allclose(Lt @ LtT, A) # type: ignore

@labo(4)
def test_Cholesky_no_SDP_devuelve_None():
    assert alc.calculaCholesky(np.array([[1.0, 2.0], [2.0, 1.0]])) is None


# ======================================================================
# LABO 5
# ======================================================================
@parametrize("n", [2, 4, 7])
@labo(5)
def test_QR_GS(n):
    A = np.random.default_rng(n).random((n, n)) + np.eye(n)
    Q, R = alc.QR_con_GS(A)
    info(f"n={n}: |A-QR|={np.abs(A - Q @ R).max():.2e}  |QtQ-I|={np.abs(Q.T @ Q - np.eye(n)).max():.2e}")
    assert np.allclose(Q @ R, A)
    assert np.allclose(Q.T @ Q, np.eye(n), atol=1e-8)
    assert np.allclose(R, np.triu(R))

@labo(5)
def test_QR_GS_nops_y_no_cuadrada():
    A = np.random.default_rng(0).random((3, 3)) + np.eye(3)
    res = alc.QR_con_GS(A, retorna_nops=True)
    assert len(res) == 3 and res[2] > 0 # type: ignore
    assert alc.QR_con_GS(np.ones((3, 2))) is None

@parametrize("m, n", [(3, 3), (5, 3), (6, 6), (8, 4)])
@labo(5)
def test_QR_HH(m, n):
    A = np.random.default_rng(m * 10 + n).random((m, n))
    Q, R = alc.QR_con_HH(A)
    info(f"{m}x{n}: |A-QR|={np.abs(A - Q @ R).max():.2e}  |QtQ-I|={np.abs(Q.T @ Q - np.eye(m)).max():.2e}")
    assert np.allclose(Q @ R, A, atol=1e-8)
    assert np.allclose(Q.T @ Q, np.eye(m), atol=1e-8)
    assert np.allclose(R, np.triu(R), atol=1e-8)

@labo(5)
def test_QR_HH_m_menor_que_n_devuelve_None():
    assert alc.QR_con_HH(np.ones((2, 4))) is None

@labo(5)
def test_QR_HH_extras():
    A = np.random.default_rng(0).random((4, 4))
    Q, R, extra = alc.QR_con_HH(A, extras=True)
    assert len(extra['R_matrices']) == len(extra['Q_matrices']) > 0

@parametrize("metodo", ['RH', 'GS'])
@labo(5)
def test_calculaQR_metodos(metodo):
    A = np.random.default_rng(1).random((4, 4)) + np.eye(4)
    Q, R = alc.calculaQR(A, metodo=metodo)
    assert np.allclose(Q @ R, A, atol=1e-8)

@labo(5)
def test_calculaQR_metodo_invalido():
    assert alc.calculaQR(np.eye(3), metodo='XX') is None

@parametrize("fact", ['LU', 'QR'])
@labo(5)
def test_resolver_inversa(fact):
    A = dd_random(5, np.random.default_rng(9))
    assert np.allclose(alc.resolver_inversa(A, fact), np.linalg.inv(A), atol=1e-8) # type: ignore

@labo(5)
def test_resolver_inversa_singular_o_invalida():
    assert alc.resolver_inversa(np.array([[1.0, 2.0], [2.0, 4.0]]), 'LU') is None
    assert alc.resolver_inversa(np.eye(3), 'XX') is None
    assert alc.resolver_inversa(np.ones((2, 3)), 'LU') is None

@parametrize("metodo", ['LU', 'RH'])
@labo(5)
def test_nucleo2_matriz_de_rango_deficiente(metodo):
    A = np.array([[1.0, 1.0, 0.0], [0.0, 1.0, 1.0], [1.0, 2.0, 1.0]])   # fila3 = fila1 + fila2
    N = alc.nucleo2(A, metodo=metodo)
    assert N is not None, "nucleo2 devolvio None"
    info(f"{metodo}: dim del nucleo={N.shape[1]}  |A N|={np.abs(A @ N).max():.2e}")
    assert N.shape == (3, 1)
    assert np.allclose(A @ N, 0, atol=1e-8)

@labo(5)
def test_nucleo2_nucleo_trivial():
    N = alc.nucleo2(np.eye(3), metodo='LU')
    assert N is not None and np.size(N) in (0, 3) and np.allclose(N, 0)


# ======================================================================
# LABO 6
# ======================================================================
# ---------- f_A ----------
@labo(6)
def test_f_A_normaliza():
    A = np.array([[2.0, 0.0], [0.0, 1.0]])
    w = alc.f_A(A, np.array([1.0, 1.0]))
    assert np.linalg.norm(w) == approx(1.0)

@labo(6)
def test_f_A_vector_nulo():
    assert np.allclose(alc.f_A(np.zeros((2, 2)), np.array([1.0, 1.0])), 0)

@labo(6)
def test_f_A_en_autovector():
    A = np.array([[2.0, 0.0], [0.0, 1.0]])
    assert np.allclose(alc.f_A(A, np.array([1.0, 0.0])), [1.0, 0.0])
    assert np.allclose(alc.f_A(-A, np.array([1.0, 0.0])), [-1.0, 0.0])   # signo(lambda)

# ---------- metpot2k ----------
@parametrize("A", [
    np.array([[2.0, 0.0], [0.0, 1.0]]),
    np.array([[2.0, 1.0], [1.0, 2.0]]),
    np.array([[1.0, 3.0, 5.0], [3.0, 2.0, 7.0], [5.0, 7.0, 3.0]]),
])
@labo(6)
def test_metpot2k_autovalor_dominante(A):
    res = alc.metpot2k(A, tol=1e-12, K=5000)
    assert res is not None, "metpot2k devolvio None (deberia devolver su ultima estimacion)"
    v, lam, k, err = res
    w = np.linalg.eigvalsh(A)
    ref = w[np.argmax(abs(w))]
    info(f"lambda={lam:.8f}  numpy={ref:.8f}  iteraciones={k}  err={err:.2e}")
    assert lam == approx(ref, abs=1e-5)
    assert np.allclose(A @ v, lam * v, atol=1e-5)

@labo(6)
def test_metpot2k_no_cuadrada():
    assert alc.metpot2k(np.ones((2, 3))) is None

# ---------- producto externo y Householder ----------
@labo(6)
def test_producto_externo():
    v, w = np.array([1.0, 2.0, 3.0]), np.array([4.0, 5.0, 6.0])
    assert np.allclose(alc.producto_externo(v, w), np.outer(v, w)) # type: ignore

@labo(6)
def test_producto_externo_invalido():
    assert alc.producto_externo(np.ones(3), np.ones(2)) is None
    assert alc.producto_externo(np.ones((2, 2)), np.ones(2)) is None

@parametrize("n", [2, 3, 6])
@labo(6)
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
@parametrize("A", [
    np.array([[0.5, 0.5], [0.5, 0.5]]),
    np.array([[1.5, 0.5, 0.0], [0.5, 1.5, 0.0], [0.0, 0.0, 1.0]]),
    np.array([[1.0, 3.0, 5.0], [3.0, 2.0, 7.0], [5.0, 7.0, 3.0]]),
], ids=["A1_2x2", "A2_3x3", "A3_3x3"])
@labo(6)
def test_diagRH_matrices_del_enunciado(A):
    S, D = alc.diagRH(A, tol=1e-12, K=5000)
    assert S is not None, "diagRH devolvio None para una matriz simetrica"
    obt, esp = np.sort(np.diag(D)), np.sort(np.linalg.eigvalsh(A))
    info(f"obtenidos={np.round(obt, 6)}  esperados={np.round(esp, 6)}")
    assert np.allclose(obt, esp, atol=1e-5)

@parametrize("n", [2, 3, 5, 8, 12])
@labo(6)
def test_diagRH_reconstruye_A(n):
    rng = np.random.default_rng(42)
    peor, nones = 0.0, 0
    for _ in range(20):
        A = sim_random(n, rng)
        S, D = alc.diagRH(A, tol=1e-12, K=5000)
        if S is None:
            nones += 1
            continue
        peor = max(peor, np.abs(A - S @ D @ S.T).max()) # type: ignore
    info(f"n={n}: {20 - nones}/20 ok, None={nones}, peor error |A-SDSt|={peor:.2e}")
    assert nones == 0, f"{nones}/20 matrices devolvieron None"
    assert peor < 1e-3

@parametrize("n", [3, 6, 10])
@labo(6)
def test_diagRH_S_ortogonal_y_D_diagonal(n):
    S, D = alc.diagRH(sim_random(n, np.random.default_rng(7)), tol=1e-12, K=5000)
    assert S is not None
    err_orto = np.abs(S @ S.T - np.eye(n)).max()
    fuera = np.abs(D - np.diag(np.diag(D))).max() 
    info(f"n={n}: |SSt-I|={err_orto:.2e}  fuera de diagonal en D={fuera:.2e}")
    assert err_orto < 1e-8 and fuera == 0.0

@labo(6)
def test_diagRH_no_simetrica_devuelve_None():
    S, D = alc.diagRH(np.array([[1.0, 2.0], [3.0, 4.0]]))
    assert S is None and D is None

@labo(6)
def test_diagRH_menor_tol_menor_error():
    """Ejercicio 3d: el error baja al bajar tol (n=10)."""
    A = sim_random(10, np.random.default_rng(11))
    errs = []
    for tol in [1e-2, 1e-6, 1e-10]:
        S, D = alc.diagRH(A, tol=tol, K=20000)
        assert S is not None
        errs.append(np.abs(A - S @ D @ S.T).max()) # type: ignore
    info("error segun tol (1e-2, 1e-6, 1e-10): " + "  ".join(f"{e:.1e}" for e in errs))
    assert errs[2] < errs[0]

# ======================================================================
# LABO 7  (tests de la catedra, adaptados)
# Los nombres de las funciones son los de la consigna:
#   transiciones_al_azar_continuas, transiciones_al_azar_uniformes, nucleo,
#   crea_rala, multiplica_rala_vector
# ======================================================================
def es_markov(T, tol=1e-6):
    n = T.shape[0]
    for i in range(n):
        for j in range(n):
            if T[i, j] < 0:
                return False
    for j in range(n):
        if np.abs(sum(T[:, j]) - 1) > tol:
            return False
    return True

def es_markov_uniforme(T, thres=1e-6):
    if not es_markov(T, thres):
        return False
    for j in range(T.shape[1]):
        non_zero = T[:, j][T[:, j] > thres]
        if not all(np.abs(non_zero - non_zero[0]) < thres):
            return False
    return True

def esNucleo(A, S, tol=1e-5):
    """True si las columnas de S estan en el nucleo de A (no chequea que sea todo el nucleo)."""
    for col in S.T:
        if not np.allclose(A @ col, np.zeros(A.shape[0]), atol=tol):
            return False
    return True

@labo(7)
def test_nombres_de_las_funciones_de_la_consigna():
    esperadas = ["transiciones_al_azar_continuas", "transiciones_al_azar_uniformes",
                 "nucleo", "crea_rala", "multiplica_rala_vector"]
    faltan = [f for f in esperadas if not hasattr(alc, f)]
    parecidas = [x for x in dir(alc) if x.startswith(("transiciones", "crea", "crear", "multiplic"))]
    assert not faltan, f"faltan en alc.py: {faltan}  (funciones parecidas que si tenes: {parecidas})"

@labo(7)
def test_transiciones_al_azar_continuas_n_1_a_99():
    f = f_alc("transiciones_al_azar_continuas")
    for i in range(1, 100):
        assert es_markov(f(i)), f"transiciones_al_azar_continuas fallo para n={i}"
    info("n = 1..99 son matrices de Markov")

@labo(7)
@parametrize("thres", [0.3, 0.01])
def test_transiciones_al_azar_uniformes_n_1_a_99(thres):
    f = f_alc("transiciones_al_azar_uniformes")
    for i in range(1, 100):
        # Recuerden: la suma de columnas DEBE ser 1, no valen columnas nulas (caso borde con thres chico)
        for _ in range(5):
            assert es_markov_uniforme(f(i, thres)), f"transiciones_al_azar_uniformes fallo para n={i}, thres={thres}"
    info(f"n = 1..99 (5 matrices cada uno) con thres={thres}: todas uniformes y de Markov")

@labo(7)
def test_nucleo_identidad():
    A = np.eye(3)
    S = f_alc("nucleo")(A)
    assert S.shape[0] == 0, f"nucleo fallo para matriz identidad: esperaba un resultado vacio (shape[0]==0) y dio shape {S.shape}"

@labo(7)
def test_nucleo_matriz_con_un_cero_en_diagonal():
    A = np.eye(3); A[1, 1] = 0
    S = f_alc("nucleo")(A)
    msg = "nucleo fallo para matriz con un cero en diagonal"
    assert S.shape == (3, 1), f"{msg}: shape {S.shape}, se esperaba (3, 1)"
    info(f"nucleo = {np.round(S[:, 0], 6)}")
    assert esNucleo(A, S), msg
    assert abs(S[2, 0]) < 1e-2, msg
    assert abs(S[0, 0]) < 1e-2, msg

@labo(7)
def test_nucleo_proyeccion_ortogonal():
    v = np.random.random(5); v = v / np.linalg.norm(v)
    H = np.eye(5) - np.outer(v, v)
    S = f_alc("nucleo")(H)
    msg = "nucleo fallo para matriz de proyeccion ortogonal"
    assert S.shape == (5, 1), f"{msg}: shape {S.shape}, se esperaba (5, 1)"
    v_gen = S[:, 0] / np.linalg.norm(S[:, 0])
    assert np.allclose(v, v_gen) or np.allclose(v, -v_gen), msg

@labo(7)
def test_crea_rala_basico():
    A, dims = f_alc("crea_rala")([[0, 17], [3, 4], [0.5, 0.25]], 32, 89)
    assert dims == (32, 89), "crea_rala fallo en dimensiones"
    assert A[(0, 3)] == 0.5, "crea_rala fallo"
    assert A[(17, 4)] == 0.25, "crea_rala fallo"
    assert len(A) == 2, "crea_rala fallo en cantidad de elementos"

@labo(7)
def test_crea_rala_tres_elementos():
    A, dims = f_alc("crea_rala")([[32, 16, 5], [3, 4, 7], [7, 0.5, 0.25]], 50, 50)
    assert dims == (50, 50), "crea_rala fallo en dimensiones"
    assert A.get((32, 3)) == 7
    assert A[(16, 4)] == 0.5
    assert A[(5, 7)] == 0.25

@labo(7)
def test_crea_rala_descarta_menores_a_tol():
    A, dims = f_alc("crea_rala")([[1, 2, 3], [4, 5, 6], [1e-20, 0.5, 0.25]], 10, 10)
    assert dims == (10, 10), "crea_rala fallo en dimensiones con tol"
    assert (1, 4) not in A, "no descarto el elemento 1e-20"
    assert A[(2, 5)] == 0.5
    assert A[(3, 6)] == 0.25
    assert len(A) == 2

@labo(7)
def test_crea_rala_lista_vacia():
    A, dims = f_alc("crea_rala")([], 10, 10)
    assert dims == (10, 10), "crea_rala fallo en dimensiones con lista vacia"
    assert len(A) == 0, "crea_rala fallo en cantidad de elementos con lista vacia"

@labo(7)
def test_multiplica_rala_vector_diagonal():
    A_rala = f_alc("crea_rala")([[0, 1, 2], [0, 1, 2], [1, 2, 3]], 3, 3)
    v = np.random.random(3); v = v / np.linalg.norm(v)
    res = f_alc("multiplica_rala_vector")(A_rala, v)
    assert np.allclose(res, np.diag([1, 2, 3]) @ v), "multiplica_rala_vector fallo"

@labo(7)
def test_multiplica_rala_vector_random():
    A = np.random.random((5, 5)); A = A * (A > 0.5)
    listado = [[], [], []]
    for i in range(5):
        for j in range(5):
            listado[0].append(i); listado[1].append(j); listado[2].append(A[i, j])
    A_rala = f_alc("crea_rala")(listado, 5, 5)
    v = np.random.random(5)
    assert np.allclose(f_alc("multiplica_rala_vector")(A_rala, v), A @ v)


# ===========================================================================
#                              RUNNER (no tocar)
# ===========================================================================
def _recolectar():
    tests = []
    for nombre, fn in list(globals().items()):
        if not (nombre.startswith("test_") and callable(fn) and hasattr(fn, "_labo")):
            continue
        nombres, valores, ids = getattr(fn, "_casos", (None, [()], None))
        multi = nombres is not None and "," in nombres
        for idx, v in enumerate(valores):
            if nombres is None:
                args, etiqueta = (), ""
            else:
                args = tuple(v) if multi else (v,)
                if ids:
                    etiqueta = f"[{ids[idx]}]"
                elif not multi and isinstance(v, (int, float, str)):
                    etiqueta = f"[{v}]"
                else:
                    etiqueta = f"[{idx}]"
            tests.append({"labo": fn._labo, "nombre": nombre + etiqueta, "base": nombre, "fn": fn, "args": args}) # type: ignore
    return tests

def _detalle_error(e):
    tb = traceback.extract_tb(e.__traceback__)
    este = os.path.abspath(__file__)
    propios = [f for f in tb if os.path.abspath(f.filename) == este]
    lineas = []
    msg = str(e)
    lineas.append(f"{type(e).__name__}: {msg}" if msg else type(e).__name__)
    if propios:
        lineas.append(f"en el test, linea {propios[-1].lineno}:  {propios[-1].line}")
    ultimo = tb[-1]
    if os.path.abspath(ultimo.filename) != este:
        lineas.append(f"dentro de {os.path.basename(ultimo.filename)}, linea {ultimo.lineno} ({ultimo.name}):  {ultimo.line}")
    return lineas

def _correr(t, ruido):
    _buf.clear()
    salida = io.StringIO()
    t0 = time.time()
    estado, detalle = "OK", []
    try:
        ctx = contextlib.nullcontext() if ruido else contextlib.redirect_stdout(salida)
        with ctx:
            t["fn"](*t["args"])
    except Saltar as e:
        estado, detalle = "SKIP", [str(e)]
    except NotImplementedError as e:
        estado, detalle = "PEND", [str(e) or "funcion sin implementar"]
    except AssertionError as e:
        estado, detalle = "FAIL", _detalle_error(e)
    except Exception as e:
        estado, detalle = "ERROR", _detalle_error(e)
    return estado, detalle, list(_buf), time.time() - t0

def _parse_args(argv):
    opts = {"labos": set(), "k": None, "x": False, "f": False, "lista": False, "ruido": False, "ayuda": False}
    i = 0
    while i < len(argv):
        a = argv[i]
        if a in ("-h", "--help"):       opts["ayuda"] = True
        elif a == "-x":                 opts["x"] = True
        elif a == "-f":                 opts["f"] = True
        elif a == "--lista":            opts["lista"] = True
        elif a == "--ruido":            opts["ruido"] = True
        elif a == "--sin-color":        pass
        elif a == "-k" and i + 1 < len(argv):
            i += 1; opts["k"] = argv[i].lower()
        elif a.lower() in ("todos", "all"):
            pass
        else:
            a2 = a.lower().replace("labo", "")
            try:
                if "-" in a2:
                    x, y = a2.split("-"); opts["labos"].update(range(int(x), int(y) + 1))
                else:
                    opts["labos"].add(int(a2))
            except ValueError:
                sys.exit(rojo(f"No entiendo el argumento '{a}'. Usá -h para ver las opciones."))
        i += 1
    return opts

def main():
    opts = _parse_args(sys.argv[1:])
    if opts["ayuda"]:
        print(__doc__); return 0
    todos = _recolectar()
    disponibles = sorted({t["labo"] for t in todos})

    if opts["lista"]:
        print(negrita("Labos disponibles:"))
        for l in disponibles:
            print(f"  Labo {l}: {sum(1 for t in todos if t['labo'] == l)} tests")
        print(f"\nEjemplos:  python test_alc.py 6     |     python test_alc.py 4-6     |     python test_alc.py")
        return 0

    elegidos = opts["labos"] or set(disponibles)
    inexistentes = sorted(elegidos - set(disponibles))
    if inexistentes:
        print(amarillo(f"Aviso: no hay tests para el/los labo(s) {inexistentes}. Disponibles: {disponibles}"))
    sel = [t for t in todos if t["labo"] in elegidos and (not opts["k"] or opts["k"] in t["nombre"].lower())]
    if not sel:
        print(rojo("No hay tests para esa seleccion.")); return 1

    cuentas = {}      # labo -> {estado: n}
    fallos = []
    labo_actual = None
    cortar = False
    t_ini = time.time()
    for t in sel:
        if t["labo"] != labo_actual:
            labo_actual = t["labo"]
            n_labo = sum(1 for x in sel if x["labo"] == labo_actual)
            print("\n" + negrita(f"━━━━━━━━ LABO {labo_actual} ({n_labo} tests) ━━━━━━━━"))
        estado, detalle, infos, dt = _correr(t, opts["ruido"])
        cuentas.setdefault(t["labo"], {}).setdefault(estado, 0)
        cuentas[t["labo"]][estado] += 1
        if estado in ("FAIL", "ERROR"):
            fallos.append(t)
        if estado == "OK" and opts["f"]:
            continue
        marca = {"OK": verde("✓ OK   "), "FAIL": rojo("✗ FAIL "), "ERROR": rojo("✗ ERROR"),
                 "SKIP": amarillo("- SKIP "), "PEND": amarillo("- PEND ")}[estado]
        print(f" {marca} {t['nombre']} {gris(f'({dt:.2f}s)')}")
        for m in infos:
            print(f"      {amarillo('->')} {m}")
        for d in detalle:
            col = rojo if estado in ("FAIL", "ERROR") else amarillo
            print("      " + col(d))
        if estado in ("FAIL", "ERROR") and opts["x"]:
            cortar = True
            break

    # ---------- resumen ----------
    print("\n" + negrita("════════════════ RESUMEN ════════════════"))
    tot = {"OK": 0, "FAIL": 0, "ERROR": 0, "SKIP": 0, "PEND": 0}
    for l in sorted(cuentas):
        c = cuentas[l]
        ok, mal = c.get("OK", 0), c.get("FAIL", 0) + c.get("ERROR", 0)
        sal = c.get("SKIP", 0) + c.get("PEND", 0)
        for k, v in c.items(): tot[k] += v
        icono = verde("✓") if mal == 0 else rojo("✗")
        print(f"  {icono} Labo {l}:  {verde(str(ok) + ' ok')}   "
              f"{(rojo(str(mal)) if mal else gris(str(mal))) + ' fallan'}   {gris(str(sal) + ' saltados/pendientes')}")
    mal = tot["FAIL"] + tot["ERROR"]
    sal = tot["SKIP"] + tot["PEND"]
    print(f"\n  TOTAL: {verde(str(tot['OK']) + ' ok')}, {(rojo(str(mal)) if mal else '0')} fallan, "
          f"{amarillo(str(sal))} saltados/pendientes  ({time.time() - t_ini:.1f}s)")
    if fallos:
        print("\n" + rojo("Tests que fallaron:"))
        for t in fallos:
            print(rojo(f"   Labo {t['labo']}: {t['nombre']}"))
        print(gris(f"\n  Para repetir uno:  python test_alc.py {fallos[0]['labo']} -k {fallos[0]['base']}"))
    if cortar:
        print(amarillo("\n(se detuvo en el primer fallo por -x)"))
    print()
    return 1 if fallos else 0

if __name__ == "__main__":
    sys.exit(main())