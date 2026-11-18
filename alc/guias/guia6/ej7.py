import numpy as np
import matplotlib.pyplot as plt

def main(nList):
    # Grilla fina para evaluar y graficar funciones de forma continua
    x_fine = np.linspace(-1, 1, 500)
    f_fine = 1 / (1 + 25 * x_fine**2) # Función real de Runge

    plt.figure(figsize=(10, 6))
    
    # Graficamos la función original f(x)
    plt.plot(x_fine, f_fine, 'k-', linewidth=2, label='f(x) real')
    
    colors = ["red", "green", "blue"]
    
    for i, n in enumerate(nList):
        # 1. Puntos de interpolación equiespaciados (n + 1 puntos)
        x_nodes = np.linspace(-1, 1, n + 1)
        y_nodes = 1 / (1 + 25 * x_nodes**2)
        
        # 2. Ajuste del polinomio interpolador de grado n
        # (np.polyfit ajusta un polinomio de grado deg que pasa por los puntos)
        p_coefs = np.polyfit(x_nodes, y_nodes, deg=n)
        
        # 3. Evaluación del polinomio p_n en la grilla fina
        pn_fine = np.polyval(p_coefs, x_fine)
        
        # 4. Cálculo de la norma infinito ||f - p_n||_inf
        norma_inf = np.max(np.abs(f_fine - pn_fine))
        print(f"Para n = {n:2d} (n+1 = {n+1:2d} nodos): ||f - p_n||_inf = {norma_inf:.4f}")
        
        # 5. Graficar el interpolador p_n
        plt.plot(x_fine, pn_fine, color=colors[i], linestyle='--', 
                 label=f'p_{n}(x) (n={n})')
        # Graficamos los nodos elegidos como puntos
        plt.plot(x_nodes, y_nodes, 'o', color=colors[i], markersize=4)

    plt.title('Fenómeno de Runge: Interpolación polinómica equiespaciada')
    plt.xlabel('x')
    plt.ylabel('y')
    plt.ylim(-0.2, 1.5)  # Acotamos el eje Y para ver la oscilación de los bordes
    plt.grid(True, linestyle=':', alpha=0.6)
    plt.legend()
    plt.show()

main([5, 10, 15])