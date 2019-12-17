/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.ausiasmarch.exceptions;

/**
 *
 * @author alejandro
 */
public class MyException extends Exception {
    private Integer code;
    private String descripcion;
    
    public MyException() { super(); }
    public MyException(Integer code, String descripcion) { super(descripcion); this.code = code; this.descripcion = descripcion; }  
    public MyException(Integer code, String descripcion, Throwable cause) { super(descripcion, cause); this.code = code; this.descripcion = descripcion; }
    public MyException(Throwable cause) { super(cause); }
    
    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
}