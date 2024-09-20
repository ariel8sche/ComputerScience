from collections import deque
import heapq
import networkx as nx
import matplotlib.pyplot as plt

class graph:
    
    def __init__(self, edgeList):
        self.edges = edgeList
        self.weights = {edge: weight for edge, weight in edgeList}
    
    def edgeList(self):
        return list(self.weights.keys())
    
    def value(self, edge):
        if edge in self.weights:
            return self.weights[edge]
        elif (edge[1], edge[0]) in self.weights:
            return self.weights[(edge[1], edge[0])]
        else:
            raise KeyError(f"La arista {edge} no se encuentra en el grafo.")
    
    def adjacencyList(self):
        adjacencyList = {}
        for node1, node2 in self.edgeList():
            if node1 not in adjacencyList:
                adjacencyList[node1] = []
            if node2 not in adjacencyList:
                adjacencyList[node2] = []
            adjacencyList[node1].append(node2)
            adjacencyList[node2].append(node1)
        return adjacencyList
    
    def vertices(self):
        vertexList = list(self.adjacencyList().keys())
        return vertexList
    
    def grade(self, vertex):
        if vertex in self.vertices():
            return len(self.adjacencyList()[vertex])
        else:
            raise KeyError(f"El vértice {vertex} no se encuentra en el grafo.")
    
    def verticesLength(self):
        return len(self.vertices()) 
    
    def edgeLength(self):
        return len(self.edgeList()) 
        
    def neighborhood(self, vertex):
        if vertex in self.vertices():
            return self.adjacencyList()[vertex]
        else:
            raise KeyError(f"El vértice {vertex} no se encuentra en el grafo.")
        
    def dfs(self, start):
        stack = [start]
        visited = {start: True}
        tree = []
        
        while stack != []:
            currentNode = stack.pop()
            tree.append(currentNode)
            for vecino in reversed(self.adjacencyList()[currentNode]):
                if vecino not in visited:    
                    stack.append(vecino)
                    visited[vecino] = True
        return tree
    
    def bfs(self, start):
        queue = deque([start])  # Cambio de stack a queue
        visited = {start: True}
        tree = []
        
        while queue:
            currentNode = queue.popleft()  # Sacar el primer elemento de la cola
            tree.append(currentNode)
            for neighbor in self.adjacencyList()[currentNode]:
                if neighbor not in visited:   
                    queue.append(neighbor)  # Añadir vecino a la cola
                    visited[neighbor] = True
        return tree

    def parents(self, start):
        num_nodes = self.length()
        visited = [False] * num_nodes
        parent = [-1] * num_nodes

        def dfs_visit(node, parent_node):
            visited[node] = True
            parent[node] = parent_node
            for neighbor in self.neighborhood(node):
                if not visited[neighbor]:
                    dfs_visit(neighbor, node)

        dfs_visit(start, -1)
        return parent
        
    def distance(self, vertex):
        queue = deque([vertex])  # Cambio de stack a queue
        visited = {vertex: True}
        distance = [0]*self.length()
        
        while queue:
            currentNode = queue.popleft()
            for neighbor in self.adjacencyList()[currentNode]:
                if neighbor not in visited:    
                    queue.append(neighbor)
                    distance[neighbor] = distance[currentNode]+1
                    visited[neighbor] = True
        return distance
    
    def visited(self, start):
        queue = deque([start])  # Cambio de stack a queue
        visited= [False]*self.verticesLength()
        visited[start] = True
        
        while queue:
            currentNode = queue.popleft()  # Sacar el primer elemento de la cola
            for neighbor in self.adjacencyList()[currentNode]:
                if visited[neighbor] == False:   
                    queue.append(neighbor)  # Añadir vecino a la cola
                    visited[neighbor] = True
        return visited
    
    def esConexo(self):
        visited = self.visited(0)
        return not any(not visited[i] for i in range(len(visited)))
    
    def agmin_prim(self, vertex):
        if vertex not in self.vertices():
            raise KeyError(f"El vértice {vertex} no se encuentra en el grafo.")
        if not self.esConexo():
            raise KeyError(f"El grafo no es conexo.")
        
        visited = [False] * self.verticesLength()
        minheap = []
        agm = []
        vertices = []
        def add_edges(node):
            visited[node] = True
            for neighbor in self.neighborhood(node):
                if not visited[neighbor]:
                    edge = (self.value((node, neighbor)), node, neighbor)
                    heapq.heappush(minheap, edge)
        vertices.append(vertex)
        while visited.count(False) != 0:
            for node in vertices:
                if not visited[node]:
                    add_edges(node)
            if minheap:
                minEdge = heapq.heappop(minheap)
                if minEdge[2] not in vertices:
                    vertices.append(minEdge[2])
                    agm.append(((minEdge[1], minEdge[2]), minEdge[0]))          
        return agm
        
    def agmin_kruskal(self):
        # Inicializar el resultado
        result = []
        
        # Ordenar las aristas por peso de menor a mayor
        sorted_edges = sorted(self.edges, key=lambda x: x[1])
        
        # Inicializar un diccionario para realizar un seguimiento de los conjuntos de vértices conectados
        parent = {vertex: vertex for edge in self.edges for vertex in edge[0]}
        
        # Función para encontrar el conjunto al que pertenece un vértice
        def find_set(vertex):
            if parent[vertex] != vertex:
                parent[vertex] = find_set(parent[vertex])
            return parent[vertex]
        
        # Función para unir dos conjuntos
        def union(u, v):
            parent_u = find_set(u)
            parent_v = find_set(v)
            parent[parent_u] = parent_v
        
        # Recorrer las aristas ordenadas
        for edge, weight in sorted_edges:
            u, v = edge
            # Comprobar si agregar esta arista forma un ciclo
            if find_set(u) != find_set(v):
                result.append((edge, weight))
                union(u, v)
        
        return result
        
    def dijkstra(self, start_vertex):
        # Initialize maximum distance for all vertices
        distances = {vertex: float('inf') for vertex in self.vertices()}
        distances[start_vertex] = 0

        # Priority queue to store vertices by their distance
        priority_queue = [(0, start_vertex)]

        while priority_queue:
            # Get the vertex with the shortest distance
            current_distance, current_vertex = heapq.heappop(priority_queue)

            # Check if the vertex was visited before
            if current_distance > distances[current_vertex]:
                continue

            # Update distances to neighbors
            for neighbor in self.neighborhood(current_vertex):
                new_distance = current_distance + self.value((current_vertex, neighbor))
                if new_distance < distances[neighbor]:
                    distances[neighbor] = new_distance
                    heapq.heappush(priority_queue, (new_distance, neighbor))

        return distances
        
    def bellman_ford(self, src):

        # Step 1: fill the distance array and predecessor array
        dist = [float("Inf")] * self.verticesLength()
        # Mark the source vertex
        dist[src] = 0

        # Step 2: relax edges |V| - 1 times
        for _ in range(self.verticesLength() - 1):
            for edge, weight in self.edges:
                u, v = edge
                if dist[u] != float("Inf") and dist[u] + weight < dist[v]:
                    dist[v] = dist[u] + weight

        # Step 3: detect negative cycle
        # if value changes then we have a negative cycle in the graph
        # and we cannot find the shortest distances
        for edge, weight in self.edges:
            u, v = edge
            if dist[u] != float("Inf") and dist[u] + weight < dist[v]:
                print("Graph contains negative weight cycle")
                return

        # No negative weight cycle found!
        # Print the distance and predecessor array
        return dist
    
    
    def show(self):
        G = nx.Graph()
        G.add_edges_from(self.edgeList())
        pos = nx.spring_layout(G)  # Posiciones para todos los nodos
        nx.draw(G, pos, with_labels=True, node_color='skyblue', node_size=3000, edge_color='gray', font_size=15, font_weight='bold')
        plt.show()


# G = graph([((0,1), 8),((0,6), 9),((0,7), 10),((0,8), 6),((0,9), 12),((0,10), 3),((1,2), 10),((1,4), 2),((1,10), 7),((2,3), 9),((2,10), 5),((3,4), 13),((3,5), 12),((4,5), 10),((4,6), 6),((5,6), 8),((6,7), 7),((7,8), 3),((8,9), 10),((9,10), 8)])
# print(G.dijkstra(2))
# G_shortest_path = graph([
#     ((0, 1), 1),
#     ((1, 2), 1),
#     ((2, 3), 1),
#     ((0, 3), 10)  # Añadimos un camino más largo para demostrar el camino más corto
# ])

# G_negative_cycle = graph([
#     ((0, 1), 1),
#     ((1, 2), 1),
#     ((2, 3), -100),  # Añadimos un ciclo negativo
#     ((3, 0), 1)  # Esta arista forma el ciclo negativo
# ])
# print(G_shortest_path.dijkstra(0))
# print(G_shortest_path.bellman_ford(0))
# print(G_negative_cycle.bellman_ford(0))
# print(G.agmin_prim(2))
# print(G.agmin_kruskal())
# print(G.value((1,4)))
# print(G.edgeList())
# print(G.edgeLength())
# print(G.vertices())
# print(G.verticesLength())
# print(G.adjacencyList())
# print(G.grade(0))
# print(G.neighborhood(0))
# print(G.dfs(0))
# print(G.bfs(2))
# print(G.parents(1))
# print(G.show())
# print(G.distance(0))
# print(G.visited(0))
# print(G.esConexo())