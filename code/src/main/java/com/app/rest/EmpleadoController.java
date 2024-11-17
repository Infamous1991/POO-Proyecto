package com.app.rest;

import org.springframework.web.bind.annotation.RestController;

import com.app.dto.Empleado;
import com.app.service.EmpleadoService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;


@RestController
@RequestMapping("/emp")
public class EmpleadoController {
    
    @Autowired
    EmpleadoService EService;
    
    @GetMapping("/{id}")
    public Empleado searchById(@PathVariable String id) {
        return EService.get(Integer.parseInt(id));
    }
    
}
