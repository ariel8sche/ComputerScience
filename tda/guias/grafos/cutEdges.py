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

def dfs(lista_de_adyacencias,visitados,vertice,padres,niveles,min_nivel_cubierto):
    visitados[vertice] = True
    for vecino in lista_de_adyacencias[vertice]:
        if not visitados[vecino]:
            niveles[vecino] = niveles[vertice] + 1
            padres[vecino] = vertice
            dfs(lista_de_adyacencias, visitados, vecino, padres, niveles, min_nivel_cubierto)
            min_nivel_cubierto[vertice] = min( min_nivel_cubierto[vertice], min_nivel_cubierto[vecino])
        elif vecino != padres[vertice]: # es un back edge
            min_nivel_cubierto[vertice] = min(min_nivel_cubierto[vertice], niveles[vecino])
            
def no_cubiertos(n, padres, niveles, min_nivel_cubierto):
    return [
        vertice for vertice in range(n)
        if (min_nivel_cubierto[vertice] >= niveles[vertice] and padres[vertice] != -1)
    ]
    
def puentes(lista_de_adyacencias):
    n = len(lista_de_adyacencias)
    visitados = [False] * n
    padres = [-1] * n
    niveles = [0] * n
    min_nivel_cubierto = list(range(n))
    for vertice in range(n):
        if not visitados[vertice]:
            niveles[vertice] = 0
            dfs(lista_de_adyacencias, visitados, vertice, padres, niveles, min_nivel_cubierto)
    return [
        (padres[vertice], vertice) 
        for vertice in no_cubiertos(n, padres, niveles, min_nivel_cubierto)
    ]

graph = [(0,4),(1,2),(2,3),(2,4),(3,5),(3,6),(3,7),(6,7)]
adjacencyList = listaDeAdy(graph)
print(puentes(adjacencyList))