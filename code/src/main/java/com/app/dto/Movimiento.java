package com.app.dto;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

/*
 * SE DEBE MODIFICAR EL NOMBRE LA COLUMNA 'FechaMovimiento' A 'FechaFinal'
 * Y AGREGAR LA COLUMNA 'Estado'
 */
public record Movimiento(int id, int productoId, String tMove, int cantidad, String fFecha, int usuarioId, String estado) implements RowMapper<Movimiento>{
    public Movimiento(){
        this(0, 0, null, 0, null, 0, null);
    }
    @Override
    public Movimiento mapRow(ResultSet rs, int rowNum) throws SQLException {
        return new Movimiento(
            rs.getInt(1),
            rs.getInt(2),
            rs.getString(3),
            rs.getInt(4),
            rs.getString(5),
            rs.getInt(6),
            rs.getString(7)
        );
    }

}
