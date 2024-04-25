
package servlet_procesamientoDatos;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import modelo.DatosFormulario;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.util.ArrayList;
import modelo.entidad.Usuario;
import modelo.sql.CRUD_Usuario;


/**
 *
 * @author Admin_sala
 */
public class datosInventario extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
       

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

  
    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    // Configurar el tipo de contenido de la respuesta
    response.setContentType("application/json");
    

    // Obtener el cuerpo de la solicitud (los datos enviados desde el cliente)
    String requestBody = request.getReader().lines()
            .reduce("", (accumulator, actual) -> accumulator + actual);

    // Convertir el cuerpo de la solicitud a un objeto Java utilizando Gson
    Gson gson = new Gson();
    DatosFormulario datosFormulario = gson.fromJson(requestBody, DatosFormulario.class);

    // Acceder a los datos del formulario
    String nombreInventario = datosFormulario.getNombreInventario();
    boolean autoIdentifiers = datosFormulario.isAutoIdentifiers();
    boolean visibility = datosFormulario.isVisibility();
    String[] headers = datosFormulario.getHeaders(); 

    // Preparar la respuesta JSON
    JsonObject jsonResponse = new JsonObject();
    jsonResponse.addProperty("message", "Datos recibidos correctamente en el servidor.");
    
        
      
    
    //DATOS FORMATEADOS
    jsonResponse.addProperty("Nombre del Inventario", nombreInventario);
    
        
    
    for(int i = 0 ; i < headers.length ; i++){
        jsonResponse.addProperty("Dato: "+i, headers[i]);
        
    } 

    // Escribir la respuesta JSON
    try (PrintWriter out = response.getWriter()) {
        out.println(jsonResponse.toString());
    }
}

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
