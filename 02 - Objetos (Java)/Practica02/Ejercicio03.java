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
public class Ejercicio03 {
    public static void main(String[] args) {
        
        // Variables pertinentes a la matriz
        int maxDias = 5;
        int maxTurnos = 8;
        int maxInscriptos = maxDias * maxTurnos;
        
        Persona[][] agenda = new Persona[maxDias][maxTurnos];
        
        // Variables pertinentes al loop
        int inscriptos = 0;
        int turno;
        int dia;
        
        System.out.print("Ingrese el nombre: ");
        String nombre = Lector.leerString();
        int dni, edad;
        
        // Mientras no se haya llenado la capacidad, y el nombre sea distinto a ZZZ...
        while ((inscriptos < maxInscriptos) && !nombre.equals("ZZZ")) {
            // Genero DNI y edad para no perder tanto tiempo
            dni = GeneradorAleatorio.generarInt(999999999) + 1;
            edad = GeneradorAleatorio.generarInt(100) + 1;
            
            // Calculo la posición acorde a los inscriptos
            turno = inscriptos % maxTurnos;
            dia = (inscriptos - turno) / maxTurnos;
            
            // Ubico la posición y creo el objeto dentro de ella
            agenda[dia][turno] = new Persona(nombre, dni, edad);
            inscriptos++;
            
            // Leo el siguiente nombre
            System.out.print("Ingrese el nombre: ");
            nombre = Lector.leerString();
        }
        
        // Imprimo los resultados
        for (int i = 0; i < inscriptos; i++) {
            turno = i % maxTurnos;
            dia = (i - turno) / maxTurnos;
            
            System.out.println("Para el dia " + dia + " en el turno " + turno + " esta anotado: " + agenda[dia][turno].getNombre());
        }
    }
}