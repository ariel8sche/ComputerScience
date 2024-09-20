def merge_sort(lista):
    if len(lista) <= 1:
        return lista

    medio = len(lista) // 2
    izquierda = merge_sort(lista[:medio])
    derecha = merge_sort(lista[medio:])

    return merge(izquierda, derecha)

def merge(izquierda, derecha):
    if not izquierda:
        return derecha
    if not derecha:
        return izquierda

    if izquierda[0][1] > derecha[0][1] or (izquierda[0][1] == derecha[0][1] and izquierda[0][2] < derecha[0][2]):
        return [izquierda[0]] + merge(izquierda[1:], derecha)
    return [derecha[0]] + merge(izquierda, derecha[1:])



def argentina():
    caso=input(int)
    lista = pasarLista()
    atacantes = []
    defensores = []
    l = tuple
    for i in range(0, 5, 1):
        atacantes.append(lista[i][0])
    for i in range(5, 10, 1):
        defensores.append(lista[i][0])
    a = tuple(atacantes)
    d = tuple(defensores)
    resultado = f"Caso: {caso}\n{a}\n{d}"
    return resultado

#lista = [emotionalblind 16 12, jaan 17 86, sameezahur 20 21, sohelh 18 9, tanaeem 20 97, brokenarrow 16 16, muntasir 13 4, shadowcoder 12 9, shamim 16 18, sidky 16 36]
caso= input()
print(pasarLista())