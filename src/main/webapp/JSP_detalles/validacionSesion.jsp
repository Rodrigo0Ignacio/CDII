<%@page import="java.util.List"%>
<%@page import="modelo.sql.permisos.CRUD_Permisos"%>
<%@ page language="java" session="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    // Verificar si la sesión existe
    if (session == null || (session.getAttribute("ROL") == null && session.getAttribute("RUT") == null) ) {
        response.sendRedirect("index.jsp");
        return;
    }
    // Obtener datos de la sesion
    String rut_sesion = String.valueOf(session.getAttribute("RUT"));
    String nombre_sesion = String.valueOf(session.getAttribute("NOMBRE"));
    String rolSesion_sesion = String.valueOf(session.getAttribute("ROL"));
    String web_sesion = String.valueOf(session.getAttribute("DIRECTORIO_ACTUAL"));
    
System.out.println("Session activa: "+rut_sesion+ " " +nombre_sesion+ " " +rolSesion_sesion + " " +web_sesion);

CRUD_Permisos permisos = new CRUD_Permisos();

List<String> listaPermisosSQL = permisos.obtenerPermisosporROL(rolSesion_sesion);

for (Object elem : listaPermisosSQL) {

System.out.println("Elementos: "+ elem);
        
    }


%>