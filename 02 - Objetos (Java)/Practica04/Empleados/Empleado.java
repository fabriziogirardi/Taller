/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Practica04.Empleados;

/**
 *
 * @author Fabro
 */
public abstract class Empleado {
    
    private String nombre;
    private double sueldo;
    private int antiguedad;

    public Empleado(String nombre, double sueldo, int antiguedad) {
        this.nombre = nombre;
        this.sueldo = sueldo;
        this.antiguedad = antiguedad;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getSueldo() {
        return sueldo;
    }

    public void setSueldo(double sueldo) {
        this.sueldo = sueldo;
    }

    public int getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }
    
    public abstract double calcularEfectividad();
    
    public abstract double calcularSueldoACobrar();

    @Override
    public String toString() {
        String str = "-----\nNombre: %s\nSueldo a cobrar: %.2f\nEfectividad: %.2f\n";
        
        return String.format(str, this.getNombre(), this.calcularSueldoACobrar(), this.calcularEfectividad());
    }
}
