
package modelo.sql.conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


public class Test_Conexion extends SQL_Conexion{
    
    public Connection conectar() {
        long inicioConexion = System.nanoTime();  // Tiempo de inicio de conexión
        try {
            Class.forName(DRIVER);
            this.con = (Connection) DriverManager.getConnection(URL, USUARIO, PASSWORD);
            long finConexion = System.nanoTime();  // Tiempo después de conectar
            System.out.println("Test: Conexión establecida a: " + BD);
            System.out.println("Test: Tiempo de conexión: " + (finConexion - inicioConexion) / 1_000_000.0 + " ms");
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(SQL_Conexion.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Test: Error de conexión");
        }
        return con;
    }
    
    // Método para ejecutar una consulta y medir el tiempo
    public ResultSet ejecutarConsulta(String query) {
        long inicioConsulta = System.nanoTime();  // Tiempo antes de ejecutar la consulta
        ResultSet resultado = null;

        try {
            st = conectar().createStatement();
            resultado = st.executeQuery(query);
            long finConsulta = System.nanoTime();  // Tiempo después de ejecutar la consulta
            System.out.println("Tiempo de consulta: " + (finConsulta - inicioConsulta) / 1_000_000.0 + " ms");
        } catch (SQLException ex) {
            Logger.getLogger(SQL_Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }

        return resultado;
    }
    
}
