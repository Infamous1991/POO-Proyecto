package com.app.dto;

public record Producto(int id, String codigo, String descripcion, int precio, int proveedorId,
                       int categoriaId, int stock, int stockMin, int stockMax) {
    
}
