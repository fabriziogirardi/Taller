/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Practica02;

import PaqueteLectura.*;

/**
 *
 * @author Fabro
 */
public class Ejercicio04 {
    public static void main(String[] args) {
        
        // Variables pertinentes a la matriz
        int maxDias = 5;
        int maxTurnos = 8;
        int maxInscriptos = maxDias * maxTurnos;
        
        // Matriz de personas y vector contador de turnos ocupados
        Persona[][] agenda = new Persona[maxDias][maxTurnos];
        int[] turnosOcupados = new int[maxDias];
        
        // Variables pertinentes al loop
        System.out.print("Ingrese el nombre: ");
        String nombre = Lector.leerString();
        int dni, edad;
        int diaSolicitado;
        int inscriptos = 0;
        
        // Mientras no se haya llenado la capacidad, y el nombre sea distinto a ZZZ...
        while ((inscriptos < maxInscriptos) && !nombre.equals("ZZZ")) {
            // Genero DNI y edad para no perder tanto tiempo
            dni = GeneradorAleatorio.generarInt(999999999) + 1;
            edad = GeneradorAleatorio.generarInt(100) + 1;
            
            
            // Solicito el dia que quiere la pesona
            System.out.print("Ingrese el dia deseado: ");
            diaSolicitado = Lector.leerInt();
            
            // Si el dia es menor a 0 o mayor igual a maxDias, no se puede anotar
            if (diaSolicitado < 0 || diaSolicitado >= maxDias) {
                System.out.println("El dia solicitado no esta en el rango de dias.");
            
            // Caso contrario
            } else {
                
                // Si hay lugar en ese dia, lo anoto. Sino, muestro error
                if (turnosOcupados[diaSolicitado] < maxTurnos){
                    agenda[diaSolicitado][turnosOcupados[diaSolicitado]++] = new Persona(nombre, dni, edad);
                    inscriptos++;
                } else {
                    System.out.println("No hay turnos disponibles para el dia seleccionado.");
                }
            }
            
            // Leo el siguiente nombre
            System.out.print("Ingrese el nombre: ");
            nombre = Lector.leerString();
        }
        
        // Muestro la cantidad de turnos anotados de cada día
        // y los nombres de la gente anotada.
        for (int i = 0; i < maxDias; i++) {
            System.out.println("Lancantidad de inscriptos al dia " + i + " es: " + turnosOcupados[i]);
            for (int j = 0; j < turnosOcupados[i]; j++) {
                System.out.println("Para el dia " + i + " en el turno " + j + " esta anotado: " + agenda[i][j].getNombre());
            }
        }
    }
}