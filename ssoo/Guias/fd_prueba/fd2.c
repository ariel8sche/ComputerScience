#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>

int main()
{
    int pipefd[2];
    pipe(pipefd);

    if (fork() == 0)
    {
        // Hijo: escribe en el pipe
        close(pipefd[0]); // no lee
        write(pipefd[1], "Hola padre\n", 11);
        close(pipefd[1]);
    }
    else
    {
        // Padre: lee del pipe
        close(pipefd[1]); // no escribe
        char buf[20];
        read(pipefd[0], buf, sizeof(buf));
        printf("Padre leyó: %s", buf);
        close(pipefd[0]);
    }
}