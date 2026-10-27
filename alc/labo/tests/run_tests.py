"""
Uso:
    python run_tests.py              -> todos los labos
    python run_tests.py 6            -> solo labo 6
    python run_tests.py 4 5 6        -> labos 4, 5 y 6
    python run_tests.py 6 -k diagRH  -> labo 6, solo tests con 'diagRH' en el nombre
    python run_tests.py -x           -> corta en el primer fallo
"""
import os, sys
import pytest

aqui = os.path.dirname(os.path.abspath(__file__))
labos = [a for a in sys.argv[1:] if a.isdigit()]
extra = [a for a in sys.argv[1:] if not a.isdigit()]

if labos:
    archivos = [os.path.join(aqui, "tests", f"test_labo{int(n):02d}.py") for n in labos]
else:
    archivos = [os.path.join(aqui, "tests")]

sys.exit(pytest.main(["-v", "-s", "--tb=short", "-p", "no:cacheprovider"] + archivos + extra))
