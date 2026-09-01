#include <stdio.h>    // printf()
#include <stdlib.h>   // exit()
#include <unistd.h>   // fork() pipe() execlp() dup2() close()
#include <sys/wait.h> // wait()

// Constantes 0 / 1 para READ / WRITE
enum { READ, WRITE };

// Debe ejecutar "ls -al"
void ejecutar_hijo_1(int pipe_fd[]) {
    close(pipe_fd[READ]);
    dup2(pipe_fd[WRITE], STDOUT_FILENO); // Redirige stdout al pipe
    close(pipe_fd[WRITE]);
    execlp("ls", "ls", "-al", NULL);
    exit(EXIT_SUCCESS);
}

// Debe ejecutar "wc -l"
void ejecutar_hijo_2(int pipe_fd[]) {
    close(pipe_fd[WRITE]);
    dup2(pipe_fd[READ], STDIN_FILENO);
    close(pipe_fd[READ]);
    execlp("wc", "wc", "-l", NULL);
    exit(EXIT_SUCCESS);
}

int main(int argc, char const* argv[]) {
  // Creo los pipes
    int pipe_fd[2];
    pipe(pipe_fd);

    if (fork() == 0) {
    // Proceso hijo 1
    ejecutar_hijo_1(pipe_fd);
    }
    if (fork() == 0) {
    // Proceso hijo 2
    ejecutar_hijo_2(pipe_fd);
    }
  // Proceso padre
    close(pipe_fd[READ]);
    close(pipe_fd[WRITE]);
    wait(NULL);
    wait(NULL);
    return 0;
}