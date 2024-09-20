def aux(j, q, sector, sign):
    res = sector[j][1]
    if sign == 1:
        for k in range(j+1, q):
            if sector[j][0] < sector[k][0]:
                res = res + sector[k][1]
    elif sign == 0:
        for k in range(j+1, q):
            if sector[j][0] > sector[k][0]:
                res = res + sector[k][1]
    return res
    
def creciente(buildings_q, sector, dp_inc):
    if buildings_q == 0:
        return 0
    if buildings_q == 1:
        return sector[0][1]
    for i in range(0, buildings_q):
        dp_inc[i][i] = sector[i][1]
        for j in range(i+1, buildings_q):
            k = i
            if (sector[k][0] < sector[j][0]):
                dp_inc[i][j] = dp_inc[i][i] + aux(j, buildings_q, sector, 1)
                k = j
    maximo = 0
    for s in dp_inc:
        for width in s:
            if width > maximo:
                maximo = width
    return maximo

def creciente2(buildings_q, sector, mem):
    max = 0
    if buildings_q == 0:
        return 0
    if buildings_q == 1:
        return sector[0][1]
    for i in range(buildings_q):
        mem[i] = sector[i][1]
        
        for j in range(i):
            if sector[j][0] < sector[i][0] and sector[i][1] + mem[j] > mem[i]:
                mem[i] = sector[i][1] + mem[j]
        
        if mem[i] > mem[max]:
            max = i
    
    return mem[max]



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

mem2v2 = [0 for _ in range(6)]

print(creciente2(6, lista[0], mem2v2))
#print("")
#print(creciente2(4, lista[1]))
#print("")
#print(creciente2(3, lista[2]))
#print("")
#print(creciente2(1, lista[3]))
#print("")
#print(creciente2(0, lista[4]))

        
































"""        
        if  (b < buildings_q-1):
            if sector[b][0] > sector[b+1][0]:
                return max(sector[b][1], creciente(buildings_q, sector, b+1))
            elif sector[b][0] == sector[b+1][0]:
                return max(creciente(buildings_q, sector, b+2) + sector[b][1], creciente(buildings_q, sector, b+2)+sector[b+1][1])
            else:
                return max(creciente(buildings_q, sector, b+1)+sector[b][1], creciente(buildings_q, sector, b+1))
        else:
            if sector[b][0] < sector[b-1][0]:
                return 0
            elif sector[b][0] == sector[b-1][0]:
                return 0
            else:
                return sector[b][1]
"""                



