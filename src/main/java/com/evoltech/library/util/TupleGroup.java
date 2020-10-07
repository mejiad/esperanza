package com.evoltech.library.util;

import lombok.Data;

import java.util.Objects;

@Data
public class TupleGroup {
    public TupleGroup( String coleccion, String nivel, String edicion) {
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

        if(!(obj instanceof TupleGroup)) return true;
        TupleGroup tuple = (TupleGroup) obj;

        return Objects.equals(tuple.coleccion, this.coleccion) && Objects.equals(tuple.edicion, this.edicion) &&
                Objects.equals(tuple.nivel, this.nivel);
    }

    @Override
    public int hashCode() {
        return Objects.hash(this.coleccion + this.edicion + this.edicion);
    }
}