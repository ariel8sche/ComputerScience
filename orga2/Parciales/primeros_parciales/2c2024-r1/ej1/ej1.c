#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "ej1.h"

/**
 * Marca el ejercicio 1A como hecho (`true`) o pendiente (`false`).
 *
 * Funciones a implementar:
 *   - es_indice_ordenado
 */
bool EJERCICIO_1A_HECHO = true;

/**
 * Marca el ejercicio 1B como hecho (`true`) o pendiente (`false`).
 *
 * Funciones a implementar:
 *   - contarCombustibleAsignado
 */
bool EJERCICIO_1B_HECHO = true;

/**
 * Marca el ejercicio 1B como hecho (`true`) o pendiente (`false`).
 *
 * Funciones a implementar:
 *   - modificarUnidad
 */
bool EJERCICIO_1C_HECHO = true;

/**
 * OPCIONAL: implementar en C
 */
void optimizar(mapa_t mapa, attackunit_t* compartida, uint32_t (*fun_hash)(attackunit_t*)) {
    uint32_t hash_unidad_compartida = fun_hash(compartida);
    for (uint64_t i=0; i < 255;i++){
        for (uint64_t j=0; j < 255;j++){
            attackunit_t* unidad_actual = mapa[i][j];
            if (unidad_actual == NULL || unidad_actual == compartida){
                continue;
            }
            uint32_t hash_unidad_actual = fun_hash(unidad_actual);
            if (hash_unidad_actual == hash_unidad_compartida){
                unidad_actual->references--;
                compartida->references++;
                mapa[i][j] = compartida;
            }
            if (unidad_actual->references == 0){
                free(unidad_actual);
            }
        }    
    }    
}

/**
 * OPCIONAL: implementar en C
 */
uint32_t contarCombustibleAsignado(mapa_t mapa, uint16_t (*fun_combustible)(char*)) {
    uint32_t total_combustible = 0;
    for (uint64_t i=0; i < 255;i++){
        for (uint64_t j=0; j < 255;j++){
            attackunit_t* unidad_actual = mapa[i][j];
            if (unidad_actual == NULL){
                continue;
            }
            uint32_t combustible_base = (uint32_t) fun_combustible(unidad_actual->clase);
            uint32_t combustible_asignado = unidad_actual->combustible - combustible_base ;
            total_combustible += combustible_asignado;
        }    
    }
    return total_combustible;
}

/**
 * OPCIONAL: implementar en C
 */
void modificarUnidad(mapa_t mapa, uint8_t x, uint8_t y, void (*fun_modificar)(attackunit_t*)) {
    attackunit_t* unidad_actual = mapa[x][y];
    if (unidad_actual == NULL){
       return;
    }
    if (unidad_actual->references > 1){
        attackunit_t* nueva_unidad = malloc(sizeof(attackunit_t));
        unidad_actual->references--;
        *nueva_unidad = *unidad_actual;
        nueva_unidad->references = 1;

        mapa[x][y] = nueva_unidad;

        unidad_actual = nueva_unidad;
    }
    fun_modificar(unidad_actual);
}
