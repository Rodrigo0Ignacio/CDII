
package modelo.sql;

import java.util.ArrayList;

/**
 *
 * @author Admin_sala
 */
public interface SQL_CRUD {
    
    public ArrayList leer_datos();
    
    public boolean escribir_Datos();
    
    public boolean actualizar_Datos();
    
    public boolean modificar_Datos();
    
    public boolean estado_conexion();
    
    
}
