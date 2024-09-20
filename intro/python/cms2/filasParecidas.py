from typing import List

# Aclaración: Debido a la versión de Python del CMS, para el tipo Lista, la sintaxis de la definición de tipos que deben usar es la siguiente:
# l: List[int]  <--Este es un ejemplo para una lista de enteros.
# Respetar esta sintaxis, ya que el CMS dirá que no pasó ningún test si usan otra notación.

def sumarFila(fila: List[int], n:int) -> list:
  for j in range(0, len(fila), 1):
    fila[j] = fila[j] + n
  return fila

def filasMasN(matriz: List[List[int]], n):
  res = True
  for i in range(0, len(matriz), 1):
    if i == len(matriz)-1:
      res = res and True
    elif sumarFila(matriz[i], n) == matriz[i+1]:
      res = res and True
    else:
      res = res and False
  return res

def filasParecidas(matriz: List[List[int]]) -> bool :
  if len(matriz) == 1:
    return True
  elif not(filasMasN(matriz, abs(matriz[0][0] - matriz[1][0]))):
    return False
  return True

if __name__ == '__main__':
  filas = int(input())
  columnas = int(input())
 
  matriz = []
 
  for i in range(filas):         
    fila = input()
    if len(fila.split()) != columnas:
      print("Fila " + str(i) + " no contiene la cantidad adecuada de columnas")
    matriz.append([int(j) for j in fila.split()])
  
  print(filasParecidas(matriz))