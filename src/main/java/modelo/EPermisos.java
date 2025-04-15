
package modelo;

/**
 *
 * @author rodri
 */
public enum EPermisos {
    ADMINISTRADOR(2),
    DOCENTE(1),
    LECTOR(3);

    private final int valor;

    EPermisos(int valor) {
        this.valor = valor;
    }

    public int getValor() {
        return valor;
    }
}
