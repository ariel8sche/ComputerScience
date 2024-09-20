def creciente(buildings_q, sector, mem):
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

def decreciente(buildings_q, sector, mem):
    max = 0
    if buildings_q == 0:
        return 0
    if buildings_q == 1:
        return sector[0][1]
    for i in range(buildings_q):
        mem[i] = sector[i][1]
        
        for j in range(i):
            if sector[j][0] > sector[i][0] and sector[i][1] + mem[j] > mem[i]:
                mem[i] = sector[i][1] + mem[j]
        
        if mem[i] > mem[max]:
            max = i
    
    return mem[max]

def main():
    case = int(input())
    mem = []
    for i in range(0, case, 1):
        building_q = int(input())
        sector = []
        building_h = input().split()
        building_w = input().split()
        for j in range (0, len(building_h), 1):
            building_h[j] = int(building_h[j])
            building_w[j] = int(building_w[j])
            buildings = (building_h[j], building_w[j])
            sector.append(buildings)
        mem.append(sector)
    skyline_status = []
    for c in range(0, case, 1):
        q = len(mem[c])
        inc_mem = [0 for _ in range(q)]
        dec_mem = [0 for _ in range(q)]
        
        skyline = (creciente(q, mem[c], inc_mem), decreciente(q, mem[c], dec_mem))
        skyline_status.append(skyline)
        
        if skyline_status[c][0] >= skyline_status[c][1]:
            res = f"Case {c+1}. Increasing ({skyline_status[c][0]}). Decreasing ({skyline_status[c][1]})."
            print(res)
        else:
            res = f"Case {c+1}. Decreasing ({skyline_status[c][1]}). Increasing ({skyline_status[c][0]})."
            print(res) 

main()