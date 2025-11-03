import matplotlib.pyplot as plt
import matplotlib.patches as patches

def plot_memory(free_list, occupied_list=None, base_addr=1000, total_size=100):
    fig, ax = plt.subplots(figsize=(10, 1.8), linewidth=1.2)

    # Fondo neutro (toda la memoria)
    ax.add_patch(patches.Rectangle(
        (base_addr, 0), total_size, 1,
        color='lightgray', linewidth=1.2
    ))

    # === Bloques ocupados (rojo) ===
    if occupied_list:
        for block in occupied_list:
            addr, size = block["addr"], block["size"]
            ax.add_patch(patches.Rectangle(
                (addr, 0), size, 1,
                facecolor='lightcoral', edgecolor='black', linewidth=1.2, label='Ocupado'
            ))
            ax.text(addr + size / 2, 0.5, f'{size}', ha='center', va='center')

    # === Bloques libres (verde, con borde negro siempre visible) ===
    for i, block in enumerate(free_list):
        addr, size = block["addr"], block["size"]
        ax.add_patch(patches.Rectangle(
            (addr, 0), size, 1,
            facecolor='lightgreen',
            edgecolor='black', linewidth=1.2,  # borde más marcado
            label='Libre' if i == 0 else ""   # evita duplicados en leyenda
        ))
        ax.text(addr + size / 2, 0.5, f'{size}', ha='center', va='center')

    # Líneas divisorias (cada 5 unidades)
    for x in range(base_addr, base_addr + total_size + 1, 5):
        ax.axvline(x, color='gray', linestyle='--', linewidth=0.1)

    # Configuración de ejes
    ax.set_xlim(base_addr, base_addr + total_size)
    ax.set_xticks(range(base_addr, base_addr + total_size + 1, 10))
    ax.set_ylim(0, 1)
    ax.set_xlabel("Dirección de memoria")
    ax.set_yticks([])
    ax.set_title("Estado de la memoria utilizando la política de WORST FIT")
    ax.grid(False)

    # Leyenda limpia (sin duplicados)
    handles, labels = ax.get_legend_handles_labels()
    by_label = dict(zip(labels, handles))
    ax.legend(by_label.values(), by_label.keys(), loc='upper right')

    plt.tight_layout()
    plt.show()


# === Ejemplo de uso ===
free_list = [
    {'addr': 1000 , 'size':3},
    {'addr': 1003 , 'size':5},
    {'addr': 1008 , 'size':8},
    {'addr': 1016 , 'size':8},
    {'addr': 1033 , 'size':67}
]

occupied_list = [
    {'addr': 1024 , 'size':2},
    {'addr': 1026 , 'size':7}
]

plot_memory(free_list, occupied_list)
