/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Practica04;

import Practica04.Figuras.Circulo;
import Practica04.Figuras.Triangulo;
import PaqueteLectura.GeneradorAleatorio;

/**
 *
 * @author Fabro
 */
public class Ejercicio01 {
    
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        
        String colorRelleno = "Verde";
        String colorLinea = "Marron";
        
        double[] lados = new double[3];
        lados[0] = GeneradorAleatorio.generarDouble(20) + 10;
        lados[1] = GeneradorAleatorio.generarDouble(20) + 10;
        lados[2] = GeneradorAleatorio.generarDouble(20) + 10;
        
        double radio = GeneradorAleatorio.generarDouble(20) + 10;
        
        Triangulo triangulo = new Triangulo(lados, colorRelleno, colorLinea);
        Circulo circulo = new Circulo(radio, colorRelleno, colorLinea);
        
        System.out.println(triangulo.toString());
        System.out.println(circulo.toString());
        
        triangulo.despintar();
        circulo.despintar();
        
        System.out.println(triangulo.toString());
        System.out.println(circulo.toString());
    }
}
