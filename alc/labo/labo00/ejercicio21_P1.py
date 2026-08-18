#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Práctica 1 - Ejercicio 21
"""

import numpy as np

def traza(A):
    resp = np.inf
    ##  CODIGO A COMPLETAR

    ## 
    return resp

def sumamodulo(A):
    resp = np.inf
    ##  CODIGO A COMPLETAR

    ## 
    return resp


def positivosmayoresanegativos(A):
    resp = True
    ##  CODIGO A COMPLETAR

    ## 
    return resp


def main():

    #Definición de matriz
    A = np.array([[ 1, -2, -1, -2],
                  [-4, -4,  5, -9],
                  [-9,  0,  8, -1],
                  [ 8,  3,  3, -3]])

    print('Matriz A\n', A)
    
    print('Traza de A:', traza(A))
    assert traza(A)==2
    
    print('Suma en módulo de elementos de A:', sumamodulo(A))
    assert sumamodulo(A)==63
    
    print('Positivos mayores a negativos?:', positivosmayoresanegativos(A))
    assert positivosmayoresanegativos(A)==False


if __name__ == "__main__":
    main()
    