<%@ page language="java" session="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="modelo.sql.usuario.CRUD_Usuario" %>
<%@ include file="JSP_detalles/validacionSesion.jsp" %>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <%@ include file="JSP_detalles/CDN.jsp" %>
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
                <h2>Editar Datos</h2>
                <br>
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">RUT <span class="text-danger">*</span></label>
                    <input disabled name="rut" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
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
                    <label for="inputPassword1" class="form-label">Contraseña <span class="text-danger">*</span></label>
                    <input name="pass1" type="password" id="inputPassword1" class="form-control" aria-describedby="passwordHelpBlock" required="true">
                    <div id="passwordHelpBlock" class="form-text">
                        La contraseña debe ser con una longitud máxima de 10 caracteres.
                    </div>
                </div>

                <div class="mb-3">
                    <label for="inputPassword2" class="form-label">Repetir contraseña <span class="text-danger">*</span></label>
                    <input name="pass2" type="password" id="inputPassword2" class="form-control" aria-describedby="passwordHelpBlock" required="true">
                </div>

                <div class="mb-3">
                    <input type="checkbox" class="form-check-input" id="exampleCheck1" onclick="mostrarContrasena()">
                    <label class="form-check-label" for="exampleCheck1">Mostrar contraseña</label>
                </div>

                <script>
                    function mostrarContrasena() {
                        var pass1 = document.getElementById("inputPassword1");
                        var pass2 = document.getElementById("inputPassword2");
                        if (document.getElementById("exampleCheck1").checked) {
                            pass1.type = "text";
                            pass2.type = "text";
                        } else {
                            pass1.type = "password";
                            pass2.type = "password";
                        }
                    }
                </script>

                <div class="mb-5">
                    <br>
                    <button type="submit" class="btn btn-primary">Guardar Datos</button>
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
    </body>
</html>
