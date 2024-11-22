package com.app.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.app.dto.Movimiento;

@Service
public class MovimientoService {

    @Autowired
    JdbcTemplate connection;
    
    public Movimiento buscar(int id){
        String sql = "SELECT  * FROM Movimientos.Movimientos WHERE ID = ?";
        return connection.queryForObject(sql, new Movimiento() ,id);
    }
}
