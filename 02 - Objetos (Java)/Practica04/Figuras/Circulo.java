/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Practica04.Figuras;

/**
 *
 * @author Fabro
 */
public class Circulo extends Figura {

    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }
    
    private double radio;

    public Circulo(double radio, String colorRelleno, String colorLinea) {
        super(colorRelleno, colorLinea);
        this.radio = radio;
    }

    @Override
    public double calcularArea() {
        return Math.PI * this.radio * this.radio;
    }

    @Override
    public double calcularPerimetro() {
        return 2 * Math.PI * this.radio;
    }

    @Override
    public String toString() {
        String str = super.toString();
        
        str += " Radio: " + this.radio;
        return str;
    }
    
}
