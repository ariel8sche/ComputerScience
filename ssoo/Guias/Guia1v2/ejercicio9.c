#include <sys/wait.h>
#include <unistd.h>
#include <syscall.h>
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <signal.h>

void handler(int sig){
    printf("Ping: %d\n",getpid());
    kill(getppid(), SIGUSR1);
}

void handler2(int sig){

}

int main(){

    int sigue = 1;

    pid_t pid_hijo = fork();

    if (pid_hijo == 0){
        signal(SIGUSR1, handler);
        while (1){
            pause();
        }
    }
    else {
        signal(SIGUSR1,handler2);
        sleep(1);
        while (sigue){
            for (int i=0;i<3;i++){
                sleep(1);
                printf("Pong: %d\n",getpid());
                kill(pid_hijo, SIGUSR1);
                pause();
            }
            sleep(1);
            printf("Ingrese 1 para repetir o 0 para finalizar: ");
            fflush(stdout); 
            scanf("%d", &sigue);
        }
        kill(pid_hijo,SIGTERM);
        wait(NULL);
        exit(0);
    }

    return 0;
}