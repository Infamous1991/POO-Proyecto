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
        final String sql = "SELECT  * FROM Movimientos";
        return connection.query(sql, RowMapperService.rmMovimiento());
    }
    public List<Movimiento> get(int id){
        final String sql= "SELECT * FROM Movimientos WHERE PedidoId = ?";
        return connection.query(sql, RowMapperService.rmMovimiento(), id);
    }
    public void nuevaOrden(List<Movimiento> nuevo, int pedidoId){
        final String sql= "INSERT INTO Movimientos(PedidoId, ProductoId, Cantidad, Monto) VALUES (?, ? , ? , ?)";
        final String actStock= "UPDATE Productos SET StockDisponible= StockDisponible - ? WHERE ID = ?";
        for (Movimiento m: nuevo){
            connection.update(sql, pedidoId, m.getProductoId(), m.getCantidad(), m.getMonto());
            connection.update(actStock, m.getCantidad(), m.getProductoId());
        }
    }
}
