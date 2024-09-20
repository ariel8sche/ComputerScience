def atacantes(jugador, restantes, lista, mem):
    n = len(lista)
    if jugador == n or restantes == -1:
        return 0
    elif mem[jugador][restantes] is not None:
        return mem[jugador][restantes]
    else:
        no_selecciono = atacantes(jugador+1, restantes, lista, mem)
        if restantes > -1:
            selecciono = lista[jugador] + atacantes(jugador+1, restantes-1, lista, mem)
            mem[jugador][restantes] = max(no_selecciono, selecciono)
        else:
            mem[jugador][restantes] = no_selecciono
        return mem[jugador][restantes]

mem = [[None for _ in range(5)] for _ in range(10)]
lista = [20,18,17,16,16,13,12,16,16,20]
print(atacantes(0,4,lista,mem))