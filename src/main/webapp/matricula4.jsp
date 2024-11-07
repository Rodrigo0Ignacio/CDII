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
        <title>Sistema de gestión - Home</title>
    </head>
    <body class="p-3 m-0 border-0 bd-example m-0 border-0 bg-light">
        <script src="LIB/bootstrap-5.3.3-dist/js/bootstrap.min.js"></script>
        <!-- Comienzo del formulario -->
        <%@ include file="JSP_detalles/encabezado.jsp" %>
        <div class="container mt-5">
            <h3>Datos sobre el alumno</h3>
            <p class="note">Los campos marcados con * son obligatorios.</p>
            <h4>Carreras, Talleres y Pagos</h4>
            <h5>Carreras</h5>
            
            <p>Seleccione las 2 carreras a las que el alumno postula (SOLO 2)<span class="text-danger">*</span></p>

            <form onsubmit="return validateForm();">
                <div class="mb-3">
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="carrera1" name="carrera" value="Mecánica automotriz">
                        <label class="form-check-label" for="carrera1">Mecánica automotriz</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="carrera2" name="carrera" value="Construcciones metálicas">
                        <label class="form-check-label" for="carrera2">Construcciones metálicas</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="carrera3" name="carrera" value="Elaboración industrial de alimentos">
                        <label class="form-check-label" for="carrera3">Elaboración industrial de alimentos</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="carrera4" name="carrera" value="Vestuario y confección textil">
                        <label class="form-check-label" for="carrera4">Vestuario y confección textil</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="carrera5" name="carrera" value="Refrigeración y climatización">
                        <label class="form-check-label" for="carrera5">Refrigeración y climatización</label>
                    </div>
                </div>

                <div class="mt-4">
                    <p>¿Autoriza al alumno a participar de clases de religión? <span class="text-danger">*</span></p>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="religion" id="religionSi" value="si" required>
                        <label class="form-check-label" for="religionSi">Sí</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="religion" id="religionNo" value="no" required>
                        <label class="form-check-label" for="religionNo">No</label>
                    </div>
                </div>

                <div class="mt-3">
                    <p>¿Autoriza al alumno a participar de talleres? <span class="text-danger">*</span></p>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="talleres" id="talleresSi" value="si" required>
                        <label class="form-check-label" for="talleresSi">Sí</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="talleres" id="talleresNo" value="no" required>
                        <label class="form-check-label" for="talleresNo">No</label>
                    </div>
                </div>

                <div class="mt-3">
                    <p>¿Cancela pago a centro de padres?</p>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="pagoCentroPadres" id="pagoPadresSi" value="si">
                        <label class="form-check-label" for="pagoPadresSi">Sí</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="pagoCentroPadres" id="pagoPadresNo" value="no">
                        <label class="form-check-label" for="pagoPadresNo">No</label>
                    </div>
                </div>

                <div class="row mt-3">
                    <div class="col-md-6">
                        <label for="montoPagoPadres" class="form-label">Monto a pagar</label>
                        <input type="text" class="form-control" id="montoPagoPadres" placeholder="Ingrese monto">
                    </div>
                    <div class="col-md-6">
                        <label for="fechaPagoPadres" class="form-label">Fecha de pago propuesta</label>
                        <input type="date" class="form-control" id="fechaPagoPadres">
                    </div>
                </div>

                <div class="mt-3">
                    <p>¿Cancela derecho a taller?</p>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="derechoTaller" id="derechoTallerSi" value="si">
                        <label class="form-check-label" for="derechoTallerSi">Sí</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="derechoTaller" id="derechoTallerNo" value="no">
                        <label class="form-check-label" for="derechoTallerNo">No</label>
                    </div>
                </div>

                <div class="row mt-3">
                    <div class="col-md-6">
                        <label for="montoPagoTaller" class="form-label">Monto a pagar</label>
                        <input type="text" class="form-control" id="montoPagoTaller" placeholder="Ingrese monto">
                    </div>
                    <div class="col-md-6">
                        <label for="fechaPagoTaller" class="form-label">Fecha de pago propuesta</label>
                        <input type="date" class="form-control" id="fechaPagoTaller">
                    </div>
                </div>

                <nav aria-label="Page navigation" class="mt-4">
                    <ul class="pagination">
                        <li class="page-item"><a class="page-link" href="matricular.jsp">1</a></li>
                        <li class="page-item"><a class="page-link" href="matricula2.jsp">2</a></li>
                        <li class="page-item"><a class="page-link" href="matricula3.jsp">3</a></li>
                        <li class="page-item active"><a class="page-link" href="matricula4.jsp">4</a></li>
                    </ul>
                </nav>
                <button type="submit" class="btn btn-primary">Enviar</button>
            </form>
        </div>

        <!-- pie de pagina -->
        <%@ include file="JSP_detalles/pie_de_pagina.jsp" %>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6
