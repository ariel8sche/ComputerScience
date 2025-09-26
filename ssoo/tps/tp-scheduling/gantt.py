import sys, os, re, argparse
import pandas as pd
import matplotlib
# si no hay DISPLAY (ej: servidor), usar backend 'Agg' para salvar PNG
if not os.environ.get("DISPLAY"):
    matplotlib.use("Agg")
import matplotlib.pyplot as plt
import matplotlib.cm as cm

def parse_trace_lines(lines):
    data = []
    regex = re.compile(r"\[ time (\d+) \] Run JOB (\d+) at PRIORITY (\d+)")

    for line in lines:
        m = re.search(regex, line)
        if m:
            tiempo = int(m.group(1))
            proceso = int(m.group(2))
            prioridad = int(m.group(3))
            data.append({"tiempo": tiempo, "proceso": proceso, "prioridad": prioridad})

    return pd.DataFrame(data)

def plot_gantt(df):
    """
    Dibuja un diagrama de Gantt a partir del DataFrame con columnas [tiempo, proceso, prioridad].
    """
    fig, ax = plt.subplots(figsize=(12, 4))

    runs = []
    if not df.empty:
        start = df.iloc[0]["tiempo"]
        prev_job = df.iloc[0]["proceso"]
        prev_prio = df.iloc[0]["prioridad"]

        for i in range(1, len(df)):
            t, job, prio = df.iloc[i]["tiempo"], df.iloc[i]["proceso"], df.iloc[i]["prioridad"]
            if job != prev_job or prio != prev_prio or t != df.iloc[i-1]["tiempo"] + 1:
                runs.append((start, df.iloc[i-1]["tiempo"]+1, prev_job, prev_prio))
                start = t
                prev_job = job
                prev_prio = prio
        runs.append((start, df.iloc[-1]["tiempo"]+1, prev_job, prev_prio))

    max_prio = df["prioridad"].max() if not df.empty else 1

    for (start, end, job, prio) in runs:
        ax.barh(y=f"Job {job}", width=end-start, left=start, height=0.4,
                color=cm.viridis_r(prio/max_prio))
        ax.text((start+end)/2, job, f"P{prio}", va='center', ha='center',
                color="white", fontsize=8, fontweight="bold")

    ax.set_xlabel("Tiempo")
    ax.set_xticks(range(0, df["tiempo"].max() + 2, 2))
    ax.set_ylabel("Proceso")
    ax.set_title("Diagrama de Gantt con Prioridades (MLFQ)")
    plt.show()

if __name__ == "__main__":
    # abrir archivo trace.txt en el mismo directorio
    with open("trace.txt", "r") as f:
        lines = f.readlines()

    df = parse_trace_lines(lines)
    plot_gantt(df)
