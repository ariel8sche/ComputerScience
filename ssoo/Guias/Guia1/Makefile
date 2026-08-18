CC = gcc
CFLAGS = -Wall -Wextra -std=c11

run:
	gcc $(CFLAGS) ejercicio$(EJ).c -o ejercicio$(EJ)
	./ejercicio$(EJ)

clean:
	rm -f $(basename $(wildcard ejercicio*.c))