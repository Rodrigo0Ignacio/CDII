
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
    private String[] selectValues; // Agregar campo para los valores seleccionados de los select

    public DatosFormulario(String nombreInventario, boolean autoIdentifiers, boolean visibility, String[] headers, String[] selectValues) {
        this.nombreInventario = nombreInventario;
        this.autoIdentifiers = autoIdentifiers;
        this.visibility = visibility;
        this.headers = headers;
        this.selectValues = selectValues; // Inicializar los valores seleccionados de los select
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

    public String[] getSelectValues() {
        return selectValues;
    }

    public void setSelectValues(String[] selectValues) {
        this.selectValues = selectValues;
    }
}

