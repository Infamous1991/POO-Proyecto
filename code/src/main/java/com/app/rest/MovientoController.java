package com.app.rest;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.app.dto.Movimiento;
import com.app.service.MovimientoService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;

@RestController
@RequestMapping("movimiento")

public class MovientoController {

    @Autowired
    MovimientoService Mv_srcv;

    @GetMapping("todo")
    public List<Movimiento> getAll() {
        return Mv_srcv.getAll();
    }

    @GetMapping("{id}")
    public List<Movimiento> getById(int id) {
        return Mv_srcv.get(id);
    }
    
}
