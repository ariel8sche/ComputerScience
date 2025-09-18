#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/un.h>
#include <sys/wait.h>
#include <sys/select.h>

// -------------------------------
// Conectar como cliente
// -------------------------------
int crear_socket_cliente(const char *socket_path) {
    int sock;
    struct sockaddr_un addr;

    // 1) Crear el socket (socket)
    sock = socket(AF_UNIX, SOCK_STREAM, 0);
    if (sock == -1) {
        perror("socket");
        exit(EXIT_FAILURE);
    }

    // 2) Configurar la dirección del socket
    addr.sun_family = AF_UNIX;

    // 3) Path en el sistema de archivos (el "nombre" del socket)
    strcpy(addr.sun_path, socket_path);

    // Reintentar hasta que el servidor esté listo
    while (connect(sock, (struct sockaddr *)&addr, sizeof(addr)) == -1) {
        perror("connect");
        sleep(1); // Esperar un segundo antes de reintentar
    }

    return sock;
}

int main(){

    int sock = crear_socket_cliente("unix_socket_ejercicio20");

    printf("Conectado al servidor. Escribí mensajes:\n");

    while (1) {
        fd_set readfds;
        FD_ZERO(&readfds);
        FD_SET(STDIN_FILENO, &readfds); // entrada estándar
        FD_SET(sock, &readfds);         // socket
        int max_fd = (sock > STDIN_FILENO) ? sock : STDIN_FILENO;

        int activity = select(max_fd + 1, &readfds, NULL, NULL, NULL);
        if (activity < 0) {
            perror("select");
            break;
        }

        // leer del teclado
        if (FD_ISSET(STDIN_FILENO, &readfds)) {
            char buffer[256];
            if (fgets(buffer, sizeof(buffer), stdin) != NULL) {
                send(sock, buffer, strlen(buffer), 0);
            }
        }

        // leer del servidor
        if (FD_ISSET(sock, &readfds)) {
            char buffer[256];
            int n = recv(sock, buffer, sizeof(buffer), 0);
            if (n <= 0) {
                printf("Servidor cerrado.\n");
                break;
            }
            buffer[n] = '\0';
            printf(">> %s", buffer);
        }
    }

    close(sock);
    return 0;
}