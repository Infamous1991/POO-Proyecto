package com.app.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.app.dto.Trabajador;
import com.app.service.MovimientoService;


@Controller
@RequestMapping("/usuario")
public class UsuarioController {

    @Autowired
    MovimientoService M_srvc;

    @PostMapping
    public String usuario(@ModelAttribute Trabajador trabajador,Model model) {
        model.addAttribute("trabajador",trabajador);
        return "usuario";
    }
    @GetMapping
    public String usuarioe(@ModelAttribute Trabajador trabajador,Model model) {
        model.addAttribute("trabajador",trabajador);
        return "usuario";
    }

    @GetMapping("/buscar")
    public String getMethodName(@RequestParam String buscar, Model model) {
        model.addAttribute("search", M_srvc.buscar(Integer.parseInt(buscar)));
        return "buscar";
    }    
}
