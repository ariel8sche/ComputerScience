package aed;

import javax.swing.plaf.TreeUI;

class Funciones {
    int cuadrado(int x) {
        int res = x * x;
        return res;
    }

    double distancia(double x, double y) {
        double res = Math.sqrt((x * x) + (y * y));
        return res;
    }

    boolean esPar(int n) {
        if ((n % 2) == 0 ) {
            return true;
        } 
        return false;
    }

    boolean esBisiesto(int n) {
        if (((n % 4) == 0) && ((n % 100) != 0)) {
            return true;
        } else if (((n % 400) == 0)) {
            return true;
        }
        return false;
    }

    int factorialIterativo(int n) {
        int res = 1;
        for (int x = 1;x <= n; x++) {
            res = res * x;
        }
        return res;
    }

    int factorialRecursivo(int n) {
        int res = 1;
        if (n <= 0) {
            return 1;
        } else {
            res = n * factorialRecursivo(n - 1);
        }
        return res;
    }

    boolean esPrimo(int n) {
        if (n <= 1) {
            return false;
        } else {
            for (int x = 2; x < n; x++) {
                if ((n % x) == 0) {
                    return false;
                }
            }
        }
        return true;
    }

    int sumatoria(int[] numeros) {
        int res = 0;
        for (int x : numeros) {
            res = res + x;
        }
        return res;
    }

    int busqueda(int[] numeros, int buscado) {
        for (int i = 0; i < numeros.length; i++) {
            if (numeros[i] == buscado) {
                return i;
            }
        }
        return 0;
    }

    boolean tienePrimo(int[] numeros) {
        for (int x : numeros) {
            if (esPrimo(x) == true) {
                return true;
            }
        }
        return false;
    }

    boolean todosPares(int[] numeros) {
        boolean res = true;
        for (int x : numeros) {
            if ((x % 2) == 0) {
                res = res && true;
            } else {
                res = false;
            }
        }
        return res;
    }

    boolean esPrefijo(String s1, String s2) {
        boolean res = true;
        for (int i = 0; i < s1.length(); i++) {
            if (s1.length() > s2.length()) {
                return false;
            } else if (s1.charAt(i) == s2.charAt(i)) {
                res = res && true;
            } else {
                return false;
            }
        }
        return res;
    }

    boolean esSufijo(String s1, String s2) {
        if(s2.length() < s1.length()){
            return false;
        }
        String prefijo = "";
        for(int i = s2.length()-s1.length(); i < s2.length();i++){
            prefijo += s2.charAt(i);
        }
        // String prefijo = s2.substring(s2.length()-s1.length(), s2.length());
        return esPrefijo(prefijo, s1);
    }
}
