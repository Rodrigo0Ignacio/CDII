/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador.servlet.validaciones;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import modelo.sql.CRUD_BuscarInventario;
import modelo.sql.CRUD_Usuario;

/**
 *
 * @author Admin_sala
 */
public class Sesion extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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

       // CRUD_Usuario crud = new CRUD_Usuario();
        
       

        String usuario = request.getParameter("usuario");
        String contrasenia = request.getParameter("contra");
/*
        if (crud.validar_credenciales(usuario, contrasenia)) {
            
         //  request.setAttribute("listaInventario",crud.listarNombres_Inventarios());
            request.getRequestDispatcher("Home.jsp").forward(request, response);
            
            
        } else {
            request.setAttribute("valida", false);
            request.getRequestDispatcher("index.jsp").forward(request, response);

        }*/

    }



    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
