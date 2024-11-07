<%-- 
    Document   : matricular
    Created on : 03-09-2024, 9:57:01 p. m.
    Author     : Choripanheim
--%>

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
        <!-- Estilo para que la alerta de campos obligatorios se vea en rojo -->
        <style>
            .required-field::after {
                content: " *";
                color: red;
            }
            .note {
                font-size: 0.9em;
                color: red;
            }
        </style>
    </head>
    <body class="p-3 m-0 border-0 bd-example m-0 border-0 bg-light">
        <script src="LIB/bootstrap-5.3.3-dist/js/bootstrap.min.js"></script>
        <!-- Comienzo de formulario -->
        <%@ include file="JSP_detalles/encabezado.jsp" %>
        <div class="container mt-5">
            <h3>Datos sobre el alumno</h3>
            <p class="note">Los campos marcados con * son obligatorios.</p>
            <form action="Matricular" method="POST">
                <div class="row mb-3">
                    <!--Campo "Curso" con opciones para elegir, hay que ver que opcion es mejor 
                    <div class="col">
                        <label for="sexo" class="form-label required-field">Curso</label>
                        <select id="sexo" class="form-select" required>
                            <option value="" disabled selected>Seleccionar</option>
                            <option value="1A">1A</option>
                            <option value="1B">1B</option>
                            <option value="1C">1C</option>
                            <option value="2A">2A</option>
                            <option value="2B">2B</option>
                            <option value="2C">2C</option>
                            <option value="3A">3A</option>
                            <option value="3B">3B</option>
                            <option value="3C">3C</option>
                            <option value="4A">4A</option>
                            <option value="4B">4B</option>
                            <option value="4C">4C</option>
                        </select>
                    </div> 
                     -->
                    <!-- Campo "Curso" con textbox-->
                    <div class="col-md-6">
                        <label for="course" class="form-label required-field">Curso</label>
                        <input type="text" class="form-control" id="course" placeholder="Curso" required>
                    </div>
                    
                    
                </div>
                <div class="row mb-3">
                    <div class="col">
                        <label for="studentNameA" class="form-label required-field">Primer nombre</label>
                        <input type="text" class="form-control" id="studentName" placeholder="Nombres del alumno" required>
                    </div>
                    <div class="col">
                        <label for="studentNameB" class="form-label required-field">Segundo nombre</label>
                        <input type="text" class="form-control" id="studentName" placeholder="Nombres del alumno" required>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col">
                        <label for="matriculaNumber" class="form-label required-field">N° de matrícula</label>
                        <input type="text" class="form-control" id="matriculaNumber" placeholder="n° de matrícula" required>
                    </div>
                    <div class="col">
                        <label for="rut" class="form-label required-field">Rut alumno</label>
                        <input type="text" class="form-control" id="rut" placeholder="Rut alumno" required>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col">
                        <label for="apellidoPaterno" class="form-label required-field">Apellido Paterno</label>
                        <input type="text" class="form-control" id="apellidoPaterno" placeholder="Apellido Paterno" required>
                    </div>
                    <div class="col">
                        <label for="apellidoMaterno" class="form-label required-field">Apellido Materno</label>
                        <input type="text" class="form-control" id="apellidoMaterno" placeholder="Apellido Materno" required>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col">
                        <label for="birthdate" class="form-label required-field">Fecha de nacimiento</label>
                        <input type="date" class="form-control" id="birthdate" placeholder="Fecha de nacimiento" required>
                    </div>
                    <div class="col">
                        <label for="address" class="form-label required-field">Dirección</label>
                        <input type="text" class="form-control" id="address" placeholder="Dirección" required>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col">
                        <label for="phone" class="form-label">Telefono</label>
                        <input type="tel" class="form-control" id="phone" placeholder="Telefono">
                    </div>
                    <div class="col">
                        <label for="sexo" class="form-label required-field">Sexo</label>
                        <select id="sexo" class="form-select" required>
                            <option value="" disabled selected>Seleccionar</option>
                            <option value="Masculino">Masculino</option>
                            <option value="Femenino">Femenino</option>
                            <option value="Otro">Otro</option>
                        </select>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col">
                        <label for="socialName" class="form-label">Nombre social</label>
                        <input type="text" class="form-control" id="socialName" placeholder="Nombre social">
                    </div>
                    <div class="col">
                        <label for="studentWeight" class="form-label required-field">Peso del alumno</label>
                        <input type="text" class="form-control" id="studentWeight" placeholder="Peso del alumno" required>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col">
                        <label for="tipo_sangre" class="form-label required-field">Tipo de Sangre</label>
                        <select id="tipo_sangre" class="form-select" required>
                        <option value="" disabled selected>Seleccionar</option>
                        <option value="A+">A+</option>
                        <option value="A-">A-</option>
                        <option value="B+">B+</option>
                        <option value="B-">B-</option>
                        <option value="AB+">AB+</option>
                        <option value="AB-">AB-</option>
                        <option value="O+">O+</option>
                        <option value="O-">O-</option>
                        </select>
                    </div>
                    <div class="col">
                        <label for="studentHeight" class="form-label required-field">Talla del alumno</label>
                        <input type="text" class="form-control" id="studentHeight" placeholder="Talla del alumno" required>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="shoeSize" class="form-label required-field">Talla del calzado</label>
                        <input type="text" class="form-control" id="shoeSize" placeholder="Talla del calzado" required>
                    </div>
                </div>
            </form>
            <nav aria-label="Page navigation" class="mt-4">
                <ul class="pagination">
                    <li class="page-item active"><a class="page-link" href="matricular.jsp">1</a></li>
                    <li class="page-item"><a class="page-link" href="matricula2.jsp">2</a></li>
                    <li class="page-item"><a class="page-link" href="matricula3.jsp">3</a></li>
                    <li class="page-item"><a class="page-link" href="matricula4.jsp">4</a></li>
                    <li class="page-item">
                        <a class="page-link" href="matricula2.jsp">Next</a>
                    </li>
                    <button type="submit" class="btn btn-primary">Enviar</button>
                </ul>
            </nav>
        </div>

        <!-- pie de pagina -->
        <%@ include file="JSP_detalles/pie_de_pagina.jsp" %>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script> 
        <script src="LIB/bootstrap-5.3.3-dist/js/bootstrap.bundle.min.js"></script>
        <script src="LIB/bootstrap-5.3.3-dist/js/bootstrap.min.js"></script>
    </body>
</html>
