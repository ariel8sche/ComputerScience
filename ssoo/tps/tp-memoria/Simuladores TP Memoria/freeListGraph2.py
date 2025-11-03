import matplotlib.pyplot as plt
import matplotlib.patches as mpatches

# --- 1. Configuración de Memoria ---
MEMORIA_INICIO = 1000
MEMORIA_TAMANO = 100
MEMORIA_FIN = MEMORIA_INICIO + MEMORIA_TAMANO

# --- 2. Diccionarios de Bloques de Memoria (addr: size) ---
# {dirección_inicial: tamaño_del_bloque}
free_list = {
    1000: 3,
    1003: 5,
    1016: 84
}

occupied_list = {
    1008: 8
}

# --- 3. Inicialización del Gráfico ---
fig, ax = plt.subplots(figsize=(12, 3)) # Un gráfico más ancho para la barra de memoria

ax.set_yticks([0]) # Solo un eje Y para la representación de la memoria
ax.set_yticklabels(['Memoria'])

# Configura los límites del eje X (direcciones de memoria)
ax.set_xlim(MEMORIA_INICIO, MEMORIA_FIN)
ax.set_xlabel('Dirección de Memoria')
ax.set_title('Visualización de la Memoria')

# Opcional: Establecer un color de fondo para la "memoria total"
# Esto puede ser útil si hay "huecos" entre bloques asignados y libres que no se definen explícitamente.
# Para este caso, vamos a dibujarlos explícitamente para evitar solapamientos visuales complejos.

# --- 4. Preparar todos los bloques y ordenarlos ---
all_blocks = []
for addr, size in free_list.items():
    all_blocks.append({'addr': addr, 'size': size, 'type': 'free', 'color': 'lightgreen'})
for addr, size in occupied_list.items():
    all_blocks.append({'addr': addr, 'size': size, 'type': 'occupied', 'color': 'red'})

# Ordenar los bloques por dirección de inicio para dibujarlos correctamente
all_blocks.sort(key=lambda x: x['addr'])

# --- 5. Dibujar la "barra" de memoria principal ---
# Dibujamos un rectángulo base para representar toda la memoria disponible,
# y luego sobre este dibujaremos los bloques asignados/libres.
# Sin embargo, para este estilo de "dividido", es mejor dibujar directamente cada segmento.

# El enfoque de "rectángulo dividido" se logra dibujando cada segmento consecutivo.
# Para manejar los "huecos" (memoria no asignada y no en free_list), necesitamos un
# puntero a la última dirección dibujada.

current_address = MEMORIA_INICIO

# Recorrer los bloques ordenados
for block in all_blocks:
    # 1. Rellenar los "huecos" entre bloques o antes del primer bloque
    if block['addr'] > current_address:
        gap_size = block['addr'] - current_address
        ax.barh(y=0, width=gap_size, left=current_address, height=0.8,
                color='lightgray', edgecolor='black', hatch='//', label='No Asignado' if 'No Asignado' not in [p.get_label() for p in ax.patches] else None)
        ax.text(current_address + gap_size / 2, 0, f'{gap_size}',
                ha='center', va='center', color='black', fontsize=7, weight='bold')

    # 2. Dibujar el bloque actual
    ax.barh(y=0, width=block['size'], left=block['addr'], height=0.8,
            color=block['color'], edgecolor='black',
            label=block['type'].capitalize() if block['type'].capitalize() not in [p.get_label() for p in ax.patches] else None) # Etiqueta solo una vez
    ax.text(block['addr'] + block['size'] / 2, 0, f'{block["size"]}',
            ha='center', va='center', color='black', fontsize=7, weight='bold')

    # Actualizar la dirección actual para el próximo bloque/hueco
    current_address = block['addr'] + block['size']

# 3. Rellenar cualquier "hueco" al final de la memoria si no está completamente ocupada
if current_address < MEMORIA_FIN:
    remaining_size = MEMORIA_FIN - current_address
    ax.barh(y=0, width=remaining_size, left=current_address, height=0.8,
            color='lightgray', edgecolor='black', hatch='//', label='No Asignado' if 'No Asignado' not in [p.get_label() for p in ax.patches] else None)
    ax.text(current_address + remaining_size / 2, 0, f'{remaining_size}',
            ha='center', va='center', color='black', fontsize=7, weight='bold')


# --- 6. Agregar Elementos Visuales Adicionales ---

# Líneas para el inicio y fin de la memoria
ax.axvline(MEMORIA_INICIO, color='blue', linestyle='--', linewidth=1)
ax.axvline(MEMORIA_FIN, color='blue', linestyle='--', linewidth=1)
ax.text(MEMORIA_INICIO, -0.4, f'{MEMORIA_INICIO}', color='blue', ha='left', fontsize=9)
ax.text(MEMORIA_FIN, -0.4, f'{MEMORIA_FIN}', color='blue', ha='right', fontsize=9)


# Asegurarse de que las etiquetas de la leyenda sean únicas
handles, labels = ax.get_legend_handles_labels()
unique_labels = dict(zip(labels, handles))
ax.legend(unique_labels.values(), unique_labels.keys(), loc='center right')

# Quitar el tick en el eje Y
ax.tick_params(axis='y', length=0)

plt.tight_layout()
plt.show()