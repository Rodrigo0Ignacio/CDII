
package modelo.cifrado;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;


public class ClaveGenerador {

    // Método para generar y guardar la clave en un archivo
    public static void generarClave() throws Exception {
        KeyGenerator keyGen = KeyGenerator.getInstance("AES");
        keyGen.init(256); // Para AES-256
        SecretKey secretKey = keyGen.generateKey();

        // Obtener la ruta del directorio de trabajo (raíz del proyecto)
        String filePath = System.getProperty("user.dir") + "/secret.key";

        try (FileOutputStream keyOut = new FileOutputStream(filePath)) {
            keyOut.write(secretKey.getEncoded());
        }

        System.out.println("Clave generada y guardada en: " + filePath);
    }

    // Método para cargar la clave desde un archivo
    public static SecretKey cargarClave() throws IOException {
        byte[] keyBytes = new byte[32]; // 256 bits / 8 = 32 bytes

        // Obtener la ruta del archivo en la raíz del proyecto
        String filePath = System.getProperty("user.dir") + "/secret.key";

        try (FileInputStream keyIn = new FileInputStream(filePath)) {
            keyIn.read(keyBytes);
        }

        return new SecretKeySpec(keyBytes, "AES");
    }
}
