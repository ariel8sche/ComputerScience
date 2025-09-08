#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/un.h>

int main() {
    int id = getpid();
    int server_socket;
    struct sockaddr_un server_addr;

    server_addr.sun_family = AF_UNIX;
    strcpy(server_addr.sun_path, "unix_socket");

    printf("cliente[%d]: me estoy conectando con el servidor...\n", id);
    server_socket = socket(AF_UNIX, SOCK_STREAM, 0);
    if (connect(server_socket, (struct sockaddr *)&server_addr, sizeof(server_addr)) == -1) {
        perror("Error");
        exit(EXIT_FAILURE);
    }

    if (write(server_socket, &id, sizeof(id)) == -1) {
        perror("Error");
        exit(EXIT_FAILURE);
    }
    printf("cliente[%d]: mandé mi pid al servidor\n", id);

    char msg[5] = "ping\0";
    if (write(server_socket, &msg, 5) == -1) {
        perror("Error");
        exit(EXIT_FAILURE);
    }
    printf("cliente[%d]: mandé ping al servidor\n", id);

    if (read(server_socket, &msg, 5) == 0) {
        perror("Error");
        exit(EXIT_FAILURE);
    }
    printf("cliente[%d]: recibí %s del servidor!\n", id, msg);

    close(server_socket);
    exit(0);
}
