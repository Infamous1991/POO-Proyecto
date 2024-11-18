package com.app.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.app.dto.Pedido;
import com.app.service.PedidoService;

@RestController
@RequestMapping("/pedido")
public class PedidoController {
    
    @Autowired
    PedidoService Pd_srvc;
    
    @GetMapping("/{id}")
    public Pedido buscar(@PathVariable String id) {
        return Pd_srvc.buscar(Integer.parseInt(id));
    }

    @PostMapping("/agregar")
    public Pedido agregar(@RequestBody Pedido entity) {
        return Pd_srvc.agregar(entity);
    }
}
