
<%@ page language="java" session="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
    String jspName = request.getServletPath();
    request.getSession().setAttribute("DIRECTORIO_ACTUAL", jspName.substring(1).toUpperCase());
    //System.out.println("NOMBRE DE DIRECTORIO: " + session.getAttribute("DIRECTORIO_ACTUAL"));
%>
<!DOCTYPE html>


<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link href="CSS/fooster.css" rel="stylesheet">
        <%@ include file="JSP_detalles/CDN.jsp" %>
        <!-- incluir encabezado -->
        <%@ include file="JSP_detalles/logo.jsp" %>
        <title>Sistema de gestion - Login</title>

    </head>
    <body class="p-3 m-0 border-0 bd-example m-0 border-0 bg-light">
        <div class="container">
            <div class="row">
                <div class="col">
                    <img src="IMG/logo.png" class="img-fluid rounded float-start" alt="logo" width="100" height="100">
                    <div class="col"> <span class="font-weight-normal"> Liceo Juan Dante Parraguez Arellano</span> </div>
                    <div class="col"> <span class="font-weight-normal">Sistema de Inventario integral</span> </div>

                </div>
            </div>
            <hr>
            <div class="row pt-3">

                <div class="col col-lg-6 p-3">

                    <h1>Bienvenido</h1>

                    <form class="form" action="Sesion" method="post" id="inicio_sesion">
                        <div class="mb-3">
                            <label for="exampleInputEmail1" class="form-label">Usuario</label>
                            <input type="text" name="usuario" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required>
                            <div id="emailHelp" class="form-text"></div>
                        </div>
                        <div class="mb-3">
                            <label for="exampleInputPassword1" class="form-label">contraseña</label>
                            <input type="password" name="contra" class="form-control" id="exampleInputPassword1" required>
                        </div>
                        <div class="mb-1 form-check">
                            <input type="checkbox" class="form-check-input" id="exampleCheck1">
                            <label class="form-check-label" for="exampleCheck1">recordar credenciales</label>

                        </div>
                        <div class=" form-check">
                            <a href="#" onclick="enviarUsuario()" class="a">
                                <label>Recuperar contraseña</label>
                            </a>
                        </div>
                        <div class="mt-4">
                            <button type="submit" class="btn btn-primary">Ingresar</button> 
                        </div>


                    </form>
                </div>

                <!-- CODIGO SOLO SIRVE PARA MOSTRAR MENSAJE -->
                <% if (request.getAttribute("valida") != null && (boolean) request.getAttribute("valida") != true) { %>
                <div class="alert alert-danger" role="alert" id="alerta">
                    <span>Usuario no encontrado</span>
                </div>
                <script src="JS/alerta.js"></script>
                <% }%>
                <% if (request.getAttribute("msj") != null) {%>
                <div class="alert alert-warning" role="alert" id="alerta">
                    <span><%=request.getAttribute("msj")%></span>
                    <script>alert("<%=request.getAttribute("msj")%>");</script>
                </div>
                <script src="JS/alerta.js"></script>
                <% }%>
                <% if (request.getAttribute("ms") != null) {%>
                <% if (request.getAttribute("ms").equals("Contraseña actualizada!")) {%>
                <div class="alert alert-success" role="alert" id="alerta">
                    <span><%=request.getAttribute("ms")%></span>
                    <script>alert("<%=request.getAttribute("ms")%>");</script>
                </div>
                <script src="JS/alerta.js"></script>
                <% } else {%>

                <div class="alert alert-warning" role="alert" id="alerta">
                    <span><%=request.getAttribute("ms")%></span>
                    <script>alert("<%=request.getAttribute("ms")%>");</script>
                </div>
                <script src="JS/alerta.js"></script>

                <% }%>
                <% }%>

            </div>
        </div>
        <script>
                                function enviarUsuario() {
                                    const usuario = document.getElementsByName('usuario')[0].value;
                                    if (usuario) {
                                        window.location.href = 'Sesion?recuperacion=' + encodeURIComponent(usuario);
                                    } else {
                                        alert("Por favor, ingresa tu usuario para recuperar la contraseña.");
                                    }
                                }
        </script>
        <!-- pie de pagina -->
        <%@ include file="JSP_detalles/pie_de_pagina.jsp" %>

    </body>
</html>
