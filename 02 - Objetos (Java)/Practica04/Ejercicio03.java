/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Practica04;

import PaqueteLectura.GeneradorAleatorio;
import Practica02.Persona;
import Practica04.Personas.Trabajador;

/**
 *
 * @author Fabro
 */
public class Ejercicio03 {
    
    public static void main(String[] args) {
        Persona persona = new Persona("Pablo", 35353535, 45);
        Trabajador trabajador = new Trabajador("Raul", 24242424, 28, "Pintor");
        
        System.out.println(persona);
        System.out.println(trabajador);
    }
    
}
