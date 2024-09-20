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

def deleteVertex(adjacencyList, vertex):
    del adjacencyList[vertex]
    for node in adjacencyList:
        adjacencyList[node] = list(set(adjacencyList[node]) - {vertex})
    return adjacencyList

lista_de_aristas = [(0, 4), (1, 2), (2, 3), (2, 4), (3, 5), (3, 6), (3, 7), (6, 7)]
lista_de_adyacencias = listaDeAdy(lista_de_aristas)
lista_de_adyacenciasCopy = lista_de_adyacencias.copy()
print(lista_de_adyacenciasCopy)
lista_de_adyacenciasCopy = deleteVertex(lista_de_adyacenciasCopy, 1)
print(lista_de_adyacenciasCopy)
lista_de_adyacenciasCopy = lista_de_adyacencias.copy()
lista_de_adyacenciasCopy = deleteVertex(lista_de_adyacenciasCopy, 3)
print(lista_de_adyacenciasCopy)
