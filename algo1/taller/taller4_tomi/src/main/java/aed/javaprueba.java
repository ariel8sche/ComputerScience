package aed;

public class javaprueba {
    public void eliminar(T elem){
        Nodo actual = _raiz;
        boolean eliminado = false;
        if (pertenece(elem)) {
            while (eliminado == false) {
                if (actual != null && actual._valor == elem) {
                    if (actual._izq == null && actual._der == null) {
                        if (elem == _minimo) {
                            _minimo = actual._padre._valor;
                        } else if (elem == _maximo) {
                            _maximo = actual._padre._valor;
                        }
                        actual = null;
                        _cardinal--;

                    } else if (actual._izq != null && actual._der == null) {
                        actual._valor = actual._izq._valor;
                        actual._izq = null;
                        _cardinal--;
                        eliminado = true;
                        
                    } else if (actual._izq == null && actual._der != null) {
                        actual._valor = actual._der._valor;
                        actual._der = null;
                        _cardinal--;
                        eliminado = true;

                    } else if (actual._izq != null && actual._der != null) {
                        Nodo sucesor = encontrarMinimo(actual._der);
                        actual._valor = sucesor._valor;
                        actual._der = eliminarNodo(actual._der);
                        _cardinal--;

                    }
                } else if (elem.compareTo(actual._valor) > 0) {
                    if (actual._der != null) {
                        actual = actual._der;
                    } else {
                        break;
                    }
                } else {
                    if (actual._der != null) {
                        actual = actual._izq;
                    } else {
                        break;
                    }
                }
                    
                }
            }
    }
}
