import heapq
from collections import deque

class UnionFind:
    def __init__(self, n):
        self.padre = list(range(n))
        self.rango = [0] * n

    def find(self, u):
        if self.padre[u] != u:
            self.padre[u] = self.find(self.padre[u]) 
        return self.padre[u]

    def union(self, u, v):
        raiz_u = self.find(u)
        raiz_v = self.find(v)
        
        if raiz_u != raiz_v:
            if self.rango[raiz_u] > self.rango[raiz_v]:
                self.padre[raiz_v] = raiz_u
            elif self.rango[raiz_u] < self.rango[raiz_v]:
                self.padre[raiz_u] = raiz_v
            else:
                self.padre[raiz_v] = raiz_u
                self.rango[raiz_u] += 1

# Función de Kruskal que me devuelve un vector con las aristas en el AGM.
def kruskal(num_vertices, edges, peso):
    agm = []
    union_find = UnionFind(num_vertices)

    edges_with_weights = [(peso[(v1, v2)], v1, v2) for v1, v2 in edges]
    edges_with_weights.sort(key=lambda edge: edge[0])

    for peso_arista, origen, destino in edges_with_weights:
        if union_find.find(origen) != union_find.find(destino):
            arista_ordenada = (min(origen, destino), max(origen, destino))
            agm.append(arista_ordenada)
            union_find.union(origen, destino)

            if len(agm) == num_vertices - 1:
                break

    return agm

# Función de Prim que me devuelve un vector con las aristas en el AGM y un vector de padres.
def prim(v, num_vertices, adj, pesos):
    visitados = [False] * num_vertices
    minheap = []
    agm = []
    padres = [-1] * num_vertices

    def añadirVertice(nodo):
        visitados[nodo] = True
        for vecino in adj[nodo]:
            if not visitados[vecino]:
                edge = (pesarArista(nodo, vecino, pesos), nodo, vecino)
                heapq.heappush(minheap, edge)

    añadirVertice(v)

    while minheap:
        peso, origen, destino = heapq.heappop(minheap)
        if not visitados[destino]:
            arista_ordenada = (min(origen, destino), max(origen, destino))
            agm.append(arista_ordenada)
            padres[destino] = origen
            añadirVertice(destino)

    return agm, padres

# Función que recorre el AGM con BFS y de paso me hace una lista de padres.
def bfs_para_padres_y_niveles(num_vertices, agm):
    adj = [[] for _ in range(num_vertices)]
    for u, v in agm:
        adj[u].append(v)
        adj[v].append(u)

    padres = [-1] * num_vertices
    niveles = [-1] * num_vertices
    visitados = [False] * num_vertices
    queue = deque([0])
    visitados[0] = True
    niveles[0] = 0

    while queue:
        nodo = queue.popleft()
        for vecino in adj[nodo]:
            if not visitados[vecino]:
                padres[vecino] = nodo
                niveles[vecino] = niveles[nodo] + 1
                visitados[vecino] = True
                queue.append(vecino)

    return padres, niveles

# Función que dado dos vértices me devuelve su peso, unicamente para no tener errores de ingresar a una clave peso que no exite por mal orden de la arista.
def pesarArista(nodo1, nodo2, pesos):
    return pesos.get((nodo1, nodo2), pesos.get((nodo2, nodo1)))

# Función que hacer resta de conjuntos
def restaDeConjuntos(aristasA, agm):
    conjunto_agm = set(agm)
    aristas_fuera_agm = [arista for arista in aristasA if arista not in conjunto_agm]
    return aristas_fuera_agm

# Función que dada una lista de padres me devuelve una lista de los niveles en el árbol.
def calcular_niveles(padres):
    n = len(padres)
    niveles = [-1] * n

    def nivel(nodo):
        if niveles[nodo] != -1:
            return niveles[nodo]
        if padres[nodo] == -1:
            niveles[nodo] = 0
        else:
            niveles[nodo] = nivel(padres[nodo]) + 1
        return niveles[nodo]

    for i in range(n):
        nivel(i)
    return niveles

# Función que dado dos vértices, una lista de padres y el nivel de cada arista en el arbol de AGM, de devuelve un vector con las aristas que estan en el ciclo.
def ciclos(v1, v2, padres, nivel, ciclo):
    if nivel[v1] == nivel[v2] and v1 == v2:
        return ciclo
    else:
        if nivel[v1] > nivel[v2]:
            maxV, minV = v1, v2
        else:
            maxV, minV = v2, v1
        
        while nivel[maxV] != nivel[minV]:
            if maxV < padres[maxV]:
                ciclo.append((maxV, padres[maxV]))
            else:
                ciclo.append((padres[maxV], maxV))
            maxV = padres[maxV]
        
        while maxV != minV:
            if maxV < padres[maxV]:
                ciclo.append((maxV, padres[maxV]))
            else:
                ciclo.append((padres[maxV], maxV))
            if minV < padres[minV]:
                ciclo.append((minV, padres[minV]))
            else:
                ciclo.append((padres[minV], minV))
            maxV = padres[maxV]
            minV = padres[minV]
        
        return ciclo

# Función que dada una lista de aristas, un diccionario de pesos y un peso especifico, me devuelve todas las aristas de la lista con ese peso.
def aristas_con_peso(aristas, pesos, peso_objetivo):
    return [arista for arista in aristas if pesarArista(arista[0], arista[1], pesos) == peso_objetivo]

def main():
    vertices, numAristas = map(int, input().strip().split())    # Ingreso número de vértices y número de aristas.
    clasificacion = ["none"] * numAristas   # Lista donde ubico los tipos de cada arista, su posición equivale al orden en el que fueron ingresadas.
    adj = {}    # Lista de adyacencia.
    aristas = []    # Lista de aristas.
    pesos = {}  # Diccionario de pesos donde la clave es la arista.
    orden = {}  # Diccionario donde me guardo el orden en el fueron ingresadas las aristas.

    for i in range(numAristas):
        node1, node2, p = map(int, input().strip().split())
        node1 -= 1
        node2 -= 1
        adj.setdefault(node1, []).append(node2)
        adj.setdefault(node2, []).append(node1)
        arista_ordenada = (min(node1, node2), max(node1, node2))    # Ordeno las componentes de las aristas de menor a mayor, para seguir un mismo patrón
        aristas.append(arista_ordenada)
        orden[arista_ordenada] = i
        pesos[arista_ordenada] = p

    # Si la cantidad de aristas es cantidad de vértices -1 quiere decir que el grafo es un árbol, cualquiera sea el peso de cada arista, siempre van a estar en el AGM.
    if numAristas <= vertices-1:
        for i in range(numAristas):
            clasificacion[i]= "any"
            
    # Si la cantidad de aristas es igual a la cantidad de vértices quiere decir que el grafo es disperso, por ende Kruskal funciona más rapido.        
    elif numAristas == vertices:

        agmAristas = kruskal(vertices, aristas, pesos)
        
        padres, nivelAGM = bfs_para_padres_y_niveles(vertices, agmAristas)
        
        for v in agmAristas:
            clasificacion[orden[v]] = "any"
        
        otrasAristas = restaDeConjuntos(aristas, agmAristas)
        
        for e in otrasAristas:
            ciclo = ciclos(e[0], e[1], padres, nivelAGM, [e])
            aristasConMismoPeso = aristas_con_peso(ciclo, pesos, pesos[e])
            if len(aristasConMismoPeso) > 1:
                for c in aristasConMismoPeso:
                    clasificacion[orden[c]] = "at least one"
    
    # Caso contrario donde las aristas son mucho mayores a los vértices, por ende Prim funciona más rápido.
    else:
        
        agmAristas, padres = prim(aristas[0][0], vertices, adj, pesos)
        
        for v in agmAristas:
            clasificacion[orden[v]] = "any"     # Todas las aristas del AGM las clasifico como "any", luego me voy a encargar de reclacificar las que sean necesarias.
        
        otrasAristas = restaDeConjuntos(aristas, agmAristas)   # Me quedo con las aristas que no están en el AGM.
        nivelAGM = calcular_niveles(padres) # Calculo los niveles de cada arista en el árbol de AGM.
        
        for e in otrasAristas:  # Por cada arista que no esta en el AGM, la agrego al AGM y miro el ciclo que se formo.
            ciclo = ciclos(e[0], e[1], padres, nivelAGM, [e])       # Encuentro el ciclo en el AGM.
            aristasConMismoPeso = aristas_con_peso(ciclo, pesos, pesos[e])  # Reviso el ciclo y saco todas las aristas que tienen mismo peso que la arista que agregue al AGM.
            if len(aristasConMismoPeso) > 1:            # Si hay mas de una arista con ese mismo peso quiere decir que puedo sacar una y como son del mismo peso sigue valiendo el AGM. Entonces las reclasifico como "at least one"
                for c in aristasConMismoPeso:
                    clasificacion[orden[c]] = "at least one"
            
            # Si no hay mas de 2 aristas del mismo peso que agregue al AGM, quiere decir que esa arista era la mas grande del ciclo y por ende nunca va a estar en ningun AGM. No la clasifico ya que mi vector se inicializa en "none"
    
    for clas in clasificacion:
        print(clas)

main()
