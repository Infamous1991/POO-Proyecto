package com.app.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.app.dto.Trabajador;

@Service
public class TrabajadorService {

    @Autowired
    JdbcTemplate connection;

    public boolean auth(Trabajador test){
        String sql= "SELECT COUNT(ID) FROM Empleados WHERE (Nombre= ? AND ClaveAcceso= ?)";
        return connection.queryForObject(sql,int.class, test.userName(), test.password()) >= 1;
    }
    public String key(Trabajador test){
        return test.password() + test.userName() + "";
    }
}
