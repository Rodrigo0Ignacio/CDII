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
        <!-- incluir encabezado -->
        <%@ include file="JSP_detalles/logo.jsp" %>
        <title>Sistema de gestion - Home</title>
    </head>
    <body class="p-3 m-0 border-0 bd-example m-0 border-0 bg-light">
        <script src="LIB/bootstrap-5.3.3-dist/js/bootstrap.min.js"></script>
        <!-- incluir encabezado -->
        <%@ include file="JSP_detalles/encabezado.jsp" %>
        <div class="container">
            <br>
            <form class="form col col-lg-8" action="Registro_Usuario" method="post" id="form_registro_usuario">
                <h2>Registrar Usuario</h2>
                <br>
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">RUT <span class="text-danger">*</span></label>
                    <input type="text" name="rut" class="form-control" id="input_rut" aria-describedby="emailHelp" placeholder="Ingrese RUT sin puntos" required="true">
                </div>
                <div class="mb-3">
                    <div class="row">
                        <div class="col">
                            <label for="exampleInputEmail1" class="form-label">Primer Nombre <span class="text-danger">*</span></label>
                            <input type="text" name="primerNombre" class="form-control" id="primerNombre" aria-describedby="emailHelp" required="true">
                        </div>
                        <div class="col">
                            <label for="exampleInputEmail1" class="form-label">Segundo Nombre <span class="text-danger">*</span></label>
                            <input type="text" name="segundoNombre" class="form-control" id="segundoNombre" aria-describedby="emailHelp" required="true">
                        </div>
                    </div>
                </div>
                <div class="mb-3">
                    <div class="row">
                        <div class="col">
                            <label for="exampleInputEmail1" class="form-label">Apellido Paterno <span class="text-danger">*</span></label>
                            <input type="text" name="apePaterno" class="form-control" id="apePaterno" aria-describedby="emailHelp" required="true">
                        </div>
                        <div class="col">
                            <label for="exampleInputEmail1" class="form-label">Apellido Materno <span class="text-danger">*</span></label>
                            <input type="text" name="apeMaterno" class="form-control" id="apeMaterno" aria-describedby="emailHelp" required="true">
                        </div>
                    </div>
                </div>
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Email <span class="text-danger">*</span></label>
                    <input type="email" name="email" class="form-control" id="email" aria-describedby="emailHelp" required="true">
                </div>
                <div class="mb-3">
                    <label for="inputPassword5" class="form-label">Contraseña <span class="text-danger">*</span></label>
                    <input type="password" name="password1" id="password1" class="form-control" aria-describedby="passwordHelpBlock" required="true">
                    <div id="passwordHelpBlock" class="form-text">
                        La contraseña debe ser con una longitud maxima de 10 caracterestes.
                    </div>
                </div>
                <div class="mb-3">
                    <label for="inputPassword5" class="form-label">Repetir contraseña <span class="text-danger">*</span></label>
                    <input type="password" name="password2" id="password2" class="form-control" aria-describedby="passwordHelpBlock" required="true">
                </div>
                <div class="mb-3">
                    <input type="checkbox" class="form-check-input" id="cleck_mostrarpass">
                    <label class="form-check-label" for="exampleCheck1">Mostrar contraseña</label>
                </div>
                <div class="mb-3">
                    <input type="checkbox" name="cleck_cambiarPass" class="form-check-input" id="cleck_cambiarPass">
                    <label class="form-check-label" for="exampleCheck1">Pedir cambiar contraseña</label>
                </div>
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label"><span class="text-nowrap">Seleccione el ROL</span><span class="text-danger">*</span></label>
                    <select name="rol" id="rol" class="form-select" aria-label="Default select example" required="true">
                        <option selected>Seleccione el ROL</option>
                        <option value="1">Administrador</option>
                        <option value="2">Digitalizador</option>
                        <option value="3">Usuario Estandar</option>
                        <option value="4">Lector</option>
                        <option value="5">Matriculador</option>
                    </select>
                </div>
                <div class="mb-5">
                    <br>
                     <button name="registrar" id="registrar" type="submit" class="btn btn-primary">Registrar Usuario</button>
                </div>
            </form>

        </div>

        <!<!-- pie de pagina -->
        <%@ include file="JSP_detalles/pie_de_pagina.jsp" %>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script> 
        <script src="LIB/bootstrap-5.3.3-dist/js/bootstrap.bundle.min.js"></script>
        <script src="LIB/bootstrap-5.3.3-dist/js/bootstrap.min.js"></script>
    </body>
</html>