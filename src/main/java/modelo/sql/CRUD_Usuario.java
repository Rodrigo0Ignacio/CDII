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
        try {
            query = "INSERT INTO usuario (rut_usuario, primerNombre, segundoNombre, paterno, materno, email, cambiarPassword, fechaCreacion, password, id_rol) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
            
            ps = conectar().prepareStatement(query);

            // Configurar los parámetros del PreparedStatement
            ps.setString(1, objeto.getRut_usuario());
            ps.setString(2, objeto.getPrimerNombre());
            ps.setString(3, objeto.getSegundoNombre());
            ps.setString(4, objeto.getPaterno());
            ps.setString(5, objeto.getMaterno());
            ps.setString(6, objeto.getEmail());
            ps.setBoolean(7, objeto.isCambiarpassword());
            ps.setDate(8, objeto.getFechaCreacion());
            
            // Encriptar la contraseña y establecerla en el PreparedStatement
            try {
                String passwordCifrado = clave.cifrar(objeto.getPassword());
                ps.setString(9, passwordCifrado);
            } catch (Exception ex) {
                Logger.getLogger(Usuario.class.getName()).log(Level.SEVERE, "Error al cifrar la contraseña", ex);
                throw new RuntimeException("Error al cifrar la contraseña", ex);
            }

            ps.setInt(10, objeto.getRol());

            // Ejecutar la actualización
            ps.executeUpdate();

            // Cerrar recursos
            ps.close();
            ps.close();

        } catch (SQLException e) {
            System.err.println("Error al insertar el usuario: " + e.getMessage());
            e.printStackTrace();
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
                        new Usuario(
                        rs.getInt(1),       // id_usuario
                        rs.getString(2),    // rut_usuario
                        rs.getString(3),    // primerNombre
                        rs.getString(4),    // segundoNombre
                        rs.getString(5),    // paterno
                        rs.getString(6),    // materno
                        rs.getString(7),    // email
                        rs.getBoolean(8),   // cambiarPassword
                        rs.getDate(9),      // fechaCreacion
                        rs.getString(10),   // Password
                        rs.getInt(11)));       // rol
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
         query = "UPDATE usuario SET rut_usuario = ?, primerNombre = ?, segundoNombre = ?, paterno = ?, materno = ?, email = ?, password = ?,"
                + " id_rol = ? WHERE id_usuario = ?";

        try {
            ps = conectar().prepareStatement(query);
            // Configurar los parámetros del PreparedStatement
            ps.setString(1, objeto.getRut_usuario());
            ps.setString(2, objeto.getPrimerNombre());
            ps.setString(3, objeto.getSegundoNombre());
            ps.setString(4, objeto.getPaterno());
            ps.setString(5, objeto.getMaterno());
            ps.setString(6, objeto.getEmail());

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
        query = "DELETE FROM Usuario WHERE rut_usuario = ?";

        try {

            ps = conectar().prepareStatement(query);

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
