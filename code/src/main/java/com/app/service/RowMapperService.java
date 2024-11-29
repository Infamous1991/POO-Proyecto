package com.app.service;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import com.app.dto.Movimiento;
import com.app.dto.Pedido;
import com.app.dto.Producto;
import com.app.dto.Usuario;

@Service
public class RowMapperService {
    public static RowMapper<Movimiento> rmMovimiento(){
        return new RowMapper<Movimiento>() {
            @Override
            public Movimiento mapRow(ResultSet rs, int rowNum) throws SQLException {
                return new Movimiento(
                    rs.getInt("ID"),
                    rs.getInt("PedidoId"),
                    rs.getInt("ProductoId"),
                    rs.getInt("Cantidad"),
                    rs.getInt("Monto")
                );
            }
        };
    }
    public static RowMapper<Pedido> rmPedido(){
        return new RowMapper<Pedido>() {
            @Override
            public Pedido mapRow(ResultSet rs, int rowNum) throws SQLException {
                return new Pedido(
                    rs.getInt("ID"),
                    rs.getInt("UsuarioID"),
                    rs.getString("Estado"),
                    rs.getString("FechaInicio"),
                    rs.getString("FechaFinal")
                );
            }
        };
    }
    public static RowMapper<Usuario> rmUsuario(){
        return new RowMapper<Usuario>() {
            @Override
            public Usuario mapRow(ResultSet rs, int rowNum) throws SQLException {
                return new Usuario(
                    rs.getInt("ID"),
                    rs.getString("Nombre"),
                    rs.getString("Email"),
                    rs.getString("NumeroTelefono"),
                    rs.getString("Direccion")
                );
            }
        };
    }
    public static RowMapper<Producto> rmProducto(){
        return new RowMapper<Producto>() {
            @Override
            public Producto mapRow(ResultSet rs, int rowNum) throws SQLException {
                return new Producto(
                    rs.getInt("ID"),
                    rs.getString("Codigo"),
                    rs.getString("Descripcion"),
                    rs.getInt("Precio"),
                    rs.getInt("ProveedorId"),
                    rs.getInt("CategoriaId"),
                    rs.getInt("StockDisponible"),
                    rs.getInt("StockMinimo"),
                    rs.getInt("StockMaximo")
                );
            }
        };
    }
    
}
