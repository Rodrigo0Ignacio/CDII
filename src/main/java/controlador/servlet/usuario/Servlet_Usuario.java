package controlador.servlet.usuario;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import modelo.entidad.usuario.Usuario;
import modelo.sql.usuario.CRUD_Usuario;

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
        String stringrol = request.getParameter("rol");

        HttpSession sesion = request.getSession(false);
        String directorio = (String) sesion.getAttribute("DIRECTORIO_ACTUAL");
        Object rolObj = sesion.getAttribute("ROL");
        int introl = 0;

        if (rolObj != null) {
            try {
                introl = Integer.parseInt(rolObj.toString());
            } catch (NumberFormatException e) {
                System.out.println("Error de ROL: " + e);
            }
        }

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
        if (pass1 != null && pass1.length() < 8 || pass2 != null && pass2.length() < 8) {
            listaErrores.add("El largo de la contraseña debe ser mayor a 8 caracteres.");
        }
        if (pass1 != null && pass2 != null && !pass1.equals(pass2)) {
            listaErrores.add("Las contraseñas no son iguales.");
        }

        // Validación del rol solo si no viene de editar cuenta
        if (!"EDITAR_CUENTA.JSP".equalsIgnoreCase(directorio)) {
            if (stringrol == null || stringrol.isEmpty() || stringrol.equalsIgnoreCase("Seleccione un rol")) {
                listaErrores.add("Seleccione un rol válido.");
            }
        }

        Usuario usuario = null;

        // Validación completa antes de construir el objeto Usuario
        if (listaErrores.isEmpty()) {
            try {
                CRUD_Usuario crud_user = new CRUD_Usuario();

                if (stringrol != null && !stringrol.isEmpty() && stringrol.matches("\\d+")) {
                    usuario = new Usuario(
                            0, rut, primerNombre, segundoNombre, paterno, materno,
                            mail, crud_user.obtenerFechaActual(), pass1, mostrarContrasena,
                            Integer.parseInt(stringrol)
                    );
                } else if (introl != 0) {
                    usuario = new Usuario(
                            0, rut, primerNombre, segundoNombre, paterno, materno,
                            mail, crud_user.obtenerFechaActual(), pass1, mostrarContrasena,
                            introl
                    );
                } else {
                    listaErrores.add("Rol no válido.");
                }

                if (usuario != null) {
                    if ("EDITAR_CUENTA.JSP".equalsIgnoreCase(directorio)) {
                        crud_user.actualizar(usuario, String.valueOf(crud_user.buscarID(rut)));
                        request.setAttribute("mensaje", "Datos Actualizados Exitosamente");
                        request.getRequestDispatcher("editar_cuenta.jsp").forward(request, response);
                    } else {
                        crud_user.crear(usuario);
                        request.setAttribute("mensaje", "Usuario Registrado");
                        request.getRequestDispatcher("registrar_usuario.jsp").forward(request, response);
                    }
                }

            } catch (Exception e) {
                listaErrores.add("Error al procesar el usuario: " + e.getMessage());
                e.printStackTrace();
            }
        }

        // Si hubo errores, reenviar con los mensajes
        if (!listaErrores.isEmpty()) {
            
            if ("EDITAR_CUENTA.JSP".equalsIgnoreCase(directorio)) {
                request.setAttribute("errores", listaErrores);
                request.getRequestDispatcher("editar_cuenta.jsp").forward(request, response);
            } else {
                request.setAttribute("errores", listaErrores);
                request.getRequestDispatcher("registrar_usuario.jsp").forward(request, response);
            }

        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
