<%-- 
    Document   : index
    Created on : 08-04-2024, 3:53:02 p. m.
    Author     : Rodrigo Ignacio Farias
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="LIB/bootstrap-5.3.3-dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="CSS/fooster.css" rel="stylesheet">
        <link rel="shortcut icon" href="IMG/logo.ico" />
        <title>Sistema de gestion - Login</title>

    </head>
    <body class="p-3 m-0 border-0 bd-example m-0 border-0 bg-light">
        <div class="container">
            <div class="row">
                <div class="col">
                    <img src="IMG/logo.png" class="img-fluid rounded float-start" alt="logo" width="100" height="100">
                    <div class="col"> <span class="font-weight-normal"> Liceo Juan Dante Parraguez Arellano</span> </div>
                    <div class="col"> <span class="font-weight-normal">Sistema de Inventario integral</span> </div>
                    <div class="col"> <span class="font-weight-normal">pagina home: <a href="Home.jsp">IR</a></span> </div>
                </div>
            </div>
            <hr>
            <div class="row pt-3">

                <div class="col col-lg-6 p-3">

                    <h1>Bienvenido</h1>

                    <form class="form" action="Sesion" method="post" id="inicio_sesion">
                        <div class="mb-3">
                            <label for="exampleInputEmail1" class="form-label">Usuario</label>
                            <input type="text" name="usuario" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required>
                            <div id="emailHelp" class="form-text"></div>
                        </div>
                        <div class="mb-3">
                            <label for="exampleInputPassword1" class="form-label">contraseña</label>
                            <input type="password" name="contra" class="form-control" id="exampleInputPassword1" required>
                        </div>
                        <div class="mb-3 form-check">
                            <input type="checkbox" class="form-check-input" id="exampleCheck1">
                            <label class="form-check-label" for="exampleCheck1">recordar credenciales</label>
                        </div>
                        <button type="submit" class="btn btn-primary">Ingresar</button> 
                    </form>
                </div>
                <% if (request.getAttribute("valida") != null && (boolean)request.getAttribute("valida") != true) { %>
                <div class="alert alert-danger" role="alert" id="alerta">
                    <span>Usuario no encontrado</span>
                </div>
                <script src="JS/alerta.js"> </script>
                <% } %>

            </div>
        </div>
        <footer class="bg-body-tertiary text-center text-lg-start">
            <!-- Copyright -->
            <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.05);">
                © 2024 Copyright: <a class="text-body" href="https://www.liceojuandanteparraguez.cl/">Liceo Juan Dante Parraguez Arellano</a>
            </div>
            <!-- Copyright -->
        </footer>
        <script src="LIB/bootstrap-5.3.3-dist/js/bootstrap.min.js"></script>
    </body>
</html>
