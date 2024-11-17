package com.app.dto;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class EmpleadoRowMapper implements RowMapper<Empleado> {

    @Override
    public Empleado mapRow(ResultSet rs, int rowNum) throws SQLException {
        return new Empleado(rs.getInt("id"), 
                            rs.getString("nombre"),
                            rs.getString("trabajo"),
                            rs.getString("trabajo"),
                            rs.getInt("access") );
    }
}
