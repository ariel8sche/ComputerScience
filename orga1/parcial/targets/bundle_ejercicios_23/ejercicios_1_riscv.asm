.text:

# inicializar programa

# recorrer arreglo y acumular

exit:
    # Imprime la suma
    mv a0, t4
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
