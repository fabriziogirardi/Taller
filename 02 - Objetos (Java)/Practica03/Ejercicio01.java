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
public class Ejercicio01 {
    
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        
        double[] lados = new double[3];
        String colorRelleno = "Negro";
        String colorLineas = "Verde";
        
        for (int i = 0; i < 3; i++) {
            lados[i] = GeneradorAleatorio.generarDouble(20) + 1;
            System.out.println(String.format("El lado %d mide %f", i, lados[i]));
        }
        Triangulo triangulo = new Triangulo(lados, colorRelleno, colorLineas);
        
        System.out.println(String.format("La variable S vale %f", triangulo.getVariableS()));
        
        System.out.println(
            String.format("El area se calcula con raiz cuadrada de %f * %f * %f * %f",
                triangulo.getVariableS(),
                triangulo.getVariableS() - lados[0],
                triangulo.getVariableS() - lados[1],
                triangulo.getVariableS() - lados[2]
            )
        );
        
        System.out.println(triangulo.printPerimetro());
        System.out.println(triangulo.printArea());
    }
    
}
