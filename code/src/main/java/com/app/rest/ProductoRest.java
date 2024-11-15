package com.app.rest;

import org.springframework.web.bind.annotation.RestController;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.app.service.ProductoService;
import com.app.dto.Producto;

@RestController
public class ProductoRest {
    
    @GetMapping("/{id}")
    public Producto getMethodName(@PathVariable String id, @RequestParam(value = "1", defaultValue = "0") String tipo) {
        return ProductoService.find(Integer.parseInt(id), Integer.parseInt(tipo));
    }
    
}
