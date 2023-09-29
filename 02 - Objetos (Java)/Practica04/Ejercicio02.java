/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Practica04;

import Practica04.Empleados.Entrenador;
import Practica04.Empleados.Jugador;

/**
 *
 * @author Fabro
 */
public class Ejercicio02 {
    
    public static void main(String[] args) {
        Jugador j = new Jugador("Pedro Lopez", 5623, 4, 23, 355);
        Entrenador e = new Entrenador("Juan Montoto", 23563, 1, 9);
        
        System.out.println(j);
        System.out.println(e);
    }
}
