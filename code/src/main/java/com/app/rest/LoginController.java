package com.app.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.app.dto.Trabajador;
import com.app.service.TrabajadorService;


@RestController
@RequestMapping("login")
public class LoginController {

    @Autowired
    TrabajadorService Tr_srvc;
    
    @PostMapping
    public ResponseEntity<String> login(@RequestBody Trabajador entity) {
        if (!Tr_srvc.auth(entity)) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(Tr_srvc.key(entity), HttpStatus.ACCEPTED);
    }
}
