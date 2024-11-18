package com.app.rest;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.app.service.ProductoService;
import com.app.dto.Producto;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;


@RestController
@RequestMapping("/producto")
public class ProductoController {

    @Autowired
    ProductoService P_srvc;
    
    @GetMapping("/{id}")
    public Producto buscar(@PathVariable String id) {
        return P_srvc.buscar(Integer.parseInt(id));
    }

    @PostMapping("/agregar")
    public Producto agregar(@RequestBody Producto entity) {
        return P_srvc.agregar(entity);
    }
    
    
}
