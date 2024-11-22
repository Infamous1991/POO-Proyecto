package com.app.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.app.dto.Pedido;
import com.app.service.PedidoService;

@RestController
@RequestMapping("/usuario")
public class PedidoController {

    @Autowired
    public PedidoService P_srvc;
    
    @GetMapping("/{id}")
    public Pedido getMethodName(@PathVariable String id) {
        return P_srvc.buscar(Integer.parseInt(id));
    }
}
