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
public class Habitacion {
    
    private double costo;
    
    private boolean ocupada;
    
    private Persona persona;
    
    public Habitacion() {
        this.costo = GeneradorAleatorio.generarDouble(6000) + 2000;
    }
    
    public void setCliente(Persona p) {
        if (!this.ocupada) {
            this.persona = p;
            this.ocupada = true;
        }
    }
    
    public Persona getPersona() {
        return this.persona;
    }

    public double getCosto() {
        return costo;
    }
    
    public boolean getOcupada() {
        return this.ocupada;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }
    
}
