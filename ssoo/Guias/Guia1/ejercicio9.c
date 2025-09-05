#include <sys/wait.h>
#include <unistd.h>
#include <syscall.h>
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <signal.h>


void pong(int sig){
    printf("Pong! %d\n", getpid());
    kill(getppid(), SIGUSR1);
}

void ping(int sig) {
    // No hace nada, solo sirve para que pause() retorne
}


int main(int argc, char const *argv[])
{
    int opcion = 1;

    pid_t pid_hijo = fork();

    if (pid_hijo == 0){
        signal(SIGUSR1, pong);
        while (1){
            pause();
        }
    }
    else {
        signal(SIGUSR1, ping);
        sleep(1);
        while (opcion) {
            for (int i=0; i< 3; i++){
                printf("Ping! %d\n", getpid());
                kill(pid_hijo, SIGUSR1);
                pause();
            }

            //Preguntar al usuario
            printf("¿Desea salir? (1 = sí, 0 = no): ");
            fflush(stdout);       // asegura que el texto se muestre antes del scanf
            scanf("%d", &opcion);
        }


        kill(pid_hijo, SIGTERM);
        exit(0);
    }
    
}
