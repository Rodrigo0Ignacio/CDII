<%@ page language="java" session="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="modelo.sql.usuario.CRUD_Usuario" %>
<%
    String jspName = request.getServletPath();
    request.getSession().setAttribute("DIRECTORIO_ACTUAL", jspName.substring(1).toUpperCase());
    //System.out.println("NOMBRE DE DIRECTORIO: " + session.getAttribute("DIRECTORIO_ACTUAL"));
%>
<%@ include file="JSP_detalles/validacionSesion.jsp" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="CSS/fooster.css" rel="stylesheet">
    <%@ include file="JSP_detalles/CDN.jsp" %>
    <%@ include file="JSP_detalles/logo.jsp" %>
    <title>Sistema de gestion - Home</title>
</head>
<body class="p-3 m-0 border-0 bd-example m-0 border-0 bg-light">
    <%@ include file="JSP_detalles/encabezado.jsp" %>

    <div class="container mt-4">
        <h2>Bienvenido, <%= session.getAttribute("NOMBRE") %></h2>
        <p>Este es el panel principal del sistema de gestión.</p>
    </div>

    <!-- pie de pagina -->
    <%@ include file="JSP_detalles/pie_de_pagina.jsp" %>

    <script src="LIB/bootstrap-5.3.3-dist/js/bootstrap.min.js"></script>
</body>
</html>