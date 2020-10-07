package com.evoltech.library.service;

import com.evoltech.library.model.jpa.Coleccion;
import com.evoltech.library.model.jpa.Documento;
import com.evoltech.library.repository.ColeccionRepository;
import com.evoltech.library.repository.UsuarioRepository;
import com.evoltech.library.util.ColeccionDisplay;
import com.evoltech.library.util.NombreNivelColeccion;
import com.evoltech.library.util.NombreNivelEdicionColeccion;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

import static java.util.stream.Collectors.groupingBy;

@Service
public class ColeccionService {

    Logger log = LoggerFactory.getLogger(EscuelaService.class);

    @Autowired
    ColeccionRepository coleccionRepository;

    @Autowired
    UsuarioRepository usuarioRepository;

    public List<String> getNombres() {
        Map<String, List<Coleccion>> nombres = coleccionRepository.findAll().stream()
        .collect(groupingBy(Coleccion::getNombre));
        Set<String> setNombres = nombres.keySet();
        List<String> arrList = new ArrayList<>(setNombres);
        return arrList;
    }

    public List<NombreNivelColeccion> getNombresNivel() {
        Map<NombreNivelColeccion, List<Coleccion>> group = coleccionRepository.findAll().stream()
                .collect(groupingBy(coleccion -> new NombreNivelColeccion(coleccion.getNombre(), coleccion.getNivel())));

        Set<NombreNivelColeccion> setNombres = group.keySet();
        List<NombreNivelColeccion> arrList = new ArrayList<>(setNombres);
        return arrList;
    }

    public List<NombreNivelEdicionColeccion> getNombresNivelEdicion() {
        Map<NombreNivelEdicionColeccion, List<Coleccion>> group = coleccionRepository.findAll().stream()
                .collect(groupingBy(coleccion -> new NombreNivelEdicionColeccion(coleccion.getNombre(), coleccion.getNivel(), coleccion.getEdicion())));

        Set<NombreNivelEdicionColeccion> setNombres = group.keySet();
        List<NombreNivelEdicionColeccion> arrList = new ArrayList<>(setNombres);
        return arrList;
    }

    public HashMap<String, String> getListaImagenesOff() {
        HashMap<String, String> imagenes = new HashMap<>();
        imagenes.put("ABC", "/images/abc-off.png");
        imagenes.put("1,2,3", "/images/123-off.png");
        imagenes.put("CURSIVA", "/images/cursiva-off.png");
        imagenes.put("I DO SPEAK", "/images/idospeak-off.png");
        imagenes.put("CARPETA CLAVE", "/images/CM_n1_0.png");
        imagenes.put("PARA LA EDUCADORA", "/images/CM_n1_0.png");

        return imagenes;
    }

    public HashMap<String, String> getListaImagenesOn(){
        HashMap<String, String> imagenes = new HashMap<>();
        imagenes.put("ABC", "/images/colecciones-abc-on.png");
        imagenes.put("1,2,3", "/images/colecciones-123-on.png");
        imagenes.put("CURSIVA", "/images/colecciones-abc-cursiva-on.png");
        imagenes.put("I DO SPEAK", "/images/colecciones-ido-speak-on.png");
        imagenes.put("CARPETA CLAVE", "/images/CM_n1_0.png");
        imagenes.put("PARA LA EDUCADORA", "/images/CM_n1_0.png");

        return imagenes;
    }

    public ArrayList<ColeccionDisplay> coleccionesDisplay(List<Coleccion> colecciones){
        List<String> nombres = getNombres();
        HashMap<String, String> imagenesOn = getListaImagenesOn();
        HashMap<String, String> imagenesOff = getListaImagenesOff();
        ArrayList<ColeccionDisplay> coleccionDisplays = new ArrayList<>();
        ArrayList<ColeccionDisplay> activas = new ArrayList<>();

        for (String nombre : nombres){
            if (colecciones.stream().filter(c -> c.getNombre().equals(nombre)).toArray().length > 0) {
                Coleccion coleccion = (Coleccion) colecciones.stream().filter(c -> c.getNombre().equals(nombre)).toArray()[0];
                String imagen = imagenesOn.get(nombre);
                String guid = coleccion.getGuid();
                ColeccionDisplay coleccionDisplay = new ColeccionDisplay(nombre, imagen, guid);
                activas.add(coleccionDisplay);
            } else {
                String imagen = imagenesOff.get(nombre);
                String guid = "nula";
                ColeccionDisplay coleccionDisplay = new ColeccionDisplay(nombre, imagen, guid);
                activas.add(coleccionDisplay);
            }
        }
        return activas;
    }

    public List<Documento> getDocumentoByColeccionGuid(String guid){
        Coleccion coleccion = coleccionRepository.findByGuid(guid);
        List<Documento> documentos = coleccion.getDocumentos();
        return documentos;
    }
}