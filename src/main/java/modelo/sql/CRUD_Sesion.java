
package modelo.sql;

import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import modelo.cifrado.Clave;
import modelo.entidad.usuario.Usuario;

public class CRUD_Sesion extends CRUD_Usuario{
    

    private Usuario usuario;
    private String rol;
    
    public CRUD_Sesion(String user, String password) throws Exception {
        super();
        usuario = new Usuario(user, password);
        
    }
    
    public ArrayList<Usuario> obtenerDatos(){
        ArrayList<Usuario> listaSesion = new ArrayList();
        
                
        query = "SELECT rut_usuario AS 'rut', id_rol AS 'rol', primerNombre AS 'nombre', password AS 'pass' FROM usuario WHERE rut_usuario = ? OR password = ?;";
        
        try {
            Clave clave = new Clave();
            ps = conectar().prepareStatement(query);
            
            ps.setString(1, usuario.getRut_usuario());
            ps.setString(2, usuario.getPassword());
            rs = ps.executeQuery();
           
            
            while(rs.next()){
                listaSesion.add(
                        new Usuario(rs.getInt("rol"),rs.getString("rut"),rs.getString("nombre"), rs.getString("pass")));

                
            }          
            rs.close();
            ps.close();
            Desconectar();
            
        } catch (Exception e) {
            System.out.println("Error al obtener los datos de la sesion");
        }
        
        return listaSesion;
    }
    
    public boolean validarSesion(){
        ArrayList datosSesion = obtenerDatos();
        
        if(!datosSesion.isEmpty()){
            return true;
        }else{
           return false;
        }
        
    }
    
    public HttpSession obtenerSesion(){
        
        return null;
        
    }
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
    
    
    
}
