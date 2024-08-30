<%-- 
    Document   : Inventario
    Created on : 10-04-2024, 1:10:08 p. m.
    Author     : Admin_sala
--%>

<%@ page language="java" session="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        <title>Sistema de gestion - Inventario</title>

    </head>
    <body class="p-3 m-0 border-0 bd-example m-0 border-0 bg-light">
        <script src="LIB/bootstrap-5.3.3-dist/js/bootstrap.min.js"></script>
         <!-- incluir encabezado -->
        <%@ include file="JSP_detalles/encabezado.jsp" %>
            <!--inicio de pagina -->
            <div class="row">
                <h2 class="m-3">Edicion de Encabezados</h2>
                <div class="col col-lg mt-3  rounded">
                    <div class="col">
                         <table class="table m-2 border">
                            <thead class="table-active">
                                <tr>
                                    <th>Nro</th>
                                    <th>Creador</th>
                                    <th style="width: 300px;">Nombre Inventario</th>
                                    <th style="width: 300px;">Guardar cambios</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="border">
                                    <td>1</td>
                                    <td>John</td>
                                    <td><input type="text" class="form-control" id="" aria-describedby="" placeholder=""></td>
                                    <td>
                                        <a class="btn btn-warning" href="editar_inventario.jsp">Guardar</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>Jane</td>
                                    <td><input type="text" class="form-control" id="" aria-describedby="" placeholder=""></td>
                                    <td>
                                        <a class="btn btn-warning" href="editar_inventario.jsp">Guardar</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>3</td>
                                    <td>Mike</td>
                                    <td><input type="text" class="form-control" id="" aria-describedby="" placeholder=""></td>
                                    <td>
                                        <a class="btn btn-warning" href="editar_inventario.jsp">Guardar</a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                       
                    </div>
                </div>

            </div>

            <!--FIN CUERPO-->
        </div>
        <!<!-- pie de pagina -->
        <%@ include file="JSP_detalles/pie_de_pagina.jsp" %>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script> 
        <script src="LIB/bootstrap-5.3.3-dist/js/bootstrap.bundle.min.js"></script>
        <script src="LIB/bootstrap-5.3.3-dist/js/bootstrap.min.js"></script>
    </body>
</html>