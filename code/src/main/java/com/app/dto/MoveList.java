package com.app.dto;

import java.util.ArrayList;
import java.util.List;

public class MoveList {
    private List<Movimiento> lista;

    public MoveList(){ this.lista = new ArrayList<Movimiento>(); }

    public List<Movimiento> getLista() {return this.lista; }
    
    public void setLista(List<Movimiento> nuevo){ this.lista = nuevo; }

    public void addElement(Movimiento nuevo){ this.lista.add(nuevo);}
}
