/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Practica03;

/**
 *
 * @author Fabro
 */
public class Autor {
    
    private String nombre;
    private String biografia;
    private String origen;
    
    // Crea el objeto vacio
    public Autor() {
        
    }
    
    // Crea el objeto con las 3 propiedades completadas
    public Autor(String nombre, String biografia, String origen) {
        this.nombre = nombre;
        this.biografia = biografia;
        this.origen = origen;
    }
    
    // Devuelve el nombre
    public String getNombre() {
        return this.nombre;
    }
    
    // Devuelve la biografia
    public String getBiografia() {
        return this.biografia;
    }
    
    // Devuelve el origen
    public String getOrigen() {
        return this.origen;
    }
    
    // Setea el nombre
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    // Setea la biografia
    public void setBiografia(String biografia) {
        this.biografia = biografia;
    }
    
    // Setea el origen
    public void setOrigen(String origen) {
        this.origen = origen;
    }
    
    // Devuelve el objeto como String
    public String toString() {
        return String.format("Mi nombre es %s, soy de %s y mi biografia es %s", this.nombre, this.origen, this.biografia);
    }
}
