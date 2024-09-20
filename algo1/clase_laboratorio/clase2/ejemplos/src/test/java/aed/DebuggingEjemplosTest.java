package aed;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;

class DebuggingEjemplosTest {

    int calcularSumatoria(int total) {
        int sum = 1;
        for (int i = 1; i < 10 ; i++) {
            //System.out.println(sum);
            sum += i;
        }
        return sum;
    }
    @Test
    void utilizandoPrints() {
        int sum;
        // Calculo sumatoria hasta 10
        sum = calcularSumatoria(10);
        
        assertEquals(55, sum,"Suma equivocada");
    }

    @Test
    void otroTest() {
        int sum;
        // Calculo sumatoria hasta 10
        sum = calcularSumatoria(11);
        
        assertEquals(66, sum,"Suma equivocada");
    }
}
