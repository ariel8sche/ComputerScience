from collections import deque

class FlowNetwork:
    def __init__(self):
        self.graph = {}
        self.residual_graph = {}

    def add_node(self, node):
        if node not in self.graph:
            self.graph[node] = {}
            self.residual_graph[node] = {}

    def add_edge(self, origin, destination, capacity):
        self.graph[origin][destination] = capacity

        self.residual_graph[origin][destination] = capacity
        self.residual_graph[destination][origin] = 0

    def bfs(self, source, sink, parent):
        visited = set()
        queue = deque([source])
        visited.add(source)

        while queue:
            current_node = queue.popleft()

            for neighbor in self.residual_graph[current_node]:
                if neighbor not in visited and self.residual_graph[current_node][neighbor] > 0:
                    queue.append(neighbor)
                    visited.add(neighbor)
                    parent[neighbor] = current_node
                    if neighbor == sink:
                        return True

        return False

    def ford_fulkerson(self, source, sink):
        max_flow = 0
        parent = {}

        while self.bfs(source, sink, parent):
            path_flow = float('Inf')
            s = sink

            while s != source:
                path_flow = min(path_flow, self.residual_graph[parent[s]][s])
                s = parent[s]

            v = sink
            while v != source:
                u = parent[v]
                self.residual_graph[u][v] -= path_flow
                self.residual_graph[v][u] += path_flow
                v = parent[v]

            max_flow += path_flow

            parent = {}

        return max_flow
    
    def get_residual_network(self,totalVertices):
        flow_matrix = [[0] * totalVertices for _ in range(totalVertices)]
        for u in self.graph:
            for v in self.graph[u]:
                flow = self.graph[u][v] - self.residual_graph[u][v]
                if flow > 0:
                    flow_matrix[u][v] = flow
        return flow_matrix
    
    def reset_graph(self):
        self.graph = {}
        self.residual_graph = {}
        
INF = float('inf')    
    
def main():
    vertices, moves = tuple(map(int, input().split()))
    inputClassroom = list(map(int, input().split()))
    capacityClassroom = list(map(int, input().split()))
    conexions = []
    for i in range(moves):
        v,w = tuple(map(int, input().split()))
        conexions.append((v,w))
    
    totalVertices = 2*vertices+2
    s = 0
    t = totalVertices -1 
    
    fmax = FlowNetwork()
    
    fmax.add_node(s)
    fmax.add_node(t)
    for i in range(vertices):
        fmax.add_node(i+1)
        fmax.add_node(i+vertices+1)
        
    for i in range(vertices):
        fmax.add_edge(s,i+1,inputClassroom[i])
        fmax.add_edge(i+1,i+vertices+1,inputClassroom[i])
        fmax.add_edge(i+vertices+1,t,capacityClassroom[i])
        
    for v,w in conexions:
        fmax.add_edge(v,w+vertices,inputClassroom[v-1])
        fmax.add_edge(w,v+vertices,inputClassroom[w-1])
        
    if sum(inputClassroom) != sum(capacityClassroom):
        print("NO")
    else:
        f = fmax.ford_fulkerson(s,t)
        residual_network = fmax.get_residual_network(totalVertices)
        res = []
        for i in range(1, vertices+1):
            classroomFlow = []
            for j in range(vertices+1, 2*vertices+1):
                classroomFlow.append(residual_network[i][j])
            res.append(classroomFlow)

        if (sum(inputClassroom)==f): 
            print("YES")
            for row in res:
                print(" ".join(map(str, row)))
        else: 
            print("NO")
          
main()