/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Practica04.Figuras;

/**
 *
 * @author Fabro
 */
public class VisorFigurasModificado {
    
    private int guardadas;
    private int capacidadMaxima = 5;
    private Figura[] vector;

    public VisorFigurasModificado() {
        this.guardadas = 0;
        this.vector = new Figura[capacidadMaxima];
    }
    
    public void guardar(Figura f) {
        if (this.quedaEspacio()) {
            this.vector[this.guardadas++] = f;
        }
    }
    
    public boolean quedaEspacio() {
        return this.guardadas < this.capacidadMaxima;
    }
    
    public void mostrar() {
        for (int i = 0; i < this.guardadas; i++) {
            System.out.println(vector[i]);
        }
    }
    
    public int getGuardadas() {
        return this.guardadas;
    }
}
