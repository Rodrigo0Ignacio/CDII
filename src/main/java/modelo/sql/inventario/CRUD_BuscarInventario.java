package modelo.sql.inventario;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.sql.conexion.SQL_Conexion;

/**
 *
 * @author Admin_sala
 */
public class CRUD_BuscarInventario extends SQL_Conexion {

    /*CRUD DE BUSQUEDA DE UN INVENTARIO*/
    private ArrayList<String> listaTablas = new ArrayList<>();
    private ArrayList<String> encabezados = new ArrayList<>();
    

    public ArrayList<String> BuscaCuerpoInventario(String nombreInventario) {

        query = "SELECT * FROM " + nombreInventario;  
        int cantidadColumnas = cantidadColumnas(nombreInventario);

        try {
            // Ejecutar la consulta
            st = conectar().createStatement();
            rs = st.executeQuery(query);

            // Recorrer los resultados
            while (rs.next()) {
                // Crear una fila para almacenar los datos de todas las columnas
                for (int i = 1; i <= cantidadColumnas; i++) {
                    listaTablas.add(rs.getString(i));

                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(CRUD_BuscarInventario.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return listaTablas;
    }
}

