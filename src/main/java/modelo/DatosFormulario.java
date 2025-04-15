
package modelo;

/**
 *
 * @author Admin_sala
 */
public class DatosFormulario {
    private String rut;
    private String rol;
    private String nombreInventario;
    private boolean autoIdentifiers;
    private boolean visibility;
    private String[] headers;
    private String[] selectValues;

    // Constructor sin argumentos (obligatorio para Gson)
    public DatosFormulario() {
    }

    // Getters y Setters
    public String getRut() {
        return rut;
    }

    public void setRut(String rut) {
        this.rut = rut;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

    public String getNombreInventario() {
        return nombreInventario;
    }

    public void setNombreInventario(String nombreInventario) {
        this.nombreInventario = nombreInventario;
    }

    public boolean isAutoIdentifiers() {
        return autoIdentifiers;
    }

    public void setAutoIdentifiers(boolean autoIdentifiers) {
        this.autoIdentifiers = autoIdentifiers;
    }

    public boolean isVisibility() {
        return visibility;
    }

    public void setVisibility(boolean visibility) {
        this.visibility = visibility;
    }

    public String[] getHeaders() {
        return headers;
    }

    public void setHeaders(String[] headers) {
        this.headers = headers;
    }

    public String[] getSelectValues() {
        return selectValues;
    }

    public void setSelectValues(String[] selectValues) {
        this.selectValues = selectValues;
    }
}

