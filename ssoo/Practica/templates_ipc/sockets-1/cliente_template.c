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
    server_socket = socket(..);
    
    
    // COMPLETAR
    
    
    close(server_socket);
    exit(0);
}
