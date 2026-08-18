#include <sys/wait.h>
#include <unistd.h>
#include <syscall.h>
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>

int main(int argc, char *argv[]){

    pid_t pid = fork();

    if (pid == 0){
        execl("/bin/sh", "sh", "-c", argv[1], (char *) NULL);
        perror("execl");
        exit(1);
    }
    wait(NULL);
    exit(0);
    return 0;
}