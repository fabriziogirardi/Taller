/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Practica03;

import PaqueteLectura.Lector;

/**
 *
 * @author Fabro
 */
public class Ejercicio05 {
    
    public static void main(String[] args) {
        double radio;
        String colorRelleno;
        String colorLinea;
        
        radio = Lector.leerDouble();
        colorRelleno = Lector.leerString();
        colorLinea = Lector.leerString();
        
        Circulo c = new Circulo(radio, colorRelleno, colorLinea);
        
        System.out.println(String.format("El perimetro es %.2f", c.calcularPerimetro()));
        System.out.println(String.format("El area es %.2f", c.calcularArea()));
    }
    
}
