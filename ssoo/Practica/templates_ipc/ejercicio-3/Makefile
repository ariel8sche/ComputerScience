CFLAGS=-g -Wall

.PHONY: all clean perf

all: ejercicio_3

%: %.c

clean:
	rm -f ejercicio_3_template

N ?= 1
perf: ejercicio_3_template
	perf stat -r 5 ./ejercicio_3_template ${N}
