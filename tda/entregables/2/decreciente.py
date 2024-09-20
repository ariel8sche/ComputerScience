sector = [(10,50),(100,10),(50,10),(30,15),(80,20),(10,10)]

mem = [[0 for _ in range(6)] for _ in range(6)]

buildings_q = 6

b=0

def aux(j, q, sector):
    res = sector[j][1]
    for k in range(j+1, q):
        if sector[j][0] > sector[k][0]:
            res = res + sector[k][1]
    return res
    
def decreciente(buildings_q, sector, dp_inc):
    if buildings_q == 0:
        return 0
    if buildings_q == 1:
        return sector[0][1]
    for i in range(0, buildings_q):
        dp_inc[i][i] = sector[i][1]
        for j in range(i+1, buildings_q):
            k = i
            if (sector[k][0] > sector[j][0]):
                dp_inc[i][j] = dp_inc[i][i] + aux(j, buildings_q, sector, 0)
                k = j
    maximo = 0
    for s in dp_inc:
        for width in s:
            if width > maximo:
                maximo = width
    return maximo
                
lista = [
            [(10, 50), (100, 10), (50, 10), (30, 15), (80, 20), (10, 10)], 
            [(30, 20), (20, 30), (20, 40), (10, 50)], 
            [(80, 15), (80, 25), (80, 20)],
            [(20, 20)],
            []
        ]

mem = [[0 for _ in range(6)] for _ in range(6)]

mem1 = [[0 for _ in range(4)] for _ in range(4)]

mem2 = [[0 for _ in range(3)] for _ in range(3)]

print(decreciente(6, lista[0], mem))
print("")
print(decreciente(4, lista[1], mem1))
print("")
print(decreciente(3, lista[2], mem2))
print("")
print(decreciente(1, lista[3], mem))
print("")
print(decreciente(0, lista[4], mem))








