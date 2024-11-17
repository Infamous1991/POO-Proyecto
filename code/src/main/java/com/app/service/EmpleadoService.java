package com.app.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.app.dto.Empleado;
import com.app.dto.EmpleadoRowMapper;

@Service
public class EmpleadoService {

    @Autowired
    JdbcTemplate connexion; 

    public Empleado get(int id){
        String sql = "Select * from empleados where id=?";
        return connexion.queryForObject(sql, new EmpleadoRowMapper(), id);
    }
    public void add(Empleado nuevo){

    }


}
