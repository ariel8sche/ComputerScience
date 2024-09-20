#Veamos que sucede con los acentos y los signos de admiracion
archivo = open('himno.txt')

for linea in archivo.readlines():
    print(linea)

archivo.close()

#El encoding de un archivo se refiere a la forma en que se codifican los caracteres dentro del archivo. Especifica cómo se representan los caracteres en binario para que puedan ser almacenados y procesados correctamente. Cada caracter tiene un valor numérico asociado en el sistema de encoding utilizado.
#Existen diferentes esquemas de encoding, como ASCII, UTF-8, UTF-16, entre otros. Cada uno de estos esquemas utiliza una tabla de mapeo que asigna un número único a cada caracter. La elección del encoding adecuado es crucial para garantizar que los caracteres se interpreten correctamente al leer o escribir un archivo.
archivo = open('himno.txt', "r", encoding='utf8')

for linea in archivo.readlines():
    print(linea)

archivo.close()