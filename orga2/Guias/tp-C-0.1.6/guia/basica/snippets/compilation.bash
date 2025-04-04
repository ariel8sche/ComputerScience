  $ gcc -c funca.c -o funca.o
  $ gcc -c funcb.c -o funcb.o
  $ gcc -c main.c -o main.o
  $ gcc funca.o funcb.o main.o -o binario
  $ ./binario
  Hola, soy A!
  Hola, soy B!