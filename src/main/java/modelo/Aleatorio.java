
package modelo;

import java.security.SecureRandom;

/**
 *
 * @author rodri
 */
public class Aleatorio {

    private final String CARACTERES = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

    public String generarTextoAleatorio(int longitud) {
        // Definir los caracteres que se usarán en la cadena aleatoria

        StringBuilder textoGenerado = new StringBuilder();

        // Crear un objeto SecureRandom para asegurar mayor aleatoriedad
        SecureRandom random = new SecureRandom();

        // Generar el texto aleatorio
        for (int i = 0; i < longitud; i++) {
            // Elegir un carácter aleatorio del conjunto de caracteres
            int indice = random.nextInt(CARACTERES.length());
            textoGenerado.append(CARACTERES.charAt(indice));
        }

        return textoGenerado.toString();
    }

}
