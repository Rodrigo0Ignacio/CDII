
package modelo.sql;

import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author Admin_sala
 */
public interface Usuario_CRUD {
    
    public ArrayList leer_datos();
    
    public boolean escribir_Datos(String rut, String nombres, String apellidos, String email, String password);
    
    public boolean actualizar_Datos();
    
    public boolean modificar_Datos();

    
}
