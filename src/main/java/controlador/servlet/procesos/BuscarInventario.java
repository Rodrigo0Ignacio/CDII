/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador.servlet.procesos;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import modelo.sql.CRUD_BuscarInventario;

/**
 *
 * @author Admin_sala
 */
public class BuscarInventario extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private CRUD_BuscarInventario inventario = null;
    private ArrayList<String> encabezados = new ArrayList();
    private ArrayList<String> cuerpo = new ArrayList();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        String nombreInventario = request.getParameter("n_inventario");
        String tabla_editar = request.getParameter("tablaEditar");
        String tabla_eliminar = request.getParameter("tabladelete");

        inventario = new CRUD_BuscarInventario();

        if (tabla_editar != null && tabla_editar.length() > 0) {
            // Manejar la lógica de editar
            response.sendRedirect("buscar_inventario.jsp?"+tabla_editar);
            return; // Salir del método para evitar continuar con la lógica de búsqueda
        } else if (tabla_eliminar != null && tabla_eliminar.length() > 0) {
            // Manejar la lógica de eliminar
            response.sendRedirect("buscar_inventario.jsp?"+tabla_eliminar);
            return; // Salir del método para evitar continuar con la lógica de búsqueda
        }

        if (nombreInventario != null && nombreInventario.length() > 0) {
            
            cuerpo = inventario.BuscaCuerpoInventario(nombreInventario);
            encabezados = inventario.obtenerEncabezados(nombreInventario);
            
            request.setAttribute("cuerpo", cuerpo);
            request.setAttribute("encabezado", encabezados);
            request.getRequestDispatcher("buscar_inventario.jsp").forward(request, response);
        } else {
            // Manejar el caso en el que nombreInventario es null o vacío
            response.sendRedirect("error.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
