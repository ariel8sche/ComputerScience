#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>
#include <assert.h>

#include "../test-utils.h"
#include "ABI.h"

int main() {
	/* Acá pueden realizar sus propias pruebas */
	assert(alternate_sum_4_using_c(8, 2, 5, 1) == 10);

	assert(alternate_sum_4_using_c_alternative(8, 2, 5, 1) == 10);

	assert(alternate_sum_8(822, 230, 481, 566, 592, 70, 838, 216) == 1651);
    printf("alternate_sum_8(822, 230, 481, 566, 592, 70, 838, 216) = %d\n", alternate_sum_8(822, 230, 481, 566, 592, 70, 838, 216));
	uint32_t res = 0;
	//registros: destination[EDI], x1[ESI], f1[XMM0]
	product_2_f(&res, 3, 2.7f); // 3 * 2.7 = 8.1 → truncado → 8
	assert(res == 8);

	double res2 = 0.0;

    // Valores variados para testear la multiplicación
    // floats: 1.5 * 2.0 * 0.5 * 1.0 * 0.25 * 2.0 * 1.0 * 1.0 * 1.0 = 0.75
    // uints: 4 * 1 * 2 * 1 * 2 * 1 * 1 * 1 * 1 = 16
    // resultado = 0.75 * 16 = 12.0

    product_9_f(&res2,
                4, 1.5f,
                1, 2.0f,
                2, 0.5f,
                1, 1.0f,
                2, 0.25f,
                1, 2.0f,
                1, 1.0f,
                1, 1.0f,
                1, 1.0f);

    assert((int)res2 == 12); // truncamos a entero solo para comparación
	return 0;

}