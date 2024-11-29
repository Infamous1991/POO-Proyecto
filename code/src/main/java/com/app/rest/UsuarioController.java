package com.app.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.app.dto.Movimiento;
import com.app.dto.MoveList;
import com.app.dto.Usuario;
import com.app.service.MovimientoService;
import com.app.service.PedidoService;
import com.app.service.ProductoService;

import org.springframework.web.bind.annotation.PostMapping;

@Controller
@RequestMapping("/usuario")
public class UsuarioController {

    @Autowired
    PedidoService P_srvc;
    @Autowired
    MovimientoService M_srvc;
    @Autowired
    ProductoService Pr_srvc;

    @GetMapping
    public String usuarioe(Model model) {
        MoveList lista = new MoveList();
        lista.addElement(new Movimiento());
        model.addAttribute("usuario", new Usuario());
        model.addAttribute("movimientos", lista);
        return "usuario";
    }

    @GetMapping("/buscar")
    public String getMethodName(@RequestParam int buscar, Model model) {
        model.addAttribute("pedido", P_srvc.get(buscar));
        model.addAttribute("movimientosUsuario", M_srvc.getAll(buscar));
        return "buscar";
    }
    
    @PostMapping("/pedido")
    public String nuevoPedido( @ModelAttribute MoveList lista, @ModelAttribute Usuario usuario, Model model) {
        
        model.addAttribute("movimientos",lista);
        System.out.println("INICIO TEST");
        for (Movimiento test: lista.getLista()){
            System.out.println(test.getId());
        }
        System.out.println("FIN TEST");
        return "test";
    }
    
}
