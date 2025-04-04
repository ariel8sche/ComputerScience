  CC = gcc
  CFLAGS = -Wall -Wextra -pedantic
  TARGET = binario
  
  all: $(TARGET)
  
  SRCS = funca.c funcb.c main.c
  OBJS = $(SRCS:.c=.o) 

  $(TARGET): $(OBJS)
  	$(CC) $(CFLAGS) $^ -o $@
  
  %.o: %.c
  	$(CC) $(CFLAGS) -c $< -o $@
  
  clean:
  	rm *.o $(TARGET)

  .PHONY: all clean