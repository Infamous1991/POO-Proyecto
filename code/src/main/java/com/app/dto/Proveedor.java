package com.app.dto;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public record Proveedor(int id, String nombre, String contacto, String direccion) implements RowMapper<Proveedor>{

    public Proveedor(){
        this(0, null, null, null);
    }
    @Override
    public Proveedor mapRow(ResultSet rs, int rowNum) throws SQLException {
        return new Proveedor(rs.getInt("ID"),
                             rs.getString("Nombre"),
                             rs.getString("Contacto"),
                             rs.getString("Dirección"));
    }
    
    
}
