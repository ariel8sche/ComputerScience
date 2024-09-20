# Schenone Duarte Ariel Eduardo
# 431/22

.text:

main: 
    # inicializar programa
    la a0, src # Cargo la direccion del array fuente al registro a0
    la a1, dst # Cargo la direccion del array destino al registro a0
    li a2, 12 # Cargo el largo del array fuente al registro a2

loop_iterar:    
    # recorrer arreglo y mover
    beqz a2, imprimir # Miro si el largo del array fuente es 0, si es 0 salto a la etiqueta "imprimir" si no sigo iterando
    
    addi a2, a2, -1 # Le resto 1 al largo del array fuente 
    
    lw s0, 0(a0) # Agarro el primer elemento del array fuente(una palabra) y lo guardo en s0
    lw s1, 0(a1) # Agarro el primer elemento del array destino(una palabra) y lo guardo en s1
    
    xor s1, s1, s0 # Hago el xor entre el registro s0 y el registro s1, que es donde tengo los elementos de cada array y lo guardo en el registro s1
    
    sw s1 0(a1) # Guardo el valor del registro s1, en la direccion de memoria guardada en a1 perteneciente al array destino
    
    addi a0, a0, 4 # Sumo 4 a la direccion de memoria del array fuente guardada en el registro a0
    addi a1, a1, 4 # Sumo 4 a la direccion de memoria del array destino guardada en el registro a1
    
    j loop_iterar # Loopea

imprimir:
    la t2, dst
    # Cantidad de datos.
    li t3, 12
loop_imprimir:
    beqz t3, exit
    addi t3, t3, -1
    lw t4, 0(t2)
    # Imprime el resultado
    mv a0, t4
    li a7, 34
    ecall
    addi t2, t2, 4

    j loop_imprimir
exit:
    # Termina el programa.
    li a0, 0
    li a7, 93
    ecall

.data:
src:
.word 0xffffffff, 0x95555555, 0xf4444444, 0xf1111111
.word 0xffffff00, 0xf5005555, 0x95444444, 0xf1113311
.word 0xff00ffff, 0xf5550055, 0xa4444433, 0xa1551111      
dst:
.word 0xf5005555, 0x95444444, 0xf1113311, 0xffffff00
.word 0xf1111111, 0xffffffff, 0x95555555, 0xf4444444
.word 0xa1551111, 0xff00ffff, 0xf5550055, 0xa4444433
