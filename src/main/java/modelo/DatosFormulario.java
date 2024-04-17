
package modelo;

/**
 *
 * @author Admin_sala
 */
public class DatosFormulario {
    private String nombreInventario;
    private boolean autoIdentifiers;
    private boolean visibility;
    private String[] headers;

    public DatosFormulario(String nombreInventario, boolean autoIdentifiers, boolean visibility, String[] headers) {
        this.nombreInventario = nombreInventario;
        this.autoIdentifiers = autoIdentifiers;
        this.visibility = visibility;
        this.headers = headers;
    }
    
    public DatosFormulario(){}

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
    
    
    
    
    
    
}
