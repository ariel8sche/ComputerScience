#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/un.h>

int main() {
    int server_socket;
    int client_socket;
    struct sockaddr_un server_addr;
    struct sockaddr_un client_addr;
    unsigned int slen = sizeof(server_addr);
    unsigned int clen = sizeof(client_addr);

    server_addr.sun_family = AF_UNIX;
    strcpy(server_addr.sun_path, "unix_socket");
    unlink(server_addr.sun_path);

    server_socket = socket(AF_UNIX, SOCK_STREAM, 0);
    if (bind(server_socket, (struct sockaddr *) &server_addr, slen) == -1) {
        perror("Error");
        exit(EXIT_FAILURE);
    }
    if (listen(server_socket, 1) == -1) {
        perror("Error");
        exit(EXIT_FAILURE);
    }

    printf("servidor: esperando conexión del cliente...\n");
    while(1) {
        client_socket = accept(server_socket, (struct sockaddr *) &client_addr, &clen);
        if (client_socket == -1) {
            perror("Error");
            exit(EXIT_FAILURE);
        }

        int id;
        if (read(client_socket, &id, sizeof(id)) == 0) {
            perror("Error");
            exit(EXIT_FAILURE);
        }

        char msg[5];
        if (read(client_socket, &msg, 5) == 0) {
            perror("Error");
            exit(EXIT_FAILURE);
        }

        printf("servidor: recibí %s del cliente #%d\n", msg, id);

        // Compilar con el sleep y luego ver qué pasa si matamos al cliente
        // antes de que el servidor responda.
        // printf("servidor: me voy a dormir un rato...\n");
        // sleep(100);

        char pong[5] = "pong\0";
        if (write(client_socket, &pong, 5) == -1) {
            perror("Error");
            exit(EXIT_FAILURE);
        }

        close(client_socket);
    }

    exit(EXIT_SUCCESS);
}
