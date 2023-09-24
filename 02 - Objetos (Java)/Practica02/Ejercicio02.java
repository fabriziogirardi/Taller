/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Practica02;

import PaqueteLectura.GeneradorAleatorio;

/**
 *
 * @author Fabro
 */
public class Ejercicio02 {
    
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        
        int maxPersonas = 15;
        int edadMayores = 65;
        Persona[] arrayPersonas = new Persona[maxPersonas];
        
        int i = 0;
        
        int edad = GeneradorAleatorio.generarInt(100);
        while((edad != 0) && (i < maxPersonas)) {
            String nombre = GeneradorAleatorio.generarString(20);
            int dni = GeneradorAleatorio.generarInt(999999999);
            
            arrayPersonas[i] = new Persona(nombre, dni, edad);
            i++;
            edad = GeneradorAleatorio.generarInt(100);
        }
        
        if (i != 0) {
            int cantidadMayores = 0;
            int menorDni = 999999999;
            int indiceMenorDni = -1;

            for (int j = 0; j < i; j++) {
                if (arrayPersonas[j].getEdad() >= 65) {
                    cantidadMayores++;
                }

                if (arrayPersonas[j].getDNI() < menorDni) {
                    menorDni = arrayPersonas[j].getDNI();
                    indiceMenorDni = j;
                }
            }

            System.out.println("La cantidad de personas mayores de " + edadMayores + " es: " + cantidadMayores);
            System.out.println("La representacion de la persona con menor DNI es: " + arrayPersonas[indiceMenorDni].toString());
        } else {
            System.out.println("El primer random salio 0, el vector quedo vacio. Tremenda mala suerte...");
        }
    }
}