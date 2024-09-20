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

def DFS(graph, start, visited, parents, backedges):
    stack = [start]
    visited[start] = True
    while stack != []:
        actualNode = stack.pop()
        for neighbor in reversed(graph[actualNode]):
            if visited[neighbor] == False:    
                stack.append(neighbor)
                visited[neighbor] = True
                parents[neighbor] = actualNode
            elif (parents[actualNode] != neighbor):
                backedges.append((actualNode, neighbor))
                
def find_back_edges(graph, n):
    visited = [False] * n
    parent = [None] * n
    back_edges = []
    for i in range(n):
        if visited[i] == False:
            DFS(graph, i, visited, parent, back_edges)
    return back_edges