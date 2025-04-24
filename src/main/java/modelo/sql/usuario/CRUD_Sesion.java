package modelo.sql.usuario;

import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import modelo.entidad.usuario.Usuario;
import modelo.sql.conexion.Test_Conexion;

public class CRUD_Sesion extends CRUD_Usuario {

    private Usuario usuario;
    private String rol;

    public CRUD_Sesion(String user, String password) throws Exception {
        super();
        usuario = new Usuario(user, password);

    }

    public ArrayList<Usuario> obtenerDatos() {
        ArrayList<Usuario> listaSesion = new ArrayList();
        Test_Conexion test = new Test_Conexion();

        query = "SELECT rut_usuario AS rut, id_rol AS rol, primerNombre, segundoNombre, password "
                + "FROM usuario WHERE (rut_usuario = ? OR email = ?) AND password = ?;";

        try {
            ps = conectar().prepareStatement(query);

            ps.setString(1, usuario.getRut_usuario()); // para rut
            ps.setString(2, usuario.getRut_usuario()); // también usar rut como posible email
            ps.setString(3, usuario.getPassword());    // contraseña
            rs = ps.executeQuery();

            while (rs.next()) {
                listaSesion.add(
                        new Usuario(rs.getString("rut"),
                                rs.getString("primerNombre"),
                                rs.getString("segundoNombre"),
                                rs.getString("password"),
                                rs.getInt("rol")));
            }
            rs.close();
            ps.close();
            Desconectar();

        } catch (Exception e) {
            System.out.println("clase CRUD_Sesion: Error al obtener los datos de la sesion");
        }

        return listaSesion;
    }

    public boolean validarSesion() {
        ArrayList datosSesion = obtenerDatos();

        if (!datosSesion.isEmpty()) {
            return true;
        } else {
            return false;
        }

    }

    public HttpSession obtenerSesion() {

        return null;

    }


            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
    
    
    
}
