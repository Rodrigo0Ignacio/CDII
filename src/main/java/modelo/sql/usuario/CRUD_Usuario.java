package modelo.sql.usuario;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.cifrado.Clave;
import modelo.entidad.usuario.Usuario;
import modelo.sql.conexion.SQL_Conexion;
import modelo.sql.interface_CRUD.CRUD;

public class CRUD_Usuario extends SQL_Conexion implements CRUD<Usuario> {

    // public Usuario user;
    private Clave clave;

    public CRUD_Usuario() throws Exception {
        clave = new Clave();
    }

    public boolean buscarUsuario(String rut, String email) {
        String query = "SELECT * FROM usuario WHERE rut_usuario = ? OR email = ?";

        try {
            ps = conectar().prepareStatement(query);
            ps.setString(1, rut);
            ps.setString(2, email);
            rs = ps.executeQuery();

            // Si encuentra al menos un resultado, retorna true
            if (rs.next()) {
                return true;
            }

        } catch (SQLException e) {
            e.printStackTrace(); // Imprime error en consola
        } finally {
            // Cierra recursos (opcional, pero recomendado)
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return false; // Si no encontró usuario
    }

    @Override
    public void crear(Usuario objeto) {

        query = "INSERT INTO usuario (id_usuario, rut_usuario, primerNombre,"
                + " segundoNombre, paterno, materno, email, fechaCreacion,"
                + " password, cambioPassword, id_rol)"
                + " VALUES (NULL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";

        try {
            ps = conectar().prepareStatement(query);

            // Empieza desde el índice 1
            ps.setString(1, objeto.getRut_usuario());
            ps.setString(2, objeto.getPrimerNombre());
            ps.setString(3, objeto.getSegundoNombre());
            ps.setString(4, objeto.getPaterno());
            ps.setString(5, objeto.getMaterno());
            ps.setString(6, objeto.getEmail());
            ps.setDate(7, obtenerFechaActual());
            ps.setString(8, objeto.getPassword());
            ps.setBoolean(9, objeto.getCambioPass());
            ps.setInt(10, objeto.getRol());

            // Ejecutar la consulta
            ps.executeUpdate();

            ps.close();
            Desconectar();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public ArrayList<Usuario> leer() {
        query = "SELECT * FROM usuario";
        lista = new ArrayList<Usuario>();

        try {
            ps = conectar().prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                lista.add(
                        new Usuario(rs.getInt(1), rs.getString(2),
                                rs.getString(3), rs.getString(4),
                                rs.getString(5), rs.getString(6),
                                rs.getString(7), rs.getDate(8),
                                rs.getString(9), rs.getBoolean(10),
                                rs.getInt(11)));
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
        String query = "UPDATE usuario SET rut_usuario = ?, primerNombre = ?, segundoNombre = ?, paterno = ?, materno = ?, email = ?, password = ?,"
                + " cambioPassword = ?, id_rol = ? WHERE id_usuario = ?";

        try {
            ps = conectar().prepareStatement(query);
            // Configurar los parámetros del PreparedStatement
            ps.setString(1, objeto.getRut_usuario());
            ps.setString(2, objeto.getPrimerNombre());
            ps.setString(3, objeto.getSegundoNombre());
            ps.setString(4, objeto.getPaterno());
            ps.setString(5, objeto.getMaterno());
            ps.setString(6, objeto.getEmail());

            // Sin cifrado de contraseña
            ps.setString(7, objeto.getPassword());

            ps.setBoolean(8, objeto.getCambioPass());
            ps.setInt(9, objeto.getRol());
            ps.setString(10, idUsuario); // Usar el ID proporcionado para actualizar el registro

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

    public int buscarID(String rut) {
        int id = 0; // Valor por defecto si no se encuentra

        String query = "SELECT id_usuario as id FROM usuario WHERE rut_usuario = ?";

        try {
            ps = conectar().prepareStatement(query);
            ps.setString(1, rut);
            rs = ps.executeQuery();

            if (rs.next()) {
                id = rs.getInt("id"); // Recupera el ID del resultado
            }

        } catch (SQLException e) {
            e.printStackTrace(); // Imprime el error en consola
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return id;
    }

    @Override
    public void eliminar(String i) {

        // SQL para eliminar un registro basado en el ID
        String sql = "DELETE FROM usuario WHERE rut_usuario = ?";

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

    public ArrayList<Usuario> buscarPorRut(String rut) {
        String query = "SELECT * FROM usuario WHERE rut_usuario = ?";
        ArrayList<Usuario> lista = new ArrayList<>();

        try {
            ps = conectar().prepareStatement(query);
            ps.setString(1, rut);
            rs = ps.executeQuery();

            while (rs.next()) {
                lista.add(
                        new Usuario(
                                rs.getInt(1), rs.getString(2),
                                rs.getString(3), rs.getString(4),
                                rs.getString(5), rs.getString(6),
                                rs.getString(7), rs.getDate(8),
                                rs.getString(9), rs.getBoolean(10),
                                rs.getInt(11)
                        )
                );
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                Desconectar();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return lista;
    }

    public boolean actualizarPassword(String input, String nuevaPassword) {
        String query = "UPDATE usuario SET password = ? WHERE rut_usuario = ? OR email = ?";
        boolean actualizado = false;

        try {
            ps = conectar().prepareStatement(query);

            // Configurar los parámetros del PreparedStatement
            ps.setString(1, nuevaPassword); // Nueva contraseña

            // Comprobar si el input es un RUT o un email y establecer el parámetro adecuado
            if (input.contains("@")) { // Si contiene '@', asumimos que es un email
                ps.setString(2, null); // Deja el RUT como null
                ps.setString(3, input); // Establece el email
            } else { // Si no contiene '@', asumimos que es un RUT
                ps.setString(2, input); // Establece el RUT
                ps.setString(3, null); // Deja el email como null
            }

            // Ejecutar la actualización
            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("Contraseña actualizada exitosamente.");
                actualizado = true;
            } else {
                System.out.println("No se encontró un usuario con el RUT o Email proporcionado.");
            }
        } catch (SQLException e) {
            Logger.getLogger(CRUD_Usuario.class.getName()).log(Level.SEVERE, "Error al actualizar la contraseña", e);
        } finally {
            Desconectar(); // Cerrar la conexión en el bloque finally
        }

        return actualizado;
    }

    public String obtenerEmail(String input) {
        String query = "SELECT email FROM usuario WHERE rut_usuario = ? OR email = ?";
        String email = null;

        try {
            ps = conectar().prepareStatement(query);

            // Comprobar si el input es un RUT o un email y establecer los parámetros adecuados
            if (input.contains("@")) { // Si contiene '@', asumimos que es un email
                ps.setString(1, null);  // Deja el RUT como null
                ps.setString(2, input); // Establece el email
            } else { // Si no contiene '@', asumimos que es un RUT
                ps.setString(1, input); // Establece el RUT
                ps.setString(2, null);  // Deja el email como null
            }

            // Ejecutar la consulta
            rs = ps.executeQuery();

            // Verificar si se obtuvo un resultado
            if (rs.next()) {
                email = rs.getString("email");  // Obtener el email
                System.out.println("Email encontrado: " + email);
            } else {
                System.out.println("No se encontró un usuario con el RUT o Email proporcionado.");
            }
        } catch (SQLException e) {
            Logger.getLogger(CRUD_Usuario.class.getName()).log(Level.SEVERE, "Error al obtener el email", e);
        } finally {
            Desconectar(); // Cerrar la conexión en el bloque finally
        }

        return email;
    }

    public boolean actualizarPassword(String email, String passwordActual, String passwordNuevo) {
        query = "UPDATE usuario SET password = ? WHERE email = ? AND password = ?";
        boolean exito = false;

        try {
            ps = conectar().prepareStatement(query);

            ps.setString(1, passwordNuevo);  // Nuevo password
            ps.setString(2, email);           // Email del usuario
            ps.setString(3, passwordActual);  // Password actual

            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                exito = true;
                System.out.println("Contraseña actualizada exitosamente.");
            } else {
                System.out.println("No se encontró un usuario con ese email y contraseña actual.");
            }
        } catch (SQLException e) {
            Logger.getLogger(CRUD_Usuario.class.getName()).log(Level.SEVERE, "Error al actualizar la contraseña", e);
        } finally {
            Desconectar(); // Siempre cerrar la conexión
        }

        return exito;  // Retorna true si se actualizó, false si no
    }

}
