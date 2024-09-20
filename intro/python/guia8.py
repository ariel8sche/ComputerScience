import numpy as np

# Ejercicio 1

# 1)

print("""
      Ejercicio 1.1
      """)

def pertenece(l:list, e:int)->bool:
    res = False
    for elem in l:
        if elem == e:
            res = True
    return res
    
print(pertenece([1,2,3,4], 3))
print(pertenece([1,2,3,4], 5))

# 2)

print("""
      Ejercicio 1.2
      """)

def divideATodos(l:list, e:int)->bool:
    res = True
    for elem in l:
        if elem % e == 0:
            res = res and True
        else: 
            res = res and False
    return res

print(divideATodos([4,6,8], 2))
print(divideATodos([4,6,7], 2))

# 3)

print("""
      Ejercicio 1.3
      """)

def sumaTotal(l:list)->int:
    res = 0
    for elem in l:
        res = res + elem
    return res

print(sumaTotal([1,2,3,4]))


# 4)

print("""
      Ejercicio 1.4
      """)

def ordenados(l:list)->bool:
    res = True
    for i in range(len(l)-1):
        res = res and l[i] <= l[i+1]
    return res

print(ordenados([1,2,4,3]))
print(ordenados([1,2,3,4]))

# 5)

print("""
      Ejercicio 1.5
      """)

def mayorA7(l:list)->bool:
    for palabra in l:
        if len(palabra) > 7:
            return True
    return False
        
print(mayorA7(["stones","foden","gundogan","dias"]))
print(mayorA7(["stones","foden","dias"]))

# Ejercicio 6

print("""
      Ejercicio 1.6
      """)

def reverso(palabra:str)->str:
    reversa:str = ""
    for i in range(len(palabra)-1, -1, -1):
        reversa += palabra[i]
    return reversa

def palindroma(palabra:str)->bool:
    res = False
    if palabra == reverso(palabra):
        res = True
    return res

print(palindroma("neuquen"))

# Ejercicio 7

print("""
      Ejercicio 1.7
      """)

def tieneMinuscula(password) -> bool:
    for letra in password:
        if "a" <= letra <= "z":
            return True
    return False

def tieneMayusculas(password)->bool:
    for letra in password:
        if "A" <= letra <= "Z":
            return True
    return False

def tieneNumeros(password)->bool:
    for i in password:
        if str(0) <= i <= str(9):
            return True
    return False

def contraseñaSegura(password:str)->str:
    res:str = ""
    if len(password) > 8 and tieneMinuscula(password) and tieneMayusculas(password) and tieneNumeros(password):
        res = "VERDE"
    elif len(password) < 5:
        res = "ROJA"
    else:
        res = "AMARILLA"
    return res
contraseñaSegura("Argentino")

# Ejercicio 8

print("""
      Ejercicio 1.8
      """)

def ultimosMovimientos(movimientos:list)->str:
    saldo = 0
    for movimiento in movimientos:
        if movimiento[0] == "I":
            saldo = saldo + movimiento[1]
        elif movimiento[0] == "R":
            saldo = saldo - movimiento[1]
    return saldo

print(ultimosMovimientos([("I", 2000),("R", 1000),("R", 500)]))

# Ejercicio 9

print("""
      Ejercicio 1.9
      """)

def tieneVocales(palabra:str)->bool:
    vocales:list = ["a","e","i","o","u"]
    vocalesEncontradas:list = []
    for letra in palabra:
        if pertenece(vocales, letra) and not(pertenece(vocalesEncontradas, letra)):
            vocalesEncontradas += letra
    if len(vocalesEncontradas) >= 3:
        return True
    return False

# Ejercicio 2

# 1)

def posPar(l:list)->list:
    for pos in range (0, len(l)-1, 1):
        if (pos % 2 != 0):
            l[pos] = 0
    return l
    
posPar([1,2,3,4,5,6])

# 2)

def posPar2(l:list([int]))->list:
    listaModificada:list = []
    for pos in range(0, len(l)-1, 1):
        if (pos % 2 != 0):
            listaModificada.append(0)
        else:
            listaModificada.append(l[pos])
    return listaModificada

posPar2([1,2,3,4,5,6])

# 3)

def pertenece(l:list, e:int)->bool:
    res = False
    for elem in l:
        if elem == e:
            res = True
    return res

def quitoVocales(palabra:str)->str:
    vocales:list = ["a","e","i","o","u"]
    palabraSinVocales = ""
    for letra in palabra:
        if not(pertenece(vocales, letra)):
            palabraSinVocales += letra
    return palabraSinVocales

quitoVocales("ariel")

# 4)

def reemplazoVocales(palabra:str)->str:
    vocales:list = ["a","e","i","o","u"]
    palabraSinVocales = ""
    for letra in palabra:
        if not(pertenece(vocales, letra)):
            palabraSinVocales += letra
        else:
            palabraSinVocales += "_"
    return palabraSinVocales

reemplazoVocales("ariel")

# 5)

print("""
      Ejercicio 2.5
      """)

def daVueltaStr(palabra:str)->str:
    reverso = ""
    for i in range (len(palabra)-1, -1, -1):
        reverso += palabra[i]
    return reverso

daVueltaStr("hola")

# Ejercicio 3

# 1)

print("""
      Ejercicio 3.1
      """)

def estudiantes()->list([str]):
    listaDeEstudiantes = []
    salida:str = "listo"
    while not(pertenece(listaDeEstudiantes, salida)):
        nombre:str = input()
        listaDeEstudiantes += [nombre]
    listaDeEstudiantes.remove("listo")
    return listaDeEstudiantes

# 2)

print("""
      Ejercicio 3.2
      """)

def simulacion()->list:
    ultimosMovimientos:list([]) = []
    saldo:int = 0
    while not(pertenece(ultimosMovimientos, ("X"))):
        movimiento:str = input()   
        if movimiento == "C":
            monto:int = int(input())
            saldo = saldo + int(monto)
            ultimosMovimientos.append((movimiento, monto))
        elif movimiento == "D":
            monto:int = int(input())
            saldo -= monto
            ultimosMovimientos.append((movimiento, monto))
        else:
            ultimosMovimientos.append((movimiento))
    ultimosMovimientos.remove(movimiento)
    return ultimosMovimientos

#simulacion()

# 3)

print("""
      Ejercicio 3.3
      """)

# Ejercicio 4)

# 1)

print("""
      Ejercicio 4.1
      """)

def perteneceACadaUno(lista:list, e:int)->list:
    listaPertenecen:list = []
    for i in range(0,len(lista),1):
        if lista[i] == e:
            listaPertenecen.append(True)
        else:
            listaPertenecen.append(False)
    return listaPertenecen

print(perteneceACadaUno([1,2,3,4,5,6,7],4))

# 2)

print("""
      Ejercicio 4.2
      """)

def esMatriz(matriz:list(list()))->bool:
    res = True
    if len(matriz) > 0:
        for i in range(0,len(matriz),1):
            if len(matriz[i]) > 0:
                if i == len(matriz)-1:
                    res = res and True
                elif len(matriz[i]) == len(matriz[i+1]) :
                    res = res and True
                else:
                    res = res and False
            else:
                res = res and False
    else:
        res = False
    return res

print(esMatriz([]))
print(esMatriz([[]]))
print(esMatriz([[1],[2]]))
print(esMatriz([[1,2],[3]]))
print(esMatriz([[1,2],[3,4],[5]]))

def filasOrdenadas(matriz:list(list()))->list:
    listaDeBools:list =[]
    if not(esMatriz(matriz)):
        listaDeBools.append(False)
    else:
        for i in range(0,len(matriz),1):
            if ordenados(matriz[i]):
                listaDeBools.append(True)
            else:
                listaDeBools.append(False)
    return listaDeBools

print(filasOrdenadas([[1,2,3],[4,5,6]]))
print(filasOrdenadas([[1,2,3],[4,7,6]]))

print(6 % 3)