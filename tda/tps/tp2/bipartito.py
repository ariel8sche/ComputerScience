from collections import deque

def adjacencyList(edgeList):
    adjacencyList = {}
    for node1, node2 in edgeList:
        if node1 not in adjacencyList:
            adjacencyList[node1] = []
        if node2 not in adjacencyList:
            adjacencyList[node2] = []
        adjacencyList[node1].append(node2)
        adjacencyList[node2].append(node1)
    return adjacencyList

def bfs(adjList, start):
    queue = deque([start]) 
    visited = {start: True}
    level = {start: 0}
              
    evenVertices = []
    oddVertices = []
    
    while queue:
        currentNode = queue.popleft()
        
        if level[currentNode] % 2 == 0:
            evenVertices.append(currentNode)
        else:
            oddVertices.append(currentNode)
        
        for neighbor in adjList[currentNode]:
            if neighbor not in visited:   
                queue.append(neighbor)
                level[neighbor] = level[currentNode] + 1
                visited[neighbor] = True
                    
    return evenVertices, oddVertices

def main():
    with open("input.txt", "r") as archive:
        lines = archive.readlines()

    vertices = int(lines[0].strip())

    edges = []
    for line in lines[1:]:
        u, v = map(int, line.split())
        edges.append((u, v))

    adjList = adjacencyList(edges)
    
    if len(edges) == 0 or vertices <= 1:
        print(0)
    else:
        start_node = list(adjList.keys())[0]
        a,b = bfs(adjList, start_node)
    
        print((len(a)*len(b) - len(edges)))
    
main()
