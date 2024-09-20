def rutaEficiente(ruta,k):
    nafta = 0
    paradas = 0
    i = 0
    while i < len(ruta)-1:
        if nafta < (ruta[i+1] - ruta[i]):
            paradas += 1
            nafta = k
            nafta -= (ruta[i+1] - ruta[i])
        elif nafta >= (ruta[i+1] - ruta[i]):
            nafta -= (ruta[i+1] - ruta[i])
            
        i += 1
            
    return paradas

print(rutaEficiente([0,8,9,14,20],10))