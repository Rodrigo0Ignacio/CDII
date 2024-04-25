/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet_validacion;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import modelo.sql.CRUD_Usuario;

/**
 *
 * @author Rodrigo
 */
public class ValidacionSesion extends HttpServlet {
    


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
        
        CRUD_Usuario crud = new CRUD_Usuario();

        String usuario = request.getParameter("usuario");
        String contrasenia = request.getParameter("contra");
        
        
        if(crud.validar_credenciales(usuario, contrasenia)){
            System.out.println("Usuario Registrado");
            response.sendRedirect("Home.jsp");
        }else{
             response.sendRedirect("index.jsp");
            System.out.println("Usuario no registrado");
        }
       
        
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
