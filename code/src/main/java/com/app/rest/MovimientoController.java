package com.app.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.app.dto.Movimiento;
import com.app.service.MovimientoService;

public class MovimientoController {

    @Autowired
    MovimientoService M_srvc;
    
    @GetMapping("/{id}")
    public Movimiento buscar(@PathVariable String id) {
        return M_srvc.buscar(Integer.parseInt(id));
    }
}
