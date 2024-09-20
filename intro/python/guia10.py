import random
from queue import LifoQueue as Pila
from queue import Queue as Cola

"""f = open("jugadores.txt","r")

primer_jugador :str = f.readline()
segundo_jugador :str = f.readline()

print(segundo_jugador)

lista_de_jugadores:list = []

ultima_linea:str = ""
termine_de_leer:bool = False
while (not(termine_de_leer)):
    ultima_linea = f.readline()
    lista_de_jugadores.append(ultima_linea)
    termine_de_leer = ultima_linea == ""

f.close()

f = open("jugadors.txt","w")

f.write("Molina \n")
f.write("MacAllister \n")

for jugador in lista_de_jugadores:
    f.write(jugador)
    
f.close()    


def contar_lineas(archivo:str) -> int:
    j = open(archivo, "r")
    
    lista_de_lineas:list = []

    ultima_linea:str = ""
    termine_de_leer:bool = False
    while (not(termine_de_leer)):
        ultima_linea = j.readline()
        lista_de_lineas.append(ultima_linea)
        termine_de_leer = ultima_linea == ""

    print(len(lista_de_lineas)-1)

    j.close()
    
contar_lineas("jugadores.txt")



def esta_palabra_en_lista(palabra:str, lineas:list)->bool:
    res :bool = False
    i :int = 0
    while (not res) and (i < len(lineas)):
        linea: str = lineas[i]
        res = palabra in linea
        i += 1
    return res

def existe_palabra(palabra:str, archivo:str)->bool:
    archivo = open(archivo, "r")
    lineas:list = archivo.readlines()
    archivo.close()
    return esta_palabra_en_lista(palabra, lineas)

print(existe_palabra("alvarez","jugadores.txt"))
print(existe_palabra("messi","jugadores.txt"))

def cantidad_de_apariciones(palabra: str , nombre_archivo : str)-> int :
    
    archivo = open(nombre_archivo, "r")
    lineas:list = archivo.readlines()
    archivo.close()
    
    i :int = 0
    cantidad:int = 0
    while (i < len(lineas)):
        linea: str = lineas[i]
        if palabra in linea:
            cantidad += 1
        i += 1

print(cantidad_de_apariciones("messi","jugadores.txt"))
"""

# PILAS

# Ejercicio 8

def generarNrosAlAzar(n:int, desde:int, hasta:int) -> list:
    listaNros = []
    while len(listaNros) < n:
        listaNros.append(random.randint(desde, hasta))
    return listaNros

generarNrosAlAzar(4, 2, 8)

# Ejercicio 9
 
def pilaNrosAlAzar(n:int, desde:int, hasta:int)-> Pila :
    listaDeNrosAlAzar:list(int) = generarNrosAlAzar(n, desde, hasta)
    p = Pila() 
    for numero in listaDeNrosAlAzar:
        p.put(numero)
    return p

print(pilaNrosAlAzar(3, 1, 4) )

# Ejercicio 10

print()
def cantidadElementos(p:Pila) -> int:
    cantidad:int = 0
    while p.empty() != True:
        p.get()
        cantidad += 1
    return cantidad

print(cantidadElementos(pilaNrosAlAzar(5,1,10)))

# Ejericio 11

def buscarElMaximo(p:Pila)-> int:
    maximo:int = 0
    while p.empty() != True:
        elemento = p.get()
        if elemento > maximo:
            maximo = elemento
    return maximo

print(buscarElMaximo(pilaNrosAlAzar(3,1,10)))

def estaBienBalanceada(s:str)-> bool:
    p = Pila()
    res:bool = False
    parentesisAbiertos:int = 0
    for letra in s:        
        if letra == "(":
            p.put(letra)
            parentesisAbiertos += 1
        elif letra == ")":
            p.put(letra)
            parentesisAbiertos -= 1
    if parentesisAbiertos == 0:
        res = True
    return res

print(estaBienBalanceada("((433)+(423))"))

# COLAS

# Ejercicio 13

def encolar(n:int, desde:int, hasta:int)->Cola:
    listaDeNros:list(int) = []
    listaDeNros = generarNrosAlAzar(n, desde, hasta)
    c = Cola()
    for numero in listaDeNros:
        c.put(numero)
    return c

# Ejercicio 14

def cantidadElementosBis(c:Cola)->int:
    cantidad:int = 0
    while c.empty() != True:
        c.get()
        cantidad += 1
    return cantidad

cantidadElementosBis(encolar(3,1,5))

# Ejercicio 15

def buscarMaximo(c:Cola)->int:
    maximo:int = 0
    while c.empty != True:
        elemento = c.get
        if elemento > maximo:
            maximo = elemento
    return maximo

def esPrimo(n:int)->bool:
    divisores:int = 0
    for i in range(2, n, 1):
        if (n % i == 0):
            divisores += 1
    if (divisores == 0):
        return True
    else:
        return False