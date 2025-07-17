
package modelo.entidad.requerimiento;

import java.sql.Date;
import modelo.entidad.usuario.Usuario;

public class Requerimiento extends Usuario{

    private int id_req;
    private Date fecha_ingreso;
    private Date fecha_revisado;
    private String tipo_req;
    private String contenido;
    private int id_usuario;

    public Requerimiento(int id_req, Date fecha_ingreso, Date fecha_revisado, String tipo_req, String contenido, int id_usuario) {
        this.id_req = id_req;
        this.fecha_ingreso = fecha_ingreso;
        this.fecha_revisado = fecha_revisado;
        this.tipo_req = tipo_req;
        this.contenido = contenido;
        this.id_usuario = id_usuario;
    }

    public Requerimiento(int id_usuario, Date fecha_ingreso, String tipo_req, String contenido, String rut_usuario, String primerNombre, String paterno, String materno) {
        super(rut_usuario, primerNombre, paterno, materno);
        this.id_usuario = id_usuario;
        this.fecha_ingreso = fecha_ingreso;
        this.tipo_req = tipo_req;
        this.contenido = contenido;
    }

    public Requerimiento(Date fecha_ingreso, Date fecha_revisado, String tipo_req, String contenido, int id_usuario) {
        this.fecha_ingreso = fecha_ingreso;
        this.fecha_revisado = fecha_revisado;
        this.tipo_req = tipo_req;
        this.contenido = contenido;
        this.id_usuario = id_usuario;
    }
    
    
    
    

    public int getId_req() {
        return id_req;
    }

    public void setId_req(int id_req) {
        this.id_req = id_req;
    }

    public Date getFecha_ingreso() {
        return fecha_ingreso;
    }

    public void setFecha_ingreso(Date fecha_ingreso) {
        this.fecha_ingreso = fecha_ingreso;
    }

    public Date getFecha_revisado() {
        return fecha_revisado;
    }

    public void setFecha_revisado(Date fecha_revisado) {
        this.fecha_revisado = fecha_revisado;
    }

    public String getTipo_req() {
        return tipo_req;
    }

    public void setTipo_req(String tipo_req) {
        this.tipo_req = tipo_req;
    }

    public String getContenido() {
        return contenido;
    }

    public void setContenido(String contenido) {
        this.contenido = contenido;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

}
