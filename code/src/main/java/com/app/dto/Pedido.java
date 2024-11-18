package com.app.dto;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

/*
 * SE DEBE AGREGAR COLUMNA 'Tipo' EN LA TABLA DE PEDIDOS
 */

public record Pedido(int id, int idProducto, int idCliente, String tipo, int cantidad, String fecha) implements RowMapper<Pedido>{
    
    public Pedido(){
        this(0, 0, 0, null,  0, null);
    }
    
    @Override
    public Pedido mapRow(ResultSet rs, int rowNum) throws SQLException {
        return new Pedido(rs.getInt("ID"),
                             rs.getInt("ProductoID"),
                             rs.getInt("UsuarioID"),
                             rs.getString("Tipo"), 
                             rs.getInt("Cantidad"),
                             rs.getString("FechaPedido"));
    }
}   
