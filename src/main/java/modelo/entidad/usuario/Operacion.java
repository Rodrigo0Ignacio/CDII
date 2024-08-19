
package modelo.entidad.usuario;

/**
 *
 * @author Admin_sala
 */
public class Operacion {
    private int id_operacion;
    private String operacion;

    public Operacion(int id_operacion, String operacion) {
        this.id_operacion = id_operacion;
        this.operacion = operacion;
    }

    public int getId_operacion() {
        return id_operacion;
    }

    public void setId_operacion(int id_operacion) {
        this.id_operacion = id_operacion;
    }

    public String getOperacion() {
        return operacion;
    }

    public void setOperacion(String operacion) {
        this.operacion = operacion;
    }
    
    
    
}
