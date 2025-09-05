#include <sys/wait.h>
#include <unistd.h>
#include <syscall.h>
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <signal.h>

int main(int argc, char const *argv[])
{
    // execve("./programa", (char *[]){"./programa", NULL}, NULL);

    pid_t pid_julieta = fork();

    if (pid_julieta == 0){

        printf("Soy Julieta\n\0");
        sleep(1);

        pid_t pid_jennifer = fork();
        
        if (pid_jennifer == 0) {
            printf("Soy Jennifer\n\0");
            sleep(1);
            exit(0);
        }

        exit(0);
    }
    else {
        printf("Soy Juan\n\0");
        sleep(1);
        wait(NULL);

        pid_t pid_jorge = fork();

        if (pid_jorge == 0) {
            printf("Soy Jorge\n\0");
            exit(0);
        } 
        
        exit(0);
    }
}
