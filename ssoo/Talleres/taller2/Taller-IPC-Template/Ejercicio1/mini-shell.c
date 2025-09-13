#include <stdio.h>
#include <stdlib.h>
#include <sys/wait.h>
#include <unistd.h>
#include <string.h>
#include "constants.h"
#include "mini-shell-parser.c"

enum {READ, WRITE};

static int run(char ***progs, size_t count)
{	
	int r, status;

	//Reservo memoria para el arreglo de pids
	//TODO: Guardar el PID de cada proceso hijo creado en children[i]
	pid_t *children = malloc(sizeof(*children) * count);

	//TODO: Pensar cuantos pipes necesito.


	int fd[2];
	int **pipe_list = malloc(sizeof(int*) * (count - 1));

	for (int i = 0; i<count-1; i++) {
		pipe_list[i] = malloc(sizeof(int) * 2);

		pipe(pipe_list[i]);

		printf("File descs: %d y %d\n", pipe_list[i][0], pipe_list[i][1]);
	}

	//TODO: Pensar cuantos procesos necesito



	for (int i = 0; i < count; i++) {
		pid_t pid = fork();

		children[i] = pid;
        
		if (pid == 0) {
			char** my_prog = progs[i];

			printf("My first param: %s\n", my_prog[0]);
			printf("My second param: %s\n", my_prog[1]);

			if (count == 1) {
				execvp(my_prog[0], my_prog);
			}
			
			if (i==0) {
				close(pipe_list[i][READ]);
				dup2(pipe_list[i][WRITE], STDOUT_FILENO);
			} 

			if (i == count -1) {
				close(pipe_list[i-1][WRITE]);
				dup2(pipe_list[i-1][READ], STDIN_FILENO);
			} 
			
			if (i > 0 && i < count -1) {
				close(pipe_list[i][READ]);
				close(pipe_list[i-1][WRITE]);
				dup2(pipe_list[i-1][READ], STDIN_FILENO);
				dup2(pipe_list[i][WRITE], STDOUT_FILENO);
			}

			for (int j = 0; j < i - 1; j++) {
				close(pipe_list[j][READ]);
				close(pipe_list[j][WRITE]);
			}
			for (int j = i+1; j < count -1; j++) {
				close(pipe_list[j][READ]);
				close(pipe_list[j][WRITE]);
			}

			execvp(my_prog[0], my_prog);
		}
	}

	for (int j = 0; j<count-1; j++) {
		close(pipe_list[j][READ]);
		close(pipe_list[j][WRITE]);
	}

	//Espero a los hijos y verifico el estado que terminaron
	for (int i = 0; i < count; i++) {
		waitpid(children[i], &status, 0);

		if (!WIFEXITED(status)) {
			fprintf(stderr, "proceso %d no terminó correctamente [%d]: ",
			    (int)children[i], WIFSIGNALED(status));
			perror("");
			return -1;
		}
	}
	r = 0;
	free(children);

	return r;
}


int main(int argc, char **argv)
{
	if (argc < 2) {
		printf("El programa recibe como parametro de entrada un string con la linea de comandos a ejecutar. \n"); 
		printf("Por ejemplo ./mini-shell 'ls -a | grep anillo'\n");
		return 0;
	}
	int programs_count;
	char*** programs_with_parameters = parse_input(argv, &programs_count);

	printf("status: %d\n", run(programs_with_parameters, programs_count));

	fflush(stdout);
	fflush(stderr);

	return 0;
}
