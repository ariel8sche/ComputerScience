$ gcc -Wall -c file1.c -o file1.o
$ gcc -Wall -c main.c -o main.o
$ gcc -Wall file1.o main.o -o binario
/usr/bin/ld: main.o:(.bss+0x0): multiple definition
of `count'; file1.o:(.data+0x0): first defined here
collect2: error: ld returned 1 exit status