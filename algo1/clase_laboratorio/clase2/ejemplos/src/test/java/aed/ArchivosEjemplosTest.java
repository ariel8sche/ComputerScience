package aed;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintStream;
import java.util.Scanner;

import org.junit.jupiter.api.Test;

class ArchivosEjemplosTest {

    @Test
    void runCrearArchivos() throws Exception {

        File file = new File("target/myfile.txt");
        file.createNewFile();

        assertEquals("myfile.txt", file.getName());
        assertEquals(true, file.exists());

    }

    @Test
    void escribirEnArchivo() throws IOException {

        FileOutputStream outStream = new FileOutputStream("escribirEnArchivo.txt");
        byte[] bs = new byte[] { 'h', 'o', 'l', 'a', 10, 65 };
        outStream.write(bs);

        outStream.close();
    }

    @Test
    void leerDeArchivo() throws IOException {

        FileInputStream inStream = (new  FileInputStream("escribirEnArchivo.txt"));
        byte[] bs = inStream.readNBytes(6);

        byte[] expected = new byte[] { 'h', 'o', 'l', 'a', 10, 65 };

        for (int i = 0; i < expected.length; i++) {
            assertEquals(expected[i], bs[i]);
        }

        inStream.close();
    }

    @Test
    void escribirEnArchivoChar() throws IOException {

        FileWriter writer = new FileWriter("escribirEnArchivoChar.txt");
        writer.write("Hola como estás");

        writer.close();
    }

    @Test
    void escribirEnArchivoEnModoAppend() throws IOException {

        FileWriter writer = new FileWriter("escribirEnArchivoEnModoAppend.txt");
        writer.write("Hola,  ¿como estás?\n");
        writer.close();

        FileWriter writer2 = new FileWriter("escribirEnArchivoEnModoAppend.txt", true);
        writer2.write("Todo bien, ¿y vos?");

        writer2.close();
    }

    @Test
    void leerDeArchivoChar() throws IOException {

        FileReader reader = new FileReader("escribirEnArchivoChar.txt");

        char[] cbuf = new char[15];
        reader.read(cbuf, 0, 15);

        char[] expected = new char[] { 'H', 'o', 'l', 'a', ' ', 'c', 'o', 'm', 'o' };

        for (int i = 0; i < expected.length; i++) {
            assertEquals(expected[i], cbuf[i]);
        }

        reader.close();
    }

    @Test
    void escribirEnArchivoBuffered() throws IOException, InterruptedException {

        BufferedWriter writer = new BufferedWriter(new FileWriter("escribirEnArchivoBuffered.txt"), 50);
        writer.write("Hola como estás\n");
        writer.write("Yo bien, ¿y vos?");

        writer.flush();

        Thread.sleep(10000);

        writer.close();
    }

    @Test
    void leerDeArchivoBuffered() throws IOException, InterruptedException {

        BufferedReader reader = new BufferedReader(new FileReader("escribirEnArchivoBuffered.txt"), 50);
        String s = reader.readLine();

        assertEquals("Hola como estás", s);
        reader.close();
    }

    @Test
    void escribirNumerosReales() {
        try {
            PrintStream ps = new PrintStream("numerosReales.txt");

            double[] ds = new double[] { 1, 3.141516, 20.8, 70.5 };

            for (double d : ds) {
                ps.print(d);
                ps.print(" ");
            }

        } catch (FileNotFoundException ex) {
            assertTrue(false, "Error fatal!");
        }
    }

    @Test
    void leerNumerosReales() throws FileNotFoundException{
        Scanner scanner = new Scanner(new File("numerosReales.txt"));

        double[] ds = new double[] { 1.0,  };

        for (double d : ds) {
            assertEquals(d, scanner.nextDouble());
        }

    }

}
