#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/un.h>
#include <sys/wait.h>

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
    int num;

    printf("Proceso2: Conectando al servidor...\n");

    int socket = crear_socket_cliente("unix_socket_ejercicio19");

    while (num < 50) {
        read(socket, &num, sizeof(int));

        printf("Proceso2: Recibió el valor %d\n", num);

        num++;

        printf("Proceso2: Enviando al Proceso1 el valor %d.\n", num);

        write(socket, &num, sizeof(int));

    }
    close(socket);
    exit(EXIT_SUCCESS);
}
