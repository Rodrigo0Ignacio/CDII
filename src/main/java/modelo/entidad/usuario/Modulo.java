
package modelo.entidad.usuario;

/**
 *
 * @author Admin_sala
 */
public class Modulo {
    private int id_mod;
    private String operacion_pagina;
    private int id_rol;
    private int id_operacion;

    public Modulo(int id_mod, String operacion_pagina, int id_rol, int id_operacion) {
        this.id_mod = id_mod;
        this.operacion_pagina = operacion_pagina;
        this.id_rol = id_rol;
        this.id_operacion = id_operacion;
    }

    public int getId_mod() {
        return id_mod;
    }

    public void setId_mod(int id_mod) {
        this.id_mod = id_mod;
    }

    public String getOperacion_pagina() {
        return operacion_pagina;
    }

    public void setOperacion_pagina(String operacion_pagina) {
        this.operacion_pagina = operacion_pagina;
    }

    public int getId_rol() {
        return id_rol;
    }

    public void setId_rol(int id_rol) {
        this.id_rol = id_rol;
    }

    public int getId_operacion() {
        return id_operacion;
    }

    public void setId_operacion(int id_operacion) {
        this.id_operacion = id_operacion;
    }
    
}
