package controlador.permisos;

import java.util.ArrayList;
import modelo.entidad.permisos.Permisos;
import modelo.entidad.usuario.Roles;
import modelo.sql.permisos.CRUD_Permisos;
import modelo.sql.permisos.CRUD_Roles;

/**
 *
 * @author rodri
 */
public class Control {

    private String sesion;
    private CRUD_Permisos sql_permisos;
    private CRUD_Roles sql_roles;
    private ArrayList lista;

    public Control() {

    };
    
public void validarPermisos(String session1) {
        // Crear la lista de roles
        ArrayList<Roles> lista = new ArrayList<>();

        // Obtener los roles desde la base de datos
        CRUD_Roles sql_roles = new CRUD_Roles();
        lista = sql_roles.leer();

        // Recorrer la lista de roles y comparar con los parámetros de sesión
        for (Roles rol : lista) {
            if (rol.getNombre_rol().equals(session1)) {
                System.out.println("Permiso encontrado: " + rol.getNombre_rol());
            }
        }
    };

}
