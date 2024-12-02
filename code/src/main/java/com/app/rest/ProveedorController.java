package com.app.rest;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;

import com.app.dto.Proveedor;
import com.app.service.ProveedorService;

@RestController
@RequestMapping("proveedor")
public class ProveedorController {

    @Autowired
    ProveedorService Pr_srvc;

    @GetMapping("todo")
    public List<Proveedor> getAll() {
        return Pr_srvc.getAll();
    }
    
}
