def listaDeAdy(listaDeAristas):
    listaDeAdyacencias = {}
    for nodo1, nodo2 in listaDeAristas:
        if nodo1 not in listaDeAdyacencias:
            listaDeAdyacencias[nodo1] = []
        if nodo2 not in listaDeAdyacencias:
            listaDeAdyacencias[nodo2] = []
        listaDeAdyacencias[nodo1].append(nodo2)
        listaDeAdyacencias[nodo2].append(nodo1)
    return listaDeAdyacencias

def vertices(adjacencyList):
    vertexList = []
    for nodo in adjacencyList:
        vertexList.append(nodo)
    return vertexList

def DFS(graph, start, visited):
    stack = [start]
    visited[start] = True
    while stack != []:
        actualNode = stack.pop()
        for neighbor in reversed(graph[actualNode]):
            if not visited[neighbor]:
                stack.append(neighbor)
                visited[neighbor] = True

def countComponents(adjacencyList):
    max_vertex = max(adjacencyList.keys()) if adjacencyList else 0
    visited = [False] * (max_vertex + 1)
    count = 0
    for vertex in adjacencyList.keys():
        if not visited[vertex]:
            DFS(adjacencyList, vertex, visited)
            count += 1
    return count

def deleteVertex(adjacencyList, vertex):
    del adjacencyList[vertex]
    for node in adjacencyList:
        adjacencyList[node] = list(set(adjacencyList[node]) - {vertex})
    return adjacencyList

def dfs_con_puntos_de_articulacion(lista_de_adyacencias, visitados, vertice, padres, niveles, min_nivel_cubierto, puntos_articulacion):
    visitados[vertice] = True
    hijos = 0
    for vecino in lista_de_adyacencias[vertice]:
        if not visitados[vecino]:
            niveles[vecino] = niveles[vertice] + 1
            padres[vecino] = vertice
            dfs_con_puntos_de_articulacion(lista_de_adyacencias, visitados, vecino, padres, niveles, min_nivel_cubierto, puntos_articulacion)
            min_nivel_cubierto[vertice] = min(min_nivel_cubierto[vertice], min_nivel_cubierto[vecino])
            if min_nivel_cubierto[vecino] >= niveles[vertice] and padres[vertice] != -1:
                puntos_articulacion.add(vertice)
            hijos += 1
        elif vecino != padres[vertice]:
            min_nivel_cubierto[vertice] = min(min_nivel_cubierto[vertice], niveles[vecino])

    if padres[vertice] is None and hijos > 1:
        puntos_articulacion.add(vertice)
            
def puntos_de_articulacion(lista_de_adyacencias):
    n = len(lista_de_adyacencias)
    visitados = [False] * n
    padres = [-1] * n
    niveles = [0] * n
    min_nivel_cubierto = list(range(n))
    puntos_articulacion = set()

    for vertice in range(n):
        if not visitados[vertice]:
            niveles[vertice] = 0
            dfs_con_puntos_de_articulacion(lista_de_adyacencias, visitados, vertice, padres, niveles, min_nivel_cubierto, puntos_articulacion)

    return puntos_articulacion

def main():
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
    for railway in railwayEmpires:
        adjacencyList = listaDeAdy(railway[0])
        cutVertices = list(puntos_de_articulacion(adjacencyList))
        if len(cutVertices) < railway[1]:
            for i in range(railway[1]-len(cutVertices)):
                vertexList = vertices(adjacencyList)
                if min(vertexList) not in cutVertices:
                    cutVertices.append(min(vertexList))
                    vertexList.remove(min(vertexList))
        maxCutVertices = []
        for vertex in cutVertices:
            adjacencyList = listaDeAdy(railway[0])
            adjacencyListCopy = adjacencyList.copy()
            adjacencyListCopy = deleteVertex(adjacencyListCopy, vertex)
            componens = countComponents(adjacencyListCopy)
            maxCutVertices.append((vertex, componens))
        maxCutVertices.sort(key=lambda x: (-x[1], x[0]))
        printedVertices = set()
        for vertex, components in maxCutVertices:
            print(f"{vertex} {components}")
            printedVertices.add(vertex)
        for vertex in sorted(vertices(adjacencyList)):
            if len(printedVertices) < railway[1] and vertex not in printedVertices:
                print(f"{vertex} 1")
                printedVertices.add(vertex)
        print("\n")
main()