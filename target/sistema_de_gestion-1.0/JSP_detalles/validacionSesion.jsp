<%@ page language="java" session="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="modelo.sql.permisos.CRUD_Permisos" %>

<%
    if (session == null) {
        response.sendRedirect("index.jsp");
        return;

    } else {

        // Obtener los atributos de sesión
        String rut = (String) session.getAttribute("RUT");
        String nombre = (String) session.getAttribute("NOMBRE");
        String rol = (String) session.getAttribute("ROL");
        String directorio = (String) session.getAttribute("DIRECTORIO_ACTUAL");

        // Validar que los atributos esenciales existan
        if (rut == null || rol == null || directorio == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        // Validar permisos si no estamos en la página de error de permisos
        if (!"PERMISOS_ERROR.JSP".equalsIgnoreCase(directorio)) {
            try {
                CRUD_Permisos permisos = new CRUD_Permisos();
                List<String> listaPermisos = permisos.obtenerPermisos(rut);

                boolean tienePermiso = listaPermisos.stream()
                        .anyMatch(p -> p.equalsIgnoreCase(directorio));

                if (!tienePermiso) {

                    request.setAttribute("msj", "Nivel de privilegios insuficiente");
                    request.getRequestDispatcher("permisos_error.jsp").forward(request, response);
                    return;
                }

            } catch (Exception e) {
                System.err.println("Error al validar permisos: " + e.getMessage());
                response.sendRedirect("error.jsp");
                return;
            }
        }

    }
%>
