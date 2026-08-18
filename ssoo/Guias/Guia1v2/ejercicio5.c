#include <sys/wait.h>
#include <unistd.h>
#include <syscall.h>
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include "ejercicio5.h"

int main(){
	pid_t pid_homero = fork();
    if (pid_homero == 0){
        printf("|--> Homero\n");
        bart();
        wait(NULL);
        lisa();
        wait(NULL);
        maggie();
        wait(NULL);
        exit(0);
    }
    else {
        printf("\nAbraham\n");
        wait(NULL);
        exit(0);
    }
    return 0;
}

void maggie()
{
    pid_t pid_maggie = fork();

    if (pid_maggie == 0)
    {
        printf("  |--> Maggie\n");
        exit(0);
    }
}

void lisa()
{
    pid_t pid_lisa = fork();

    if (pid_lisa == 0)
    {
        printf("  |--> Lisa\n");
        exit(0);
    }
}

void bart()
{
    pid_t pid_bart = fork();

    if (pid_bart == 0)
    {
        printf("  |--> Bart\n");
        exit(0);
    }
}
