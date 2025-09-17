#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/un.h>
#include <sys/wait.h>

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
    int num = 0;

    int socket = crear_socket_servidor("unix_socket_ejercicio19");

    printf("Proceso1: Esperando conexión...\n");

    // Aceptar conexión
    int conn_fd = (socket, NULL, NULL);

    if (conn_fd == -1) { perror("accept"); exit(1); }

    printf("Proceso1: Conexión aceptada.\n");

    while (num < 50) {

        write(conn_fd, &num, sizeof(int));

        printf("Proceso1: Enviando al Proceso2 el valor %d\n", num);

        // Recibe el valor
        read(conn_fd, &num, sizeof(int));

        printf("Proceso1: Recibió del Proceso2 el valor %d\n", num);

        num++;

    }

    unlink("unix_socket_ejercicio19"); // borrar socket al salir
    close(conn_fd);
    close(socket);
    // Eliminar el archivo del socket al finalizar
    unlink("unix_socket_ejercicio19");
    exit(EXIT_SUCCESS);
}