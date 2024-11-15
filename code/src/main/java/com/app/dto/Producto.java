package com.app.dto;

public record Producto(int id, String nombre, String descrip, String categoria, double precio, String proveedor) {

    public Producto{
        if (precio < 0) { throw new IllegalArgumentException("El precio no puede ser negativo"); }
    }
    public Producto(int i, double p){
        this(i, "Hello", "World", "!", p, "t");
    }

}
