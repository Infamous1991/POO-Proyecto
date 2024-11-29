package com.app.dto;

public record Usuario(int id, String nombre, String email, String telefono, String direccion) {
    public Usuario(){
        this(1, null, null, null,null);
    }
}
