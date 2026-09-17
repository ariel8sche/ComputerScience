#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>
#define WRITE 1
#define READ 0

int main(){
    int fd_padre_a_hijo[2]; // [3(READ), 4(WRITE)]
    int fd_hijo_a_padre[2]; // [5(READ), 6(WRITE)]
    pipe(fd_hijo_a_padre);
    pipe(fd_padre_a_hijo);

    char input_msg[1024];
    char fd_buffer[256];
    int cant_leido = 0;

    pid_t pid_hijo = fork();

    if (pid_hijo == 0){
        close(fd_padre_a_hijo[WRITE]); // CLOSE(4)
        close(fd_hijo_a_padre[READ]); // CLOSE(5)
        
        // read(fd_hijo[READ], &fd_buffer, sizeof(fd_buffer)); // READ(3)
        
        // write(fd_padre[WRITE],"MENSAJE ERRONEO\n", 16);     // WRITE(6)

        // read(fd_hijo[READ], &fd_buffer, sizeof(fd_buffer)); // READ(3)
        
        // write(fd_padre[WRITE],"MENSAJE ERRONEO\n", 16);     // WRITE(6)
        
        // read(fd_hijo[READ], &fd_buffer, sizeof(fd_buffer)); // READ(3)

        // write(fd_padre[WRITE], "YENDO\0", 6);               // WRITE(6)

        while ((cant_leido = read(fd_padre_a_hijo[READ], fd_buffer, sizeof(fd_buffer))) > 0) {
            if (strncmp(fd_buffer, "IR!\n", cant_leido) == 0) {
                write(fd_hijo_a_padre[WRITE], "YENDO\0", 6); // write(6, "YENDO\0", 6)
                break;
            } else {
                write(fd_hijo_a_padre[WRITE], "MENSAJE ERRONEO\0", 16); // write(6, "MENSAJE ERRONEO\0", 16)
            }
        }

        sleep(5);
        exit(EXIT_SUCCESS);
    } else {
        close(fd_padre_a_hijo[READ]);   // CLOSE(3)
        close(fd_hijo_a_padre[WRITE]); // CLOSE(6)

        // cant_leido = (0, &input_msg, sizeof(input_msg));  // "anda\n"
        // write(fd_padre_a_hijo[WRITE], &input_msg, cant_leido);  // WRITE(4)

        // read(fd_hijo_a_padre[READ], &fd_buffer, sizeof(fd_buffer));   // READ(5)

        // cant_leido = read(0, &input_msg, sizeof(input_msg));  // "vamos\n"
        // write(fd_padre_a_hijo[WRITE], &input_msg, cant_leido);  // WRITE(4)

        // read(fd_hijo_a_padre[READ], &fd_buffer, sizeof(fd_buffer));   // READ(5) 

        // cant_leido = read(0, &input_msg, sizeof(input_msg));  // "IR!\n"
        // write(fd_padre_a_hijo[WRITE], &input_msg, cant_leido);  // WRITE(4)  "IR!\n"

        // read(fd_hijo_a_padre[READ], &fd_buffer, sizeof(fd_buffer));   // READ(5) "YENDO\0"

        while (1) {
            cant_leido = read(0, input_msg, sizeof(input_msg)); // read(0, ..., 1024)
            write(fd_padre_a_hijo[WRITE], input_msg, cant_leido); // write(4, ..., cant_leido)

            int n_res = read(fd_hijo_a_padre[READ], fd_buffer, sizeof(fd_buffer)); // read(5, ..., 256)
            if (strncmp(fd_buffer, "YENDO", 5) == 0) {
                break;
            }
        }

        wait(NULL);

        write(1, "LLEGAMOS\n", 9); // WRITE(1)

        exit(EXIT_SUCCESS);
    }
}