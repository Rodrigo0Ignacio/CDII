<%@ page language="java" session="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="modelo.sql.CRUD_Usuario" %>
<%@ include file="JSP_detalles/validacionSesion.jsp" %>

<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="LIB/bootstrap-5.3.3-dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="CSS/fooster.css" rel="stylesheet">
        <!-- incluir encabezado -->
        <%@ include file="JSP_detalles/logo.jsp" %>
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
        <title>Sistema de gestion - Home</title>
    </head>
    <body class="p-3 m-0 border-0 bd-example m-0 border-0 bg-light">
        <script src="LIB/bootstrap-5.3.3-dist/js/bootstrap.min.js"></script>
        <!-- Comienzo del formulario -->
        <%@ include file="JSP_detalles/encabezado.jsp" %>
        <div class="container mt-5">
            <h3>Datos sobre el alumno</h3>
            <p class="note">Los campos marcados con * son obligatorios.</p>
            <div class="container mt-5">
                <h3>Datos y antecedentes</h3>
                <h5>Beneficios de los alumnos</h5>
                <p>Marque si el alumno posee alguno de los siguientes beneficios</p>
                
                <!-- Beneficios -->
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="benefit1">
                    <label class="form-check-label" for="benefit1">Útiles Escolares</label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="benefit2">
                    <label class="form-check-label" for="benefit2">P.A.E.</label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="benefit3">
                    <label class="form-check-label" for="benefit3">Chile seguridades y oportunidades</label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="benefit4">
                    <label class="form-check-label" for="benefit4">Beca presidente de la república</label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="benefit5">
                    <label class="form-check-label" for="benefit5">Beca indígena</label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="benefit6">
                    <label class="form-check-label" for="benefit6">Subsidio único familiar</label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="benefit7">
                    <label class="form-check-label" for="benefit7">Registro social de hogares</label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="benefit8">
                    <label class="form-check-label" for="benefit8">Otro</label>
                </div>

                <div class="mt-3">
                    <label for="porcentaje" class="form-label"> Si marcó "registro social de hogares" indique el porcentaje (%)</label>
                    <input type="text" class="form-control" id="porcentaje" placeholder="Ingrese el porcentaje">
                </div>

                <div class="mt-3">
                    <label for="otroCual" class="form-label">Si marcó "otro" indique que beneficio</label>
                    <input type="text" class="form-control" id="otroCual" placeholder="Indique Cual">
                </div>

                <h5 class="mt-4">Datos Alumno</h5>

                <div class="mt-3">
                    <label for="conquienvive" class="form-label">¿Con quién vive el alumno? <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" id="conquienvive" placeholder="Ingrese texto" required>
                </div>

                <div class="mt-3">
                    <label for="hermanos" class="form-label">¿El alumno tiene hermanos? ¿Cuántos?<span class="text-danger">*</span></label>
                    <input type="number" class="form-control" id="hermanos" placeholder="Ingrese texto">
                </div>

                <div class="mt-3">
                    <label for="consulta" class="form-label">¿El alumno se atiende en consultorio? Si lo hace indicar cuál y la previsión de salud de este <span class="text-danger">*</span></label>
                    <textarea class="form-control" id="consulta" rows="3" placeholder="Ingrese texto" required></textarea>
                </div>

                <div class="mt-3">
                    <label for="trabajo" class="form-label">¿El alumno trabaja? Si lo hace, indicar en qué y dónde <span class="text-danger">*</span></label>
                    <textarea class="form-control" id="trabajo" rows="3" placeholder="Ingrese texto" required></textarea>
                </div>

                <div class="mt-3">
                    <label for="etnia" class="form-label">¿El alumno pertenece a alguna etnia? Si lo hace indique cuál <span class="text-danger">*</span></label>
                    <textarea class="form-control" id="etnia" rows="3" placeholder="Ingrese texto" required></textarea>
                </div>

                <div class="mt-3">
                    <label for="dificultades" class="form-label">¿El alumno presenta dificultades de aprendizaje?</label>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="lenguaje">
                        <label class="form-check-label" for="lenguaje">Lenguaje</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="matematicas">
                        <label class="form-check-label" for="matematicas">Matemáticas</label>
                    </div>
                </div>

                <div class="mt-3">
                    <label for="integracion" class="form-label">¿El alumno ha estado o es parte de un programa de integración escolar? Si es el caso indique cuál<span class="text-danger">*</span></label>
                    <textarea class="form-control" id="integracion" rows="3" placeholder="Ingrese texto"></textarea>
                </div>

                <div class="mt-3">
                    <label for="enfermedad" class="form-label">¿El alumno presenta alguna enfermedad? Indique cuál o cuáles<span class="text-danger">*</span></label>
                    <textarea class="form-control" id="enfermedad" rows="3" placeholder="Indicar enfermedad"></textarea>
                </div>

                <div class="mt-3">
                    <label for="medicamento" class="form-label">¿El alumno consume algún medicamento?<span class="text-danger">*</span></label>
                    <textarea class="form-control" id="medicamento" rows="3" placeholder="Ingrese texto"></textarea>
                </div>

                <nav aria-label="Page navigation" class="mt-4">
                    <ul class="pagination">
                        <li class="page-item"><a class="page-link" href="matricular.jsp">1</a></li>
                        <li class="page-item"><a class="page-link" href="matricula2.jsp">2</a></li>
                        <li class="page-item active"><a class="page-link" href="matricula3.jsp">3</a></li>
                        <li class="page-item"><a class="page-link" href="matricula4.jsp">4</a></li>
                        <li class="page-item">
                            <a class="page-link" href="matricula4.jsp">Next</a>
                        </li>
                    </ul>
                </nav>

            </div>
            <!<!-- pie de pagina -->
            <%@ include file="JSP_detalles/pie_de_pagina.jsp" %>
            <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script> 
            <script src="LIB/bootstrap-5.3.3-dist/js/bootstrap.bundle.min.js"></script>
            <script src="LIB/bootstrap-5.3.3-dist/js/bootstrap.min.js"></script>
        </body>
    </html>
 