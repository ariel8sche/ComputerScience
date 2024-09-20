from queue import Queue

# El tipo de fila debería ser Queue[int], pero la versión de python del CMS no lo soporta. Usaremos en su lugar simplemente "Queue"

def ingresaFila(minActual:int, minUltIngreso:int):
  res = False
  if (minActual == 0) or (minActual == minUltIngreso + 4):
    res = True
  return res

def atiendeCaja1(minActual:int, minAte1:int):
  res = False
  if (minActual == 1) or (minActual == minAte1 + 10):
    res = True
  return res  
 
def atiendeCaja2(minActual:int, minAte2:int):
  res = False
  if (minActual == 3) or (minActual == minAte2 + 4):
    res = True
  return res  

def atiendeCaja3(minActual:int, minAte3:int):
  res = False
  if (minActual == 2) or (minActual == minAte3 + 4):
    res = True
  return res

def vuelveALaFila(minActual:int, minAte3:int):
  res = False
  if (minActual == minAte3 + 3):
    res = True
  return res

def avanzarFila(fila: Queue, min: int):
  minActual:int = 0
  minAte1:int = 0
  minAte2:int = 0
  minAte3:int = 0
  minUltIngreso:int = 0
  ultAtendido3:int = 0
  ultTurno:int = fila.qsize()
  
  if min == 0:
    fila.put(ultTurno + 1)
  
  else:
    while (min + 1) > minActual:
      if ingresaFila(minActual, minUltIngreso):
        fila.put(ultTurno + 1)
        ultTurno += 1
        minUltIngreso = minActual
        minActual += 1
        
      elif atiendeCaja1(minActual, minAte1):
        fila.get()
        minAte1 = minActual
        minActual += 1
        
      elif atiendeCaja2(minActual, minAte2):
        if fila.empty():    
          minAte2 = minActual
          minActual += 1
        else: 
          fila.get()
          minAte2 = minActual
          minActual += 1
        
      elif atiendeCaja3(minActual, minAte3):
        if fila.empty():
          minAte3 = minActual
          minActual += 1
        else:
          ultAtendido3 = fila.get()
          minAte3 = minActual
          minActual += 1
        
      elif vuelveALaFila(minActual, minAte3):
        fila.put(ultAtendido3)
        minActual += 1
        
      else:
        minActual += 1

if __name__ == '__main__':
  fila: Queue = Queue()
  fila_inicial: int = int(input())
  for numero in range(1, fila_inicial+1):
    fila.put(numero)
  min: int = int(input())
  avanzarFila(fila, min)
  res = []
  for i in range(0, fila.qsize()):
    res.append(fila.get())
  print(res)

# Caja1: Empieza a atender 10:01, y atiende a una persona cada 10 minutos
# Caja2: Empieza a atender 10:03, atiende a una persona cada 4 minutos
# Caja3: Empieza a atender 10:02, y atiende una persona cada 4 minutos, pero no le resuelve el problema y la persona debe volver a la fila (se va al final y tarda 3 min en llegar. Es decir, la persona que fue atendida 10:02 vuelve a entrar a la fila a las 10:05)
# La fila empieza con las n personas que llegaron antes de que abra el banco. Cuando abre (a las 10), cada 4 minutos llega una nueva persona a la fila (la primera entra a las 10:00)

