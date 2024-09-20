import math

# Ejercicio 1

# 1)

print("""
Ejercicio 1.1
      """)

def raizDe2()->int:
    resultado = round(math.sqrt(2),4)
    return resultado

print(raizDe2())

# 2)

print("""
Ejercicio 1.2
      """)

"""
problema imprimir hola () {
    requiere: { True }
    asegura: { imprime "hola" por consola}
}
"""

def imprimir_hola()->str:
    return print("hola")
    
imprimir_hola()

# 3)

print("""
Ejercicio 1.3
      """)


def imprimir_un_verso()->str:
    return print("""
           Dios en el Cielo y en la Tierra
           Como en Malvinas: preparado pa' la guerra
           Es la ilusión por la tercera
           40 millones te siguen donde sea 
           """)
           
imprimir_un_verso()

# 4)

print("""
Ejercicio 1.4
      """)

"""
problema factorial 2 () : Z{
    requiere: { True }
    asegura: {res = 2!}
}
"""

def factorial_de_dos()->int:
    resultado = math.factorial(2)
    return print(resultado)

factorial_de_dos()

# 5)

print("""
Ejercicio 1.5
      """)

"""
problema factorial 3 () : Z{
    requiere: { True }
    asegura: {res = 3!}
}
"""

def factorial_de_tres()->int:
    resultado = math.factorial(3)
    return resultado

print(factorial_de_tres())

# 6)

print("""
Ejercicio 1.6
      """)

"""
problema factorial 4 () : Z{
    requiere: { True }
    asegura: {res = 4!}
}
"""

def factorial_de_cuatro()->int:
    resultado = math.factorial(4)
    return resultado

print(factorial_de_cuatro())

# 7)

print("""
Ejercicio 1.7
      """)

"""
problema factorial 5 () : Z{
    requiere: { True }
    asegura: {res = 5!}
}
"""

def factorial_de_cinco()->int:
    resultado = math.factorial(5)
    return resultado

print(factorial_de_cinco())

# Ejercicio 2

# 1)

print("""
Ejercicio 2.1
      """)

"""
problema imprimir saludo (in nombre: String) {
    requiere: { True }
    asegura: {imprime “Hola < nombre >”por pantalla}
}
"""

def imprimir_saludo(nombre:str)->str:
    return nombre

print(imprimir_saludo("Ariel"))

print("""
Ejercicio 2.2
      """)

def raiz_cuadrada_de(numero:int)->int:
    resultado = math.sqrt(numero)
    return resultado

print(raiz_cuadrada_de(4))

# 3)

print("""
Ejercicio 2.3
      """)

def imprimir_dos_veces(estribillo:str)->str:
    return print(estribillo * 2)

imprimir_dos_veces("Dios en el Cielo y en la Tierra\nComo en Malvinas: preparado pa' la guerra\nEs la ilusión por la tercera\n40 millones te siguen donde sea\n")
           
# 4)

print("""
Ejercicio 2.4
      """)

"""
problema es multiplo de (in n: Z, in m:Z) {
    requiere: { m /= 0 }
    asegura: {res = True ↔(∃k : Z)(n = m * k)}
}
"""

def es_multiplo(n:int, m:int)->bool:
    if ((n % m) == 0):
        return True
    return False

print(es_multiplo(8, 4))
print(es_multiplo(8, 5))
print(es_multiplo(2004, 400))
print(es_multiplo(2004, 4))
print(es_multiplo(2004, 100))

# 5)

print("""
Ejercicio 2.5
      """)

def es_par(numero)->bool:
    resultado = numero % 2
    if (resultado == 0):
        return True
    return False

print(es_par(2))
print(es_par(3))


# 6)

print("""
Ejercicio 2.6
      """)

def cantidad_de_pizzas(comensales:int, min_cant_de_porciones:int)->int:
    resultado = math.ceil((comensales * min_cant_de_porciones) / 8)
    print(resultado) 

cantidad_de_pizzas(4, 3)

# Ejercicio 3

# 1)

print("""
Ejercicio 3.1
      """)

def alguno_es_0(numero1:int, numero2:int)->bool:
    if (numero1 == 0) | (numero2 == 0):
        return print(True)
    return print(False)

alguno_es_0(1, 2)
alguno_es_0(1, 0)

# 2)

print("""
Ejercicio 3.2
      """)

def ambos_son_0(numero1:int, numero2:int)->bool:
    if (numero1 == 0) & (numero2 == 0):
        return print(True)
    return print(False)

ambos_son_0(3, 2)
ambos_son_0(0, 0)

# 3)

print("""
Ejercicio 3.3
      """)

"""
problema es nombre largo (in nombre: String) : Bool {
    requiere: { True }
    asegura: {res = True ↔ 3 ≤ |nombre| ≤8}
}
"""

def es_nombre_largo(nombre:str)->bool:
    if (3 <= len(nombre) <= 8):
        return print(True)
    return print(False)

es_nombre_largo("Ariel")
es_nombre_largo("Hermenegildo")

# 4)

print("""
Ejercicio 3.4
      """)

def es_bisiesto(año:int)->bool:
    if (año % 400 == 0) | (año % 4 == 0 and año % 100 != 0):
        return print(True)
    else:
        return print(False)

es_bisiesto(2004)
es_bisiesto(2002)

# Ejercicio 4

# 1)

print("""
Ejercicio 4.1
      """)

def peso_pino(metros_pino:int)->int:
    if (metros_pino <= 3):
        peso = metros_pino * 300
        return peso
    else:
        peso = 900 + ((metros_pino - 3)*200)
        return peso

print(peso_pino(5))
print(peso_pino(2))

# 2)

print("""
Ejercicio 4.2
      """)

def es_peso_util(peso:int)->bool:
    if (400 <= peso <= 1000):
        return True
    else:
        return False
    
print(es_peso_util(1300))
print(es_peso_util(600))

# 3)

print("""
Ejercicio 4.3
      """)
 
def sirve_pino(metros_pino:int)->bool:
    return print(es_peso_util(peso_pino(metros_pino)))

sirve_pino(3)
sirve_pino(5)

# Ejercicio 5

# 1)

print("""
Ejercicio 5.1
      """)

def devolver_el_doble_si_es_par(numero:int)->int:
    if es_par(numero):
        return (numero * 2)
    else:
        return numero
    
print(devolver_el_doble_si_es_par(2))

# 2)

print("""
Ejercicio 5.2
      """)

def devolver_valor_si_es_par_sino_el_que_sigue(numero:int)->int:
    if es_par(numero):
        return numero
    else:
        return(numero + 1)

print(devolver_valor_si_es_par_sino_el_que_sigue(2))
print(devolver_valor_si_es_par_sino_el_que_sigue(3))

# 3)

print("""
Ejercicio 5.3
      """)

def devolver_el_doble_si_es_multiplo3_el_triple_si_es_multiplo9(numero:int)->int:
    if es_multiplo(numero, 3):
        return numero * 2
    else:
        if es_multiplo(numero, 9):
            return numero * 3
        return numero

print(devolver_el_doble_si_es_multiplo3_el_triple_si_es_multiplo9(9))
print(devolver_el_doble_si_es_multiplo3_el_triple_si_es_multiplo9(4))

# 4)

print("""
Ejercicio 5.4
      """)

def tu_nombre_es(nombre:str)->str:
    if len(nombre) >= 5:
        return "Tu nombre tiene muchas letras"
    else:
        return "Tu nombre tiene menos de 5 caracteres"
    
print(tu_nombre_es("Ari"))
print(tu_nombre_es("Ariel"))

# 4)

print("""
Ejercicio 5.4
      """)

def queTenesQueHacer(sexo:str, edad:int)->str:
    if edad < 18:
        print("Anda de vacaciones")
    elif (sexo == "F" and edad >= 60) or (sexo == "M" and edad >= 65):
        print("Anda de vacaiones")
    else: 
        print("Anda a trabajar")
        
queTenesQueHacer("M", 8)

# Ejercicio 6

# 1)

print("""
Ejercicio 6.1
      """)

def imprimir_1a10()->int:
    indice = 1
    while indice < 11:
        print(indice)
        indice = indice + 1
        
imprimir_1a10()

# 2)

print("""
Ejercicio 6.2
      """)

def imprimirNumPares()->int:
    indice:int = 10
    while indice < 41:
        if es_par(indice):
            print(indice)
        indice = indice + 1
        
imprimirNumPares()
        
# 3)

print("""
Ejercicio 6.3
      """)

def imprimirEco()->str:
    cantidadDeVeces:int = 1
    while cantidadDeVeces < 11:
        print("eco")
        cantidadDeVeces = cantidadDeVeces + 1

imprimirEco()

# 4)

print("""
Ejercicio 6.4
      """)

def cuentaRegresiva(segundos:int)->int:
    while segundos > 0:
        print(segundos)
        segundos = segundos - 1
    print("Despegue")
    
cuentaRegresiva(5)

# 5)

print("""
Ejercicio 6.5
      """)

def maquinaDelTiempo(añoDePartida:int, añoDeLlegada:int)->str:
    añoActual:int = añoDePartida
    while añoActual > añoDeLlegada:
        añoActual = añoActual - 1
        print("Viajo un año al pasado, estamos en el año " + str(añoActual))

maquinaDelTiempo(2023, 2018)

# 6)

print("""
Ejercicio 6.6
      """)
"""
def maquinaDelTiempoV2()->str:
    añoActual:int = 43
    while añoActual > -384:
        if añoActual >= -377:
            añoActual = añoActual - 20
            print("Viajo 20 años al pasado, estamos en el año " + str(añoActual))
        else:
            añoActual = añoActual - 1
            print("Viajo un año al pasado, estamos en el año " + str(añoActual))

maquinaDelTiempoV2()
"""

# Ejercicio 7

# 1)

print("""
Ejercicio 7.1
      """)

def imprimir_1a10F()->str:
    for i in range (1, 11, 1):
        print(i)
        
imprimir_1a10F()

# 2)

print("""
Ejercicio 7.2
      """)

def imprimirNumParesF()->str:
    for i in range (10, 41, 2):
        print(i)
        
imprimirNumParesF()

# 3)

print("""
Ejercicio 7.3
      """)

def imprimirEcoF()->str:
    for i in range (1, 11, 1):
        print("eco")

imprimirEcoF()

# 4)

print("""
Ejercicio 7.4
      """)

def cuentaRegresivaF(segundos:int)->str:
    for segundo in range (segundos, 0, -1):
        print(segundo)
    print("Despegue")

cuentaRegresivaF(4)

# 5)

print("""
Ejercicio 7.5
      """)

def maquinaDelTiempoF(añoDePartida:int, añosDeLlegada:int)->str:
    for año in range (añoDePartida, (añosDeLlegada - 1), -1):
        print("Viajó un año al pasado, estamos en el año " + str(año))
        
maquinaDelTiempoF(2023, 2018)

# 6)

print("""
Ejercicio 7.6
      """)

# Ejercicio 8

# Ejercicio 9 

def rt(x: int, g: int) -> int:
    g = g + 1
    return x + g

g: int = 0
def ro(x: int) -> int:
    global g
    g = g + 1
    return x + g

# 1)

print("""
Ejercicio 9.1
      """)


print(ro(1))

print("""
      
      """)

# 2)

print("""
Ejercicio 9.2
      """)

print(rt(1, 0))

print("""
      
      """)

