import heapq

def dijkstra(s, adj):
    n = len(adj)
    d = [float('inf')] * n
    d[s] = 0
    pq = [(0, s)]

    while pq:
        dist, v = heapq.heappop(pq)
        if dist > d[v]:
            continue

        for to, length in adj[v]:
            if d[v] + length < d[to]:
                d[to] = d[v] + length
                heapq.heappush(pq, (d[to], to))

    return d

def main():
    corner, street = tuple(map(int, input().split()))
    ady= {}
    for v in range(corner):
        ady[v] = []
    for i in range(street):
        v, w, c = tuple(map(int, input().split()))
        ady[v].append((w, c))
        ady[w].append((v, c))
    totalCost = 0
    dist_s = dijkstra(0,ady)
    dist_t = dijkstra(corner-1,ady)
    for v in range(corner):
        for (w, c) in ady[v]:
            if dist_s[w] + c + dist_t[v] == dist_s[corner-1]:
                totalCost += c*2
    print(totalCost)
                
main()