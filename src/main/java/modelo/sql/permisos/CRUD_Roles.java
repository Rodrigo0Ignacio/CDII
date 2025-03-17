/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo.sql.permisos;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.entidad.permisos.Permisos;
import modelo.entidad.usuario.Roles;
import modelo.sql.conexion.SQL_Conexion;
import modelo.sql.interface_CRUD.CRUD;

/**
 *
 * @author rodri
 */
public class CRUD_Roles extends SQL_Conexion implements CRUD<Roles> {

@Override
    public void crear(Roles objeto) {
        query = "INSERT INTO Roles (id_rol, nombre_rol) VALUES (NULL, ?)";

        try {
            ps = conectar().prepareStatement(query);
            ps.setString(1, objeto.getNombre_rol());
            ps.executeUpdate();
            ps.close();
            Desconectar();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public ArrayList<Roles> leer() {
        query = "SELECT * FROM Roles";
        lista = new ArrayList<>();

        try {
            ps = conectar().prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                lista.add(new Roles(rs.getInt(1), rs.getString(2)));
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
    public void actualizar(Roles objeto, String idRol) {
        query = "UPDATE Roles SET nombre_rol = ? WHERE id_rol = ?";

        try {
            ps = conectar().prepareStatement(query);
            ps.setString(1, objeto.getNombre_rol());
            ps.setString(2, idRol);
            
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Actualización exitosa.");
            } else {
                System.out.println("No se encontró el registro con el ID proporcionado.");
            }
            ps.close();
            Desconectar();
        } catch (SQLException e) {
            Logger.getLogger(CRUD_Roles.class.getName()).log(Level.SEVERE, "Error al actualizar el registro", e);
        }
    }

    @Override
    public void eliminar(String idRol) {
        query = "DELETE FROM Roles WHERE id_rol = ?";

        try {
            ps = conectar().prepareStatement(query);
            ps.setString(1, idRol);
            
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Eliminación exitosa.");
            } else {
                System.out.println("No se encontró el registro con el ID proporcionado.");
            }
            ps.close();
            Desconectar();
        } catch (SQLException e) {
            Logger.getLogger(CRUD_Roles.class.getName()).log(Level.SEVERE, "Error al eliminar el registro", e);
        }
    }
    
}
