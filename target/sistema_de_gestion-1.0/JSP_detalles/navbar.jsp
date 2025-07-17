<%@page import="modelo.sql.inventario.CRUD_BuscarInventario"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" session="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="java.util.List" %>
<%@ page import="modelo.sql.permisos.CRUD_Permisos" %>
<%
    String rutValidacion = (String) session.getAttribute("RUT");
    List<String> listaPermisos = null;
    //System.out.println("RUT " + rutValidacion );
    ArrayList<String> lista = new ArrayList();
    boolean[] permisosActivos;

    if (rutValidacion != null) {
        CRUD_Permisos permisos = new CRUD_Permisos();
        listaPermisos = permisos.obtenerPermisos(rutValidacion);

        // Elimina duplicados de listaPermisos usando un Set
        Set<String> permisosSet = new HashSet<>(listaPermisos);
        listaPermisos = new ArrayList<>(permisosSet);

        // Lista de permisos que se van a verificar
        lista.add("REGISTRAR_USUARIO.JSP"); // index 0
        lista.add("EDITAR_CUENTA.JSP");     // index 1
        lista.add("BUSCAR_USUARIO.JSP");    // index 2
        lista.add("CREAR_INVENTARIO.JSP");  // index 3
        lista.add("BUSCAR_INVENTARIO.JSP"); // index 4
        lista.add("INVENTARIO_DINAMICO.JSP"); // index 5
        lista.add("INGRESO_REQUERIMIENTO.JSP"); // index 6
        lista.add("ESTADO_REQUERIMIENTO.JSP");  // index 7

        permisosActivos = new boolean[lista.size()];

        // Recorre la lista de permisos obtenidos y marca los permisos activos
        for (int i = 0; i < listaPermisos.size(); i++) {
            for (int j = 0; j < lista.size(); j++) {

                if (listaPermisos.get(i).equalsIgnoreCase(lista.get(j))) {
                    permisosActivos[j] = true;
                    //System.out.println("Usuario ROL: " + rutValidacion + " tiene permiso: " + lista.get(j));
                }
            }
        }
        // System.out.println("Paginas totales: " + listaPermisos.size());
    } else {
        // En caso de que rol2 sea null, evitar error al intentar acceder a permisosActivos
        permisosActivos = new boolean[0];
    }


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
            </li>-->

            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Usuario
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                    <% if (permisosActivos[0]) { %>
                    <a class="dropdown-item" href="registrar_usuario.jsp">Registrar usuario</a>
                    <%}%>
                    <%if (permisosActivos[1]) {%><a class="dropdown-item" href="editar_cuenta.jsp">Editar cuenta</a><%}%>
                    <%if (permisosActivos[2]) {%><a class="dropdown-item" href="buscar_usuario.jsp">Buscar cuenta de usuario</a><%}%>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Inventarios
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                    <%if (permisosActivos[3]) {%><a class="dropdown-item" href="crear_inventario.jsp">Crear inventario</a><%}%>
                    <%if (permisosActivos[4]) {%><a class="dropdown-item" href="buscar_inventario.jsp">Editar inventario</a><%}%>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Inventarios Creados
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                    <% if (permisosActivos[5]) { %><a class="dropdown-item" href="Inventario_dinamico.jsp?nombreInventario="><%}%>
                    </a>

                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Informes
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">

                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Requerimientos
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                    <%if (permisosActivos[6]) {%><a class="dropdown-item" href="ingreso_requerimiento.jsp">Ingresar solicitud</a><%}%>
                    <%if (permisosActivos[7]) {%><a class="dropdown-item" href="estado_requerimiento.jsp">Estado de solicitud</a><%}%>
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