package controlador.servlet.usuario;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Iterator;
import modelo.entidad.usuario.Usuario;
import modelo.sql.CRUD_Sesion;
import modelo.sql.CRUD_Usuario;
import modelo.sql.interface_CRUD.CRUD;

/**
 *
 * @author rodri
 */
public class Servlet_Usuario extends HttpServlet {

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
        processRequest(request, response);

        //REGISTRAR
        String rut = request.getParameter("rut");
        String primerNombre = request.getParameter("primerNombre");
        String segundoNombre = request.getParameter("segundoNombre");
        String paterno = request.getParameter("paterno");
        String materno = request.getParameter("materno");
        String mail = request.getParameter("email");
        String pass1 = request.getParameter("pass1");
        String pass2 = request.getParameter("pass2");
        String mostrarContasena = request.getParameter("mostrarPassword");
        String pedirCambiarContrasena = request.getParameter("pedirPassword");
        String rol = request.getParameter("rol");
        CRUD_Usuario crud_user = null;
        Usuario usuario;
        final String msj = "Usuario Registrado";

        ArrayList listaErrores = new ArrayList();

        if (rut == null || rut.isEmpty() || rut.length() < 10) {
            listaErrores.add("Ingrese un RUT correcto.");
        }
        if (primerNombre == null || primerNombre.isEmpty()) {
            listaErrores.add("Ingrese Primer Nombre");

        }
        if (segundoNombre == null || segundoNombre.isEmpty()) {
            listaErrores.add("Ingrese Segundo Nombre");

        }
        if (paterno == null || paterno.isEmpty()) {
            listaErrores.add("Ingrese Apellido Paterno");

        }
        if (materno == null || materno.isEmpty()) {
            listaErrores.add("Ingrese Apellido Materno");

        }
        if (mail == null || mail.isEmpty() || !mail.matches("^[\\w.%+-]+@[\\w.-]+\\.[a-zA-Z]{2,6}$")) {
            listaErrores.add("Ingrese Email");

        }
        if (pass1 == null || pass1.isEmpty()) {
            listaErrores.add("Ingrese Contraseña");

        }
        if (pass2 == null || pass2.isEmpty()) {
            listaErrores.add("Ingrese Contraseña");

        }
        if (pass1.length() > 8 && pass2.length() > 8) {
            listaErrores.add("El largo debe ser mayor a 8 caracteres");
        }
        if (!pass1.equals(pass2)) {
            listaErrores.add("Las contraseñas no son iguales");
        }
        if (rol == null) {
            listaErrores.add("Ingrese un rol.");
        }

        if (listaErrores.size() > 0) {

            try {
                crud_user = new CRUD_Usuario();

                usuario = new Usuario(0,
                        rut,
                        primerNombre,
                        segundoNombre,
                        paterno,
                        materno,
                        mail, // email
                        pass1,
                        Boolean.parseBoolean(pedirCambiarContrasena), // cambiopassword
                        Integer.parseInt(rol)
                );
                crud_user.crear(usuario);
                if (usuario != null) {

                    System.out.println("servlet_usuario: usuario registrado!");

                    request.setAttribute("mensaje", msj);
                    request.getRequestDispatcher("registrar_usuario.jsp").forward(request, response);
                }

            } catch (Exception e) {

            }
        } else {
            request.setAttribute("errores", listaErrores);
            request.getRequestDispatcher("registrar_usuario.jsp").forward(request, response);
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
