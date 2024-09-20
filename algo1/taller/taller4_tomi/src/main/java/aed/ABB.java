package aed;

import java.util.*;

// Todos los tipos de datos "Comparables" tienen el método compareTo()
// elem1.compareTo(elem2) devuelve un entero. Si es mayor a 0, entonces elem1 > elem2
public class ABB<T extends Comparable<T>> implements Conjunto<T> {
    // Agregar atributos privados del Conjunto
    private Nodo _raiz;
    private int cardinal;

    private class Nodo {
        T valor;
        Nodo izq;
        Nodo der;
        Nodo padre;
        Nodo(T v){
            valor = v;
            izq = null;
            der = null;
            padre = null;
        }
    }

    public ABB() {
        _raiz=null;
        cardinal=0;
    }

    public int cardinal() {
        return cardinal;
    }

    public T minimo(){
        Nodo actual=_raiz;
        actual.padre=actual;
        while(actual.padre.izq!=null){
            actual.padre=actual.padre.izq;
        }
        return actual.padre.valor;
    }

    public T maximo(){
        Nodo actual=_raiz;
        actual.padre=actual;
        while(actual.padre.der!=null){
            actual.padre=actual.padre.der;
        }
        return actual.padre.valor;
    }

    public void insertar(T elem) {
        Nodo nuevo = new Nodo(elem);
        Nodo actual = _raiz;
    
        if (_raiz == null) {
            _raiz = nuevo;
            cardinal = 1;
            return;
        }
        while (true) {
            if (actual.valor.compareTo(elem) > 0) {
                if (actual.izq == null) {
                    actual.izq = nuevo;
                    cardinal++; 
                    break;
                } else {
                    actual = actual.izq;
                }
            } else if (actual.valor.compareTo(elem) < 0) {
                if (actual.der == null) {
                    actual.der = nuevo;
                    cardinal++;  
                    break;
                } else {
                    actual = actual.der;
                }
            } else { //Caso donde son iguales elem y actual.valor :)
                break;
            }
        }
    }

    public boolean pertenece(T elem){
        boolean res=false;
        Nodo candidato = _raiz;
        while (candidato != null && res == false) {
            if (candidato.valor.compareTo(elem)==0) {
                res = true;
            } else if (candidato.valor.compareTo(elem) > 0) {
                candidato = candidato.izq;
            } else if (candidato.valor.compareTo(elem) < 0){
                candidato = candidato.der;
            }
        }   
        return res; 
    }
    public void eliminar(T elem) {
        Nodo actual = _raiz;
        Nodo padre = null;
    
        while (actual != null) {
            int comparacion = elem.compareTo(actual.valor);
    
            if (comparacion == 0) {
                break;
            }
    
            padre = actual;
    
            if (comparacion < 0) {
                actual = actual.izq;
            } else {
                actual = actual.der;
            }
        }
    
        if (actual == null) {
            // no encontrado
            return;
        }
    
        // Nodo sin hijos o con un hijo
        if (actual.izq == null) {
            reemplazarNodo(padre, actual, actual.der);
        } else if (actual.der == null) {
            reemplazarNodo(padre, actual, actual.izq);
        } else {
            // Nodo con dos hijos
            Nodo sucesor = encontrarMinimo(actual.der);
            actual.valor = sucesor.valor;
            actual.der = eliminarMinimo(actual.der);
        }
    
        cardinal--;
    }
    
    private Nodo encontrarMinimo(Nodo raiz) {
        while (raiz.izq != null) {
            raiz = raiz.izq;
        }
        return raiz;
    }
    
    private Nodo eliminarMinimo(Nodo raiz) {
        if (raiz.izq == null) {
            return raiz.der;
        }
        
        raiz.izq = eliminarMinimo(raiz.izq);
        return raiz;
    }
    
    private void reemplazarNodo(Nodo padre, Nodo antiguo, Nodo nuevo) {
        if (padre == null) {
            _raiz = nuevo;
        } else if (padre.izq == antiguo) {
            padre.izq = nuevo;
        } else {
            padre.der = nuevo;
        }
    }

    public String toString(){
        StringBuffer sb = new StringBuffer();
        Nodo actual = encontrarMinimo(_raiz);
        sb.append("{");
        for (int i=0; i < cardinal; i++) {
            if (i == cardinal-1) {
                sb.append(actual.valor);
            } else {
                sb.append(actual.valor + ",");
            }
            actual = sucesor(actual);
        }
        sb.append("}");
        return sb.toString();
    }

    private Nodo sucesor(Nodo raiz) {
        Nodo actual = raiz;
        Nodo sucesor; 
        if (actual.der == null) {
            if (actual.valor.compareTo(actual.padre.valor) > 0) {
                sucesor = actual.padre.padre;
            } else {
                sucesor = actual.padre;
            }
        } else {
            actual = actual.der;
            while (actual.izq != null) {
                actual = actual.izq;
            }
            sucesor = actual;
        }
        return sucesor;   
    }

    private class ABB_Iterador implements Iterador<T> {
        private Nodo _actual;

        private Nodo sucesor(Nodo raiz) {
        Nodo actual = raiz;
        Nodo sucesor; 
        if (actual.valor == maximo()) {
            sucesor = null;
        } else if (actual.der == null) {
            if (actual.valor.compareTo(actual.padre.valor) > 0) {
                sucesor = actual.padre.padre;
            } else {
                sucesor = actual.padre;
            }
        } else {
            actual = actual.der;
            while (actual.izq != null) {
                actual = actual.izq;
            }
            sucesor = actual;
        }
        return sucesor;   
        }

        public boolean haySiguiente() {           
            boolean res = false;
            if (_actual != null) {
                res = true;
            }
            return res;
        }

        public T siguiente() {
            if (_actual == null) {
                _actual = encontrarMinimo(_raiz);
            } else {
                _actual = sucesor(_actual);
            }
            return _actual.valor;
        }

    }

    public Iterador<T> iterador() {
        return new ABB_Iterador();
    }

}