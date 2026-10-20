import numpy as np
import matplotlib.pyplot as plt

# Cargar datos
intersecciones = np.loadtxt("intersecciones.csv", delimiter=",", skiprows=1)
calles = np.loadtxt("ejes.csv", delimiter=",", skiprows=1)

# Para visualizar las intersecciones

id = intersecciones[:, 0].astype(int)
pos_x = intersecciones[:, 1]
pos_y = intersecciones[:, 2]

# Graficar nodos
plt.scatter(pos_x, pos_y, s=0.05, color="gray")
# Algunos puntos de ejemplo que pueden usarse para empezar la caminata
i_ejemplo = [10,2000,4000,5000,150,30000,23460]
for i in i_ejemplo:
    plt.scatter(pos_x[i], pos_y[i], s=30, color="blue")
plt.axis("equal")
plt.show()

# Para la matriz rala
# Generar i,j,aij
i = calles[:,0].astype(int)-1
j = calles[:,1].astype(int)-1
aij = calles[:,2]
n = max(id)
#v = np.array([0  if i != 5000 else 1 for i in range(len(id))])
#A = crea_rala([i,j,aij],n,n) 
#for _ in range(10):
#    v = multiplica_rala_vector(A,v)