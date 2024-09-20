# Schenone Duarte Ariel Eduardo
# 431/22

.text:

main:
    # inicializar programa
    la a0, arr # Guardo en a0 la direccion del array
    li a1, 12 # Guardo en a1 el largo del array

suma:
    mv s0, a0 # Guardo la direccion del array en s0
    mv s1, a1 # Guardo el largo del array en s1
    li s2, 0xffffffff # SUMA

loop:
    # recorrer arreglo y acumular
    beqz s1, exit # Salto a exit si el largo es 0
    lh s3, 0(s0) # Cargo media palabra del array y la guardo en s3
    mv a0, s1 # Muevo a a0 el largo del array para mirar si es impar
    addi s1, s1, -1 # Le resto 1 al largo
    addi s0, s0, 2 # Sumo 2 al la direccion del array para que tome la siguente media palabra
    andi a0, a0, 1 # Veo si es el ?ndice es impar
    bgtz a0, impar # Si es par salto a la etiqueta impar
    
    j loop # Loopeo

impar:
    and s2, s2, s3 # Hago el and entre lo que tenia en SUMA y la palabra que tome del array
    j loop # Salto a loop para seguir mirando los otros elementos del array

exit:
    # Imprime la suma
    mv a0, s2
    li a7, 34
    ecall

    # Termina el programa.
    li a0, 0
    li a7, 93
    ecall

.data:
arr:
.half	0xffff, 0x9555, 0xf444, 0xf111
.half	0xffff, 0xf500, 0x9544, 0xf111
.half	0xff00, 0xf555, 0xa444, 0xa155  