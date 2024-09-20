package aed;

public class InternetToolkit {
    public InternetToolkit() {
    }

    public Fragment[] tcpReorder(Fragment[] fragments) {
        for (int i = 1; i < fragments.length; i++) {
            Fragment frag = fragments[i];
            int j = i - 1;
           
            while (j >= 0 && fragments[j].compareTo(frag) > 0) {
                fragments[j + 1] = fragments[j];
                j = j - 1;
            }
            fragments[j + 1] = frag;
        }
        return fragments;
    }

    public Router[] heapify(Router[] routers) {
        int father = routers.length/2 - 1;
        while  (father >= 0){
            int sonLeft = 2*father+1;
            int sonRight = 2*father+2;
            int posCorrect = father;                
            while ((sonLeft < routers.length && routers[sonLeft].compareTo(routers[posCorrect]) > 0) || (sonRight < routers.length && routers[sonRight].compareTo(routers[posCorrect]) > 0)){
                if (sonLeft < routers.length && sonRight < routers.length){
                    if (routers[sonLeft].compareTo(routers[sonRight]) > 0){
                        Router temp = routers[sonLeft]; // O(1)
                        routers[sonLeft] = routers[posCorrect]; // O(1)
                        routers[posCorrect] = temp; // O(1)
                        posCorrect = sonLeft;
                    }
                    else{
                        Router temp = routers[sonRight]; // O(1)
                        routers[sonRight] = routers[posCorrect]; // O(1)
                        routers[posCorrect] = temp; // O(1)
                        posCorrect = sonRight;                           
                    }
                }
                else{
                    Router temp = routers[sonLeft]; // O(1)
                    routers[sonLeft] = routers[posCorrect]; // O(1)
                    routers[posCorrect] = temp; // O(1)
                    posCorrect = sonLeft; // O(1)
                }
                sonLeft = 2*posCorrect+1; // O(1)
                sonRight = 2*posCorrect+2; // O(1)

            }
            father = father -1;
        }
        return routers;
    }

    public void down(Router[] routers, int index){ // O(log|routers|)
        int sonLeft = 2*index +1; // O(1)
        int sonRight = 2*index + 2; // O(1)
        while ((sonLeft < routers.length && routers[sonLeft].compareTo(routers[index]) > 0 ) ||
            (sonRight < routers.length && routers[sonRight].compareTo(routers[index]) > 0)){ // O(log(|routers|))
            if (sonLeft < routers.length && sonRight < routers.length){ // O(1) 
                if (routers[sonLeft].compareTo(routers[sonRight]) > 0){ // O(1)
                    Router temp = routers[sonLeft]; // O(1)
                    routers[sonLeft] = routers[index]; // O(1)    
                    routers[index] = temp; // O(1)
                    index = sonLeft; // O(1)
                }
                else{
                    Router temp = routers[sonRight]; // O(1)
                    routers[sonRight] = routers[index]; // O(1)
                    routers[index] = temp; // O(1)                    
                    index = sonRight; // O(1)                        
                    }
            }
            else{
                Router temp = routers[sonLeft]; // O(1)
                routers[sonLeft] = routers[index]; // O(1)
                routers[index] = temp; // O(1)                
                index = sonLeft; // O(1)
                }
            sonLeft = 2*index+1; // O(1)
            sonRight = 2*index+2; // O(1)
        }    
    }

    public Router[] kTopRouters(Router[] routers, int k, int umbral) { // O(N + K log N)
        Router[] res = new Router[k]; // O(1)
        Router[] routersHeap =  new Router[routers.length]; // O(1)
        for (int i = 0; i < routers.length; i++) { // O(log N)
            routersHeap[i] = routers[i]; // O(1)
        }
        routersHeap = heapify(routersHeap); 
        int j = 0;
        for (int i = 0; i < k; i++) { // O(K)
            Router r = new Router(-1, -1); // O(1)
            if (routersHeap[i].getTrafico() >= umbral) { // O(1) 
                res[j] = routersHeap[0]; // O(1)
                j++; // O(1)
                routersHeap[0] = r; // O(1)
                down(routersHeap, 0); // O(log N)
            }
        }
        return res;
    }

    public IPv4Address[] sortIPv4(String[] ipv4) {
        IPv4Address[] res = new IPv4Address[ipv4.length];
        res[0] = new IPv4Address(ipv4[0]);  // inicializar el primer elemento
        for (int i = 1; i < ipv4.length; i++) {
            IPv4Address ip = new IPv4Address(ipv4[i]);
            int j = i-1; 
            int k = 0;
            while (j >= 0) {
                if (res[j].getOctet(k) > ip.getOctet(k)) {
                    res[j+1] = res[j];
                    j--;
                    k = 0;  // resetear k cuando cambiamos de elemento
                } else if (res[j].getOctet(k) == ip.getOctet(k)) {
                    k++;
                    if (k == 4) {  // todos los octetos son iguales, no necesitamos comparar más
                        res[j+1] = ip;
                        break;
                    }
                } else {
                    res[j+1] = ip;
                    break;
                }
                if (j < 0) {  // estamos en el primer elemento, ip debe ir al principio
                    res[0] = ip;
                }
            }
        }
        return res;
    }

}
