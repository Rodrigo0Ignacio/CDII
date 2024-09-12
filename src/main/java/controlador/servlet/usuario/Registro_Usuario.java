package controlador.servlet.usuario;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.entidad.usuario.Usuario;
import modelo.sql.CRUD_Usuario;

/**
 *
 * @author Admin_sala
 */
public class Registro_Usuario extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
            
            String rut = request.getParameter("rut");
            String primerNombre = request.getParameter("primerNombre");
            String segundoNombre = request.getParameter("segundoNombre");
            String apepaterno = request.getParameter("apePaterno");
            String apeMaterno = request.getParameter("apeMaterno");
            String email = request.getParameter("email");
            String pass1 = request.getParameter("password1");
            String pass2 = request.getParameter("password2");
            String rol = request.getParameter("rol");
    
            CRUD_Usuario usuario = new CRUD_Usuario();
            
            boolean requeire_cambiarPassword = (request.getParameter("cleck_cambiarPass") != null);
            
            ArrayList<String> errores = new ArrayList<>();
            
            if (rut == null || rut.isEmpty()) {
                errores.add("El RUT es obligatorio.");
            }
            
            if (primerNombre == null || primerNombre.isEmpty()) {
                errores.add("El primer nombre es obligatorio.");
            }
            
            if (segundoNombre == null || segundoNombre.isEmpty()) {
                errores.add("El segundo nombre es obligatorio.");
            }
            
            if (apepaterno == null || apepaterno.isEmpty()) {
                errores.add("El apellido paterno es obligatorio.");
            }
            
            if (apeMaterno == null || apeMaterno.isEmpty()) {
                errores.add("El apellido materno es obligatorio.");
            }
            
            if (email == null || email.isEmpty()) {
                errores.add("El correo electrónico es obligatorio.");
                
            } else if (!email.contains("@")) {
                errores.add("El correo electrónico no es válido.");
            }
            
            if (rol == null || rol.equalsIgnoreCase("Seleccione el ROL")) {
                errores.add("Debe seleccionar un rol.");
            }

            if (pass1 == null || pass1.isEmpty()) {
                errores.add("La contraseña es obligatoria. (1)");
            }
            if (pass2 == null || pass2.isEmpty()) {
                errores.add("La contraseña es obligatoria. (2)");
            }
            if(!pass1.equals(pass2)){
                errores.add("Las contraseñas no coinciden");
            }
            
            if (errores.isEmpty()) {
                System.out.println("Sin errores!");
                System.out.println("ROL: "+rol);
                System.out.println("Cambio de contraseña: "+requeire_cambiarPassword);

                usuario.crear(new Usuario(
                        rut,
                        primerNombre,
                        segundoNombre,
                        apepaterno,
                        apeMaterno,
                        email,
                        requeire_cambiarPassword,
                        usuario.obtenerFechaActual(),
                        pass1,
                        Integer.parseInt(rol)
                ));
                
                

                
            } else {
                
                for(String err : errores){
                    System.out.println("Errores: "+err);
                }
                
            }
        } catch (Exception ex) {
            Logger.getLogger(Registro_Usuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
