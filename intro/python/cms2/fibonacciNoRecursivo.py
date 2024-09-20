import sys

def fibonacciNoRecursivo(n: int) -> int:
  secuenciaFibonacci:list = []
  primerFibonacci:int = 0
  secuenciaFibonacci.append(primerFibonacci)
  segunfoFibonacci:int = 1
  secuenciaFibonacci.append(segunfoFibonacci)
  if n == 0:
    return primerFibonacci
  elif n == 1:
    return segunfoFibonacci
  else:
    while len(secuenciaFibonacci) < n+1:
      siguienteFibonacci:int = primerFibonacci + segunfoFibonacci
      secuenciaFibonacci.append(siguienteFibonacci)
      primerFibonacci = segunfoFibonacci
      segunfoFibonacci = siguienteFibonacci
    return siguienteFibonacci
  
if __name__ == '__main__':
  x = int(input())
  print(fibonacciNoRecursivo(x))
