package com.evoltech.library.model.jpa;

import com.evoltech.library.model.base.BaseJpaEntity;
import com.vladmihalcea.hibernate.type.array.StringArrayType;
import lombok.*;
import org.hibernate.annotations.Type;
import org.hibernate.annotations.TypeDef;
import org.hibernate.annotations.TypeDefs;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import java.io.Serializable;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode
@Entity
@TypeDefs({
    @TypeDef(
        name = "string-array",
        typeClass = StringArrayType.class
    )
})
@Data
public class Documento extends BaseJpaEntity<Long> implements Serializable {

    public Documento(String nombre, String categoria, String descripcion, String uri, String mimeType, String icono){
        this.nombre = nombre;
        if (descripcion.length() > 200) {
            this.descripcion = descripcion.substring(0, 200);
        } else {
            this.descripcion = descripcion;
        }
        this.categoria = categoria;
        this.uri = uri;
        this.mimeType = mimeType;
        this.icono = icono;
        this.archivos = null;
    }

    public Documento(String nombre, String categoria, String descripcion, String uri, String mimeType, String icono, String[] archivos){
        this(nombre, categoria, descripcion, uri, mimeType, icono);
        this.archivos = archivos;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NonNull @NotEmpty private String nombre;
    @NonNull @NotEmpty private String descripcion;
    @NonNull @NotEmpty private String uri;
    @NonNull @NotEmpty private String mimeType;
    @NotEmpty
    private String categoria;
    @NonNull private LocalDate fecha;
    private String icono;

    @Type(type = "string-array")
    @Column(
            name = "archivos",
            columnDefinition = "text[]"
    )
    private String[] archivos;

}
