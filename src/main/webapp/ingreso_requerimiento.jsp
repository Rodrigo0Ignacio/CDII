<%@ page language="java" session="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="modelo.sql.usuario.CRUD_Usuario" %>
<%
    String jspName = request.getServletPath();
    request.getSession().setAttribute("DIRECTORIO_ACTUAL", jspName.substring(1).toUpperCase());
    //System.out.println("NOMBRE DE DIRECTORIO: " + session.getAttribute("DIRECTORIO_ACTUAL"));
%>
<%@ include file="JSP_detalles/validacionSesion.jsp" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="CSS/fooster.css" rel="stylesheet">
        <%@ include file="JSP_detalles/CDN.jsp" %>
        <!-- incluir encabezado -->
        <%@ include file="JSP_detalles/logo.jsp" %>

        <title>Sistema de gestion - Ingreso Requerimiento</title>
    </head>
    <body class="p-3 m-0 border-0 bd-example m-0 border-0 bg-light">
        <script src="LIB/bootstrap-5.3.3-dist/js/bootstrap.min.js"></script>
        <!-- incluir encabezado -->
        <%@ include file="JSP_detalles/encabezado.jsp" %>
        <script src="https://cdn.ckeditor.com/ckeditor5/41.3.1/classic/ckeditor.js"></script>



        <div class="container">
            <br>
            <form class="form col col-lg-8" action="Servlet_Usuario" method="post" id="form_registro_usuario">
                <h2>Ingreso de Requerimiento</h2>
                <br>
                <div class="mb-3">
                    <div class="row">
                        <div class="col">
                            <label for="exampleInputEmail1" class="form-label">Docente <span class="text-danger">*</span></label>
                            <input name="primerNombre" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" value="<%= session.getAttribute("NOMBRE")%>" required="true">
                        </div>
                        <div class="col">
                            <label for="exampleInputEmail1" class="form-label">Fecha Actual <span class="text-danger">*</span></label>
                            <input name="segundoNombre" type="date" class="form-control" id="fechaActual" aria-describedby="emailHelp" required="true">
                        </div>
                    </div>
                </div>
                <div class="mb-3">
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label for="sel1">Tipo de Requerimiento</label>
                                <select class="form-control" id="tipo_req">
                                    <option selected  disabled>seleccione tipo</option>
                                    <option>Peticion de Materiales</option>
                                    <option>Peticion de maquinaria</option>
                                    <option>Peticion de Mantenimiento</option>
                                    <option>Otros</option>
                                </select>
                            </div>
                        </div>
                        <div class="col">
                            <label for="exampleInputEmail1" class="form-label">
                                Adjuntar archivos <span class="text-danger">*</span>
                            </label>
                            <input name="materno[]" type="file" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required multiple>
                        </div>
                    </div>
                </div>
                <br>
                <h2>Detalles Requerimiento</h2>
                <div class="mb-3">
                    <div class="form-group">
                        <label for="comment"></label>
                        <textarea class="form-control" name="requerimiento" rows="100" id="comment"></textarea>
                    </div>
                </div>

                <script src="https://cdn.ckeditor.com/ckeditor5/41.3.1/classic/ckeditor.js"></script>
                <style>
                    /* Fijar tamaño mínimo y evitar cambios en la altura */
                    .ck-editor__editable {
                        min-height: 250px !important; /* Mantiene la altura */
                        max-height: 400px; /* Opcional: evita que crezca demasiado */
                        overflow: auto; /* Habilita el scroll si se llena */
                    }
                </style>

                <script>
                    ClassicEditor
                            .create(document.querySelector('#comment'))
                            .then(editor => {
                                // Evita que CKEditor modifique la altura
                                editor.ui.view.editable.element.style.height = "250px";
                            })
                            .catch(error => {
                                console.error(error);
                            });
                </script>
                <script>
                    // Capturar la fecha actual y mostrarla en el input
                    document.addEventListener("DOMContentLoaded", function () {
                        let fechaInput = document.getElementById("fechaActual");
                        let hoy = new Date().toISOString().split("T")[0]; // Obtener fecha en formato YYYY-MM-DD
                        fechaInput.value = hoy; // Asignar la fecha al input
                    });
                </script>


                <br>
                <div class="mb-3">
                    <div class="row">
                        <div class="col">
                            <button type="button" class="btn btn-primary">Ingresar Requerimiento</button>
                        </div>
                        <div class="col">
                            <button type="button" class="btn btn-danger">Guardar Borrador</button>
                        </div>
                    </div>
                </div>

            </form>

        </div>

    </body>
    <!<!-- pie de pagina -->
    <%@ include file="JSP_detalles/pie_de_pagina.jsp" %>


</html>
