#include <sys/wait.h>
#include <unistd.h>
#include <syscall.h>
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <signal.h>

enum {READ, WRITE};

int pipe_list[3][2];

int number;

void child1_process() {

    close(pipe_list[0][WRITE]); // Cierra el extremo de escritura del pipe del padre
    close(pipe_list[1][READ]);  // Cierra el extremo de lectura del pipe del hijo1
    close(pipe_list[2][READ]);  // Cierra el extremo de lectura del pipe
    close(pipe_list[2][WRITE]); // Cierra el extremo de escritura del pipe

    read(pipe_list[0][READ], &number, sizeof(int));

    while ( number <= 50) {
        printf("El hijo 1 recibe el numero: %d\n", number);
        fflush(stdout);
        number += 1;
        write(pipe_list[1][WRITE], &number, sizeof(int));
        printf("El hijo 1 envia el numero: %d\n", number);
        fflush(stdout);
        read(pipe_list[0][READ], &number, sizeof(int));
    }
    close(pipe_list[0][READ]);
    close(pipe_list[1][WRITE]);
    exit(EXIT_SUCCESS);
}

void child2_process() {

    close(pipe_list[0][READ]);  // Cierra el extremo de lectura del pipe del padre
    close(pipe_list[0][WRITE]); // Cierra el extremo de escritura del pipe del padre
    close(pipe_list[1][WRITE]);  // Cierra el extremo de escritura del pipe del hijo1
    close(pipe_list[2][READ]); // Cierra el extremo de lectura del pipe del hijo2

    read(pipe_list[1][READ], &number, sizeof(int));

    while (number <= 50) {
        printf("El hijo 2 recibe el numero: %d\n", number);
        fflush(stdout);
        number += 1;
        printf("El hijo 2 envia el numero: %d\n", number);
        fflush(stdout);
        write(pipe_list[2][WRITE], &number, sizeof(int));
        read(pipe_list[1][READ], &number, sizeof(int));
    }
    close(pipe_list[1][READ]);
    close(pipe_list[2][WRITE]);
    exit(EXIT_SUCCESS);
}

void main(void){

    for (int i = 0; i < 3; i++) {
        if (pipe(pipe_list[i]) == -1) {
            perror("pipe");
            exit(1);
        }
    }

    pid_t pid_hijo1 = fork();

    if (pid_hijo1 == 0) {
        child1_process();
    }
    else {
        pid_t pid_hijo2 = fork();

        if (pid_hijo2 == 0) {
            child2_process();
        }   
        else {
            number = 0;

            close(pipe_list[0][READ]);  // Cierra el extremo de lectura del pipe del padre
            close(pipe_list[1][READ]);  // Cierra el extremo de lectura del pipe del hijo1
            close(pipe_list[1][WRITE]); // Cierra el extremo de escritura del pipe del hijo1
            close(pipe_list[2][WRITE]); // Cierra el extremo de escritura del pipe del hijo2

            while (number <= 50) {
                printf("El padre envia el numero: %d\n", number);
                fflush(stdout);
                write(pipe_list[0][WRITE], &number, sizeof(int));
                read(pipe_list[2][READ], &number, sizeof(int));
                printf("El padre recibe el numero: %d\n", number);
                fflush(stdout);
                number += 1;
            }
            close(pipe_list[0][WRITE]);
            close(pipe_list[2][READ]);
            wait(NULL);
            wait(NULL);
            exit(EXIT_SUCCESS);

        }
    }
}