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

// Función para determinar si un número es par
int even(int number) {
    return number % 2 == 0;
}

// Proceso hijo que atiende clientes
void child_process(int socket, int id)
{
    
    while (1)
    {
        int number;

        printf("Hijo %d: Esperando cliente...\n", id);
        int conn = accept(socket, NULL, NULL);
        if (conn == -1)
        {
            perror("accept");
            continue; // o break si querés cortar
        }

        // Ahora atiendo al cliente
        recv(conn, &number, sizeof(int), 0);

        printf("Hijo %d: Número recibido: %d\n", id, number);

        // Determinar si el número es par o impar
        if (even(number))
        {
            // Enviar respuesta al cliente
            send(conn, "PAR", 4, 0);
        }
        else
        {
            // Enviar respuesta al cliente
            send(conn, "IMPAR", 6, 0);
        }

        close(conn); // 🔹 cerrar la conexión con ese cliente
        // ahora vuelve al while y espera otro cliente
    }
}

int main() {
    printf("Servidor: Creando socket y esperando conexiones...\n");

    // Crear socket servidor
    int socket = crear_socket_servidor("unix_socket_ejercicio20");

    // Crear 3 hijos
    for (int i = 1; i <= 3; i++) {
        pid_t pid = fork();
        if (pid == -1) { perror("fork"); exit(EXIT_FAILURE); }
        if (pid == 0) {
            // Código hijo
            child_process(socket, i);
            exit(EXIT_SUCCESS);
        }
    }

    // El padre no atiende clientes
    close(socket);

    // Esperar a los hijos
    for (int i = 0; i < 3; i++) {
        wait(NULL);
    }

    unlink("unix_socket_ejercicio20"); // borrar socket al salir
    exit(EXIT_SUCCESS);
}

