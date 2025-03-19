import math
from collections import defaultdict, deque

INF = 10**9

def dijkstra(s, adj):
    n = len(adj)
    d = [INF] * n
    p = [[] for _ in range(n)]  # Cambiamos para almacenar todos los predecesores
    d[s] = 0
    visited = [False] * n

    for _ in range(n):
        v = -1
        for j in range(n):
            if not visited[j] and (v == -1 or d[j] < d[v]):
                v = j

        if d[v] == INF:
            break

        visited[v] = True
        for to, length in adj[v]:
            if d[v] + length < d[to]:
                d[to] = d[v] + length
                p[to] = [v]  # Reemplazamos la lista de predecesores
            elif d[v] + length == d[to]:
                p[to].append(v)  # Agregamos un nuevo predecesor si hay un camino alternativo

    return d, p

def reconstruct_paths(predecessors, start, end):
    # Función para reconstruir todos los caminos desde 'start' a 'end'
    paths = []
    stack = [(end, [end])]

    while stack:
        node, path = stack.pop()
        if node == start:
            paths.append(path[::-1])  # Agregar el camino en orden correcto
        for pred in predecessors[node]:
            stack.append((pred, path + [pred]))

    return paths

def all_shortest_paths(v, w, adj):
    # Dijkstra desde v
    d_from_v, p_from_v = dijkstra(v, adj)
    # Dijkstra desde w
    d_from_w, p_from_w = dijkstra(w, adj)

    # Verificar si hay caminos mínimos
    if d_from_v[w] == INF:
        return []  # No hay camino

    # Encontrar todas las aristas que están en los caminos mínimos
    n = len(adj)
    paths = []

    # Reconstruir caminos mínimos
    for u in range(n):
        for to, length in adj[u]:
            if d_from_v[u] + length + d_from_w[to] == d_from_v[w]:
                # Reconstruir caminos desde v a u y desde to a w
                paths_from_v = reconstruct_paths(p_from_v, v, u)
                paths_from_w = reconstruct_paths(p_from_w, w, to)

                # Combinar caminos desde v -> u -> to -> w
                for path_v in paths_from_v:
                    for path_w in paths_from_w:
                        paths.append(path_v + path_w[1:])

    return paths

ady = {0:[(1,2),(2,3),(3,5)],1:[(0,2),(3,3)],2:[(0,3),(3,2)],3:[(1,3),(2,2),(0,5)]}

print(all_shortest_paths(0,3,ady))