package com.app.dto;

public record Movimiento(int id, int idProducto, String tipo, int cantidad, String fecha, String idUsuario) {
    
}
