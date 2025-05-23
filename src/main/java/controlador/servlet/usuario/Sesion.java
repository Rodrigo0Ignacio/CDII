package controlador.servlet.usuario;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.logging.Logger;
import modelo.entidad.usuario.Usuario;
import modelo.sql.usuario.CRUD_Sesion;


public class Sesion extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        String recuperacionPassword = request.getParameter("recuperacion");
        System.out.println("Datos capturados: "+recuperacionPassword);
        response.sendRedirect("index.jsp");
        
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        String usuario = request.getParameter("usuario");
        String contrasenia = request.getParameter("contra");
        ArrayList<Usuario> datosSesion;
      //  HttpSession session = request.getSession();


        if (usuario.length() > 0 && contrasenia.length() > 0) {

            try {
                CRUD_Sesion crud_s = new CRUD_Sesion(usuario, contrasenia);
                datosSesion = crud_s.obtenerDatos();

                if (crud_s.validarSesion()) {
                    
                    //*SETEA LA SESION DEL USUARIO*/
                    for (Usuario e : datosSesion) {
                        request.getSession().setAttribute("RUT", e.getRut_usuario());
                        request.getSession().setAttribute("NOMBRE", e.getPrimerNombre() + " " + e.getSegundoNombre());
                        request.getSession().setAttribute("ROL", String.valueOf(e.getRol()));
                        
                    }
                    
                    request.setAttribute("valida", true);
                    request.getRequestDispatcher("Home.jsp").forward(request, response);

                } else {
                    /*SI EL USUARIO NO EXISTE ENTONCES RETORNA A  INDEX*/
                   request.setAttribute("valida", false);
                   request.getRequestDispatcher("index.jsp").forward(request, response);
                }

            } catch (Exception ex) {
                Logger.getLogger("Sesion: a ocurrido un error");
            }

        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
