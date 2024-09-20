def cuadradoPerfecto(n:int, fila: int, columna:int,lista:list, esPrimerVez:bool, conjunto:list, nivel: int):

    if esPrimerVez:
        numeroMagico:int = ((n**3) + n)/2
        cantidad:int = n*n
        esPrimerVez = False
        
    else:
        for i in range((n*n)):
            if not conjunto[i]:    
                lista[fila][columna] = i + 1 
                conjunto[i] = True
                nivel = nivel + i + 1
                break
                
        if fila != n-1 and columna == n-1:
            if nivel == numeroMagico:
                cuadradoPerfecto(n,fila + 1, 1,lista,False,0)
            else:
                
        else:
            cuadradoPerfecto(n, fila, columna + 1, False, conjunto)
cuadradoPerfecto(3,0,0,[],True,[False for _ in range(3**2)])


def esCuadradoMagico(matriz, n):
    numeroMagico = ((n**3) + n)/2
    res = True
    columnas = []
    filas = []
    sumaDiagonal1 = 0
    sumaDiagonal2 = 0
    for i in range(n):
        sumaDiagonal1 += matriz[i][i]

    wtf: int = n - 1
    for i in range(n): 
        sumaDiagonal2 += matriz[i][wtf] 
        wtf -= 1
        
    for i in range(n):
        fila=0
        for j in range (n):
            fila += matriz[i][j]
        filas.append(fila)
            
        
    for j in range(n):
        columna=0
        for i in range (n):
            columna += matriz[i][j]
        columnas.append(columna)
            
    for i in range(n):
        if filas[i] != numeroMagico or columnas[i] != numeroMagico:
            res = False
    if sumaDiagonal1 != numeroMagico or sumaDiagonal2 != numeroMagico:
        res = False
        
    return res

print(esCuadradoMagico([[2,7,6],[9,5,1],[4,3,8]], 3))