# Ejercicio 6

# a)


#            | 0                                                si c = 0
# cc(B, c) = | B[-1]                                            si B[-1] == c
#            | min(cc(B[:-1], c), cc(B[:-1], c-B[-1]) + 1)      cc

# b)

# def cc_BT(B, c):

#     if(c == 0):
#         return (0,0)
#     if (c > 0 and not B):
#         return (float("inf"), float("inf"))

#     sin_ultimo_billete = cc_BT(B[:-1], c)
#     con_ultimo_billete = cc_BT(B[:-1], c - B[-1]) if B[-1] <= c else (float('inf'), float('inf'))
#     con_ultimo_billete = (con_ultimo_billete[0] + B[-1], con_ultimo_billete[1] + 1)
    
#     # Elegimos la mejor opción: la de menor exceso y, en caso de empate, la de menos billetes
#     if sin_ultimo_billete[0] < con_ultimo_billete[0] or (sin_ultimo_billete[0] == con_ultimo_billete[0] and sin_ultimo_billete[1] < con_ultimo_billete[1]):
#         return sin_ultimo_billete
#     else:
#         return con_ultimo_billete

# print(cc_BT([2,3,5,10,20], 15))

# def cc(B, i, j):
#     if j == 0:
#         return (0, 0)
#     if i == 0:
#         return (float('inf'), float('inf'))
#     else:
#         (c1, q1) = cc(B, i - 1, j)
#         if B[i - 1] <= j:
#             (c2, q2) = cc(B, i - 1, j - B[i - 1])
#             c2 += B[i - 1]
#             q2 += 1
#             if c1 < c2 or (c1 == c2 and q1 < q2):
#                 return (c1, q1)
#             else:
#                 return (c2, q2)
#         else:
#             return (c1, q1)
        
# print(cc([2,3,5,10,20], 5, 15))

# # d)

# # La estructura de memoizacion puede ser una matriz de n * k
# # n cantidad de billetes
# # k costo

# # mem = [[None for _ in range(k+1)]for _ in range (n+1)]

# # e)

# def cc_DP(B, i, j, mem):
#     if (j == 0):
#         return (0,0)
#     if i == -1:
#         return (float("inf"), float("inf"))
#     if (mem[i][j] != None):
#         return mem[i][j]
#     no_agrego = cc_DP(B, i-1, j, mem)
#     if (B[i] > j):
#         agrego = (float("inf"), float("inf"))
#     else:
#         agrego = cc_DP(B, i-1, j - B[i], mem)
#     agrego = (agrego[0] + B[i], agrego[1] + 1)
#     if no_agrego[0] < agrego[0] or (no_agrego[0] == agrego[0] and no_agrego[1] < agrego[1]):
#         mem[i][j] = no_agrego
#     else:
#         mem[i][j] = agrego
#     return mem[i][j]
    
# mem = [[None for _ in range(41)]for _ in range (5)]
# print(cc_DP([2,3,5,10,20], 4, 40, mem))


def optipagoBT(B, i, c):
    if i == 0:
        return (float('inf'),float('inf'))
    if c <= 0:
        return (0,0)
    
    costo_sin_billete, billetes_sin_billete = optipagoBT(B,i-1,c)
    
    costo_con_billete, billetes_con_billete = optipagoBT(B,i-1,c-B[i-1])
    costo_con_billete += B[i-1]
    billetes_con_billete += 1
    
    if costo_con_billete < costo_sin_billete or (costo_con_billete == costo_sin_billete and billetes_con_billete < billetes_sin_billete):
        return costo_con_billete, billetes_con_billete
    else:
        return costo_sin_billete, billetes_sin_billete

print(optipagoBT([1,5,10],3,3))   

def optipagoTP(B, i, c, mem):
    if i == 0:
        return (float('inf'),float('inf'))
    
    if c <= 0:
        return (0,0)
    
    if mem[i][c] != None:
        return mem[i][c]
    else:
        costo_sin_billete,billetes_sin_billete = optipagoTP(B,i-1,c,mem)
        
        costo_con_billete,billetes_con_billete = optipagoTP(B,i-1,c-B[i-1],mem)
        costo_con_billete += B[i-1]
        billetes_con_billete +=1
        
        if costo_con_billete < costo_sin_billete or (costo_con_billete == costo_sin_billete and billetes_con_billete < billetes_sin_billete):
            mem[i][c] = costo_con_billete, billetes_con_billete
        else:
            mem[i][c] = costo_sin_billete, billetes_sin_billete
            
    return mem[i][c]

billetes = [1,5,10]
n = len(billetes)
c = 4
mem = [[None for _ in range(c+1)] for _ in range(n+1)]
print(optipagoTP(billetes,n,c,mem))

def optipagoBU(B, k):
    mem = [[None for _ in range(k+1)] for _ in range(len(B)+1)]
    
    for i in range(len(B)+1):
        mem[i][0] = (0,0)
    
    for j in range(k+1):
        mem[0][j] = (float('inf'),float('inf'))
    
    for i in range(1, len(B)+1):
        for j in range(1, k+1):
            costo_sin_billete, billetes_sin_billete = mem[i-1][j]
            
            costo_con_un_billete,billete = float('inf'),float('inf')
            if B[i-1] >= j:
                costo_con_un_billete,billete = B[i-1],1 
            
            c,d = float('inf'),float('inf')
            if j-B[i-1] >= 0:
                e,f = mem[i-1][j-B[i-1]]
                c,d = e+B[i-1],f+1
            
            costo_usando_billetes,billetes_usando_billetes = min((costo_con_un_billete,billete),(c,d))
            mem[i][j] = min((costo_usando_billetes,billetes_usando_billetes),(costo_sin_billete,billetes_sin_billete))
            
    return mem[len(B)][k]

print(optipagoBU([1,5,10],3))