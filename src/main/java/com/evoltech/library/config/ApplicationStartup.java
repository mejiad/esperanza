package com.evoltech.library.config;

import com.evoltech.library.model.jpa.*;
import com.evoltech.library.repository.*;
import com.evoltech.library.util.NombreNivelEdicionColeccion;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

import static java.util.stream.Collectors.groupingBy;

@Component
public class ApplicationStartup implements ApplicationListener<ApplicationReadyEvent> {

    Logger log = LoggerFactory.getLogger(ApplicationStartup.class);

    @Autowired
    EscuelaRepository escuelaRepository;

    @Autowired
    UsuarioRepository usuarioRepository;

    @Autowired
    ColeccionRepository coleccionRepository;

    @Autowired
    DocumentoRepository documentoRepository;

    @Autowired
    LicenciaRepository licenciaRepository;

    private int ESCUELAS = 10;
    private int MAX_USUARIOS = 5;

    // Número de lista, Nombre, Grupo, Nivel
    String[][] alumnos_csv = new String[][] {
        { "1", "ABREU PAEZ SOFÍA", "1o A Pre", "Nivel 1"},
        { "2", "BARRAGÁN VILLAMIL INÉS", "1o A Pre", "Nivel 1"},
        { "3", "BAUER GALLO ALEXA", "1o A Pre", "Nivel 1"},
        { "4", "BENAVIDES GÓMEZ-CORONEL EMILIA", "1o A Pre", "Nivel 1"},
        { "5", "BRAVO LOZOYA MARIALE", "1o A Pre", "Nivel 1"},
        { "6", "CURIEL GOROZPE EMILIO", "1o A Pre", "Nivel 1"},
        { "7", "DE LA ROSA BONNER PAULA", "1o A Pre", "Nivel 1"},
        { "8", "DE LEÓN GARCÍA FERNANDA", "1o A Pre", "Nivel 1"},
        { "9", "FLORES MÉNDEZ GONZALO", "1o A Pre", "Nivel 1"},
        { "10", "IBÁÑEZ VILLAVICENCIO SANTIAGO", "1o A Pre", "Nivel 1"},
        { "11", "LOZANO PÉREZ DIEGO", "1o A Pre", "Nivel 1"},
        { "12", "MORETT DOMENECH MARÍA JOSÉ", "1o A Pre", "Nivel 1"},
        { "13", "OLAYO SIERRA PABLO", "1o A Pre", "Nivel 1"},
        { "14", "PIETRA SANTA ABUD LEONARDO", "1o A Pre", "Nivel 1"},
        { "15", "SÁNCHEZ ORLANZZINI MARÍA INÉS", "1o A Pre", "Nivel 1"},
        { "16", "SANDOVAL MARTÍNEZ EMILIO", "1o A Pre", "Nivel 1"},
        { "17", "TORRES TRIGUEROS MARTINA", "1o A Pre", "Nivel 1"},
        { "18", "VALENZUELA ZORRILLA JULIA", "1o A Pre", "Nivel 1"},
        { "19", "VALLE DIEGO -FERNÁNDEZ JOSÉ MIGUEL", "1o A Pre", "Nivel 1"},
        { "20", "VALLIN DE VECCHI ANDRÉS", "1o A Pre", "Nivel 1"},
        { "1", "CASTAÑEDA AMUTIO INÉS", "1o B Pre", "Nivel 1"},
        { "2", "CRESTANI ORDOÑEZ ÁLVARO", "1o B Pre", "Nivel 1"},
        { "3", "ESTUDILLO SALAZAR MILA", "1o B Pre", "Nivel 1"},
        { "4", "FIGUEROA ARROYO SARA MARÍA", "1o B Pre", "Nivel 1"},
        { "5", "GARCÍA NOVELO ALMUDENA", "1o B Pre", "Nivel 1"},
        { "6", "GUEVARA AGUILAR JERÓNIMO", "1o B Pre", "Nivel 1"},
        { "7", "HABIB CERVANTES REGINA", "1o B Pre", "Nivel 1"},
        { "8", "HERRERA MINA FADIA", "1o B Pre", "Nivel 1"},
        { "9", "ISLAS RODRIGUEZ DOMINICA", "1o B Pre", "Nivel 1"},
        { "10", "LONG RAMÍREZ ALFONSO", "1o B Pre", "Nivel 1"},
        { "11", "MONROY AGUERREBERE SANTIAGO", "1o B Pre", "Nivel 1"},
        { "12", "MORÁN ZURUTUZA BRUNO", "1o B Pre", "Nivel 1"},
        { "13", "NÁJERA VILLASEÑOR INÉS", "1o B Pre", "Nivel 1"},
        { "14", "OJEDA PAZ LUCIANA", "1o B Pre", "Nivel 1"},
        { "15", "ORIA Y KIEHNLE JOAQUÍN", "1o B Pre", "Nivel 1"},
        { "16", "POHLS COLORES JERÓNIMO", "1o B Pre", "Nivel 1"},
        { "17", "ROMERO MEJÍA MARIANA", "1o B Pre", "Nivel 1"},
        { "18", "RUÍZ DÍAZ REGINA", "1o B Pre", "Nivel 1"},
        { "19", "SENOSIAIN LOMELÍN PABLO", "1o B Pre", "Nivel 1"},
        { "1", "BONETA REYES JULIA", "1o C Pre", "Nivel 1"},
        { "2", "BRASSEL SOSA VICTORIA", "1o C Pre", "Nivel 1"},
        { "3", "CALDERÓN GUERRA NATALIA", "1o C Pre", "Nivel 1"},
        { "4", "DE VELASCO PHERES PÍA", "1o C Pre", "Nivel 1"},
        { "5", "ETCHEGARAY CASTRO JULIA", "1o C Pre", "Nivel 1"},
        { "6", "FRANCO DELGADO DAMIANA", "1o C Pre", "Nivel 1"},
        { "7", "GALEANA CAMACHO EMILIO", "1o C Pre", "Nivel 1"},
        { "8", "GARCÍA RAMOS MIRANDA", "1o C Pre", "Nivel 1"},
        { "9", "GROENEWOLD TOLSÁ JUAN PABLO", "1o C Pre", "Nivel 1"},
        { "10", "GUZMÁN DESDIER ELENA", "1o C Pre", "Nivel 1"},
        { "11", "MARTEL MALDONADO SEBASTIÁN", "1o C Pre", "Nivel 1"},
        { "12", "MARTÍNEZ HUERTA MIKEL", "1o C Pre", "Nivel 1"},
        { "13", "NICOLAU HERRERA JULIA", "1o C Pre", "Nivel 1"},
        { "14", "ORTEGA OSOYO FERNANDO", "1o C Pre", "Nivel 1"},
        { "15", "PUENTE CERÓN PABLO", "1o C Pre", "Nivel 1"},
        { "16", "REYGADAS DÍAZ MAXIMILIANO", "1o C Pre", "Nivel 1"},
        { "17", "RÍOS MORALES VALENTINA", "1o C Pre", "Nivel 1"},
        { "18", "ROMERO GILBERT MACARENA", "1o C Pre", "Nivel 1"},
        { "19", "ZUÑIGA GALVÁN BRUNO", "1o C Pre", "Nivel 1"},
        { "1", "ARROYO FERNÁNDEZ MATEO", "2o A Pre", "Nivel 2"},
        { "2", "BEJAR MUÑOZ ANDREA", "2o A Pre", "Nivel 2"},
        { "3", "BOLEAGA LUNA MARIANA", "2o A Pre", "Nivel 2"},
        { "4", "CAMPOS LEMUS RODRIGO DE BORJA", "2o A Pre", "Nivel 2"},
        { "5", "CERÓN OVIEDO JORDI", "2o A Pre", "Nivel 2"},
        { "6", "DÍAZ SANCHEZ MARÍA EMILIA", "2o A Pre", "Nivel 2"},
        { "7", "DOSAL NAVA JAVIER", "2o A Pre", "Nivel 2"},
        { "8", "FABRIS CANO VALENTINA", "2o A Pre", "Nivel 2"},
        { "9", "FLORES FERNÁNDEZ RODRIGO", "2o A Pre", "Nivel 2"},
        { "10", "GÓMEZ CHICO MONTAÑO FERNANDO", "2o A Pre", "Nivel 2"},
        { "11", "HABIB CERVANTES ROMINA", "2o A Pre", "Nivel 2"},
        { "12", "HERNÁNDEZ VARGAS ROMINA", "2o A Pre", "Nivel 2"},
        { "13", "LARRE DEL PASO SEBASTIÁN", "2o A Pre", "Nivel 2"},
        { "14", "LLANO GUZMÁN MILA", "2o A Pre", "Nivel 2"},
        { "15", "MARRUFO GONZÁLEZ EMILIO", "2o A Pre", "Nivel 2"},
        { "16", "MARTÍNEZ DEL RÍO BORBOLLA LORENZO", "2o A Pre", "Nivel 2"},
        { "17", "MARTÍNEZ GONZÁLEZ PAULA RENATA", "2o A Pre", "Nivel 2"},
        { "18", "MORENO GUIZAR CONSTANZA", "2o A Pre", "Nivel 2"},
        { "19", "NICOLAU HERRERA IÑAKI", "2o A Pre", "Nivel 2"},
        { "20", "OMAÑA TATTERSFIELD ELENA", "2o A Pre", "Nivel 2"},
        { "21", "ROMANO DÍAZ ALEXA", "2o A Pre", "Nivel 2"},
        { "22", "ROVELO CORNEJO HÉCTOR MIGUEL", "2o A Pre", "Nivel 2"},
        { "23", "SÁENZ AMADO PABLO", "2o A Pre", "Nivel 2"},
        { "24", "TOSTADO ALEMÁN MARÍA", "2o A Pre", "Nivel 2"},
        { "25", "URRUCHUA BARRI ARTURO", "2o A Pre", "Nivel 2"},
        { "26", "YUNES ALONSO TOMÁS", "2o A Pre", "Nivel 2"},
        { "27", "FABRIS CANO JORGE", "2o A Pre", "Nivel 2"},
        { "1", "ADAME ALMAZÁN RODRIGO", "2o B Pre", "Nivel 2"},
        { "2", "AMBRÍS CANTÚ LUCAS", "2o B Pre", "Nivel 2"},
        { "3", "ARMAS CÓRTES DIANA LUCÍA", "2o B Pre", "Nivel 2"},
        { "4", "CANSECO TORRES CAMILA", "2o B Pre", "Nivel 2"},
        { "5", "COBIAN MARTÍNEZ BERNARDO", "2o B Pre", "Nivel 2"},
        { "6", "CONTRERAS AGUIRRE ROSA VICTORIA", "2o B Pre", "Nivel 2"},
        { "7", "CZAPLEWSKI ZAMA KATYA", "2o B Pre", "Nivel 2"},
        { "8", "ENRÍQUEZ VARGAS JULIA", "2o B Pre", "Nivel 2"},
        { "9", "FÉREZ VERGARA JOSÉ", "2o B Pre", "Nivel 2"},
        { "10", "FLORES VERA SEBASTIÁN", "2o B Pre", "Nivel 2"},
        { "11", "FUENTES RAZO JOEL DARÍO", "2o B Pre", "Nivel 2"},
        { "12", "GARCÍA PELAYO FERNANDEZ DEL CAMPO PEDRO", "2o B Pre", "Nivel 2"},
        { "13", "GÓMEZ DÍAZ DIEGO", "2o B Pre", "Nivel 2"},
        { "14", "HERNÁNDEZ MURRAY EMILIANO", "2o B Pre", "Nivel 2"},
        { "15", "HERRERA NAZAR XIMENA", "2o B Pre", "Nivel 2"},
        { "16", "IBARRA HUERTA VALENTINA", "2o B Pre", "Nivel 2"},
        { "17", "LÓPEZ KALIS FERNANDA", "2o B Pre", "Nivel 2"},
        { "18", "MONROY FREGOSO ELISA", "2o B Pre", "Nivel 2"},
        { "19", "MOURET MESTA PATRICIO", "2o B Pre", "Nivel 2"},
        { "20", "OCHOA GALINDO GABRIEL", "2o B Pre", "Nivel 2"},
        { "21", "OROZCO GALLO JUAN", "2o B Pre", "Nivel 2"},
        { "22", "PARES ESPINOSA LUCÍA", "2o B Pre", "Nivel 2"},
        { "23", "PÉREZ GAY VÁZQUEZ AINHOA", "2o B Pre", "Nivel 2"},
        { "24", "PRUD HOMME COTERA JOSÉ MARÍA",	"2o B Pre", "Nivel 2"},
        { "25", "QUINTANA PAYRÓ MARÍA CAMILA", "2o B Pre", "Nivel 2"},
        { "26", "RODRÍGUEZ URRUCHUA SEBASTIÁN", "2o B Pre", "Nivel 2"},
        { "27", "SAN ROMÁN ESCALANTE FRANCO", "2o B Pre", "Nivel 2"},
        { "1", "BELLO SOSA ANDRÉS", "2o C Pre", "Nivel 2"},
        { "2", "BRAVO LOZOYA SANTIAGO", "2o C Pre", "Nivel 2"},
        { "3", "CARMONA BARAJAS JUAN MANUEL", "2o C Pre", "Nivel 2"},
        { "4", "CHÁVEZ SOTO SANTIAGO", "2o C Pre", "Nivel 2"},
        { "5", "COLLADA TRON ALFONSO", "2o C Pre", "Nivel 2"},
        { "6", "CURTO MENDIETA BÁRBARA", "2o C Pre", "Nivel 2"},
        { "7", "DÁVALOS ÁLVAREZ ISABEL", "2o C Pre", "Nivel 2"},
        { "8", "ECHENIQUE MARTÍNEZ OLIVIA", "2o C Pre", "Nivel 2"},
        { "9", "EDELBERG VILLA LEA", "2o C Pre", "Nivel 2"},
        // { "10", "FABRIS CANO JORGE", "2o C Pre", "Nivel 2"},
        { "11", "GALEANA CAMACHO IKER", "2o C Pre", "Nivel 2"},
        { "12", "GARZA ESTRADA JOSÉ ANDRÉS", "2o C Pre", "Nivel 2"},
        { "13", "GOROSTIZA GOROSTIETA AINHOA", "2o C Pre", "Nivel 2"},
        { "14", "HERREJÓN HERNÁNDEZ LUCÍA", "2o C Pre", "Nivel 2"},
        { "15", "IBARRA GÓMEZ JERÓNIMO", "2o C Pre", "Nivel 2"},
        { "16", "MARTÍNEZ SOTO SOFÍA", "2o C Pre", "Nivel 2"},
        { "17", "MEJÍA GIL MARÍA", "2o C Pre", "Nivel 2"},
        { "18", "MORGAN PALAFOX MATEO", "2o C Pre", "Nivel 2"},
        { "19", "PESTANA URIBE IÑAKI", "2o C Pre", "Nivel 2"},
        { "20", "ROSALES LEDESMA CARLOS", "2o C Pre", "Nivel 2"},
        { "21", "RUEDA CONTRERAS SANTIAGO", "2o C Pre", "Nivel 2"},
        { "22", "RUÍZ BARROSO JAVIER", "2o C Pre", "Nivel 2"},
        { "23", "SÁNCHEZ MEDINA ANDREA", "2o C Pre", "Nivel 2"},
        { "24", "SÁNCHEZ SANTANDER SOFÍA", "2o C Pre", "Nivel 2"},
        { "25", "TOMINEY RUIZ OPHELIA EILIDH", "2o C Pre", "Nivel 2"},
        { "26", "VÁZQUEZ MENOCAL VALENTINA", "2o C Pre", "Nivel 2"},
        { "27", "ZAMORA SODI PATRICIO", "2o C Pre", "Nivel 2"},
        { "1", "ANDRADE TOLEDO MARIANELLA", "3o A Pre", "Nivel 3"},
        { "2", "ARROYO PRENDES MARTINA", "3o A Pre", "Nivel 3"},
        { "3", "BAUER GALLO MILA", "3o A Pre", "Nivel 3"},
        { "4", "BUERON CARUSO MIKEL", "3o A Pre", "Nivel 3"},
        { "5", "CASTILLO BRASSEL ANDREA", "3o A Pre", "Nivel 3"},
        { "6", "CORDIER GARCÍA EMILIA FERNANDA", "3o A Pre", "Nivel 3"},
        { "7", "DE LA ROSA BONNER ESTEFANIA", "3o A Pre", "Nivel 3"},
        { "8", "DERSDEPANIAN SANJUAN CAROLINA", "3o A Pre", "Nivel 3"},
        { "9", "DOSAL NAVA FÁTIMA", "3o A Pre", "Nivel 3"},
        { "10", "FAVELA GALINATTI FERNANDO", "3o A Pre", "Nivel 3"},
        { "11", "FIGUEROA ARROYO SANTINO TADEO", "3o A Pre", "Nivel 3"},
        { "12", "FLORES MÉNDEZ EMILIANA", "3o A Pre", "Nivel 3"},
        { "13", "GOMEZ FLORES ABBY", "3o A Pre", "Nivel 3"},
        { "14", "GÓNGORA SOSA ANA SOFÍA", "3o A Pre", "Nivel 3"},
        { "15", "GONZÁLEZ ARENAS ELENA", "3o A Pre", "Nivel 3"},
        { "16", "INSUA ARGÜELLES DIEGO", "3o A Pre", "Nivel 3"},
        { "17", "LORENZANA MENDOZA ANDRÉ", "3o A Pre", "Nivel 3"},
        { "18", "PICAZZO COUTIÑO RODRIGO", "3o A Pre", "Nivel 3"},
        { "19", "PIETRA SANTA ABUD PAOLO", "3o A Pre", "Nivel 3"},
        { "20", "PUENTE CERON EMMA", "3o A Pre", "Nivel 3"},
        { "21", "RAFFUL JOSÉ MARINA", "3o A Pre", "Nivel 3"},
        { "22", "ROCHA AGUILAR ALEJANDRO", "3o A Pre", "Nivel 3"},
        { "23", "ROJÓN HARO GONZALO", "3o A Pre", "Nivel 3"},
        { "24", "ROLDÁN ROMO LUCA", "3o A Pre", "Nivel 3"},
        { "25", "SADEK BRAVO ANTONIO", "3o A Pre", "Nivel 3"},
        { "26", "SALGADO GAITAN HUMBERTO", "3o A Pre", "Nivel 3"},
        { "27", "SENOSIAIN LOMELÍN FERNANDO", "3o A Pre", "Nivel 3"},
        { "1", "ABREU PAEZ LUISA", "3o B Pre", "Nivel 3"},
        { "2", "ARBIDE PERDOMO NORA", "3o B Pre", "Nivel 3"},
        { "3", "BADA PELLICO MARÍA INÉS", "3o B Pre", "Nivel 3"},
        { "4", "BAJOS MEDINA NAIM", "3o B Pre", "Nivel 3"},
        { "5", "BORBOLLA HENDERSON ARANTZA", "3o B Pre", "Nivel 3"},
        { "6", "CABALLERO GARCIA JUAN PABLO", "3o B Pre", "Nivel 3"},
        { "7", "CALDERÓN GUERRA SANTIAGO", "3o B Pre", "Nivel 3"},
        { "8", "CERÓN VÁZQUEZ JERÓNIMO", "3o B Pre", "Nivel 3"},
        { "9", "CRESTANI ORDÓÑEZ NICOLÁS", "3o B Pre", "Nivel 3"},
        { "10", "DE LEON GARCIA MARIA JOSE", "3o B Pre", "Nivel 3"},
        { "11", "GARAY DE CASO LUISA", "3o B Pre", "Nivel 3"},
        { "12", "GARCIA SOSA SANTIAGO", "3o B Pre", "Nivel 3"},
        { "13", "GAVINELLI GARCÍA CAMILA", "3o B Pre", "Nivel 3"},
        { "14", "GÓMEZ CHICO SIMÓN ALMUDENA", "3o B Pre", "Nivel 3"},
        { "15", "GÓMEZ GALLARDO VALCÁRCEL EMA", "3o B Pre", "Nivel 3"},
        { "16", "GONZÁLEZ DIAZ CARLOTA", "3o B Pre", "Nivel 3"},
        { "17", "LÓPEZ ÁLVAREZ ANTÍA", "3o B Pre", "Nivel 3"},
        { "18", "MIGUEL BUSTO RAFAEL", "3o B Pre", "Nivel 3"},
        { "19", "MURCIO FLORES ANA PAOLA", "3o B Pre", "Nivel 3"},
        { "20", "PAREDES PÉREZ SANTINO", "3o B Pre", "Nivel 3"},
        { "21", "PÉREZ PONCE DE LEÓN MARÍA", "3o B Pre", "Nivel 3"},
        { "22", "PIN HERREJÓN SOFÍA", "3o B Pre", "Nivel 3"},
        { "23", "RIHBANY MUSI NICOLÁS", "3o B Pre", "Nivel 3"},
        { "24", "RUBIO - MANZANARES PURÓN BORJA", "3o B Pre", "Nivel 3"},
        { "25", "SANCHEZ TENA DE PEDRO IKER", "3o B Pre", "Nivel 3"},
        { "26", "SOLÓRZANO CARDOSO JERÓNIMO", "3o B Pre", "Nivel 3"},
        { "27", "URIBE JOSÉ JERÓNIMO", "3o B Pre", "Nivel 3"},
        { "28", "VELDERRAIN RÍOS LORENZO", "3o B Pre", "Nivel 3"},
        { "1", "ALDANA ORRACA LORENZA", "3o C Pre", "Nivel 3"},
        { "2", "AVILEZ ESPINOSA ELENA", "3o C Pre", "Nivel 3"},
        { "3", "BRASSEL SOSA JAVIER", "3o C Pre", "Nivel 3"},
        { "4", "CAMPOS LEMUS ANA CECILIA", "3o C Pre", "Nivel 3"},
        { "5", "COLIN VELAZQUEZ MARIA JOSE", "3o C Pre", "Nivel 3"},
        { "6", "COROMINAS MORALES SOFIA", "3o C Pre", "Nivel 3"},
        { "7", "CURIEL GOROZPE PABLO", "3o C Pre", "Nivel 3"},
        { "8", "CHÁVEZ SOTO PATRICIO", "3o C Pre", "Nivel 3"},
        { "9", "DERSDEPANIAN SANJUAN VALENTINA", "3o C Pre", "Nivel 3"},
        { "10", "GARCÍA ABREU MARIANO", "3o C Pre", "Nivel 3"},
        { "11", "GUDIÑO BOBADILLA MARÍA JOSÉ", "3o C Pre", "Nivel 3"},
        { "12", "HERNÁNDEZ LUELMO MARIELA", "3o C Pre", "Nivel 3"},
        { "13", "HERNÁNDEZ ORTÍZ ANA PAULA", "3o C Pre", "Nivel 3"},
        { "14", "IBAÑEZ VILLAVICENCIO EMILIA", "3o C Pre", "Nivel 3"},
        { "15", "ISSELIN SANCHEZ ANNA", "3o C Pre", "Nivel 3"},
        { "16", "LÓPEZ KALIS MARÍA INÉS", "3o C Pre", "Nivel 3"},
        { "17", "MALO JUVERA MENDEZ IAN", "3o C Pre", "Nivel 3"},
        { "18", "MIRACLE ZUBIRÍA ALEXANDER", "3o C Pre", "Nivel 3"},
        { "19", "MONTES DE OCA ROJAS RAFAELLA", "3o C Pre", "Nivel 3"},
        { "20", "PAYRO ESTRADA LUIS ALEJANDRO", "3o C Pre", "Nivel 3"},
        { "21", "RAMÍREZ CIFUENTES JORGE", "3o C Pre", "Nivel 3"},
        { "22", "RANGEL VILLEGAS ELISA", "3o C Pre", "Nivel 3"},
        { "23", "SÁNCHEZ MENDOZA FERNANDO", "3o C Pre", "Nivel 3"},
        { "24", "SANTOS PLIEGO IGNACIO", "3o C Pre", "Nivel 3"},
        { "25", "VALERO TEJEDA SOFIA", "3o C Pre", "Nivel 3"},
        { "26", "VALLE SORDO IÑIGO", "3o C Pre", "Nivel 3"}
};



    String[][] maestras_csv = new String [][]

    {
        { "KARYNA BARBIERI MARTÍNEZ", "3o C Pre", "Nivel 3" },
        { "NORA GUTIÉRREZ CANTÚ", "3o C Pre", "Nivel 3" },
        { "ALEJANDRA ALFAGEME BARBACHANO", "3o B Pre", "Nivel 3" },
        { "NORA GUTIÉRREZ CANTÚ", "3o B pre", "Nivel 3" },
        { "GLORIA MARTÍNEZ DÍAZ", "3o A Pre", "Nivel 3" },
        { "ALEJANDRA ANDALUZ GARCÍA", "3o A Pre", "Nivel 3" },
        { "NORMA SÁNCHEZ FLORES", "2o C Pre", "Nivel 2" },
        { "PAULINA RANSANZ ARÉVALO", "2o C Pre", "Nivel 2" },
        { "MISS MARTHA GUADALUPE MARTÍNEZ RIVERA", "2o B Pre", "Nivel 2" },
        { "PAULINA RANSANZ ARÉVALO", "2o B Pre", "Nivel 2" },
        { "MISS AILYM CORTÉS MARÍN", "2o A Pre", "Nivel 2" },
        { "ALEJANDRA ANDALUZ GARCÍA", "2o A Pre", "Nivel 2" },
        { "LILIANA ALEJANDRA VELÁZQUEZ AGUILAR", "1o C Pre", "Nivel 1" },
        { "YOANNA COMBE TORTOLERO ", "1o C Pre", "Nivel 1" },
        { "PRISCILA AJA SIGÜENZA", "1o B Pre", "Nivel 1" },
        { "YOANNA COMBE TORTOLERO", "1o B Pre", "Nivel 1" },
        { "MÓNICA A. AGUILAR GONZÁLEZ", "1o A Pre", "Nivel 1" },
        { "LAURA G. MÁRQUEZ BRENNER", "1o A Pre", "Nivel 1" }
    };

    String[][] licencias_csv = new String[][] {
            {"asuncion-001", "Instituto Asunción Aguilas", "CURSIVA", "Nivel 1", "2019"},
            {"asuncion-002", "Instituto Asunción Aguilas", "CURSIVA", "Nivel 2", "2019"},
            {"asuncion-003", "Instituto Asunción Aguilas", "CURSIVA", "Nivel 3", "2019"}
    };

    String[][] escuelas_csv = new String[][] {
            {"Instituto Asunción Aguilas" }
    };

    /*
    // { "Colección","Nivel","Edición","Tipo de Documento","Nombre del documento","Descripción del documento","path_y_nombre_del_archivo_donde_se_encuentra_en_su_repositorio","Tipo de documento","icono_del_documento" },
    String[][] colecciones_csv = new String[][] {
            { "ABC","1","2017","LIBRO","ABC NIVEL 1","Esta colección se conforma de libros, aplicaciones e innovadores recursos didácticos para el aprendizaje de la lectura y la escritura que se adapta a las diferentes metodologías alfabetizadoras. Los alumnos aprenderán de forma fácil, divertida y efectiva, desarrollando su autonomía y gusto por la lectura al lado de Robbi Galaxias y sus amigos: Ana, Alan, Elsa, Erik, Isa, Igor, Olivia, Omar, Úrsula y Ur","abc/libros/abc_n1","PDF","abc/libros/libros_png/abc_n1" },
    { "ABC","Nivel 1","All","IMPRIMIBLE","VOCABULARIO NIVEL 1","VOCABULARIO NIVEL 1","abc/palabras/vocbulario_n1","PDF","abc/palabras/vocbulario_n1" },
    { "ABC","Nivel 1","All","IMPRIMIBLE","FICHERO SILÁBICO NIVEL 1","FICHERO SILÁBICO NIVEL 1","abc/ficheros/fichero_n1","PDF","abc/ficheros/ficheros_png/fichero_n1" },
    { "ABC","Nivel 2","2017","LIBRO","ABC NIVEL 2 LIBRO 1","ABC NIVEL 2 LIBRO 1","abc/libros/abc_n2_l1","PDF","abc/libros/libros_png/abc_n2_l1" },
    { "ABC","Nivel 2","2017","LIBRO","ABC NIVEL 2 LIBRO 2","ABC NIVEL 2 LIBRO 2","abc/libros/abc_n2_l2","PDF","abc/libros/libros_png/abc_n2_l2" },
    { "ABC","Nivel 2","All","IMPRIMIBLE","VOCABULARIO NIVEL 2","VOCABULARIO NIVEL 2","abc/palabras/vocbulario_n2","PDF","abc/palabras/vocabulario_png/vocabulario_n2" },
    { "ABC","Nivel 2","All","IMPRIMIBLE","FICHERO SILÁBICO NIVEL 2","FICHERO SILÁBICO NIVEL 2","abc/ficheros/fichero_n2","PDF","abc/ficheros/ficheros_png/fichero_n2" },
    { "ABC","Nivel 3","2017","LIBRO","ABC NIVEL 3 LIBRO 1","ABC NIVEL 3 LIBRO 1","abc/libros/abc_n3_l1","PDF","abc/libros/libros_png/abc_n3_l1" },
    { "ABC","Nivel 3","2017","LIBRO","ABC NIVEL 3 LIBRO 2","ABC NIVEL 3 LIBRO 2","abc/libros/abc_n3_l2","PDF","abc/libros/libros_png/abc_n3_l2" },
    { "ABC","Nivel 3","2017","LIBRO","ABC NIVEL 3 LIBRO 3","ABC NIVEL 3 LIBRO 3","abc/libros/abc_n3_l3","PDF","abc/libros/libros_png/abc_n3_l3" },
    { "ABC","Nivel 3","2017","LIBRO","ABC NIVEL 3 LIBRO 4","ABC NIVEL 3 LIBRO 4","abc/libros/abc_n3_l4","PDF","abc/libros/libros_png/abc_n3_l4" },
    { "ABC","Nivel 3","2017","LIBRO","ABC NIVEL 3 LIBRO 5","ABC NIVEL 3 LIBRO 5","abc/libros/abc_n3_l5","PDF","abc/libros/libros_png/abc_n3_l5" },
    { "ABC","Nivel 3","2019","LIBRO","TAREAS Y LECTURAS","TAREAS Y LECTURAS","abc/libros/tareas_y_lecturas","PDF","abc/libros/libros_png/tareas_y_lecturas" },
    { "ABC","Nivel 3","2015","LIBRO","TAREAS Y LECTURAS LIBRO 2","TAREAS Y LECTURAS LIBRO 2","abc/libros/tareas_y_lecturas_l2","PDF","abc/libros/libros_png/tareas_y_lecturas_l2" },
    { "ABC","Nivel 3","2015","LIBRO","TAREAS Y LECTURAS LIBRO 3","TAREAS Y LECTURAS LIBRO 3","abc/libros/tareas_y_lecturas_l3","PDF","abc/libros/libros_png/tareas_y_lecturas_l3" },
    { "ABC","Nivel 3","2015","LIBRO","TAREAS Y LECTURAS LIBRO 4","TAREAS Y LECTURAS LIBRO 4","abc/libros/tareas_y_lecturas_l4","PDF","abc/libros/libros_png/tareas_y_lecturas_l4" },
    { "ABC","Nivel 3","2015","LIBRO","TAREAS Y LECTURAS LIBRO 5","TAREAS Y LECTURAS LIBRO 5","abc/libros/tareas_y_lecturas_l5","PDF","abc/libros/libros_png/tareas_y_lecturas_l5" },
    { "ABC","Nivel 3","All","IMPRIMIBLE","VOCABULARIO NIVEL 3","VOCABULARIO NIVEL 3","abc/palabras/vocbulario_n3","PDF","abc/palabras/vocabulario_png/vocabulario_n3" },
    { "ABC","Nivel 3","All","IMPRIMIBLE","FICHERO SILÁBICO NIVEL 3","FICHERO SILÁBICO NIVEL 3","abc/ficheros/fichero_n3","PDF","abc/ficheros/ficheros_png/fichero_n3" },
    { "ABC","All","All","IMPRIMIBLE","PERSONAJES ABC","PERSONAJES ABC","abc/personajes/personajes_abc","PDF","abc/personajes/personajes_png/personajes_abc" },
    { "ABC","All","All","GUIA","Guía metodológica para la enseñanza de la lecto-escritura.","Guía metodológica para la enseñanza de la lecto-escritura.","abc/metodologia/guía_metodológica_para_la_enseñanza_de_la_lecto-escritura","PDF","abc/metodologia/metodologia_png/guía_metodológica_para_la_enseñanza_de_la_lecto-escritura" },
    { "ABC","All","All","IMPRIMIBLE","Vocales y abecedario Script","Vocales y abecedario Script","abc/metodologia/vocales_y_abecedario_script","PDF","abc/metodologia/metodologia_png/vocales_y_abecedario_script" },
    { "ABC","All","All","VIDEOS","TRAZO DE LETRAS EN SCRIPT","TRAZO DE LETRAS EN SCRIPT","https://www.youtube.com/playlist?list=pl_qraptzsvk9ldk-diijdqczigtfwvuzt","VIDEOS","abc/videos/videos_png/trazo_de_letra_script" },
    { "ABC","All","All","VIDEOS","TRAZO Y SONIDO DE LAS SILABAS","TRAZO Y SONIDO DE LAS SILABAS","https://www.youtube.com/playlist?list=pl_qraptzsvk9edq6kuavxsrbsakaqohux","VIDEOS","abc/videos/videos_png/trazo_y_sonido" },
    { "1,2,3","Nivel 1","2019","LIBRO","1,2,3 NIVEL 1","Esta colección promueve la construcción de las matemáticas mediante el planteamiento de situaciones didácticas y problemas matemáticos cercanos a los pequeños. Con ayuda de las regletas Cuisenaire y otros recursos, los alumnos desarrollarán el pensamiento lógico y matemático, y consolidarán los conceptos de número, figura, forma, medida y ubicación espacial. Además, Robbi Galaxias los impulsará a cuestionarse su propio proceso de aprendizaje con preguntas metacognitivas.","123/libros/123_n1_2019","PDF","123/libros/portadas_png/123_n1_2019" },
    { "1,2,3","Nivel 2","2017","LIBRO","1,2,3 NIVEL 2","1,2,3 NIVEL 2","123/libros/123_n2_2017","PDF","123/libros/portadas_png/123_n2_2017" },
    { "1,2,3","Nivel 2","2020","LIBRO","1,2,3 NIVEL 2","1,2,3 NIVEL 2","123/libros/123_n2_2020","PDF","123/libros/portadas_png/123_n2_2020" },
    { "1,2,3","Nivel 3","2017","LIBRO","1,2,3 NIVEL 3","1,2,3 NIVEL 3","123/libros/123_n3_2017","PDF","123/libros/portadas_png/123_n3_2017" },
    { "1,2,3","Nivel 3","2020","LIBRO","1,2,3 NIVEL 3","1,2,3 NIVEL 3","123/libros/123_n3_2020","PDF","123/libros/portadas_png/123_n3_2020" },
    { "1,2,3","Nivel 1","2019","PLANEACIONES","PLANEACIONES 1,2,3 NIVEL 1","PLANEACIONES 1,2,3 NIVEL 1","123/planeaciones/2019/planeacion_n1_2019","PDF","123/planeaciones/2019/2019/planeacion_n1_2019" },
    { "1,2,3","Nivel 2","2017","PLANEACIONES","PLANEACIONES 1,2,3 NIVEL 2","PLANEACIONES 1,2,3 NIVEL 2","123/planeaciones/2017/planeaciones_123_nivel_2","PDF","123/planeaciones/2017/2017/planeaciones_123_nivel_2" },
    { "1,2,3","Nivel 2","2020","PLANEACIONES","PLANEACIONES 1,2,3 NIVEL 2 UNIDAD 1","PLANEACIONES 1,2,3 NIVEL 2 UNIDAD 1","123/planeaciones/2020/planeacion_1_nivel_2_20","PDF","123/planeaciones/2020/2020/planeacion_1_nivel_2_20" },
    { "1,2,3","Nivel 3","2017","PLANEACIONES","PLANEACIONES 1,2,3 NIVEL 3","PLANEACIONES 1,2,3 NIVEL 3","123/planeaciones/2017/planeaciones_123_nivel_3","PDF","123/planeaciones/2017/2017/planeaciones_123_nivel_3" },
    { "1,2,3","Nivel 3","2020","PLANEACIONES","PLANEACIONES 1,2,3 NIVEL 3 UNIDAD 1","PLANEACIONES 1,2,3 NIVEL 3 UNIDAD 1","123/planeaciones/2020/planeacion_1_nivel_3_20","PDF","123/planeaciones/2020/2020/planeacion_1_nivel_3_20" },
    { "1,2,3","All","All","IMPRIMIBLE","RECTA NUMERICA","RECTA NUMERICA","123/recta_numerica/rectas_doble_carta","PDF","123/recta_numerica/png/rectas_doble_carta" },
    { "1,2,3","All","All","IMPRIMIBLE","REGLETAS","REGLETAS","123/regletas/regletas_recortables","PDF","123/regletas/png/regletas_recortables" },
    { "1,2,3","All","All","IMPRIMIBLE","SERIE NUMERICA","SERIE NUMERICA","123/serie_numerica/serie_numerica_copia","PDF","123/serie_numerica/png/serie_numerica_copia" },
    { "1,2,3","All","All","IMPRIMIBLE","TABLA DE EQUIVALENCIA","TABLA DE EQUIVALENCIA","123/tabla_de_equivalencia/tabla_de_equivalencia_de_regletas","PDF","123/tabla_de_equivalencia/png/equivalencias" },
    { "1,2,3","All","All","IMPRIMIBLE","TANGRAM","TANGRAM","123/tangram/tangram","PDF","123/tangram/png/tangram" },
    { "1,2,3","All","All","PROYECTO","CAJA MAGICA","CAJA MAGICA","123/proyecto_mate/presentacion_1","PDF","123/proyecto_mate/portada_png/portada_presentacion_123" },
    { "1,2,3","All","All","VIDEOS","TRAZOS NUMEROS","TRAZOS NUMEROS","https://www.youtube.com/playlist?list=pl_qraptzsvk9rnro_kvcp3p9p9thphjed","VIDEOS","123/videos_campos_formativos/capturas_png" },
    { "CARPETA CLAVE","Nivel 1","2018","LIBRO","CARPETA CLAVE NIVEL 1","Esta colección integra los contenidos de los componentes curriculares o aprendizajes clave de la educación preescolar. Parte de las necesidades de los niños y apoya el desarrollo de las competencias, facilitando el aprendizaje individual y cooperativo.","carpeta_clave/libros/carpeta_n1","PDF","carpeta_clave/libros/portdas_png/carpeta_n1" },
    { "CARPETA CLAVE","Nivel 2","2018","LIBRO","CARPETA CLAVE NIVEL 2","CARPETA CLAVE NIVEL 2","carpeta_clave/libros/carpeta_n2","PDF","carpeta_clave/libros/portadas_png/carpeta_n2" },
    { "CARPETA CLAVE","Nivel 3","2018","LIBRO","CARPETA CLAVE NIVEL 3","CARPETA CLAVE NIVEL 3","carpeta_clave/libros/carpeta_n3","PDF","carpeta_clave/libros/portadas_png/carpeta_n3" },
    { "CARPETA CLAVE","Nivel 1","2018","GUIA CLAVE","GUIA CLAVE NIVEL 1","GUIA CLAVE NIVEL 1","carpeta_clave/guias/guia_clave_n1","PDF","carpeta_clave/guias/guias_png/guia_clave_n1" },
    { "CARPETA CLAVE","Nivel 2","2018","GUIA CLAVE","GUIA CLAVE NIVEL 2","GUIA CLAVE NIVEL 2","carpeta_clave/guias/guia_clave_n2","PDF","carpeta_clave/guias/guias_png/guia_clave_n2" },
    { "CARPETA CLAVE","Nivel 3","2018","GUIA CLAVE","GUIA CLAVE NIVEL 3","GUIA CLAVE NIVEL 3","carpeta_clave/guias/guia_clave_n3","PDF","carpeta_clave/guias/guias_png/guia_clave_n3" },
    { "CARPETA CLAVE","All","All","VIDEOS","CUIDADO DEL AGUA","CUIDADO DEL AGUA","https://www.youtube.com/watch?v=b8x1gnr0b68","VIDEOS","carpeta/videos_ecosistemas/videos_png/cuidado_del_agua" },
    { "CARPETA CLAVE","All","All","VIDEOS","¡CUIDEMOS EL AGUA!","¡CUIDEMOS EL AGUA!","https://www.youtube.com/watch?v=2q4i_odwthu","VIDEOS","carpeta/videos_ecosistemas/videos_png/cuidemos_el_agua" },
    { "CURSIVA","Nivel 1","2015","LIBRO","CURSIVA NIVEL 1","Esta colección favorece la motricidad fina, la caligrafía y el desarrollo de conexiones neuronales mediante el trazo de letra cursiva. Los libros y la aplicación educativa son el complemento ideal en el proceso de aprendizaje de la lectura y la escritura de los niños en preescolar o primaria baja.","cursiva/libros/cur_n1_2015","PDF","cursiva/libros/portadas_png/cur_n1_2015" },
    { "CURSIVA","Nivel 1","2019","LIBRO","CURSIVA NIVEL 1","CURSIVA NIVEL 1","cursiva/libros/cursiva_n1_2019","PDF","cursiva/libros/portadas_png/cursiva_n1_2019" },
    { "CURSIVA","Nivel 2","2015","LIBRO","CURSIVA NIVEL 2","CURSIVA NIVEL 2","cursiva/libros/cur_n2_2015","PDF","cursiva/libros/portadas_png/cur_n2_2015" },
    { "CURSIVA","Nivel 2","2019","LIBRO","CURSIVA NIVEL 2","CURSIVA NIVEL 2","cursiva/libros/cursiva_n2_2019","PDF","cursiva/libros/portadas_png/cursiva_n2_2019" },
    { "CURSIVA","Nivel 3","2015","LIBRO","CURSIVA NIVEL 3","CURSIVA NIVEL 3","cursiva/libros/cur_n3_2015","PDF","cursiva/libros/portadas_png/cur_n3_2015" },
    { "CURSIVA","Nivel 3","2019","LIBRO","CURSIVA NIVEL 3","CURSIVA NIVEL 3","cursiva/libros/cursiva_n3_2019","PDF","cursiva/libros/portadas_png/cursiva_n3_2019" },
    { "CURSIVA","Nivel 3","2020","LIBRO","CURSIVA NIVEL 3","CURSIVA NIVEL 3","cursiva/libros/cur_n3_2020","PDF","cursiva/libros/portadas_png/cur_n3_2020" },
    { "CURSIVA","All","All","IMPRIMIBLE","TRAZO DE ABECEDARIO","TRAZO DE ABECEDARIO","cursiva/alfabeto/abecedario_cursiva","PDF","cursiva/alfabeto/png/abecedario_cursiva" },
    { "CURSIVA","All","All","IMPRIMIBLE","ABECEDARIO","ABECEDARIO","cursiva/posters/abecedario","PDF","cursiva/posters/png/abecedario" },
    { "CURSIVA","All","All","IMPRIMIBLE","CARRETILLAS M Y L","CARRETILLAS M Y L","cursiva/carretillas/fichas_m_y_l","PDF","cursiva/carretillas/png/fichas_m_y_l" },
    { "CURSIVA","All","All","IMPRIMIBLE","CARRETILLAS P Y S","CARRETILLAS P Y S","cursiva/carretillas/fichas_p_y_s","PDF","cursiva/carretillas/png/fichas_p_y_s" },
    { "CURSIVA","All","All","IMPRIMIBLE","PERSONAJES CURSIVA","PERSONAJES CURSIVA","cursiva/niños/niños_cursiva","PDF","cursiva/niños/png/niños" },
    { "CURSIVA","All","All","IMPRIMIBLE","VOCALES","VOCALES","cursiva/vocales/vocales","PDF","cursiva/vocales/png/vocales" },
    { "CURSIVA","Nivel 1","2019","PLANEACIONES","PLANEACIONES CURSIVA NIVEL 1","PLANEACIONES CURSIVA NIVEL 1","cursiva/planeaciones/cursiva_n1","PDF","cursiva/planeaciones/planeaciones_png/planeacion_cursiva_n1" },
    { "CURSIVA","Nivel 2","2019","PLANEACIONES","PLANEACIONES CURSIVA NIVEL 2","PLANEACIONES CURSIVA NIVEL 2","cursiva/planeaciones/cursiva_n2","PDF","cursiva/planeaciones/planeaciones_cursiva_png/planeacion_cursiva_n2" },
    { "CURSIVA","Nivel 3","2019","PLANEACIONES","PLANEACIONES CURSIVA NIVEL 3","PLANEACIONES CURSIVA NIVEL 3","cursiva/planeaciones/cursiva_n3","PDF","cursiva/planeaciones/planeaciones_png/planeacion_cursiva_n3" },
    { "CURSIVA","Nivel 3","2020","PLANEACIONES","PLANEACIONES CURSIVA NIVEL 3","PLANEACIONES CURSIVA NIVEL 3","cursiva/planeaciones/cursiva_n3_2020","PDF","cursiva/planeaciones/plneaciones_png/planeacion_cursiva_n3_2020" },
    { "CURSIVA","All","All","VIDEOS","TRAZO DE LAS CONSONANTES","TRAZO DE LAS CONSONANTES","https://www.youtube.com/playlist?list=pl_qraptzsvk-mspendqi6gmx353yoexrg","VIDEOS","cursiva/videos/videos_consonantes_png" },
    { "CURSIVA","All","All","VIDEOS","TRAZOS CURSIVA VOCALES","TRAZOS CURSIVA VOCALES","https://www.youtube.com/playlist?list=pl_qraptzsvk_y2_vwql2avl2h6m69g130","VIDEOS","cursiva/videos/videos_vocales_png" },
    { "I DO SPEAK","Nivel 3","2015","LIBRO","I DO SPEAK","Está diseñado para que los pequeños logren escribir y leer de una froma divertida  en inglés; del mismo modo el material promueve que el niño amplíe su vocabulario y desarrolle su conciencia lingüística.","idospeak/libro/idospeak","PDF","idospeak/libro/portada_png/idospeak" },
    { "I DO SPEAK","Nivel 3","All","IMPRIMIBLE","FLASH CARDS","FLASH CARDS","idospeak/flashcards/flash_cards","PDF","idospeak/flashcards/portada_png/flash_cards" },
    { "PARA LA EDUCADORA","All","All","IMPRIMIBLE","PROTOCOLO ESCUCHA ACTIVA","PROTOCOLO ESCUCHA ACTIVA","para_la_educadora/escucha_activa/escucha_activa","PDF","para_la_educadora/escucha_activa/escucha_activa_png/escucha_activa" },
    { "PARA LA EDUCADORA","All","All","IMPRIMIBLE","ROBIS","ROBIS","para_la_educadora/robis/robbis","PDF","para_la_educadora/robis/robis_png/robbis" },
    { "PARA LA EDUCADORA","All","All","IMPRIMIBLE","RUBRICAS","RUBRICAS","para_la_educadora/rubricas/rubricas","PDF","para_la_educadora/rubricas/rubricas_png/rubricas" }
    };
     */

    String[][] colecciones_csv = new String[][] {
                    {"ABC", "Nivel 1", "2017", "LIBRO", "ABC NIVEL 1", "Esta colección se conforma de libros, aplicaciones e innovadores recursos didácticos para el aprendizaje de la lectura y la escritura que se adapta a las diferentes metodologías alfabetizadoras. Los alumnos aprenderán de forma fácil, divertida y efectiva, desarrollando su autonomía y gusto por la lectura al lado de Robbi Galaxias y sus amigos: Ana, Alan, Elsa, Erik, Isa, Igor, Olivia, Omar, Úrsula y Ur", "ABC/LIBROS/ABC_N1", "PDF", "ABC/LIBROS/Libros_PNG/ABC_N1"},
    { "ABC","Nivel 1","All","IMPRIMIBLE","VOCABULARIO NIVEL 1","VOCABULARIO NIVEL 1","ABC/PALABRAS/VOCBULARIO_N1","PDF","ABC/PALABRAS/VOCBULARIO_PNG/VOCABULARIO_N1" },
    { "ABC","Nivel 1","All","IMPRIMIBLE","FICHERO SILÁBICO NIVEL 1","FICHERO SILÁBICO NIVEL 1","ABC/FICHEROS/FICHERO_N1","PDF","ABC/FICHEROS/Ficheros_PNG/FICHEROS_N1" },
    { "ABC","Nivel 2","2017","LIBRO","ABC NIVEL 2 LIBRO 1","ABC NIVEL 2 LIBRO 1","ABC/LIBROS/ABC_N2_L1","PDF","ABC/LIBROS/Libros_PNG/ABC_N2_L1" },
    { "ABC","Nivel 2","2017","LIBRO","ABC NIVEL 2 LIBRO 2","ABC NIVEL 2 LIBRO 2","ABC/LIBROS/ABC_N2_L2","PDF","ABC/LIBROS/Libros_png/ABC_N2_L2" },
    { "ABC","Nivel 2","All","IMPRIMIBLE","VOCABULARIO NIVEL 2","VOCABULARIO NIVEL 2","ABC/PALABRAS/VOCBULARIO_N2","PDF","ABC/PALABRAS/Vocabulario_PNG/VOCABULARIO_N2" },
    { "ABC","Nivel 2","All","IMPRIMIBLE","FICHERO SILÁBICO NIVEL 2","FICHERO SILÁBICO NIVEL 2","ABC/FICHEROS/FICHERO_N2","PDF","ABC/FICHEROS/Ficheros_PNG/FICHEROS_N2" },
    { "ABC","Nivel 3","2017","LIBRO","ABC NIVEL 3 LIBRO 1","ABC NIVEL 3 LIBRO 1","ABC/LIBROS/ABC_N3_L1","PDF","ABC/LIBROS/Libros_PNG/ABC_N3_L1" },
    { "ABC","Nivel 3","2017","LIBRO","ABC NIVEL 3 LIBRO 2","ABC NIVEL 3 LIBRO 2","ABC/LIBROS/ABC_N3_L2","PDF","ABC/LIBROS/Libros_PNG/ABC_N3_L2" },
    { "ABC","Nivel 3","2017","LIBRO","ABC NIVEL 3 LIBRO 3","ABC NIVEL 3 LIBRO 3","ABC/LIBROS/ABC_N3_L3","PDF","ABC/LIBROS/Libros_PNG/ABC_N3_L3" },
    { "ABC","Nivel 3","2017","LIBRO","ABC NIVEL 3 LIBRO 4","ABC NIVEL 3 LIBRO 4","ABC/LIBROS/ABC_N3_L4","PDF","ABC/LIBROS/Libros_PNG/ABC_N3_L4" },
    { "ABC","Nivel 3","2017","LIBRO","ABC NIVEL 3 LIBRO 5","ABC NIVEL 3 LIBRO 5","ABC/LIBROS/ABC_N3_L5","PDF","ABC/LIBROS/Libros_PNG/ABC_N3_L5" },
    { "ABC","Nivel 3","2019","LIBRO","TAREAS Y LECTURAS","TAREAS Y LECTURAS","ABC/LIBROS/TAREAS_Y_LECTURAS","PDF","ABC/LIBROS/Libros_PNG/TAREAS_Y_LECTURAS" },
    { "ABC","Nivel 3","2015","LIBRO","TAREAS Y LECTURAS LIBRO 2","TAREAS Y LECTURAS LIBRO 2","ABC/LIBROS/TAREAS_Y_LECTURAS_L2","PDF","ABC/LIBROS/Libros_PNG/TAREAS_Y_LECTURAS_L2" },
    { "ABC","Nivel 3","2015","LIBRO","TAREAS Y LECTURAS LIBRO 3","TAREAS Y LECTURAS LIBRO 3","ABC/LIBROS/TAREAS_Y_LECTURAS_L3","PDF","ABC/LIBROS/Libros_PNG/TAREAS_Y_LECTURAS_L3" },
    { "ABC","Nivel 3","2015","LIBRO","TAREAS Y LECTURAS LIBRO 4","TAREAS Y LECTURAS LIBRO 4","ABC/LIBROS/TAREAS_Y_LECTURAS_L4","PDF","ABC/LIBROS/Libros_PNG/TAREAS_Y_LECTURAS_L4" },
    { "ABC","Nivel 3","2015","LIBRO","TAREAS Y LECTURAS LIBRO 5","TAREAS Y LECTURAS LIBRO 5","ABC/LIBROS/TAREAS_Y_LECTURAS_L5","PDF","ABC/LIBROS/Libros_PNG/TAREAS_Y_LECTURAS_L5" },
    { "ABC","Nivel 3","All","IMPRIMIBLE","VOCABULARIO NIVEL 3","VOCABULARIO NIVEL 3","ABC/PALABRAS/VOCBULARIO_N3","PDF","ABC/PALABRAS/Vocabulario_PNG/VOCABULARIO_N3" },
    { "ABC","Nivel 3","All","IMPRIMIBLE","FICHERO SILÁBICO NIVEL 3","FICHERO SILÁBICO NIVEL 3","ABC/FICHEROS/FICHERO_N3","PDF","ABC/FICHEROS/Ficheros_PNG/FICHEROS_N3" },
    { "ABC","All","All","IMPRIMIBLE","PERSONAJES ABC","PERSONAJES ABC","ABC/PERSONAJES/PERSONAJES_ABC","PDF","ABC/PERSONAJES/Personajes_PNG/PERSONAJES" },
    { "ABC","All","All","GUIA","Guía metodológica para la enseñanza de la lecto-escritura.","Guía metodológica para la enseñanza de la lecto-escritura.","ABC/METODOLOGIA/Guía_metodológica_para_la_enseñanza_de_la_lecto-escritura","PDF","ABC/METODOLOGIA/Metodologia_PNG/METODOLOGIA" },
    { "ABC","All","All","IMPRIMIBLE","Vocales y abecedario Script","Vocales y abecedario Script","ABC/METODOLOGIA/Vocales_y_abecedario_Script","PDF","ABC/METODOLOGIA/Metodologia_PNG/Vocales_y_abecedario_Script" },
    { "ABC","All","All","VIDEOS","TRAZO DE LETRAS EN SCRIPT","TRAZO DE LETRAS EN SCRIPT","https://www.youtube.com/playlist?list=PL_QRaPtZsvK9ldK-dIijDqczIGTFWvUZT","VIDEO","ABC/VIDEOS/Videos_PNG/Trazo_de_letra_script" },
    { "ABC","All","All","VIDEOS","TRAZO Y SONIDO DE LAS SILABAS","TRAZO Y SONIDO DE LAS SILABAS","https://www.youtube.com/playlist?list=PL_QRaPtZsvK9EdQ6kuaVxsRbsaKaQohUX","VIDEO","ABC/VIDEOS/Videos_PNG/Trazo_y_sonido" },
    { "1,2,3","Nivel 1","2019","LIBRO","1,2,3 NIVEL 1","Esta colección promueve la construcción de las matemáticas mediante el planteamiento de situaciones didácticas y problemas matemáticos cercanos a los pequeños. Con ayuda de las regletas Cuisenaire y otros recursos, los alumnos desarrollarán el pensamiento lógico y matemático, y consolidarán los conceptos de número, figura, forma, medida y ubicación espacial. Además, Robbi Galaxias los impulsará a cuestionarse su propio proceso de aprendizaje con preguntas metacognitivas.","123/LIBROS/123_N1_2019","PDF","123/LIBROS/Portadas_PNG/123_2019_N1" },
    { "1,2,3","Nivel 2","2017","LIBRO","1,2,3 NIVEL 2","1,2,3 NIVEL 2","123/LIBROS/123_N2_2017","PDF","123/LIBROS/Portadas_PNG/123_2017_N2" },
    { "1,2,3","Nivel 2","2020","LIBRO","1,2,3 NIVEL 2","1,2,3 NIVEL 2","123/LIBROS/123_N2_2020","PDF","123/LIBROS/Portadas_PNG/123_2020_N2" },
    { "1,2,3","Nivel 3","2017","LIBRO","1,2,3 NIVEL 3","1,2,3 NIVEL 3","123/LIBROS/123_N3_2017","PDF","123/LIBROS/Portadas_PNG/123_2017_N3" },
    { "1,2,3","Nivel 3","2020","LIBRO","1,2,3 NIVEL 3","1,2,3 NIVEL 3","123/LIBROS/123_N3_2020","PDF","123/LIBROS/Portadas_PNG/123_2020_N3" },
    { "1,2,3","Nivel 1","2019","PLANEACIONES","PLANEACIONES 1,2,3 NIVEL 1","PLANEACIONES 1,2,3 NIVEL 1","123/PLANEACIONES/2019/PLANEACION_N1_2019","PDF","123/PLANEACIONES/2019/2019/PLANEACION_123_N1" },
    { "1,2,3","Nivel 2","2017","PLANEACIONES","PLANEACIONES 1,2,3 NIVEL 2","PLANEACIONES 1,2,3 NIVEL 2","123/PLANEACIONES/2017/PLANEACIONES_123_NIVEL_2","PDF","123/PLANEACIONES/2017/2017/PLANEACION_123_N2" },
    { "1,2,3","Nivel 2","2020","PLANEACIONES","PLANEACIONES 1,2,3 NIVEL 2 UNIDAD 1","PLANEACIONES 1,2,3 NIVEL 2 UNIDAD 1","123/PLANEACIONES/2020/PLANEACION_1_NIVEL_2_20","PDF","123/PLANEACIONES/2020/2020/PLANEACION_123_N2" },
    { "1,2,3","Nivel 3","2017","PLANEACIONES","PLANEACIONES 1,2,3 NIVEL 3","PLANEACIONES 1,2,3 NIVEL 3","123/PLANEACIONES/2017/PLANEACIONES_123_NIVEL_3","PDF","123/PLANEACIONES/2017/2017/PLANEACION_123_N3" },
    { "1,2,3","Nivel 3","2020","PLANEACIONES","PLANEACIONES 1,2,3 NIVEL 3 UNIDAD 1","PLANEACIONES 1,2,3 NIVEL 3 UNIDAD 1","123/PLANEACIONES/2020/PLANEACION_1_NIVEL_3_20","PDF","123/PLANEACIONES/2020/2020/PLANEACION_123_N3" },
    { "1,2,3","All","All","IMPRIMIBLE","RECTA NUMERICA","RECTA NUMERICA","123/RECTA_NUMERICA/RECTAS_DOBLE_CARTA","PDF","123/RECTA_NUMERICA/PNG/RECTAS_NUMERICAS" },
    { "1,2,3","All","All","IMPRIMIBLE","REGLETAS","REGLETAS","123/REGLETAS/REGLETAS_RECORTABLES","PDF","123/REGLETAS/PNG/REGLETAS" },
    { "1,2,3","All","All","IMPRIMIBLE","SERIE NUMERICA","SERIE NUMERICA","123/SERIE_NUMERICA/SERIE_NUMERICA_COPIA","PDF","123/SERIE_NUMERICA/PNG/SERIE_NUMERICA" },
    { "1,2,3","All","All","IMPRIMIBLE","TABLA DE EQUIVALENCIA","TABLA DE EQUIVALENCIA","123/TABLA_DE_EQUIVALENCIA/TABLA_DE_EQUIVALENCIA_DE_REGLETAS","PDF","123/TABLA_DE_EQUIVALENCIA/PNG/EQUIVALENCIAS" },
    { "1,2,3","All","All","IMPRIMIBLE","TANGRAM","TANGRAM","123/TANGRAM/TANGRAM","PDF","123/TANGRAM/PNG/TANGRAM" },
    { "1,2,3","All","All","PROYECTO","CAJA MAGICA","CAJA MAGICA","123/PROYECTO_MATE/PRESENTACION_1","PDF","123/PROYECTO_MATE/Portada_PNG/PORTADA_PRESENTACION_123" },
    { "1,2,3","All","All","VIDEOS","TRAZOS NUMEROS","TRAZOS NUMEROS","https://www.youtube.com/playlist?list=PL_QRaPtZsvK9RNRO_kVcP3p9P9ThpHjed","VIDEO","123/VIDEOS_DE_CAMPOS_FORMATIVOS/Capturas_PNG" },
    { "CARPETA CLAVE","Nivel 1","2018","LIBRO","CARPETA CLAVE NIVEL 1","Esta colección integra los contenidos de los componentes curriculares o aprendizajes clave de la educación preescolar. Parte de las necesidades de los niños y apoya el desarrollo de las competencias, facilitando el aprendizaje individual y cooperativo.","CARPETA_CLAVE/LIBROS/CARPETA_N1","PDF","CARPETA_CLAVE/LIBROS/Portdas_PNG/CARPETA_N1" },
    { "CARPETA CLAVE","Nivel 2","2018","LIBRO","CARPETA CLAVE NIVEL 2","CARPETA CLAVE NIVEL 2","CARPETA_CLAVE/LIBROS/CARPETA_N2","PDF","CARPETA_CLAVE/LIBROS/Portadas_PNG/CARPETA_N2" },
    { "CARPETA CLAVE","Nivel 3","2018","LIBRO","CARPETA CLAVE NIVEL 3","CARPETA CLAVE NIVEL 3","CARPETA_CLAVE/LIBROS/CARPETA_N3","PDF","CARPETA_CLAVE/LIBROS/Portadas_PNG/CARPETA_N3" },
    { "CARPETA CLAVE","Nivel 1","2018","GUIA CLAVE","GUIA CLAVE NIVEL 1","GUIA CLAVE NIVEL 1","CARPETA_CLAVE/GUIAS/GUIA_CLAVE_N1","PDF","CARPETA_CLAVE/GUIAS/GUIAS_PNG/GUIA_N1" },
    { "CARPETA CLAVE","Nivel 2","2018","GUIA CLAVE","GUIA CLAVE NIVEL 2","GUIA CLAVE NIVEL 2","CARPETA_CLAVE/GUIAS/GUIA_CLAVE_N2","PDF","CARPETA_CLAVE/GUIAS/GUIAS_PNG/GUIA_N2" },
    { "CARPETA CLAVE","Nivel 3","2018","GUIA CLAVE","GUIA CLAVE NIVEL 3","GUIA CLAVE NIVEL 3","CARPETA_CLAVE/GUIAS/GUIA_CLAVE_N3","PDF","CARPETA_CLAVE/GUIAS/GUIAS_PNG/GUIA_N3" },
    { "CARPETA CLAVE","All","All","VIDEOS","CUIDADO DEL AGUA","CUIDADO DEL AGUA","https://www.youtube.com/watch?v=b8X1Gnr0b68","VIDEO","CARPETA/VIDEOS_ECOSISTEMAS/VIDEOS_PNG/CUIDADO_DEL_AGUA" },
    { "CARPETA CLAVE","All","All","VIDEOS","¡CUIDEMOS EL AGUA!","¡CUIDEMOS EL AGUA!","https://www.youtube.com/watch?v=2q4I_oDWTHU","VIDEO","CARPETA/VIDEOS_ECOSISTEMAS/VIDEOS_PNG/CUIDEMOS_EL_AGUA" },

            { "CURSIVA","Nivel 1","2015","LIBRO","CURSIVA NIVEL 1","Esta colección favorece la motricidad fina, la caligrafía y el desarrollo de conexiones neuronales mediante el trazo de letra cursiva. Los libros y la aplicación educativa son el complemento ideal en el proceso de aprendizaje de la lectura y la escritura de los niños en preescolar o primaria baja.", "CURSIVA/LIBROS/CUR_N1_2015","PDF ","CURSIVA/LIBROS/Portadas_PNG/Cursiva_2015_N1.png" },
            { "CURSIVA", "Nivel 1", "2019", "LIBRO", "CURSIVA NIVEL 1", "CURSIVA NIVEL 1", "CURSIVA/LIBROS/CURSIVA_N1_2019.pdf", "PDF", "CURSIVA/LIBROS/Portadas_PNG/Cursiva_2019_N1_320.png" },
            { "CURSIVA", "Nivel 2", "2015", "LIBRO", "CURSIVA NIVEL 2", "CURSIVA NIVEL 2", "CURSIVA/LIBROS/cur-n2-2015.pdf", "PDF", "CURSIVA/LIBROS/Portadas_PNG/Cursiva_2015_N2_320.png" },
            { "CURSIVA", "Nivel 2", "2019", "LIBRO", "CURSIVA NIVEL 2", "CURSIVA NIVEL 2", "CURSIVA/LIBROS/CURSIVA_N2_2019.pdf", "PDF", "CURSIVA/LIBROS/Portadas_PNG/Cursiva_2019_N2_320.png" },
            { "CURSIVA", "Nivel 3", "2015", "LIBRO", "CURSIVA NIVEL 3", "CURSIVA NIVEL 3", "CURSIVA/LIBROS/Cur_n3_2015.pdf", "PDF", "CURSIVA/LIBROS/Portadas_PNG/Cursiva_2015_N3_320.png" },
            { "CURSIVA", "Nivel 3", "2019", "LIBRO", "CURSIVA NIVEL 3", "CURSIVA NIVEL 3", "CURSIVA/LIBROS/CURSIVA_N3_2019.pdf", "PDF", "CURSIVA/LIBROS/Portadas_PNG/Cursiva_2019_N3_320.png" },
            { "CURSIVA", "Nivel 3", "2020", "LIBRO", "CURSIVA NIVEL 3", "CURSIVA NIVEL 3", "CURSIVA/LIBROS/Cur_n3_2020.pdf", "PDF", "CURSIVA/LIBROS/Portadas_PNG/Cur_N3_2020_320.png" },
            { "CURSIVA", "All", "All", "IMPRIMIBLE", "TRAZO DE ABECEDARIO", "TRAZO DE ABECEDARIO", "CURSIVA/ALFABETO/abecedario_cursiva.pdf", "PDF", "CURSIVA/ALFABETO/PNG/Alfabeto_320.png" },
            { "CURSIVA", "All", "All", "IMPRIMIBLE", "ABECEDARIO", "ABECEDARIO", "CURSIVA/POSTERS/AbecedariO.pdf", "PDF", "CURSIVA/POSTERS/PNG/Abecedario_320.png" },
            { "CURSIVA", "All", "All", "IMPRIMIBLE", "CARRETILLAS M Y L", "CARRETILLAS M Y L", "CURSIVA/CARRETILLA/Fichas_M_L.pdf", "PDF", "CURSIVA/CARRETILLA/PNG/Fichas_M_L_320.png" },
            { "CURSIVA", "All", "All", "IMPRIMIBLE", "CARRETILLAS P Y S", "CARRETILLAS P Y S", "CURSIVA/CARRETILLA/FICHAS_P_Y_S", "PDF", "CURSIVA/CARRETILLA/PNG/Fichas_P_S_320.png" },
            { "CURSIVA", "All", "All", "IMPRIMIBLE", "PERSONAJES CURSIVA", "PERSONAJES CURSIVA", "CURSIVA/NINOS/Niños_cursiva.pdf", "PDF", "CURSIVA/NINOS/PNG/Ninos_320.png" },
            { "CURSIVA", "All", "All", "IMPRIMIBLE", "VOCALES", "VOCALES", "CURSIVA/VOCALES/Vocales.pdf", "PDF", "CURSIVA/VOCALES/PNG/Vocales_320.png" },
            { "CURSIVA", "Nivel 1", "2019", "PLANEACIONES", "PLANEACIONES CURSIVA NIVEL 1", "PLANEACIONES CURSIVA NIVEL 1", "CURSIVA/PLANEACIONES/Cursiva_N1.pdf", "PDF", "CURSIVA/PLANEACIONES/Planeaciones_png/Planeacion_cursiva_N1.png" },
            { "CURSIVA", "Nivel 2", "2019", "PLANEACIONES", "PLANEACIONES CURSIVA NIVEL 2", "PLANEACIONES CURSIVA NIVEL 2", "CURSIVA/PLANEACIONES/Cursiva_N2.pdf", "PDF", "CURSIVA/PLANEACIONES/Planeaciones_png/Planeacion_cursiva_N2.png" },
            { "CURSIVA", "Nivel 3", "2019", "PLANEACIONES", "PLANEACIONES CURSIVA NIVEL 3", "PLANEACIONES CURSIVA NIVEL 3", "CURSIVA/PLANEACIONES/Cursiva_N3.pdf", "PDF", "CURSIVA/PLANEACIONES/Planeaciones_png/Planeacion_cursiva_N3.png" },
            { "CURSIVA", "Nivel 3", "2020", "PLANEACIONES", "PLANEACIONES CURSIVA NIVEL 3", "PLANEACIONES CURSIVA NIVEL 3", "CURSIVA/PLANEACIONES/Cursiva_n3_2020.pdf", "PDF", "CURSIVA/PLANEACIONES/Planeaciones_PNG/Planeacion_cursiva_N3_2020.png" },
            { "CURSIVA", "All", "All", "VIDEOS", "TRAZO DE LAS CONSONANTES", "TRAZO DE LAS CONSONANTES", "https://www.youtube.com/playlist?list=PL_QRaPtZsvK-MSpendqI6gmX353YOeXrG", "VIDEO", "CURSIVA/VIDEOS/Videos_Consonantes_PNG/Cursiva_consonantes_D.png" },
            { "CURSIVA", "All", "All", "VIDEOS", "TRAZOS CURSIVA VOCALES", "TRAZOS CURSIVA VOCALES", "https://www.youtube.com/playlist?list=PL_QRaPtZsvK_Y2_VWQL2avL2H6m69g130", "VIDEO", "CURSIVA/VIDEOS/Videos_Vocales_PNG/Letra_A.png" },

        { "I DO SPEAK", "Nivel 3", "2015", "LIBRO", "I DO SPEAK", "Está diseñado para que los pequeños logren escribir y leer de una froma divertida  en inglés; del mismo modo el material promueve que el niño amplíe su vocabulario y desarrolle su conciencia lingüística.", "IDOSPEAK/LIBRO/IDOSPEAK", "PDF", "IDOSPEAK/LIBRO/Portada_PNG/IDO" },
        { "I DO SPEAK", "Nivel 3", "All", "IMPRIMIBLE", "FLASH CARDS", "FLASH CARDS", "IDOSPEAK/FLASHCARDS/FLASH_CARDS", "PDF", "IDOSPEAK/FLASHCARDS/FLASH_CARDS/FLASH_CARDS" },
        { "PARA LA EDUCADORA", "All", "All", "IMPRIMIBLE", "PROTOCOLO ESCUCHA ACTIVA", "PROTOCOLO ESCUCHA ACTIVA", "PARA_LA_EDUCADORA/ESCUCHA_ACTIVA/ESCUCHA_ACTIVA", "PDF", "PARA_LA_EDUCADORA/ESCUCHA_ACTIVA/Escucha_Activa_PNG/ESCUCHA_ACTIVA" },
        { "PARA LA EDUCADORA", "All", "All", "IMPRIMIBLE", "ROBIS", "ROBIS", "PARA_LA_EDUCADORA/ROBIS/ROBBIS", "PDF", "PARA_LA_EDUCADORA/ROBIS/Robbis_PNG/ROBBI" },
        { "PARA LA EDUCADORA", "All", "All", "IMPRIMIBLE", "RUBRICAS", "RUBRICAS", "PARA_LA_EDUCADORA/RUBRICAS/RUBRICAS", "PDF", "PARA_LA_EDUCADORA/RUBRICAS/Rubricas_PNG/RUBRICAS" }
    };
    @Transactional
    @Override
    public void onApplicationEvent(final ApplicationReadyEvent event){
        log.warn("<<<<<<<<<<<<<<<<<<<<<<<<   Application ready   >>>>>>>>>>>>>>>>>>>>>>>>>>");
        log.warn("<<<<<<<<<<<<<<<<<<<<<<<<    Init database     >>>>>>>>>>>>>>>>>>>>>>>>>>");

        ArrayList<DatosColecciones> datosArray = new ArrayList<>();
        datosArray = createColecciones_csv();

        Map<String, Map<String, List<DatosColecciones>>> map = datosArray.stream().collect(
                groupingBy( DatosColecciones::getColeccion,
                groupingBy(DatosColecciones::getNivel)));

        Map<NombreNivelEdicionColeccion, List<DatosColecciones>> datosByTuple = datosArray.stream()
                .collect(groupingBy(col -> new NombreNivelEdicionColeccion(col.getColeccion(), col.getNivel(), col.getEdicion() )));

        Object[] arrKeys = datosByTuple.keySet().stream().distinct().toArray();

        /*
        Iterator<TupleGroup> keys = datosByTuple.keySet().stream().distinct().iterator();
        while (keys.hasNext()) {
            TupleGroup key = keys.next();
            Coleccion coleccion = new Coleccion(key.getColeccion(), key.getNivel(), key.getEdicion());
            log.warn("Coleccion: " + coleccion.getNombre() + " nivel: " + coleccion.getNivel() + " edicion: " + coleccion.getEdicion());
            coleccionRepository.save(coleccion);
        }
         */

        log.warn("+=============================== segunda version  =====================================");
        datosByTuple.forEach( (key, listDocs) -> {
            Coleccion coleccion = new Coleccion(key.getColeccion(), key.getNivel(), key.getEdicion());
            log.warn("Coleccion: " + key.getColeccion() + " Nivel: " +  key.getNivel() + " Edicion: " + key.getEdicion());
            for (DatosColecciones value : listDocs) {
                log.warn("      Documento: " + value.getDocumento() + " Mime: " +  value.getMime() + " Tipo: " + value.getTipo());
                  // Documento(String nombre, String categoria, String descripcion, String uri, String mimeType, String icono, String[] archivos){
                Documento documento = new Documento(value.getDocumento(), value.getTipo(), value.getDescripcion(), value.getPath(), value.getMime(), value.getIcono(), null);
                documentoRepository.save(documento);
                coleccion.addDocumento(documento);
            }
            coleccionRepository.save(coleccion);
        });

        createEscuela_csv();
        escuelaRepository.flush();
        usuarioRepository.flush();
        createLicencias_csv();

        log.warn("<<<<<<<<<<<<<<<<<<<    Inicializacion terminada database  >>>>>>>>>>>>>>>>");
    }

    @Transactional
    public void createEscuela_csv(){
        for(int i = 0; i < escuelas_csv.length; i++){
            String[] escuelaArr = escuelas_csv[i];
            Escuela escuela = new Escuela(escuelaArr[0]);
            escuelaRepository.save(escuela);
            createUsuario_csv(escuela, alumnos_csv);
        }
        escuelaRepository.flush();
    }

    @Transactional
    public void createLicencias_csv(){
        // {"asuncion-001", "Instituto Asunción Aguilas", "CURSIVA", "Nivel 1", "2019"},
        for(int i = 0; i < licencias_csv.length; i++){
            String[] licStr = licencias_csv[i];
            String licenciaNombre = licStr[0];
            String escuelaNombre = licStr[1];
            String coleccionNombre = licStr[2];
            String nivel = licStr[3];
            String edicion = licStr[4];

            Licencia licencia = new Licencia(licenciaNombre, escuelaNombre, coleccionNombre, nivel, edicion);
            licencia = licenciaRepository.save(licencia);

            log.warn("Licencia id: " + licencia.getId());

            Escuela escuela = escuelaRepository.findByNombre(escuelaNombre);
            log.warn("Escuela id: " + escuela.getId());
            escuela.addLicencia(licencia);
            escuelaRepository.save(escuela);

            log.warn("Licencia: " + licencia.getNombre());

            //+=======================  colecciones por escuela ====================

            log.warn("Coleccion de la base: " + coleccionNombre);
            log.warn("Coleccion nivel: " + nivel);
            log.warn("Coleccion edicion: " + edicion);
            Coleccion coleccion = coleccionRepository.findByNombreAndNivelAndEdicion(coleccionNombre, nivel, edicion);
            log.warn("Coleccion de la base: " + coleccion.getNombre());

            licencia.setColeccion(coleccion);
            licenciaRepository.save(licencia);
        }
    }

    @Transactional
    public void createUsuario_csv(Escuela escuela, String[][] alumnos_arr) {
        for (int i = 0; i < alumnos_arr.length; i++ ){
            String[] datos = alumnos_arr[i];
            // log.warn("Len: " + datos.length + " nombre: " + datos[1]);
            // Usuario(String email, String nombre, String password, String role, String tipo, String nivel, String grupo){
            // { "3", "BRASSEL SOSA JAVIER", "3o C Pre", "Nivel 3"},
            Usuario usuario = new Usuario("no-email", datos[1], "password", "USER", "ALUMNO", datos[3], datos[2]);
            usuarioRepository.save(usuario);
            escuela.addUsuario(usuario);
        }
    }


    @Transactional
    private ArrayList<DatosColecciones> createColecciones_csv(){
        ArrayList<DatosColecciones> datosColecciones = new ArrayList<>();
        for (int i = 0; i < colecciones_csv.length; i++){
            String[] col_csv = colecciones_csv[i];
            DatosColecciones datosColeccion = new DatosColecciones(col_csv[0], col_csv[1], col_csv[2], col_csv[3],
            col_csv[4], col_csv[5], col_csv[6], col_csv[7], col_csv[8] );

            datosColecciones.add(datosColeccion);
        }
        return datosColecciones;
    }

    private void addLicenciasRandom(Escuela escuela){
        Random rand = new Random();
        List<Coleccion> colecciones = coleccionRepository.findAll();

        int i = 0;
        for (Coleccion coleccion: colecciones) {
            if(rand.nextInt(3) > 0){
                String licenciaNombre = "Random." + i;
                Licencia licencia = new Licencia(licenciaNombre, coleccion, true);
                escuela.addLicencia(licencia);
            }
        }

    }

    private String[] lastName = {"García", "González", "Rodríguez", "Fernández", "López",
            "Martinez", "Sánchez", "Pérez", "Gómez", "Jiménez",
            "Ruiz", "Hernández", "Díaz", "Moreno", "Romero"};

    private String[] names = {"Juan", "Luis", "José", "Maria", "Valeria",
            "Elba", "Gretel", "Ilsa", "Olivia", "Lara",
            "Pablo", "Diego", "Gabriel", "Angel", "Julián"};

    private int MAX_MAESTRAS = 15;

    private Usuario createUsuario() {
        Random rand = new Random();
        int idxName = rand.nextInt(names.length);
        int idxLastname = rand.nextInt(lastName.length);
        int unico = rand.nextInt(1000);
        String email = names[idxName] + "." + lastName[idxLastname] + "." + unico + "@gmail.com";
        String name = names[idxName] + " " + lastName[idxLastname];
        Usuario usuario = new Usuario(email, name, "2244");
        return usuario;
    }

    private void createMaestras() {
        Usuario[] usuarios = new Usuario[MAX_MAESTRAS];
        Random rand = new Random();
        for(int i = 0; i < MAX_MAESTRAS; i++) {
            int idxName = rand.nextInt(15);
            int idxLastname = rand.nextInt(15);
            int randName = rand.nextInt(30);
            String email = names[idxName] + "." + lastName[idxLastname] + randName + "@gmail.com";
            String name = names[idxName] + " " + lastName[idxLastname] + " " + randName;
            usuarios[i] = new Usuario(email, name, "2244");
        }
    }

    private int MAX_DOCUMENTOS = 6;
    String[] docsNombres = {"Actividades", "Guía Pedagógica", "Tareas", "Ejercicios"};

    String[] docsDescr = {"Actividades dentro del salon de clases", "Guía Pedagógica para la maestra", "Tareas y ejercicios para hacer en casa", "Ejercicios dentro del salón de clase"};

    String[] mimeType = {"pdf", "audio", "video", "imagen"};

    String[] pdfLinks = {
            "http://localhost:8080/pdf/PREE-1-MIALBUM-BAJA.pdf",
            "http://localhost:8080/pdf/PREE-2-MIALBUM-BAJA.pdf",
            "http://localhost:8080/pdf/PREE-3-MIALBUM-BAJA.pdf"
    };

    String[] audioLinks = {
            "http://localhost:8080/audios/audio00.mp3",
            "http://localhost:8080/audios/audio01.mp3",
            "http://localhost:8080/audios/audio02.mp3"
    };

   String[] videoLinks = { "https://www.youtube.com/embed/9WNCpGxZ0Gg",
            "https://www.youtube.com/embed/AgoJOI0A3e8",
           "https://www.youtube.com/embed/iaaZKuHXOVU",
           "https://www.youtube.com/embed/VODa1HYGHn4",
           "https://www.youtube.com/embed/2vF3H6mx3eM"
   };

    String[] imagenLinks = {
            "https://www.youtube.com/embed/9WNCpGxZ0Gg",
            "https://www.youtube.com/embed/9WNCpGxZ0Gg",
            "https://www.youtube.com/embed/9WNCpGxZ0Gg",
            "https://www.youtube.com/embed/9WNCpGxZ0Gg"
    };
    Map<String, String[]> media = Map.of(
            "pdf", pdfLinks,
            "audio", audioLinks,
            "video", videoLinks,
            "imagen", imagenLinks
    );

    /*
    private void addDocumentos(Planeacion planeacion){
        Random rand = new Random();
        int numDocs = rand.nextInt(MAX_DOCUMENTOS) + 1;
        for(int i = 0; i < numDocs; i++) {
            int idxNombre = rand.nextInt(docsNombres.length);
            // public Documento(String nombre, String descripcion, String uri, String mimeType, String fechaStr){
            String mime = getMimetype();
            String link = getLink(mime);
            String nombre = docsNombres[idxNombre];
            String descr = docsDescr[idxNombre];
            String[] archivos = new String[]{ "http://localhost:8080/images/back01_640x480.jpg",
                    "http://localhost:8080/images/back02_640x480.jpg",
                    "http://localhost:8080/images/back03_640x480.jpg"
                };
           Documento doc = new Documento(nombre, descr,  link,  mime, "20-09-2020", archivos);

           // documentoRepository.save(doc);
           planeacion.addDocumento(doc);
           // planeacionRepository.save(planeacion);
        }
    }
     */

    private String getMimetype() {
        Random rand = new Random();

        Set<String> keys = media.keySet();
        int len = media.keySet().size();
        int selected = rand.nextInt(len);
        String arr[] = new String[len];

        int i = 0;
        for (String x : keys){
            arr[i++] = x;
        }
        return arr[selected];
    }

    private String getLink(String mime){
        Random rand = new Random();
        String arr[] = media.get(mime);
        int len = arr.length;
        int selected = rand.nextInt(len);
        return arr[selected];
    }

}
