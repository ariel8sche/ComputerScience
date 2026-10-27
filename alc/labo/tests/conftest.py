# Hace que los tests encuentren alc.py (que esta una carpeta mas arriba)
import os, sys
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), "..")))
