/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Practica03;

import PaqueteLectura.GeneradorAleatorio;

/**
 *
 * @author Fabro
 */
public class Ejercicio03 {
    
    public static void main(String[] args) {
        
       Estante e = new Estante();
       int cantidad = GeneradorAleatorio.generarInt(10) + 10;
       
       for (int i = 0; i < cantidad; i++) {
           Libro l = new Libro();
           
           l.setAñoEdicion(GeneradorAleatorio.generarInt(2000)+1);
           l.setEditorial(GeneradorAleatorio.generarString(20));
           l.setISBN(GeneradorAleatorio.generarString(20));
           l.setPrecio(GeneradorAleatorio.generarDouble(500));
           
           Autor a = new Autor();
           a.setBiografia(GeneradorAleatorio.generarString(500));
           a.setOrigen(GeneradorAleatorio.generarString(20));
           a.setNombre(GeneradorAleatorio.generarString(50));
           
           l.setPrimerAutor(a);
           
           if (i == 12) {
               l.setTitulo("Mujercitas");
           } else {
               l.setTitulo(GeneradorAleatorio.generarString(20));
           }
           
           e.agregarLibro(l);
       }
       
       Libro l = e.buscarPorTitulo("Mujercitas");
       
       if (l != null) {
           System.out.println(l.getPrimerAutor().getNombre());
       } else {
           System.out.println("No se encontro el libro");
       }
    }
}
