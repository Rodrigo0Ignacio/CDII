<%@ page language="java" session="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    // Verificar si la sesión existe
    if (session == null || (session.getAttribute("ROL") == null && session.getAttribute("RUT") == null) ) {
        response.sendRedirect("index.jsp");
        return;
    }
%>