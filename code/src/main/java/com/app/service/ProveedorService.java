package com.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.app.dto.Proveedor;

@Service
public class ProveedorService {

    @Autowired
    JdbcTemplate connection;

    public List<Proveedor> getAll(){
        String sql= "SELECT * FROM Proveedores";
        return connection.query(sql, RowMapperService.rmProveedor());
    }
}
