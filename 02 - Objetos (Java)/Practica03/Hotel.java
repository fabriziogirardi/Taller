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
public class Hotel {

    int cantidadHabitaciones;
    
    Habitacion[] habitaciones;
    
    public Hotel(int cantidadHabitaciones) {
        this.cantidadHabitaciones = cantidadHabitaciones;
        this.habitaciones = new Habitacion[cantidadHabitaciones];
        this.inicializarHabitaciones();
    }

    private void inicializarHabitaciones() {
        for (int i = 0; i < this.cantidadHabitaciones; i++) {
            habitaciones[i] = new Habitacion();
        }
    }
    
    public void ingresarCliente(Persona p, int i) {
        this.habitaciones[i-1].setCliente(p);
    }
    
    public void aumentarPrecios(double p) {
        for (int i = 0; i < this.cantidadHabitaciones; i++) {
            this.habitaciones[i].setCosto(this.habitaciones[i].getCosto() + p);
        }
    }

    @Override
    public String toString() {
        StringBuilder res = new StringBuilder();
        
        res.append("El detalle del hotel es el siguiente:");
        for (int i = 0; i < this.cantidadHabitaciones; i++) {
            boolean ocupada = this.habitaciones[i].getOcupada();
            
            res.append(String.format("\n - Habitacion %d: $%.2f %s", i+1, this.habitaciones[i].getCosto(), ocupada ? "ocupada" : "libre"));
            
            if (ocupada) {
                res.append(String.format(", %s", this.habitaciones[i].getPersona()));
            }
        }
        
        return res.toString();
    }
}