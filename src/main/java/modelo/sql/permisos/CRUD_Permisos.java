/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo.sql.permisos;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.entidad.permisos.Permisos;
import modelo.sql.conexion.SQL_Conexion;
import modelo.sql.interface_CRUD.CRUD;

/**
 *
 * @author rodri
 */
public class CRUD_Permisos extends SQL_Conexion implements CRUD<Permisos> {

    @Override
    public void crear(Permisos objeto) {
        query = "INSERT INTO `Permisos` (`id_permiso`, `id_rol`, `nombre_web`) VALUES (NULL, ?, ?)";

        try {
            ps = conectar().prepareStatement(query);

            // Ejecutar la consulta
            ps.setInt(1, objeto.getId_rol());
            ps.setString(2, objeto.getNombre_web());
            ps.executeUpdate();

            ps.close();
            Desconectar();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public ArrayList<Permisos> leer() {
        query = "SELECT * FROM Permisos;";
        lista = new ArrayList<Permisos>();

        try {
            ps = conectar().prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                lista.add(
                        new Permisos(rs.getInt(1), rs.getInt(2), rs.getString(3)));
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
    public void actualizar(Permisos objeto, String idPermiso) {
        query = "UPDATE Permisos SET id_rol = ?, nombre_web = ? WHERE id_permiso = ?";

        try {
            ps = conectar().prepareStatement(query);
            ps.setInt(1, objeto.getId_rol());
            ps.setString(2, objeto.getNombre_web());
            ps.setString(3, idPermiso);

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Actualización exitosa.");
            } else {
                System.out.println("No se encontró el registro con el ID proporcionado.");
            }
            ps.close();
            Desconectar();
        } catch (SQLException e) {
            Logger.getLogger(CRUD_Permisos.class.getName()).log(Level.SEVERE, "Error al actualizar el registro", e);
        }
    }

    @Override
    public void eliminar(String idPermiso) {
        query = "DELETE FROM Permisos WHERE id_permiso = ?";

        try {
            ps = conectar().prepareStatement(query);
            ps.setString(1, idPermiso);

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Eliminación exitosa.");
            } else {
                System.out.println("No se encontró el registro con el ID proporcionado.");
            }
            ps.close();
            Desconectar();
        } catch (SQLException e) {
            Logger.getLogger(CRUD_Permisos.class.getName()).log(Level.SEVERE, "Error al eliminar el registro", e);
        }
    }

    public List<String> obtenerPermisos(String rut) {
        List<String> paginasPermitidas = new ArrayList<>();

        try {

            String query = "CALL ObtenerPermisos(?)";
            ps = conectar().prepareStatement(query);
            ps.setString(1, rut);
            rs = ps.executeQuery();

            while (rs.next()) {
                paginasPermitidas.add(rs.getString("DIRECTORIO"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            Desconectar();
        }

        return paginasPermitidas;
    }

}
