# NOTA: Instalar pip install googletrans==3.1.0a0

# problema traducirTexto(in nombreArchivo: string, in idiomaOrigen: string, in idiomaDestino: string) {
    # requiere: existe el archivo origen
    # asegura: se crea un archivo llamado idiomaDestino_nombreArchivo
    #              cuyo contenido será el resultado de traducir cada una de sus filas
    # asegura: si el archivo archivoDestino existia, se borrará todo su contenido anterior
# }

from googletrans import Translator

def traducirTexto(archivoOrigen: str, idiomaOrigen: str, idiomaDestino: str):
    archivo = open(archivoOrigen, "r", encoding='utf8')
    nombreArchivoDestino =  idiomaDestino + "-" + archivoOrigen
    destino = open(nombreArchivoDestino, "w", encoding='utf8')
    destino.truncate() #Se borra el archivo para poder correr el ejemplo mas de una vez

    translator = Translator()

    for linea in archivo.readlines():
        traduccion = translator.translate(linea, scr=idiomaOrigen, dest=idiomaDestino)
        destino.write(traduccion.text + "\n" ) #\n es un salto de linea

    destino.close()
    archivo.close()


archivo: str = 'himno.txt'
idiomaOrigen: str = 'es'

traducirTexto(archivo, idiomaOrigen, 'en')
traducirTexto(archivo, idiomaOrigen, 'fr')
traducirTexto(archivo, idiomaOrigen, 'it')

