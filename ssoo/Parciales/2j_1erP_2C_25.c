#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>
#define WRITE 1
#define READ 0

int main(){
    int pipe_h_n[2];
    pipe(pipe_h_n);

    if (fork() == 0){
        pid_t pid_gc = fork();
        if (pid_gc == 0){
            close(pipe_h_n[READ]);
            printf("Soy el mejor nieto");
            int msg = 1;
            sleep(60);
            write(pipe_h_n[WRITE],&msg, sizeof(msg));
            close(pipe_h_n[WRITE]);
            while (1) {}
        }
        else{
            close(pipe_h_n[WRITE]);
            int msg;
            read(pipe_h_n[READ],&msg,sizeof(msg));
            close(pipe_h_n[READ]);
            kill(pid_gc, SIGTERM);
            wait(NULL);
            printf("Mi hijo querido se ha ido");
            exit(EXIT_SUCCESS);
        }
    }
    else{
        close(pipe_h_n[WRITE]);
        close(pipe_h_n[READ]);
        wait(NULL);
        exit(EXIT_SUCCESS);
    }
}