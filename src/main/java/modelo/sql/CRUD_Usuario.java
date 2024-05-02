package modelo.sql;

import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import modelo.entidad.Usuario;

/**
 *
 * @author Admin_sala
 */
public class CRUD_Usuario extends SQL_Conexion implements Usuario_CRUD {

    @Override
    public ArrayList<Usuario> leer_datos() {
        query = "SELECT * FROM USUARIO";
        lista = new ArrayList<Usuario>();

        try {
            st = conectar().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {

                lista.add(new Usuario(rs.getString("RUT"), rs.getString("NOMBRES"),
                        rs.getString("APELLIDOS"), rs.getString("EMAIL"),
                        rs.getDate("FECHA_CREACION"), rs.getString("PASSWORD")));
            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return lista;

    }

    public boolean validar_credenciales(String user, String password) {
        String[] credenciales = new String[2];
        boolean credencialesEncontradas = false;

        for (int i = 0; i < leer_datos().size(); i++) {
            if (user.equals(leer_datos().get(i).getEmail()) && password.equals(leer_datos().get(i).getPassword())) {
                credenciales[0] = leer_datos().get(i).getEmail();
                credenciales[1] = leer_datos().get(i).getPassword();
                credencialesEncontradas = true;
                break;
            }
        }

        if (credencialesEncontradas) {
            return user.equals(credenciales[0]) && password.equals(credenciales[1]);
        } else {
            return false; // No se encontraron credenciales, por lo tanto, no son válidas.
        }
    }

    @Override
    public boolean escribir_Datos(String rut, String nombres, String apellidos, String email, String password) {
        
        String query = "INSERT INTO USUARIO (RUT, NOMBRES, APELLIDOS, EMAIL, FECHA_CREACION, PASSWORD) VALUES (?, ?, ?, ?, ?, ?)";
        
        try {
            ps = conectar().prepareStatement(query);
            ps.setString(1, rut);
            ps.setString(2, nombres);
            ps.setString(3, apellidos);
            ps.setString(4, email);
            ps.setDate(5, obtenerFechaActual());
            ps.setString(6, password);
            
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
        return false;
    }

    @Override
    public boolean modificar_Datos() {
        return false;

    }



}
