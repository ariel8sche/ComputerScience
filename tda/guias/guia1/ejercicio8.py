# b)

# rod_cp(i, j, C) = | 0                                                         si j <= i+1
#                   | min (rod_cp(i,k, C) + rod_cp(k,j, C) + (C[j]−C[i]))       si j>i+1


# c) y d)

def rod_cp(i, j, C, mem):
    C = [i] + C + [j]
    
    def costoMinimo(i: int, j: int) -> int:
            if j <= i + 1:
                return 0
            if mem[i][j] != None:  # Caso base si el resultado ya está memoizado
                return mem[i][j]
            costoMin = float('inf')
            for k in range(i + 1, j):  # Paso recursivo
                costoActual = costoMinimo(i, k) + costoMinimo(k, j) + (C[j] - C[i])
                costoMin = min(costoMin, costoActual)
            mem[i][j] = costoMin  # Guardo resultado en memoria
            return costoMin
    
    return costoMinimo(0, len(C) - 1)

vara = 10
cortes = [2,4,7]
mem = [[None for _ in range(len(cortes) + 3)] for _ in range(len(cortes) + 3)]
print(rod_cp(0, 10, cortes, mem))




def corteEconomicoBacktracking(C, i, j):
    if not C:
        return 0
    
    min_costo = float('inf')
    
    for corte in C:
        if i < corte < j:
            # Crear nuevas listas de cortes excluyendo el corte actual
            C_izq = [c for c in C if c < corte]
            C_der = [c for c in C if c > corte]
            
            # Calcular el costo total para este corte
            costo = (j - i) + corteEconomicoBacktracking(C_izq, i, corte) + corteEconomicoBacktracking(C_der, corte, j)
            
            # Mantener el mínimo costo
            min_costo = min(min_costo, costo)
    
    return min_costo

print(corteEconomicoBacktracking([2,4,7],0,10))

def corteEcionomicoTopDown(C, i, j, mem):
    if not C:
        return 0
    
    if mem[i][j] != None:
        return mem[i][j]
    
    min_costo = float('inf')
    
    for corte in C:
        if i < corte < j:
                # Crear nuevas listas de cortes excluyendo el corte actual
                C_izq = [c for c in C if c < corte]
                C_der = [c for c in C if c > corte]
                
                # Calcular el costo total para este corte
                costo = (j - i) + corteEconomicoBacktracking(C_izq, i, corte) + corteEconomicoBacktracking(C_der, corte, j)
                
                # Mantener el mínimo costo
                min_costo = min(min_costo, costo)
                
    mem[i][j] = min_costo
        
    return mem[i][j]

print(corteEcionomicoTopDown([2,4,7],0,10,[[None for _ in range(11)] for _ in range(11)]))

def corteEconomicoBottomDown(C, l):
    mem = [[None for _ in range(l+1)] for _ in range (l+1)]
        
    for i in range(l+1):
        for j in range(l+1):
            if i == j:
                mem[j][j] = 0
            if i > j:
                mem[j][j] = float('inf')
            
    
    return mem[0][l]