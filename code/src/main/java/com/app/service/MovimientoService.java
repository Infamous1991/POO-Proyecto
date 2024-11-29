package com.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.app.dto.Movimiento;

@Service
public class MovimientoService {

    @Autowired
    JdbcTemplate connection;
    
    public List<Movimiento> getAll(){
        String sql = "SELECT  * FROM Movimientos";
        return connection.query(sql, RowMapperService.rmMovimiento());
    }
    public List<Movimiento> get(int id){
        String sql= "SELECT * FROM Movimientos WHERE PedidoId = ?";
        return connection.query(sql, RowMapperService.rmMovimiento(), id);
    }
}
