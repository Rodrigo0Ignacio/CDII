
package modelo.sql.interface_CRUD;

import java.util.ArrayList;


public interface CRUD<T> {
    
	public void crear(T objeto);
	public ArrayList<T> leer();
	public void actualizar(T objeto, String i);
	public void eliminar(String i);

}
