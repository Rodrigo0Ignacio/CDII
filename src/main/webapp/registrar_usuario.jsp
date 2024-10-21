<%@ page language="java" session="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="modelo.sql.CRUD_Usuario" %>
<%@ include file="JSP_detalles/validacionSesion.jsp" %>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="LIB/bootstrap-5.3.3-dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="CSS/fooster.css" rel="stylesheet">
        <!-- incluir encabezado -->
        <%@ include file="JSP_detalles/logo.jsp" %>
        <title>Sistema de gestion - Home</title>
    </head>
    <body class="p-3 m-0 border-0 bd-example m-0 border-0 bg-light">
        <script src="LIB/bootstrap-5.3.3-dist/js/bootstrap.min.js"></script>
        <!-- incluir encabezado -->
        <%@ include file="JSP_detalles/encabezado.jsp" %>
        <div class="container">
            <br>
            <form class="form col col-lg-8" action="Servlet_Usuario" method="post" id="form_registro_usuario">
                <h2>Registrar Usuario</h2>
                <br>
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">RUT <span class="text-danger">*</span></label>
                    <input name="rut" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="true">
                </div>
                <div class="mb-3">
                    <div class="row">
                        <div class="col">
                            <label for="exampleInputEmail1" class="form-label">Primer Nombre <span class="text-danger">*</span></label>
                            <input name="primerNombre" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="true">
                        </div>
                        <div class="col">
                            <label for="exampleInputEmail1" class="form-label">Segundo Nombre <span class="text-danger">*</span></label>
                            <input name="segundoNombre" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="true">
                        </div>
                    </div>
                </div>
                <div class="mb-3">
                    <div class="row">
                        <div class="col">
                            <label for="exampleInputEmail1" class="form-label">Apellido Paterno <span class="text-danger">*</span></label>
                            <input name="paterno" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="true">
                        </div>
                        <div class="col">
                            <label for="exampleInputEmail1" class="form-label">Apellido Materno <span class="text-danger">*</span></label>
                            <input name="materno" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="true">
                        </div>
                    </div>
                </div>
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Email <span class="text-danger">*</span></label>
                    <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="true">
                </div>
                <div class="mb-3">
                    <label for="inputPassword5" class="form-label">Contraseña <span class="text-danger">*</span></label>
                    <input name="pass1" type="password" id="inputPassword5" class="form-control" aria-describedby="passwordHelpBlock" required="true">
                    <div id="passwordHelpBlock" class="form-text">
                        La contraseña debe ser con una longitud maxima de 10 caracterestes.
                    </div>
                </div>
                <div class="mb-3">
                    <label for="inputPassword5" class="form-label">Repetir contraseña <span class="text-danger">*</span></label>
                    <input name="pass2" type="password" id="inputPassword5" class="form-control" aria-describedby="passwordHelpBlock" required="true">
                </div>
                <div class="mb-3">
                    <input type="checkbox" class="form-check-input" id="exampleCheck1">
                    <label name="mostrarPassword" class="form-check-label" for="exampleCheck1">Mostrar contraseña</label>
                </div>
                <div class="mb-3">
                    <input type="checkbox" class="form-check-input" id="exampleCheck1">
                    <label name="pedirPassword" class="form-check-label" for="exampleCheck1">Pedir cambiar contraseña</label>
                </div>
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label"><span class="text-nowrap">Seleccione el ROL</span><span class="text-danger">*</span></label>
                    <select name="rol" class="form-select" aria-label="Default select example" required="true">
                        <option selected>Seleccione el ROL</option>
                        <option value="5">Administrador</option>
                        <option value="6">Digitalizador</option>
                        <option value="7">Usuario Estandar</option>
                        <option value="9">Inspector</option>
                        <option value="8">Lector</option>
                    </select>
                </div>
                <div class="mb-5">
                    <br>
                    <button type="submit" class="btn btn-primary">Registrar Usuario</button>
                </div>
            </form>
            <!-- Mensajes de alerta -->
            <% if (request.getAttribute("mensaje") != null) {%>
            <div class="alert alert-success" role="alert" id="alerta-exito">
                <span><%= request.getAttribute("mensaje")%></span>
                <script>
            alert("<%= request.getAttribute("mensaje")%>");
                </script>
            </div>
            <% } %>
// por terminar
            <%
                // Verificamos si el atributo "errores" no es nulo y es de tipo ArrayList
                if (request.getAttribute("errores") != null && request.getAttribute("errores") instanceof java.util.ArrayList) {
                    java.util.ArrayList<String> errores = (java.util.ArrayList<String>) request.getAttribute("errores");

                    if (!errores.isEmpty()) {
            %>
            <div class="alert alert-danger" role="alert" id="alerta-error">
                <ul>
                    <%
                        // Recorremos el ArrayList y mostramos cada error en una lista
                        for (String error : errores) {
                    %>
                    <li><%= error%></li>
                        <% } %>
                </ul>
            </div>
            <%
                    }
                }
            %>

        </div>


        <!<!-- pie de pagina -->
        <%@ include file="JSP_detalles/pie_de_pagina.jsp" %>
        <script src="JS/alerta.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script> 
        <script src="LIB/bootstrap-5.3.3-dist/js/bootstrap.bundle.min.js"></script>
        <script src="LIB/bootstrap-5.3.3-dist/js/bootstrap.min.js"></script>
    </body>
</html>