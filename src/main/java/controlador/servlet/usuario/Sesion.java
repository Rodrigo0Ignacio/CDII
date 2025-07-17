package controlador.servlet.usuario;

import controlador.mail.Correo;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.Aleatorio;
import modelo.entidad.usuario.Usuario;
import modelo.sql.usuario.CRUD_Sesion;
import modelo.sql.usuario.CRUD_Usuario;

public class Sesion extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        String recuperacionPassword = request.getParameter("recuperacion");


        try {
            CRUD_Usuario usuario = new CRUD_Usuario();
            Aleatorio aleatorio = new Aleatorio();
            String contrasenaTemporal = aleatorio.generarTextoAleatorio(10);
            String datos = usuario.obtenerEmail(recuperacionPassword);
            String url = "<a href=\"http://localhost:8080/sistema_de_gestion/restablecimiento.jsp?email=" + datos + "\">ir al sitio</a>";

            if (!recuperacionPassword.isEmpty() && recuperacionPassword != null) {

                boolean actualizar = usuario.actualizarPassword(recuperacionPassword, contrasenaTemporal);

                if (actualizar && datos != null) {

                    Correo email = new Correo();

                    email.setDestinatario(datos);
                    email.setAsunto("Sistema CDII - Contraseña Provisoria ");
                    email.setContenidoHtml("<h1>Recuperacion de Contraseña </h1>"
                            + "<p>Ingrese a este enlace: " + url + " y digite la clave provisoria: <b>" + contrasenaTemporal + "</b></p>");
                    //email.setAdjuntos(new File[]{new File("ruta/al/archivo1.txt"), new File("ruta/al/archivo2.jpg")});
                    email.enviarCorreo();

                    //ENVIAR LOS DATOS AL JSP Y CORREO
                    request.setAttribute("msj", "Revise su bandeja de entrada");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                    contrasenaTemporal = "";

                } else {

                    request.setAttribute("msj", "Email o RUT no encontrado");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                    contrasenaTemporal = "";

                }

            }

        } catch (Exception ex) {
            Logger.getLogger(Sesion.class.getName()).log(Level.SEVERE, null, ex);
        }

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
