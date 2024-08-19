
package modelo.entidad.inventario;

import java.sql.Date;

/**
 *
 * @author Admin_sala
 */
public class Inventario {
    
    private int id;
    private String autor;
    private Date Fecha_Creacion;
    private String categoria;
    private String nombre_inventario;
    private String[] columnas;

    public Inventario(int id, String autor, Date Fecha_Creacion, String categoria, String nombre_inventario) {
        this.id = id;
        this.autor = autor;
        this.Fecha_Creacion = Fecha_Creacion;
        this.categoria = categoria;
        this.nombre_inventario = nombre_inventario;
    }

    public Inventario(int id, String autor, Date Fecha_Creacion, String categoria, String nombre_inventario, String[] columnas) {
        this.id = id;
        this.autor = autor;
        this.Fecha_Creacion = Fecha_Creacion;
        this.categoria = categoria;
        this.nombre_inventario = nombre_inventario;
        this.columnas = columnas;
    }

    public Inventario() {
    }
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAutor() {
        return autor;
    }

    public void setAutor(String autor) {
        this.autor = autor;
    }

    public Date getFecha_Creacion() {
        return Fecha_Creacion;
    }

    public void setFecha_Creacion(Date Fecha_Creacion) {
        this.Fecha_Creacion = Fecha_Creacion;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public String getNombre_inventario() {
        return nombre_inventario;
    }

    public void setNombre_inventario(String nombre_inventario) {
        this.nombre_inventario = nombre_inventario;
    }

    public String[] getColumnas() {
        return columnas;
    }

    public void setColumnas(String[] columnas) {
        this.columnas = columnas;
    }

    
}
