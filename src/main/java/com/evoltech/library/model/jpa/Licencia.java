package com.evoltech.library.model.jpa;

import com.evoltech.library.model.base.BaseJpaEntity;
import com.evoltech.library.repository.ColeccionRepository;
import com.evoltech.library.repository.EscuelaRepository;
import lombok.*;
import org.springframework.beans.factory.annotation.Autowired;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import java.io.Serializable;
import java.time.LocalDateTime;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = false)
@Entity
@Data
public class Licencia extends BaseJpaEntity<Long> implements Serializable {

    public Licencia(String nombre, String escuelaNombre, String coleccionNombre, String nivel, String edicion){
        this.nombre = nombre;
        this.isEnable = true;
        this.escuelaNombre = escuelaNombre;
        this.coleccionNombre = coleccionNombre;
        this.nivel = nivel;
        this.edicion = edicion;

    }

    public Licencia(String nombre, Coleccion coleccion, boolean isEnable){
        this.nombre = nombre;
        this.setColeccion(coleccion);
        this.isEnable = isEnable;
    }

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotEmpty @NotBlank
    private String nombre;
    private String coleccionNombre;
    private String nivel;
    private String edicion;
    private String escuelaNombre;

    private int asientos;

    private boolean isEnable;

    private LocalDateTime beginDate;
    private LocalDateTime endDate;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "escuela_id")
    private Escuela escuela;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "coleccion_id")
    private Coleccion coleccion;

}
