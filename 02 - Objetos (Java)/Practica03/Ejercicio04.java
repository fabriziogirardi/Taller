/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Practica03;

import PaqueteLectura.GeneradorAleatorio;
import Practica02.Persona;

/**
 *
 * @author Fabro
 */
public class Ejercicio04 {
    
    public static void main(String[] args) {
        Hotel hotel = new Hotel(35);
        
        int maximaOcupacion = GeneradorAleatorio.generarInt(10) + 20;
        
        for (int i = 0; i < maximaOcupacion; i++) {
            String nombre = GeneradorAleatorio.generarString(20);
            int edad = GeneradorAleatorio.generarInt(60) + 20;
            int dni = GeneradorAleatorio.generarInt(39999999) + 10000000;
            
            Persona p = new Persona(nombre, dni, edad);
            
            int habitacion = GeneradorAleatorio.generarInt(34) + 1;
            
            hotel.ingresarCliente(p, habitacion);
        }
        
        System.out.println(hotel);
        
        double aumento = GeneradorAleatorio.generarDouble(500);
        System.out.println(String.format("\n-----\nSe aumentaran en $%.2f los precios de todas las habitaciones\n-----\n", aumento));
        
        hotel.aumentarPrecios(aumento);
        
        System.out.println(hotel);
    }
}
