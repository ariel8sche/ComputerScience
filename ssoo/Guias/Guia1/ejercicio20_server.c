#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/un.h>
#include <sys/wait.h>


// Función para determinar si un número es par
int even(int number) {
    return number % 2 == 0;
}

// -------------------------------
// Crear socket servidor
// -------------------------------
int crear_socket_servidor(const char *socket_path) {
    int server_socket;
    struct sockaddr_un server_addr;
    unsigned int slen = sizeof(server_addr);

    // 1) Crear el socket (socket)
    server_socket = socket(AF_UNIX, SOCK_STREAM, 0);
    if (server_socket == -1) {
        perror("socket");
        exit(EXIT_FAILURE);
    }

    // 2) Crear socket UNIX
    memset(&server_addr, 0, sizeof(server_addr));
    server_addr.sun_family = AF_UNIX;

    // 3) Path en el sistema de archivos (el "nombre" del socket)
    strcpy(server_addr.sun_path, socket_path);

    // 4) Eliminar el socket si ya existe (unlink)
    unlink(socket_path);

    // 5) Asociar el socket a una dirección (bind)
    if (bind(server_socket, (struct sockaddr *)&server_addr, slen) == -1) {
        perror("bind");
        exit(EXIT_FAILURE);
    }

    // 6) Escuchar conexiones entrantes (listen)
    if (listen(server_socket, 1) == -1) {
        perror("listen");
        exit(EXIT_FAILURE);
    }

    return server_socket;
}

int main(){

    int socket = crear_socket_servidor("unix_socket_ejercicio20");

    pid_t pid_child1 = fork();
    if (pid_child1 == -1) { perror("fork"); exit(EXIT_FAILURE); }
    if (pid_child1 == 0) {
        int conn_child1 = accept(socket, NULL, NULL);

        if (conn_child1 == -1) { perror("accept"); exit(1); }

        printf("Hijo 1: Conexión aceptada.\n");
    }
    else {
        pid_t pid_child2 = fork();
        if (pid_child2 == -1) { perror("fork"); exit(EXIT_FAILURE); }
        if (pid_child2 == 0) {
            int conn_child2 = accept(socket, NULL, NULL);

            if (conn_child2 == -1) { perror("accept"); exit(1); }

            printf("Hijo 2: Conexión aceptada.\n");

        }
        else {
            pid_t pid_child3 = fork();
            if (pid_child3 == -1) { perror("fork"); exit(EXIT_FAILURE); }
            if (pid_child3 == 0) {
                int conn_child3 = accept(socket, NULL, NULL);

                if (conn_child3 == -1) { perror("accept"); exit(1); }

                printf("Hijo 3: Conexión aceptada.\n");

            }
            else {

            }
        }
    }

    close(socket);
    unlink("unix_socket_ejercicio20"); // borrar socket al salir
    exit(EXIT_SUCCESS);
}