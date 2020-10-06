package com.evoltech.library.model.jpa;

import lombok.*;

@Builder
@EqualsAndHashCode
@Data
public class DatosColecciones {
   final String coleccion;
   final String nivel;
   final String edicion;
   final String tipo;
   final String documento;
   final String descripcion;
   final String path;
   final String mime;
   final String icono;

    public DatosColecciones(String coleccion, String nivel, String edicion, String tipo, String documento, String descripcion, String path, String mime, String icono) {
       this.coleccion = coleccion;
       this.nivel = nivel;
       this.edicion = edicion;
       this.tipo = tipo;
       this.documento = documento;
       this.descripcion = descripcion;
       this.path = path;
       this.mime = mime;
       this.icono = icono;
    }

}
