def indiceEspejo(lista):
    i = 0
    f = len(lista)
    while (i < f):
        mid = i + (f - i) // 2
        if i == f-1:
            if lista[f-1] == mid+1:
                return mid+1
            else:
                break
        if (lista[mid-1] == mid):
            return mid
        elif (lista[mid-1] < mid):
            i = mid
        else:
            f = mid
    return -1

print(indiceEspejo([1, 3, 4, 5, 6]))  # Debería imprimir: 1
print(indiceEspejo([-2, 2, 4, 5, 7])) # Deberia imprimir: 2
print(indiceEspejo([-2, 0, 3, 5, 7])) # Deberia imprimir: 3
print(indiceEspejo([-4, -1, 2, 4, 7])) # Deberia imprimir: 4
print(indiceEspejo([-4, -1, 2, 3, 5])) # Deberia imprimir: 5
print(indiceEspejo([2, 3, 4, 5, 6, 7]))  # Debería imprimir: -1