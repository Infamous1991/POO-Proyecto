package com.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.app.dto.Usuario;

@Service
public class UsuarioService {
    
    @Autowired
    JdbcTemplate connection;

    public List<Usuario> getAll(){
        String sql= "SELECT * FROM Usuarios";
        return connection.query(sql, RowMapperService.rmUsuario());
    }

    public Usuario get(int id){
        String sql= "SELECT * FROM Usuarios WHERE ID= ?";
        return connection.queryForObject(sql,RowMapperService.rmUsuario(), id);
    }
}
