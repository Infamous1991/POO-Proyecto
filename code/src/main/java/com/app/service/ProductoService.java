package com.app.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.app.dto.Producto;

@Service
public class ProductoService {

    @Autowired
    JdbcTemplate connection;

    public Producto buscar(int id){
        String sql = "SELECT  * FROM Productos WHERE ID = id";
        return connection.queryForObject(sql, new Producto() ,id);
    }
    public Producto agregar(Producto nuevo){
        String sql = """
            INSERT INTO Productos (ID, Código, Nombre, Descripción, Precio, StockActual, StockMinimo, CategoriaID, ProveedorID)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
            """;
        connection.update(sql, nuevo.id(), nuevo.codigo(), nuevo.nombre(), nuevo.descrip(), nuevo.precio(), 
                               nuevo.stock(), nuevo.stockMin(), nuevo.categoria(), nuevo.proveedor() );
        return nuevo;
    }
}
