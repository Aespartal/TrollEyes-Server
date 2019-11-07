package net.ausiasmarch.bean;

import com.google.gson.annotations.Expose;
import java.util.Date;

public class FacturaBean implements BeanInterface {

    @Expose
    private Integer id;
    @Expose
    private Date fecha;
    @Expose
    private int iva;

    public FacturaBean(Integer id, Date fecha, int iva) {
        this.id = id;
        this.fecha = fecha;
        this.iva = iva;
    }

    public FacturaBean() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Integer getId() {
        return id;
    }

    @Override
    public void setId(Integer id) {
        this.id = id;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public int getIva() {
        return iva;
    }

    public void setIva(int iva) {
        this.iva = iva;
    }



}