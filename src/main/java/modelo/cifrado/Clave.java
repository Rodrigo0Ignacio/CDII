
package modelo.cifrado;
import javax.crypto.SecretKey;

/**
 *
 * @author Admin_sala
 */
public class Clave {
    
   private SecretKey claveSecreta;
    
    public Clave() throws Exception{

           ClaveGenerador.generarClave();
           this.claveSecreta = ClaveGenerador.cargarClave();
           
    }
    
    public String cifrar(String valor) throws Exception{
      return AESEncryption.cifrar(valor, claveSecreta);
    }
    
    public String descifrar(String valor) throws Exception{
    return AESEncryption.descifrar(valor, claveSecreta);
    }

}
