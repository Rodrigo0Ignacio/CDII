/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo.entidad.permisos;

/**
 *
 * @author rodri
 */
public class Permisos {
    
    private int id_permiso;
    private int id_rol;
    private String nombre_web;
    
    public Permisos(int id_permiso, int id_rol, String nombre_web) {
        this.id_permiso = id_permiso;
        this.id_rol = id_rol;
        this.nombre_web = nombre_web;
    }
    
    public Permisos() {
    }

    public int getId_permiso() {
        return id_permiso;
    }

    public void setId_permiso(int id_permiso) {
        this.id_permiso = id_permiso;
    }

    public int getId_rol() {
        return id_rol;
    }

    public void setId_rol(int id_rol) {
        this.id_rol = id_rol;
    }

    public String getNombre_web() {
        return nombre_web;
    }

    public void setNombre_web(String nombre_web) {
        this.nombre_web = nombre_web;
    }

}
