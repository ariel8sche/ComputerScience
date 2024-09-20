from typing import List
from typing import Tuple

# Aclaración: Debido a la versión de Python del CMS, para el tipo Lista y Tupla, la sintaxis de la definición de tipos que deben usar es la siguiente:
# l: List[int]  <--Este es un ejemplo para una lista de enteros.
# t: Tuple[str,str]  <--Este es un ejemplo para una tupla de strings.
# Respetar esta sintaxis, ya que el CMS dirá que no pasó ningún test si usan otra notación.

def encuentroElCamino(origen: str, destino: str, vuelos: List[Tuple[str, str]])->int:
  camino:list = []
  cantidadDeVuelos:int = len(vuelos)
  while cantidadDeVuelos > 0:
    for i in range(0,cantidadDeVuelos,1):
      vuelo = vuelos[i]
      if (origen == vuelo[0]) and (destino == vuelo[1]):
        camino.append([vuelo])
        return len(camino)
      elif origen == vuelo[0]:
        camino.append([vuelo])
        origen = vuelo[1]
        vuelos.remove(vuelos[i])
        vuelos.insert(i, ("Check","Check"))
    cantidadDeVuelos -= 1
  return -1

def sePuedeLlegar(origen: str, destino: str, vuelos: List[Tuple[str, str]]) -> int :
  if len(vuelos) <= 0:
    return -1
  elif len(vuelos) == 1:
    vuelo = vuelos[0]
    if (vuelo[0] == origen) and (vuelo[1] == destino):
      return 1
    else:
      return -1
  else:
    return encuentroElCamino(origen, destino, vuelos)

print("Tiene que dar -1")
print(sePuedeLlegar("Buenos Aires", "Corrientes", []))
print(" ")
print("Tiene que dar 1")
print(sePuedeLlegar("Buenos Aires", "Corrientes",[["Buenos Aires","Corrientes"]]))
print(" ")
print("Tiene que dar -1")
print(sePuedeLlegar("Buenos Aires", "Corrientes", [["Corrientes","Buenos Aires"]]))
print(" ")
print("Tiene que dar 4")
print(sePuedeLlegar("Buenos Aires", "Corrientes", [["Buenos Aires","Cordoba"],["La Pampa","Santiago Del Estero"],["Cordoba", "Santa Fe"],["Santa Fe","Entre Rios"],["Entre Rios", "Corrientes"]]))
print(" ")
print("Tiene que dar 4")
print(sePuedeLlegar("Buenos Aires", "Corrientes", [["La Pampa","Santiago Del Estero"],["San Luis","San Juan"],["Entre Rios", "Corrientes"],["Tierra Del Fuego","La Rioja"],["Cordoba", "Santa Fe"],["Santa Fe","Entre Rios"],["Buenos Aires","Cordoba"]]))
print(" ")
print("Tiene que dar 1")
print(sePuedeLlegar("Buenos Aires", "Corrientes",[["Corrientes","Buenos Aires"],["Buenos Aires","Corrientes"]]))
print(" ")
print("Tiene que dar -1")
print(sePuedeLlegar("Buenos Aires", "Corrientes",[["Buenos Aires","Salta"],["Salta","Buenos Aires"],["Chubut", "Corrientes"]]))
print(" ")
print("Tiene que dar 2")
print(sePuedeLlegar("Rosario", "Jujuy", [["Misiones","Jujuy"],["Salta", "Chubut"],["Rosario","Misiones"]]))
print(" ")
print("Tiene que dar -1")
print(sePuedeLlegar("Rosario", "Jujuy", [["Misiones","Formosa"],["Salta", "Chubut"],["Neuquen","La Pampa"]]))
print(" ")
print("Tiene que dar -1")
print(sePuedeLlegar("A", "B", []))
print(" ")
print("Tiene que dar 1")
print(sePuedeLlegar("A", "B", [("A", "B")]))
print(" ")
print("Tiene que dar -1")
print(sePuedeLlegar("B", "A", [("A", "B")]))
print(" ")
print("Tiene que dar 2")
print(sePuedeLlegar("A", "B", [("A", "C"), ("C", "B")]))
print(" ")
print("Tiene que dar -1")
print(sePuedeLlegar("A", "B", [("A", "C"), ("C", "A"), ("D", "B")]))

if __name__ == '__main__':
  origen = input()
  destino = input()
  vuelos = input()
  
  print(sePuedeLlegar(origen, destino, [tuple(vuelo.split(',')) for vuelo in vuelos.split()]))