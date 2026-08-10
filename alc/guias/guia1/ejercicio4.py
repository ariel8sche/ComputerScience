import numpy as np
import matplotlib.pyplot as plt
from pathlib import Path
import sys

# Añadir la carpeta padre al sys.path para poder importar row_echelon
sys.path.insert(0, str(Path(__file__).resolve().parent.parent))

from row_echelon import row_echelon

# Resolver

# parabola y = ax**2 + bx + c
# que pasa por los puntos (1,1) (2,2) y (3,0)

A = np.array([[1,1,1],[4,2,1],[9,3,1]])
b = np.array([1,2,0])

Ab = np.c_[A, b]

print(row_echelon(Ab))

a = -(3/2)
b = 11/2
c = -3

# Graficar

xx = np.array([1,2,3])
yy = np.array([1,2,0])
x = np.linspace(0,4,100)
f = lambda t: a*t**2+b*t+c
plt.plot(xx,yy,'*')
plt.plot(x, f(x))
plt.show()
