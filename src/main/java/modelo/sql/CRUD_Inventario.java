
package modelo.sql;

import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import modelo.entidad.Inventario;
import modelo.sql.interface_CRUD.Inventario_CRUD;

/**
 *
 * @author Admin_sala
 */
public class CRUD_Inventario extends SQL_Conexion implements Inventario_CRUD{
 /*PENDIENTEEEEEEEEEEEEEEEEEEEEE*/
    @Override
    public ArrayList<Inventario> leer_datos() {
    ArrayList<Inventario> lista = new ArrayList<>();

    String query = "SELECT * FROM Inventario";

    try {
        // Ejecutar la consulta
        st = conectar().createStatement();
        rs = st.executeQuery(query);

        // Recorrer los resultados
        while (rs.next()) {
            // Obtener los valores de cada columna
            String autor = rs.getString("AUTOR");
            Date fechaCreacion = rs.getDate("FECHA_CREACION");
            String categoria = rs.getString("CATEGORIA");
            String nombreInventario = rs.getString("NOMBRE_INVENTARIO");
            String columnasString = rs.getString("COLUMNAS");
            String[] columnas = columnasString.split(","); // Convertir la cadena de columnas separadas por comas en un array de cadenas

            // Crear una instancia de Inventario y añadirla a la lista
            Inventario inventario = new Inventario(autor, fechaCreacion, categoria, nombreInventario, columnas);
            lista.add(inventario);
        }

    } catch (SQLException e) {
        System.out.println(e);
    }

    return lista;
}

    @Override
    public boolean escribir_Datos(String autor, Date Fecha_Creacion, String categoria, String nombre_inventario, String[] columnas) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean actualizar_Datos() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean modificar_Datos() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }


    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
