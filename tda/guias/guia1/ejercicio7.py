# b)

#                                   |   indefinido                      si c < 0 or c > j
#   mgn(j, c) =                     |   0                               si c = 0 and (j = 0 or j = n-1)
#                                   |   max ( mgn(j-1, c-1)+prices[j]   si c > 0
#                                             mgn(j-1, c+1)-prices[j]   si c < n-j
#                                             mgn(j-1, c)                          cc )

# d)

# def mgn(prices, j, c, memo):
    
#    if memo[j][c] != None:
#        return memo[j][c]
#    if (c < 0 or c > j):
#        return float("-inf")
#    if (j == 0):
#        if (c == 0):
#            return 0
#        else:
#            return float("-inf")
#    comprar = mgn(prices,j-1,c-1, memo)-prices[j-1] if c > 0 else float('-inf')
#    vender = mgn(prices,j-1,c+1, memo)+prices[j-1] if c < j else float('-inf')
#    ninguna = mgn(prices,j-1,c, memo)
#    memo[j][c] = max(comprar, vender, ninguna)
#    return memo[j][c]

memo1 = [[None for _ in range(5)] for _ in range(5)]
prices1 = [2,3,5,6]
memo2 = [[None for _ in range(4)] for _ in range(4)]
prices2 = [3, 6, 10]
#print(mgn(prices1, 4, 0, memo1))
#print(mgn(prices2, 3, 0, memo2))

def astroTradeBacktracking(P, j, c):
    if c<0:
        return float('-inf')
    if c>j:
        return float('-inf')
    if j==len(P):
        return 0
    return max(astroTradeBacktracking(P, j+1, c-1)+P[j], astroTradeBacktracking(P,j+1,c+1)-P[j],astroTradeBacktracking(P,j+1,c))

print(astroTradeBacktracking([3,2,5,6],0,0))

def astroTradeTopDown(P, j, c,mem):
    if c<0:
        return float('-inf')
    if c>j:
        return float('-inf')
    if j==len(P):
        return 0
    if mem[j][c] != None:
        return mem[j][c]
    else:
        mem[j][c] = max(astroTradeTopDown(P, j+1, c-1,mem)+P[j], astroTradeTopDown(P,j+1,c+1,mem)-P[j],astroTradeTopDown(P,j+1,c,mem))
    return mem[j][c]

print(astroTradeTopDown([3,2,5,6],0,0,[[None for _ in range(5)]for _ in range(5)]))
    
def astroTradeBottomUp(P):
    mem = [[float('-inf') for _ in range(len(P)+1)]for _ in range(len(P)+1)]

    mem[0][0] = 0

    for j in range(1, len(P) + 1):
        for c in range(len(P) + 1):
            # No hacer nada
            mem[j][c] = mem[j-1][c]
            
            # Comprar un asteroide si es posible
            if c > 0:
                mem[j][c] = max(mem[j][c], mem[j-1][c-1] - P[j-1])
            
            # Vender un asteroide si es posible
            if c < len(P):
                mem[j][c] = max(mem[j][c], mem[j-1][c+1] + P[j-1])
        
    return mem[len(P)][0]

print(astroTradeBottomUp([3,2,5,6]))
        
    

