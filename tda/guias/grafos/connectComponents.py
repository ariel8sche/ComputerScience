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

listaAristas = [(1,2),(2,3)]
listaAdy = listaDeAdy(listaAristas)
print(listaAdy)
print(countComponents(listaAdy))
