/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Practica03;

/**
 *
 * @author Fabro
 */
public class Estante {
    
    private int maxLibros = 20;
    private Libro[] libros;
    private int stock;
    
    public Estante() {
        this.libros = new Libro[this.maxLibros];
        this.stock = 0;
    }
    
    public boolean estanteLleno() {
        return this.stock == this.maxLibros;
    }
    
    public void agregarLibro(Libro l) {
        this.libros[stock] = l;
        this.stock++;
    }
    
    public Libro buscarPorTitulo(String t) {
        int i = 0;
        boolean frenar = i >= this.stock;
        boolean encontrado = false;
        Libro l;
        
        while (!frenar) {
            if (libros[i].getTitulo().equals(t)) {
                frenar = true;
                encontrado = true;
            } else {
                i++;
                frenar = i >= this.stock;
            }
        }
        
        return encontrado ? libros[i] : null;
    }
}
