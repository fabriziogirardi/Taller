/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Practica03;

/**
 *
 * @author Fabro
 */
public class Triangulo {
    
    double[] lados = new double[3];
    String colorRelleno;
    String colorLineas;
    
    // Constructor vacío
    public Triangulo(){
        
    }
    
    // Constructor para lados que vienen en array
    public Triangulo(double[] lados, String colorRelleno, String colorLineas) {
        this.verificarLados(lados);
        this.lados = lados;
        this.colorRelleno = colorRelleno;
        this.colorLineas = colorLineas;
    }
    
    // Constructor para lados que vienen por separado en distintos parámetros
    public Triangulo(double lado0, double lado1, double lado2, String colorRelleno, String colorLineas) {
        this.verificarLados(lado0, lado1, lado2);
        this.lados[0] = lado0;
        this.lados[1] = lado1;
        this.lados[2] = lado2;
        this.colorRelleno = colorRelleno;
        this.colorLineas = colorLineas;
    }
    
    // Método para verificar la integridad del array "lados"
    private void verificarLados(double[] lados) {
        // Si el array de lados, no es de 3 lados, tirar una excepción.
        if (lados.length != 3) {
            String error = new String("Un triangulo debe tener 3 lados en lugar de %d lados.");
            throw new IllegalArgumentException(String.format(error, lados.length));
        }
        
        this.verificarLado(lados[0]);
        this.verificarLado(lados[1]);
        this.verificarLado(lados[2]);
    }
    
    // Método para verificar la integridad del array "lados"
    private void verificarLados(double lado0, double lado1, double lado2) {
        this.verificarLado(lado0);
        this.verificarLado(lado1);
        this.verificarLado(lado2);
    }
    
    // Método para verificar un lado solo. Debe ser positivo distinto de 0
    private void verificarLado(double lado) {
        if (lado == 0) {
            String error = new String("Un triangulo no puede tener un lado de longitud 0.");
            throw new IllegalArgumentException(error);
        } else if (lado < 0) {
            String error = new String("Un triangulo no puede tener un lado de longitud negativa.");
            throw new IllegalArgumentException(error);
        }
    }
    
    // Obtiene el array de lados
    public double[] getLados() {
        return this.lados;
    }
    
    // Obtiene un lado por su índice
    public double getLado(int index) {
        if (index >= 0 && index <= 2) {
            return this.lados[index];
        } else {
            String error = new String ("No se puede obtener el lado %d del triangulo.");
            throw new IllegalArgumentException(String.format(error, index));
        }
    }
    
    // Obtiene el color de relleno
    public String getColorRelleno() {
        return this.colorRelleno;
    }
    
    // Obtiene el color de lineas
    public String getColorLineas() {
        return this.colorLineas;
    }
    
    // Setea los lados desde un array
    public void setLados(double[] lados) {
        this.verificarLados(lados);
        this.lados = lados;
    }
    
    // Setea el color de relleno
    public void setColorRelleno(String colorRelleno) {
        this.colorRelleno = colorRelleno;
    }
    
    // Setea el color de las lineas (borde)
    public void setColorLineas(String colorLineas) {
        this.colorLineas = colorLineas;
    }
    
    // Obtiene la longitud del perímetro
    public double getPerimetro() {
        return this.lados[0] + this.lados[1] + this.lados[2];
    }
    
    // Devuelve la string para informar el perimetro
    public String printPerimetro() {
        return "El perimetro del triangulo es: " + this.getPerimetro();
    }
    
    // Calcula la variable S para uso interno
    public double getVariableS() {
        return ((this.lados[0] + this.lados[1] + this.lados[2]) / 2);
    }
    
    // Obtiene el área del triángulo
    public double getArea() {
        double s = this.getVariableS();
        return Math.sqrt(s * (s - lados[0]) * (s - lados[1]) * (s - lados[2]));
    }
    
    // Devuelve el string para informar el área
    public String printArea() {
        return "El area del triangulo es: " + this.getArea();
    }
}
