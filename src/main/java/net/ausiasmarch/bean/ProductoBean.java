package net.ausiasmarch.bean;

import com.google.gson.annotations.Expose;


public class ProductoBean implements BeanInterface {

    @Expose
    private Integer id;
    @Expose
    private String descripcion;
    @Expose
    private String codigo;
    @Expose
    private int existencias;
    @Expose
    private float precio;
    @Expose
    private String imagen;
    @Expose
    private int tipo_producto_id;


    public ProductoBean() {
    }
    
    public ProductoBean(String descripcion, String codigo, int existencias, float precio, String imagen) {
        this.descripcion = descripcion;
        this.codigo = codigo;
        this.existencias = existencias;
        this.precio = precio;
        this.imagen = imagen;
    }

    
    
    public int getTipo_producto_id() {
        return tipo_producto_id;
    }

    public void setTipo_producto_id(int tipo_producto_id) {
        this.tipo_producto_id = tipo_producto_id;
    }

    @Override
    public Integer getId() {
        return id;
    }

    @Override
    public void setId(Integer id) {
        this.id = id;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public int getExistencias() {
        return existencias;
    }

    public void setExistencias(int existencias) {
        this.existencias = existencias;
    }

    public float getPrecio() {
        return precio;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    
    

}