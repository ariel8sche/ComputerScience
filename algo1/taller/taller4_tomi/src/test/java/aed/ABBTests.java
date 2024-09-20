package aed;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

class ABBTests {

    @Test
    void nuevo_conjunto_vacio() {
        ABB<Integer> conjunto = new ABB<Integer>();

        assertEquals(0, conjunto.cardinal());
    }

    @Test
    void insertar_un_elemento() {
        ABB<Integer> conjunto = new ABB<Integer>();

        conjunto.insertar(42);

        assertEquals(1, conjunto.cardinal());
        assertEquals(true, conjunto.pertenece(42));
    }
    
    @Test
    void insertar_cinco_enteros() {
        ABB<Integer> conjunto = new ABB<Integer>();

        conjunto.insertar(2);
        assertEquals(1, conjunto.cardinal());
        conjunto.insertar(1);
        assertEquals(2, conjunto.cardinal());
        conjunto.insertar(3);
        assertEquals(3, conjunto.cardinal());
        conjunto.insertar(4);
        assertEquals(4, conjunto.cardinal());
        conjunto.insertar(4);
        assertEquals(4, conjunto.cardinal());

        assertEquals(true, conjunto.pertenece(4));
        assertEquals(false, conjunto.pertenece(5));
        assertEquals(true, conjunto.pertenece(1));
    }

    @Test
    void insertar__enteros() {
        ABB<Integer> conjunto = new ABB<Integer>();

        conjunto.insertar(10);
        assertEquals(1, conjunto.cardinal());
        conjunto.insertar(6);
        assertEquals(2, conjunto.cardinal());
        conjunto.insertar(9);
        assertEquals(3, conjunto.cardinal());
        conjunto.insertar(3);
        assertEquals(4, conjunto.cardinal());
        conjunto.insertar(8);
        assertEquals(5, conjunto.cardinal());
        conjunto.insertar(4);
        assertEquals(6, conjunto.cardinal());
        conjunto.insertar(1);
        assertEquals(7, conjunto.cardinal());
        conjunto.insertar(7);
        assertEquals(8, conjunto.cardinal());
        conjunto.insertar(5);
        assertEquals(9, conjunto.cardinal());
        conjunto.insertar(2);
        assertEquals(10, conjunto.cardinal());
        conjunto.insertar(13);
        assertEquals(11, conjunto.cardinal());
        conjunto.insertar(17);
        assertEquals(12, conjunto.cardinal());
        conjunto.insertar(11);
        assertEquals(13, conjunto.cardinal());
        conjunto.insertar(12);
        assertEquals(14, conjunto.cardinal());
        conjunto.insertar(19);
        assertEquals(15, conjunto.cardinal());
        conjunto.insertar(14);
        assertEquals(16, conjunto.cardinal());
        conjunto.insertar(16);
        assertEquals(17, conjunto.cardinal());
        conjunto.insertar(15);
        assertEquals(18, conjunto.cardinal());
        conjunto.insertar(18);
        assertEquals(19, conjunto.cardinal());
        conjunto.insertar(20);
        assertEquals(20, conjunto.cardinal());

        assertEquals(true, conjunto.pertenece(1));
        assertEquals(true, conjunto.pertenece(5));
        assertEquals(true, conjunto.pertenece(10));
        assertEquals(true, conjunto.pertenece(15));
    }

    @Test
    void stress_primera_parte() {
        ABB<Integer> conjunto = new ABB<Integer>();

        conjunto.insertar(1);
        assertEquals(1, conjunto.cardinal());
        conjunto.insertar(-98);
        assertEquals(2, conjunto.cardinal());
        conjunto.insertar(-195);
        assertEquals(3, conjunto.cardinal());
        conjunto.insertar(-290);
        assertEquals(4, conjunto.cardinal());
        conjunto.insertar(-383);
        assertEquals(5, conjunto.cardinal());
        conjunto.insertar(-474);
        assertEquals(6, conjunto.cardinal());
        conjunto.insertar(-563);
        assertEquals(7, conjunto.cardinal());
        conjunto.insertar(-650);
        assertEquals(8, conjunto.cardinal());
        conjunto.insertar(-735);
        assertEquals(9, conjunto.cardinal());
        conjunto.insertar(-818);
        assertEquals(10, conjunto.cardinal());
        conjunto.insertar(-899);
        assertEquals(11, conjunto.cardinal());
        conjunto.insertar(-978);
        assertEquals(12, conjunto.cardinal());
        conjunto.insertar(-1055);
        assertEquals(13, conjunto.cardinal());
        conjunto.insertar(-1130);
        assertEquals(14, conjunto.cardinal());

        assertEquals(true, conjunto.pertenece(1));
        assertEquals(true, conjunto.pertenece(-98));
        assertEquals(false, conjunto.pertenece(-50));
        assertEquals(true, conjunto.pertenece(-195));
        assertEquals(true, conjunto.pertenece(-290));
        assertEquals(true, conjunto.pertenece(-383));
        assertEquals(true, conjunto.pertenece(-474));
        assertEquals(true, conjunto.pertenece(-563));
        assertEquals(true, conjunto.pertenece(-650));
        assertEquals(true, conjunto.pertenece(-735));
        assertEquals(true, conjunto.pertenece(-818));
        assertEquals(true, conjunto.pertenece(-899));
        assertEquals(true, conjunto.pertenece(-978));
        assertEquals(true, conjunto.pertenece(-1055));
        assertEquals(true, conjunto.pertenece(-1130));
        
        assertEquals(14, conjunto.cardinal());
    }

    @Test
    void stress_segunda_parte() {
        ABB<Integer> conjunto = new ABB<Integer>();

        conjunto.insertar(1);
        assertEquals(1, conjunto.cardinal());
        conjunto.insertar(-98);
        assertEquals(2, conjunto.cardinal());
        conjunto.insertar(-195);
        assertEquals(3, conjunto.cardinal());
        conjunto.insertar(-290);
        assertEquals(4, conjunto.cardinal());
        conjunto.insertar(-383);
        assertEquals(5, conjunto.cardinal());
        conjunto.insertar(-474);
        assertEquals(6, conjunto.cardinal());
        conjunto.insertar(-563);
        assertEquals(7, conjunto.cardinal());
        conjunto.insertar(-650);
        assertEquals(8, conjunto.cardinal());
        conjunto.insertar(-735);
        assertEquals(9, conjunto.cardinal());
        conjunto.insertar(-818);
        assertEquals(10, conjunto.cardinal());
        conjunto.insertar(-899);
        assertEquals(11, conjunto.cardinal());
        conjunto.insertar(-978);
        assertEquals(12, conjunto.cardinal());
        conjunto.insertar(-1055);
        assertEquals(13, conjunto.cardinal());
        conjunto.insertar(-1130);
        assertEquals(14, conjunto.cardinal());

        assertEquals(true, conjunto.pertenece(1));
        assertEquals(true, conjunto.pertenece(-98));
        assertEquals(false, conjunto.pertenece(-50));
        assertEquals(true, conjunto.pertenece(-195));
        assertEquals(true, conjunto.pertenece(-290));
        assertEquals(true, conjunto.pertenece(-383));
        assertEquals(true, conjunto.pertenece(-474));
        assertEquals(true, conjunto.pertenece(-563));
        assertEquals(true, conjunto.pertenece(-650));
        assertEquals(true, conjunto.pertenece(-735));
        assertEquals(true, conjunto.pertenece(-818));
        assertEquals(true, conjunto.pertenece(-899));
        assertEquals(true, conjunto.pertenece(-978));
        assertEquals(true, conjunto.pertenece(-1055));
        assertEquals(true, conjunto.pertenece(-1130));
        
        assertEquals(14, conjunto.cardinal());

        conjunto.insertar(1);
        assertEquals(14, conjunto.cardinal());
        conjunto.insertar(-98);
        assertEquals(14, conjunto.cardinal());
        conjunto.insertar(-195);
        //ssertEquals(14, conjunto.cardinal());
        //conjunto.insertar(-290);
        assertEquals(14, conjunto.cardinal());
        conjunto.insertar(-383);
        assertEquals(14, conjunto.cardinal());
        conjunto.insertar(-474);
        assertEquals(14, conjunto.cardinal());
        conjunto.insertar(-563);
        assertEquals(14, conjunto.cardinal());
        conjunto.insertar(-650);
        assertEquals(14, conjunto.cardinal());
        conjunto.insertar(-735);
        assertEquals(14, conjunto.cardinal());
        conjunto.insertar(-818);
        assertEquals(14, conjunto.cardinal());
        conjunto.insertar(-899);
        assertEquals(14, conjunto.cardinal());
        conjunto.insertar(-978);
        assertEquals(14, conjunto.cardinal());
        conjunto.insertar(-1055);
        assertEquals(14, conjunto.cardinal());
        conjunto.insertar(-1130);
        assertEquals(14, conjunto.cardinal());

        assertEquals(14, conjunto.cardinal());

    }

    @Test
    void insertar_cinco_nombres() {
        ABB<String> conjunto = new ABB<String>();
        
        // Todos los tipos de datos "Comparables" tienen el método compareTo()
        assertEquals(true, "Jujuy".compareTo("La Pampa") < 0 );
        assertEquals(true, "Jujuy".compareTo("Chubut") > 0 );

        conjunto.insertar("La Pampa");
        assertEquals(1, conjunto.cardinal());
        assertEquals("La Pampa", conjunto.minimo());
        assertEquals("La Pampa", conjunto.maximo());

        conjunto.insertar("Chubut");
        assertEquals(2, conjunto.cardinal());
        assertEquals("Chubut", conjunto.minimo());
        assertEquals("La Pampa", conjunto.maximo());
        
        conjunto.insertar("Formosa");
        assertEquals(3, conjunto.cardinal());
        assertEquals("Chubut", conjunto.minimo());
        assertEquals("La Pampa", conjunto.maximo());

        conjunto.insertar("Catamarca");
        assertEquals(4, conjunto.cardinal());
        assertEquals("Catamarca", conjunto.minimo());
        assertEquals("La Pampa", conjunto.maximo());

        conjunto.insertar("Jujuy");
        assertEquals(5, conjunto.cardinal());
        assertEquals("Catamarca", conjunto.minimo());
        assertEquals("La Pampa", conjunto.maximo());

        assertEquals(true, conjunto.pertenece("Catamarca"));
        assertEquals(false, conjunto.pertenece("Buenos Aires"));
        assertEquals(true, conjunto.pertenece("Jujuy"));
    }

    @Test
    void eliminar_elemento_con_un_descendiente() {
        ABB<Integer> conjunto = new ABB<Integer>();
        
        conjunto.insertar(5);
        conjunto.insertar(6);
        conjunto.insertar(7);
        conjunto.eliminar(6);
        assertEquals(2, conjunto.cardinal());
        assertEquals(5, conjunto.minimo());
        assertEquals(7, conjunto.maximo());        
    }

    
    @Test
    void eliminar_elemento_con_dos_descendientes() {
        ABB<Integer> conjunto = new ABB<Integer>();
        
        conjunto.insertar(5);
        conjunto.insertar(4);
        conjunto.insertar(7);
        conjunto.insertar(6);
        conjunto.insertar(8);
        conjunto.eliminar(7);
        assertEquals(4, conjunto.cardinal());
        assertEquals(4, conjunto.minimo());
        assertEquals(8, conjunto.maximo());        
    
    }

    @Test
    void eliminar_raiz() {
        ABB<Integer> conjunto = new ABB<Integer>();
        
        conjunto.insertar(5);
        conjunto.insertar(4);
        conjunto.insertar(7);
        conjunto.insertar(6);
        conjunto.insertar(8);
        conjunto.eliminar(5);
        assertEquals(4, conjunto.cardinal());
        assertEquals(4, conjunto.minimo());
        assertEquals(8, conjunto.maximo());        
    
    }

    @Test
    void eliminar_elemento_con_doble_descendencia() {
        ABB<Integer> conjunto = new ABB<Integer>();
        
        conjunto.insertar(5);
        conjunto.insertar(4);
        conjunto.insertar(20);
        conjunto.insertar(15);
        conjunto.insertar(12);
        conjunto.insertar(16);
        conjunto.insertar(24);
        conjunto.insertar(22);
        conjunto.insertar(25);
        conjunto.eliminar(20);
        assertEquals(8, conjunto.cardinal());
        assertEquals(4, conjunto.minimo());
        assertEquals(25, conjunto.maximo());
    }

    @Test
    void eliminar_elemento_con_sucesor_arriba() {
        ABB<Integer> conjunto = new ABB<Integer>();
        
        conjunto.insertar(5);
        conjunto.insertar(4);
        conjunto.insertar(20);
        conjunto.insertar(15);
        conjunto.insertar(12);
        conjunto.insertar(24);
        conjunto.insertar(22);
        conjunto.insertar(25);
        conjunto.insertar(19);
        conjunto.insertar(21);
        conjunto.eliminar(20);
        assertEquals(9, conjunto.cardinal());
        assertEquals(4, conjunto.minimo());
        assertEquals(25, conjunto.maximo());
        assertEquals("{4,5,12,15,19,21,22,24,25}", conjunto.toString());
    }

    @Test
    void siguiente_inorder() {
        ABB<Integer> conjunto = new ABB<Integer>();

        conjunto.insertar(5);
        conjunto.insertar(4);
        conjunto.insertar(20);
        conjunto.insertar(15);
        conjunto.insertar(12);
        conjunto.insertar(16);
        conjunto.insertar(24);
        conjunto.insertar(22);
        conjunto.insertar(25);

        Iterador<Integer> iterador = conjunto.iterador();
        assertEquals(4, iterador.siguiente());
        assertEquals(5, iterador.siguiente());
        assertEquals(12, iterador.siguiente());
        assertEquals(15, iterador.siguiente());
        assertEquals(16, iterador.siguiente());
        assertEquals(20, iterador.siguiente());
        assertEquals(22, iterador.siguiente());
        assertEquals(24, iterador.siguiente());
        assertEquals(25, iterador.siguiente());
        
    }

    @Test
    void testToString() {
        ABB<Integer> c = new ABB<Integer>();
        c.insertar(5);
        c.insertar(4);
        c.insertar(7);
        c.insertar(6);
        c.insertar(8);
        assertEquals("{4,5,6,7,8}", c.toString());
        c.eliminar(5);
        c.eliminar(7);
        assertEquals("{4,6,8}", c.toString());

    }

    Integer NCLAVES = 1000; 

    private Integer clave(Integer i) {        
        return NCLAVES * ((i * i - 100 * i) % NCLAVES) + i;
    }

    @Test
    void stress() {

        ABB<Integer> conjunto = new ABB<Integer>();
        
        // Insertar
        for (Integer i = 0; i < NCLAVES; i++ ){
            Integer k = clave(i);
            assertEquals(i, conjunto.cardinal());
            assertEquals(false, conjunto.pertenece(k));
            conjunto.insertar(k);
            assertEquals(true, conjunto.pertenece(k));
        }
        assertEquals(NCLAVES, conjunto.cardinal());
    
        // Insertar de nuevo
        for (Integer i = 0; i < NCLAVES; i++) {
            Integer k = clave(i);
            conjunto.insertar(k);
            assertEquals(true,conjunto.pertenece(k));
         }

        // Eliminar los valores para i par
        for (Integer i = 0; i < NCLAVES; i++) {
            Integer k = clave(i);
            assertEquals(true, conjunto.pertenece(k));
            if (i % 2 == 0) {
                conjunto.eliminar(k);
                assertEquals(false, conjunto.pertenece(k));
            }
        }
        assertEquals(NCLAVES / 2, conjunto.cardinal());
        
        // Eliminar los valores para i impar
        for (Integer i = 0; i < NCLAVES; i++) {
            Integer k = clave(i);
            if (i % 2 == 0) {
                assertEquals(false,conjunto.pertenece(k));
            } else {
                assertEquals(true, conjunto.pertenece(k));
                conjunto.eliminar(k);
                assertEquals(false,conjunto.pertenece(k));
            }
        }
        assertEquals(0, conjunto.cardinal());

        // Verificar que no haya valores
        for (Integer i = 0; i < NCLAVES; i++) {
            Integer k = clave(i);
            assertEquals(false, conjunto.pertenece(k));
        }

    }


}
