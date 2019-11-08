package net.ausiasmarch.bean;

import com.google.gson.annotations.Expose;

public class UsuarioBean implements BeanInterface {

    @Expose
    private Integer id;
    @Expose
    private String nombre;
    @Expose
    private String email;
    @Expose
    private String dni;
    @Expose
    private String apellido1;
    @Expose
    private String apellido2;
    @Expose
    private String login;
    private String password;
    @Expose
    private int tipo_usuario_id;

    
    public UsuarioBean() {
    }

    public int getTipo_usuario_id() {
        return tipo_usuario_id;
    }

    public void setTipo_usuario_id(int tipo_usuario_id) {
        this.tipo_usuario_id = tipo_usuario_id;
    }
    
    public UsuarioBean(String nombre, String email, String dni, String apellido1, String apellido2, String login, String password) {
        this.nombre = nombre;
        this.email = email;
        this.dni = dni;
        this.apellido1 = apellido1;
        this.apellido2 = apellido2;
        this.login = login;
        this.password = password;
    }

    
    
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    @Override
    public Integer getId() {
        return id;
    }

    @Override
    public void setId(Integer id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getApellido1() {
        return apellido1;
    }

    public void setApellido1(String apellido1) {
        this.apellido1 = apellido1;
    }

    public String getApellido2() {
        return apellido2;
    }

    public void setApellido2(String apellido2) {
        this.apellido2 = apellido2;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
}