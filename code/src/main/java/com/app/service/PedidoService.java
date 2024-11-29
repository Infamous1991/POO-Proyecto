package com.app.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.app.dto.Pedido;

@Service
public class PedidoService {
    
    @Autowired
    JdbcTemplate connection;

    public Pedido get(int id){
        String sql="SELECT * FROM Pedidos WHERE ID = ?";
        return connection.queryForObject(sql, RowMapperService.rmPedido(), id);
    }
}
