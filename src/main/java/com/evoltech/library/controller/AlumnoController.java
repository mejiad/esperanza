package com.evoltech.library.controller;

import com.evoltech.library.model.jpa.Coleccion;
import com.evoltech.library.model.jpa.Documento;
import com.evoltech.library.model.jpa.Escuela;
import com.evoltech.library.model.jpa.Usuario;
import com.evoltech.library.repository.ColeccionRepository;
import com.evoltech.library.repository.DocumentoRepository;
import com.evoltech.library.repository.EscuelaRepository;
import com.evoltech.library.repository.UsuarioRepository;
import com.evoltech.library.service.ColeccionService;
import com.evoltech.library.service.EscuelaService;
import com.evoltech.library.util.ColeccionDisplay;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class AlumnoController {

    Logger log = LoggerFactory.getLogger(AlumnoController.class);

    @Autowired
    EscuelaRepository escuelaRepository;

    @Autowired
    ColeccionRepository coleccionRepository;

    @Autowired
    DocumentoRepository documentoRepository;

    @Autowired
    EscuelaService escuelaService;

    @Autowired
    UsuarioRepository usuarioRepository;

    @Autowired
    ColeccionService coleccionService;

    @RequestMapping(value = "/acolecciones", method= RequestMethod.GET)
    public String colecciones(HttpServletRequest request, Model model){
        Principal principal = request.getUserPrincipal();
        String userName = principal.getName();

        log.warn(" Principal: " + principal.getName());
        Usuario usuario = usuarioRepository.findByEmailIgnoreCase(userName);

        // colecciones por alumno
        List<Coleccion> colecciones = escuelaService.getColeccionesByLicenciasForUser(usuario.getId());

        ArrayList<ColeccionDisplay> coleccionesDisplay = coleccionService.coleccionesDisplay(colecciones);

        model.addAttribute("colecciones", coleccionesDisplay);

        return "AColecciones";
    }

    @RequestMapping(value = "/adocumentos/{guid}", method= RequestMethod.GET)
    public String documentos(@PathVariable String guid, Model model){
        // esperamos el guid de la categoria
        Map<String, List<Documento>> categorias = coleccionService.getCategoriasDocumentosByColeccionGuid(guid);
        model.addAttribute("categorias", categorias);

        return "ADocumentos";
    }

    @RequestMapping(value = "/adocumento/{guid}", method= RequestMethod.GET)
    public String documento(@PathVariable String guid, Model model){
        // esperamos un map con la categoria el documento
        Documento documento = coleccionService.getDocumentoByGuid(guid);

        model.addAttribute("documento", documento);
        return "ADocumento";
    }

}
