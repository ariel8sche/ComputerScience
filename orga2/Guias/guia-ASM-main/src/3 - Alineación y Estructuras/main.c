#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>
#include <assert.h>

#include "../test-utils.h"
#include "Estructuras.h"

int main() {

	// Prueba para la lista normal
	
	// Creamos algunos nodos manualmente
	nodo_t* nodo3 = malloc(sizeof(nodo_t));
	nodo3->next = NULL;
	nodo3->categoria = 3;
	nodo3->arreglo = NULL;
	nodo3->longitud = 7;

	nodo_t* nodo2 = malloc(sizeof(nodo_t));
	nodo2->next = nodo3;
	nodo2->categoria = 2;
	nodo2->arreglo = NULL;
	nodo2->longitud = 5;

	nodo_t* nodo1 = malloc(sizeof(nodo_t));
	nodo1->next = nodo2;
	nodo1->categoria = 1;
	nodo1->arreglo = NULL;
	nodo1->longitud = 4;

	// Creamos la lista
	lista_t lista;
	lista.head = nodo1;

	// Llamamos a la función de assembler
	uint32_t total = cantidad_total_de_elementos(&lista);

	// Imprimimos el resultado
	printf("Total de elementos: %u\n", total);  // debería imprimir 4 + 5 + 7 = 16

	// Liberamos memoria
	free(nodo1);
	free(nodo2);
	free(nodo3);


	// Prueba para la packed list

	// Creamos algunos nodos
	packed_nodo_t* nodo3p = malloc(sizeof(packed_nodo_t));
	nodo3p->next = NULL;
	nodo3p->categoria = 3;
	nodo3p->arreglo = NULL;
	nodo3p->longitud = 6;

	packed_nodo_t* nodo2p = malloc(sizeof(packed_nodo_t));
	nodo2p->next = nodo3p;
	nodo2p->categoria = 2;
	nodo2p->arreglo = NULL;
	nodo2p->longitud = 5;

	packed_nodo_t* nodo1p = malloc(sizeof(packed_nodo_t));
	nodo1p->next = nodo2p;
	nodo1p->categoria = 1;
	nodo1p->arreglo = NULL;
	nodo1p->longitud = 4;

	// Creamos la lista
	packed_lista_t listap;
	listap.head = nodo1p;

	// Llamamos a la función en assembler
	uint32_t totalp = cantidad_total_de_elementos_packed(&listap);

	// Imprimimos el resultado
	printf("Total de elementos (packed): %u\n", totalp);  // debería imprimir 4 + 5 + 6 = 15

	// Liberamos la memoria
	free(nodo1p);
	free(nodo2p);
	free(nodo3p);

	return 0;
}
