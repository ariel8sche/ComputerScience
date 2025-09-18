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
    int number;

    char res[10];

    printf("Cliente: Ingrese un número entero: ");
    scanf("%d", &number);

    int conn = crear_socket_cliente("unix_socket_ejercicio20");
    printf("Cliente: Conectado al servidor.\n");

    printf("Cliente: Enviando el número %d al servidor.\n", number);
    send(conn, &number, sizeof(int), 0);

    recv(conn, res, sizeof(res), 0);

    printf("Cliente: El número %d es %s.\n", number, res);

    close(conn);
    exit(EXIT_SUCCESS);
}