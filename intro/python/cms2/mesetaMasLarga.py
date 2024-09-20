from typing import List

# Aclaración: Debido a la versión de Python del CMS, para el tipo Lista, la sintaxis de la definición de tipos que deben usar es la siguiente:
# l: List[int]  <--Este es un ejemplo para una lista de enteros.
# Respetar esta sintaxis, ya que el CMS dirá que no pasó ningún test si usan otra notación.
def longitudDeMeseta(l: List[int]) -> int:
  mayorLongitudActual:int = 1
  meseta:list = []
  for i in range (0, len(l), 1):   
    if i == (len(l)-1):
      meseta.append(l[i])
      longitudDeLaMeseta:int = len(meseta)
      if longitudDeLaMeseta > mayorLongitudActual:
        mayorLongitudActual = longitudDeLaMeseta
    elif l[i] == l[i+1]:
      meseta.append(l[i])
      longitudDeLaMeseta:int = len(meseta)
    elif l[i] != l[i+1]:
      meseta.append(l[i])
      longitudDeLaMeseta:int = len(meseta)
      if longitudDeLaMeseta > mayorLongitudActual:
        mayorLongitudActual = longitudDeLaMeseta
      meseta = []
  return mayorLongitudActual

def mesetaMasLarga(l: List[int]) -> int :
  if len(l) == 1:
    return 1
  elif len(l) > 1:
    return longitudDeMeseta(l)
  return 0

if __name__ == '__main__':
  x = input()
  print(mesetaMasLarga([int(j) for j in x.split()]))