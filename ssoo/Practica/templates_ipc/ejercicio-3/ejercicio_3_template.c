#include <sys/wait.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>

#define RANGO_MIN 2L
#define RANGO_MAX 1000000001L

// Constantes 0 / 1 para READ / WRITE
enum { READ, WRITE };

int (*pipes)[2];

int esPar(long numero) {
  return (numero & 1) == 0;
}

long contarPares(long desde, long hasta) {
  long cantidad = 0;
  for (long i = desde; i < hasta; ++i) {
    if (esPar(i)) {
      cantidad++;
    }
  }
  return cantidad;
}

void ejecutarHijo(int i /* file descriptors a los pipes necesarios */) {
  // Leer del i-ésimo pipe el rango [desde, hasta) para realizar el cómputo
  long desde, hasta;
  read(pipes[i][READ], &desde, sizeof(desde));
  read(pipes[i][READ], &hasta, sizeof(hasta));
  close(pipes[i][READ]);
  // Contar pares en el rango
  long resultado = contarPares(desde, hasta);
  // Escribir el resultado en el i-ésimo pipe
  write(pipes[i][WRITE], &resultado, sizeof(resultado));
  close(pipes[i][WRITE]);
  // Terminar el proceso hijo
  exit(EXIT_SUCCESS);
}

int main(int argc, char const* argv[]) {
  // Parsear la cantidad de procesos
  if (argc != 2) {
    printf("Debe ejecutar con la cantidad de procesos N como parámetro.\n");
    printf("Ejemplo: %s N\n", argv[0]);
    return 1;
  }
  int N = atoi(argv[1]);

  // Crear pipes
  pipes = malloc(sizeof(int[2]) * N);

  for (int i = 0; i < N; i++) {
      pipe(pipes[i]);
  }

  // Crear hijos
  for (int i = 0; i < N; i++) {
    pid_t pid_child = fork();
    if (pid_child == -1) {
      perror("fork");
      exit(EXIT_FAILURE);
    } else if (pid_child == 0) {
      // Proceso hijo
      ejecutarHijo(i /* file descriptors a los pipes necesarios */);
      exit(EXIT_SUCCESS);
    }
  }

  // Calcular rangos para cada hijo
  // El intervalo es: [RANGO_MIN, RANGO_MAX) (es decir, cerrado-abierto)
  long cantidad = ((RANGO_MAX - RANGO_MIN) + (N - 1)) / N;
  long desde = RANGO_MIN;
  for (int i = 0; i < N; i++) {
    long hasta = desde + cantidad;
    if (hasta > RANGO_MAX) hasta = RANGO_MAX;

    write(pipes[i][WRITE], &desde, sizeof(desde));
    write(pipes[i][WRITE], &hasta, sizeof(hasta));
    desde = hasta;
  }

  // Cerrar pipes inteligentemente
  for (int i = 0; i < N; i++) {
    close(pipes[i][WRITE]);
  }

  // Leer los resultados de cada hijo
  long resultado = 0;
  for (int i = 0; i < N; i++) {
    long parcial;
    read(pipes[i][READ], &parcial, sizeof(parcial));
    resultado += parcial;
  }
  // Cerrar pipes de lectura
  for (int i = 0; i < N; i++) {
    close(pipes[i][READ]);
  }
  // Imprimir el resultado total
  printf("Resultado total: %ld\n", resultado);

  // Esperar a los hijos
  for (int i = 0; i < N; i++) {
    wait(NULL);
  }

  return 0;
}
