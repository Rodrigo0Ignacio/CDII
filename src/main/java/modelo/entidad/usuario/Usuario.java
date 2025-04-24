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
    private Date fechaCreacion;
    private String Password;
    private boolean cambioPass;
    private int rol;

    public Usuario(int id_usuario, String rut_usuario, String primerNombre, String segundoNombre, String paterno, String materno, String email, Date fechaCreacion, String Password, boolean cambioPass, int rol) {
        this.id_usuario = id_usuario;
        this.rut_usuario = rut_usuario;
        this.primerNombre = primerNombre;
        this.segundoNombre = segundoNombre;
        this.paterno = paterno;
        this.materno = materno;
        this.email = email;
        this.fechaCreacion = fechaCreacion;
        this.Password = Password;
        this.cambioPass = cambioPass;
        this.rol = rol;
    }
    
        public Usuario(int id_usuario, String rut_usuario, String primerNombre, String segundoNombre, String paterno, String materno, String email, String Password, boolean cambioPass, int rol) {
        this.id_usuario = id_usuario;
        this.rut_usuario = rut_usuario;
        this.primerNombre = primerNombre;
        this.segundoNombre = segundoNombre;
        this.paterno = paterno;
        this.materno = materno;
        this.email = email;
        this.Password = Password;
        this.cambioPass = cambioPass;
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

    /*CONSTRUCTOR PARA OBTENER DATOS DE LA SESION DEL USUARIO*/
    public Usuario(String rut_usuario, String primerNombre, String segundoNombre,String password, int rol) {
        this.rut_usuario = rut_usuario;
        this.primerNombre = primerNombre;
        this.segundoNombre = segundoNombre;
        this.Password = password;
        this.rol = rol;
    }
    
    public Usuario(){}

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

    public boolean getCambioPass() {
        return cambioPass;
    }

    public void setCambioPass(boolean cambioPass) {
        this.cambioPass = cambioPass;
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
