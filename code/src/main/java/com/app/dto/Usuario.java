package com.app.dto;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public record Usuario(int id, String nombre, String apellido, String email, String rol ) implements RowMapper<Usuario>{

    public Usuario(){ this(0, null, null, null, null); }

    @Override
    public Usuario mapRow(ResultSet rs, int rowNum) throws SQLException {
        return new Usuario(rs.getInt("ID"), 
                            rs.getString("Nombre"),
                            rs.getString("Apellido"),
                            rs.getString("Email"),
                            rs.getString("Rol"));
    }
}
