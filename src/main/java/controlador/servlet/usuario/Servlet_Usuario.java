package controlador.servlet.usuario;

import java.io.IOException;
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

        String rut = request.getParameter("rut");
        String primerNombre = request.getParameter("primerNombre");
        String segundoNombre = request.getParameter("segundoNombre");
        String paterno = request.getParameter("paterno");
        String materno = request.getParameter("materno");
        String mail = request.getParameter("email");
        String pass1 = request.getParameter("pass1");
        String pass2 = request.getParameter("pass2");
        Boolean mostrarContrasena = request.getParameter("pedirPassword") != null;
        String rol = request.getParameter("rol");

        ArrayList<String> listaErrores = new ArrayList<>();

        // Validación de campos
        if (rut == null || rut.isEmpty() || rut.length() < 10) {
            listaErrores.add("Ingrese un RUT correcto.");
        }
        if (primerNombre == null || primerNombre.isEmpty()) {
            listaErrores.add("Ingrese Primer Nombre.");
        }
        if (segundoNombre == null || segundoNombre.isEmpty()) {
            listaErrores.add("Ingrese Segundo Nombre.");
        }
        if (paterno == null || paterno.isEmpty()) {
            listaErrores.add("Ingrese Apellido Paterno.");
        }
        if (materno == null || materno.isEmpty()) {
            listaErrores.add("Ingrese Apellido Materno.");
        }
        if (mail == null || mail.isEmpty() || !mail.matches("^[\\w.%+-]+@[\\w.-]+\\.[a-zA-Z]{2,6}$")) {
            listaErrores.add("Ingrese un Email válido.");
        }
        if (pass1 == null || pass1.isEmpty()) {
            listaErrores.add("Ingrese Contraseña.");
        }
        if (pass2 == null || pass2.isEmpty()) {
            listaErrores.add("Confirme la Contraseña.");
        }
        if (pass1.length() < 8 || pass2.length() < 8) {
            listaErrores.add("El largo de la contraseña debe ser mayor a 8 caracteres.");
        }
        if (!pass1.equals(pass2)) {
            listaErrores.add("Las contraseñas no son iguales.");
        }
        if (rol == null || rol.isEmpty() || rol.equalsIgnoreCase("Seleccione un rol")) {
            listaErrores.add("Seleccione un rol válido.");
        }

        // Verificar si hay errores
        if (listaErrores.isEmpty()) {
            try {
                CRUD_Usuario crud_user = new CRUD_Usuario();
                Usuario usuario = new Usuario(
                        0,
                        rut,
                        primerNombre,
                        segundoNombre,
                        paterno,
                        materno,
                        mail,
                        crud_user.obtenerFechaActual(),
                        pass1,
                        mostrarContrasena,
                        Integer.parseInt(rol)
                );

                crud_user.crear(usuario);
                System.out.println("servlet_usuario: usuario registrado!");

                // Mensaje de éxito
                request.setAttribute("mensaje", "Usuario Registrado");
                request.getRequestDispatcher("registrar_usuario.jsp").forward(request, response);

            } catch (Exception e) {
                // Manejo de excepciones
                listaErrores.add("Error al registrar el usuario: " + e.getMessage());
                e.printStackTrace();
            }
        }

        // Redirigir a la vista con errores si los hay
        if (!listaErrores.isEmpty()) {
            request.setAttribute("errores", listaErrores);
            request.getRequestDispatcher("registrar_usuario.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
