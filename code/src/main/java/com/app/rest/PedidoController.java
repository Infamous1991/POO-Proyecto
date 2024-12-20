package com.app.rest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.app.dto.Pedido;
import com.app.dto.SolicitudeWrapper;
import com.app.service.MovimientoService;
import com.app.service.PedidoService;
import com.app.service.UsuarioService;


@RestController
@RequestMapping("pedido")
@CrossOrigin
public class PedidoController {
    
    @Autowired
    PedidoService Pe_srcv;
    @Autowired
    UsuarioService Us_srvc;
    @Autowired
    MovimientoService Mv_srvc;

    @GetMapping("todo")
    public List<Pedido> getAll() {
        return Pe_srcv.getAll();
    }

    @GetMapping("{id}")
    public Map<String, Object> getById(@PathVariable int id) {
        Pedido pedido = Pe_srcv.get(id);
        Map<String, Object> answ= new HashMap<>();
        answ.put("pedido", pedido);
        answ.put("usuario", Us_srvc.get(pedido.usuarioId()));
        return answ;
    }

    @PostMapping("agregar")
    public ResponseEntity<Integer> nuevoUsuario(@RequestBody SolicitudeWrapper input) {

        try{ //PARA FUTUTRO: SE DEBE DE REVERTIR LOS CAMBIOS SI ALGUNO DE LOS PASOS INTERMEDIOS FALLA
            int usuarioId= Us_srvc.nuevaOrden(input.usuario);
            int pedidoId= Pe_srcv.nuevaOrden(usuarioId);
            Mv_srvc.nuevaOrden(input.movimientos, pedidoId);
            return new ResponseEntity<>(pedidoId, HttpStatus.OK);
        } catch (Exception e){
            return new ResponseEntity<>(null, HttpStatus.valueOf(400));
        }

        
    }

    
    
}
