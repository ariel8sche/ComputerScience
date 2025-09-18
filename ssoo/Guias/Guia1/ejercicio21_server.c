#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/un.h>
#include <sys/wait.h>
#include <sys/select.h>

#define MAX_CLIENTS 2
#define SOCKET_PATH "unix_socket_ejercicio20"

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
    if (listen(server_socket, MAX_CLIENTS) == -1) {
        perror("listen");
        exit(EXIT_FAILURE);
    }

    return server_socket;
}

int main(){
    int conn, max_fd, server_socket, activity;
    int client_sockets[MAX_CLIENTS] = { [0 ... MAX_CLIENTS-1] = -1 };
    fd_set readfds;

    printf("Server: Creando socket y esperando conexiones...\n");
    server_socket = crear_socket_servidor(SOCKET_PATH);

    while(1){
        FD_ZERO(&readfds);
        FD_SET(server_socket, &readfds);
        max_fd = server_socket;

        for (int i = 0; i < MAX_CLIENTS; i++) {
            if (client_sockets[i] > 0) {
                FD_SET(client_sockets[i], &readfds);
                if (client_sockets[i] > max_fd) {
                    max_fd = client_sockets[i];
                }
            }
        }

        activity = select(max_fd + 1, &readfds, NULL, NULL, NULL);
        if (activity < 0) {
            perror("select");
            continue;
        }

        // nueva conexión
        if (FD_ISSET(server_socket, &readfds)) {
            int new_socket = accept(server_socket, NULL, NULL);
            if (new_socket == -1) {
                perror("accept");
                continue;
            }
            printf("Nuevo cliente conectado.\n");

            // buscar lugar libre
            int placed = 0;
            for (int i = 0; i < MAX_CLIENTS; i++) {
                if (client_sockets[i] == -1) {
                    client_sockets[i] = new_socket;
                    placed = 1;
                    break;
                }
            }
            if (!placed) {
                printf("Servidor lleno, cerrando conexión.\n");
                close(new_socket);
            }
        }

        // mensajes de clientes
        for (int i = 0; i < MAX_CLIENTS; i++) {
            if (client_sockets[i] != -1 && FD_ISSET(client_sockets[i], &readfds)) {
                char buffer[256];
                int n = recv(client_sockets[i], buffer, sizeof(buffer), 0);

                if (n <= 0) {
                    printf("Cliente %d desconectado.\n", i+1);
                    close(client_sockets[i]);
                    client_sockets[i] = -1;
                } else {
                    buffer[n] = '\0';
                    printf("Cliente %d: %s", i+1, buffer);

                    // reenviar a los demás
                    for (int j = 0; j < MAX_CLIENTS; j++) {
                        if (client_sockets[j] != -1 && j != i) {
                            send(client_sockets[j], buffer, n, 0);
                        }
                    }
                }
            }
        }
    }

    unlink(SOCKET_PATH); // borrar socket al salir
    close(server_socket);              // cerrar el socket
    exit(EXIT_SUCCESS);
}