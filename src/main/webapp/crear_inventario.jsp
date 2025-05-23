
<%@ page language="java" session="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        <!-- incluir encabezado -->
        <%@ include file="JSP_detalles/logo.jsp" %>
        <title>Sistema de gestion - Inventario</title>

    </head>
    <body class="p-3 m-0 border-0 bd-example m-0 border-0 bg-light">
        <script src="LIB/bootstrap-5.3.3-dist/js/bootstrap.min.js"></script>

        <!-- incluir encabezado -->
        <%@ include file="JSP_detalles/encabezado.jsp" %>
        <div class="container">

            <div class="row">
                <div class="col col-lg mt-3 border rounded">
                    <div class="col">
                        <form id="inventoryForm" method="post" onsubmit="return false;">
                            <h2> Creación de inventario</h2>
                            <div class="mb-3 col">
                                <label for="inventoryName" class="form-label">Nombre inventario</label>
                                <input type="text" class="form-control" id="inventoryName" aria-describedby="emailHelp">

                                <div id="emailHelp" class="form-text">Ingresa el nombre del inventario</div>
                            </div>
                            <div class="mb-3border rounded">
                                <h3 class="">Encabezados de tabla</h3>
                                <button type="button" class="btn btn-primary" onclick="addHeader()">Agregar encabezado</button>
                                <div id="headerContainer" class="m-3">
                                    <!-- Aquí se agregarán dinámicamente los encabezados -->
                                </div>
                            </div>
                            <div class="border rounded mb-3">
                                <div class="form-check m-2 ">
                                    <input class="form-check-input" type="checkbox" value="" id="autoIdentifiers" checked>
                                    <label class="form-check-label" for="autoIdentifiers">
                                        Crear identificadores automáticamente
                                    </label>
                                </div>
                                <div class="form-check m-2">
                                    <input class="form-check-input" type="checkbox" value="" id="visibility" checked>
                                    <label class="form-check-label" for="visibility">
                                        Visibilidad para todos los usuarios
                                    </label>
                                </div>
                            </div>
                            <div class="m-3">
                                <button type="button" class="btn btn-primary" onclick="sendFormDataToServlet()">Crear Inventario</button>
                            </div>
                        </form>
                    </div>
                </div>

            </div> 
        </div>

        <!--FIN CUERPO-->
        <!<!-- pie de pagina -->
        <%@ include file="JSP_detalles/pie_de_pagina.jsp" %>
        <script src="JS/agregarEncabezado.js"></script>
    </body>
</html>
