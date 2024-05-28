package modelo.sql;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.entidad.Inventario;

public class CRUD_CreaTabla extends CRUD_Inventario {

    private Inventario inventario;

    public CRUD_CreaTabla() {
    }

    public void crearInventario(String tabla, String[] columnas, String[] variables, boolean indice, String prefijo) throws SQLException {

        ArrayList<String> variableFormateada = new ArrayList();
        StringBuilder queryBuilder = new StringBuilder();

        if (columnas.length != variables.length) {
            System.out.println("La cantidad de columnas y tipos de variables no coinciden.");
            return; // o lanza una excepción
        }

        for (int i = 0; i < variables.length; i++) {

            if (variables[i].equals("Fecha")) {
                variableFormateada.add("DATE");
            }
            if (variables[i].equals("Cadena")) {
                variableFormateada.add("VARCHAR(200)");
            }
            if (variables[i].equals("Entero")) {
                variableFormateada.add("INT");
            }
            if (variables[i].equals("Decimal")) {
                variableFormateada.add("DECIMAL");
            }

        }

        // Inicia la construcción de la consulta SQL
        if (indice) {

            queryBuilder.append("CREATE TABLE ").append(prefijo+"_"+tabla).append(" (ID INT NOT NULL AUTO_INCREMENT, ");

            // Construye la parte de la sentencia SQL para cada columna y su tipo de variable
            for (int i = 0; i < columnas.length; i++) {
                queryBuilder.append(columnas[i]).append(" ").append(variableFormateada.get(i));

                // Agrega una coma si no es la última columna
                if (i < columnas.length - 1) {
                    queryBuilder.append(", ");
                }

            }
            // Cierra la sentencia SQL
            queryBuilder.append(", PRIMARY KEY (ID)");  
            // Cierra la sentencia SQL
            queryBuilder.append(");");
            
             System.out.println(queryBuilder.toString());

        } else {

            queryBuilder.append("CREATE TABLE ").append(prefijo+"_"+tabla).append(" (");

            // Construye la parte de la sentencia SQL para cada columna y su tipo de variable
            for (int i = 0; i < columnas.length; i++) {
                queryBuilder.append(columnas[i]).append(" ").append(variableFormateada.get(i));

                // Agrega una coma si no es la última columna
                if (i < columnas.length - 1) {
                    queryBuilder.append(", ");
                }
            }
            // Cierra la sentencia SQL
            queryBuilder.append(");");
            System.out.println(queryBuilder.toString());

        }
        
        //INSERTAR EN LA BASE DE DATOS
        st = (Statement) conectar().createStatement();
        st.execute(queryBuilder.toString());
        System.out.println("Tabla creada exitosamente.");

    }

    public void editarEventario() {

    }
    public boolean buscarTabla(String tabla) {
    query = "SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = DATABASE() AND table_name = ?";
    
    try {
        // Conectar a la base de datos y preparar la declaración
        ps = conectar().prepareStatement(query);
        ps.setString(1, tabla);
        
        // Ejecutar la consulta
        rs = ps.executeQuery();
        
        // Verificar el resultado
        if (rs.next()) {
            int count = rs.getInt(1);
            return count > 0; // Retorna true si la tabla existe, false si no
        }
        
    } catch (SQLException ex) {
        Logger.getLogger(CRUD_CreaTabla.class.getName()).log(Level.SEVERE, null, ex);
    }
    
    return false;
}


    public void eliminarIventario() {

    }

    public void mostrarIventarios() {

    }

}
