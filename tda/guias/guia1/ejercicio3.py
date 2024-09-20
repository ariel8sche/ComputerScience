def sumaParcial(m, i, j):
    suma = 0
    for k in i:
        suma += m[j][k] + m[k][j]  # Sumando correctamente los elementos correspondientes
    return suma

def maxiSubconjunto(m, n, k, i, current_sum):
    if k == 0:  # Si ya hemos seleccionado k elementos, devolvemos el subconjunto y la suma actual
        return i, current_sum
    if n == -1:  # Caso base: si no quedan más elementos por considerar
        return i, current_sum

    # Opción 1: No incluir el elemento `n`
    res1 = maxiSubconjunto(m, n-1, k, i, current_sum)

    # Opción 2: Incluir el elemento `n`
    new_sum = current_sum + sumaParcial(m, i, n)
    res2 = maxiSubconjunto(m, n-1, k-1, i+[n], new_sum)

    # Devolver la opción con la suma más alta
    if res1[1] > res2[1]:
        return res1
    else:
        return res2


# print(sumaParcial([[0,10, 10, 1], [10, 0, 5, 2], [10, 5, 0, 1], [1, 2, 1, 0]], [0,1], 2))
print(maxiSubconjunto([[0,10, 10, 1], [10, 0, 5, 2], [10, 5, 0, 1], [1, 2, 1, 0]], 3, 3, [], 0))