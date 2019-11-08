
package net.ausiasmarch.bean;

import com.google.gson.annotations.Expose;

public class CompraBean implements BeanInterface {
    @Expose
    private Integer id;
    @Expose
    private int cantidad;
    @Expose
    private int factura_id;
    @Expose
    private int producto_id;
    
    public CompraBean() {
    
    }

    public int getProducto_id() {
        return producto_id;
    }

    public void setProducto_id(int producto_id) {
        this.producto_id = producto_id;
    }

    public int getFactura_id() {
        return factura_id;
    }

    public void setFactura_id(int factura_id) {
        this.factura_id = factura_id;
    }

    public CompraBean(int id, int cantidad) {
        this.id = id;
        this.cantidad = cantidad;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
    
}
