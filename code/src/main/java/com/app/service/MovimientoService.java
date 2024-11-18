package com.app.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.app.dto.Movimiento;
import com.app.dto.Pedido;

@Service
public class MovimientoService {

    @Autowired
    JdbcTemplate connection;
    
    public Movimiento buscar(int id){
        String sql = "SELECT  * FROM Movimientos WHERE ID = ?";
        return connection.queryForObject(sql, new Movimiento() ,id);
    }

    public Movimiento agregar(Pedido nuevo){
        Movimiento mov = new Movimiento(0, nuevo, null, "En Proceso");

        String sql = "INSERT INTO Movimientos (ID, ProductoID, UsuarioID, TipoMovimiento, Cantidad, FechaFinal, Estado) VALUES (?, ?, ?, ?, ?, ?, ?)";
        connection.update(sql, mov.id(), nuevo.idProducto(), nuevo.idCliente(), nuevo.tipo(), nuevo.cantidad(), mov.fechaFin(), mov.estado());

        return mov;
    }
}
