  CC = gcc
  CFLAGS = -Wall -Wextra -pedantic
  TARGET = binario
  
  all: $(TARGET)
  
  $(TARGET): funca.o funcb.o main.o
  	$(CC) $(CFLAGS) $^ -o $@
  
  main.o: main.c
  	$(CC) $(CFLAGS) -c $< -o $@
  
  funca.o: funca.c
  	$(CC) $(CFLAGS) -c $< -o $@
  
  funcb.o: funcb.c
  	$(CC) $(CFLAGS) -c $< -o $@
  
  clean:
  	rm *.o $(TARGET)

  .PHONY: all clean