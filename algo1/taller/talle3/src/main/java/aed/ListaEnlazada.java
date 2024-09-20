package aed;

import java.util.*;

public class ListaEnlazada<T> implements Secuencia<T> {
    private int _long;
    private Nodo _primero;
    private Nodo _ultimo;
    private Nodo _actual;

    private class Nodo {
        T valor;
        Nodo sig;
        Nodo prev;

        public Nodo(T v) {
            valor = v;
            sig = null;
            prev = null;
        }
    }

    public ListaEnlazada() {
        _long = 0;
        _primero = null;
        _ultimo = null;
    }

    public int longitud() {
        return _long;
    }

    public void agregarAdelante(T elem) {
        Nodo nuevo = new Nodo(elem);
        if (_long == 0) {
            _primero = nuevo;
            _ultimo = nuevo;
        } else {
            nuevo.sig = _primero;
            _primero.prev = nuevo;
            _primero = nuevo;
        }
        _long ++;
    }

    public void agregarAtras(T elem) {
        Nodo nuevo = new Nodo(elem);
        if (_long == 0) {
            _primero = nuevo;
            _ultimo = nuevo; 
        } else if (_ultimo != null) {
            nuevo.prev = _ultimo;
            _ultimo.sig = nuevo;
            _ultimo = nuevo;
        } else {
            _ultimo = nuevo;
        }
        _long ++;
    }

    public T obtener(int i) {
        if (i == 0) {
            return _primero.valor;
        } else {
            int j = 1;
            Nodo actual = _primero;
            while (j < i) {
                actual = actual.sig;
                j++;
            }
            return actual.sig.valor;
        }
    }

    public void eliminar(int i) {
        Nodo actual = _primero;
        if (_long == 1) {
            _primero = null;
            _ultimo = null;
        } else if (i == 0) {
            _primero = _primero.sig;
            _primero.prev = null;
        } else {
            actual = actual.sig;
            for (int j = 1; j < _long; j++) {
                if (i == j) {
                    actual.prev.sig = actual.sig;
                }
                actual = actual.sig;
            }
        }
        _long--;
    }

    public void modificarPosicion(int indice, T elem) {
        Nodo actual = _primero;
        if (indice == 0) {
            actual.valor = elem;
        } else {
            actual = actual.sig;
            for (int j = 1; j < _long; j++) {
                if (indice == j) {
                    actual.valor = elem;
                }
                actual = actual.sig;
            }
        }
    }

    public ListaEnlazada<T> copiar() {
        ListaEnlazada<T> copia = new ListaEnlazada<T>();
        Nodo actual = _primero;
        for (int j = 0; j < _long; j++) {
            copia.agregarAtras(actual.valor);
            actual = actual.sig;
        }
        return copia;
    }

    public ListaEnlazada(ListaEnlazada<T> lista) {
        ListaEnlazada<T> copia = lista.copiar();
        _primero = copia._primero;
        _ultimo = copia._ultimo;
        _long = lista._long;
    }
    
    @Override
    public String toString() {
        StringBuffer sBuffer = new StringBuffer();
        sBuffer.append("[");
        for (int i = 0; i < _long; i++) {
            if (i == _long-1) {
                sBuffer.append(this.obtener(i));
            } else {
                sBuffer.append(this.obtener(i) + ", ");
            }
        }
        sBuffer.append("]");
        return sBuffer.toString();
    }

    private class ListaIterador implements Iterador<T> {

        public boolean haySiguiente() {
            boolean res = false;
            if (_long > 0) {
                if (_actual != null) {
                    res = true;
                }
            }
            return res;
        }
        
        public boolean hayAnterior() {
            boolean res = false;
            if (_long > 0) {
                if (_actual == null) {
                    res = true;
                } else if (_actual.prev != null) {
                    res = true;
                }
            } 
            return res;
        }

        public T siguiente() {
            T valor = _actual.valor;
            _actual = _actual.sig; 
            return valor;
        }
         
        public T anterior() {
            if (_actual == null) {
                _actual = _ultimo;
            } else {
                _actual = _actual.prev;
            }
            return _actual.valor;
        }
    }

    public Iterador<T> iterador() {
        _actual = _primero;
        return new ListaIterador();
    }

}
