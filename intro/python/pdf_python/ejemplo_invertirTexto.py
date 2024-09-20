# problema invertirTexto(in nombreArchivo: string, archivoDestino: string) {
    # requiere: existe el archivo origen
    # asegura: se crea un archivo llamado archivoDestino cuyo contenido será el resultado
    #              de hacer un reverse en cada una de sus filas
    # asegura: si el archivo archivoDestino existia, se borrará todo su contenido anterior
# }

def invertirTexto(archivoOrigen: str, archivoDestino: str):
    contenido = []
    archivo = open(archivoOrigen, "r", encoding='utf8')

    for linea in archivo.readlines():
        contenido.insert(0, linea)

    archivo.close()

    destino = open(archivoDestino, "w", encoding='utf8')
    destino.truncate() #Borra todo el contenido de un archivo

    for linea in contenido:
        linea = linea [::-1] #Esto se llama slicing: permite extraer una subcadena linea[inicio:fin:paso] [::-1] extrae todo de atras para adelante
        destino.write(linea)

    destino.close()


archivoOrigen = 'himno.txt'
archivoDestino = 'himno-endiablado.txt'
invertirTexto(archivoOrigen, archivoDestino)