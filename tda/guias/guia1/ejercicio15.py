import heapq

def sumaGolosa(x):
    costo = 0
    heapq.heapify(x)
    while len(x) > 1:
        x1 = heapq.heappop(x)
        x2 = heapq.heappop(x)
        x3 = x1+x2
        costo += x3
        heapq.heappush(x, x3)
    return costo

print(sumaGolosa([1,3,4,5,6,9]))