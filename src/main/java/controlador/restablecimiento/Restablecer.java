package controlador.restablecimiento;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.sql.usuario.CRUD_Usuario;

/**
 *
 * @author rodri
 */
@WebServlet(name = "Restablecer", urlPatterns = {"/Restablecer"})
public class Restablecer extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        String claveProvisoria = request.getParameter("provisoria");
        String password1 = request.getParameter("contra1");
        String password2 = request.getParameter("contra2");
        String email = request.getParameter("email");
        ArrayList<String> errores = new ArrayList();

        if (claveProvisoria == null || claveProvisoria.isEmpty()) {
            errores.add("Ingrese clave enviada a su email.");
        } else if (claveProvisoria.length() != 10) {
            errores.add("La clave debe ser de 10 caracteres.");
        }

        if (email == null || email.isEmpty()) {
            errores.add("Email inválido.");
        }

        if (password1 == null || password1.isEmpty()) {
            errores.add("Campo contraseña obligatorio.");
        } else if (password1.length() < 8) {
            errores.add("Casilla 1: La contraseña debe tener al menos 8 caracteres.");
        }

        if (password2 == null || password2.isEmpty()) {
            errores.add("Campo contraseña obligatorio.");
        } else if (password2.length() < 8) {
            errores.add("Casilla 2: La contraseña debe tener al menos 8 caracteres.");
        }

        if (password1 != null && password2 != null && !password1.equals(password2)) {
            errores.add("Las contraseñas no coinciden.");
        }

        if (errores.size() > 0) {
            request.setAttribute("msj", errores);
            request.getRequestDispatcher("restablecimiento.jsp").forward(request, response);

        } else {
            System.out.println("Clave Provisoria: " + claveProvisoria);
            System.out.println("password1: " + password1);
            System.out.println("password2: " + password2);
            System.out.println("email: " + email);

            try {
                CRUD_Usuario usuario = new CRUD_Usuario();

                if (usuario.actualizarPassword(email, claveProvisoria, password1)) {

                    request.setAttribute("ms", "Contraseña actualizada!");
                    request.getRequestDispatcher("index.jsp").forward(request, response);

                } else {

                    request.setAttribute("ms", "Error al actualizar contraseña");
                    request.getRequestDispatcher("index.jsp").forward(request, response);

                }
            } catch (Exception ex) {
                Logger.getLogger(Restablecer.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
