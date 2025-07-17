package controlador.servlet.requerimiento;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.nio.file.Paths;
import java.util.ArrayList;
import modelo.entidad.requerimiento.Requerimiento;
import modelo.sql.requerimiento.CRUD_requerimiento;

@WebServlet("/ingreso_requerimiento")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100)   // 100 MB

public class Ingreso_requerimiento extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String usuarionombre = request.getParameter("primerNombre");
        String fecha_ingreso = request.getParameter("fecha");
        String tipo_requerimiento = request.getParameter("req");
        String requerimiento = request.getParameter("requerimiento");
        int idUsuario = 0;

        // Validar entrada
        ArrayList<String> listaErroes = new ArrayList<>();
        if (usuarionombre == null || usuarionombre.trim().isEmpty()) {
            listaErroes.add("Ingrese Nombre y apellido");
        }
        if (fecha_ingreso == null) {
            listaErroes.add("Ingrese una fecha");
        }
        if (tipo_requerimiento == null || tipo_requerimiento.trim().isEmpty()) {
            listaErroes.add("Ingrese una opción válida");
        }
        if (requerimiento == null || requerimiento.trim().isEmpty()) {
            listaErroes.add("El requerimiento no puede quedar en blanco");
        }

        // Obtener ID de Usuario desde la sesión
        HttpSession session = request.getSession(false);
        if (session != null) {
            idUsuario = new CRUD_requerimiento().obtenerIdRolPorRut(session.getAttribute("RUT").toString());
        }

        // Carpeta donde guardar los archivos
        String uploadPath = getServletContext().getRealPath("") + File.separator + "archivos_subidos";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        // Procesar archivos subidos
        for (Part part : request.getParts()) {
            if (part.getName().equals("archivos[]")) {
                String fileName = System.currentTimeMillis() + "_" + Paths.get(part.getSubmittedFileName()).getFileName().toString();

                if (part.getSize() > 30 * 1024 * 1024) { // Si el archivo es mayor a 30MB
                    listaErroes.add("El archivo " + fileName + " excede el límite de tamaño de 30MB.");
                } else {
                    // Guardar el archivo
                    String fullPath = uploadPath + File.separator + fileName;
                    part.write(fullPath);

                    // Imprimir la ruta en la consola
                    System.out.println("Archivo guardado en: " + fullPath);
                }
            }
        }

        // Procesar errores o guardar en la base de datos
        if (listaErroes.isEmpty()) {
            CRUD_requerimiento crudr = new CRUD_requerimiento();
            Requerimiento reqObj = new Requerimiento(convertirFecha(fecha_ingreso), null, tipo_requerimiento, requerimiento, idUsuario);

            crudr.crear(reqObj);

            System.out.println("nombre: " + usuarionombre);
            System.out.println("fecha: " + convertirFecha(fecha_ingreso));
            System.out.println("tipo_requerimiento: " + tipo_requerimiento);
            System.out.println("requerimiento: " + requerimiento);
            System.out.println("idUsuario: " + idUsuario);

            request.setAttribute("ms", "Requerimiento ingresado correctamente!");
            request.getRequestDispatcher("ingreso_requerimiento.jsp").forward(request, response);
        } else {
            System.out.println("nombre: " + usuarionombre);
            System.out.println("fecha: " + convertirFecha(fecha_ingreso));
            System.out.println("tipo_requerimiento: " + tipo_requerimiento);
            System.out.println("requerimiento: " + requerimiento);
            System.out.println("idUsuario: " + idUsuario);

            request.setAttribute("lista", listaErroes);
            request.getRequestDispatcher("ingreso_requerimiento.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Servlet para el ingreso de requerimientos";
    }

    private java.sql.Date convertirFecha(String fechaIngreso) {

        return java.sql.Date.valueOf(fechaIngreso);  // Convierte directamente el string a java.sql.Date

    }

}
