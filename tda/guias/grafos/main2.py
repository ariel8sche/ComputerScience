def adjacencies(edgeList):
    adjacencyList = {}
    for nodo1, nodo2 in edgeList:
        if nodo1 not in adjacencyList:
            adjacencyList[nodo1] = []
        if nodo2 not in adjacencyList:
            adjacencyList[nodo2] = []
        adjacencyList[nodo1].append(nodo2)
        adjacencyList[nodo2].append(nodo1)
    return adjacencyList

def DFS(adjacencyList, start, visited):
    stack = [start]
    visited[start] = True
    while stack != []:
        actualNode = stack.pop()
        for neighbor in reversed(adjacencyList[actualNode]):
            if not visited[neighbor]:
                stack.append(neighbor)
                visited[neighbor] = True

def countComponents(adjacencyList, visited):
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

def dfs2(adjacencyList, start, parents, visited, orden, low, artPoints, time):
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

def cutVertices(adjacencyList):
    n = len(adjacencyList)
    visited = [False] * n
    parents = [-1] * n
    orden = [0] * n
    low = [0] * n
    artPoints = set()
    time = [0]

    for vertex in range(n):
        if not visited[vertex]:
            dfs2(adjacencyList, vertex, parents, visited, orden, low, artPoints, time)
    output = []
    for vertex in range(n):
        graph = adjacencyList.copy()  # Hacer una copia del grafo original
        if vertex in artPoints:
            visited = [False]*n
            modified_graph = deleteVertex(graph, vertex)
            output.append((vertex, countComponents(modified_graph, visited)))  # Llamar a countComponents con la copia del grafo
        else:
            output.append((vertex, 1))
    output = sorted(output, key=lambda x: (-x[1], x[0]))
    return output

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
        adjacencyList = adjacencies(railway[0]).copy()
        cutVertex = cutVertices(adjacencyList).copy()
        for i in range(railway[1]):
            print(f"{cutVertex[i][0]} {cutVertex[i][1]}")
        print("")

main()