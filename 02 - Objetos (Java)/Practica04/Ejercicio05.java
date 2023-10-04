/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Practica04;

import Practica04.Figuras.Triangulo;
import Practica04.Figuras.Cuadrado;
import Practica04.Figuras.VisorFigurasModificado;

/**
 *
 * @author Fabro
 */
public class Ejercicio05 {
    
    public static void main(String[] args) {
        Cuadrado c1 = new Cuadrado(8, "Verde", "Rojo");
        Cuadrado c2 = new Cuadrado(12, "Celeste", "Amarillo");
        double[] lados = new double[3];
        
        lados[0] = 12;
        lados[1] = 16;
        lados[2] = 9;
        Triangulo t = new Triangulo(lados, "Naranja", "Negro");
        
        VisorFigurasModificado visor = new VisorFigurasModificado();
        
        visor.guardar(c1);
        visor.guardar(c2);
        visor.guardar(t);
        
        visor.mostrar();
    }
}
