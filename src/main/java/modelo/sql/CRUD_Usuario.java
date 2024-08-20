package modelo.sql;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.cifrado.Clave;
import modelo.entidad.usuario.Usuario;
import modelo.sql.interface_CRUD.CRUD;

public class CRUD_Usuario extends SQL_Conexion implements CRUD<Usuario> {

   // public Usuario user;
    private Clave clave;

    public CRUD_Usuario() throws Exception {
        clave = new Clave();
    }

    @Override
    public void crear(Usuario objeto) {

        query = "INSERT INTO usuario (id_usuario, rut_usuario, nombres, paterno, materno, email, fechaCreacion, password, id_rol)"
                + " VALUES (NULL, ?, ?, ?, ?, ?, ?, ?, ?);";

        try {
            ps = conectar().prepareStatement(query);

            //  ps.setInt(1, objeto.getId_usuario());
            ps.setString(2, objeto.getRut_usuario());
            ps.setString(3, objeto.getNombres());
            ps.setString(4, objeto.getPaterno());
            ps.setString(5, objeto.getMaterno());
            ps.setString(6, objeto.getEmail());
            ps.setDate(7, obtenerFechaActual());
            try {
                /*INSERTA EL VALOR CIFRADO EN LA BASE DE DATOS*/
                ps.setString(8, clave.cifrar(objeto.getPassword()));

            } catch (Exception ex) {
                Logger.getLogger(CRUD_Usuario.class.getName()).log(Level.SEVERE, null, ex);
            }
            ps.setInt(9, objeto.getRol());

            ps.close();
            Desconectar();

        } catch (SQLException e) {

        }

    }

    @Override
    public ArrayList<Usuario> leer() {
        query = "SELECT * FROM Usuario ";
        lista = new ArrayList<Usuario>();

        try {
            ps = conectar().prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                lista.add(
                        new Usuario(rs.getInt(1), rs.getString(2),
                                rs.getString(3), rs.getString(4),
                                rs.getString(5), rs.getString(6),
                                rs.getDate(7), rs.getString(8),
                                rs.getInt(9)));
            }
            rs.close();
            ps.close();
            Desconectar();

        } catch (SQLException e) {

            e.printStackTrace();
        }

        return lista;

    }

    @Override
    public void actualizar(Usuario objeto, String idUsuario) {
        String query = "UPDATE usuario SET rut_usuario = ?, nombres = ?, paterno = ?, materno = ?, email = ?, password = ?,"
                + " id_rol = ? WHERE id_usuario = ?";

        try {
            ps = conectar().prepareStatement(query);
            // Configurar los parámetros del PreparedStatement
            ps.setString(1, objeto.getRut_usuario());
            ps.setString(2, objeto.getNombres());
            ps.setString(3, objeto.getPaterno());
            ps.setString(4, objeto.getMaterno());
            ps.setString(5, objeto.getEmail());

            // Cifrar la contraseña antes de almacenarla
            try {
                String passwordCifrada = clave.cifrar(objeto.getPassword());
                ps.setString(6, passwordCifrada);
            } catch (Exception ex) {
                Logger.getLogger(CRUD_Usuario.class.getName()).log(Level.SEVERE, "Error al cifrar la contraseña", ex);
                return; // Salir del método si ocurre un error en el cifrado
            }

            ps.setInt(7, objeto.getRol());
            ps.setString(8, idUsuario); // Usar el ID proporcionado para actualizar el registro

            // Ejecutar la actualización
            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("Actualización exitosa.");
            } else {
                System.out.println("No se encontró el registro con el ID proporcionado.");
            }
        } catch (SQLException e) {
            Logger.getLogger(CRUD_Usuario.class.getName()).log(Level.SEVERE, "Error al actualizar el registro", e);
        } finally {
            Desconectar(); // Asegúrate de cerrar la conexión en el bloque finally
        }
    }

    @Override
    public void eliminar(String i) {

        // SQL para eliminar un registro basado en el ID
        String sql = "DELETE FROM Usuario WHERE rut_usuario = ?";

        try {

            ps = conectar().prepareStatement(sql);

            // Establecer el parámetro ID
            ps.setString(2, i);

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Eliminación exitosa.");
            } else {
                System.out.println("No se encontró el registro con el ID proporcionado.");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error al eliminar el registro.");
        }

    }

}
