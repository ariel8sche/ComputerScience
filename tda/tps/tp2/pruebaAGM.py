import heapq

def pesarArista(nodo1, nodo2, pesos):
    if (nodo1,nodo2) in pesos:
        return pesos[(nodo1,nodo2)]
    else:
        return pesos[(nodo2,nodo1)]

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

def aristas_no_en_agm(aristas, agm):
    conjunto_agm = set(agm)
    
    aristas_fuera_agm = [arista for arista in aristas if arista not in conjunto_agm]
    
    return aristas_fuera_agm

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

def ciclos(v1, v2, padres, nivel, ciclo):
    if nivel[v1] == nivel[v2] and v1 == v2:
        return ciclo
    else:
        if nivel[v1] > nivel[v2]:
            maxV = v1
            minV = v2
        else:
            maxV = v2
            minV = v1

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
    
def aristas_con_peso(aristas, pesos, peso_objetivo):
    return [arista for arista in aristas if pesarArista(arista[0], arista[1], pesos) == peso_objetivo]

def main():
    vertices, numAristas = tuple(map(int, input().strip().split()))
    clasificacion = ["none"] * numAristas
    adj = {}
    aristas = []
    pesos = {}
    orden = {}
    
    for i in range(numAristas):
        node1, node2, p = tuple(map(int, input().strip().split()))
        node1 -= 1
        node2 -= 1
        if node1 not in adj:
            adj[node1] = []
        if node2 not in adj:
            adj[node2] = []
        adj[node1].append(node2)
        adj[node2].append(node1)
        arista_ordenada = (min(node1, node2), max(node1, node2))
        aristas.append(arista_ordenada)
        orden[arista_ordenada] = i
        pesos[arista_ordenada] = p

    agmAristas,padres = prim(aristas[0][0], vertices, adj, pesos)
    for v in agmAristas:
        clasificacion[orden[v]] = "any"
    otrasAristas = aristas_no_en_agm(aristas, agmAristas)
    nivelAGM = calcular_niveles(padres)
    for e in otrasAristas:
        ciclo = ciclos(e[0], e[1], padres, nivelAGM, [e])
        aristasConMismoPeso = aristas_con_peso(ciclo, pesos, pesos[e])
        if len(aristasConMismoPeso) > 1:
            for c in aristasConMismoPeso:
                clasificacion[orden[c]] = "at least one"

    for i in range(numAristas):
        print(clasificacion[i])

# def dfs(lista_de_adyacencias,visitados,vertice,padres,niveles,min_nivel_cubierto):
#     visitados[vertice] = True
#     for vecino in lista_de_adyacencias[vertice]:
#         if not visitados[vecino]:
#             niveles[vecino] = niveles[vertice] + 1
#             padres[vecino] = vertice
#             dfs(lista_de_adyacencias, visitados, vecino, padres, niveles, min_nivel_cubierto)
#             min_nivel_cubierto[vertice] = min( min_nivel_cubierto[vertice], min_nivel_cubierto[vecino])
#         elif vecino != padres[vertice]:
#             min_nivel_cubierto[vertice] = min(min_nivel_cubierto[vertice], niveles[vecino])
 
# def puentes(lista_de_adyacencias):
#     n = len(lista_de_adyacencias)
#     visitados = [False] * n
#     padres = [-1] * n
#     niveles = [0] * n
#     min_nivel_cubierto = list(range(n))
#     for vertice in range(n):
#         if not visitados[vertice]:
#             niveles[vertice] = 0
#             dfs(lista_de_adyacencias, visitados, vertice, padres, niveles, min_nivel_cubierto)
#     return [
#         (min(padres[vertice], vertice), max(padres[vertice], vertice)) 
#         for vertice in no_cubiertos(n, padres, niveles, min_nivel_cubierto)
#     ]
 
# def no_cubiertos(n, padres, niveles, min_nivel_cubierto):
#     return [
#         vertice for vertice in range(n)
#         if (min_nivel_cubierto[vertice] >= niveles[vertice] and padres[vertice] != -1)]

# def pesosIguales(aristas, pesos):
#     lista_pesos = [pesarArista(arista[0], arista[1], pesos) for arista in aristas]
#     return 1 == len(set(lista_pesos))

#  if pesosIguales(aristas, pesos):
#         for arista in aristas:
#             clasificacion[orden[arista]] = "at least one"
#         aristasPuentes = puentes(adj)
#         for arista in aristasPuentes:
#             clasificacion[orden[arista]] = "any"
        
#     else:


# Parámetros del grafo
num_vertices = 6
num_aristas = 10
peso = 736780  # Peso que deseas asignar a todas las aristas

import random

def generar_inputs(vertices, num_aristas, peso, nombre_archivo):
    with open(nombre_archivo, 'w') as archivo:
        archivo.write(f"{vertices} {num_aristas}\n")
        
        aristas = set()
        
        # Generar un árbol de expansión mínima para garantizar la conexidad
        for i in range(1, vertices):
            v1 = i
            v2 = random.randint(0, i - 1)
            arista = (min(v1, v2), max(v1, v2))
            aristas.add(arista)
            archivo.write(f"{v1 + 1} {v2 + 1} {peso}\n")
        
        # Añadir aristas adicionales hasta alcanzar el número deseado
        while len(aristas) < num_aristas:
            v1 = random.randint(1, vertices)
            v2 = random.randint(1, vertices)
            while v1 == v2:
                v2 = random.randint(1, vertices)
            arista = (min(v1, v2), max(v1, v2))
            if arista not in aristas:
                aristas.add(arista)
                archivo.write(f"{arista[0] + 1} {arista[1] + 1} {peso}\n")
# Ejemplo de uso
generar_inputs(num_vertices, num_aristas, peso, 'inputAGM.txt')

