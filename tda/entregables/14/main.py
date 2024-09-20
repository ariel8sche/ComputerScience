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
        if origin not in self.graph:
            self.add_node(origin)
        if destination not in self.graph:
            self.add_node(destination)
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
        
    def mostrar_grafo(self):
        for origin in self.graph:
            for destination in self.graph[origin]:
                capacity = self.graph[origin][destination]
                print(f"{origin} -> {destination} : {capacity}")

def readInput(desde_archivo):
    with open(desde_archivo, 'r') as file:
        content = file.read().strip()
    
    blocks = content.split('\n\n')
    
    tests = []

    for block in blocks:
        lines = block.split('\n')
        
        first_line = lines[0].split()
        num_row = int(first_line[0])
        num_column = int(first_line[1])
        woodCapacity = int(first_line[2])
        
        matrix = []
        
        for j in range(1, num_row + 1):
            fila = list(lines[j])
            matrix.append(fila)
        
        tests.append(((num_row, num_column), woodCapacity, matrix))

    return tests

def main():
    input_file = 'input.txt'
    tests = readInput(input_file)
    
    for test in tests:
        (num_row, num_column), woodCapacity, matrix = test
        fn = FlowNetwork()
        fn.add_node("s")
        fn.add_node("t")
        
        nodesName = {}
        a, b, c, d = 1, 1, 1, 1
        
        for n in range(num_row):
            for m in range(num_column):
                node = f"n{n}_{m}"
                
                if matrix[n][m] == "*":
                    fn.add_node(f"p{a}_in")
                    fn.add_node(f"p{a}_out")
                    nodesName[node] = f"p{a}"
                    fn.add_edge(f"p{a}_in", f"p{a}_out", 1)
                    fn.add_edge("s", f"p{a}_in", 1)   
                    a += 1
                elif matrix[n][m] == ".":
                    fn.add_node(f"h{b}_in")
                    fn.add_node(f"h{b}_out")
                    nodesName[node] = f"h{b}"
                    fn.add_edge(f"h{b}_in", f"h{b}_out", 1)
                    b += 1
                elif matrix[n][m] == "#":
                    fn.add_node(f"m{c}")
                    nodesName[node] = f"m{c}"
                    fn.add_edge(f"m{c}", "t", woodCapacity)
                    c += 1
                elif matrix[n][m] == "@":
                    fn.add_node(f"i{d}_in")
                    fn.add_node(f"i{d}_out")
                    nodesName[node] = f"i{d}"
                    fn.add_edge(f"i{d}_in", f"i{d}_out", 2)
                    d += 1   
        
        for n in range(num_row):
            for m in range(num_column):
                if matrix[n][m] != "~":
                    if matrix[n][m] == "*":
                        node_in = f"p{a-1}_in"
                        node_out = f"p{a-1}_out"
                    elif matrix[n][m] == ".":
                        node_in = f"h{b-1}_in"
                        node_out = f"h{b-1}_out"
                    elif matrix[n][m] == "#":
                        node_in = f"m{c-1}"
                        node_out = f"m{c-1}"
                    elif matrix[n][m] == "@":
                        node_in = f"i{d-1}_in"
                        node_out = f"i{d-1}_out"

                    if n > 0 and matrix[n-1][m] != "~":  # Norte
                        neighbor_in = nodesName[f"n{n-1}_{m}"] + "_in"
                        neighbor_out = nodesName[f"n{n-1}_{m}"] + "_out"
                        fn.add_edge(node_out, neighbor_in, 1)
                        fn.add_edge(neighbor_out, node_in, 1)
                    if n < num_row - 1 and matrix[n+1][m] != "~":  # Sur
                        neighbor_in = nodesName[f"n{n+1}_{m}"] + "_in"
                        neighbor_out = nodesName[f"n{n+1}_{m}"] + "_out"
                        fn.add_edge(node_out, neighbor_in, 1)
                        fn.add_edge(neighbor_out, node_in, 1)
                    if m > 0 and matrix[n][m-1] != "~":  # Oeste
                        neighbor_in = nodesName[f"n{n}_{m-1}"] + "_in"
                        neighbor_out = nodesName[f"n{n}_{m-1}"] + "_out"
                        fn.add_edge(node_out, neighbor_in, 1)
                        fn.add_edge(neighbor_out, node_in, 1)
                    if m < num_column - 1 and matrix[n][m+1] != "~":  # Este
                        neighbor_in = nodesName[f"n{n}_{m+1}"] + "_in"
                        neighbor_out = nodesName[f"n{n}_{m+1}"] + "_out"
                        fn.add_edge(node_out, neighbor_in, 1)
                        fn.add_edge(neighbor_out, node_in, 1)
                       
        fn.mostrar_grafo()
        #print("Máximo flujo:", fn.ford_fulkerson("s", "t"))
        fn.reset_graph()

if __name__ == "__main__":
    main()



        
        
# fn = FlowNetwork()
# fn.add_node("s")
# fn.add_node("p1")
# fn.add_node("p2")
# fn.add_node("h1_in")
# fn.add_node("h1_out")
# fn.add_node("h2_in")
# fn.add_node("h2_out")
# fn.add_node("h3_in")
# fn.add_node("h3_out")
# fn.add_node("h4_in")
# fn.add_node("h4_out")
# fn.add_node("h5_in")
# fn.add_node("h5_out")
# fn.add_node("i_in")
# fn.add_node("i_out")
# fn.add_node("m_in")
# fn.add_node("m_out")
# fn.add_node("t")

# fn.add_edge("s","p1",1)
# fn.add_edge("s","p2",1)

# fn.add_edge("p1","h1_in",1)
# fn.add_edge("h1_in","h1_out",1)
# fn.add_edge("h1_out","h2_in",1)
# fn.add_edge("h2_in","h2_out",1)
# fn.add_edge("h2_out","h1_in",1)
# fn.add_edge("h1_out","h3_in",1)
# fn.add_edge("h3_in","h3_out",1)
# fn.add_edge("h3_out","h1_in",1)
# fn.add_edge("h3_out","h4_in",1)
# fn.add_edge("h4_in","h4_out",1)
# fn.add_edge("h4_out","h3_in",1)
# fn.add_edge("h4_out","i_in",1)
# fn.add_edge("i_in","i_out",2)
# fn.add_edge("i_out","h4_in",1)
# fn.add_edge("p2","i_in",2)
# fn.add_edge("i_out","m_in",2)
# fn.add_edge("m_in","m_out",2)
# fn.add_edge("m_out","i_in",2)
# fn.add_edge("m_out","t",2)
# fm = fn.ford_fulkerson("s","t")
# print(fm)