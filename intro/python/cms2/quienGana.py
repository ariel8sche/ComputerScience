import sys

def piedraGanaATijera(j1: str, j2: str) -> str:
  if j1 == "Piedra":
    return "Jugador1" 
  elif j2 == "Piedra":
    return "Jugador2"

def tijeraGanaAPapel(j1: str, j2: str) -> str:
  if j1 == "Tijera":
    return "Jugador1"
  elif j2 == "Tijera":
    return "Jugador2"

def papelGanaAPiedra(j1: str, j2: str) -> str:
  if j1 == "Papel":
    return "Jugador1"
  elif j2 == "Papel":
    return "Jugador2"

def quienGana(j1: str, j2: str) -> str :
  if (j1 == "Papel" and j2 == "Piedra") or (j2 == "Papel" and j1 == "Piedra"):
    return papelGanaAPiedra(j1,j2)
  elif (j1 == "Piedra" and j2 == "Tijera") or (j2 == "Piedra" and j1 == "Tijera"):
    return piedraGanaATijera(j1, j2)
  elif (j1 == "Tijera" and j2 == "Papel") or (j2 == "Tijera" and j1 == "Papel"):
    return tijeraGanaAPapel(j1, j2)
  return "Empate"

if __name__ == '__main__':
  x = input()
  jug = str.split(x)
  print(quienGana(jug[0], jug[1]))