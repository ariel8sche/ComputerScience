
infoPaisFrancia = {'Capital':'París',
                'Campeonatos de Mundo':2}

infoPaisArgentina = {'Capital':'Buenos Aires',
                'Campeonatos de Mundo':3}

infoPaisChile = {'Capital':'Santiago',
                'Campeonatos de Mundo':0}

infoPaises = {'Chile': infoPaisChile ,
              'Argentina': infoPaisArgentina,
              'Francia':infoPaisFrancia}

for pais, info in infoPaises.items():
    print("Información de " + pais + ": ")
    for clave, valor in info.items():
        print(" - " + clave + ": " + str(valor)) 

print(infoPaises['Argentina']['Capital'])