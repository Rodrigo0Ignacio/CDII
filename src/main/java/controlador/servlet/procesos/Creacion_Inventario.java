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
import jakarta.servlet.http.HttpSession;
import static java.lang.System.out;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.sql.inventario.CRUD_CreaTabla;

//@WebServlet("/Creacion_Inventario")
public class Creacion_Inventario extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter(); // <- importante: definir PrintWriter aquí

        String requestBody = request.getReader().lines()
                .reduce("", (accumulator, actual) -> accumulator + actual);

        Gson gson = new Gson();
        DatosFormulario datosFormulario = gson.fromJson(requestBody, DatosFormulario.class);

        HttpSession sesionActiva = request.getSession(false);

        String rut = (String) sesionActiva.getAttribute("RUT");
        String rol = (String) sesionActiva.getAttribute("ROL");

        String nombreInventario = datosFormulario.getNombreInventario();
        boolean autoIdentifiers = datosFormulario.isAutoIdentifiers();
        boolean visibility = datosFormulario.isVisibility();
        String[] headers = datosFormulario.getHeaders();
        String[] selectValues = datosFormulario.getSelectValues();

        String[] prefijos = new String[]{"INV_001", "INV_002", "INV_003"};
        int[] permisos = new int[]{1, 2, 3};

        JsonObject jsonResponse = new JsonObject();

        CRUD_CreaTabla tabla = new CRUD_CreaTabla();

        boolean tablaExiste = false;
        String prefijo = null;

        for (String p : prefijos) {
            if (tabla.buscarTabla(p + "_" + nombreInventario)) {
                tablaExiste = true;
                break;
            }
        }

        if (tablaExiste) {
            jsonResponse.addProperty("status", "exists");
            jsonResponse.addProperty("message", "La tabla ya existe.");
            out.println(jsonResponse.toString()); // <- IMPORTANTE
            return;
        }

        // Asignar prefijo según rol
        for (int i = 0; i < permisos.length; i++) {
            if (Integer.parseInt(rol) == permisos[i]) {
                prefijo = prefijos[i];
                break;
            }
        }

        if (prefijo != null) {
            try {
                tabla.crearInventario(nombreInventario, headers, selectValues, autoIdentifiers, prefijo);
                jsonResponse.addProperty("status", "success");
                jsonResponse.addProperty("message", "Inventario creado correctamente.");
            } catch (SQLException ex) {
                jsonResponse.addProperty("status", "error");
                jsonResponse.addProperty("message", "Error al crear el inventario.");
                Logger.getLogger(Creacion_Inventario.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            jsonResponse.addProperty("status", "error");
            jsonResponse.addProperty("message", "Rol no autorizado.");
        }

        out.println(jsonResponse.toString()); // <- ASEGÚRATE DE SIEMPRE ENVIAR RESPUESTA
        out.close();
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
