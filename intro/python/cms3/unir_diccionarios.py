from typing import List
from typing import Dict
import json

def unir_diccionarios(a_unir: List[Dict[str,int]]) -> Dict[str,List[str]]:
  claves:List = []
  nuevo_diccionario = {}
  for diccionario in a_unir:
      for clave in dict.keys(diccionario):
        if clave in nuevo_diccionario:
          nuevo_diccionario[clave] = nuevo_diccionario[clave] + [diccionario[clave]]
        else:
          nuevo_diccionario[clave] = [diccionario[clave]]
        
  return nuevo_diccionario

if __name__ == '__main__':
  x = json.loads(input()) # Ejemplo de input: [{"a":2},{"b":3,"a":1}]
  print(unir_diccionarios(x))