#Practica 1

#Ejercicio 1


c = [6,12,6]
k = 12
n = len(c)
def ss(suma, i):
    if suma<0:
        return False
    elif suma==0:
        return True
    elif i==n:
        return False
    else:
        return ss(suma, i+1) or ss(suma - c[i], i+1)

"""
def cuadradoMagico(n):
    numMagico = (n**3 + n) / 2
    contador = 0
    return contador




def filaValida(cuadrado, fila):
    sumatoriaFila = 0
    sumatoriaColumna = 0
    sumatoriaDiagonal = 0
    numMagico = (len(c)**3 + len(c)) / 2
    validez = True
    for i in range (0,len(cuadrado),1):
        sumatoriaFila+=cuadrado[fila][i]
    for i in range (0,len(cuadrado),1):
        sumatoriaColumna+=cuadrado[i][0]
    for i in range (0, len(cuadrado),1):
        sumatoriaDiagonal+=cuadrado[i][i]
    if (sumatoriaFila != numMagico):
            validez = validez and False
    elif (sumatoriaColumna != numMagico):
            validez = validez and False
    elif (sumatoriaDiagonal != numMagico):
            validez = validez and False
    return validez

cuadrado = [[8,4,3],[1,5,9],[6,7,2]]

print(filaValida(cuadrado, 8, 0))
"""

# Ejercicio 3

# Ejercicio 5

# Funcion recursiva

#                       |   j = 0                                               si i = 0
#   subset_Sum(i, j) =  |   subset_Sum(i-1, j)                                  si i /= 0 && C[i]>j
#                       |   subset_Sum(i-1, j) || subset_Sum(i-1, j-C[i])       cc

# sumaDinamica

def subset_Sum(i, j, k, mem5, v):
    if (k == 0):
        return True
    if i == len(v):
        return False
    if (mem5[i][j] != None):
        return mem5[i][j]
    no_agrego = subset_Sum(i+1, j ,k, mem5,v)
    agrego = subset_Sum(i+1, j+1, k-v[i], mem5, v)
    mem5[i][j] = agrego or no_agrego
    return mem5[i][j]

mem5 = [[None for _ in range(13)] for _ in range(4)]

v = [6,12,6]

#print(subset_Sum(0, 0, 12, mem5, v))

# Ejercicio 6

# a)

#            | 0                                                si c = 0
# cc(b, c) = | cc(b-1, c)
#            | min(cc(b-1, c, cc(b-1, c-B[b])+1)

def cc(B, c):
    if c == 0:
        return (0, 0)
    if not B:
        return float('inf'), float('inf')
    
    b = B[0]
    if b == c:
        return (0, 1)
    
    no_agrego = cc(B[1:], c)
    if b > c or no_agrego[0] == float('inf'):
        return no_agrego
    
    agrego = (cc(B[1:], c-b)) 
    if agrego[0] == float('inf'):
        return no_agrego
    
    # Calculamos el exceso para cada solución
    exceso_no_agrego = no_agrego[0]
    exceso_agrego = agrego[0]
    
    # Devolvemos la solución con el menor exceso
    if exceso_agrego < exceso_no_agrego:
        return (exceso_agrego, 1 + agrego[1])
    else:
        return no_agrego

B = [2,3,5,10,20,20]

#print(cc(B, 7))

# Ejercicio 9

juego1 = [[-2, -3, 3],[-5, -10, 1],[10, 30, -5]]

mem = [[0 for _ in range(4)]for _ in range(4)]

def travesiaVital(m, n, mem, juego):
    mem[n-1][m-1] = max(1, 1 - juego[n-1][m-1])
    for j in range(m-2, -1, -1):
        mem[n-1][j] = max(mem[n-1][j+1] - juego[n-1][j], 1)
    for i in range(n-2, -1, -1):
        mem[i][m-1] = max(mem[i+1][m-1] - juego[i][m-1], 1)
    for i in range(n-2, -1, -1):
        for j in range(m-2, -1, -1):
            mem[i][j] = max(min(mem[i][j+1], mem[i+1][j]) - juego[i][j], 1)
    return mem[0][0]        

#print(travesiaVital(3, 3, mem, juego1))