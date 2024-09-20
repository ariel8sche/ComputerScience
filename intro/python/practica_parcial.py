def duplicarPares(l:list)->list:
    for i in range (len(l)):
        if esPar(l[i]):
            l[i] = l[i] * 2
    return l

def esPar(n:int)->bool:
    res = False
    if n % 2 == 0:
        res = True
    else:
        res = False
    return res

#print(duplicarPares([1,2,3,4,5,6]))

def f(i:int, j:int, k:int)-> int:
    res :int = 0
    if i % 3 == 0:
        res = i // 3
    else:
        res = (j ^ 2) + k
    return res

"""print(f(9,5,5))
print(f(8,5,5))
"""
def f2(n:int)->int:
    res:int = 0
    while n>0:
        res = res + ((n - 1)**2)
        n -= 1
    return res

"""print(f2(1))
print(f2(2))
print(f2(3))
print(f2(5))
print(f2(7))"""

def maximos(l:list, s:list)->list:
    listaMaximos:list = []
    for i in range(len(l)):
        if l[i] >= s[i]:
            listaMaximos.append(l[i])
        else:
            listaMaximos.append(s[i])
    return listaMaximos

#print(maximos([110,50,76], [45,60,70]))

def sumaImpares(l:list)->int:
    sumatoria:int = 0
    for i in range (len(l)):
        if i % 2 == 0:
            if l[i] % 2 != 0:
                sumatoria += l[i]
    return sumatoria

"""print(sumaImpares([]))
print(sumaImpares([1]))
print(sumaImpares([1,2]))
print(sumaImpares([1,2,3]))
print(sumaImpares([2,3,4]))
print(sumaImpares([1,2,3,3]))"""

def buscarPosicion(n:int, l:list)->int:
    for i in range (len(l)):
        if l[i] == n:
            return i + 1
    return 0

"""print(buscarPosicion(3, []))
print(buscarPosicion(3, [1,3,4,6,8]))
print(buscarPosicion(3, [1,2,4,6,8]))"""

def prod(n:int)->int:
    n:int = 2*n
    productoria:int = 1
    while n > 0:
        productoria = ((n**2) + (2*n)) * productoria
        n -= 1
    return productoria

print(prod(3))