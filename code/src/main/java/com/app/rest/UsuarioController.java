package com.app.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.app.dto.Movimiento;
import com.app.dto.SolicitudeWrapper;
import com.app.dto.Usuario;
import com.app.service.UsuarioService;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;


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

    @PostMapping("agregar")
    public Usuario nuevoUsuario(@RequestBody SolicitudeWrapper input) {

        Usuario user= input.usuario;
        System.out.println(user);

        for (Movimiento i: input.movimientos){
            System.out.print(i);
        }

        return user;
    }
    
}
