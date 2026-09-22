import os
import sys
import math
import numpy as np

# Permite ejecutar este archivo teniendo alc.py en la misma carpeta.
try:
    import alc
except ImportError:
    print("No se encontró 'alc.py'. Poné hub_alc.py en la misma carpeta que alc.py.")
    sys.exit(1)


# =========================
# Utilidades de interfaz
# =========================

RESET = "\033[0m"
BOLD = "\033[1m"
CYAN = "\033[96m"
BLUE = "\033[94m"
GREEN = "\033[92m"
YELLOW = "\033[93m"
RED = "\033[91m"
MAGENTA = "\033[95m"
DIM = "\033[2m"


def limpiar():
    os.system("cls" if os.name == "nt" else "clear")


def titulo(texto):
    print(f"{CYAN}{BOLD}{'═' * 64}{RESET}")
    print(f"{CYAN}{BOLD}  {texto.center(60)}{RESET}")
    print(f"{CYAN}{BOLD}{'═' * 64}{RESET}\n")


def pausa():
    input(f"\n{DIM}Presioná ENTER para continuar...{RESET}")


def mostrar_resultado(resultado):
    print(f"\n{GREEN}{BOLD}Resultado{RESET}")
    print(f"{GREEN}{'─' * 32}{RESET}")
    if isinstance(resultado, tuple):
        for i, parte in enumerate(resultado, 1):
            print(f"\n{YELLOW}{'Componente ' + str(i)}:{RESET}")
            print(parte)
    elif isinstance(resultado, dict):
        for clave, valor in resultado.items():
            print(f"\n{YELLOW}{clave}:{RESET}")
            print(valor)
    else:
        print(resultado)


def pedir_entero(mensaje):
    while True:
        try:
            return int(input(mensaje))
        except ValueError:
            print(f"{RED}Ingresá un número entero válido.{RESET}")


def pedir_float(mensaje):
    while True:
        try:
            return float(input(mensaje).replace(",", "."))
        except ValueError:
            print(f"{RED}Ingresá un número válido.{RESET}")


def parsear_matriz(texto):
    """Formato: 1 2 3; 4 5 6"""
    try:
        filas = [fila.strip() for fila in texto.split(";") if fila.strip()]
        if not filas:
            raise ValueError

        matriz = []
        largo = None
        for fila in filas:
            valores = [float(x) for x in fila.replace(",", ".").split()]
            if not valores:
                raise ValueError
            if largo is None:
                largo = len(valores)
            elif len(valores) != largo:
                raise ValueError("Las filas deben tener la misma cantidad de elementos")
            matriz.append(valores)

        return np.array(matriz, dtype=float)
    except Exception:
        raise ValueError(
            "Formato inválido. Ejemplo: 1 2 3; 4 5 6"
        )


def pedir_matriz(nombre="A"):
    while True:
        print(f"{DIM}Ejemplo: 1 2 3; 4 5 6{RESET}")
        texto = input(f"{nombre} = ")
        try:
            A = parsear_matriz(texto)
            print(f"\n{DIM}{nombre} tiene dimensión {A.shape[0]}x{A.shape[1]}.{RESET}")
            return A
        except ValueError as e:
            print(f"{RED}{e}{RESET}\n")


def pedir_vector(nombre="v"):
    while True:
        texto = input(f"{nombre} = ")
        try:
            valores = [float(x) for x in texto.replace(",", ".").split()]
            if not valores:
                raise ValueError
            return np.array(valores, dtype=float)
        except ValueError:
            print(f"{RED}Formato inválido. Ejemplo: 1 2 3 4{RESET}")


def pedir_bool(mensaje):
    while True:
        r = input(f"{mensaje} [s/n]: ").strip().lower()
        if r in ("s", "si", "sí"):
            return True
        if r in ("n", "no"):
            return False
        print(f"{RED}Respondé con s o n.{RESET}")


def formatear_numero(x):
    if isinstance(x, (np.integer, int)):
        return str(int(x))
    if isinstance(x, (np.floating, float)):
        if abs(float(x) - round(float(x))) < 1e-10:
            return str(int(round(float(x))))
        return f"{float(x):.6g}"
    return str(x)


def mostrar_matriz(A):
    if isinstance(A, np.ndarray):
        print(np.array2string(A, precision=6, suppress_small=True))
    else:
        print(A)


# =========================
# Wrappers de funciones
# =========================


def op_matriz_simple(nombre, funcion):
    A = pedir_matriz("A")
    resultado = funcion(A)
    mostrar_matriz(resultado)


def op_estructura(nombre, funcion):
    A = pedir_matriz("A")
    resultado = funcion(A)
    mostrar_resultado(resultado)


def op_calcular_ax():
    A = pedir_matriz("A")
    x = pedir_vector("x")
    mostrar_resultado(alc.calcularAx(A, x))


def op_intercambiar_filas():
    A = pedir_matriz("A")
    i = pedir_entero("Índice de fila i (comienza en 0) = ")
    j = pedir_entero("Índice de fila j (comienza en 0) = ")
    alc.intercambiarFilas(A, i, j)
    mostrar_resultado(A)


def op_sumar_fila_multiplo():
    A = pedir_matriz("A")
    i = pedir_entero("Fila destino i (comienza en 0) = ")
    j = pedir_entero("Fila de referencia j (comienza en 0) = ")
    s = pedir_float("Múltiplo s = ")
    alc.sumar_fila_multiplo(A, i, j, s)
    mostrar_resultado(A)


def op_circulante():
    v = pedir_vector("v")
    mostrar_resultado(alc.matrizCirculante(v))


def op_vandermonde():
    v = pedir_vector("v")
    mostrar_resultado(alc.matrizVandermonde(v))


def op_aureo():
    n = pedir_entero("n = ")
    mostrar_resultado(alc.numeroAureo(n))


def op_fibonacci():
    n = pedir_entero("n = ")
    mostrar_resultado(alc.fibonacci(n))


def op_matriz_fibonacci():
    n = pedir_entero("n = ")
    mostrar_resultado(alc.matrizFiboncacci(n))


def op_error():
    x = pedir_float("x = ")
    y = pedir_float("y = ")
    mostrar_resultado(alc.error(x, y))


def op_error_relativo():
    x = pedir_float("x = ")
    y = pedir_float("y = ")
    mostrar_resultado(alc.error_relativo(x, y))


def op_matrices_iguales():
    A = pedir_matriz("A")
    B = pedir_matriz("B")
    mostrar_resultado(alc.matricesIguales(A, B))


def op_mult_matrices():
    A = pedir_matriz("A")
    B = pedir_matriz("B")
    mostrar_resultado(alc.mult_matrices(A, B))


def op_rota():
    theta = pedir_float("θ (en radianes) = ")
    mostrar_resultado(alc.rota(theta))


def op_escala():
    s = pedir_vector("s")
    mostrar_resultado(alc.escala(s))


def op_rota_escala():
    theta = pedir_float("θ (en radianes) = ")
    s = pedir_vector("s")
    mostrar_resultado(alc.rota_y_escala(theta, s))


def op_afin():
    theta = pedir_float("θ (en radianes) = ")
    s = pedir_vector("s")
    b = pedir_vector("b")
    mostrar_resultado(alc.afin(theta, s, b))


def op_trans_afin():
    v = pedir_vector("v")
    theta = pedir_float("θ (en radianes) = ")
    s = pedir_vector("s")
    b = pedir_vector("b")
    mostrar_resultado(alc.trans_afin(v, theta, s, b))


def pedir_p_norma():
    while True:
        p = input("p (por ejemplo 1, 2 o inf) = ").strip().lower()
        if p == "inf":
            return "inf"
        try:
            p = int(p)
            if p > 0:
                return p
        except ValueError:
            pass
        print(f"{RED}Ingresá un p positivo o 'inf'.{RESET}")


def op_norma():
    x = pedir_vector("x")
    p = pedir_p_norma()
    mostrar_resultado(alc.norma(x, p))


def op_normaliza():
    print(f"{DIM}Ingresá una matriz cuyas filas representen los vectores X.{RESET}")
    X = pedir_matriz("X")
    p = pedir_p_norma()
    mostrar_resultado(alc.normaliza(X, p))


def op_norma_mc():
    A = pedir_matriz("A")
    q = pedir_p_norma()
    p = pedir_p_norma()
    Np = pedir_entero("Cantidad de muestras Np = ")
    mostrar_resultado(alc.normaMatMC(A, q, p, Np))


def op_norma_exacta():
    A = pedir_matriz("A")
    opcion = input("Norma (1 / inf / ambas) = ").strip().lower()
    if opcion == "ambas":
        p = [1, "inf"]
    elif opcion == "inf":
        p = "inf"
    elif opcion == "1":
        p = 1
    else:
        print(f"{RED}Opción inválida.{RESET}")
        return
    mostrar_resultado(alc.normaExacta(A, p))


def op_cond_mc():
    A = pedir_matriz("A")
    p = pedir_p_norma()
    mostrar_resultado(alc.condMC(A, p))


def op_cond_exacto():
    A = pedir_matriz("A")
    p = pedir_p_norma()
    mostrar_resultado(alc.condExacto(A, p))


def op_gauss():
    A = pedir_matriz("A")
    L, U, cant_ops = alc.elim_gaussiana(A)
    mostrar_resultado({"L": L, "U": U, "Cantidad de operaciones": cant_ops})


def op_lu():
    A = pedir_matriz("A")
    L, U, cant_ops = alc.calculaLU(A)
    mostrar_resultado({"L": L, "U": U, "Cantidad de operaciones": cant_ops})


def op_res_tri():
    A = pedir_matriz("Matriz triangular L/U")
    b = pedir_vector("b")
    inferior = pedir_bool("¿Es triangular inferior?")
    mostrar_resultado(alc.res_tri(A, b, inferior))


def op_inversa():
    A = pedir_matriz("A")
    mostrar_resultado(alc.inversa(A))


def op_ldv():
    A = pedir_matriz("A")
    L, D, V = alc.calculaLDV(A)
    mostrar_resultado({"L": L, "D": D, "V": V})


def op_sdp():
    A = pedir_matriz("A")
    mostrar_resultado(alc.esSDP(A))

def op_cholesky():
    A = pedir_matriz("A")
    mostrar_resultado(alc.calculaCholesky(A))


def op_proyeccion():
    v = pedir_vector("v")
    w = pedir_vector("w")
    mostrar_resultado(alc.proyeccion(v, w))


def op_qr_gs():
    A = pedir_matriz("A")
    extra = pedir_bool("¿Querés además la cantidad de operaciones?")
    resultado = alc.QR_con_GS(A, retorna_nops=extra)
    mostrar_resultado(resultado)


def op_qr_hh():
    A = pedir_matriz("A")
    resultado = alc.QR_con_HH(A)
    mostrar_resultado(resultado)


def op_qr():
    A = pedir_matriz("A")
    while True:
        metodo = input("Método (GS / RH) = ").strip().upper()
        if metodo in ("GS", "RH"):
            break
        print(f"{RED}Elegí GS o RH.{RESET}")
    extra = pedir_bool("¿Querés información extra del proceso?")
    resultado = alc.calculaQR(A, metodo=metodo, extra=extra)
    mostrar_resultado(resultado)


# =========================
# Menús
# =========================

LABORATORIOS = {
    "LABO 00 - Matrices": [
        ("Es cuadrada", lambda: op_estructura("Es cuadrada", alc.esCuadrada)),
        ("Triangular superior", lambda: op_estructura("Triangular superior", alc.triangSup)),
        ("Triangular inferior", lambda: op_estructura("Triangular inferior", alc.triangInf)),
        ("Diagonal", lambda: op_estructura("Diagonal", alc.diagonal)),
        ("Traza", lambda: op_estructura("Traza", alc.traza)),
        ("Traspuesta", lambda: op_estructura("Traspuesta", alc.traspuesta)),
        ("Es simétrica", lambda: op_estructura("Es simétrica", alc.esSimetrica)),
        ("Calcular A·x", op_calcular_ax),
        ("Intercambiar filas", op_intercambiar_filas),
        ("Sumar múltiplo de fila", op_sumar_fila_multiplo),
        ("Dominancia diagonal", lambda: op_estructura("Dominancia diagonal", alc.esDiagonalmenteDominante)),
        ("Matriz circulante", op_circulante),
        ("Matriz de Vandermonde", op_vandermonde),
        ("Número áureo", op_aureo),
        ("Fibonacci", op_fibonacci),
        ("Matriz de Fibonacci", op_matriz_fibonacci),
        ("Matriz de Hilbert", lambda: mostrar_resultado(alc.matrizHilbert(pedir_entero("n = ")))),
    ],
    "LABO 01 - Error y operaciones": [
        ("Error absoluto", op_error),
        ("Error relativo", op_error_relativo),
        ("Matrices iguales", op_matrices_iguales),
        ("Multiplicar matrices", op_mult_matrices),
    ],
    "LABO 02 - Transformaciones": [
        ("Rotación", op_rota),
        ("Escala", op_escala),
        ("Rotación + escala", op_rota_escala),
        ("Transformación afín", op_afin),
        ("Transformar vector con afín", op_trans_afin),
    ],
    "LABO 03 - Normas": [
        ("Norma vectorial", op_norma),
        ("Normalizar vectores", op_normaliza),
        ("Norma matricial por Monte Carlo", op_norma_mc),
        ("Norma matricial exacta", op_norma_exacta),
        ("Número de condición Monte Carlo", op_cond_mc),
        ("Número de condición exacto", op_cond_exacto),
    ],
    "LABO 04 - LU": [
        ("Eliminación gaussiana", op_gauss),
        ("Factorización LU", op_lu),
        ("Resolver sistema triangular", op_res_tri),
        ("Matriz inversa", op_inversa),
        ("Factorización LDV", op_ldv),
        ("Es SDP", op_sdp),
        ("Factorizacion de Cholesky", op_cholesky)
    ],
    "LABO 05 - Proyección y QR": [
        ("Proyección de w sobre v", op_proyeccion),
        ("QR con Gram-Schmidt", op_qr_gs),
        ("QR con Householder", op_qr_hh),
        ("Factorización QR (elegir método)", op_qr),
    ],
}


def seleccionar_opcion(items, prompt="Elegí una opción"): 
    while True:
        valor = input(f"\n{prompt}: ").strip()
        try:
            n = int(valor)
            if 0 <= n <= len(items):
                return n
        except ValueError:
            pass
        print(f"{RED}Opción inválida.{RESET}")


def menu_laboratorio(nombre, items):
    while True:
        limpiar()
        titulo(nombre)
        for i, (texto, _) in enumerate(items, 1):
            print(f"  {CYAN}{i:>2}{RESET}  {texto}")
        print(f"\n  {RED} 0{RESET}  ← Volver")

        opcion = seleccionar_opcion(items)
        if opcion == 0:
            return

        limpiar()
        titulo(f"{nombre}  ·  {items[opcion - 1][0]}")
        try:
            items[opcion - 1][1]()
        except Exception as e:
            print(f"\n{RED}{BOLD}Ocurrió un error:{RESET} {e}")
        pausa()


def main():
    while True:
        limpiar()
        titulo("HUB · ÁLGEBRA LINEAL COMPUTACIONAL")
        print(f"{DIM}Funciones disponibles en tu alc.py{RESET}\n")

        nombres = list(LABORATORIOS.keys())
        for i, nombre in enumerate(nombres, 1):
            print(f"  {MAGENTA}{i}{RESET}  {nombre}  {DIM}({len(LABORATORIOS[nombre])} funciones){RESET}")

        print(f"\n  {RED}0{RESET}  Salir")
        opcion = seleccionar_opcion(LABORATORIOS)

        if opcion == 0:
            limpiar()
            print(f"{GREEN}¡Listo! Hasta la próxima.{RESET}")
            break

        nombre = nombres[opcion - 1]
        menu_laboratorio(nombre, LABORATORIOS[nombre])


if __name__ == "__main__":
    main()
