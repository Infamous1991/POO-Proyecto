package com.app.dto;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public record Producto(int id, String codigo, String nombre, String descrip, double precio, 
                       int stock, int stockMin, int categoria, int proveedor) implements RowMapper<Producto>{

    public Producto{
        if (precio < 0) { throw new IllegalArgumentException("El precio no puede ser negativo"); }
    }

    public Producto(){
        this(0, null, null, null, 0, 0, 0, 0, 0);
    }

    @Override
    public Producto mapRow(ResultSet rs, int rowNum) throws SQLException {
        return new Producto(rs.getInt("ID"),
                            rs.getString("Código"),
                            rs.getString("Nombre"),
                            rs.getString("Descripción"),
                            rs.getDouble("Precio"),
                            rs.getInt("StockActual"),
                            rs.getInt("StockMinimo"),
                            rs.getInt("CategoriaID"),
                            rs.getInt("ProveedorID"));
    }

}
