package com.app.dto;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

/*
 * SE DEBE MODIFICAR EL NOMBRE LA COLUMNA 'FechaMovimiento' A 'FechaFinal'
 * Y AGREGAR LA COLUMNA 'Estado'
 */
public record Movimiento(int id, Pedido solicitud, String fechaFin, String estado) implements RowMapper<Movimiento>{
    
    public Movimiento(){
        this(0, null, null, null);
    }

    @Override
    public Movimiento mapRow(ResultSet rs, int rowNum) throws SQLException {
        return new Movimiento(rs.getInt("ID"),
                              new Pedido(0, 
                                          rs.getInt("ProductoID"),
                                          rs.getInt("UsuarioID"),
                                          rs.getString("TipoMovimiento"),
                                          rs.getInt("Cantidad"),
                                          rs.getString("FechaFinal")
                                          ),
                              rs.getString("FechaFinal"),
                              rs.getString("Estado"));
    }
}
