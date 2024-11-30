package com.app.dto;

public class Movimiento{
    private int id;
    private int pedidoId;
    private int productoId;
    private int cantidad;
    private int monto;

    public Movimiento(){}
    public Movimiento(int id, int pedidoId, int productoId, int cantidad, int monto){
        this.id= id;
        this.pedidoId= pedidoId;
        this.productoId= productoId;
        this.cantidad= cantidad;
        this.monto= monto;
    }

    public int getId(){ return this.id; }
    public int getPedidoId(){ return this.pedidoId; }
    public int getProductoId(){ return this.productoId; }
    public int getCantidad(){ return this.cantidad; }
    public int getMonto(){ return this.monto; }

    public void setId( int nw ){ this.id= nw; }
    public void setPedidoId( int nw ){ this.pedidoId= nw; }
    public void setProductoId( int nw ){ this.productoId= nw; }
    public void setCantidad( int nw ){ this.cantidad= nw; }
    public void setMonto( int nw ){ this.monto= nw; }

    @Override
    public String toString() {
        return """
                id: %d;
                pedidoId: %d;
                productoId: %d;
                cantidad: %d;
                monto: %d;""".formatted(this.id, this. pedidoId, this.productoId, this.cantidad, this.monto);
    }
}