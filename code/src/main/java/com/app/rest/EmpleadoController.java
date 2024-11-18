package com.app.rest;

import org.springframework.web.bind.annotation.RestController;

import com.app.dto.Usuario;
import com.app.service.UsuarioService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;



@RestController
@RequestMapping("/empleado")
public class EmpleadoController {
    
    @Autowired
    UsuarioService E_srvc;
    
    @GetMapping("/{id}")
    public Usuario buscarPorId(@PathVariable String id) {
        return E_srvc.buscar(Integer.parseInt(id));
    }

    @PostMapping("/agregar")
    public Usuario add(@RequestBody Usuario entity) {
        return E_srvc.agregar(entity);
    }
    
    
}
