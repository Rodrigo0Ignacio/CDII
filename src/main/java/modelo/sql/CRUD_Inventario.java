
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

    @Override
    public ArrayList<Inventario> leer_datos() {
    ArrayList<Inventario> lista = new ArrayList<>();

     query = "SELECT * FROM creacion_inventario";

    try {
        // Ejecutar la consulta
        st = conectar().createStatement();
        rs = st.executeQuery(query);

        // Recorrer los resultados
        while (rs.next()) {
            lista.add(new Inventario(
            rs.getInt(1),rs.getString(2),rs.getDate(3),rs.getString(4),rs.getString(5)
            ));
        }
    } catch (SQLException e) {
        System.out.println(e);
    }

    return lista;
}

    @Override
    public boolean escribir_Datos(String autor, Date Fecha_Creacion, String categoria, String nombre_inventario) {
        
        
         query = "INSERT INTO creacion_inventario (AUTOR,FECHA_CREACION,CATEGORIA,NOMBRE_INVENTARIO) VALUES (?, ?, ?, ?)";
        
        try {
            ps = conectar().prepareStatement(query);
            ps.setString(1, autor);
            ps.setDate(2, Fecha_Creacion);
            ps.setString(3, categoria);
            ps.setString(4, nombre_inventario);
            
            int filasInsertadas = ps.executeUpdate();
            Desconectar();
            
            return filasInsertadas > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
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
