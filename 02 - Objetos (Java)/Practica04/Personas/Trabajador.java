/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Practica04.Personas;

import Practica02.Persona;

/**
 *
 * @author Fabro
 */
public class Trabajador extends Persona {
    
    private String tareaRealizada;

    public Trabajador(String unNombre, int unDNI, int unaEdad ,String tareaRealizada) {
        super(unNombre, unDNI, unaEdad);
        this.tareaRealizada = tareaRealizada;
    }

    public String getTareaRealizada() {
        return tareaRealizada;
    }

    @Override
    public String toString() {
        return String.format(super.toString() + " Soy %s", this.getTareaRealizada());
    }
}
