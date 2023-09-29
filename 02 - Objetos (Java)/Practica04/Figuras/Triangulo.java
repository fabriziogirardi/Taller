/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Practica04.Figuras;

import javax.management.loading.ClassLoaderRepository;

/**
 *
 * @author Fabro
 */
public class Triangulo extends Figura {
    
    private int cantidadLados = 3;
    
    private double[] lados;

    public int getCantidadLados() {
        return cantidadLados;
    }

    public void setCantidadLados(int cantidadLados) {
        this.cantidadLados = cantidadLados;
    }

    public double[] getLados() {
        return lados;
    }

    public void setLados(double[] lados) {
        this.lados = lados;
    }
    
    public Triangulo(double[] lados, String colorRelleno, String colorLineas) {
        super(colorRelleno, colorLineas);
        this.lados = new double[cantidadLados];
        this.lados = lados;
    }

    // Calcula la variable S para uso interno
    public double getVariableS() {
        return ((this.lados[0] + this.lados[1] + this.lados[2]) / 2);
    }
    
    @Override
    public double calcularArea() {
        double s = this.getVariableS();
        return Math.sqrt(s * (s - lados[0]) * (s - lados[1]) * (s - lados[2]));
    }

    @Override
    public double calcularPerimetro() {
        return this.lados[0] + this.lados[1] + this.lados[2];
    }

    @Override
    public String toString() {
        String str = super.toString();
        str += " Lados: " + this.lados[0] +
                " - " + this.lados[1] +
                " - " + this.lados[2];
        return str;
    }
    
}
