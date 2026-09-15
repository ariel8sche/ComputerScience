#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Eliminacion Gausianna
"""
import numpy as np
import matplotlib.pyplot as plt

def elim_gaussiana(A):
    
    if (A is None):
        return None, None, 0
    
    cant_op = 0
    m=A.shape[0]
    n=A.shape[1]
    Ac = A.copy()
    
    if m!=n:
        return None, None, 0
    
    ## desde aqui -- CODIGO A COMPLETAR

    
    L = np.zeros((n,n))
    U = np.zeros((n,n))
    
    for k in range (0,n,1):
        L[k, k] = 1
    
    for i in range (0,n-1,1):
        
        fila_ref = Ac[i]
        
        if np.isclose(Ac[i, i], 0.0, atol=1e-15):
            return None, None, 0
        
        for j in range (i+1,n,1):
            if (np.isclose(Ac[j, i], 0.0, atol=1e-15)):
                continue
            else:
                m = Ac[j, i] / Ac[i, i]
                cant_op+=1    
                for col in range(i + 1, n):
                    Ac[j, col] -= m * Ac[i, col]
                    cant_op += 2 
                Ac[j ,i] = m
                    
    for i in range(n):
        L[i, i] = 1.0  # Diagonal de L siempre con 1s
        for j in range(n):
            if i > j:
                # Triángulo inferior estricto: multiplicadores de L
                L[i, j] = Ac[i, j]
            else:
                # Diagonal y triángulo superior: elementos de U
                U[i, j] = Ac[i, j]
                
    ## hasta aqui, calculando L, U y la cantidad de operaciones sobre 
    ## la matriz Ac
            
    
    return L, U, cant_op



def experimento_ejercicio_1b():
    # Probamos con dimensiones crecientes
    dimensiones = [5, 10, 20, 30, 40, 50, 75, 100, 150, 200]
    errores = []
    operaciones = []

    for dim in dimensiones:
        # Matriz generada al azar
        A_rand = np.random.rand(dim, dim)
        
        # Factorización LU
        L_res, U_res, nops = elim_gaussiana(A_rand) # type: ignore
        
        if L_res is not None and U_res is not None:
            # Medimos ||A - LU|| con la norma 1 o norma infinito
            # (usamos @ solo en el script de visualización/test)
            err = np.linalg.norm(A_rand - L_res @ U_res, ord=np.inf)
            errores.append(err)
            operaciones.append(nops)
            
    # Gráficos en escala log-log
    fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(12, 5))

    # Error vs n
    ax1.loglog(dimensiones, errores, 'o-', label='Error $\|A - LU\|_\infty$') # type: ignore
    ax1.set_xlabel('Dimensión $n$')
    ax1.set_ylabel('$\|A - LU\|_\infty$') # type: ignore
    ax1.set_title('Error vs Dimensión $n$ (Escala log-log)')
    ax1.grid(True, which="both", ls="--")
    ax1.legend()

    # Error vs Cantidad de Operaciones
    ax2.loglog(operaciones, errores, 's-r', label='Error vs Operaciones')
    ax2.set_xlabel('Número de operaciones')
    ax2.set_ylabel('$\|A - LU\|_\infty$') # type: ignore
    ax2.set_title('Error vs Cantidad de Operaciones (Escala log-log)')
    ax2.grid(True, which="both", ls="--")
    ax2.legend()

    plt.tight_layout()
    plt.show()

def main():
    n = 7
    B = np.eye(n) - np.tril(np.ones((n,n)),-1) 
    B[:n,n-1] = 1
    print('Matriz B \n', B)
    
    L,U,cant_oper = elim_gaussiana(B) # type: ignore
    
    print('Matriz L \n', L)
    print('Matriz U \n', U)
    print('Cantidad de operaciones: ', cant_oper)
    print('B=LU? ' , 'Si!' if np.allclose(np.linalg.norm(B - L@U, 1), 0) else 'No!') # type: ignore
    print('Norma infinito de U: ', np.max(np.sum(np.abs(U), axis=1)) ) # type: ignore

if __name__ == "__main__":
    main()
    experimento_ejercicio_1b()
    
    
