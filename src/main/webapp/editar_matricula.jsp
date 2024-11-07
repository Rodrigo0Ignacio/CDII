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
        <%@ include file="JSP_detalles/logo.jsp" %>
        
        <title>Sistema de gestion - Matricular</title>
    </head>
    <body class="p-3 m-0 border-0 bd-example m-0 border-0 bg-light">
        <script src="LIB/bootstrap-5.3.3-dist/js/bootstrap.min.js"></script>
        
        <!-- Encabezado -->
        <%@ include file="JSP_detalles/encabezado.jsp" %>
    <div class="container mt-3">
    <!-- Dropdown de Búsqueda -->
    <div class="dropdown">
        <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownBusqueda" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Búsqueda
        </button>
        <div class="dropdown-menu" aria-labelledby="dropdownBusqueda">
            <a class="dropdown-item" href="">Buscar por nombre</a>
            <a class="dropdown-item" href="">Buscar por RUT</a>
            <a class="dropdown-item" href="">Buscar por curso</a>
        </div>
    </div>
</div>

        <!-- Tabla de datos -->
        <div class="container mt-5">
            <h3>Datos del alumno</h3>
            <table class="table table-bordered text-center">
                <thead>
                    <tr>
                        <th>Curso</th>
                        <th>Nombre</th>
                        <th>Rut</th>
                        <th>Editar</th>
                        <th>Ver detalles</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        // Ejemplo de cómo iterar y mostrar datos desde una lista llamada "listaAlumnos"
                        // List<Alumno> listaAlumnos = (List<Alumno>) request.getAttribute("listaAlumnos");
                        // for (Alumno alumno : listaAlumnos) {
                    %>
                    <tr>
                        <td><%= "Curso Ejemplo" %></td>
                        <td><%= "Nombre Ejemplo" %></td>
                        <td><%= "Rut Ejemplo" %></td>
                        <td>
                            <button class="btn btn-primary btn-sm">
                                <i class="bi bi-pencil-square"></i>
                            </button>
                        </td>
                        <td>
                            <button class="btn btn-success btn-sm">
                                <i class="bi bi-eye"></i>
                            </button>
                        </td>
                    </tr>
                    <% 
                        // } 
                    %>
                </tbody>
            </table>
        </div>

       
        
        <!-- Footer -->
        <%@ include file="JSP_detalles/pie_de_pagina.jsp" %>
        
        <!-- Bootstrap y Bootstrap Icons -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script> 
    </body>
</html>
