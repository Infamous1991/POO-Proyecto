package com.app.rest;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.app.dto.Proveedor;
import com.app.service.ProveedorService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;




@RestController
@RequestMapping("/proveedore")
public class ProveedorController {
    
    @Autowired
    ProveedorService Pv_srvc;

    @GetMapping("/{id}")
    public Proveedor buscar(@PathVariable String id) {
        return Pv_srvc.buscar(Integer.parseInt(id));
    }

    @PostMapping("/agregar")
    public Proveedor agregar(@RequestBody Proveedor entity) {
        return Pv_srvc.agregar(entity);
    }
    
    
    
}
