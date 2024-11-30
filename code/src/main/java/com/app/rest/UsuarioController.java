package com.app.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.app.dto.Usuario;
import com.app.service.UsuarioService;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;


@RestController
@RequestMapping("usuario")
public class UsuarioController {

    @Autowired
    UsuarioService Us_srvc;

    @GetMapping("todo")
    public List<Usuario> getAll() {
        return Us_srvc.getAll();
    }
    
    @GetMapping("{id}")
    public Usuario getById(@PathVariable int id) {
        return Us_srvc.get(id);
    }
    
}
