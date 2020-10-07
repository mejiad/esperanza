package com.evoltech.library.util;

import lombok.Data;

import java.util.Objects;

@Data
public class NombreNivelEdicionColeccion {
    public NombreNivelEdicionColeccion(String coleccion, String nivel, String edicion) {
        this.coleccion = coleccion;
        this.nivel = nivel;
        this.edicion = edicion;
    }

    String coleccion;
    String nivel;
    String edicion;

    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;

        if(!(obj instanceof NombreNivelEdicionColeccion)) return true;
        NombreNivelEdicionColeccion tuple = (NombreNivelEdicionColeccion) obj;

        return Objects.equals(tuple.coleccion, this.coleccion) && Objects.equals(tuple.edicion, this.edicion) &&
                Objects.equals(tuple.nivel, this.nivel);
    }

    @Override
    public int hashCode() {
        return Objects.hash(this.coleccion + this.nivel + this.edicion);
    }
}