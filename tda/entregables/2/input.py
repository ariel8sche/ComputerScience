def inputBuildings():
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
    return mem

print(inputBuildings())