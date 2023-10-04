/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Practica04.Empleados;

/**
 *
 * @author Fabro
 */
public class Entrenador extends Empleado{
    
    private int campeonatosGanados;

    public Entrenador(String nombre, double sueldo, int antiguedad, int campeonatosGanados) {
        super(nombre, sueldo, antiguedad);
        this.campeonatosGanados = campeonatosGanados;
    }

    public int getCampeonatosGanados() {
        return this.campeonatosGanados;
    }

    public void setCampeonatosGanados(int campeonatosGanados) {
        this.campeonatosGanados = campeonatosGanados;
    }

    @Override
    public double calcularEfectividad() {
        return (double) this.getCampeonatosGanados() / this.getAntiguedad();
    }

    @Override
    public double calcularSueldoACobrar() {
        double sueldoFinal = this.getSueldo() + (this.getSueldo() * ((double)this.getAntiguedad() / 100));
        
        if (this.getCampeonatosGanados() > 0) {
            if (this.getCampeonatosGanados() < 5) {
                sueldoFinal += 5000;
            } else if (this.getCampeonatosGanados() <= 10) {
                sueldoFinal += 30000;
            } else {
                sueldoFinal += 50000;
            }
        }
        
        return sueldoFinal;
    }
}
