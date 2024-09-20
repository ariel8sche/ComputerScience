package aed;

class VectorDeInts implements SecuenciaDeInts {
    private static final int CAPACIDAD_INICIAL = 1;

    public VectorDeInts() {
        _long = 0;
        _vector = new int[CAPACIDAD_INICIAL];
    }

    public VectorDeInts(VectorDeInts vector) {
        _vector = new int[vector._long];
        for (int i=0; i < vector._long ; i++) {
            _vector[i] = vector._vector[i];
            _long = _long + 1;
        }
    }
 
    public int longitud() {
        return _long;
    }

    public void agregarAtras(int i) {
        if (_long <= _vector.length) {
            int[] newVector = new int[_long + 1];
            for (int j = 0; j < _long; j++) {
                newVector[j] = _vector[j];
            }
            newVector[_long] = i;
            _vector = newVector;
            _long = _long + 1;
        } else {
            _vector[_long] = i;
            _long = _long + 1;
        }
    }

    public int obtener(int i) {
        int res = 0;
        if (i >_long) {
            res = 0;
        } else {
            res = _vector[i];
        }
        return res;
    }

    public void quitarAtras() {
        if (_long > 0) {
            int[] newVector = new int[_long - 1];
            for (int j = 0; j < _long -1; j++) {
                newVector[j] = _vector[j];
            }
            _vector = newVector;
            _long = _long - 1;
        } 
    }

    public void modificarPosicion(int indice, int valor) {
        if (_long > indice) {
            _vector[indice] = valor;
        } 
    }

    public VectorDeInts copiar() {
        VectorDeInts copiaVector = new VectorDeInts();
        for (int i = 0; i < _long ; i++) {
            copiaVector.agregarAtras(_vector[i]);
        }
        return copiaVector;
    }

    private int _long;
    private int[] _vector;
}
