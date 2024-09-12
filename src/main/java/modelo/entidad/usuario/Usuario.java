package modelo.entidad.usuario;

import java.sql.Date;

public class Usuario {

    private int id_usuario;
    private String rut_usuario;
    private String primerNombre;
    private String segundoNombre;
    private String paterno;
    private String materno;
    private String email;
    private boolean cambiarpassword;
    private Date fechaCreacion;
    private String Password;
    private int rol;

    public Usuario(int id_usuario, String rut_usuario, String primerNombre, String segundoNombre, String paterno, String materno, String email,boolean cambiarPassword, Date fechaCreacion, String Password, int rol) {
        this.id_usuario = id_usuario;
        this.rut_usuario = rut_usuario;
        this.primerNombre = primerNombre;
        this.segundoNombre = segundoNombre;
        this.paterno = paterno;
        this.materno = materno;
        this.email = email;
        this.cambiarpassword = cambiarPassword;
        this.fechaCreacion = fechaCreacion;
        this.Password = Password;
        this.rol = rol;
    }
    
        public Usuario(String rut_usuario, String primerNombre, String segundoNombre, String paterno, String materno, String email,boolean cambiarPassword, Date fechaCreacion, String Password, int rol) {
        this.rut_usuario = rut_usuario;
        this.primerNombre = primerNombre;
        this.segundoNombre = segundoNombre;
        this.paterno = paterno;
        this.materno = materno;
        this.email = email;
        this.cambiarpassword = cambiarPassword;
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

    public Usuario(int roles, String rut, String primerNombre, String password ) {
        this.rut_usuario = rut;
        this.primerNombre = primerNombre;
        this.rol = roles;
        this.Password = password;
       
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

    public String getPrimerNombre() {
        return primerNombre;
    }

    public void setPrimerNombre(String primerNombre) {
        this.primerNombre = primerNombre;
    }

    public String getSegundoNombre() {
        return segundoNombre;
    }

    public void setSegundoNombre(String segundoNombre) {
        this.segundoNombre = segundoNombre;
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

    public boolean isCambiarpassword() {
        return cambiarpassword;
    }

    public void setCambiarpassword(boolean cambiarpassword) {
        this.cambiarpassword = cambiarpassword;
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
