.text:

# inicializar el programa
main:
    la a0, arr # Guardo en a0 la direccion del array
    li a1, 12 # Guardo en a1 el largo del array

# recorre el arreglo y acumular

sumatoria:
    mv s0, a0 # Guardo la direccion del array en s0
    mv s1, a1 # Guardo el largo del array en s1
    li s2, 0xffffffff # SUMA antes en 

loop:
    beqz s1, exit
    addi s1, s1, -1
    lw s3, 0(s0)
    mv a0, s1
    addi s0, s0, 4
    andi a0, a0, 1
    bgtz a0, impar
    
    j loop
    
impar:
    xor s2, s2, s3
    j loop     

exit:
    # imprime la suma
    mv a0, s2
    li a7, 34
    ecall
    
    #termina el programa
    li a0, 0
    li a7, 93
    ecall

.data:
    
arr:
    .word 0xffffffff, 0x95555555, 0xf4444444, 0xf1111111
    .word 0xffffff00, 0xf5005555, 0x95444444, 0xf1113311
    .word 0xff00ffff, 0xf5550055, 0xa4444433, 0xa1551111