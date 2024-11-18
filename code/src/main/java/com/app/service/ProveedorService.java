package com.app.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.app.dto.Proveedor;

@Service
public class ProveedorService {
    
    @Autowired
    JdbcTemplate connection; 

    public Proveedor buscar(int id){
        String sql = "SELECT * FROM Proveedores WHERE ID=?";
        return connection.queryForObject(sql, new Proveedor(), id);
    }
    public Proveedor agregar(Proveedor nuevo){
        String sql = "INSERT INTO Proveedores (ID, Nombre, Contacto, Dirección) VALUES (?, ?, ?, ?)";
        connection.update(sql, nuevo.id() ,nuevo.nombre(), nuevo.contacto(), nuevo.direccion());
        return nuevo;
    }
}
