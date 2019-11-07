package net.ausiasmarch.bean;

import com.google.gson.annotations.Expose;

public class TipoUsuarioBean implements BeanInterface {

    @Expose
    private Integer id;
    @Expose
    private String descripcion;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
    

}