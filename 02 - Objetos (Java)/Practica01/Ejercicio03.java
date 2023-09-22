/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Practica01;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

/**
 *
 * @author Fabro
 */
public class Ejercicio03 {
    
    public static void main(String[] args) {
        
        GeneradorAleatorio.iniciar();
        
        int tamañoMatrix = 5;
        int[][] matrix = new int[tamañoMatrix][tamañoMatrix];
        
        for (int i = 0; i < tamañoMatrix; i++) {
            for (int j = 0; j < tamañoMatrix; j++) {
                matrix[i][j] = GeneradorAleatorio.generarInt(31);
            }
        }
        
        for (int i = 0; i < tamañoMatrix; i++) {
            for (int j = 0; j < tamañoMatrix; j++) {
                System.out.print("[" + matrix[i][j] + "]");
            }
            System.out.println();
        }
        
        int sumaPrimeraFila = 0;
        
        for (int elem : matrix[0]) {
            sumaPrimeraFila += elem;
        }
        
        System.out.println("La suma de fila 1 es: " + sumaPrimeraFila);
        
        int[] vectorSumaColumnas = new int[tamañoMatrix];
        
        for (int i = 0; i < tamañoMatrix; i++) {
            for (int j = 0; j < tamañoMatrix; j++) {
                vectorSumaColumnas[i] += matrix[j][i];
            }
        }
        
        for (int i = 0; i < tamañoMatrix; i++) {
            System.out.println("La suma de la columna " + i + " es: " + vectorSumaColumnas[i]);
        }
        
        int numeroSolicitado;
        System.out.print("Ingrese un numero para buscar en la matriz: ");
        numeroSolicitado = Lector.leerInt();
        
        boolean encontrado = false;
        
        int fila = 0, columna = 0;
        while ((fila < tamañoMatrix) && !encontrado) {
            columna = 0;
            while ((columna < tamañoMatrix) && !encontrado) {
                if (matrix[fila][columna] == numeroSolicitado)
                    encontrado = true;
                
                columna++;
            }
            fila++;
        }
        
        if (encontrado)
            System.out.println("El numero buscado se encuentra en la fila " + (fila) + " y columna " + (columna));
        else
            System.out.println("No se encontro el elemento");
    }
}
