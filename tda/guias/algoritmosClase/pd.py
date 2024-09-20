def combinatorio(n,k):
    # Creo la matriz de tamaño n por k
    matriz = [[0 for _ in range(k+1)] for _ in range(n+1)]
    
    # Recorro toda la primer columna y asigno el valor 1.
    for i in range(1,n+1):
        matriz[i][0] = 1
        
    # Recorro toda la diagonal y asigno el valor 1.
    for j in range(0,k+1):
        matriz[j][j] = 1
        
    # Recorro todo el resto de la tabla y cada valor es la suma de dos valores de la fila anterior
    for i in range(2,n+1):
        for j in range(1,1 + min(i,k)):
            matriz[i][j] = matriz[i-1][j-1] + matriz[i-1][j]
            
    return matriz[n][k]

# print(combinatorio(9,5))
    
def coinChange(denominaciones, cambio):
    # Creamos la matriz de tamaño cambio + 1, con todos sus valores en infinito
    min_monedas = [float('inf')] * (cambio + 1)
    
    # Para devolver cambio 0 necesitamos 0 monedas
    min_monedas[0] = 0

    # Recorremos cada monto desde 1 hasta el cambio requerido
    for i in range(1, cambio + 1):
        for moneda in denominaciones:
            if moneda <= i:
                min_monedas[i] = min(min_monedas[i], min_monedas[i - moneda] + 1)

    # Si el valor en min_monedas[cambio] es infinito, significa que no es posible devolver el cambio con las monedas disponibles
    return min_monedas[cambio] if min_monedas[cambio] != float('inf') else -1

# print(coinChange([1,5,10],10))

def knapsack(cantObj:int, pesoMax:int, pesoObj:list, beneficioObj:list):
    matriz = [[0 for _ in range(pesoMax + 1)] for _ in range(cantObj + 1)]
    
    for i in range(cantObj + 1):
        for j in range(pesoMax + 1):
            if j==0 or i==0:
                matriz[i][j] = 0
            elif i > 0 and pesoObj[i-1] <= j:
                matriz[i][j] = max(matriz[i-1][j], beneficioObj[i-1] + matriz[i-1][j-pesoObj[i-1]])
            else:
                matriz[i][j] = matriz[i][j-1]
                
    return matriz[cantObj][pesoMax]

profit = [60, 100, 120]
weight = [1, 2, 3]
W = 5
n = len(profit)

# print(knapsack(3,5,weight,profit))
    
def lcs(a, b):
    matriz = [[0 for _ in range(len(b)+1)] for _ in range(len(a)+1)] 
    
    for i in range(1, len(a)+1):
        for j in range(1, len(b)+1):
            if a[i-1] == b[j-1]:
                matriz[i][j] = matriz[i-1][j-1] + 1
            else:
                matriz[i][j] = max(matriz[i-1][j], matriz[i][j-1])
                
    return matriz[len(a)][len(b)]

# print(lcs([9,5,2,8,7,3,1,6,4], [2,9,3,5,8,7,4,1,6]))

def fibonacci_b (n):
    if (n <= 1):
        return 1
    return fibonacci_b(n-1) + fibonacci_b(n-2)

def fibonacci_pd(n, m):
    if (m[n-1] != None):
        return m[n-1]
    else:
        m[n-1] = fibonacci_pd(n-1, m) + fibonacci_pd(n-2, m)
        return m[n-1]

m =[None for _ in range(100)]
m[0] = 1
m[1] = 1
# print(fibonacci_pd(100, m))
