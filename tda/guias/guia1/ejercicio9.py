# # Ejercicio 9

# juego1 = [[-2, -3, 3],[-5, -10, 1],[10, 30, -5]]

# mem = [[0 for _ in range(4)]for _ in range(4)]

# def travesiaVital(m, n, mem, juego):
#     mem[n-1][m-1] = max(1, 1 - juego[n-1][m-1])
#     for j in range(m-2, -1, -1):
#         mem[n-1][j] = max(mem[n-1][j+1] - juego[n-1][j], 1)
#     for i in range(n-2, -1, -1):
#         mem[i][m-1] = max(mem[i+1][m-1] - juego[i][m-1], 1)
#     for i in range(n-2, -1, -1):
#         for j in range(m-2, -1, -1):
#             mem[i][j] = max(min(mem[i][j+1], mem[i+1][j]) - juego[i][j], 1)
#     return mem[0][0]        

# print(travesiaVital(3, 3, mem, juego1))

def travesiaVitalBacktracking(mapa, i, j):
    n = len(mapa)
    m = len(mapa[0])
    
    if i == n-1 and j == m-1:
        return max(1 - mapa[n-1][m-1], 1)
    
    elif i == n-1:
        return max(travesiaVitalBacktracking(mapa, i, j+1) - mapa[n-1][j], 1)
    
    elif j == m-1:
        return max(travesiaVitalBacktracking(mapa, i+1, j) - mapa[i][m-1], 1)

    else:
        return max(min(travesiaVitalBacktracking(mapa, i+1, j), travesiaVitalBacktracking(mapa, i, j+1)) - mapa[i][j], 1)

print(travesiaVitalBacktracking([[-2,-3,3],[-5,-10,1],[10,30,-5]],0,0))

def travesiaVitalTopDown(mapa, i, j, mem):
    n = len(mapa)
    m = len(mapa[0])
    
    if mem[i][j] != None:
        return mem[i][j]
    
    if i == n-1 and j == m-1:
        mem[i][j] = max(1 - mapa[n-1][m-1], 1)
    
    elif i == n-1:
        mem[i][j] = max(travesiaVitalTopDown(mapa, i, j+1,mem) - mapa[n-1][j], 1)
    
    elif j == m-1:
        mem[i][j] = max(travesiaVitalTopDown(mapa, i+1, j,mem) - mapa[i][m-1], 1)

    else:
        mem[i][j] = max(min(travesiaVitalTopDown(mapa, i+1, j,mem), travesiaVitalTopDown(mapa, i, j+1,mem)) - mapa[i][j], 1)
    
    return mem[i][j]

print(travesiaVitalTopDown([[-2,-3,3],[-5,-10,1],[10,30,-5]],0,0,[[None for _ in range (4)] for _ in range (4)]))

def travesiaVitalBottomUp(mapa):
    n = len(mapa)
    m = len(mapa[0])
    
    mem = [[0 for _ in range(m)] for _ in range(n)]
    
    mem[n-1][m-1] = max(1 - mapa[n-1][m-1], 1)
    
    for j in range(m-2, -1, -1):
        mem[n-1][j] = max(mem[n-1][j+1] - mapa[n-1][j], 1)
    
    for i in range(n-2, -1, -1):
        mem[i][m-1] = max(mem[i+1][m-1] - mapa[i][m-1], 1)
    
    for i in range(n-2, -1, -1):
        for j in range(m-2, -1, -1):
            min_vida_desde_siguiente_paso = min(mem[i+1][j], mem[i][j+1])
            mem[i][j] = max(min_vida_desde_siguiente_paso - mapa[i][j], 1)
    
    return mem[0][0]

mapa = [[-2,-3,3],[-5,-10,1],[10,30,-5]]
print(travesiaVitalBottomUp(mapa))











