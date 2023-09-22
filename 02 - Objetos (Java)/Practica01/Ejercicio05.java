/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Practica01;

import PaqueteLectura.Lector;

/**
 *
 * @author Fabro
 */
public class Ejercicio05 {
    
    public static void main(String[] args) {
        int clientes = 5;
        int aspectos = 4;
        int tmp;
        
        String[] aspectosTexto = new String[aspectos];
        
        aspectosTexto[0] = "Atencion al cliente";
        aspectosTexto[1] = "Calidad de la comida";
        aspectosTexto[2] = "Precio";
        aspectosTexto[3] = "Ambiente";
        
        int[][] encuesta = new int[clientes][aspectos];
        
        for (int i = 0; i < clientes; i++) {
            System.out.println("Puntajes del cliente " + (i+1) + ":");
            
            for (int j = 0; j < aspectos; j++) {
                System.out.print("- Aspecto \"" + aspectosTexto[j] + "\": ");
                tmp = Lector.leerInt();
                
                while ((tmp < 1) || (tmp > 10)) {
                    System.out.print("Error. El valor debe ser entre 1 y 10. Intente nuevamente: ");
                    tmp = Lector.leerInt();
                }
                
                encuesta[i][j] = tmp;
                tmp = -1;
            }
            
            System.out.println("--------------");
        }
        
        double[] promedios = new double[aspectos];
        
        for (int i = 0; i < aspectos; i++) {
            for (int j = 0; j < clientes; j++) {
                promedios[i] += encuesta[j][i];
            }
            
            promedios[i] /= clientes;
        }
        
        for (int i = 0; i < aspectos; i++) {
            System.out.println("El promedio en el aspecto \"" + aspectosTexto[i] + "\" es: " + promedios[i]);
        }
    }
    
}
