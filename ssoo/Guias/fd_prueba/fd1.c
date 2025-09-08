#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>

int main() {
    // Abrir archivo de salida
    int fd = open("salida.txt", O_CREAT | O_WRONLY | O_TRUNC, 0644);
    if (fd < 0) {
        perror("open");
        exit(1);
    }

    // Redirigir stdout (1) al archivo
    dup2(fd, STDOUT_FILENO);

    // Ahora printf ya no va a la consola, va al archivo
    printf("Hola desde printf()\n");
    fflush(stdout);
    // Ejecutar un comando externo (solo en Linux/WSL)
    execlp("ls", "ls", "-i", NULL);

    close(fd);
    return 0;
}