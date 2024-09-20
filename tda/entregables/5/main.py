def main():
    # Guardo el input
    houses = input()
    city = []
    while houses != 0:
        input_str = input()
        street = [int(i) for i in input_str.split()]
        city.append(street)
        houses = int(input())
    # Termino de guardar el input
    for i in range (len(city)):
        s = 0
        b = 0
        work = 0
        while True: 
            while (s < len(city[i]) and city[i][s] >= 0):
                s+=1 # Mientras no encuentre a alquien que quiera vender avanzo
            while (b < len(city[i]) and city[i][b] <= 0):
                b+=1 # Mientras no encuentre a alguien que quiera comprar avanzo
            if (s == len(city[i]) or b == len(city[i])):
                break # Si llegue al final de las casas corto
            else:
                min_wine = min(city[i][b], -city[i][s]) # Minimo de vinos que se pueden comprar o vender
                work += min_wine * abs(s - b) # Sumo el trabajo que llevo mover los vinos
                city[i][b] -= min_wine # Le resto los vinos que compro
                city[i][s] += min_wine # Le sumo los vinos que vendio
        # Imprimo el resultado
        print(work)

main()