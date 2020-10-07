package com.evoltech.library.util;

import lombok.Data;
import java.util.Objects;

@Data
public class NombreNivelColeccion {
    public NombreNivelColeccion( String coleccion, String nivel) {
        this.coleccion = coleccion;
        this.nivel = nivel;
    }

    String coleccion;
    String nivel;

    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;

        if(!(obj instanceof NombreNivelColeccion)) return true;
        NombreNivelColeccion tuple = (NombreNivelColeccion) obj;

        return Objects.equals(tuple.coleccion, this.coleccion) &&
                Objects.equals(tuple.nivel, this.nivel);
    }

    @Override
    public int hashCode() {
        return Objects.hash(this.coleccion + this.nivel );
    }
}