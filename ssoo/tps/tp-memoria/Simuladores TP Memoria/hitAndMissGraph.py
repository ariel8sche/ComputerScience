import matplotlib.pyplot as plt
import numpy as np

# Datos del ejemplo (LRU)
policies = ['LRU', 'SC']
hits = [7, 7]       # <--- reemplazá con tus valores reales
misses = [5, 5]

x = np.arange(len(policies))  # posiciones
width = 0.35  # ancho de las barras

fig, ax = plt.subplots(figsize=(6, 5.5))

# Dibujar barras
bars1 = ax.bar(x - width/2, hits, width, label='Hits', color='mediumseagreen')
bars2 = ax.bar(x + width/2, misses, width, label='Misses', color='lightcoral')

# Etiquetas y estilo
ax.set_ylabel('Cantidad')
ax.set_title('Hits y Misses con LRU y SC')
ax.set_xticks(x)
ax.set_xticklabels(policies)
ax.legend()

# Mostrar valores encima de las barras
for bars in [bars1, bars2]:
    for bar in bars:
        height = bar.get_height()
        ax.text(bar.get_x() + bar.get_width()/2, height + 0.1, f'{int(height)}',
                ha='center', va='bottom', fontsize=9)

plt.tight_layout()
plt.show()
