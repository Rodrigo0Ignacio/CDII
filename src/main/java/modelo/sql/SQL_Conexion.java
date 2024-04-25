package modelo.sql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin_sala
 */
public class SQL_Conexion {

    private static final String BD = "cdii";
    private static final String URL = "jdbc:mysql://localhost:3306/" + BD;
    private static final String USUARIO = "root";
    private static final String PASSWORD = "";
    private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
    private Connection con = null;
    public ResultSet rs = null;
    public Statement st = null;
    public String query;
    public String tabla;
    public  ArrayList lista;
    

    public SQL_Conexion() {

    }

    public Connection conectar() {
        try {
            Class.forName(DRIVER);
            this.con = (Connection) DriverManager.getConnection(URL, USUARIO, PASSWORD);

            System.out.println("Conexion establecida a: " + BD);

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SQL_Conexion.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Error de conecion 1");
        } catch (SQLException ex) {
            Logger.getLogger(SQL_Conexion.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Error de conecion 2");
        }

        return con;
    }

    public Connection Desconectar() {
        try {
            this.con.close();
        } catch (SQLException ex) {
            Logger.getLogger(SQL_Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return con;
    }

}
