import numpy as np
import matplotlib.pyplot as plt

años = np.array([1950, 1955, 1960, 1965, 1970, 1975, 1980, 1985, 1990, 1995, 2000])

hab = np.array([17, 18.8, 20.5, 22.2, 23.9, 25.9, 27.9, 30.2, 32.6, 34.8, 36.9])

ln_y = np.log(hab) 

p_coefs_5 = np.polyfit(años, ln_y, 5)
p_coefs_1 = np.polyfit(años, ln_y, 1)

x_recta = np.linspace(años.min(), años.max(), 100)

y_recta_p5 = np.exp(np.polyval(p_coefs_5, x_recta))
y_recta_p1 = np.exp(np.polyval(p_coefs_1, x_recta))

p5 = np.poly1d(p_coefs_5)
print("Polinomio de grado 5:")
print(p5)

p1 = np.poly1d(p_coefs_1)
print("Polinomio de grado 1:")
print(p1)

plt.figure(figsize=(8, 5))

# Puntos reales
# Puntos pares (índices 0, 2, 4...)
plt.scatter(años[::2], hab[::2], color='blue', label='Datos originales', s=50)

# Puntos impares (índices 1, 3, 5...)
plt.scatter(años[1::2], hab[1::2], color='red', label='Datos nuevos', s=50)

# Recta ajustada
plt.plot(x_recta, y_recta_p5, color='red', linestyle='--', label=f'Recta: y = {p_coefs_5[0]:.8f}x^5 + {p_coefs_5[1]:.4f}x^4 + {p_coefs_5[2]:.2f}x^3 + \n {p_coefs_5[3]:.2f}x^2 + {p_coefs_5[4]:.2f}x + {p_coefs_5[5]:.2f}')
plt.plot(x_recta, y_recta_p1, color='red', linestyle='--', label=f'Recta: y = {p_coefs_1[0]:.8f}x + {p_coefs_1[1]:.4f}')

# Etiquetas y título
plt.xlabel('Año')
plt.ylabel('Población (millones de habitantes)')
plt.title('Ajuste de Recta a la Población')
plt.grid(True, linestyle=':', alpha=0.6)
plt.legend()

# Mostrar gráfico
plt.show() #
