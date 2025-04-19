#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>
#include <assert.h>

#include "../test-utils.h"
#include "Memoria.h"

int main() {
	char* texto1 = "Hola mundo";
    uint32_t len = strLen(texto1);
	assert(len == 10);

	return 0;
}
