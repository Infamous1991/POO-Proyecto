package com.app.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import com.app.dto.Producto;
import com.app.service.ProductoService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@RestController
@RequestMapping("producto")
public class ProductoController {

    @Autowired
    ProductoService Pr_srvc;

    @GetMapping("todo")
    public List<Producto> getAll() {
        return Pr_srvc.getAll();
    }
    
}
