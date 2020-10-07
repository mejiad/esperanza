package com.evoltech.library.util;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Builder
@AllArgsConstructor
@EqualsAndHashCode
@Data
public class ColeccionDisplay {
    private String nombre;
    private String caratula;
    private String guid;
}
