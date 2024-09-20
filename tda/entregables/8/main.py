def adjacencies(edgeList): # Función que recibe una lista de aristas y devuvelve una lista de adyacencias
    adjacencyList = {}
    for nodo1, nodo2 in edgeList:
        if nodo1 not in adjacencyList:
            adjacencyList[nodo1] = []
        if nodo2 not in adjacencyList:
            adjacencyList[nodo2] = []
        adjacencyList[nodo1].append(nodo2)
        adjacencyList[nodo2].append(nodo1)
    return adjacencyList

def DFS(adjacencyList, start, visited): # Función DFS
    stack = [start]
    visited[start] = True
    while stack != []:
        actualNode = stack.pop()
        for neighbor in reversed(adjacencyList[actualNode]):
            if not visited[neighbor]:
                stack.append(neighbor)
                visited[neighbor] = True

def countComponents(adjacencyList, visited): # Función que me cuentas las componentes del grafo
    count = 0
    for vertex in adjacencyList.keys():
        if not visited[vertex]:
            DFS(adjacencyList, vertex, visited)
            count += 1
    return count

def deleteVertex(adjacencyList, vertex): # Función que dado una lista de adyacencias y un vertice, me elimina ese vertice de todo el grafo
    del adjacencyList[vertex]
    for node in adjacencyList:
        adjacencyList[node] = list(set(adjacencyList[node]) - {vertex})
    return adjacencyList

def dfs2(adjacencyList, start, parents, visited, orden, low, artPoints, time): # Variante de DFS que mira los puntos de articulación
    visited[start] = True
    orden[start] = low[start] = time[0]
    time[0] += 1
    children = 0

    for neighbor in adjacencyList[start]:
        if not visited[neighbor]:
            parents[neighbor] = start
            children += 1
            dfs2(adjacencyList, neighbor, parents, visited, orden, low, artPoints, time)
            low[start] = min(low[start], low[neighbor])

            if parents[start] == -1 and children > 1:
                artPoints.add(start)

            if parents[start] != -1 and low[neighbor] >= orden[start]:
                artPoints.add(start)
        elif neighbor != parents[start]:
            low[start] = min(low[start], orden[neighbor])

def cutVertices(adjacencyList, k):
    n = len(adjacencyList)
    visited = [False] * n
    parents = [-1] * n
    orden = [0] * n
    low = [0] * n
    artPoints = set()
    time = [0]

    for vertex in range(n):
        if not visited[vertex]:
            dfs2(adjacencyList, vertex, parents, visited, orden, low, artPoints, time) # Busco todos los puntos de articulacion
    output = []
    for vertex in artPoints: # Por cada punto de articulacion lo elimino del grafo y cuento las componentes que hay
        graph = adjacencyList.copy()
        visited = [False]*n
        modified_graph = deleteVertex(graph, vertex)
        output.append((vertex, countComponents(modified_graph, visited)))
    for vertex in range(n):
        if (len(output) == k):
            break
        else:
            if (vertex not in artPoints):
                output.append((vertex, 1))
    output = sorted(output, key=lambda x: (-x[1], x[0]))
    return output

# Tome idea del codigo que hicieron en el turno noche

def main():
    # Guardo los inputs
    railwayEmpires = []
    data = list(map(int, input().split()))
    cases = data[1]
    vertex = data[0]
    while (data[0] != 0 and data[1] != 0):
        railway = []
        while (data[0] != -1 and data[1] != -1):
            data = list(map(int, input().split()))
            if (data[0] != -1 and data[1] != -1):
                edge = (data[0], data[1])
                railway.append(edge)
        railwayEmpires.append((railway, cases))
        data = list(map(int, input().split()))
        cases = data[1]
        vertex = data[0]
    # Termino de guardar el input
    for railway in railwayEmpires:
        adjacencyList = adjacencies(railway[0]) # Paso a una lista de adyacencia
        cutVertex = cutVertices(adjacencyList, railway[1]) # Calculo los puntos de articulacion y cuantas componentes generan si los elimino
        for i in range(railway[1]): # Imprimo los resultados
            print(f"{cutVertex[i][0]} {cutVertex[i][1]}")
        print("")

main()