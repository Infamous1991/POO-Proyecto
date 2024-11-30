package com.app.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import com.app.dto.Pedido;
import com.app.service.PedidoService;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;


@RestController
@RequestMapping("pedido")
@CrossOrigin
public class PedidoController {
    
    @Autowired
    PedidoService Pe_srcv;

    @GetMapping("todo")
    public List<Pedido> getAll() {
        return Pe_srcv.getAll();
    }

    @GetMapping("{id}")
    public Pedido getById(@PathVariable int id) {
        return Pe_srcv.get(id);
    }
    
    
}
