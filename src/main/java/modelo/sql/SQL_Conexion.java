package modelo.sql;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
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
    public PreparedStatement ps = null;
    public String query = null;
    public String tabla = null;
    public ArrayList lista = null;

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

    public boolean estado_conexion() {

        if (conectar() == null) {
            return true;
        } else {
            return false;
        }
    }

    public Date obtenerFechaActual() {
        LocalDate fecha = LocalDate.now();

        Date fechaUtil = java.sql.Date.valueOf(fecha);

        return fechaUtil;
    }

}
