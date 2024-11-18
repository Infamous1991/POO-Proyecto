package com.app.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.app.dto.Pedido;

@Service
public class PedidoService {

    @Autowired
    JdbcTemplate connection;
    @Autowired
    MovimientoService mov;

    public Pedido buscar(int id){
        String sql = "SELECT  * FROM Pedidos WHERE ID = ?";
        return connection.queryForObject(sql, new Pedido() ,id);
    }
    public Pedido agregar(Pedido nuevo){
        String sql = "INSERT INTO Pedidos (ID, ProductoID, UsuarioID, Tipo, Cantidad, FechaPedido) VALUES (?, ?, ?, ?, ?, ?)";
        connection.update(sql, nuevo.id(), nuevo.idProducto(), nuevo.idCliente(), nuevo.tipo(), nuevo.cantidad(), nuevo.fecha());
        mov.agregar(nuevo);
        return nuevo;
    }
}
