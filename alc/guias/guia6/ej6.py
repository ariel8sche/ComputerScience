import numpy as np
import matplotlib.pyplot as plt

años = np.array([1950, 1960, 1970, 1980, 1990, 2000])

hab = np.array([17, 20.5, 23.9, 27.9, 32.6, 36.9])

a, b = np.polyfit(años, hab, 1)

x_recta = np.linspace(años.min(), años.max(), 100)

y_recta = a * x_recta + b

plt.figure(figsize=(8, 5))

# Puntos reales
plt.scatter(años, hab, color='blue', label='Datos reales')

# Recta ajustada
plt.plot(x_recta, y_recta, color='red', linestyle='--', label=f'Recta: y = {a:.3f}x + {b:.2f}')

# Etiquetas y título
plt.xlabel('Año')
plt.ylabel('Población (millones de habitantes)')
plt.title('Ajuste de Recta a la Población')
plt.grid(True, linestyle=':', alpha=0.6)
plt.legend()

# Mostrar gráfico
plt.show() #

# Inciso b

def poblacionEn(año):
    return a*año + b

print(f"Poblacion en el año  1955 = {np.around(poblacionEn(1955), 1)}")
print(f"Poblacion en el año  1965 = {np.around(poblacionEn(1965), 1)}")
print(f"Poblacion en el año  1975 = {np.around(poblacionEn(1975), 1)}")
print(f"Poblacion en el año  1985 = {np.around(poblacionEn(1985), 1)}")
print(f"Poblacion en el año  1995 = {np.around(poblacionEn(1995), 1)}")
print(f"Poblacion en el año  2026 = {np.around(poblacionEn(2026), 1)}")

# Inciso c

años = np.array([1950, 1955, 1960, 1965, 1970, 1975, 1980, 1985, 1990, 1995, 2000])

hab = np.array([17, 18.8, 20.5, 22.2, 23.9, 25.9, 27.9, 30.2, 32.6, 34.8, 36.9])

a, b = np.polyfit(años, hab, 1)

x_recta = np.linspace(años.min(), años.max(), 100)

y_recta = a * x_recta + b

plt.figure(figsize=(8, 5))

# Puntos reales
# Puntos pares (índices 0, 2, 4...)
plt.scatter(años[::2], hab[::2], color='blue', label='Grupo 1', s=50)

# Puntos impares (índices 1, 3, 5...)
plt.scatter(años[1::2], hab[1::2], color='red', label='Grupo 2', s=50)

# Recta ajustada
plt.plot(x_recta, y_recta, color='red', linestyle='--', label=f'Recta: y = {a:.3f}x + {b:.2f}')

# Etiquetas y título
plt.xlabel('Año')
plt.ylabel('Población (millones de habitantes)')
plt.title('Ajuste de Recta a la Población')
plt.grid(True, linestyle=':', alpha=0.6)
plt.legend()

# Mostrar gráfico
plt.show() #