
package modelo.sql.interface_CRUD;

import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author Admin_sala
 */
public interface Inventario_CRUD {
    
    public ArrayList leer_datos();
    
    public boolean escribir_Datos(String autor, Date Fecha_Creacion, String categoria, String nombre_inventario, String[] columnas);
    
    public boolean actualizar_Datos();
    
    public boolean modificar_Datos();
}
