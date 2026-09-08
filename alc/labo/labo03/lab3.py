import numpy as np
import matplotlib.pyplot as plt 

# EJERCICIO 1

# INCISO A

def norma(x, p):
    n = len(x)

    norma = 0

    if (p == 'inf'):
        return max(abs(xi) for xi in x)

    for i in range (0, n, 1):
        norma += (abs(x[i]))**p

    return norma**(1/p)

# INCISO B

def normaliza(X,p):
    Y = []

    for x in X:

        Y.append(np.array(x)/norma(x,p))

    return Y

def graficar():

    valores_p = [1,2,5,10,100,200,'inf']

    x = np.linspace(-1,1,1000)

    plt.figure(figsize=(8,8))

    for p in valores_p:

        if (p == 'inf'):
            # Norma infinito:
            # max(|x|, |y|) = 1
            plt.plot(
                [-1, 1, 1, -1, -1],
                [-1, -1, 1, 1, -1],
                '--',
                color='black',
                label='p = ∞'
            )
        else:
            # De |x|^p + |y|^p = 1 despejamos y
            y = (1 - np.abs(x)**p)**(1/p)

            # Parte superior e inferior
            plt.plot(x, y, label=f'p = {p}')
            plt.plot(x, -y, color=plt.gca().lines[-1].get_color())


    plt.axhline(0, color='gray', linewidth=0.5)
    plt.axvline(0, color='gray', linewidth=0.5)

    plt.xlabel('x')
    plt.ylabel('y')
    plt.title('Vectores de R² con norma p igual a 1')
    plt.axis('equal')
    plt.grid(True)
    plt.legend()

    plt.show()


def graficar2():
    valores_p = [1, 2, 5, 10, 100, 200, 'inf']

    plt.figure(figsize=(8, 8))

    # Puntos sobre una circunferencia
    theta = np.linspace(0, 2*np.pi, 1000)

    for p in valores_p:

        # Generamos vectores (x,y)
        X = np.array([[np.cos(t), np.sin(t)] for t in theta])

        # Los normalizamos con nuestra función
        Y = normaliza(X, p)

        # Graficamos
        Y = np.array(Y)

        plt.plot(Y[:, 0], Y[:, 1], label=f'p = {p}')

    plt.axis('equal')
    plt.grid()
    plt.legend()
    plt.xlabel('x')
    plt.ylabel('y')
    plt.title('Vectores con norma p = 1')

    plt.show()


# graficar()
# graficar2()

# Ejercicio 2

# Inciso a

def normaMatMC(A, q, p, Np):
    # Me guardo el n pq los vectores tienen que ser de R^n
    n = A.shape[1]
    
    # Genera Np vectores aleatorios en R^n
    X = [np.random.randn(n) for _ in range(Np)]
    
    # Normalizo los vectores
    X = normaliza(X, p)
    
    max_norma = 0
    best_x = 0
    for x in X:
        # Obtengo b, multuplicando A por el vector x (Ax = b)
        b = A @ x
        
        # Calculo la norma de b ( ||b||q )
        norma_b = norma(b,q)
        
        # Busco el maximo
        if (norma_b > max_norma):
            max_norma = norma_b
            best_x = x

    # Retorna la norma estimada y el vector x que la maximiza
    return [max_norma, best_x]

# Inciso b

def normaExacta(A,p):
    n, m = A.shape  # m filas, n columnas
    
    if (p == 'inf'):
        sum_filas = []
        for i in range(0, n, 1):
            fila = 0
            for j in range(0, m, 1):
                fila += abs(A[i][j])
            sum_filas.append(fila)
        norma_A = max(sum_filas)
    elif (p == 1):
        sum_columnas = []
        for j in range(0, m, 1):
            columna = 0
            for i in range(0, n, 1):
                columna += abs(A[i][j])
            sum_columnas.append(columna)
        norma_A = max(sum_columnas)
        
    else:
        return None 
    
    return norma_A

def condMC(A, p):
    A_inv = np.linalg.inv(A)
    
    norma_A = normaMatMC(A,p,p,1000)[0]
    norma_A_inv = normaMatMC(A_inv,p,p,1000)[0]
    
    return (norma_A)*(norma_A_inv)

def condExacto(A, p):
    A_inv = np.linalg.inv(A)
    
    norma_A = normaExacta(A, p)
    norma_A_inv = normaExacta(A_inv, p)
    
    return norma_A * norma_A_inv # type: ignore