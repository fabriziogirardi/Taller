/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Practica01;

import PaqueteLectura.GeneradorAleatorio;

/**
 *
 * @author Fabro
 */
public class Ejercicio01 {
    
    public static void main(String[] args) {
        
        GeneradorAleatorio.iniciar();
        
        int DF=11;  
        int [] tabla2 = new int[DF]; // indices de 0 a 10
        int i;
        for (i=0;i<DF;i++) 
            tabla2[i]=2*i;
        
        int num;
        while ((num = GeneradorAleatorio.generarInt(12)) != 11) {
            System.out.println("Para el numero " + num + " el valor de la tabla del 2 es: " + tabla2[num]);
        }
    }
    
}
