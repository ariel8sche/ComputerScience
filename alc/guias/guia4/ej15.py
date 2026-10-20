import numpy as np

def borracho(n, p):
    N = n + 1
    P = np.zeros((N, N))

    # Estados absorbentes
    P[0, 0] = 1.0          # Índice 0: Bar
    P[N - 1, N - 1] = 1.0  # Índice n: Casa

    # Transiciones intermedias
    for j in range(1, n):
        P[j - 1, j] = 1.0 - p  # Retrocede hacia el bar (j-1)
        P[j + 1, j] = p        # Avanza hacia la casa (j+1)

    return P

def simular_borracho(n, p, v0, max_iter=2000, tol=1e-8):
    P = borracho(n, p)
    v = v0.copy()

    print(f"--- Simulación para n = {n}, p = {p} ---")

    for paso in range(1, max_iter + 1):
        v_next = P @ v

        if np.linalg.norm(v_next - v, ord=1) < tol:
            print(f"Se estabilizó en el paso {paso}.")
            v = v_next
            break

        v = v_next

        if paso in [1, 5, 10, 20, 50, 100, 200, 300, 400]:
            print(f"Paso {paso:3d}: Bar (est 0) = {v[0]:.4f} | Casa (est {n}) = {v[-1]:.4f} | Intermedios = {np.sum(v[1:n]):.4f}")

    print(f"Estado límite v^(inf):\n{np.round(v, 4)}\n")
    return P, v

# Configuración
n = 20
N = n + 1

# --- Ítem (b): v0 equiprobable intermedio, p = 0.5 ---
v_b = np.zeros(N, dtype=np.float64)
v_b[1:n] = 1.0 / (n - 1)
print("=== Ítem (b): p = 0.5, v0 equiprobable ===")
P_b, v_lim_b = simular_borracho(n, 0.5, v_b)

# --- Ítem (c): v0 = e2, p = 0.5 ---
v_c = np.zeros(N, dtype=np.float64)
v_c[1] = 1.0
print("=== Ítem (c): p = 0.5, v0 = e2 ===")
P_c, v_lim_c = simular_borracho(n, 0.5, v_c)

# --- Ítem (d): Repetir con p = 0.8 ---
print("=== Ítem (d): p = 0.8, v0 equiprobable ===")
P_d1, v_lim_d1 = simular_borracho(n, 0.8, v_b)

print("=== Ítem (d): p = 0.8, v0 = e2 ===")
P_d2, v_lim_d2 = simular_borracho(n, 0.8, v_c)
