package com.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.app.dto.Producto;

@Service
public class ProductoService {
    
    @Autowired
    JdbcTemplate connection;

    public List<Producto> getAll(){
        String sql= "SELECT * FROM Productos";
        return connection.query(sql, RowMapperService.rmProducto());
    }
}
