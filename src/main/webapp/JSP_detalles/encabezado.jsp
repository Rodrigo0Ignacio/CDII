 <div class="container">
            <div class="row align-items-start">
                <div class="col">
                    <img src="IMG/logo.png" class="img-fluid rounded float-start" alt="logo" width="100" height="100">
                    <div class="col"> <span class="font-weight-normal"> Liceo Juan Dante Parraguez Arellano</span> </div>
                    <div class="col"> <span class="font-weight-normal">Sistema de Inventario integral</span> </div>
                </div>
                <div class="col-3 align-items-ent align-self-center fs-5 fw-bold">
                    <div class="col"> <span class="font-weight-normal">Bienvenido: </span><span><%= session.getAttribute("NOMBRE")%></span> </div>
                </div>
            </div>
            <hr>
            <!-- Incluir la barra de navegación -->
            <%@ include file="navbar.jsp" %>

</div>