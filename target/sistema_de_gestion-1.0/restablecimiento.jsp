
<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
    String jspName = request.getServletPath();
    request.getSession().setAttribute("DIRECTORIO_ACTUAL", jspName.substring(1).toUpperCase());

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
        <title>Sistema de gestion - Recuperar Contrasena</title>

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

                    <h1>Restablecimiento de contraseña</h1>

                    <form class="form" action="Restablecer" method="post" id="restablecimientoContrasena">


                        <div class="mb-3 mt-5">
                            <label for="colFormLabelLg" class=" col-form-label col-form-label-lg">Clave Provisoria</label>
                            <input type="text" name="provisoria" class="form-control form-control-lg" id="colFormLabelLg" placeholder="Ingrese clave provisoria" required>
                            <input type="hidden" name="email" value="<%=request.getParameter("email")%>" class="form-control form-control-lg" id="colFormLabelLg">
                        </div>
                        <div class="mb-3">
                            <label for="exampleInputPassword1" class="form-label">Ingrese nueva contraseña</label>
                            <input type="password" name="contra1" class="form-control" id="inputPassword1" required>
                        </div>
                        <div class="mb-3">
                            <label for="exampleInputPassword1" class="form-label">Vuelva a ingresar la contraseña</label>
                            <input type="password" name="contra2" class="form-control" id="inputPassword2" required>
                        </div>
                        <div class="mb-3">
                            <input type="checkbox" class="form-check-input" id="exampleCheck1" onclick="mostrarContrasena()">
                            <label class="form-check-label" for="exampleCheck1">Mostrar contraseña</label>
                        </div>

                        <div class="mt-4">
                            <button type="submit" class="btn btn-primary">Actualizar</button> 
                        </div>


                    </form>
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

                <%
                    // Comprobamos si hay un mensaje de errores
                    if (request.getAttribute("msj") != null) {
                        // Recuperamos el atributo 'msj' que es una lista de errores
                        ArrayList<String> errores = (ArrayList<String>) request.getAttribute("msj");

                        // Si hay errores, los mostramos
                        if (!errores.isEmpty()) {
                %>
                <!-- Mostrar la lista de errores en una alerta de tipo warning -->
                <div class="alert alert-danger" role="alert" id="alerta">
                    <ul>
                        <%
                            // Recorremos la lista de errores y los mostramos
                            for (String error : errores) {
                        %>
                        <li><%= error%></li>
                            <%
                                }
                            %>
                    </ul>
                </div>
                <script src="JS/alerta.js"></script>
                <%
                        }
                    }
                %>


            </div>
        </div>

        <!-- pie de pagina -->
        <%@ include file="JSP_detalles/pie_de_pagina.jsp" %>

    </body>
</html>