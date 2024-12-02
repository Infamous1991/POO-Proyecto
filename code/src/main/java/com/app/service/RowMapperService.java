package com.app.service;

import java.sql.ResultSet;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import com.app.dto.Movimiento;
import com.app.dto.Pedido;
import com.app.dto.Producto;
import com.app.dto.Proveedor;
import com.app.dto.Usuario;

@Service
@SuppressWarnings("unused")
public class RowMapperService {
    public static RowMapper<Movimiento> rmMovimiento(){
        return (ResultSet rs, int rowNum) -> new Movimiento(
            rs.getInt("ID"),
            rs.getInt("PedidoId"),
            rs.getInt("ProductoId"),
            rs.getInt("Cantidad"),
            rs.getInt("Monto")
    );
    }
    public static RowMapper<Pedido> rmPedido(){
        return (ResultSet rs, int rowNum) -> new Pedido(
            rs.getInt("ID"),
            rs.getInt("UsuarioID"),
            rs.getString("Estado"),
            rs.getString("FechaInicio"),
            rs.getString("FechaFinal")
        );
    }
    public static RowMapper<Usuario> rmUsuario(){
        return (ResultSet rs, int rowNum) -> new Usuario(
            rs.getInt("ID"),
            rs.getString("Nombre"),
            rs.getString("Email"),
            rs.getString("NumeroTelefono"),
            rs.getString("Direccion")
        );
    }
    public static RowMapper<Producto> rmProducto(){
        return (ResultSet rs, int rowNum) -> new Producto(
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
    public static RowMapper<Proveedor> rmProveedor(){
        return (ResultSet rs, int rowNum) -> new Proveedor(
            rs.getInt("ID"),
            rs.getString("Nombre"),
            rs.getString("Contacto"),
            rs.getString("Email"),
            rs.getString("Telefono")
        );
    }
    
}
