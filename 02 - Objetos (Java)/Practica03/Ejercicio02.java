/*
Demo que crea objetos Libro invocando a los constructores definidos. 
 */
package Practica03;

/**
 *
 * @author vsanz
 */
public class Ejercicio02 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Libro libro1= new  Libro( "Java: A Beginner's Guide",   
                                 "Mcgraw-Hill", 2014,   
                                 new Autor("Herbert Schildt", "una persona al pedo", "Argentina"), "978-0071809252", 21.72);
        Libro libro2= new Libro("Learning Java by Building Android Games",  
                              "CreateSpace Independent Publishing", 
                               new Autor("John Horton", "vendo cafe porque no se escribir buenos libros", "Colombia"), "978-1512108347");
        System.out.println(libro1.toString());
        System.out.println(libro2.toString());
        System.out.println("Precio del libro2: " +libro2.getPrecio());
        System.out.println("Anio edicion del libro2: " +libro2.getAñoEdicion());
        System.out.println(libro1.getPrimerAutor());
        Libro libro3= new Libro(); 
    }
    
}
