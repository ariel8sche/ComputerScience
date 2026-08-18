#include <sys/wait.h>
#include <unistd.h>
#include <syscall.h>
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>

void lisa(){
	pid_t pid_lisa = fork();
	
	if (pid_lisa == 0){
		printf("    ├── Lisa\n");
        exit(0);
	}
}

void bart(){
	pid_t pid_bart = fork();
	
	if (pid_bart == 0){
		printf("    ├── Bart\n");
        exit(0);
	}
}

void maggie(){
	pid_t pid_maggie = fork();
	
	if (pid_maggie == 0){
		printf("    └── Maggie\n");
        exit(0);
	}
}

int main(void){
	
	pid_t pid_homero = fork();
	
	if (pid_homero == 0) {
			printf("└── Homero\n");
            lisa();
            wait(NULL);
			bart();
            wait(NULL);
			maggie();
            wait(NULL);
	}
	else {
        printf("Abraham\n");
        wait(NULL);
	}
	return 0;
}