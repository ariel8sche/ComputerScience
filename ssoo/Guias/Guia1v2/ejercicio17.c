#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <signal.h>

// Variable global
int N;

// Funciones auxiliares
int dameNumero(int pid) {
    // Para poder probar el programa:
    // generamos un número a partir del PID.
    return pid % 100;
}

int calcular(int numero) {
    // Simulamos un cálculo costoso.
    // Lo hacemos variable para poder observar
    // que los hijos pueden terminar en distinto orden.
    sleep((numero % 5) + 1);

    return numero * numero;
}

void informarResultado(int i, int numero, int resultado) {
    printf(
        "El hijo %d termino: calcular(%d) = %d\n",
        i,
        numero,
        resultado
    );
}

// Handler para avisar que el hijo termino el computo
void finalizo_calcular() {
    // No necesitamos hacer nada acá.
    // La función existe para que SIGCHLD
    // despierte al hijo que estaba en pause().
}

// Procesamiento del hijo
void ejecutarHijo (int i, int pipes[][2]) {
    int numero;
    int computo;

    int pipe_padre[2];

    pipe(pipe_padre);

    signal(SIGCHLD, finalizo_calcular);

    read(pipes[i][0],&numero,sizeof(int));

    pid_t pid_hijo = fork();

    if (pid_hijo == 0){
        computo = calcular(numero);
        write(pipe_padre[1],&computo,sizeof(computo));
        exit(EXIT_SUCCESS);
    }
    else {
        pause();
        read(pipe_padre[0],&computo,sizeof(int));
        write(pipes[i+N][1],&numero,sizeof(int));
        write(pipes[i+N][1],&computo,sizeof(int));
        exit(EXIT_SUCCESS);
    }
}

int main(int argc, char *argv[]) {
    if (argc < 2) {
        printf("Debe ejecutar con la cantidad de hijos como parametro\n");
        return 0;
    }

    N = atoi(argv[1]);
    int pipes[N * 2][2]; // N pipes para comunicar el padre al hijo y otros N pipes para la comunicacion del hijo al padre

    for (int i = 0; i < N * 2; i++) {
        pipe(pipes[i]);
    }

    for (int i = 0; i < N; i++) {
        int pid = fork();

        if (pid == 0) {
            ejecutarHijo(i, pipes);
            return 0;
        } else {
            int numero = dameNumero(pid);
            write(pipes[i][1], &numero, sizeof(numero));
        }
    }

    int cantidadTerminados = 0;
    char *hijoTermino = calloc(N, sizeof(char));

    while (cantidadTerminados < N) {
        for (int i = 0; i < N; i++) {
            if (hijoTermino[i]) {
                continue;
            }

            char termino = 0;
            write(pipes[i][1], &termino, sizeof(termino));
            read(pipes[N + i][0], &termino, sizeof(termino));

            if (termino) {
                int numero;
                int resultado;

                read(pipes[N + i][0], &numero, sizeof(numero));
                read(pipes[N + i][0], &resultado, sizeof(resultado));

                informarResultado(i, numero, resultado);
                hijoTermino[i] = 1;
                cantidadTerminados++;
            }
        }
    }

    wait(NULL);
    return 0;
}