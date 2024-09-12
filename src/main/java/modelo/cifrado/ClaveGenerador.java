package modelo.cifrado;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

public class ClaveGenerador {

    private static final String CLAVE_ARCHIVO = "secret.key";

    // Método para generar y guardar la clave en un archivo
    public static void generarClave() throws Exception {
        // Verificar si el archivo ya existe
        if (Files.exists(Paths.get(CLAVE_ARCHIVO))) {
            System.out.println("La clave ya ha sido generada y guardada.");
            return; // No generar una nueva clave
        }

        // Generar una nueva clave
        KeyGenerator keyGen = KeyGenerator.getInstance("AES");
        keyGen.init(256); // Para AES-256
        SecretKey secretKey = keyGen.generateKey();

        // Guardar la clave en un archivo
        try (FileOutputStream keyOut = new FileOutputStream(CLAVE_ARCHIVO)) {
            keyOut.write(secretKey.getEncoded());
        }

        System.out.println("Clave generada y guardada en 'secret.key'");
    }

    // Método para cargar la clave desde un archivo
    public static SecretKey cargarClave() throws IOException {
        // Verificar si el archivo de clave existe antes de intentar cargarlo
        if (!Files.exists(Paths.get(CLAVE_ARCHIVO))) {
            throw new FileNotFoundException("El archivo de clave no existe.");
        }

        byte[] keyBytes = new byte[32]; // 256 bits / 8 = 32 bytes
        try (FileInputStream keyIn = new FileInputStream(CLAVE_ARCHIVO)) {
            keyIn.read(keyBytes);
        }
        return new SecretKeySpec(keyBytes, "AES");
    }
    
    
    
}
