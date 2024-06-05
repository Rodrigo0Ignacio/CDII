<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="modelo.sql.CRUD_Usuario" %>
<%
CRUD_Usuario c = new CRUD_Usuario();
ArrayList<String> listaInventarios = c.listarNombres_Inventarios(); // Asumiendo que este método devuelve una lista de nombres de inventarios
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="LIB/bootstrap-5.3.3-dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="CSS/fooster.css" rel="stylesheet">
        <link rel="shortcut icon" href="IMG/logo.ico" />
        <title>Sistema de gestion - Home</title>
    </head>
    <body class="p-3 m-0 border-0 bd-example m-0 border-0 bg-light">
        <script src="LIB/bootstrap-5.3.3-dist/js/bootstrap.min.js"></script>
        <div class="container">
            <div class="row align-items-start">
                <div class="col">
                    <img src="IMG/logo.png" class="img-fluid rounded float-start" alt="logo" width="100" height="100">
                    <div class="col"> <span class="font-weight-normal"> Liceo Juan Dante Parraguez Arellano</span> </div>
                    <div class="col"> <span class="font-weight-normal">Sistema de Inventario integral</span> </div>
                </div>
                <div class="col-3 align-items-ent align-self-center fs-5 fw-bold">
                    <div class="col"> <span class="font-weight-normal">Bienvenido: </span><span>Nombre Usuario</span> </div>
                </div>
            </div>
            <hr>
            <!--CUERPO DE PAGINA WEB-->
            <div class="row"> 
                <div class="col">
                    <nav class="navbar navbar-expand-lg navbar-light bg-light">
                        <a class="navbar-brand" href="Home.jsp">Inicio</a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarNavDropdown">
                            <ul class="navbar-nav">
                                <li class="nav-item active">
                                    <a class="nav-link" href="#">Registros</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Gestión de Usuarios</a>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Gestion de inventario
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                        <a class="dropdown-item" href="crear_inventario.jsp">Crear Inventario</a>
                                        <a class="dropdown-item" href="buscar_inventario.jsp">Buscar Inventario</a>
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Inventarios Creados
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                        <% if (listaInventarios != null && !listaInventarios.isEmpty()) { 
                                            for (String item : listaInventarios) { %>
                                                <a class="dropdown-item" href="#"><%= item %></a>
                                        <% } } %>
                                    </div>
                                </li>
                                <!-- Botón para cerrar sesión -->
                                <button class="btn btn-outline-danger d-lg-none ml-auto" type="submit">Cerrar sesión</button>
                            </ul>
                        </div>
                        <!-- Botón para cerrar sesión en resoluciones large -->
                        <button class="btn btn-outline-danger d-none d-lg-inline-block" type="submit">Cerrar sesión</button>
                    </nav>
                </div>
            </div>
            <!--FIN CUERPO-->
        </div>
        <footer class="bg-body-tertiary text-center text-lg-start">
            <!-- Copyright -->
            <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.05);">
                © 2024 Copyright: <a class="text-body" href="https://www.liceojuandanteparraguez.cl/">Liceo Juan Dante Parraguez Arellano</a>
            </div>
            <!-- Copyright -->
        </footer>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script> 
        <script src="LIB/bootstrap-5.3.3-dist/js/bootstrap.bundle.min.js"></script>
        <script src="LIB/bootstrap-5.3.3-dist/js/bootstrap.min.js"></script>
    </body>
</html>