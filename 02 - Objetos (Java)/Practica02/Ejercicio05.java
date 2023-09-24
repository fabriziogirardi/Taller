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
public class Ejercicio05 {
    public static void main(String[] args) {
        int maxPartidos = 20;
        Partido[] partidos = new Partido[maxPartidos];
        
        System.out.print("Ingrese el equipo visitante: ");
        String equipoVisitante = Lector.leerString();
        String equipoLocal;
        int golesVisitante, golesLocal;
        
        int partidosCargados = 0;
        
        while (partidosCargados < maxPartidos && !equipoVisitante.equals("ZZZ")) {
            System.out.print("Ingrese el equipo local: ");
            equipoLocal = Lector.leerString();
            
            golesVisitante = GeneradorAleatorio.generarInt(10);
            golesLocal = GeneradorAleatorio.generarInt(10);
            
            partidos[partidosCargados++] = new Partido(equipoLocal, equipoVisitante, golesLocal, golesVisitante);
        }
        
        String informePartido;
        int partidosGanadosPorRiver = 0;
        int cantidadGolesBocaComoLocal = 0;
        
        for (int i = 0; i < partidosCargados; i++) {
            informePartido = partidos[i].getLocal() + " " + partidos[i].getGolesLocal();
            informePartido += " VS ";
            informePartido +=  partidos[i].getVisitante() + " " + partidos[i].getGolesVisitante();
            
            if (partidos[i].getGanador().equals("River"))
                partidosGanadosPorRiver++;
            
            if (partidos[i].getLocal().equals("Boca"))
                cantidadGolesBocaComoLocal += partidos[i].getGolesLocal();
            
            System.out.println(informePartido);
        }
        
        System.out.println("La cantidad de partidos ganados por River es: " + partidosGanadosPorRiver);
        System.out.println("La cantidad de goles como local de Boca es: " + cantidadGolesBocaComoLocal);
    }
}
