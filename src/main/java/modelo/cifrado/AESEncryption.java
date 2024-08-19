
package modelo.cifrado;

import java.security.SecureRandom;
import java.util.Base64;
import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.spec.IvParameterSpec;


public class AESEncryption {
    
    // Método para cifrar un mensaje
    public static String cifrar(String mensaje, SecretKey key) throws Exception {
        Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
        byte[] iv = new byte[cipher.getBlockSize()];
        SecureRandom random = new SecureRandom();
        random.nextBytes(iv);
        IvParameterSpec ivParams = new IvParameterSpec(iv);

        cipher.init(Cipher.ENCRYPT_MODE, key, ivParams);
        byte[] mensajeCifrado = cipher.doFinal(mensaje.getBytes("UTF-8"));

        // Concatenar IV y mensaje cifrado y codificar en Base64
        byte[] ivYMensajeCifrado = new byte[iv.length + mensajeCifrado.length];
        System.arraycopy(iv, 0, ivYMensajeCifrado, 0, iv.length);
        System.arraycopy(mensajeCifrado, 0, ivYMensajeCifrado, iv.length, mensajeCifrado.length);

        return Base64.getEncoder().encodeToString(ivYMensajeCifrado);
    }

    // Método para descifrar un mensaje
    public static String descifrar(String mensajeCifrado, SecretKey key) throws Exception {
        Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
        byte[] ivYMensajeCifrado = Base64.getDecoder().decode(mensajeCifrado);

        // Extraer IV y mensaje cifrado
        byte[] iv = new byte[cipher.getBlockSize()];
        byte[] mensajeCifradoBytes = new byte[ivYMensajeCifrado.length - iv.length];
        System.arraycopy(ivYMensajeCifrado, 0, iv, 0, iv.length);
        System.arraycopy(ivYMensajeCifrado, iv.length, mensajeCifradoBytes, 0, mensajeCifradoBytes.length);

        IvParameterSpec ivParams = new IvParameterSpec(iv);
        cipher.init(Cipher.DECRYPT_MODE, key, ivParams);
        byte[] mensajeDescifrado = cipher.doFinal(mensajeCifradoBytes);

        return new String(mensajeDescifrado, "UTF-8");
    }

    
    
}
