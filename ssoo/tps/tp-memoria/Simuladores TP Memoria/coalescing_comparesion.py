import pandas as pd
import matplotlib.pyplot as plt

# cargar métricas
noC = pd.read_csv("firstFit.metrics.csv")
C   = pd.read_csv("worstFit.metrics.csv")

# filtramos sólo allocs (para el segundo gráfico)
alloc_noC = noC[noC['kind'] == 'alloc']
alloc_C   = C[C['kind'] == 'alloc']

# --- Gráfico 1: cantidad de bloques libres ---
plt.figure(figsize=(8,4))
plt.plot(noC['op_idx'], noC['num_free'], label='FirstFit', alpha=0.7)
plt.plot(C['op_idx'], C['num_free'], label='WorstFit', alpha=0.7)
plt.title('Evolución del tamaño de la Free List')
plt.xlabel('Cantidad de operaciones Alloc')
plt.ylabel('Cantidad de bloques libres')
plt.legend()
plt.grid(True)
plt.tight_layout()
plt.show()

# --- Gráfico 2: tasa de éxito acumulada ---
alloc_noC['success'] = alloc_noC['ret'] != -1
alloc_C['success']   = alloc_C['ret'] != -1

alloc_noC['cum_rate'] = alloc_noC['success'].cumsum() / (alloc_noC.index + 1)
alloc_C['cum_rate']   = alloc_C['success'].cumsum() / (alloc_C.index + 1)

plt.figure(figsize=(8,4))
plt.plot(alloc_noC.index, alloc_noC['cum_rate'], label='FirstFit', alpha=0.7)
plt.plot(alloc_C.index, alloc_C['cum_rate'], label='WorstFit', alpha=0.7)
plt.title('Tasa acumulada de éxito de asignaciones')
plt.xlabel('Cantidad de operaciones Alloc')
plt.ylabel('Tasa de éxito')
plt.legend()
plt.grid(True)
plt.tight_layout()
plt.show()

# Grafico 3: tamaño promedio de bloque libre
# --- Gráfico 3: tamaño máximo de bloque libre ---
plt.figure(figsize=(8,4))
plt.plot(C['op_idx'], C['max_free'], label='WorstFit', alpha=0.7, )
plt.plot(noC['op_idx'], noC['max_free'], label='FirstFit', alpha=0.7)
plt.title('Evolución del tamaño máximo de bloque libre')
plt.xlabel('Cantidad de operaciones Alloc')
plt.ylabel('Tamaño maximo del bloque libre')
plt.legend(loc='lower center', bbox_to_anchor=(0.88, 0.21))
plt.grid(True)
plt.tight_layout()
plt.show()

