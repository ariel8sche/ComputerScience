#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>

#define WRITE 1
#define READ  0

int generarValor(int indice) {
    return indice * 2;
}

void printArray(int arreglo[], int cantidad) {
    for (int i = 0; i < cantidad; i++) {
        printf("%d%s", arreglo[i], i == cantidad - 1 ? "\n" : " ");
    }
}

void esperar_hijos(pid_t hijos[], int cantidad) {
    for (int i = 0; i < cantidad; i++) {
        pid_t resultado;
        do {
            resultado = waitpid(hijos[i], NULL, 0);
        } while (resultado == -1 && errno == EINTR);

        if (resultado == -1) {
            perror("waitpid");
        }
    }
}

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Uso: %s m n\n", argv[0]);
        return EXIT_FAILURE;
    }

    long m = strtol(argv[1], NULL, 10);
    long n = strtol(argv[2], NULL, 10);

    if (n <= 0 || m <= 0 || m % n != 0) {
        fprintf(stderr, "Parámetros inválidos: m debe ser múltiplo positivo de n.\n");
        return EXIT_FAILURE;
    }

    int arreglo[m];
    int pipe_padre_hijo[n][2];
    int pipe_hijo_padre[n][2];

    for (int i = 0; i < n; i++) {
        if (pipe(pipe_padre_hijo[i]) == -1 || pipe(pipe_hijo_padre[i]) == -1) {
            perror("pipe");
            return EXIT_FAILURE;
        }
    }

    for (int i = 0; i < n; i++) {
        pid_t pid = fork();

        if (pid == -1) {
            perror("fork");
            return EXIT_FAILURE;
        }

        if (pid == 0) {
            // Contexto del hijo i: cerrar descriptores que no le pertenecen
            for (int j = 0; j < n; j++) {
                if (j != i) {
                    close(pipe_padre_hijo[j][READ]);
                    close(pipe_padre_hijo[j][WRITE]);
                    close(pipe_hijo_padre[j][READ]);
                    close(pipe_hijo_padre[j][WRITE]);
                } else {
                    close(pipe_padre_hijo[j][WRITE]);
                    close(pipe_hijo_padre[j][READ]);
                }
            }

            int indice;
            // Lectura por dirección de memoria (&indice)
            while (read(pipe_padre_hijo[i][READ], &indice, sizeof(int)) > 0) {
                int valor = generarValor(indice);
                // Escritura por dirección de memoria (&valor)
                write(pipe_hijo_padre[i][WRITE], &valor, sizeof(int));
            }

            close(pipe_padre_hijo[i][READ]);
            close(pipe_hijo_padre[i][WRITE]);
            exit(EXIT_SUCCESS);
        }
    }

    // Contexto del padre: cerrar extremos de lectura padre->hijo y escritura hijo->padre
    for (int i = 0; i < n; i++) {
        close(pipe_padre_hijo[i][READ]);
        close(pipe_hijo_padre[i][WRITE]);
    }

    // Para evitar saturar los buffers del kernel, despachamos y recibimos en tándem
    for (int k = 0; k < m; k++) {
        int target_hijo = k % n;
        write(pipe_padre_hijo[target_hijo][WRITE], &k, sizeof(int));
        read(pipe_hijo_padre[target_hijo][READ], &arreglo[k], sizeof(int));
    }

    // Cerrar descriptores restantes del padre
    for (int i = 0; i < n; i++) {
        close(pipe_padre_hijo[i][WRITE]);
        close(pipe_hijo_padre[i][READ]);
    }

    for (int i = 0; i < n; i++) {
        wait(NULL);
    }
    printArray(arreglo, m);

    return EXIT_SUCCESS;
}