package modelo.sql.requerimiento;

import java.sql.SQLException;
import java.util.ArrayList;
import modelo.entidad.requerimiento.Requerimiento;
import modelo.sql.conexion.SQL_Conexion;
import modelo.sql.interface_CRUD.CRUD;

/**
 *
 * @author rodri
 */
public class CRUD_requerimiento extends SQL_Conexion implements CRUD<Requerimiento> {

    @Override
    public void crear(Requerimiento objeto) {
        query = "INSERT INTO requerimiento (fecha_ingreso, fecha_revisado, tipo_requerimiento, contenido, id_usuario) VALUES (?, ?, ?, ?, ?)";

        try {
            ps = conectar().prepareStatement(query);
            ps.setDate(1, objeto.getFecha_ingreso());
            ps.setDate(2, objeto.getFecha_revisado());
            ps.setString(3, objeto.getTipo_req());
            ps.setString(4, objeto.getContenido());
            ps.setInt(5, objeto.getId_usuario());  // Asumí que id_usuario es String, si es int, ajusta el tipo.

            ps.executeUpdate();
            ps.close();
            Desconectar();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public ArrayList<Requerimiento> leer() {
        query = "SELECT * FROM requerimiento";
        ArrayList<Requerimiento> lista = new ArrayList<>();

        try {
            ps = conectar().prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                lista.add(new Requerimiento(
                        rs.getInt("id_requerimiento"),
                        rs.getDate("fecha_ingreso"),
                        rs.getDate("fecha_revisado"),
                        rs.getString("tipo_requerimiento"),
                        rs.getString("contenido"),
                        rs.getInt("id_usuario")
                ));
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
    public void actualizar(Requerimiento objeto, String idReq) {
        query = "UPDATE requerimiento SET fecha_ingreso = ?, fecha_revisado = ?, tipo_requerimiento = ?, contenido = ?, id_usuario = ? WHERE id_requerimiento = ?";

        try {
            ps = conectar().prepareStatement(query);
            ps.setDate(1, objeto.getFecha_ingreso());
            ps.setDate(2, objeto.getFecha_revisado());
            ps.setString(3, objeto.getTipo_req());
            ps.setString(4, objeto.getContenido());
            ps.setInt(5, objeto.getId_usuario());
            ps.setString(6, idReq);

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Actualización exitosa.");
            } else {
                System.out.println("No se encontró el registro con el ID proporcionado.");
            }
            ps.close();
            Desconectar();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void eliminar(String idReq) {
        query = "DELETE FROM requerimiento WHERE id_requerimiento = ?";

        try {
            ps = conectar().prepareStatement(query);
            ps.setString(1, idReq);

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Eliminación exitosa.");
            } else {
                System.out.println("No se encontró el registro con el ID proporcionado.");
            }
            ps.close();
            Desconectar();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public ArrayList<Requerimiento> obtenerRequerimientosPorRut(String rutUsuario) {
        query = "SELECT usuario.id_usuario, usuario.rut_usuario, usuario.primerNombre, usuario.materno, usuario.paterno, " +
                "requerimiento.fecha_ingreso, requerimiento.tipo_requerimiento, requerimiento.contenido " +
                "FROM requerimiento " +
                "INNER JOIN usuario ON requerimiento.id_usuario = usuario.id_usuario " +
                "WHERE usuario.rut_usuario = ?";

        ArrayList<Requerimiento> lista = new ArrayList<>();

        try {
            ps = conectar().prepareStatement(query);
            ps.setString(1, rutUsuario);
            rs = ps.executeQuery();

            while (rs.next()) {
                // Crear un objeto con la información del usuario y el requerimiento
                Requerimiento requerimientoConUsuario = new Requerimiento(
                        rs.getInt("id_usuario"),
                        rs.getDate("fecha_ingreso"),rs.getString("tipo_requerimiento"),
                        rs.getString("contenido"),rs.getString("rut_usuario"),
                        rs.getString("primerNombre"),rs.getString("paterno"),
                        rs.getString("materno")

                );
                lista.add(requerimientoConUsuario);
            }

            rs.close();
            ps.close();
            Desconectar();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return lista;
    }
    
        public int obtenerIdRolPorRut(String rutUsuario) {
        String query = "SELECT id_rol FROM usuario WHERE rut_usuario = ?";
        int idRol = -1;  // Valor por defecto si no se encuentra el usuario

        try {
            ps = conectar().prepareStatement(query);
            ps.setString(1, rutUsuario);
            rs = ps.executeQuery();

            if (rs.next()) {
                idRol = rs.getInt("id_rol");
            }

            rs.close();
            ps.close();
            Desconectar();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return idRol;
    }
}
