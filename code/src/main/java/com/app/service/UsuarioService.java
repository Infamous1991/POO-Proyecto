package com.app.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.app.dto.Usuario;

@Service
public class UsuarioService {

    @Autowired
    JdbcTemplate connection; 

    public Usuario buscar(int id){
        String sql = "SELECT * FROM Usuarios WHERE ID=?";
        return connection.queryForObject(sql, new Usuario(), id);
    }
    public Usuario agregar(Usuario nuevo){
        String sql = "INSERT INTO Usuarios VALUE (?, ?, ?, ?, ?)";
        connection.update(sql, nuevo.id() ,nuevo.nombre(), nuevo.apellido(), nuevo.email(), nuevo.rol());
        return nuevo;
    }


}
