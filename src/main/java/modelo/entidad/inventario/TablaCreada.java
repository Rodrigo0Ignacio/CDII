
package modelo.entidad.inventario;

/**
 *
 * @author Admin_sala
 */
public class TablaCreada {
    
    private String prefijo;
    private String nombreTabla;
    private String columna;
    private String indice;

    public TablaCreada(String prefijo, String nombreTabla, String columna, String indice) {
        this.prefijo = prefijo;
        this.nombreTabla = nombreTabla;
        this.columna = columna;
        this.indice = indice;
    }


    public String getPrefijo() {
        return prefijo;
    }

    public void setPrefijo(String prefijo) {
        this.prefijo = prefijo;
    }

    public String getNombreTabla() {
        return nombreTabla;
    }

    public void setNombreTabla(String nombreTabla) {
        this.nombreTabla = nombreTabla;
    }

    public String getColumnas() {
        return columna;
    }

    public void setColumnas(String columnas) {
        this.columna = columnas;
    }

    public String getIndice() {
        return indice;
    }

    public void setIndice(String indice) {
        this.indice = indice;
    }
    
    
    
    
    
    
}
