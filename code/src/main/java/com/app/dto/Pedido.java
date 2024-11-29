package com.app.dto;

import java.time.LocalDate;

//Recordar corregir las fechas finales
public record Pedido(int id, int usuarioId, String estado, String fechaInicio, String fechaFinal){
    public Pedido(int usuarioId){
        this(0, usuarioId, "en proceso", LocalDate.now().toString(), null);
    }
}
