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
public class Ejercicio04 {
    
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        
        int pisos = 9, oficinas = 5;
        int[][] edificio = new int[pisos][oficinas];
        
/*        for (int i = 0; i < pisos; i++) {
            for (int j = 0; j < oficinas; j++) {
                edificio[i][j] = 0;
           }
        }
*/
        
        int leerPiso = GeneradorAleatorio.generarInt(pisos) + 1;
        int leerOficina;
        
        while (leerPiso != 9) {
            leerOficina = GeneradorAleatorio.generarInt(oficinas - 1) + 1;
            edificio[leerPiso][leerOficina]++;
            
            leerPiso = GeneradorAleatorio.generarInt(pisos) + 1;
        }
        
        for (int i = 1; i < pisos; i++) {
            System.out.println("Piso " + (i) + ":");
            
            for (int j = 1; j < oficinas; j++) {
                System.out.println("- Oficina " + (j) + ": " + edificio[i][j] + " personas.");
            }
            
            System.out.println("-------------------");
        }
    }
}
