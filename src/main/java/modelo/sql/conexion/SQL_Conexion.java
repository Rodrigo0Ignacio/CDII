package modelo.sql.conexion;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
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

    static final String BD = "CDII2";
    static final String URL = "jdbc:mysql://192.168.1.100:3306/" + BD;
    public static final String USUARIO = "root";
    public static final String PASSWORD = "uix86.dll";
    public static final String DRIVER = "com.mysql.cj.jdbc.Driver";
    Connection con = null;
    public ResultSet rs = null;
    public Statement st = null;
    public PreparedStatement ps = null;
    public String query = null;
    public String tabla = null;
    public ArrayList lista = null;
    public DatabaseMetaData metaData;
    ResultSetMetaData rsm;


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
    
    public int cantidadColumnas(String nombreTabla){
        int cantidadColumnas = 0;
        try {
            metaData = conectar().getMetaData();
            rs = metaData.getColumns(null, null, nombreTabla, null);
            
            while (rs.next()) {
                cantidadColumnas ++;   
            }
        } catch (SQLException ex) {
            Logger.getLogger(SQL_Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return cantidadColumnas;
        
    }
    
    public ArrayList<String> obtenerEncabezados(String nombreTabla){
        lista = new ArrayList();
        
        try {
            rsm = rs.getMetaData();
            
            for (int i = 1; i <= cantidadColumnas(nombreTabla); i++) {
                lista.add(rsm.getColumnName(i));
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(SQL_Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return lista;
        
    }

    public Date obtenerFechaActual() {
        LocalDate fecha = LocalDate.now();

        Date fechaUtil = java.sql.Date.valueOf(fecha);

        return fechaUtil;
    }

}
