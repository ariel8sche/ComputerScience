#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <signal.h>

// Variables globales
int pipes[2];
pid_t pid_padre;
pid_t pid_hijo;

// Handlers
void handler_padre(){
        int numero;
        read(pipes[0],&numero,sizeof(int));

        char msg[44];
        snprintf(msg,44,"Mirá vos. El significado de la vida es %d\n",numero);

        write(1, &msg, 44);

        write(1, "¡Bang Bang, estás liquidado!\n", 31);

        kill(pid_hijo, SIGHUP);
}

void handler_padre2(){
    write(1, "Te voy a buscar en la oscuridad.\n", 33);
}

void handler_padre3(){
    write(1, "Te voy a buscar en la oscuridad.\n", 33);
}

void handler_hijo(){
    write(1, "Dejame pensaerlo...\n", 21);

    sleep(5);

    write(1, "Ya sé el significado de la vida.\n", 34);

    int numero = 42;
    write(pipes[1], &numero, 2);

    kill(pid_padre, SIGINT);
}

void handler_hijo2(){
    write(1, "Me voy a mirar crecer las flores desde abajo.\n", 46);
}

int main(){

    pipe(pipes);

    pid_hijo = fork(); 

    if (pid_hijo == 0){

        close(pipes[0]);

        pid_padre = getppid();

        signal(SIGINT, handler_hijo);
        signal(SIGHUP, handler_hijo2);

        // mmap();
        
        pause();

        pause();

        close(pipes[1]);

        exit(EXIT_SUCCESS);
    } else {
        close(pipes[1]);

        signal(SIGINT, handler_padre);
        signal(SIGCHLD, handler_padre2);

        sleep(1);

        // mmap();

        write(1, "¿Cuál es el significado de la vida?\n", 38);

        kill(pid_hijo, SIGINT);

        pause();

        signal(SIGCHLD, handler_padre3);

        sleep(10);

        wait(NULL);

        close(pipes[0]);

        exit(EXIT_SUCCESS);
    }

    return 0;
}