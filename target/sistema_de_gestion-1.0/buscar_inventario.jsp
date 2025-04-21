<%-- 
    Document   : Inventario
    Created on : 10-04-2024, 1:10:08 p. m.
    Author     : Admin_sala
--%>

<%@ page language="java" session="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%
    String jspName = request.getServletPath();
    request.getSession().setAttribute("DIRECTORIO_ACTUAL", jspName.substring(1).toUpperCase());
    //System.out.println("NOMBRE DE DIRECTORIO: " + session.getAttribute("DIRECTORIO_ACTUAL"));
%>
<%@ include file="JSP_detalles/validacionSesion.jsp" %>
<%
    // Obtener los ArrayList enviados desde el servlet
    ArrayList<String> cabezera = (ArrayList<String>)request.getAttribute("encabezado");
    ArrayList<String> cuerpo = (ArrayList<String>)request.getAttribute("cuerpo");
    boolean estado = false;
    
    // Verificar si la sesión existe
    /*
    if (session == null || (session.getAttribute("ROL") == null && session.getAttribute("RUT") == null) ) {
        response.sendRedirect("index.jsp");
        return;
    }/*/

    

    /*
    // Verificar si las listas no son null y están vacías
    if ((cabezera == null || cabezera.isEmpty()) && (cuerpo == null || cuerpo.isEmpty())) {
        out.println("<p>Ambas listas están vacías</p>");
        estado = false;
        
    } else {
        if (cabezera != null && !cabezera.isEmpty()) {
            out.println("<p>La lista 'cabezera' contiene: " + cabezera + "</p>");
             estado = false;
        }
        if (cuerpo != null && !cuerpo.isEmpty()) {
            out.println("<p>La lista 'cuerpo' contiene: " + cuerpo + "</p>");
             estado = true;
        }
    }
*/
%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
       
         <!-- incluir encabezado -->
        <%@ include file="JSP_detalles/logo.jsp" %>
        <%@ include file="JSP_detalles/CDN.jsp" %>
        <title>Sistema de gestion - Inventario</title>

    </head>
    <body class="p-3 m-0 border-0 bd-example m-0 border-0 bg-light">
         <!-- incluir encabezado -->
        <%@ include file="JSP_detalles/encabezado.jsp" %>

            <div class="container">
                <div class="row">
                    <div class="col ">
                        <form id="buscarInventarioForm" method="get" action="BuscarInventario" class="form">
                            <div class="m-2">
                                <label for="Name" class="h3">Buscar Inventario</label>

                            </div>
                            <div id="" class="d-flex flex-row align-items-center mb-2">
                                <input type="text" name="n_inventario" class="form-control me-2" placeholder="Ingresa el nombre del inventario a buscar">
                                <button class="btn btn-primary">Buscar</button>
                            </div>
                        </form>

                    </div>

                    <div class="w-100"></div>

                    <div class="col ">
                        <table class="table m-2 border">
                            <thead class="table-active">
                                <tr>
                                    <% if(cabezera != null && !cabezera.isEmpty()) { %>
                                    <% for(int i = 0; i < cabezera.size(); i++) { %>
                                    <th><%= cabezera.get(i) %></th>
                                        <% } %>
                                    <th>Acciones</th>

                                    <% } %>                                    
                                </tr>
                            </thead>
                            <tbody>
                                <% if (cuerpo != null && !cuerpo.isEmpty()) { %>
                                <% for (int j = 0; j < cuerpo.size(); j = j + cabezera.size()) { %>
                                <tr>
                                    <% for (int k = 0; k < cabezera.size(); k++) { %>
                                    <td><%= cuerpo.get(j + k) %></td>
                                    <% } %>
                                    <td>
                                        <a class="btn btn-warning" href="BuscarInventario?tablaEditar=<%= cuerpo.get(j) %>">Editar</a>
                                        <a class="btn btn-danger" href="BuscarInventario?tabladelete=<%= cuerpo.get(j) %>">Eliminar</a>
                                    </td>
                                </tr>
                                <% } %>
                                <% } %>
                            </tbody>
                        </table>
                    </div>

                </div>
            </div>


            <!--FIN CUERPO-->
        </div>
        <!<!-- pie de pagina -->
        <%@ include file="JSP_detalles/pie_de_pagina.jsp" %>
    </body>
</html>