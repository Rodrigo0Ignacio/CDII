<%-- 
    Document   : usuario
    Created on : 10-04-2024, 1:17:00 p. m.
    Author     : Admin_sala
--%>
<%@ page language="java" session="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String jspName = request.getServletPath(); // Obtiene el nombre del archivo JSP

    request.getSession().setAttribute("DIRECTORIO_ACTUAL", jspName.substring(1, jspName.length()).toUpperCase());
    
    System.out.println("NOMBRE DE DIRECTORIO: " + session.getAttribute("DIRECTORIO_ACTUAL"));

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
