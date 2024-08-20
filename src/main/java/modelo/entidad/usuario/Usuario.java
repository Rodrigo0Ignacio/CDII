package modelo.entidad.usuario;

import java.sql.Date;

public class Usuario {

    private int id_usuario;
    private String rut_usuario;
    private String nombres;
    private String paterno;
    private String materno;
    private String email;
    private Date fechaCreacion;
    private String Password;
    private int rol;

    public Usuario(int id_usuario, String rut_usuario, String nombres, String paterno, String materno, String email, Date fechaCreacion, String Password, int rol) {
        this.id_usuario = id_usuario;
        this.rut_usuario = rut_usuario;
        this.nombres = nombres;
        this.paterno = paterno;
        this.materno = materno;
        this.email = email;
        this.fechaCreacion = fechaCreacion;
        this.Password = Password;
        this.rol = rol;
    }

    /*DATOS PARA INICIAR SESION*/
    public Usuario(String rut_usuario, String Password, int rol) {
        this.rut_usuario = rut_usuario;
        this.Password = Password;
        this.rol = rol;
    }

    public Usuario(String rut_usuario, String Password) {
        this.rut_usuario = rut_usuario;
        this.Password = Password;
    }

    public Usuario(int roles, String rut, String nombre) {
        this.rut_usuario = rut;
        this.nombres = nombre;
        this.rol = roles;
       
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getRut_usuario() {
        return rut_usuario;
    }

    public void setRut_usuario(String rut_usuario) {
        this.rut_usuario = rut_usuario;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getPaterno() {
        return paterno;
    }

    public void setPaterno(String paterno) {
        this.paterno = paterno;
    }

    public String getMaterno() {
        return materno;
    }

    public void setMaterno(String materno) {
        this.materno = materno;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getFechaCreacion() {
        return fechaCreacion;
    }

    public void setFechaCreacion(Date fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public int getRol() {
        return rol;
    }

    public void setRol(int rol) {
        this.rol = rol;
    }

}
