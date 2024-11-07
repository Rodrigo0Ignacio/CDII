<%@ page language="java" session="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    

%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="Home.jsp">Inicio</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
        <ul class="navbar-nav">
            <!--
            <li class="nav-item active">
                <a class="nav-link" href="#">Registros</a>
            </li>
            -->
           <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Gestion de Usuario
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item" href="registrar_usuario.jsp">Registrar</a>
                    <a class="dropdown-item" href="editar_usuario.jsp">Editar</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Gestion de inventario
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item" href="crear_inventario.jsp">Crear Inventario</a>
                    <a class="dropdown-item" href="buscar_inventario.jsp">Editar Inventario</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Inventarios Creados
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                    <% /* Si hay inventarios, los mostramos aquí */ %>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Matricula
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item" href="matricular.jsp">Matricular</a>
                    <a class="dropdown-item" href="editar_matricula.jsp">Editar Matricula</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Informes
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item" href="">Matricula</a>
                    <a class="dropdown-item" href="">Inventario</a>
                </div>
            </li>
            <!-- Botón para cerrar sesión -->
            <form action="CerrarSesion" method="post">
                <button class="btn btn-outline-danger d-lg-none ml-auto" type="submit">Cerrar sesión</button>
            </form>
        </ul>
    </div>
    <!-- Botón para cerrar sesión en resoluciones large -->
    <form action="CerrarSesion" method="post">
        <button class="btn btn-outline-danger d-none d-lg-inline-block" type="submit">Cerrar sesión</button>
    </form>
</nav>