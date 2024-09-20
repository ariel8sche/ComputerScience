import heapq
import sys

def main():
    def cost(a, b):
        return sum(min((int(a[i]) - int(b[i])) % 10, (int(b[i]) - int(a[i])) % 10) for i in range(4)) # Calculo el costo entre dos llaves
    
    def agmin_prim(start_vertex): # Funcion Prim que me va sumando el peso de todo el AGM
            visited = {v: False for v in keys}
            min_heap = []
            agm = []
            agm_weight = 0
            
            def add_edges(node):
                visited[node] = True
                for neighbor in keys:
                    if neighbor != node:
                        if not visited[neighbor]:
                            edge = (cost(node, neighbor), node, neighbor)
                            heapq.heappush(min_heap, edge)
            
            add_edges(start_vertex)
            
            while min_heap:
                weight, node1, node2 = heapq.heappop(min_heap)
                if not visited[node2]:
                    visited[node2] = True
                    agm.append(((node1, node2), weight))
                    agm_weight += weight
                    add_edges(node2)
            
            return agm_weight
    
    #Comienzo a guardar el input
    cases = int(input())
    i=0
    test_cases = []
    for line in sys.stdin:
        if i == cases:
            break
        test=line.split()
        num_keys = int(test.pop(0))
        keys = test
        test_cases.append((num_keys, keys))
        i+=1
    # Termine de guardar el input
    
    rolls = []
    for num_keys, keys in test_cases: 
        
        zero_cost_list = [((0000, vertex), cost("0000", vertex)) for vertex in keys] # Calculo el costo de todos los nodos al 0000
        min_edge, min_weight = min(zero_cost_list, key=lambda x: x[1]) # Calcúlo cual es la llave mas cercana al 0000
            
        agm_weight = agmin_prim(min_edge[1]) # Hago el Prim desde el nodo mas cercano al 0000
        rolls.append(agm_weight+min_weight) # Guardo el peso del AGM y le sumo el peso al 0000
    
    # Imprimo los resultados
    for r in rolls:
        print(r)

main()