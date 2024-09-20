def masIzquierda(lista):
    def masIzquierdaConquer(lista_i, lista_d):
        if len(lista_i) == 1:
            if lista_i[0] > lista_d[0]:
                return True
            else:
                return False
        else:
            if sum(lista_i) > sum(lista_d):
                return True and masIzquierdaConquer(lista_i[:(len(lista_i)//2)], lista_i[(len(lista_i)//2):]) and masIzquierdaConquer(lista_d[:(len(lista_d)//2)], lista_d[(len(lista_d)//2):])
            else:
                return False
    return masIzquierdaConquer((lista[:(len(lista) // 2)]), (lista[(len(lista) // 2):]))

print(masIzquierda([8, 6, 7, 4, 5, 1, 3, 2]) == True)
print(masIzquierda([8, 4, 7, 6, 5, 1, 3, 2]) == False)