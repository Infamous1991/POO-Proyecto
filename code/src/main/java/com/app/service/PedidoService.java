package com.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.app.dto.Pedido;

@Service
public class PedidoService {
    
    @Autowired
    JdbcTemplate connection;

    public List<Pedido> getAll(){
        String sql= "SELECT * FROM Pedidos";
        return connection.query(sql, RowMapperService.rmPedido());
    }

    public Pedido get(int id){
        String sql="SELECT * FROM Pedidos WHERE ID = ?";
        return connection.queryForObject(sql, RowMapperService.rmPedido(), id);
    }

    public int nuevaOrden(int usuarioId){
        String sql= """
                INSERT INTO Pedidos (UsuarioID, Estado, FechaInicio, FechaFinal)
                VALUES(?, 'en proceso', GETDATE(), null)
                SELECT SCOPE_IDENTITY()
                """;
        return connection.queryForObject(sql, int.class, usuarioId);
    }
}
