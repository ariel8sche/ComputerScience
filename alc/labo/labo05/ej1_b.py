import numpy as np
import matplotlib.pyplot as plt

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).resolve().parent.parent))

# Funciones de laboratorios previos y actuales
from alc import calculaLU, res_tri, QR_con_GS, normaExacta

def resolver_inversa_LU(L, U):
    """Calcula A^(-1) resolviendo L * U * x_i = e_i para cada canonico[cite: 4]."""
    n = L.shape[0]
    A_inv = np.zeros((n, n), dtype=float)
    I = np.eye(n)
    
    for i in range(n):
        e_i = I[:, i]
        # Sustitucion hacia adelante (L es triangular inferior con diagonal 1)
        y = res_tri(L, e_i, inferior=True)
        # Sustitucion hacia atras (U es triangular superior)
        x_i = res_tri(U, y, inferior=False)
        A_inv[:, i] = x_i
        
    return A_inv

def resolver_inversa_QR(Q, R):
    """Calcula A^(-1) resolviendo R * x_i = Q^T * e_i para cada canonico[cite: 4]."""
    n = R.shape[0]
    A_inv = np.zeros((n, n), dtype=float)
    
    # Q^T * e_i equivale a la fila i de Q (o columna i de Q^T)
    for i in range(n):
        b = Q.T[:, i]
        x_i = res_tri(R, b, inferior=False)
        A_inv[:, i] = x_i
        
    return A_inv

def ejecutar_comparacion():
    dimensiones = [2, 5, 10, 20, 50, 100]
    muestras_por_n = 100
    
    datos_experimento = {}

    for n in dimensiones:
        print(f"Evaluando dimension n = {n}...")
        errores_lu = []
        errores_qr = []
        
        validas = 0
        while validas < muestras_por_n:
            # 1. Matriz aleatoria con entradas entre -1 y 1
            A = np.random.uniform(-1.0, 1.0, size=(n, n))
            
            # 2. Factorizacion LU
            L, U, _ = calculaLU(A)
            if L is None or U is None:
                continue
            # Descartamos si U tiene ceros en la diagonal (matriz no invertible)
            if np.any(np.isclose(np.diag(U), 0.0, atol=1e-12)):
                continue
                
            # 3. Factorizacion QR con Gram-Schmidt
            Q, R = QR_con_GS(A)
            if Q is None or R is None:
                continue
            if np.any(np.isclose(np.diag(R), 0.0, atol=1e-12)):
                continue

            # 4. Inversas por ambos metodos
            A_inv_LU = resolver_inversa_LU(L, U)
            A_inv_QR = resolver_inversa_QR(Q, R)

            # 5. Calculo de residuos E = A @ A_inv y norma infinito
            I_n = np.eye(n)
            E_LU = A @ A_inv_LU
            E_QR = A @ A_inv_QR
            
            eps_lu = normaExacta(E_LU - I_n, 'inf')
            eps_qr = normaExacta(E_QR - I_n, 'inf')
            
            errores_lu.append(eps_lu)
            errores_qr.append(eps_qr)
            validas += 1

        datos_experimento[n] = {
            'LU': errores_lu,
            'QR': errores_qr,
            'media_LU': np.mean(errores_lu),
            'media_QR': np.mean(errores_qr) 
        }
        print(f"  n={n} | Media LU: {np.mean(errores_lu):.2e} | Media QR: {np.mean(errores_qr):.2e}")

    # Graficos requeridos
    graficar(dimensiones, datos_experimento)

def graficar(dimensiones, datos):
    # Grafico de error medio en funcion de n
    medias_lu = [datos[n]['media_LU'] for n in dimensiones]
    medias_qr = [datos[n]['media_QR'] for n in dimensiones]

    plt.figure(figsize=(9, 5))
    plt.plot(dimensiones, medias_lu, marker='o', label='LU', color='crimson')
    plt.plot(dimensiones, medias_qr, marker='s', label='QR (Gram-Schmidt)', color='royalblue')
    plt.yscale('log')
    plt.xlabel('Dimensión $n$')
    plt.ylabel('Error medio $\|A A^{-1} - I_n\|_\infty$ (escala log)')
    plt.title('Comparación de error medio: LU vs QR')
    plt.grid(True, which="both", linestyle="--", alpha=0.6)
    plt.legend()
    plt.show()

    # Histogramas por dimension
    fig, axes = plt.subplots(2, 3, figsize=(15, 8))
    axes = axes.flatten()

    for i, n in enumerate(dimensiones):
        ax = axes[i]
        ax.hist(datos[n]['LU'], bins=15, alpha=0.5, label='LU', color='crimson')
        ax.hist(datos[n]['QR'], bins=15, alpha=0.5, label='QR', color='royalblue')
        ax.set_title(f'Histograma para $n = {n}$')
        ax.set_xlabel('$\|E - I_n\|_\infty$')
        ax.set_ylabel('Frecuencia')
        ax.legend()
        ax.grid(True, alpha=0.3)

    plt.tight_layout()
    plt.show()

if __name__ == "__main__":
    ejecutar_comparacion()