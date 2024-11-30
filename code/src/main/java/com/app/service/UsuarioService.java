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

    public int nuevaOrden(Usuario evaluar){
        int answ;
        final String existe= "SELECT ID FROM Usuarios WHERE Nombre = ?";
        final String nuevo= """
                INSERT INTO Usuarios(Nombre, Email, NumeroTelefono, Direccion) 
                            VALUES (?, ?, ?, ?)
                SELECT SCOPE_IDENTITY()
                """;
        int test= connection.queryForObject("SELECT COUNT(*) FROM Usuarios WHERE Nombre = ?", int.class, evaluar.nombre());
        if (test == 0){
            answ= connection.queryForObject(nuevo, int.class, evaluar.nombre(), evaluar.email(), evaluar.telefono(), evaluar.direccion());
        } else{
            answ= connection.queryForObject(existe, int.class, evaluar.nombre());
        }
        return answ;
    }
}
