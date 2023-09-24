/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Practica02;

import PaqueteLectura.Lector;

/**
 *
 * @author Fabro
 */
public class Ejercicio01 {
    
    public static void main(String[] args) {
        
        System.out.print("Ingrese el nombre: ");
        String nombre = Lector.leerString();
        System.out.print("Ingrese el documento: ");
        int dni = Lector.leerInt();
        System.out.print("Ingrese la edad: ");
        int edad = Lector.leerInt();
        
        Persona p = new Persona(nombre, dni, edad);
        
        System.out.print(p.toString());
    }
}