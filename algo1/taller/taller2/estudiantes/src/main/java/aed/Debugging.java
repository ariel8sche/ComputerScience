package aed;

class Debugging {
    boolean xor(boolean a, boolean b) {
        if ((a == true && b == false) || (b == true && a == false)) {
            return true;
        } else {
            return false;
        }
    }

    boolean iguales(int[] xs, int[] ys) {
        boolean res = true;
        if (xs.length == ys.length) {
            for (int i = 0; i < xs.length; i++) {
                if (xs[i] == ys[i]) {
                    res = res && true;
                } else {
                    res = false;
                }
            }       
        } else {
            res = false;
        }
        return res;
    }

    boolean ordenado(int[] xs) {
        boolean res = true;
        if (xs.length > 1) {
            for (int i = 0; i < xs.length -1; i++) {
                if ((i == (xs.length -1)) && (xs[i] >= xs[i-1])) {
                    res = true;
                } else if (xs[i] <= xs [i+1]) {
                    res = res && true;
                } else {
                    res = false;
                }
            }
        }
        
        return res;
    }

    int maximo(int[] xs) {
        int res = xs[0];
        for (int i = 0; i < xs.length; i++) {
            if (xs[i] > res) {
                res = xs[i];
            }
        }
        return res;
    }

    boolean todosPositivos(int[] xs) {
        boolean res = true;
        for (int i = 0; i < xs.length; i++) {
                if (xs[i] > 0) {
                    res = res && true;
                } else {
                    res = false;
                }
            }
        
        return res;
    }
}
