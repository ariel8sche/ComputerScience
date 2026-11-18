import numpy as np
import matplotlib.pyplot as plt

tiempo = np.array([0, 1, 2, 4, 6])
altura = np.array([200, 195, 180, 120, 25])

# 1. Cambio de variable (u = t^2)
u = tiempo**2

# 2. Ajuste lineal en u (grado 1) -> f(u) = a*u + b
p_coefs_1 = np.polyfit(u, altura, deg=1)
a, b = p_coefs_1

# -------------------------------------------------------------
# Figura con dos subplots para entender la correspondencia
# -------------------------------------------------------------
fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(13, 5))

# --- GRÁFICO 1: Plano Linealizado (u vs Altura) ---
u_recta = np.linspace(u.min(), u.max(), 100)
y_recta = a * u_recta + b

ax1.scatter(u, altura, color='blue', s=60, label='Datos transformados (u, y)')
ax1.plot(u_recta, y_recta, 'r--', label=f'Recta: $y = {a:.2f}u + {b:.2f}$')
ax1.set_xlabel('Variable $u = t^2$ ($s^2$)')
ax1.set_ylabel('Altura (m)')
ax1.set_title('Plano Linealizado (u, y)')
ax1.grid(True, linestyle=':', alpha=0.6)
ax1.legend()

# --- GRÁFICO 2: Plano Físico Real (t vs Altura) ---
t_curva = np.linspace(tiempo.min(), tiempo.max(), 100)
y_parabola = a * (t_curva**2) + b   # f(t) = a*t^2 + b

ax2.scatter(tiempo, altura, color='red', s=60, label='Datos medidos (t, y)')
ax2.plot(t_curva, y_parabola, 'g-', label=f'Parábola: $f(t) = {a:.2f}t^2 + {b:.2f}$')
ax2.set_xlabel('Tiempo $t$ (s)')
ax2.set_ylabel('Altura (m)')
ax2.set_title('Plano Físico Original (t, y)')
ax2.grid(True, linestyle=':', alpha=0.6)
ax2.legend()

plt.tight_layout()
plt.show()