#include <sys/wait.h>
#include <unistd.h>
#include <syscall.h>
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <signal.h>

enum { READ, WRITE };

int fd_hijo[2];
int fd_padre[2];

int main(){

    int numero = 0;

    pipe(fd_hijo);
    pipe(fd_padre);

    pid_t pid_hijo = fork();
    
    if (pid_hijo < 0) {
        perror("fork");
        exit(EXIT_FAILURE);
    }

    if (pid_hijo == 0){

        pid_t pid_padre = getppid();

        close(fd_padre[READ]);
        close(fd_hijo[WRITE]);

        while(numero < 5){
            read(fd_hijo[READ],&numero,sizeof(int));
            numero++;
            printf("Hijo envia a Padre el valor %d\n",numero);
            write(fd_padre[WRITE],&numero,sizeof(int));
        }

        close(fd_hijo[READ]);
        close(fd_padre[WRITE]);

        exit(EXIT_SUCCESS);
    }

    close(fd_padre[WRITE]);
    close(fd_hijo[READ]);

    while (numero < 5){
        printf("Padre envia a Hijo el valor %d\n",numero);
        write(fd_hijo[WRITE],&numero,sizeof(int));
        read(fd_padre[READ],&numero,sizeof(int));
        numero++;
    }

    close(fd_padre[READ]);
    close(fd_hijo[WRITE]);

    exit(EXIT_SUCCESS);

    return 0;
}