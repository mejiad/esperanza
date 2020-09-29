package com.evoltech.library.model.jpa;

import com.evoltech.library.model.base.BaseJpaEntity;
import lombok.*;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import java.io.Serializable;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = false)
@Entity
@Data
public class Usuario extends BaseJpaEntity<Long> implements Serializable {

    public Usuario(String email, String nombre, String password) {
        this.email= email;
        this.nombre= nombre;
        this.password = password;
        this.role = "USER";
        this.tipo = "ALUMNO";
        PasswordEncoder encoder = PasswordEncoderFactories.
                createDelegatingPasswordEncoder();
        this.password = encoder.encode(password);
    }

    public Usuario(String email, String nombre, String password, String role){
        this(email, nombre, password);
        this.role = role;
    }

    public Usuario(String email, String nombre, String password, String role, String tipo){
        this(email, nombre, password, role);
        this.tipo = tipo;
    }

    public Usuario(String email, String nombre, String password, String role, String tipo, String nivel, String grupo){
        this(email, nombre, password, role, tipo);
        this.nivel = nivel;
        this.grupo = grupo ;
    }

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotEmpty @NotBlank @Column(unique = true)
    private String email;

    @NotEmpty @NotBlank
    private String nombre;

    @NotEmpty
    private String role;

    @NotEmpty
    private String password;

    private String tipo;
    private String nivel;
    private String grupo;

    private boolean enabled = true;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "escuela_id")
    private Escuela escuela;

}