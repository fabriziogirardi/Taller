/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Practica04.Empleados;

/**
 *
 * @author Fabro
 */
public class Jugador extends Empleado {
    
    private int partidosJugados;
    private int golesAnotados;

    public Jugador(String nombre, double sueldo, int antiguedad, int partidosJugados, int golesAnotados) {
        super(nombre, sueldo, antiguedad);
        this.partidosJugados = partidosJugados;
        this.golesAnotados = golesAnotados;
    }

    public int getPartidosJugados() {
        return partidosJugados;
    }

    public void setPartidosJugados(int partidosJugados) {
        this.partidosJugados = partidosJugados;
    }

    public int getGolesAnotados() {
        return golesAnotados;
    }

    public void setGolesAnotados(int golesAnotados) {
        this.golesAnotados = golesAnotados;
    }
    
    @Override
    public double calcularEfectividad() {
        return (double) this.golesAnotados / this.partidosJugados;
    }

    @Override
    public double calcularSueldoACobrar() {
        double sueldoFinal = this.getSueldo() + (this.getSueldo() * ((double)this.getAntiguedad() / 100));
        
        if (this.calcularEfectividad() > 0.5) {
            sueldoFinal += this.getSueldo();
        }
        
        return sueldoFinal;
    }
}
