
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
public class CRUD_Usuario extends SQL_Conexion implements SQL_CRUD{


    
     public ArrayList<Usuario> leer_datos() {
        query = "SELECT * FROM USUARIO";
        lista = new ArrayList<Usuario>();

        try{
            st = conectar().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                
                lista.add(new Usuario (rs.getString("RUT"),rs.getString("NOMBRES")
                        ,rs.getString("APELLIDOS"),rs.getString("EMAIL")
                        ,rs.getDate("FECHA_CREACION"),rs.getString("PASSWORD")));
            }
            Desconectar();
            
            
        }catch(SQLException e){
            System.out.println(e);
        }
 
        return lista;
        
    }
     public boolean validar_credenciales(String user, String password){
 
         String[] credenciales = new String[2];
         
         for (int i = 0; i < leer_datos().size(); i++) {
             
             if(user.equals(leer_datos().get(i).getEmail()) && password.equals(leer_datos().get(i).getPassword())){
                 
                 credenciales[0] = leer_datos().get(i).getEmail();
                 credenciales[1] = leer_datos().get(i).getPassword();
             }
           
         }
         
         if(user.equals(credenciales[0]) && password.equals(credenciales[1])){
             
             return true;      
         }
         return false; 
     }

    @Override
    public boolean escribir_Datos() {
    return false;
    }
        

    @Override
    public boolean actualizar_Datos(){
        return false;    
    }

    @Override
    public boolean modificar_Datos() {
        return false;
        
    }

    @Override
    public boolean estado_conexion() {
        
        if(conectar() == null){
            return true;
        }else{
            return false;
        }
    }
    
        private Date obtenerFecha() {
        LocalDate fecha = LocalDate.now();
     
        Date fechaUtil = java.sql.Date.valueOf(fecha);
        
        return fechaUtil;
    }

    
    
    
    
}
