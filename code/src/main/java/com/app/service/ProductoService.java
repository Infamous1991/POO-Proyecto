package com.app.service;

import com.app.dto.Producto;

public class ProductoService {

    //Este es solo una prueba, cambiar despues
    private static Producto[] test = {new Producto(1, 10.4), new Producto(2, 11.4), new Producto(3, 4.99)};

    public static Producto find(int id, int tp){
        for (Producto i : test){
            if (i.id() == id) { return i;}
        }
        throw new IllegalArgumentException("Id no encontrado");
    }
    //Fin de la prueba
}
