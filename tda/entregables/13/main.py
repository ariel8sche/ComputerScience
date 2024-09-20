import sys
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
    
    def reset_graph(self):
        self.graph = {}
        self.residual_graph = {}

def main():
    input_file = "input.txt"
    with open(input_file, 'r') as f:
        input_data = f.readlines()

    cases = int(input_data[0].strip())
    index = 1

    for k in range(cases):
        fn = FlowNetwork()
        fn.add_node("s")
        fn.add_node("XXL")
        fn.add_node("XL")
        fn.add_node("L")
        fn.add_node("M")
        fn.add_node("S")
        fn.add_node("XS")
        fn.add_node("t")
        
        data = input_data[index].strip().split()
        index += 1
        shirts = int(data[0])
        volunteers = int(data[1])
        
        sizes = ["XXL", "XL", "L", "M", "S", "XS"]
        for tshirtSize in range(6):
            fn.add_edge("s", sizes[tshirtSize], shirts/6)
        
        for i in range(volunteers):
            fn.add_node(f"v{i}")
            tshirtVolunteer = input_data[index].strip().split()
            index += 1
            s1 = tshirtVolunteer[0]
            s2 = tshirtVolunteer[1]
            fn.add_edge(s1, f"v{i}", 1)
            fn.add_edge(s2, f"v{i}", 1)
            fn.add_edge(f"v{i}", "t", 1)
        
        max_flow = fn.ford_fulkerson("s", "t")
        if max_flow == volunteers:
            print("YES")
        else:
            print("NO")
        fn.reset_graph()

main()