package controlador.servlet.procesos;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import modelo.DatosFormulario;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.sql.inventario.CRUD_CreaTabla;

//@WebServlet("/Creacion_Inventario")
public class Creacion_Inventario extends HttpServlet {

    private boolean respuesta = false;
    private static final long serialVersionUID = 1L;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println(respuesta);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

      @Override
     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Configurar el tipo de contenido de la respuesta
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // Obtener el cuerpo de la solicitud (los datos enviados desde el cliente)
        String requestBody = request.getReader().lines()
                .reduce("", (accumulator, actual) -> accumulator + actual);

        // PRFIJO DE TABLAS DE INVENTARIO
        final String PREFIJO = "INVENTARIO";
        
        // Convertir el cuerpo de la solicitud a un objeto Java utilizando Gson
        Gson gson = new Gson();
        DatosFormulario datosFormulario = gson.fromJson(requestBody, DatosFormulario.class);

        // Acceder a los datos del formulario
        String nombreInventario = datosFormulario.getNombreInventario();
        boolean autoIdentifiers = datosFormulario.isAutoIdentifiers();
        boolean visibility = datosFormulario.isVisibility();
        String[] headers = datosFormulario.getHeaders();
        String[] selectValues = datosFormulario.getSelectValues();

        // Preparar la respuesta JSON
        JsonObject jsonResponse = new JsonObject();
        jsonResponse.addProperty("message", "Datos recibidos correctamente en el servidor.");
        jsonResponse.addProperty("Nombre del Inventario", nombreInventario);
        jsonResponse.addProperty("Auto Identifiers", autoIdentifiers);
        jsonResponse.addProperty("Visibility", visibility);

        for (int i = 0; i < headers.length; i++) {
            jsonResponse.addProperty("Dato " + i, headers[i]);
        }

        for (int i = 0; i < selectValues.length; i++) {
            jsonResponse.addProperty("Select " + i, selectValues[i]);
        }

        try (PrintWriter out = response.getWriter()) {
            CRUD_CreaTabla tabla = new CRUD_CreaTabla();

            if (tabla.buscarTabla(PREFIJO + "_" + nombreInventario)) {
                
                jsonResponse.addProperty("status", "exists");
                jsonResponse.addProperty("message", "La tabla ya existe.");
                out.println(jsonResponse.toString());
                
            } else {
                try {
                    tabla.crearInventario(nombreInventario, headers, selectValues, autoIdentifiers, PREFIJO);
                    
                    jsonResponse.addProperty("status", "success");
                    jsonResponse.addProperty("message", "Inventario creado correctamente.");
                    
                    out.println(jsonResponse.toString());
                    /*
                    request.setAttribute("name", "prueba");
                    request.getRequestDispatcher("/result.jsp").forward(request, response);*/

                    
                } catch (SQLException ex) {
                    Logger.getLogger(Creacion_Inventario.class.getName()).log(Level.SEVERE, null, ex);
                    
                    jsonResponse.addProperty("status", "error");
                    jsonResponse.addProperty("message", "Error al crear el inventario.");
                    out.println(jsonResponse.toString());
                }
            }
        } catch (IOException ex) {
            Logger.getLogger(Creacion_Inventario.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}