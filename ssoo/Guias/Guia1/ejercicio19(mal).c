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

    // 1) Crear socket UNIX
    server_addr.sun_family = AF_UNIX;

    // 2) Path en el sistema de archivos (el "nombre" del socket)
    strcpy(server_addr.sun_path, socket_path);

    // 3) Eliminar el socket si ya existe (unlink)
    unlink(server_addr.sun_path);

    // 4) Crear el socket (socket)
    server_socket = socket(AF_UNIX, SOCK_STREAM, 0);
    if (server_socket == -1) {
        perror("socket");
        exit(EXIT_FAILURE);
    }

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
        usleep(100000);
    }

    return sock;
}

int main() {
    pid_t pid_child1;

    if ((pid_child1 = fork()) == -1) {
        perror("fork");
        exit(EXIT_FAILURE);
    }

    if (pid_child1 == 0) {
        // -------------------------------
        // Child_1 process
        // -------------------------------

        // Servidor para recibir del Padre
        int server_socket_child1 = crear_socket_servidor("unix_socket_child1");
        int conn_from_parent = accept(server_socket_child1, NULL, NULL);

        // Cliente para enviar a Hijo2
        int conn_to_child2 = crear_socket_cliente("unix_socket_child2");

        int num;
        while (1) {
            // Recibir del Padre
            read(conn_from_parent, &num, sizeof(int));
            printf("Hijo1 recibió %d\n", num);
            fflush(stdout);

            num++;
            // Enviar a Hijo2
            write(conn_to_child2, &num, sizeof(int));
            printf("Hijo1 envió %d\n", num);
            fflush(stdout);

            if (num >= 3) break;
        }
        exit(EXIT_SUCCESS);

    } else {
        pid_t pid_child2;

        if ((pid_child2 = fork()) == -1) {
            perror("fork");
            exit(EXIT_FAILURE);
        }

        if (pid_child2 == 0) {
            // -------------------------------
            // Child_2 process
            // -------------------------------

            // Servidor para recibir de Hijo1
            int server_socket_child2 = crear_socket_servidor("unix_socket_child2");
            int conn_from_child1 = accept(server_socket_child2, NULL, NULL);

            // Cliente para enviar al Padre
            int conn_to_parent = crear_socket_cliente("unix_socket_parent");

            int num;
            while (1) {
                // Recibir de Hijo1
                read(conn_from_child1, &num, sizeof(int));
                printf("Hijo2 recibió %d\n", num);
                fflush(stdout);

                num++;
                // Enviar al Padre
                write(conn_to_parent, &num, sizeof(int));
                printf("Hijo2 envió %d\n", num);
                fflush(stdout);

                if (num >= 3) break;
            }
            exit(EXIT_SUCCESS);

        } else {
            // -------------------------------
            // Parent process
            // -------------------------------

            // Servidor para recibir de Hijo2
            int server_socket_parent = crear_socket_servidor("unix_socket_parent");
            int conn_from_child2 = accept(server_socket_parent, NULL, NULL);

            // Cliente para enviar a Hijo1
            int conn_to_child1 = crear_socket_cliente("unix_socket_child1");

            int num = 0;
            while (1) {
                // Enviar a Hijo1
                write(conn_to_child1, &num, sizeof(int));
                printf("Padre envió %d\n", num);
                fflush(stdout);

                // Recibir de Hijo2
                read(conn_from_child2, &num, sizeof(int));
                printf("Padre recibió %d\n", num);
                fflush(stdout);

                num++;
                if (num >= 3) break;
            }

            wait(NULL);
            wait(NULL);
            exit(EXIT_SUCCESS);
        }
    }
}