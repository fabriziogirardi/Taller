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
public class Ejercicio02 {
    
    public static void main(String[] args) {
        int cantidadJugadores = 15;
        double[] alturaJugadores = new double[cantidadJugadores];
        double total = 0;
        
        for (int i = 0; i < cantidadJugadores; i++) {
            System.out.print("Ingrese la altura del jugador " + (i+1) + ": ");
            alturaJugadores[i] = Lector.leerDouble();
            total += alturaJugadores[i];
        }
        
        double promedio = total / cantidadJugadores;
        
        System.out.println("La altura promedio es: " + promedio);
        
        int encimaDelPromedio = 0;
        
        for (int i = 0; i < cantidadJugadores; i++) {
            if (alturaJugadores[i] > promedio) {
                encimaDelPromedio++;
            }
        }
        
        System.out.println("La cantidad de jugadores por encima del promedio es de: " + encimaDelPromedio);
    }
}
