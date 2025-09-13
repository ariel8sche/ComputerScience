#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <time.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <signal.h>

#define READ 0
#define WRITE 1

int main(int argc, char *argv[]) {

    int n = atoi(argv[1]); // cant hijos
    int c = atoi(argv[2]); // valor 
    int s = atoi(argv[3]); // hijo inicial

    int pipes[n][2];
    for (int i = 0; i < n; i++) {
        pipe(pipes[i]);
    }

    int padre_pipe[2];
    pipe(padre_pipe);

    pid_t pid[n];
    for (int i = 0; i < n; i++) {
        pid[i] = fork();
        if (pid[i] == 0 && i != s) {      
            for (int j = 0; j < n; j++) {
                if (j != i) close(pipes[j][WRITE]);
                if (j != (i-1+n)%n) close(pipes[j][READ]);
            }
            close(padre_pipe[READ]);
            close(padre_pipe[WRITE]);
            int num;
            while (1) {
                read(pipes[(i-1+n)%n][READ], &num, sizeof(int));
                num++;
                write(pipes[i][WRITE], &num, sizeof(int));
            }
        }

        if (i == s && pid[i] == 0) { 
            int num;
            for (int j = 0; j < n; j++) {
                if (j != i) close(pipes[j][WRITE]);
                if (j != (i-1+n)%n) close(pipes[j][READ]);
            }

            int secreto = c + 1 + rand() % 10; 
            printf("Hijo %d: secreto= %d\n", i, secreto);
            fflush(stdout); 
            read(pipes[s][READ], &num, sizeof(int));

            while (1) {
                if (num >= secreto) {
                    write(padre_pipe[WRITE], &num, sizeof(int));
                    sleep(5); 
                }
                num++;
                write(pipes[i][WRITE], &num, sizeof(int));
                read(pipes[(i-1+n)%n][READ], &num, sizeof(int));
            }
        }
    }


    for (int i = 0; i < n; i++) {
        close(pipes[i][READ]);
        if (i != s){ 
            close(pipes[i][WRITE]);
        }
        }
    close(padre_pipe[WRITE]);
    write(pipes[s][WRITE], &c, sizeof(int)); // el padre tiene q escribir en el pipe del hijo, si escribi en el suyo y que el hijo lea de ahi el read de abajo no se traba 

    int resultado;
    read(padre_pipe[READ], &resultado, sizeof(int)); // este
    printf("Resultado final: %d\n", resultado);

    for (int i = 0; i < n; i++) {
        if (pid[i] > 0) kill(pid[i], SIGKILL);
    }

    for (int i = 0; i < n; i++) wait(NULL);

    return 0;
}
