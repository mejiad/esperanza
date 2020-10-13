package com.evoltech.library.service;

import com.evoltech.library.model.jpa.Coleccion;
import com.evoltech.library.model.jpa.Documento;
import com.evoltech.library.repository.ColeccionRepository;
import com.evoltech.library.repository.DocumentoRepository;
import com.evoltech.library.repository.UsuarioRepository;
import com.evoltech.library.util.ColeccionDisplay;
import com.evoltech.library.util.NombreNivelColeccion;
import com.evoltech.library.util.NombreNivelEdicionColeccion;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import static java.util.stream.Collectors.groupingBy;

@Service
public class ColeccionService {

    Logger log = LoggerFactory.getLogger(EscuelaService.class);

    @Autowired
    ColeccionRepository coleccionRepository;

    @Autowired
    UsuarioRepository usuarioRepository;

    @Autowired
    DocumentoRepository documentoRepository;

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
        nombres.remove("CARPETA CLAVE");
        nombres.remove("PARA LA EDUCADORA");
        HashMap<String, String> imagenesOn = getListaImagenesOn();
        HashMap<String, String> imagenesOff = getListaImagenesOff();
        ArrayList<ColeccionDisplay> coleccionDisplays = new ArrayList<>();
        ArrayList<ColeccionDisplay> activas = new ArrayList<>();

        for (String nombre : nombres){
            if (colecciones.stream().filter(c -> c.getNombre().equals(nombre)).toArray().length > 0) {
                Coleccion coleccion = (Coleccion) colecciones.stream().filter(c -> c.getNombre().equals(nombre)).toArray()[0];
                String imagen = imagenesOn.get(nombre);
                String guid = coleccion.getGuid();
                ColeccionDisplay coleccionDisplay = new ColeccionDisplay(nombre, imagen, guid, "true");
                activas.add(coleccionDisplay);
            } else {
                String imagen = imagenesOff.get(nombre);
                String guid = "http://www.applica2.com.mx";
                ColeccionDisplay coleccionDisplay = new ColeccionDisplay(nombre, imagen, guid, "false");
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

    public Map<String, List<Documento>> getCategoriasDocumentosByColeccionGuid(String guid){
        Coleccion coleccion = coleccionRepository.findByGuid(guid);
        Map<String, List<Documento>> result = coleccion.getDocumentos().stream().collect(groupingBy(Documento::getCategoria));

        // Map<String, List<Documento>> result = new HashMap<>();
        Coleccion allAll = coleccionRepository.findByNombreAndNivelAndEdicion(coleccion.getNombre(), "All", "All");
        if (allAll != null) {
            Map<String, List<Documento>> documentosAllAll = allAll.getDocumentos().stream().collect(groupingBy(Documento::getCategoria));

            result = Stream
                    .concat(result.entrySet()
                            .stream(), documentosAllAll.entrySet().stream())
                    .collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue));
        }

        Coleccion nivelAll = coleccionRepository.findByNombreAndNivelAndEdicion(coleccion.getNombre(), coleccion.getNivel(), "All");
        if (nivelAll != null) {
            Map<String, List<Documento>> documentosNivelAll = nivelAll.getDocumentos().stream().collect(groupingBy(Documento::getCategoria));

            result = Stream
                    .concat(result.entrySet()
                            .stream(), documentosNivelAll.entrySet().stream())
                    .collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue));
        }


        Coleccion allEdicion = coleccionRepository.findByNombreAndNivelAndEdicion(coleccion.getNombre(), "All", coleccion.getEdicion());
        if (allEdicion != null) {
            Map<String, List<Documento>> documentosAllEdicion = allEdicion.getDocumentos().stream().collect(groupingBy(Documento::getCategoria));

            result = Stream
                    .concat(result.entrySet()
                            .stream(), documentosAllEdicion.entrySet().stream())
                    .collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue));
        }

        return result;
    }

    public Documento getDocumentoByGuid(String guid){
        Documento documento = documentoRepository.findByGuid(guid);
        return documento;
    }
}