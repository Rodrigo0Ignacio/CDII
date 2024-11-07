<%@ page language="java" session="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ include file="JSP_detalles/validacionSesion.jsp" %>

<!--mat 4 -->  
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

            <!-- Datos Padre -->
            <h5>Datos Padre</h5>
            <div class="row">
                <div class="col-md-6">
                    <label for="rutPadre" class="form-label">Rut Padre <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" id="rutPadre" placeholder="Ingrese rut del padre" required>
                </div>
                <div class="row mb-3">
                    <div class="col-md-6">
                    <label for="nombrePadreA" class="form-label">Primer nombre <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" id="nombrePadreA" placeholder="Ingrese primer nombre del padre" required>
                    </div>
                    <div class="col-md-6">
                    <label for="nombrePadreB" class="form-label">Segundo nombre <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" id="nombrePadreB" placeholder="Ingrese segundo nombre del padre" required>
                </div>
                </div>
                <div class="col-md-6 mt-3">
                    <label for="apellidoPaternoPadre" class="form-label">Apellido Paterno <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" id="apellidoPaternoPadre" placeholder="Ingrese apellido paterno" required>
                </div>
                <div class="col-md-6 mt-3">
                    <label for="apellidoMaternoPadre" class="form-label">Apellido Materno <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" id="apellidoMaternoPadre" placeholder="Ingrese apellido materno" required>
                </div>
                <div class="col-md-6 mt-3">
                    <label for="birthdatePadre" class="form-label">Fecha de nacimiento <span class="text-danger">*</span></label>
                    <input type="date" class="form-control" id="birthdatePadre" required>
                </div>
                <div class="col-md-6 mt-3">
                    <label for="numeroContactoPadre" class="form-label">Número de contacto <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" id="numeroContactoPadre" placeholder="Ingrese número de contacto" required>
                </div>
            </div>

            <!-- Datos Madre -->
            <h5 class="mt-4">Datos Madre</h5>
            <div class="row">
                <div class="col-md-6">
                    <label for="rutMadre" class="form-label">Rut Madre <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" id="rutMadre" placeholder="Ingrese rut de la madre" required>
                </div>
                <div class="row md-3">
                    <div class="col-md-6">
                    <label for="nombreMadreA" class="form-label">Primer nombre<span class="text-danger">*</span></label>
                    <input type="text" class="form-control" id="nombreMadreA" placeholder="Ingrese primer nombre de la madre" required>
                </div>
                    <div class="col-md-6">
                    <label for="nombreMadreB" class="form-label">Segundo nombre <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" id="nombreMadreB" placeholder="Ingrese segundo nombre de la madre" required>
                </div>
                </div>
                <div class="col-md-6 mt-3">
                    <label for="apellidoPaternoMadre" class="form-label">Apellido Paterno <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" id="apellidoPaternoMadre" placeholder="Ingrese apellido paterno" required>
                </div>
                <div class="col-md-6 mt-3">
                    <label for="apellidoMaternoMadre" class="form-label">Apellido Materno <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" id="apellidoMaternoMadre" placeholder="Ingrese apellido materno" required>
                </div>
                <div class="col-md-6 mt-3">
                    <label for="birthdateMadre" class="form-label">Fecha de nacimiento <span class="text-danger">*</span></label>
                    <input type="date" class="form-control" id="birthdateMadre" required>
                </div>
                <div class="col-md-6 mt-3">
                    <label for="numeroContactoMadre" class="form-label">Número de contacto <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" id="numeroContactoMadre" placeholder="Ingrese número de contacto" required>
                </div>
            </div>

            <!-- Datos Apoderado -->
            <h5 class="mt-4">Datos Apoderado</h5>
            <div class="row">
                <div class="col-md-6">
                    <label for="rutApoderado" class="form-label">Rut Apoderado <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" id="rutApoderado" placeholder="Ingrese rut del apoderado" required>
                </div>
                
                <div class="row md-3">
                    <div class="col-md-6">
                    <label for="nombreApoderadoA" class="form-label">Primer nombre <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" id="nombresApoderadoA" placeholder="Ingrese primer nombre del apoderado" required>
                    </div>
                    <div class="col-md-6">
                    <label for="nombreApoderadoB" class="form-label">Segundo nombre <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" id="nombresApoderadoB" placeholder="Ingrese segundo nombre del apoderado" required>
                </div>
                </div>
                <div class="col-md-6 mt-3">
                    <label for="apellidoPaternoApoderado" class="form-label">Apellido Paterno <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" id="apellidoPaternoApoderado" placeholder="Ingrese apellido paterno" required>
                </div>
                <div class="col-md-6 mt-3">
                    <label for="apellidoMaternoApoderado" class="form-label">Apellido Materno <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" id="apellidoMaternoApoderado" placeholder="Ingrese apellido materno" required>
                </div>
                <div class="col-md-6 mt-3">
                    <label for="birthdateApoderado" class="form-label">Fecha de nacimiento <span class="text-danger">*</span></label>
                    <input type="date" class="form-control" id="birthdateApoderado" required>
                </div>
                <div class="col-md-6 mt-3">
                    <label for="numeroContactoApoderado" class="form-label">Número de contacto <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" id="numeroContactoApoderado" placeholder="Ingrese número de contacto" required>
                </div>
            </div>
    
            <!-- Datos Apoderado 2-->
            <h5 class="mt-4">Datos Apoderado suplente</h5>
            <div class="row">
                <div class="col-md-6">
                    <label for="rutApoderadoSuplente" class="form-label">Rut Apoderado suplente <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" id="rutApoderadoSuplente" placeholder="Ingrese rut del apoderado suplente" required>
                </div>
                <div class="row mb-3">
                    <div class="col-md-6">
                    <label for="nombreApoderadoSuplenteA" class="form-label">Nombres del apoderado suplente <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" id="nombreApoderadoSuplenteA" placeholder="Ingrese primer nombre del apoderado suplente" required>
                    </div>
                    <div class="col-md-6">
                    <label for="nombreApoderadoSuplenteB" class="form-label">Nombres del apoderado suplente <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" id="nombreApoderadoSuplenteB" placeholder="Ingrese segundo nombre del apoderado suplente" required>
                    </div>
                </div>
                <div class="col-md-6 mt-3">
                    <label for="apellidoPaternoApoderadoSuplente" class="form-label">Apellido Paterno <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" id="apellidoPaternoApoderadoSuplente" placeholder="Ingrese apellido paterno" required>
                </div>
                <div class="col-md-6 mt-3">
                    <label for="apellidoMaternoApoderadoSuplente" class="form-label">Apellido Materno <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" id="apellidoMaternoApoderadoSuplente" placeholder="Ingrese apellido materno" required>
                </div>
                <div class="col-md-6 mt-3">
                    <label for="birthdateApoderadoSuplente" class="form-label">Fecha de nacimiento <span class="text-danger">*</span></label>
                    <input type="date" class="form-control" id="birthdateApoderadoSuplente" required>
                </div>
                <div class="col-md-6 mt-3">
                    <label for="numeroContactoApoderadoSuplente" class="form-label">Número de contacto <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" id="numeroContactoApoderadoSuplente" placeholder="Ingrese número de contacto" required>
                </div>
            </div>
             <nav aria-label="Page navigation" class="mt-4">
                <ul class="pagination">
                    <li class="page-item"><a class="page-link" href="matricular.jsp">1</a></li>
                    <li class="page-item active"><a class="page-link" href="matricula2.jsp">2</a></li>
                    <li class="page-item"><a class="page-link" href="matricula3.jsp">3</a></li>
                    <li class="page-item"><a class="page-link" href="matricula4.jsp">4</a></li>
                    <li class="page-item">
                        <a class="page-link" href="matricula3.jsp">Next</a>
                    </li>
                </ul>
            </nav>
       </div>
    </body>
    
    <!<!-- pie de pagina -->
            <%@ include file="JSP_detalles/pie_de_pagina.jsp" %>
            <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script> 
            <script src="LIB/bootstrap-5.3.3-dist/js/bootstrap.bundle.min.js"></script>
            <script src="LIB/bootstrap-5.3.3-dist/js/bootstrap.min.js"></script>
</html>
