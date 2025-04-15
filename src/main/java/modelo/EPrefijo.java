/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

/**
 *
 * @author rodri
 */
public enum EPrefijo {
    INVENTARIO_1("INV_001"), // SOLO ADMINISTRADOR
    INVENTARIO_2("INV_002"), // VISIBLE PARA TODOS
    INVENTARIO_3("INV_003"); // DOCENTES VISIBLE PARA TODOS

    public final String p;

    EPrefijo(String p) {
        this.p = p;
    }

    public String getValor() {

        return p;

    }

}
