import numpy as np

epsilon = np.finfo(np.float64).eps

print(f"ε (epsilon): {epsilon}\n")

# Inciso a)
print("Inciso a)\n")
p = 1e34
print(f"p: {p}")
q = 1
print(f"q: {q}")
print(f"p + q - p: {p + q - p}\n")

# Inciso b)
print("Inciso b)\n")
p = 100
print(f"p: {p}")
q = 1e-15
print(f"q: {q}")
print(f"(p + q) + q: {(p + q) + q}")
print(f"p + 2*q: {p + 2*q}")
print(f"((p + q) + q) + q: {((p + q) + q) + q}")
print(f"p + 3*q: {p + 3*q}\n")

# Inciso c)
print("Inciso c)\n")
print(f"0.1 + 0.2 == 0.3: {0.1 + 0.2 == 0.3}")
print(f"0.1 + 0.2: {0.1 + 0.2}\n")

# Inciso d)
print("Inciso d)\n")
print(f"0.1 + 0.3 == 0.4: {0.1 + 0.3 == 0.4}")
print(f"0.1 + 0.3: {0.1 + 0.3}\n")

# Inciso e)
print("Inciso e)\n")
val_e = 1e-323
print(f"1e-323: {val_e}\n")

# Inciso f)
print("Inciso f)\n")
val_f = 1e-324
print(f"1e-324: {val_f}\n")

# Inciso g)
print("Inciso g)\n")
print(f"epsilon / 2: {epsilon / 2}\n")

# Inciso h)
print("Inciso h)\n")
res_h = (1 + epsilon / 2) + epsilon / 2
print(f"(1 + ε/2) + ε/2: {res_h}\n")

# Inciso i)
print("Inciso i)\n")
res_i = 1 + (epsilon / 2 + epsilon / 2)
print(f"1 + (ε/2 + ε/2): {res_i}\n")

# Inciso j)
print("Inciso j)\n")
res_j = ((1 + epsilon / 2) + epsilon / 2) - 1
print(f"((1 + ε/2) + ε/2) - 1: {res_j}\n")

# Inciso k)
print("Inciso k)\n")
res_k = (1 + (epsilon / 2 + epsilon / 2)) - 1
print(f"(1 + (ε/2 + ε/2)) - 1: {res_k}\n")

# Inciso l)
print("Inciso l)\n")
for j in range(1, 26):
    res_l = np.sin((10**j) * np.pi)
    print(f"j = {j:2d} -> sen(10^{j} * π) = {res_l}")
print()

# Inciso m)
print("Inciso m)\n")
for j in range(1, 26):
    res_m = np.sin(np.pi / 2 + (10**j) * np.pi)
    print(f"j = {j:2d} -> sen(π/2 + 10^{j} * π) = {res_m}")
print()

#
# Ejercicio 20
#

# Inciso c

# A = np.array([[3, 0, 0],[0, 5/4, 3/4], [0, 3/4, 5/4]])
# print(f"A = {A}\n")

# norma_A = np.linalg.norm(A, np.inf)
# print(f"||A||∞ = {norma_A}\n")


# A_inv = np.linalg.inv(A)
# print(f"A_inv = {A_inv}\n")

# norma_A_inv = np.linalg.norm(A_inv, np.inf)
# print(f"||A_inv||∞ = {norma_A_inv}\n")

# numero_condicion_a_mano = norma_A*norma_A_inv

# print(f"Numero de condicion calculada a mano = {numero_condicion_a_mano}\n")

# print(f"Numero de condicion calculada numpy = {np.linalg.cond(A, np.inf)}\n")

# b = np.array([3,2,2])
# print(f"b = {b}\n")

# b_trasuesta = b.reshape(3,1)
# print(f"b_traspuesta = {b_trasuesta}\n")

# x = np.linalg.solve(A,b).reshape(3,1)
# print(f"x = {x}\n")

# Matriz A, vector b exacto y solución exacta x
A = np.array([[3.0, 0.0, 0.0],
              [0.0, 1.25, 0.75],
              [0.0, 0.75, 1.25]])

b = np.array([3.0, 2.0, 2.0])
x = np.array([1.0, 1.0, 1.0])

print(f"A = {A}")
print(f"b = {b}")
print(f"x = {x}")

# Condición en norma infinito y normas de referencia
cond_inf = np.linalg.cond(A, np.inf)
norm_b_inf = np.linalg.norm(b, np.inf)
norm_x_inf = np.linalg.norm(x, np.inf)

print(f"cond(A) = {cond_inf}")
print(f"||b||∞ = {norm_b_inf}")
print(f"||x||∞ = {norm_x_inf}")

# Cota máxima admisible para ||b - b_tilde||_inf
cota_error_rel_b = 1e-4 / cond_inf
cota_delta_b = cota_error_rel_b * norm_b_inf

print(f"cond_inf(A): {cond_inf}")
print(f"Cota requerida para ||b - b_tilde||_inf: < {cota_delta_b:.6e}\n")

# Realizamos 5 experimentos numéricos
np.random.seed(42)  # Semilla fija para reproducibilidad
num_experimentos = 5

for k in range(1, num_experimentos + 1):
    # Vector aleatorio con componentes en [-1, 1]
    v_rand = np.random.uniform(-1.0, 1.0, size=3)
    
    # Normalizamos por ||v||_inf y escalamos justo por debajo de la cota teórica
    delta_b = (v_rand / np.linalg.norm(v_rand, np.inf)) * (cota_delta_b * 0.999)
    
    # Vector b perturbado
    b_tilde = b + delta_b
    
    # Resolver el sistema perturbado A * x_tilde = b_tilde
    x_tilde = np.linalg.solve(A, b_tilde)
    
    # Cálculo de los errores en norma infinito
    error_x_inf = np.linalg.norm(x_tilde - x, np.inf)
    error_rel_x = error_x_inf / norm_x_inf
    
    print(f"Experimento {k}:")
    print(f"  ||b - b_tilde||_inf: {np.linalg.norm(delta_b, np.inf):.6e}")
    print(f"  ||x - x_tilde||_inf: {error_x_inf:.6e}")
    print(f"  ¿Es menor que 1e-4?: {error_x_inf < 1e-4}\n")