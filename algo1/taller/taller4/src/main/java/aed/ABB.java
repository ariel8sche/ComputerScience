package aed;

import java.lang.reflect.Array;
import java.util.*;

// Todos los tipos de datos "Comparables" tienen el método compareTo()
// elem1.compareTo(elem2) devuelve un entero. Si es mayor a 0, entonces elem1 > elem2
public class ABB<T extends Comparable<T>> implements Conjunto<T> {
    private Nodo _raiz;
    private int _cardinal;

    private class Nodo {
        private T _valor;
        private Nodo _der;
        private Nodo _izq;
        private Nodo _padre;

        public Nodo(T elem) {
            _valor = elem;
        }

    }

    public ABB() {
        _raiz = null;
        _cardinal = 0;
    }

    public int cardinal() {
        return _cardinal;
    }

    public T minimo(){
        Nodo actual=_raiz;
        actual._padre=actual;
        while(actual._padre._izq!=null){
            actual._padre=actual._padre._izq;
        }
        return actual._padre._valor;
    }

    public T maximo(){
        Nodo actual=_raiz;
        actual._padre=actual;
        while(actual._padre._der!=null){
            actual._padre=actual._padre._der;
        }
        return actual._padre._valor;
    }

    public void insertar(T elem) {
        Nodo nuevo = new Nodo(elem);
        Nodo actual = _raiz;
    
        if (_raiz == null) {
            _raiz = nuevo;
            _cardinal = 1;
            return;
        }
        while (true) {
            if (actual._valor.compareTo(elem) > 0) {
                if (actual._izq == null) {
                    actual._izq = nuevo;
                    actual._izq._padre = actual;
                    _cardinal++; 
                    break;
                } else {
                    actual = actual._izq;
                }
            } else if (actual._valor.compareTo(elem) < 0) {
                if (actual._der == null) {
                    actual._der = nuevo;
                    actual._der._padre = actual;
                    _cardinal++;  
                    break;
                } else {
                    actual = actual._der;
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
            if (candidato._valor.compareTo(elem)==0) {
                res = true;
            } else if (candidato._valor.compareTo(elem) > 0) {
                candidato = candidato._izq;
            } else if (candidato._valor.compareTo(elem) < 0){
                candidato = candidato._der;
            }
        }   
        return res; 
    }
    public void eliminar(T elem) {
        Nodo actual = _raiz;
        Nodo padre = null;
    
        while (actual != null) {
            int comparacion = elem.compareTo(actual._valor);
    
            if (comparacion == 0) {
                break;
            }
    
            padre = actual;
    
            if (comparacion < 0) {
                actual = actual._izq;
            } else {
                actual = actual._der;
            }
        }
    
        if (actual == null) {
            // no encontrado
            return;
        }
    
        // Nodo sin hijos o con un hijo
        if (actual._izq == null) {
            reemplazarNodo(padre, actual, actual._der);
        } else if (actual._der == null) {
            reemplazarNodo(padre, actual, actual._izq);
        } else {
            // Nodo con dos hijos
            Nodo sucesor = encontrarMinimo(actual._der);
            actual._valor = sucesor._valor;
            actual._der = eliminarMinimo(actual._der);
        }
    
        _cardinal--;
    }
    
    private Nodo encontrarMinimo(Nodo raiz) {
        while (raiz._izq != null) {
            raiz = raiz._izq;
        }
        return raiz;
    }
    
    private Nodo eliminarMinimo(Nodo raiz) {
        if (raiz._izq == null) {
            return raiz._der;
        }
        
        raiz._izq = eliminarMinimo(raiz._izq);
        return raiz;
    }
    
    private void reemplazarNodo(Nodo padre, Nodo antiguo, Nodo nuevo) {
        if (padre == null) {
            _raiz = nuevo;
        } else if (padre._izq == antiguo) {
            padre._izq = nuevo;
        } else {
            padre._der = nuevo;
        }
    }

    private Nodo sucesor(Nodo actual) {
        Nodo sucesor;
        if (actual != null) {
            if (actual._valor == maximo()) {
                sucesor = null;
            } else if (actual._der != null) {
                actual = actual._der;
                while (actual._izq != null) {
                    actual = actual._izq;
                }
                sucesor = actual;
            } else if (actual._padre != null) {
                while (actual._padre._valor.compareTo(actual._valor) < 0) {
                    actual = actual._padre;
                }
                sucesor = actual._padre;
            } else {
                sucesor = null;
            }
        } else {
            sucesor = null;
        }
        return sucesor; 
    } 
    
    public String toString(){
        StringBuffer sb = new StringBuffer();
        Nodo actual = encontrarMinimo(_raiz);
        sb.append("{");
        for (int i=0; i < cardinal(); i++) {
            if (actual == null) {
                sb.append("0");
            }else if (i == cardinal()-1) {
                sb.append(actual._valor);
            } else {
                sb.append(actual._valor+",");
                actual = sucesor(actual);
            }
        }
        sb.append("}");
        return sb.toString();
    }

    private class ABB_Iterador implements Iterador<T> {
        private Nodo _actual;

    private Nodo sucesor(Nodo actual) {
        Nodo sucesor;
        if (actual != null) {
            if (actual._valor == maximo()) {
                sucesor = null;
            } else if (actual._der != null) {
                actual = actual._der;
                while (actual._izq != null) {
                    actual = actual._izq;
                }
                sucesor = actual;
            } else if (actual._padre != null) {
                while (actual._padre._valor.compareTo(actual._valor) < 0) {
                    actual = actual._padre;
                }
                sucesor = actual._padre;
            } else {
                sucesor = null;
            }
        } else {
            sucesor = null;
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
            return _actual._valor;
        }

    }

    public Iterador<T> iterador() {
        return new ABB_Iterador();
    }

}