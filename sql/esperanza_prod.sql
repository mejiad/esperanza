--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.19
-- Dumped by pg_dump version 9.6.19

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: archivo; Type: TABLE; Schema: public; Owner: user01
--

CREATE TABLE public.archivo (
    id bigint NOT NULL,
    created timestamp without time zone,
    guid character varying(255),
    modified timestamp without time zone,
    descripcion character varying(255),
    nombre character varying(255),
    uri character varying(255)
);


ALTER TABLE public.archivo OWNER TO user01;

--
-- Name: archivo_id_seq; Type: SEQUENCE; Schema: public; Owner: user01
--

CREATE SEQUENCE public.archivo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.archivo_id_seq OWNER TO user01;

--
-- Name: archivo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user01
--

ALTER SEQUENCE public.archivo_id_seq OWNED BY public.archivo.id;


--
-- Name: coleccion; Type: TABLE; Schema: public; Owner: user01
--

CREATE TABLE public.coleccion (
    id bigint NOT NULL,
    created timestamp without time zone,
    guid character varying(255),
    modified timestamp without time zone,
    edicion character varying(255),
    nivel character varying(255),
    nombre character varying(255)
);


ALTER TABLE public.coleccion OWNER TO user01;

--
-- Name: coleccion_documentos; Type: TABLE; Schema: public; Owner: user01
--

CREATE TABLE public.coleccion_documentos (
    coleccion_id bigint NOT NULL,
    documentos_id bigint NOT NULL
);


ALTER TABLE public.coleccion_documentos OWNER TO user01;

--
-- Name: coleccion_id_seq; Type: SEQUENCE; Schema: public; Owner: user01
--

CREATE SEQUENCE public.coleccion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.coleccion_id_seq OWNER TO user01;

--
-- Name: coleccion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user01
--

ALTER SEQUENCE public.coleccion_id_seq OWNED BY public.coleccion.id;


--
-- Name: documento; Type: TABLE; Schema: public; Owner: user01
--

CREATE TABLE public.documento (
    id bigint NOT NULL,
    created timestamp without time zone,
    guid character varying(255),
    modified timestamp without time zone,
    archivos text[],
    categoria character varying(255),
    descripcion character varying(255),
    fecha date,
    icono character varying(255),
    mime_type character varying(255),
    nombre character varying(255),
    uri character varying(255)
);


ALTER TABLE public.documento OWNER TO user01;

--
-- Name: documento_id_seq; Type: SEQUENCE; Schema: public; Owner: user01
--

CREATE SEQUENCE public.documento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.documento_id_seq OWNER TO user01;

--
-- Name: documento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user01
--

ALTER SEQUENCE public.documento_id_seq OWNED BY public.documento.id;


--
-- Name: escuela; Type: TABLE; Schema: public; Owner: user01
--

CREATE TABLE public.escuela (
    id bigint NOT NULL,
    created timestamp without time zone,
    guid character varying(255),
    modified timestamp without time zone,
    nombre character varying(255)
);


ALTER TABLE public.escuela OWNER TO user01;

--
-- Name: escuela_grupos; Type: TABLE; Schema: public; Owner: user01
--

CREATE TABLE public.escuela_grupos (
    escuela_id bigint NOT NULL,
    grupos_id bigint NOT NULL
);


ALTER TABLE public.escuela_grupos OWNER TO user01;

--
-- Name: escuela_id_seq; Type: SEQUENCE; Schema: public; Owner: user01
--

CREATE SEQUENCE public.escuela_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.escuela_id_seq OWNER TO user01;

--
-- Name: escuela_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user01
--

ALTER SEQUENCE public.escuela_id_seq OWNED BY public.escuela.id;


--
-- Name: escuela_licencias; Type: TABLE; Schema: public; Owner: user01
--

CREATE TABLE public.escuela_licencias (
    escuela_id bigint NOT NULL,
    licencias_id bigint NOT NULL
);


ALTER TABLE public.escuela_licencias OWNER TO user01;

--
-- Name: escuela_usuarios; Type: TABLE; Schema: public; Owner: user01
--

CREATE TABLE public.escuela_usuarios (
    escuela_id bigint NOT NULL,
    usuarios_id bigint NOT NULL
);


ALTER TABLE public.escuela_usuarios OWNER TO user01;

--
-- Name: grupo; Type: TABLE; Schema: public; Owner: user01
--

CREATE TABLE public.grupo (
    id bigint NOT NULL,
    created timestamp without time zone,
    guid character varying(255),
    modified timestamp without time zone,
    nombre character varying(255),
    escuela_id bigint
);


ALTER TABLE public.grupo OWNER TO user01;

--
-- Name: grupo_id_seq; Type: SEQUENCE; Schema: public; Owner: user01
--

CREATE SEQUENCE public.grupo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.grupo_id_seq OWNER TO user01;

--
-- Name: grupo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user01
--

ALTER SEQUENCE public.grupo_id_seq OWNED BY public.grupo.id;


--
-- Name: licencia; Type: TABLE; Schema: public; Owner: user01
--

CREATE TABLE public.licencia (
    id bigint NOT NULL,
    created timestamp without time zone,
    guid character varying(255),
    modified timestamp without time zone,
    asientos integer NOT NULL,
    begin_date timestamp without time zone,
    coleccion_nombre character varying(255),
    edicion character varying(255),
    end_date timestamp without time zone,
    escuela_nombre character varying(255),
    is_enable boolean NOT NULL,
    nivel character varying(255),
    nombre character varying(255),
    coleccion_id bigint,
    escuela_id bigint
);


ALTER TABLE public.licencia OWNER TO user01;

--
-- Name: licencia_id_seq; Type: SEQUENCE; Schema: public; Owner: user01
--

CREATE SEQUENCE public.licencia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.licencia_id_seq OWNER TO user01;

--
-- Name: licencia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user01
--

ALTER SEQUENCE public.licencia_id_seq OWNED BY public.licencia.id;


--
-- Name: spring_session; Type: TABLE; Schema: public; Owner: user01
--

CREATE TABLE public.spring_session (
    primary_id character(36) NOT NULL,
    session_id character(36) NOT NULL,
    creation_time bigint NOT NULL,
    last_access_time bigint NOT NULL,
    max_inactive_interval integer NOT NULL,
    expiry_time bigint NOT NULL,
    principal_name character varying(100)
);


ALTER TABLE public.spring_session OWNER TO user01;

--
-- Name: spring_session_attributes; Type: TABLE; Schema: public; Owner: user01
--

CREATE TABLE public.spring_session_attributes (
    session_primary_id character(36) NOT NULL,
    attribute_name character varying(200) NOT NULL,
    attribute_bytes bytea NOT NULL
);


ALTER TABLE public.spring_session_attributes OWNER TO user01;

--
-- Name: usuario; Type: TABLE; Schema: public; Owner: user01
--

CREATE TABLE public.usuario (
    id bigint NOT NULL,
    created timestamp without time zone,
    guid character varying(255),
    modified timestamp without time zone,
    email character varying(255),
    enabled boolean NOT NULL,
    grupo character varying(255),
    nivel character varying(255),
    nombre character varying(255),
    password character varying(255),
    role character varying(255),
    tipo character varying(255),
    escuela_id bigint
);


ALTER TABLE public.usuario OWNER TO user01;

--
-- Name: usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: user01
--

CREATE SEQUENCE public.usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuario_id_seq OWNER TO user01;

--
-- Name: usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user01
--

ALTER SEQUENCE public.usuario_id_seq OWNED BY public.usuario.id;


--
-- Name: archivo id; Type: DEFAULT; Schema: public; Owner: user01
--

ALTER TABLE ONLY public.archivo ALTER COLUMN id SET DEFAULT nextval('public.archivo_id_seq'::regclass);


--
-- Name: coleccion id; Type: DEFAULT; Schema: public; Owner: user01
--

ALTER TABLE ONLY public.coleccion ALTER COLUMN id SET DEFAULT nextval('public.coleccion_id_seq'::regclass);


--
-- Name: documento id; Type: DEFAULT; Schema: public; Owner: user01
--

ALTER TABLE ONLY public.documento ALTER COLUMN id SET DEFAULT nextval('public.documento_id_seq'::regclass);


--
-- Name: escuela id; Type: DEFAULT; Schema: public; Owner: user01
--

ALTER TABLE ONLY public.escuela ALTER COLUMN id SET DEFAULT nextval('public.escuela_id_seq'::regclass);


--
-- Name: grupo id; Type: DEFAULT; Schema: public; Owner: user01
--

ALTER TABLE ONLY public.grupo ALTER COLUMN id SET DEFAULT nextval('public.grupo_id_seq'::regclass);


--
-- Name: licencia id; Type: DEFAULT; Schema: public; Owner: user01
--

ALTER TABLE ONLY public.licencia ALTER COLUMN id SET DEFAULT nextval('public.licencia_id_seq'::regclass);


--
-- Name: usuario id; Type: DEFAULT; Schema: public; Owner: user01
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id SET DEFAULT nextval('public.usuario_id_seq'::regclass);


--
-- Data for Name: archivo; Type: TABLE DATA; Schema: public; Owner: user01
--

COPY public.archivo (id, created, guid, modified, descripcion, nombre, uri) FROM stdin;
\.


--
-- Name: archivo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user01
--

SELECT pg_catalog.setval('public.archivo_id_seq', 1, false);


--
-- Data for Name: coleccion; Type: TABLE DATA; Schema: public; Owner: user01
--

COPY public.coleccion (id, created, guid, modified, edicion, nivel, nombre) FROM stdin;
1	2020-10-12 18:46:38.266414	8ff7198a-44b7-445a-8742-f22a68861bad	2020-10-12 18:46:38.266439	2018	Nivel 2	CARPETA CLAVE
2	2020-10-12 18:46:38.275991	21485681-4b83-436d-a4d7-ae0381911cda	2020-10-12 18:46:38.276012	2015	Nivel 3	I DO SPEAK
3	2020-10-12 18:46:38.283016	cb6ae0c4-bb56-444d-b5b5-e24574c1f681	2020-10-12 18:46:38.283036	All	Nivel 2	ABC
4	2020-10-12 18:46:38.287184	81726ece-3248-4402-9ce4-a9d3be830ceb	2020-10-12 18:46:38.287204	2019	Nivel 3	ABC
5	2020-10-12 18:46:38.293551	02a17f62-7359-49a4-b7ae-ebbcd502aaaa	2020-10-12 18:46:38.293572	All	All	CARPETA CLAVE
6	2020-10-12 18:46:38.297652	4b3e601a-d506-44f2-90c7-528924e0e63f	2020-10-12 18:46:38.297673	2015	Nivel 3	CURSIVA
7	2020-10-12 18:46:38.30499	912e817e-ee1b-4d7a-a942-c4e510e8c1dc	2020-10-12 18:46:38.305011	2017	Nivel 3	1,2,3
8	2020-10-12 18:46:38.311439	5fade569-9ad4-4494-a895-3df60af3290c	2020-10-12 18:46:38.311461	2018	Nivel 1	CARPETA CLAVE
9	2020-10-12 18:46:38.318253	6e970748-e5df-40ab-aa06-527bed0ce058	2020-10-12 18:46:38.318282	2019	Nivel 3	CURSIVA
10	2020-10-12 18:46:38.325273	b3865f84-a29a-4ac8-8799-846ed5d344ee	2020-10-12 18:46:38.325305	2017	Nivel 2	1,2,3
11	2020-10-12 18:46:38.335656	2e688e7a-5c70-4adb-9fc5-d66ce2987af0	2020-10-12 18:46:38.335684	2015	Nivel 3	ABC
12	2020-10-12 18:46:38.355792	1cb64c99-1c53-4487-a32a-fcaecd517083	2020-10-12 18:46:38.355819	All	All	1,2,3
13	2020-10-12 18:46:38.367921	d83b4b0b-d37c-4154-a425-afa4836f36c2	2020-10-12 18:46:38.36794	2017	Nivel 3	ABC
14	2020-10-12 18:46:38.391013	429f59d1-35b1-4649-8244-582defd9ff6c	2020-10-12 18:46:38.391033	All	All	CURSIVA
15	2020-10-12 18:46:38.395234	b6a61adc-0e82-453c-98d5-d2e2783a0705	2020-10-12 18:46:38.395252	2015	Nivel 2	CURSIVA
16	2020-10-12 18:46:38.403639	60783244-ffc3-4f73-9017-2076503c2169	2020-10-12 18:46:38.403661	All	All	PARA LA EDUCADORA
17	2020-10-12 18:46:38.410418	afab2e31-8d76-4025-a73c-94ecad4a415a	2020-10-12 18:46:38.410439	All	Nivel 3	ABC
18	2020-10-12 18:46:38.416581	c00eb601-383f-46f2-86d5-0ba9104724f6	2020-10-12 18:46:38.416607	2019	Nivel 2	CURSIVA
19	2020-10-12 18:46:38.423033	43a9dd2e-f6e1-4232-b30f-7b93be63d3b2	2020-10-12 18:46:38.423058	2019	Nivel 1	1,2,3
20	2020-10-12 18:46:38.428597	7577aca8-000d-46fd-aa36-c0aaf6a85545	2020-10-12 18:46:38.428614	All	Nivel 1	ABC
21	2020-10-12 18:46:38.434936	625ac619-d675-4116-9e00-0bd4f7cb6d4b	2020-10-12 18:46:38.434965	2020	Nivel 3	CURSIVA
22	2020-10-12 18:46:38.438451	b063ee1e-86b1-4b20-80e0-d349e9328e69	2020-10-12 18:46:38.438468	All	Nivel 3	I DO SPEAK
23	2020-10-12 18:46:38.443493	29033f3d-e250-43df-8632-bc170f02d767	2020-10-12 18:46:38.443507	2017	Nivel 2	ABC
24	2020-10-12 18:46:38.448607	ce8d50ef-eb85-465b-8c25-874382f02717	2020-10-12 18:46:38.448623	2020	Nivel 2	1,2,3
25	2020-10-12 18:46:38.454718	69b92a31-fe74-4fbe-9d08-0594afeebe24	2020-10-12 18:46:38.454743	2019	Nivel 1	CURSIVA
26	2020-10-12 18:46:38.461122	47514b72-7c46-42b1-9564-d4969d73a2bc	2020-10-12 18:46:38.461144	2018	Nivel 3	CARPETA CLAVE
27	2020-10-12 18:46:38.465516	096a3c57-803e-40f0-ae6d-f10180b25214	2020-10-12 18:46:38.465538	2015	Nivel 1	CURSIVA
28	2020-10-12 18:46:38.472929	4cc18f85-1738-49d3-b0a9-5de1c635e1de	2020-10-12 18:46:38.472956	2020	Nivel 3	1,2,3
29	2020-10-12 18:46:38.481841	2c9bb169-df13-4430-a4b0-65fc77e6babc	2020-10-12 18:46:38.481851	All	All	ABC
30	2020-10-12 18:46:38.484356	3d588d3d-4620-475e-a8b8-9fb16cb96471	2020-10-12 18:46:38.484365	2017	Nivel 1	ABC
\.


--
-- Data for Name: coleccion_documentos; Type: TABLE DATA; Schema: public; Owner: user01
--

COPY public.coleccion_documentos (coleccion_id, documentos_id) FROM stdin;
1	1
1	2
2	3
3	4
3	5
4	6
5	7
5	8
6	9
7	10
7	11
8	12
8	13
9	14
9	15
10	16
10	17
11	18
11	19
11	20
11	21
12	22
12	23
12	24
12	25
12	26
12	27
12	28
13	29
13	30
13	31
13	32
13	33
14	34
14	35
14	36
14	37
14	38
14	39
14	40
14	41
14	42
14	43
15	44
16	45
16	46
16	47
17	48
17	49
18	50
18	51
19	52
19	53
20	54
20	55
21	56
21	57
22	58
23	59
23	60
24	61
24	62
25	63
25	64
26	65
26	66
27	67
28	68
28	69
29	70
29	71
29	72
29	73
29	74
30	75
\.


--
-- Name: coleccion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user01
--

SELECT pg_catalog.setval('public.coleccion_id_seq', 30, true);


--
-- Data for Name: documento; Type: TABLE DATA; Schema: public; Owner: user01
--

COPY public.documento (id, created, guid, modified, archivos, categoria, descripcion, fecha, icono, mime_type, nombre, uri) FROM stdin;
1	2020-10-12 18:46:38.225655	6a30fb0d-5045-49b3-bb32-2c14a29916c3	2020-10-12 18:46:38.226867	\N	LIBRO	CARPETA CLAVE NIVEL 2	\N	CARPETA_CLAVE/LIBROS/Portadas_PNG/CARPETA_N2	PDF	CARPETA CLAVE NIVEL 2	CARPETA_CLAVE/LIBROS/CARPETA_N2
2	2020-10-12 18:46:38.263608	05a9ce69-5211-4788-ad49-556898bb4d28	2020-10-12 18:46:38.263632	\N	GUIA CLAVE	GUIA CLAVE NIVEL 2	\N	CARPETA_CLAVE/GUIAS/GUIAS_PNG/GUIA_N2	PDF	GUIA CLAVE NIVEL 2	CARPETA_CLAVE/GUIAS/GUIA_CLAVE_N2
3	2020-10-12 18:46:38.274031	91390f2b-38cc-42ed-aff0-2f7a3382a60b	2020-10-12 18:46:38.274053	\N	LIBRO	Está diseñado para que los pequeños logren escribir y leer de una froma divertida  en inglés; del mismo modo el material promueve que el niño amplíe su vocabulario y desarrolle su conciencia lingüísti	\N	IDOSPEAK/LIBRO/Portada_PNG/IDO	PDF	I DO SPEAK	IDOSPEAK/LIBRO/IDOSPEAK
4	2020-10-12 18:46:38.278037	154cdca1-2336-4d6c-8954-38e16d5acb30	2020-10-12 18:46:38.278059	\N	IMPRIMIBLE	VOCABULARIO NIVEL 2	\N	ABC/PALABRAS/Vocabulario_PNG/VOCABULARIO_N2	PDF	VOCABULARIO NIVEL 2	ABC/PALABRAS/VOCBULARIO_N2
5	2020-10-12 18:46:38.280563	38e7eeef-9adc-4f75-a610-6c13968bc4f9	2020-10-12 18:46:38.280593	\N	IMPRIMIBLE	FICHERO SILÁBICO NIVEL 2	\N	ABC/FICHEROS/Ficheros_PNG/FICHEROS_N2	PDF	FICHERO SILÁBICO NIVEL 2	ABC/FICHEROS/FICHERO_N2
6	2020-10-12 18:46:38.285008	1c30d7ef-6830-4a13-a3a6-e7e367e84d7b	2020-10-12 18:46:38.285037	\N	LIBRO	TAREAS Y LECTURAS	\N	ABC/LIBROS/Libros_PNG/TAREAS_Y_LECTURAS	PDF	TAREAS Y LECTURAS	ABC/LIBROS/TAREAS_Y_LECTURAS
7	2020-10-12 18:46:38.28928	4a26ebcb-c3f5-4b59-8bc9-dde42d11736c	2020-10-12 18:46:38.2893	\N	VIDEOS	CUIDADO DEL AGUA	\N	CARPETA/VIDEOS_ECOSISTEMAS/VIDEOS_PNG/CUIDADO_DEL_AGUA	VIDEO	CUIDADO DEL AGUA	https://www.youtube.com/watch?v=b8X1Gnr0b68
8	2020-10-12 18:46:38.291512	e577618e-3a13-4245-bb9b-e71ff5fddbce	2020-10-12 18:46:38.291534	\N	VIDEOS	¡CUIDEMOS EL AGUA!	\N	CARPETA/VIDEOS_ECOSISTEMAS/VIDEOS_PNG/CUIDEMOS_EL_AGUA	VIDEO	¡CUIDEMOS EL AGUA!	https://www.youtube.com/watch?v=2q4I_oDWTHU
9	2020-10-12 18:46:38.295689	ed331b49-7bea-43b2-a592-161c019ff0ec	2020-10-12 18:46:38.295709	\N	LIBRO	CURSIVA NIVEL 3	\N	CURSIVA/LIBROS/Portadas_PNG/Cursiva_2015_N3_320.png	PDF	CURSIVA NIVEL 3	CURSIVA/LIBROS/Cur_n3_2015.pdf
10	2020-10-12 18:46:38.300832	14d11b11-d646-4697-af71-3c01d8fa90bf	2020-10-12 18:46:38.300868	\N	LIBRO	1,2,3 NIVEL 3	\N	123/LIBROS/Portadas_PNG/123_2017_N3	PDF	1,2,3 NIVEL 3	123/LIBROS/123_N3_2017
11	2020-10-12 18:46:38.303129	ed02e439-bd5f-4226-b5ea-ef852300a228	2020-10-12 18:46:38.30315	\N	PLANEACIONES	PLANEACIONES 1,2,3 NIVEL 3	\N	123/PLANEACIONES/2017/2017/PLANEACION_123_N3	PDF	PLANEACIONES 1,2,3 NIVEL 3	123/PLANEACIONES/2017/PLANEACIONES_123_NIVEL_3
12	2020-10-12 18:46:38.307173	4d5c3b0d-e040-4740-bdab-0f4ccb683caf	2020-10-12 18:46:38.307196	\N	LIBRO	Esta colección integra los contenidos de los componentes curriculares o aprendizajes clave de la educación preescolar. Parte de las necesidades de los niños y apoya el desarrollo de las competencias, 	\N	CARPETA_CLAVE/LIBROS/Portdas_PNG/CARPETA_N1	PDF	CARPETA CLAVE NIVEL 1	CARPETA_CLAVE/LIBROS/CARPETA_N1
13	2020-10-12 18:46:38.309611	a672b7cb-6370-416f-aad8-8cf7b27aed90	2020-10-12 18:46:38.309647	\N	GUIA CLAVE	GUIA CLAVE NIVEL 1	\N	CARPETA_CLAVE/GUIAS/GUIAS_PNG/GUIA_N1	PDF	GUIA CLAVE NIVEL 1	CARPETA_CLAVE/GUIAS/GUIA_CLAVE_N1
14	2020-10-12 18:46:38.313791	6c0f242f-fe63-49ee-8f61-ebd49a7b3e6e	2020-10-12 18:46:38.313821	\N	LIBRO	CURSIVA NIVEL 3	\N	CURSIVA/LIBROS/Portadas_PNG/Cursiva_2019_N3_320.png	PDF	CURSIVA NIVEL 3	CURSIVA/LIBROS/CURSIVA_N3_2019.pdf
15	2020-10-12 18:46:38.316204	8ce4cba8-28fe-451b-aaa7-9bb556c58486	2020-10-12 18:46:38.316225	\N	PLANEACIONES	PLANEACIONES CURSIVA NIVEL 3	\N	CURSIVA/PLANEACIONES/Planeaciones_png/Planeacion_cursiva_N3.png	PDF	PLANEACIONES CURSIVA NIVEL 3	CURSIVA/PLANEACIONES/Cursiva_N3.pdf
16	2020-10-12 18:46:38.320644	1282296c-b2ec-4780-86cb-0587087ccee1	2020-10-12 18:46:38.320674	\N	LIBRO	1,2,3 NIVEL 2	\N	123/LIBROS/Portadas_PNG/123_2017_N2	PDF	1,2,3 NIVEL 2	123/LIBROS/123_N2_2017
17	2020-10-12 18:46:38.322952	f5005da5-8c3c-4eee-bc03-0fa6da6a37a7	2020-10-12 18:46:38.322974	\N	PLANEACIONES	PLANEACIONES 1,2,3 NIVEL 2	\N	123/PLANEACIONES/2017/2017/PLANEACION_123_N2	PDF	PLANEACIONES 1,2,3 NIVEL 2	123/PLANEACIONES/2017/PLANEACIONES_123_NIVEL_2
18	2020-10-12 18:46:38.327794	ac091e61-8451-49c3-9b5e-d629941d8edb	2020-10-12 18:46:38.327818	\N	LIBRO	TAREAS Y LECTURAS LIBRO 2	\N	ABC/LIBROS/Libros_PNG/TAREAS_Y_LECTURAS_L2	PDF	TAREAS Y LECTURAS LIBRO 2	ABC/LIBROS/TAREAS_Y_LECTURAS_L2
19	2020-10-12 18:46:38.329851	ded7bfd5-62ca-4120-847d-7944f35e3444	2020-10-12 18:46:38.329881	\N	LIBRO	TAREAS Y LECTURAS LIBRO 3	\N	ABC/LIBROS/Libros_PNG/TAREAS_Y_LECTURAS_L3	PDF	TAREAS Y LECTURAS LIBRO 3	ABC/LIBROS/TAREAS_Y_LECTURAS_L3
20	2020-10-12 18:46:38.331853	2229fe1c-7a0e-4df0-b419-e48bdde23af5	2020-10-12 18:46:38.331882	\N	LIBRO	TAREAS Y LECTURAS LIBRO 4	\N	ABC/LIBROS/Libros_PNG/TAREAS_Y_LECTURAS_L4	PDF	TAREAS Y LECTURAS LIBRO 4	ABC/LIBROS/TAREAS_Y_LECTURAS_L4
21	2020-10-12 18:46:38.333736	871065ba-1dd9-43c6-80b5-8222c3148728	2020-10-12 18:46:38.333759	\N	LIBRO	TAREAS Y LECTURAS LIBRO 5	\N	ABC/LIBROS/Libros_PNG/TAREAS_Y_LECTURAS_L5	PDF	TAREAS Y LECTURAS LIBRO 5	ABC/LIBROS/TAREAS_Y_LECTURAS_L5
22	2020-10-12 18:46:38.33798	06535783-27e5-47f5-a9cb-a5fe0ab2c43a	2020-10-12 18:46:38.338016	\N	IMPRIMIBLE	RECTA NUMERICA	\N	123/RECTA_NUMERICA/PNG/RECTAS_NUMERICAS	PDF	RECTA NUMERICA	123/RECTA_NUMERICA/RECTAS_DOBLE_CARTA
23	2020-10-12 18:46:38.340683	bff60974-b48f-4e1f-9b25-3c56060c8b9f	2020-10-12 18:46:38.340713	\N	IMPRIMIBLE	REGLETAS	\N	123/REGLETAS/PNG/REGLETAS	PDF	REGLETAS	123/REGLETAS/REGLETAS_RECORTABLES
24	2020-10-12 18:46:38.343548	700b9c56-c258-48d7-9e42-58e63132189a	2020-10-12 18:46:38.343578	\N	IMPRIMIBLE	SERIE NUMERICA	\N	123/SERIE_NUMERICA/PNG/SERIE_NUMERICA	PDF	SERIE NUMERICA	123/SERIE_NUMERICA/SERIE_NUMERICA_COPIA
25	2020-10-12 18:46:38.345809	29ce445c-a194-40f0-aa02-a8351147b3c1	2020-10-12 18:46:38.345834	\N	IMPRIMIBLE	TABLA DE EQUIVALENCIA	\N	123/TABLA_DE_EQUIVALENCIA/PNG/EQUIVALENCIAS	PDF	TABLA DE EQUIVALENCIA	123/TABLA_DE_EQUIVALENCIA/TABLA_DE_EQUIVALENCIA_DE_REGLETAS
26	2020-10-12 18:46:38.349025	8d61f9df-3d17-4658-9584-9721dfb43474	2020-10-12 18:46:38.349054	\N	IMPRIMIBLE	TANGRAM	\N	123/TANGRAM/PNG/TANGRAM	PDF	TANGRAM	123/TANGRAM/TANGRAM
27	2020-10-12 18:46:38.351305	877ee916-5ffc-47b8-a671-e1b4b03294d2	2020-10-12 18:46:38.351334	\N	PROYECTO	CAJA MAGICA	\N	123/PROYECTO_MATE/Portada_PNG/PORTADA_PRESENTACION_123	PDF	CAJA MAGICA	123/PROYECTO_MATE/PRESENTACION_1
28	2020-10-12 18:46:38.353588	b3e1e483-76c3-4b28-9730-b07caa2491d1	2020-10-12 18:46:38.353617	\N	VIDEOS	TRAZOS NUMEROS	\N	123/VIDEOS_DE_CAMPOS_FORMATIVOS/Capturas_PNG	VIDEO	TRAZOS NUMEROS	https://www.youtube.com/playlist?list=PL_QRaPtZsvK9RNRO_kVcP3p9P9ThpHjed
29	2020-10-12 18:46:38.357911	91fe7107-f7f9-4e7d-87a1-6d1a026dbdad	2020-10-12 18:46:38.357931	\N	LIBRO	ABC NIVEL 3 LIBRO 1	\N	ABC/LIBROS/Libros_PNG/ABC_N3_L1	PDF	ABC NIVEL 3 LIBRO 1	ABC/LIBROS/ABC_N3_L1
30	2020-10-12 18:46:38.360227	e59413c6-3965-48f1-9fe6-06d42e162075	2020-10-12 18:46:38.360248	\N	LIBRO	ABC NIVEL 3 LIBRO 2	\N	ABC/LIBROS/Libros_PNG/ABC_N3_L2	PDF	ABC NIVEL 3 LIBRO 2	ABC/LIBROS/ABC_N3_L2
31	2020-10-12 18:46:38.362172	f5375048-195d-4921-92e2-0d5424e9a01e	2020-10-12 18:46:38.362192	\N	LIBRO	ABC NIVEL 3 LIBRO 3	\N	ABC/LIBROS/Libros_PNG/ABC_N3_L3	PDF	ABC NIVEL 3 LIBRO 3	ABC/LIBROS/ABC_N3_L3
32	2020-10-12 18:46:38.36438	48850e34-1b4b-42d2-bb7c-906c16ae3d23	2020-10-12 18:46:38.364401	\N	LIBRO	ABC NIVEL 3 LIBRO 4	\N	ABC/LIBROS/Libros_PNG/ABC_N3_L4	PDF	ABC NIVEL 3 LIBRO 4	ABC/LIBROS/ABC_N3_L4
33	2020-10-12 18:46:38.366254	a46171a1-9050-432d-b736-bf8205ba4664	2020-10-12 18:46:38.366273	\N	LIBRO	ABC NIVEL 3 LIBRO 5	\N	ABC/LIBROS/Libros_PNG/ABC_N3_L5	PDF	ABC NIVEL 3 LIBRO 5	ABC/LIBROS/ABC_N3_L5
34	2020-10-12 18:46:38.37004	7f15a622-2877-4866-a231-6cce9b31d7f8	2020-10-12 18:46:38.370069	\N	IMPRIMIBLE	TRAZO DE ABECEDARIO	\N	CURSIVA/ALFABETO/PNG/Alfabeto_320.png	PDF	TRAZO DE ABECEDARIO	CURSIVA/ALFABETO/abecedario_cursiva.pdf
35	2020-10-12 18:46:38.372729	ba0976c2-0f1f-436d-a4de-b98adcca3b26	2020-10-12 18:46:38.37275	\N	IMPRIMIBLE	ABECEDARIO	\N	CURSIVA/POSTERS/PNG/Abecedario_320.png	PDF	ABECEDARIO	CURSIVA/POSTERS/AbecedariO.pdf
36	2020-10-12 18:46:38.37472	46082221-a6f4-4984-a59d-4cc4cfafe2d4	2020-10-12 18:46:38.37474	\N	IMPRIMIBLE	CARRETILLAS M Y L	\N	CURSIVA/CARRETILLA/PNG/Fichas_M_L_320.png	PDF	CARRETILLAS M Y L	CURSIVA/CARRETILLA/Fichas_M_L.pdf
37	2020-10-12 18:46:38.376532	a1ecad24-0e19-4c44-a3ed-14382f458198	2020-10-12 18:46:38.376555	\N	IMPRIMIBLE	CARRETILLAS P Y S	\N	CURSIVA/CARRETILLA/PNG/Fichas_P_S_320.png	PDF	CARRETILLAS P Y S	CURSIVA/CARRETILLA/Fichas_P_S.pdf
38	2020-10-12 18:46:38.378223	93d27e0b-fdad-4071-bf28-820e98c51bb5	2020-10-12 18:46:38.378242	\N	IMPRIMIBLE	PERSONAJES CURSIVA	\N	CURSIVA/NINOS/PNG/Ninos_320.png	PDF	PERSONAJES CURSIVA	CURSIVA/NINOS/Ninos_cursiva.pdf
39	2020-10-12 18:46:38.380339	c09aefd6-6b33-464d-b1a2-573f9ff006ea	2020-10-12 18:46:38.380371	\N	IMPRIMIBLE	VOCALES	\N	CURSIVA/VOCALES/PNG/Vocales_320.png	PDF	VOCALES	CURSIVA/VOCALES/Vocales.pdf
40	2020-10-12 18:46:38.383339	347d555f-c5b5-4a4e-a154-148d598ea035	2020-10-12 18:46:38.383376	\N	VIDEOS	TRAZO DE LAS CONSONANTES D	\N	VIDEOS/CURSIVA/CONSONANTES/PNG/D.png	VIDEO	TRAZO DE LAS CONSONANTES	VIDEOS/CURSIVA/CONSONANTES/D.mp4
41	2020-10-12 18:46:38.385345	ba54e0f5-3725-4111-8bb7-99935d14f370	2020-10-12 18:46:38.385382	\N	VIDEOS	TRAZO DE LAS CONSONANTES L	\N	VIDEOS/CURSIVA/CONSONANTES/PNG/D.png	VIDEO	TRAZO DE LAS CONSONANTES	VIDEOS/CURSIVA/CONSONANTES/L.mp4
42	2020-10-12 18:46:38.387193	79f6d21e-a781-4e3e-9651-39ece5027312	2020-10-12 18:46:38.387213	\N	VIDEOS	TRAZOS CURSIVA VOCALES A	\N	VIDEOS/CURSIVA/VOCALES/PNG/A.png	VIDEO	TRAZOS CURSIVA VOCALES	VIDEOS/CURSIVA/VOCALES/A_480p.mov
43	2020-10-12 18:46:38.389059	914f063a-3ed2-4414-8558-e0eb074adc8f	2020-10-12 18:46:38.389095	\N	VIDEOS	TRAZOS CURSIVA VOCALES E	\N	VIDEOS/CURSIVA/VOCALES/PNG/A.png	VIDEO	TRAZOS CURSIVA VOCALES	VIDEOS/CURSIVA/VOCALES/E_480p.mov
44	2020-10-12 18:46:38.393104	a270bd3e-aa81-4985-a6ec-6848dbcac899	2020-10-12 18:46:38.393141	\N	LIBRO	CURSIVA NIVEL 2	\N	CURSIVA/LIBROS/Portadas_PNG/Cursiva_2015_N2_320.png	PDF	CURSIVA NIVEL 2	CURSIVA/LIBROS/cur-n2-2015.pdf
45	2020-10-12 18:46:38.397349	4eaa33ae-3f94-4f5b-8a1d-246f8b941606	2020-10-12 18:46:38.397369	\N	IMPRIMIBLE	PROTOCOLO ESCUCHA ACTIVA	\N	PARA_LA_EDUCADORA/ESCUCHA_ACTIVA/Escucha_Activa_PNG/ESCUCHA_ACTIVA	PDF	PROTOCOLO ESCUCHA ACTIVA	PARA_LA_EDUCADORA/ESCUCHA_ACTIVA/ESCUCHA_ACTIVA
46	2020-10-12 18:46:38.399745	0bbc9a22-eee9-4764-911e-a4501f446686	2020-10-12 18:46:38.399763	\N	IMPRIMIBLE	ROBIS	\N	PARA_LA_EDUCADORA/ROBIS/Robbis_PNG/ROBBI	PDF	ROBIS	PARA_LA_EDUCADORA/ROBIS/ROBBIS
47	2020-10-12 18:46:38.401653	d396211e-f8e6-4899-8d41-7655c4813b95	2020-10-12 18:46:38.401673	\N	IMPRIMIBLE	RUBRICAS	\N	PARA_LA_EDUCADORA/RUBRICAS/Rubricas_PNG/RUBRICAS	PDF	RUBRICAS	PARA_LA_EDUCADORA/RUBRICAS/RUBRICAS
48	2020-10-12 18:46:38.406045	b2feaff6-a315-4b5a-86e7-b5d800a48b4a	2020-10-12 18:46:38.406072	\N	IMPRIMIBLE	VOCABULARIO NIVEL 3	\N	ABC/PALABRAS/Vocabulario_PNG/VOCABULARIO_N3	PDF	VOCABULARIO NIVEL 3	ABC/PALABRAS/VOCBULARIO_N3
49	2020-10-12 18:46:38.408425	5569d005-bd3c-46bf-a044-b7d38ab66707	2020-10-12 18:46:38.408446	\N	IMPRIMIBLE	FICHERO SILÁBICO NIVEL 3	\N	ABC/FICHEROS/Ficheros_PNG/FICHEROS_N3	PDF	FICHERO SILÁBICO NIVEL 3	ABC/FICHEROS/FICHERO_N3
50	2020-10-12 18:46:38.412587	436420ca-50cd-483c-981b-72c93fa51b79	2020-10-12 18:46:38.412608	\N	LIBRO	CURSIVA NIVEL 2	\N	CURSIVA/LIBROS/Portadas_PNG/Cursiva_2019_N2_320.png	PDF	CURSIVA NIVEL 2	CURSIVA/LIBROS/CURSIVA_N2_2019.pdf
51	2020-10-12 18:46:38.414604	ee1d83d8-3f12-4db0-bff1-60650bf4f187	2020-10-12 18:46:38.414623	\N	PLANEACIONES	PLANEACIONES CURSIVA NIVEL 2	\N	CURSIVA/PLANEACIONES/Planeaciones_png/Planeacion_cursiva_N2.png	PDF	PLANEACIONES CURSIVA NIVEL 2	CURSIVA/PLANEACIONES/Cursiva_N2.pdf
52	2020-10-12 18:46:38.419101	bd991a3d-0a7e-433d-b5c4-037f1ab6b113	2020-10-12 18:46:38.419118	\N	LIBRO	Esta colección promueve la construcción de las matemáticas mediante el planteamiento de situaciones didácticas y problemas matemáticos cercanos a los pequeños. Con ayuda de las regletas Cuisenaire y o	\N	123/LIBROS/Portadas_PNG/123_2019_N1	PDF	1,2,3 NIVEL 1	123/LIBROS/123_N1_2019
53	2020-10-12 18:46:38.421144	8efaf68d-f7db-4c28-b2ff-17fd3bc9422f	2020-10-12 18:46:38.421168	\N	PLANEACIONES	PLANEACIONES 1,2,3 NIVEL 1	\N	123/PLANEACIONES/2019/2019/PLANEACION_123_N1	PDF	PLANEACIONES 1,2,3 NIVEL 1	123/PLANEACIONES/2019/PLANEACION_N1_2019
54	2020-10-12 18:46:38.425183	e1686383-b6e5-49cb-b81c-74f7d3e39467	2020-10-12 18:46:38.425203	\N	IMPRIMIBLE	VOCABULARIO NIVEL 1	\N	ABC/PALABRAS/VOCBULARIO_PNG/VOCABULARIO_N1	PDF	VOCABULARIO NIVEL 1	ABC/PALABRAS/VOCBULARIO_N1
55	2020-10-12 18:46:38.427083	ca5f58cf-ecc3-4317-9a50-8fe5bf5e4a2e	2020-10-12 18:46:38.427097	\N	IMPRIMIBLE	FICHERO SILÁBICO NIVEL 1	\N	ABC/FICHEROS/Ficheros_PNG/FICHEROS_N1	PDF	FICHERO SILÁBICO NIVEL 1	ABC/FICHEROS/FICHERO_N1
56	2020-10-12 18:46:38.431172	6dbe051e-50af-470e-bdbd-c440bc1dac69	2020-10-12 18:46:38.431198	\N	LIBRO	CURSIVA NIVEL 3	\N	CURSIVA/LIBROS/Portadas_PNG/Cur_N3_2020_320.png	PDF	CURSIVA NIVEL 3	CURSIVA/LIBROS/Cur_n3_2020.pdf
57	2020-10-12 18:46:38.433367	bba6da64-b919-4fe0-95c4-766886456a12	2020-10-12 18:46:38.433383	\N	PLANEACIONES	PLANEACIONES CURSIVA NIVEL 3	\N	CURSIVA/PLANEACIONES/Planeaciones_PNG/Planeacion_cursiva_N3_2020.png	PDF	PLANEACIONES CURSIVA NIVEL 3	CURSIVA/PLANEACIONES/Cursiva_n3_2020.pdf
58	2020-10-12 18:46:38.436953	eaa9ef78-4a9a-40a2-8027-b24c0a800ced	2020-10-12 18:46:38.436971	\N	IMPRIMIBLE	FLASH CARDS	\N	IDOSPEAK/FLASHCARDS/FLASH_CARDS/FLASH_CARDS	PDF	FLASH CARDS	IDOSPEAK/FLASHCARDS/FLASH_CARDS
59	2020-10-12 18:46:38.440383	66f97205-7f46-492c-9d6f-0ff5c509b28d	2020-10-12 18:46:38.440398	\N	LIBRO	ABC NIVEL 2 LIBRO 1	\N	ABC/LIBROS/Libros_PNG/ABC_N2_L1	PDF	ABC NIVEL 2 LIBRO 1	ABC/LIBROS/ABC_N2_L1
60	2020-10-12 18:46:38.442064	d73837fe-ef2c-4cc8-95d0-d25c93f41a9c	2020-10-12 18:46:38.442085	\N	LIBRO	ABC NIVEL 2 LIBRO 2	\N	ABC/LIBROS/Libros_png/ABC_N2_L2	PDF	ABC NIVEL 2 LIBRO 2	ABC/LIBROS/ABC_N2_L2
61	2020-10-12 18:46:38.445189	758626a0-bc32-46c9-81ec-6d29468ebb42	2020-10-12 18:46:38.445209	\N	LIBRO	1,2,3 NIVEL 2	\N	123/LIBROS/Portadas_PNG/123_2020_N2	PDF	1,2,3 NIVEL 2	123/LIBROS/123_N2_2020
62	2020-10-12 18:46:38.447129	12f88e50-741c-48d1-b0ec-ac0a073127bd	2020-10-12 18:46:38.447144	\N	PLANEACIONES	PLANEACIONES 1,2,3 NIVEL 2 UNIDAD 1	\N	123/PLANEACIONES/2020/2020/PLANEACION_123_N2	PDF	PLANEACIONES 1,2,3 NIVEL 2 UNIDAD 1	123/PLANEACIONES/2020/PLANEACION_1_NIVEL_2_20
63	2020-10-12 18:46:38.450246	37f0e6f8-df37-4673-834f-445e4af2974c	2020-10-12 18:46:38.450263	\N	LIBRO	CURSIVA NIVEL 1	\N	CURSIVA/LIBROS/Portadas_PNG/Cursiva_2019_N1_320.png	PDF	CURSIVA NIVEL 1	CURSIVA/LIBROS/CURSIVA_N1_2019.pdf
64	2020-10-12 18:46:38.452475	f25a314d-54c7-4e83-af03-d161e8c2ade4	2020-10-12 18:46:38.452496	\N	PLANEACIONES	PLANEACIONES CURSIVA NIVEL 1	\N	CURSIVA/PLANEACIONES/Planeaciones_png/Planeacion_cursiva_N1.png	PDF	PLANEACIONES CURSIVA NIVEL 1	CURSIVA/PLANEACIONES/Cursiva_N1.pdf
65	2020-10-12 18:46:38.456874	d64d020a-9de0-4cf3-9864-98574f1f01cc	2020-10-12 18:46:38.456894	\N	LIBRO	CARPETA CLAVE NIVEL 3	\N	CARPETA_CLAVE/LIBROS/Portadas_PNG/CARPETA_N3	PDF	CARPETA CLAVE NIVEL 3	CARPETA_CLAVE/LIBROS/CARPETA_N3
66	2020-10-12 18:46:38.459017	8921df1f-6cf3-468b-b1d3-4323fa9a8cb5	2020-10-12 18:46:38.459038	\N	GUIA CLAVE	GUIA CLAVE NIVEL 3	\N	CARPETA_CLAVE/GUIAS/GUIAS_PNG/GUIA_N3	PDF	GUIA CLAVE NIVEL 3	CARPETA_CLAVE/GUIAS/GUIA_CLAVE_N3
67	2020-10-12 18:46:38.463222	3f5d8158-595e-49ca-9198-a94a00b38917	2020-10-12 18:46:38.463242	\N	LIBRO	Esta colección favorece la motricidad fina, la caligrafía y el desarrollo de conexiones neuronales mediante el trazo de letra cursiva. Los libros y la aplicación educativa son el complemento ideal en 	\N	CURSIVA/LIBROS/Portadas_PNG/Cursiva_2015_N1.png	PDF 	CURSIVA NIVEL 1	CURSIVA/LIBROS/CUR_N1_2015
68	2020-10-12 18:46:38.468103	19be9dde-3684-4c1b-837d-d724fa03a16b	2020-10-12 18:46:38.468132	\N	LIBRO	1,2,3 NIVEL 3	\N	123/LIBROS/Portadas_PNG/123_2020_N3	PDF	1,2,3 NIVEL 3	123/LIBROS/123_N3_2020
69	2020-10-12 18:46:38.470439	1bf7da8d-4698-4395-a449-06d7dc3f35a9	2020-10-12 18:46:38.47046	\N	PLANEACIONES	PLANEACIONES 1,2,3 NIVEL 3 UNIDAD 1	\N	123/PLANEACIONES/2020/2020/PLANEACION_123_N3	PDF	PLANEACIONES 1,2,3 NIVEL 3 UNIDAD 1	123/PLANEACIONES/2020/PLANEACION_1_NIVEL_3_20
70	2020-10-12 18:46:38.474948	b4cd2bc7-84c1-499b-8efd-f6e5bd395ce4	2020-10-12 18:46:38.474961	\N	IMPRIMIBLE	PERSONAJES ABC	\N	ABC/PERSONAJES/Personajes_PNG/PERSONAJES	PDF	PERSONAJES ABC	ABC/PERSONAJES/PERSONAJES_ABC
71	2020-10-12 18:46:38.476489	dfd12fd9-eabe-4d0c-a3bb-f9f349821c1f	2020-10-12 18:46:38.476514	\N	GUIA	Guía metodológica para la enseñanza de la lecto-escritura.	\N	ABC/METODOLOGIA/Metodologia_PNG/METODOLOGIA	PDF	Guía metodológica para la enseñanza de la lecto-escritura.	ABC/METODOLOGIA/Guía_metodológica_para_la_enseñanza_de_la_lecto-escritura
72	2020-10-12 18:46:38.477831	fa9b05c8-07f6-4aa2-bbff-4383b5d421dc	2020-10-12 18:46:38.477846	\N	IMPRIMIBLE	Vocales y abecedario Script	\N	ABC/METODOLOGIA/Metodologia_PNG/Vocales_y_abecedario_Script	PDF	Vocales y abecedario Script	ABC/METODOLOGIA/Vocales_y_abecedario_Script
73	2020-10-12 18:46:38.479353	8d5f3e30-ea25-4b30-b255-2549774f04e8	2020-10-12 18:46:38.479369	\N	VIDEOS	TRAZO DE LETRAS EN SCRIPT	\N	ABC/VIDEOS/Videos_PNG/Trazo_de_letra_script	VIDEO	TRAZO DE LETRAS EN SCRIPT	https://www.youtube.com/playlist?list=PL_QRaPtZsvK9ldK-dIijDqczIGTFWvUZT
74	2020-10-12 18:46:38.480693	540a4a40-6477-4872-b729-87ec7e18d46b	2020-10-12 18:46:38.480708	\N	VIDEOS	TRAZO Y SONIDO DE LAS SILABAS	\N	ABC/VIDEOS/Videos_PNG/Trazo_y_sonido	VIDEO	TRAZO Y SONIDO DE LAS SILABAS	https://www.youtube.com/playlist?list=PL_QRaPtZsvK9EdQ6kuaVxsRbsaKaQohUX
75	2020-10-12 18:46:38.483197	e5282ef9-019d-4f80-b849-02926acb66e9	2020-10-12 18:46:38.483212	\N	LIBRO	Esta colección se conforma de libros, aplicaciones e innovadores recursos didácticos para el aprendizaje de la lectura y la escritura que se adapta a las diferentes metodologías alfabetizadoras. Los a	\N	ABC/LIBROS/Libros_PNG/ABC_N1	PDF	ABC NIVEL 1	ABC/LIBROS/ABC_N1
\.


--
-- Name: documento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user01
--

SELECT pg_catalog.setval('public.documento_id_seq', 75, true);


--
-- Data for Name: escuela; Type: TABLE DATA; Schema: public; Owner: user01
--

COPY public.escuela (id, created, guid, modified, nombre) FROM stdin;
1	2020-10-12 18:46:38.486123	edf5ccd7-fa39-43a2-8e6c-109525c1508d	2020-10-12 18:46:38.486134	Instituto Asunción Aguilas
\.


--
-- Data for Name: escuela_grupos; Type: TABLE DATA; Schema: public; Owner: user01
--

COPY public.escuela_grupos (escuela_id, grupos_id) FROM stdin;
\.


--
-- Name: escuela_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user01
--

SELECT pg_catalog.setval('public.escuela_id_seq', 1, true);


--
-- Data for Name: escuela_licencias; Type: TABLE DATA; Schema: public; Owner: user01
--

COPY public.escuela_licencias (escuela_id, licencias_id) FROM stdin;
1	1
1	2
1	3
\.


--
-- Data for Name: escuela_usuarios; Type: TABLE DATA; Schema: public; Owner: user01
--

COPY public.escuela_usuarios (escuela_id, usuarios_id) FROM stdin;
1	1
1	2
1	3
1	4
1	5
1	6
1	7
1	8
1	9
1	10
1	11
1	12
1	13
1	14
1	15
1	16
1	17
1	18
1	19
1	20
1	21
1	22
1	23
1	24
1	25
1	26
1	27
1	28
1	29
1	30
1	31
1	32
1	33
1	34
1	35
1	36
1	37
1	38
1	39
1	40
1	41
1	42
1	43
1	44
1	45
1	46
1	47
1	48
1	49
1	50
1	51
1	52
1	53
1	54
1	55
1	56
1	57
1	58
1	59
1	60
1	61
1	62
1	63
1	64
1	65
1	66
1	67
1	68
1	69
1	70
1	71
1	72
1	73
1	74
1	75
1	76
1	77
1	78
1	79
1	80
1	81
1	82
1	83
1	84
1	85
1	86
1	87
1	88
1	89
1	90
1	91
1	92
1	93
1	94
1	95
1	96
1	97
1	98
1	99
1	100
1	101
1	102
1	103
1	104
1	105
1	106
1	107
1	108
1	109
1	110
1	111
1	112
1	113
1	114
1	115
1	116
1	117
1	118
1	119
1	120
1	121
1	122
1	123
1	124
1	125
1	126
1	127
1	128
1	129
1	130
1	131
1	132
1	133
1	134
1	135
1	136
1	137
1	138
1	139
1	140
1	141
1	142
1	143
1	144
1	145
1	146
1	147
1	148
1	149
1	150
1	151
1	152
1	153
1	154
1	155
1	156
1	157
1	158
1	159
1	160
1	161
1	162
1	163
1	164
1	165
1	166
1	167
1	168
1	169
1	170
1	171
1	172
1	173
1	174
1	175
1	176
1	177
1	178
1	179
1	180
1	181
1	182
1	183
1	184
1	185
1	186
1	187
1	188
1	189
1	190
1	191
1	192
1	193
1	194
1	195
1	196
1	197
1	198
1	199
1	200
1	201
1	202
1	203
1	204
1	205
1	206
1	207
1	208
1	209
1	210
1	211
1	212
1	213
1	214
1	215
1	216
1	217
1	218
1	219
\.


--
-- Data for Name: grupo; Type: TABLE DATA; Schema: public; Owner: user01
--

COPY public.grupo (id, created, guid, modified, nombre, escuela_id) FROM stdin;
\.


--
-- Name: grupo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user01
--

SELECT pg_catalog.setval('public.grupo_id_seq', 1, false);


--
-- Data for Name: licencia; Type: TABLE DATA; Schema: public; Owner: user01
--

COPY public.licencia (id, created, guid, modified, asientos, begin_date, coleccion_nombre, edicion, end_date, escuela_nombre, is_enable, nivel, nombre, coleccion_id, escuela_id) FROM stdin;
1	2020-10-12 18:47:02.488518	21af3648-a6c4-4c06-b29f-d04b62611c53	2020-10-12 18:47:02.635231	0	\N	CURSIVA	2019	\N	Instituto Asunción Aguilas	t	Nivel 1	asuncion-001	25	1
2	2020-10-12 18:47:02.599441	2930328d-6acb-4bfa-b7d5-8850d52d73f6	2020-10-12 18:47:02.635284	0	\N	CURSIVA	2019	\N	Instituto Asunción Aguilas	t	Nivel 2	asuncion-002	18	1
3	2020-10-12 18:47:02.61541	98f5f54d-f9cd-4ffb-bf3d-f1900e73eb42	2020-10-12 18:47:02.635312	0	\N	CURSIVA	2019	\N	Instituto Asunción Aguilas	t	Nivel 3	asuncion-003	9	1
\.


--
-- Name: licencia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user01
--

SELECT pg_catalog.setval('public.licencia_id_seq', 3, true);


--
-- Data for Name: spring_session; Type: TABLE DATA; Schema: public; Owner: user01
--

COPY public.spring_session (primary_id, session_id, creation_time, last_access_time, max_inactive_interval, expiry_time, principal_name) FROM stdin;
\.


--
-- Data for Name: spring_session_attributes; Type: TABLE DATA; Schema: public; Owner: user01
--

COPY public.spring_session_attributes (session_primary_id, attribute_name, attribute_bytes) FROM stdin;
\.


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: user01
--

COPY public.usuario (id, created, guid, modified, email, enabled, grupo, nivel, nombre, password, role, tipo, escuela_id) FROM stdin;
1	2020-10-12 18:46:38.646808	ea94e219-5caf-4519-a1de-f64e102d819c	2020-10-12 18:47:02.200672	abreu.paez.sofia	t	1o A Pre	Nivel 1	ABREU PAEZ SOFÍA	{bcrypt}$2a$10$7mLHvUbzGzU1tXqGPCvqvOdevgw8W3.7tU3rADJUE0aKXzY2l.xCW	USER	ALUMNO	1
2	2020-10-12 18:46:38.755557	8027e6ea-b651-4ae5-a26b-c42e4829782f	2020-10-12 18:47:02.201896	barragan.villamil.ines	t	1o A Pre	Nivel 1	BARRAGÁN VILLAMIL INÉS	{bcrypt}$2a$10$BgjoSFx21cg0koNxoCt8fOJ3xbNW4XhoQUXAmKzD/f82ZidjYddhC	USER	ALUMNO	1
3	2020-10-12 18:46:38.861504	dca757d3-7d97-4522-94f4-38693ab0e53d	2020-10-12 18:47:02.202051	bauer.gallo.alexa	t	1o A Pre	Nivel 1	BAUER GALLO ALEXA	{bcrypt}$2a$10$PXG8RWhLnIvoCFK8wOOf4.4ca9Y50jxyVU1rrKqbMmWASYl.gA1aG	USER	ALUMNO	1
4	2020-10-12 18:46:38.971465	b32aeee0-f39a-4d83-affd-f7800930ade3	2020-10-12 18:47:02.202145	benavides.gomez-coronel.emilia	t	1o A Pre	Nivel 1	BENAVIDES GÓMEZ-CORONEL EMILIA	{bcrypt}$2a$10$GUGzzfmu3KFy9bOuCLM67.i9FD.W4Bez.5SmQ5WqXheTdHwLJVQdK	USER	ALUMNO	1
5	2020-10-12 18:46:39.078586	96dcfb22-622c-4590-93b0-88b2dcd5cc3c	2020-10-12 18:47:02.202235	bravo.lozoya.mariale	t	1o A Pre	Nivel 1	BRAVO LOZOYA MARIALE	{bcrypt}$2a$10$MZhjMeejcYtSjQCuirz2l.i9CIsbP4xhB/o3kgQXowyUnuz/1jEfO	USER	ALUMNO	1
6	2020-10-12 18:46:39.188496	2ec53e7c-b330-4f1c-bc82-e0432d90b272	2020-10-12 18:47:02.202334	curiel.gorozpe.emilio	t	1o A Pre	Nivel 1	CURIEL GOROZPE EMILIO	{bcrypt}$2a$10$PkADw.jGh1nDOs5ZFKxYPe3cBdZ0Ov8uDsX9WIyWUH12gtk/4CCDG	USER	ALUMNO	1
7	2020-10-12 18:46:39.295707	83fa3229-165b-44cf-8126-27ce6b172abe	2020-10-12 18:47:02.202428	de.la.rosa.bonner.paula	t	1o A Pre	Nivel 1	DE LA ROSA BONNER PAULA	{bcrypt}$2a$10$BuBcaEO3zk/7A1.aWG6k9O5pyBHT/g/iBYfzfPbapgUxzvpHN2zuu	USER	ALUMNO	1
8	2020-10-12 18:46:39.428407	bdfedb23-7ea5-4adf-a985-ea9c2bf27cd8	2020-10-12 18:47:02.202523	de.leon.garcia.fernanda	t	1o A Pre	Nivel 1	DE LEÓN GARCÍA FERNANDA	{bcrypt}$2a$10$TwDO3QjG6yrRzUWNmA.pc.9EcvADMBQZiYDdwQKiLvEe7FTMR8Z6u	USER	ALUMNO	1
9	2020-10-12 18:46:39.540768	878ed107-655a-43c8-8eca-40f48d0d30a4	2020-10-12 18:47:02.202614	flores.mendez.gonzalo	t	1o A Pre	Nivel 1	FLORES MÉNDEZ GONZALO	{bcrypt}$2a$10$hoJ4zUQWIEgp3wO8zLFleeRcCCRlYXGblCHmhuX.IKmnlbOwXYRkW	USER	ALUMNO	1
10	2020-10-12 18:46:39.649834	b02562f4-e07d-441b-aa86-ad8e0d828201	2020-10-12 18:47:02.202715	ibanez.villavicencio.santiago	t	1o A Pre	Nivel 1	IBÁÑEZ VILLAVICENCIO SANTIAGO	{bcrypt}$2a$10$rOWDn1RIhGeEzcOOA9Z5Fet6ZteDtYiuo3eFV/Q.pWVlcUWv9nZO.	USER	ALUMNO	1
11	2020-10-12 18:46:39.75717	ba1cfdd9-55c1-45ae-99c6-7c88bdb10791	2020-10-12 18:47:02.202809	lozano.perez.diego	t	1o A Pre	Nivel 1	LOZANO PÉREZ DIEGO	{bcrypt}$2a$10$KSsjGb.rvKxKeKS.5mHa4.6DdV1on1Zb8qY79dbR6gnlf21k3vAaC	USER	ALUMNO	1
12	2020-10-12 18:46:39.865275	8bd3770d-2b8a-4d83-b41a-ad392524b2ad	2020-10-12 18:47:02.202947	morett.domenech.maria.jose	t	1o A Pre	Nivel 1	MORETT DOMENECH MARÍA JOSÉ	{bcrypt}$2a$10$39iGBF7DR6YzCKjdH1vf7OuZNvCONp3aPWPfhwBPtaN2pWAggQGAO	USER	ALUMNO	1
13	2020-10-12 18:46:39.971871	62c9866b-703d-40fb-a9e8-05e53ce81564	2020-10-12 18:47:02.203041	olayo.sierra.pablo	t	1o A Pre	Nivel 1	OLAYO SIERRA PABLO	{bcrypt}$2a$10$NwCa4p5VFVpdcIVH3ZESleodwDUH/afNlNkEevgrb3s3gVd/4xMQ2	USER	ALUMNO	1
14	2020-10-12 18:46:40.079408	b927c452-2c4a-4951-989b-25a6d7720a76	2020-10-12 18:47:02.203131	pietra.santa.abud.leonardo	t	1o A Pre	Nivel 1	PIETRA SANTA ABUD LEONARDO	{bcrypt}$2a$10$nC5Lvx6/KLL09hzQqRKPbeYNHPJJS.eUAl50qfqMWMF.53Jhyt3I2	USER	ALUMNO	1
15	2020-10-12 18:46:40.187458	a5f0b30a-2012-474f-a748-dbe776ac51d4	2020-10-12 18:47:02.203224	sanchez.orlanzzini.maria.ines	t	1o A Pre	Nivel 1	SÁNCHEZ ORLANZZINI MARÍA INÉS	{bcrypt}$2a$10$SEYl.PReKX/FwIbhL35t0.qF3qtPnscphl6YE/DSpF0KBM9XvxyX2	USER	ALUMNO	1
16	2020-10-12 18:46:40.293411	6e6967c9-9a81-4478-b239-a677d8571e2d	2020-10-12 18:47:02.203732	sandoval.martinez.emilio	t	1o A Pre	Nivel 1	SANDOVAL MARTÍNEZ EMILIO	{bcrypt}$2a$10$TW9DWPHd2RYcC/ZYuPwAyekqbsIKN6G9mrFCV2jIES2Qbor.KNjr6	USER	ALUMNO	1
17	2020-10-12 18:46:40.400494	ebd37f24-5b24-485d-84df-03125b2c78e2	2020-10-12 18:47:02.203899	torres.trigueros.martina	t	1o A Pre	Nivel 1	TORRES TRIGUEROS MARTINA	{bcrypt}$2a$10$afJ/t6OszCJBSOXqc2F3zO9WvYo37XKhRbPh9I9tIOOLzS96ceuWm	USER	ALUMNO	1
18	2020-10-12 18:46:40.511454	6420e968-e136-473e-b2fe-dc036ebe3856	2020-10-12 18:47:02.203992	valenzuela.zorrilla.julia	t	1o A Pre	Nivel 1	VALENZUELA ZORRILLA JULIA	{bcrypt}$2a$10$23vzsdG5RXX6KK.wtwHZ1.NHBNmUoIe/YDsW9K30XZrnWnUeXc2z6	USER	ALUMNO	1
19	2020-10-12 18:46:40.618421	a92cdf50-9348-4d3c-9683-8a808f822a53	2020-10-12 18:47:02.204081	valle.diego.-fernandez.jose.miguel	t	1o A Pre	Nivel 1	VALLE DIEGO -FERNÁNDEZ JOSÉ MIGUEL	{bcrypt}$2a$10$jybZHaQRx3vIi2AwMdpCcug4FaBn1XeY5Xm0SR1aHtW4KvC8vBb6W	USER	ALUMNO	1
20	2020-10-12 18:46:40.724499	306437cd-5c0c-4ffa-a11b-197f558230c7	2020-10-12 18:47:02.20417	vallin.de.vecchi.andres	t	1o A Pre	Nivel 1	VALLIN DE VECCHI ANDRÉS	{bcrypt}$2a$10$NEma7JqA/5gD7F8bVUklXOpkRMNUX4QAJNT3MNKiz2vURNCY2GAbi	USER	ALUMNO	1
21	2020-10-12 18:46:40.83215	b7688570-0291-476f-aca8-ba032c33d4aa	2020-10-12 18:47:02.204261	castaneda.amutio.ines	t	1o B Pre	Nivel 1	CASTAÑEDA AMUTIO INÉS	{bcrypt}$2a$10$lW7tQeWLD6j6gXD95iluoeDnc7nCdHdpo/1jJfPnEX2W2et2jc3Se	USER	ALUMNO	1
22	2020-10-12 18:46:40.940478	fbe3f3c9-df53-4495-b51a-c06980b4bef5	2020-10-12 18:47:02.204373	crestani.ordonez.alvaro	t	1o B Pre	Nivel 1	CRESTANI ORDOÑEZ ÁLVARO	{bcrypt}$2a$10$wvAfxomTylkgk2Ia9xSrr.L.nSFTs8yPaDOTGO.ItIsxgI.7egF6i	USER	ALUMNO	1
23	2020-10-12 18:46:41.048648	b54549dd-71d7-40df-8172-eee08129345f	2020-10-12 18:47:02.204483	estudillo.salazar.mila	t	1o B Pre	Nivel 1	ESTUDILLO SALAZAR MILA	{bcrypt}$2a$10$b9kW74mjxcM5jSc769FDruild2FoNF2Cd/xgQApM5YjYrqITsjdJW	USER	ALUMNO	1
24	2020-10-12 18:46:41.15687	08854f4e-d826-41ea-9f3d-5eaa22ea2366	2020-10-12 18:47:02.204573	figueroa.arroyo.sara.maria	t	1o B Pre	Nivel 1	FIGUEROA ARROYO SARA MARÍA	{bcrypt}$2a$10$oYo504oy3EIym6NqWmD66ub/bw1DIAnxA2LT0QYEJGxq.qsAC/T2C	USER	ALUMNO	1
25	2020-10-12 18:46:41.263186	ef22b707-d95c-4a68-bd54-13ccae9e723a	2020-10-12 18:47:02.204663	garcia.novelo.almudena	t	1o B Pre	Nivel 1	GARCÍA NOVELO ALMUDENA	{bcrypt}$2a$10$TYRYIPskg7ihq49PIBFV7.1IwUAU5sVE595KvUiDI/A5OjoLgqg2y	USER	ALUMNO	1
26	2020-10-12 18:46:41.36978	9b725861-c31e-47b3-9b5c-3f8c13359f61	2020-10-12 18:47:02.204752	guevara.aguilar.jeronimo	t	1o B Pre	Nivel 1	GUEVARA AGUILAR JERÓNIMO	{bcrypt}$2a$10$HevKomTo792ufWQZ0r.euO8ka7CRnUICtp51VtJcwMf7g.HyzcaKy	USER	ALUMNO	1
27	2020-10-12 18:46:41.476179	52232483-2199-42a3-a7d6-1be47ba46432	2020-10-12 18:47:02.204839	habib.cervantes.regina	t	1o B Pre	Nivel 1	HABIB CERVANTES REGINA	{bcrypt}$2a$10$9zZ1/u3aYBLWLHph7wrr9eGpk0ya43tCk1RpNLNJgh/NBLtDXftqe	USER	ALUMNO	1
28	2020-10-12 18:46:41.58667	893897a1-fd44-43c4-a9db-e69834c51b22	2020-10-12 18:47:02.204947	herrera.mina.fadia	t	1o B Pre	Nivel 1	HERRERA MINA FADIA	{bcrypt}$2a$10$UQCqX/hkdJ.LPeIpXUeIMuhPW.opKpU/2X.OrAUuKaCZ5mfEqYvB.	USER	ALUMNO	1
29	2020-10-12 18:46:41.692152	93b4f579-91ce-4cc9-821b-ad2ceb17d54a	2020-10-12 18:47:02.205033	islas.rodriguez.dominica	t	1o B Pre	Nivel 1	ISLAS RODRIGUEZ DOMINICA	{bcrypt}$2a$10$6hjRbmX4h2lccjwc5FQaCeMWaL25ni80s9/eRgu6Ryje1.cLiToiO	USER	ALUMNO	1
30	2020-10-12 18:46:41.798283	07d9eb14-3216-4121-a842-e994067d293b	2020-10-12 18:47:02.205128	long.ramirez.alfonso	t	1o B Pre	Nivel 1	LONG RAMÍREZ ALFONSO	{bcrypt}$2a$10$r1VX78zeU.NzGHrNnoUVUOI5TMzxAsHmrSU95.2s6P7c3SG5ncUxi	USER	ALUMNO	1
31	2020-10-12 18:46:41.904382	5e12e8fe-2d27-41fc-8e7b-3a871af4e506	2020-10-12 18:47:02.205216	monroy.aguerrebere.santiago	t	1o B Pre	Nivel 1	MONROY AGUERREBERE SANTIAGO	{bcrypt}$2a$10$TOFW2IuprON92lbKEeXIr.Oupx0af17jFUm6nU4XkSGzGPJHWCjQy	USER	ALUMNO	1
32	2020-10-12 18:46:42.013481	f643b35a-885f-4c6d-b23e-1202942c7c8e	2020-10-12 18:47:02.205301	moran.zurutuza.bruno	t	1o B Pre	Nivel 1	MORÁN ZURUTUZA BRUNO	{bcrypt}$2a$10$.zUL9iEIwTYKEUAMJcoNYOcmJbAoSSVaUZ1PwGj7rIHWld5ihZE2y	USER	ALUMNO	1
33	2020-10-12 18:46:42.122495	4320814e-e43e-4ac3-9663-9df6a279618e	2020-10-12 18:47:02.205374	najera.villasenor.ines	t	1o B Pre	Nivel 1	NÁJERA VILLASEÑOR INÉS	{bcrypt}$2a$10$MvKnHZb3goQsc97F.vuLvOLk/vXHeybTfvvPn9jQz2xBVpmPI9Hy6	USER	ALUMNO	1
34	2020-10-12 18:46:42.236007	e4ed974c-5714-435b-a58a-fa819f185a13	2020-10-12 18:47:02.205452	ojeda.paz.luciana	t	1o B Pre	Nivel 1	OJEDA PAZ LUCIANA	{bcrypt}$2a$10$ss.bCuawJsA3oppk0LM5l.2dUN8Zx4N2HVAqpUKaE2adyQQWLRGfS	USER	ALUMNO	1
35	2020-10-12 18:46:42.344424	7122977d-9d05-4ae3-87a0-b63cd674a434	2020-10-12 18:47:02.205532	oria.y.kiehnle.joaquin	t	1o B Pre	Nivel 1	ORIA Y KIEHNLE JOAQUÍN	{bcrypt}$2a$10$IU75DGSmsfI2wxSfvnotOuHw4c4Yv3meEWrao3zBAX.1ifMpyl1f2	USER	ALUMNO	1
36	2020-10-12 18:46:42.452933	cc18d831-81cb-44a7-a0ca-5c41566561b9	2020-10-12 18:47:02.205586	pohls.colores.jeronimo	t	1o B Pre	Nivel 1	POHLS COLORES JERÓNIMO	{bcrypt}$2a$10$H8RF4hRyRkxhqn83c2hXqeq5g3wvxil4Zvl5xW1lGueURw9c114/m	USER	ALUMNO	1
37	2020-10-12 18:46:42.562318	6bfeb065-baab-42e6-9c06-43cf1c9909a1	2020-10-12 18:47:02.205637	romero.mejia.mariana	t	1o B Pre	Nivel 1	ROMERO MEJÍA MARIANA	{bcrypt}$2a$10$Z7ggh0mzRXU4PD9U4J.Qvu99uWT./tVXAyebwdFhACUSt6tR6lABG	USER	ALUMNO	1
38	2020-10-12 18:46:42.67006	3e7c0a9b-cb9d-4808-91f4-c0b9bdb3aaad	2020-10-12 18:47:02.205688	ruiz.diaz.regina	t	1o B Pre	Nivel 1	RUÍZ DÍAZ REGINA	{bcrypt}$2a$10$RQDY0RQCWhHvdZGwl5uGwuAQ7HRYNWv6zOQlYVXFKQFIuIaxFP.Ui	USER	ALUMNO	1
39	2020-10-12 18:46:42.775448	2c231e1a-c656-4fc3-87ae-434a9a8b1ae0	2020-10-12 18:47:02.205739	senosiain.lomelin.pablo	t	1o B Pre	Nivel 1	SENOSIAIN LOMELÍN PABLO	{bcrypt}$2a$10$qnmmYykorGc.hyJghvTPJulgLczsio..ZsM4iLpG4mZfImRcIYiUG	USER	ALUMNO	1
40	2020-10-12 18:46:42.882013	f763914e-b0c9-4f01-8b3a-706971357b47	2020-10-12 18:47:02.205789	boneta.reyes.julia	t	1o C Pre	Nivel 1	BONETA REYES JULIA	{bcrypt}$2a$10$LUTgDmXbKsS94ebvQqMP8u.Ae64Uo/E0or/t7jtptypbXlfn5jvQG	USER	ALUMNO	1
41	2020-10-12 18:46:42.989417	b3ce2426-5069-43cf-aa10-4beb3bf08d3d	2020-10-12 18:47:02.20584	brassel.sosa.victoria	t	1o C Pre	Nivel 1	BRASSEL SOSA VICTORIA	{bcrypt}$2a$10$jbDyhDQ/qMbxGFWLzA4Ooep6iRnrzrg1BUpixvtiGk.VNWSIOjjqG	USER	ALUMNO	1
42	2020-10-12 18:46:43.096078	c00a64a5-0aa9-42c0-88ca-7600903616ec	2020-10-12 18:47:02.205906	calderon.guerra.natalia	t	1o C Pre	Nivel 1	CALDERÓN GUERRA NATALIA	{bcrypt}$2a$10$D6Pg5Go/2I6IkO1xjQ6NiOv8CB5vzCk5bRUBemN7GeFc3JsgkUHEO	USER	ALUMNO	1
43	2020-10-12 18:46:43.204282	2691aebb-a101-47cd-91ab-c679180274c5	2020-10-12 18:47:02.206006	de.velasco.pheres.pia	t	1o C Pre	Nivel 1	DE VELASCO PHERES PÍA	{bcrypt}$2a$10$XpTgpT6oe1qeduPksSJOuevNo8gAJ1Cej605cRhR91yOrfJXVWXgS	USER	ALUMNO	1
44	2020-10-12 18:46:43.314267	566e042f-224e-4c9b-8978-49d2a045958b	2020-10-12 18:47:02.206091	etchegaray.castro.julia	t	1o C Pre	Nivel 1	ETCHEGARAY CASTRO JULIA	{bcrypt}$2a$10$owfUcC2cHVxj2XrzK8Iflu4LwM3eWTEddTBObPWzBeOaDoSqXij5m	USER	ALUMNO	1
45	2020-10-12 18:46:43.419997	89b0cccf-4463-47b8-be7b-f2a86254577e	2020-10-12 18:47:02.206176	franco.delgado.damiana	t	1o C Pre	Nivel 1	FRANCO DELGADO DAMIANA	{bcrypt}$2a$10$MFJIUN97AehyD80DWyRiEetxdDT2sWDdt8yXp.TY84lvVwA6/riQ2	USER	ALUMNO	1
46	2020-10-12 18:46:43.528712	e5b4b002-92a6-41c4-b636-991f56e39362	2020-10-12 18:47:02.206262	galeana.camacho.emilio	t	1o C Pre	Nivel 1	GALEANA CAMACHO EMILIO	{bcrypt}$2a$10$6QqEfdMMeRfb3GtaBrkK.evTu8YISyj6Bn7dcstSohDC3emvkOroG	USER	ALUMNO	1
47	2020-10-12 18:46:43.634949	b6800512-ee9c-4429-951e-77e786be020d	2020-10-12 18:47:02.206348	garcia.ramos.miranda	t	1o C Pre	Nivel 1	GARCÍA RAMOS MIRANDA	{bcrypt}$2a$10$/VBlJ8YEDGFjC7TKSLnNSuszbC8oPirvLY7xUcrGZsAgtZG86S4m2	USER	ALUMNO	1
48	2020-10-12 18:46:43.740496	d84501af-3a15-4edc-8766-6eaac53ffa79	2020-10-12 18:47:02.206429	groenewold.tolsa.juan.pablo	t	1o C Pre	Nivel 1	GROENEWOLD TOLSÁ JUAN PABLO	{bcrypt}$2a$10$FwANYijmHv.wtYSnJpYtLevFn0LF5zmxGirDPJnpsnmz5pLMnpwLG	USER	ALUMNO	1
49	2020-10-12 18:46:43.846042	2ba6f15d-c002-49db-b470-d620c597b940	2020-10-12 18:47:02.206511	guzman.desdier.elena	t	1o C Pre	Nivel 1	GUZMÁN DESDIER ELENA	{bcrypt}$2a$10$CNHzXvpoyncsrn3Y4BsrxeVYSN14LdXxScj86by9arJyqWaiwWYwy	USER	ALUMNO	1
50	2020-10-12 18:46:43.9516	4116599a-c5df-4066-9d78-bf5232eba988	2020-10-12 18:47:02.206589	martel.maldonado.sebastian	t	1o C Pre	Nivel 1	MARTEL MALDONADO SEBASTIÁN	{bcrypt}$2a$10$yjK5WojZGu5l.QH8Bbscdeme2rdJ8QNGLUbj12.OXpkQHYC/6LQj2	USER	ALUMNO	1
51	2020-10-12 18:46:44.055963	92ab8aec-9e55-439c-af43-9d0ad2f9d360	2020-10-12 18:47:02.206668	martinez.huerta.mikel	t	1o C Pre	Nivel 1	MARTÍNEZ HUERTA MIKEL	{bcrypt}$2a$10$YFtL9LY9o64e8FhLzQNbveb3iqaZGtz8.dvkdF8xfjW5Bg9AGVYW6	USER	ALUMNO	1
52	2020-10-12 18:46:44.163131	1596e7f1-8068-42d0-8b56-99ad1105e8ca	2020-10-12 18:47:02.206751	nicolau.herrera.julia	t	1o C Pre	Nivel 1	NICOLAU HERRERA JULIA	{bcrypt}$2a$10$q0520MCB7XxmwdGBW.2vHef.eDt5g828/u81mfhVPa69sdKw7wPPy	USER	ALUMNO	1
53	2020-10-12 18:46:44.274226	3fa77afd-0769-469e-b0a2-fa44721ce1fb	2020-10-12 18:47:02.206885	ortega.osoyo.fernando	t	1o C Pre	Nivel 1	ORTEGA OSOYO FERNANDO	{bcrypt}$2a$10$8dTGOxnKd41jfUbruq0dee7gbHkEMs/1tMHgr1sEyfhQ3HKl8pMHa	USER	ALUMNO	1
54	2020-10-12 18:46:44.380715	7f92cb52-cb9e-4116-a3b9-290528f76a78	2020-10-12 18:47:02.206978	puente.ceron.pablo	t	1o C Pre	Nivel 1	PUENTE CERÓN PABLO	{bcrypt}$2a$10$BoWdRuhfLeYZOvIB9y/fiuzJScadEzEqUxEyzygcSumzIZ21EmNOe	USER	ALUMNO	1
55	2020-10-12 18:46:44.489346	f96d0ecb-722e-4c2a-9bd0-6f47981c4478	2020-10-12 18:47:02.207064	reygadas.diaz.maximiliano	t	1o C Pre	Nivel 1	REYGADAS DÍAZ MAXIMILIANO	{bcrypt}$2a$10$zF3Yrur3mgUTM9bc3Mwy4.hKuK1N932Ml0WK34XDan2rHut.s0oMa	USER	ALUMNO	1
56	2020-10-12 18:46:44.597017	e834a180-f5ab-4d33-afec-ef5fcd5a506a	2020-10-12 18:47:02.20715	rios.morales.valentina	t	1o C Pre	Nivel 1	RÍOS MORALES VALENTINA	{bcrypt}$2a$10$G2DiikN/hnOgLRyCXWRpYu8XRI6eU81wvHyCLRwdDfs5ts2Rgl2u2	USER	ALUMNO	1
57	2020-10-12 18:46:44.702891	f7632c48-15b6-4883-a5e6-4dc763b127be	2020-10-12 18:47:02.207236	romero.gilbert.macarena	t	1o C Pre	Nivel 1	ROMERO GILBERT MACARENA	{bcrypt}$2a$10$BGqs96T2axjWz5bSwlVLfOkf/lSfCzv7zFUd6itxDTwniwJhihsTK	USER	ALUMNO	1
58	2020-10-12 18:46:44.808908	8e323023-02e1-42fb-8785-dfc6299c4cc3	2020-10-12 18:47:02.207316	zuniga.galvan.bruno	t	1o C Pre	Nivel 1	ZUÑIGA GALVÁN BRUNO	{bcrypt}$2a$10$g4Aaco4CDOaL1INlxfj2ZudqvATG348D9tDL35BcHPbGDgb66vqg2	USER	ALUMNO	1
59	2020-10-12 18:46:44.915403	920021e3-28a5-4d82-b595-2490aa2b6c64	2020-10-12 18:47:02.207403	arroyo.fernandez.mateo	t	2o A Pre	Nivel 2	ARROYO FERNÁNDEZ MATEO	{bcrypt}$2a$10$K0p7MfY3x/vPZ8yd2SJOn.e8N0VBui3PqVdc2f54lUTcOH.09MYV.	USER	ALUMNO	1
60	2020-10-12 18:46:45.020692	18f559be-28f2-4e48-bd20-6f9ad753c99c	2020-10-12 18:47:02.207493	bejar.munoz.andrea	t	2o A Pre	Nivel 2	BEJAR MUÑOZ ANDREA	{bcrypt}$2a$10$svMAvgK7xx9dz5pZ6IIbUeBQQSCiz1R3Ayh3Wke80YcnYdkDkvrHW	USER	ALUMNO	1
61	2020-10-12 18:46:45.127777	67e66589-9622-43ac-a80f-f64f04761581	2020-10-12 18:47:02.207572	boleaga.luna.mariana	t	2o A Pre	Nivel 2	BOLEAGA LUNA MARIANA	{bcrypt}$2a$10$OYxVQWBM0C1hZDFMJ/cLPOc0eqeNG9pMqLJO.vjpuDAc5PjfDkAv2	USER	ALUMNO	1
62	2020-10-12 18:46:45.237679	692cb11f-00d4-443a-ad85-d51386e1ec63	2020-10-12 18:47:02.207651	campos.lemus.rodrigo.de.borja	t	2o A Pre	Nivel 2	CAMPOS LEMUS RODRIGO DE BORJA	{bcrypt}$2a$10$XJ2e.Y1l8YTKaAV9xSJQPeN9XOuwBo90Ll8qlHm4FGxSJ86KUh5fm	USER	ALUMNO	1
63	2020-10-12 18:46:45.34368	32e0c600-8f62-4cf8-8d18-e11c93d2bf9d	2020-10-12 18:47:02.207737	ceron.oviedo.jordi	t	2o A Pre	Nivel 2	CERÓN OVIEDO JORDI	{bcrypt}$2a$10$GjAkCDDdq3hpSu47O9WbY.vP0PNS.v2yHUDeObgm4Jc6Jb5vE.KkW	USER	ALUMNO	1
64	2020-10-12 18:46:45.449407	9f0fddf3-f677-4c9b-bbf2-c88b3dc599bb	2020-10-12 18:47:02.207853	diaz.sanchez.maria.emilia	t	2o A Pre	Nivel 2	DÍAZ SANCHEZ MARÍA EMILIA	{bcrypt}$2a$10$GqzRO37HmaEHYURvdEdi/ePrvXphLwL6oUvELgtR1ombppnG6Wjru	USER	ALUMNO	1
65	2020-10-12 18:46:45.554958	fe9a3b14-39a6-4d0c-9ab5-cd986d6a0c5b	2020-10-12 18:47:02.207946	dosal.nava.javier	t	2o A Pre	Nivel 2	DOSAL NAVA JAVIER	{bcrypt}$2a$10$fSHRUg9Ed0.0ctMS4m6Xpe7cHkdt38T1630LnVo10qdd9sVOEBjBy	USER	ALUMNO	1
66	2020-10-12 18:46:45.664698	f839ffdb-2673-4677-bd0e-1129a32a795e	2020-10-12 18:47:02.208025	fabris.cano.valentina	t	2o A Pre	Nivel 2	FABRIS CANO VALENTINA	{bcrypt}$2a$10$58mSUZSTaQbpmIMDheaSSO0qjsHP.nXPcq4T4AY.I8pr2lFk5wEBi	USER	ALUMNO	1
67	2020-10-12 18:46:45.769849	61546c54-c0d0-4335-8aec-4f2f9a46fcb6	2020-10-12 18:47:02.208101	flores.fernandez.rodrigo	t	2o A Pre	Nivel 2	FLORES FERNÁNDEZ RODRIGO	{bcrypt}$2a$10$Rer7aUK0qOhDaX8.eY748uHWDwL6PvSv3zjM0MCG9dmeG71ERBjhu	USER	ALUMNO	1
68	2020-10-12 18:46:45.876724	5c695c73-d4e6-43d6-97fb-5850b208b122	2020-10-12 18:47:02.208173	gomez.chico.montano.fernando	t	2o A Pre	Nivel 2	GÓMEZ CHICO MONTAÑO FERNANDO	{bcrypt}$2a$10$i1uTLl5hayTsDRqwqKRZD.CrLnJJsauE2j1WgHexxDxnmcs9jwhH.	USER	ALUMNO	1
69	2020-10-12 18:46:45.984021	12903d38-809d-43c5-ab8d-1edc3a58fa3c	2020-10-12 18:47:02.208252	habib.cervantes.romina	t	2o A Pre	Nivel 2	HABIB CERVANTES ROMINA	{bcrypt}$2a$10$co.BBM7LbpqgpX.19fAw1uyhU50PtAtgFvO/gLMcpugfzdC66RgM2	USER	ALUMNO	1
70	2020-10-12 18:46:46.090179	38206096-e01e-4870-9646-27f5f81956ad	2020-10-12 18:47:02.208324	hernandez.vargas.romina	t	2o A Pre	Nivel 2	HERNÁNDEZ VARGAS ROMINA	{bcrypt}$2a$10$vrarfO0U6DU5huFkkondqu3HmbXNzIiVGXUN/4oiUiTOZn6eB.6p2	USER	ALUMNO	1
71	2020-10-12 18:46:46.198216	8a068c3c-d378-47a8-866e-8e230471f833	2020-10-12 18:47:02.208395	larre.del.paso.sebastian	t	2o A Pre	Nivel 2	LARRE DEL PASO SEBASTIÁN	{bcrypt}$2a$10$znBpA.qm2jO2JlIPr.0SIO4Tm.ZjvM2VPestQZEQwY9H7FSiK7Vyy	USER	ALUMNO	1
72	2020-10-12 18:46:46.305159	f2ddf8c7-39cf-47aa-ab45-5584be916d01	2020-10-12 18:47:02.208468	llano.guzman.mila	t	2o A Pre	Nivel 2	LLANO GUZMÁN MILA	{bcrypt}$2a$10$aSXzKQlekBOpprixN99E2OWYViF0vVAwVFveWARgUG.BS2uGnz4vi	USER	ALUMNO	1
73	2020-10-12 18:46:46.412555	2c6f8cb2-7b94-4038-8b38-2e883d3abe8f	2020-10-12 18:47:02.208544	marrufo.gonzalez.emilio	t	2o A Pre	Nivel 2	MARRUFO GONZÁLEZ EMILIO	{bcrypt}$2a$10$T5oYgIZKB3xTLTt/h5RPcuyWpoqt5B6Cw3RfIfgA3jQSSYbl95VoS	USER	ALUMNO	1
74	2020-10-12 18:46:46.521454	a9dade27-c022-4f81-ab88-87b9767360ab	2020-10-12 18:47:02.208681	martinez.del.rio.borbolla.lorenzo	t	2o A Pre	Nivel 2	MARTÍNEZ DEL RÍO BORBOLLA LORENZO	{bcrypt}$2a$10$jIifDsAYc5nythfpaBp8L.9Q052T0S/5qgOJXU.C3XutPKR0CBaJq	USER	ALUMNO	1
75	2020-10-12 18:46:46.627978	eb26b951-c12a-41d4-ae2a-e0577629e130	2020-10-12 18:47:02.208752	martinez.gonzalez.paula.renata	t	2o A Pre	Nivel 2	MARTÍNEZ GONZÁLEZ PAULA RENATA	{bcrypt}$2a$10$l36OJZu2XKY3cHOrLkd8Ne.oXeMyJaTGTGaBmVrtBPT7aRORTIhQ2	USER	ALUMNO	1
76	2020-10-12 18:46:46.734603	b605d133-a114-41b3-9349-e08223c0b37f	2020-10-12 18:47:02.208832	moreno.guizar.constanza	t	2o A Pre	Nivel 2	MORENO GUIZAR CONSTANZA	{bcrypt}$2a$10$zfehyEXoUTzOc99hBiMrIuGicjdE11KIN4CttMHye53qMPm8Efz1a	USER	ALUMNO	1
77	2020-10-12 18:46:46.840075	53c7f51b-334b-4db4-821a-78d1fc186bfd	2020-10-12 18:47:02.208902	nicolau.herrera.inaki	t	2o A Pre	Nivel 2	NICOLAU HERRERA IÑAKI	{bcrypt}$2a$10$HWR/MS38oQM0GLhRBFbA1OVwV5BTPc4XHcTFCMhVMR5p9d38.Z13m	USER	ALUMNO	1
78	2020-10-12 18:46:46.946802	7525d305-d836-4de4-ac69-9d4748481049	2020-10-12 18:47:02.208968	omana.tattersfield.elena	t	2o A Pre	Nivel 2	OMAÑA TATTERSFIELD ELENA	{bcrypt}$2a$10$QOAXOPtVaXLRUoVb9dZf/um4JC0Cg7VcITRIyVp4uZ4L9fPSH.JSq	USER	ALUMNO	1
79	2020-10-12 18:46:47.051606	2a47fd3e-2280-4674-8cee-1b784f400d3b	2020-10-12 18:47:02.209032	romano.diaz.alexa	t	2o A Pre	Nivel 2	ROMANO DÍAZ ALEXA	{bcrypt}$2a$10$y5JU6CDla13/e8jOETSo/ebwgEFRQWUlJWgcwVP7mfBEck8J65fEG	USER	ALUMNO	1
80	2020-10-12 18:46:47.16082	ff0de4f0-47a6-4cd7-a4e9-bd633a1f2124	2020-10-12 18:47:02.209095	rovelo.cornejo.hector.miguel	t	2o A Pre	Nivel 2	ROVELO CORNEJO HÉCTOR MIGUEL	{bcrypt}$2a$10$a/hDJYe73mJPKB6pT.EPK.eTbqYiFmzPOXO/vpRRASg.yaTUqLxXO	USER	ALUMNO	1
81	2020-10-12 18:46:47.266729	469d68a0-0aa9-4069-b7d3-d37c160fd5ed	2020-10-12 18:47:02.209157	saenz.amado.pablo	t	2o A Pre	Nivel 2	SÁENZ AMADO PABLO	{bcrypt}$2a$10$yD3NQTPB7PpIqenX6vkhzuO71iJx9doxPp5Rhtuf30a8cyw7Zirfa	USER	ALUMNO	1
82	2020-10-12 18:46:47.371868	06b400e5-8737-4029-b724-229da569e660	2020-10-12 18:47:02.209221	tostado.aleman.maria	t	2o A Pre	Nivel 2	TOSTADO ALEMÁN MARÍA	{bcrypt}$2a$10$jEzU2sGxzrnyjVJ4y1jmmO4pNEDjdZT8vTSJowHjiIAWNE6czRp06	USER	ALUMNO	1
83	2020-10-12 18:46:47.479508	1630aed2-3866-48db-87af-324742703630	2020-10-12 18:47:02.209287	urruchua.barri.arturo	t	2o A Pre	Nivel 2	URRUCHUA BARRI ARTURO	{bcrypt}$2a$10$0SNg9LK/3Dy.UCkXb2kXMuof836IZBUBYUC1/SrkECMynpFQUSPG6	USER	ALUMNO	1
84	2020-10-12 18:46:47.588442	4be6ac5d-074c-4008-844d-a1b6e001ee49	2020-10-12 18:47:02.209374	yunes.alonso.tomas	t	2o A Pre	Nivel 2	YUNES ALONSO TOMÁS	{bcrypt}$2a$10$cC.cT52uv20c3thl41FUU.vJBed8cEC6stiR2Mslo7znaMuecHug2	USER	ALUMNO	1
85	2020-10-12 18:46:47.69569	47acc3f8-5872-454f-98ce-396fd9bbd486	2020-10-12 18:47:02.209442	fabris.cano.jorge	t	2o A Pre	Nivel 2	FABRIS CANO JORGE	{bcrypt}$2a$10$kXmDw82rX4E8zz/vb0R.8OPGUtd43trrWwCEaeEXMSAxpY3noGmbq	USER	ALUMNO	1
86	2020-10-12 18:46:47.801452	6b1e28a6-cef0-4496-8a46-e4f899fe9a8c	2020-10-12 18:47:02.209507	adame.almazan.rodrigo	t	2o B Pre	Nivel 2	ADAME ALMAZÁN RODRIGO	{bcrypt}$2a$10$i/UjXTFbeV9WvQLhJk0h4OgQsRujge5mIIf/4tbMagkJ5T2rGjCcG	USER	ALUMNO	1
87	2020-10-12 18:46:47.909558	01cbac2b-a2ae-42ac-b9dd-96f5d584c087	2020-10-12 18:47:02.209607	ambris.cantu.lucas	t	2o B Pre	Nivel 2	AMBRÍS CANTÚ LUCAS	{bcrypt}$2a$10$NZjU.6EGieDLFxkdg92sCOeGLd1nJrmXs/IwFz64r/zZp0jph2Joy	USER	ALUMNO	1
88	2020-10-12 18:46:48.015017	ec956947-b32b-44b2-9894-fdc05c2f1042	2020-10-12 18:47:02.209674	armas.cortes.diana.lucia	t	2o B Pre	Nivel 2	ARMAS CÓRTES DIANA LUCÍA	{bcrypt}$2a$10$Kw8A/MsRvFPC/ogmenU5W.039IYuRYqznGHMoeXOjSESLEb4I9wEy	USER	ALUMNO	1
89	2020-10-12 18:46:48.122781	4f533090-2c6e-4dcf-bae5-8e85ef011ddd	2020-10-12 18:47:02.209738	canseco.torres.camila	t	2o B Pre	Nivel 2	CANSECO TORRES CAMILA	{bcrypt}$2a$10$cwPX5x9xFAEOQ8BVsXxUr.0ItYHadUmjooHRMhQsgUTYD1Z8EiWVW	USER	ALUMNO	1
90	2020-10-12 18:46:48.233986	f4afcf9f-eb65-4e77-847a-a452eab4eddd	2020-10-12 18:47:02.209804	cobian.martinez.bernardo	t	2o B Pre	Nivel 2	COBIAN MARTÍNEZ BERNARDO	{bcrypt}$2a$10$dxBUnPX0Kl1SbXG6U3HPveX1aLjBor44mZHekxFwRfzzwvU5goG6a	USER	ALUMNO	1
91	2020-10-12 18:46:48.339228	d9d7992f-3950-4f00-9d80-8b070a13c393	2020-10-12 18:47:02.209885	contreras.aguirre.rosa.victoria	t	2o B Pre	Nivel 2	CONTRERAS AGUIRRE ROSA VICTORIA	{bcrypt}$2a$10$Nna0wA3CoyBhcCTRYm7st.tHSdW8BAs83CVmo1VSLJaYqqpI.Y7wC	USER	ALUMNO	1
92	2020-10-12 18:46:48.458228	ba0598c0-25a0-4ecc-85b0-edfb3de2e1dd	2020-10-12 18:47:02.209953	czaplewski.zama.katya	t	2o B Pre	Nivel 2	CZAPLEWSKI ZAMA KATYA	{bcrypt}$2a$10$imwIZ.WT5ujS08jRNYIH2OdrLhZnnawLOGAThZvHjUq/l6j2AN.o2	USER	ALUMNO	1
93	2020-10-12 18:46:48.562488	10734798-d409-49aa-ac2d-4c8f6aabbbc8	2020-10-12 18:47:02.210019	enriquez.vargas.julia	t	2o B Pre	Nivel 2	ENRÍQUEZ VARGAS JULIA	{bcrypt}$2a$10$fVnkmPE1cLMAuvZlUlEUNOyvIKVRZrYh/YnE4Y4Od2ovrhu3S94q6	USER	ALUMNO	1
94	2020-10-12 18:46:48.668154	144a2d75-028c-4f14-9a3f-f0f75a5b5fc2	2020-10-12 18:47:02.210087	ferez.vergara.jose	t	2o B Pre	Nivel 2	FÉREZ VERGARA JOSÉ	{bcrypt}$2a$10$QH142Tam4pmwP5EP.vWZaOsDmj3CE21W2UA4xlC3tLlGY41cOg53G	USER	ALUMNO	1
95	2020-10-12 18:46:48.776513	447e1e96-7a61-4c1f-828f-8c5c56931492	2020-10-12 18:47:02.210155	flores.vera.sebastian	t	2o B Pre	Nivel 2	FLORES VERA SEBASTIÁN	{bcrypt}$2a$10$KdUpNnPaADygb92k9Jp5oejULk/5xfnqBDS6Wy2BQTTEGdCo1f0Ua	USER	ALUMNO	1
96	2020-10-12 18:46:48.884558	8ea4eccc-088c-41b5-af13-c5d832b232c2	2020-10-12 18:47:02.210222	fuentes.razo.joel.dario	t	2o B Pre	Nivel 2	FUENTES RAZO JOEL DARÍO	{bcrypt}$2a$10$95JNqaNTlq9HNRfTPWtNp.e1I2Zu.Z7DUg1ZFrHl2bw2QnOrwBl2S	USER	ALUMNO	1
97	2020-10-12 18:46:48.991895	19f03b2a-c326-47c3-9198-ba68eeaa7d5f	2020-10-12 18:47:02.21029	garcia.pelayo.fernandez.del.campo.pedro	t	2o B Pre	Nivel 2	GARCÍA PELAYO FERNANDEZ DEL CAMPO PEDRO	{bcrypt}$2a$10$l6dYLGkJoHpGbQ2sMjWQ1Oyf4w48sTuONfwI80Iy3vNnRrWQiRgQm	USER	ALUMNO	1
98	2020-10-12 18:46:49.100443	8277660b-58a4-4d77-bb65-7bf7a4f6b9c8	2020-10-12 18:47:02.210359	gomez.diaz.diego	t	2o B Pre	Nivel 2	GÓMEZ DÍAZ DIEGO	{bcrypt}$2a$10$SSjcOrnVtS4rb/L8/N9IZeFd6sO55fR/Bl4wkATkibDf.0OY2Tgd6	USER	ALUMNO	1
99	2020-10-12 18:46:49.207858	6ae52889-7580-4826-9f87-6c8f3dd41b34	2020-10-12 18:47:02.21042	hernandez.murray.emiliano	t	2o B Pre	Nivel 2	HERNÁNDEZ MURRAY EMILIANO	{bcrypt}$2a$10$Q3hTQTuF.x2rcVUJK6hlJueE1L09Y.wBYklCesbUbqdiy.QyhGhz6	USER	ALUMNO	1
100	2020-10-12 18:46:49.315264	5bceaeaa-d02b-4c88-b316-5a9d766463c0	2020-10-12 18:47:02.210482	herrera.nazar.ximena	t	2o B Pre	Nivel 2	HERRERA NAZAR XIMENA	{bcrypt}$2a$10$ad/2ZmR7Xy63kgOGUoeoE.tELR4tnJQMpT5DHF5E8.6mdGcL7r8LC	USER	ALUMNO	1
101	2020-10-12 18:46:49.420183	641df630-4386-4fad-aa3d-7426e534dd79	2020-10-12 18:47:02.210543	ibarra.huerta.valentina	t	2o B Pre	Nivel 2	IBARRA HUERTA VALENTINA	{bcrypt}$2a$10$1nt9x/Z5rDdvxNMb5nxI7ei57oiZcObSsPuYE1.9ipY8fclYmlndm	USER	ALUMNO	1
102	2020-10-12 18:46:49.525731	056b6dc5-4fa0-41da-bc69-e96228b5c900	2020-10-12 18:47:02.210604	lopez.kalis.fernanda	t	2o B Pre	Nivel 2	LÓPEZ KALIS FERNANDA	{bcrypt}$2a$10$jyhBHJmhk1SRxACTZLVIdekQEZ9fQ0QNnIHmgYZYZoKu9xUivhtgK	USER	ALUMNO	1
103	2020-10-12 18:46:49.634714	27b8445f-542a-4b96-a226-d7498f39b1a5	2020-10-12 18:47:02.210663	monroy.fregoso.elisa	t	2o B Pre	Nivel 2	MONROY FREGOSO ELISA	{bcrypt}$2a$10$3pnmVRUTEq0evE/uyEI3qORyjToz4brDW9PZQ7hwpsQv1HACIRHxa	USER	ALUMNO	1
104	2020-10-12 18:46:49.741873	04995081-25fb-4f1f-9933-834f8c0f05d5	2020-10-12 18:47:02.210723	mouret.mesta.patricio	t	2o B Pre	Nivel 2	MOURET MESTA PATRICIO	{bcrypt}$2a$10$Bn0EDrlIRQThj7kA3rE3LO/EpuEG6KcoJS62sgqDoLObec9VzN3QW	USER	ALUMNO	1
105	2020-10-12 18:46:49.85738	5783dfe7-ccbb-4e06-a491-c3fb43d2a326	2020-10-12 18:47:02.210783	ochoa.galindo.gabriel	t	2o B Pre	Nivel 2	OCHOA GALINDO GABRIEL	{bcrypt}$2a$10$HQnXdIzmkN0RsDY6TmhaIeDNahhLsu0sZ9dod5lJO4ltemZaSqKDa	USER	ALUMNO	1
106	2020-10-12 18:46:49.985886	7ed38d44-be42-42b8-9479-dca0ac24274f	2020-10-12 18:47:02.210844	orozco.gallo.juan	t	2o B Pre	Nivel 2	OROZCO GALLO JUAN	{bcrypt}$2a$10$vZ6PrlRAD.MkVsC6WzIhJ.vHD9bmfYZqeyd8PcbQm67QpjWEXFPc.	USER	ALUMNO	1
107	2020-10-12 18:46:50.106979	14b63146-18ed-4471-bf55-4b6eb76c6628	2020-10-12 18:47:02.210918	pares.espinosa.lucia	t	2o B Pre	Nivel 2	PARES ESPINOSA LUCÍA	{bcrypt}$2a$10$T4M/Tg9N2oQZlvTOEC0Zt.Ptpd0vBx2X6sYDBSYFLoAqFm39M5coe	USER	ALUMNO	1
108	2020-10-12 18:46:50.215771	ad145a7c-c930-426e-b805-46d230811a17	2020-10-12 18:47:02.21098	perez.gay.vazquez.ainhoa	t	2o B Pre	Nivel 2	PÉREZ GAY VÁZQUEZ AINHOA	{bcrypt}$2a$10$9jiJddGWDnsSVlkrE53psuXMyM8ty8NtjhgufYzebFvcOo9VHb83S	USER	ALUMNO	1
109	2020-10-12 18:46:50.323139	7d0024dd-db75-4185-9e50-77dda889b9c4	2020-10-12 18:47:02.211043	prud.homme.cotera.jose.maria	t	2o B Pre	Nivel 2	PRUD HOMME COTERA JOSÉ MARÍA	{bcrypt}$2a$10$XIABc6YyHlAg8P6K/SLHRe5r31NeRLOtnEpSeJwCdV4p4bXhjKY/i	USER	ALUMNO	1
110	2020-10-12 18:46:50.432167	36d8d54a-da2b-49cf-8904-fc9250ca380c	2020-10-12 18:47:02.211109	quintana.payro.maria.camila	t	2o B Pre	Nivel 2	QUINTANA PAYRÓ MARÍA CAMILA	{bcrypt}$2a$10$x..5QeAu/lGLgHZ2phHbz.4WZ/6N7w02o1jXR3QVBTIOxgBG7EnIq	USER	ALUMNO	1
111	2020-10-12 18:46:50.536763	35bf9dae-b4dd-4a06-9fa2-562196ce7d6e	2020-10-12 18:47:02.211176	rodriguez.urruchua.sebastian	t	2o B Pre	Nivel 2	RODRÍGUEZ URRUCHUA SEBASTIÁN	{bcrypt}$2a$10$z9FvPc9JRfpMzY5lu6fC1eFABhdLsepVrJZqk8CauSal.G3Rlz6DW	USER	ALUMNO	1
112	2020-10-12 18:46:50.641737	998cc5ac-744d-46ba-9a3f-cf02f89f4574	2020-10-12 18:47:02.211238	san.roman.escalante.franco	t	2o B Pre	Nivel 2	SAN ROMÁN ESCALANTE FRANCO	{bcrypt}$2a$10$o/8S2AXIr5tL0puYCn8xnuu3LTKihBCPaAYofthn5mhjeR/AfVNHO	USER	ALUMNO	1
113	2020-10-12 18:46:50.74693	5e8487de-9a5f-4c9c-ba41-c5f4feec20b9	2020-10-12 18:47:02.211305	bello.sosa.andres	t	2o C Pre	Nivel 2	BELLO SOSA ANDRÉS	{bcrypt}$2a$10$CBrEmF/7KJ9JWcGb05lUwODmbwsVWahMIS0Q/g2RzX80BkhS8E3BS	USER	ALUMNO	1
114	2020-10-12 18:46:50.855097	648a2fdc-4394-4bf2-b1fa-82572291c549	2020-10-12 18:47:02.211387	bravo.lozoya.santiago	t	2o C Pre	Nivel 2	BRAVO LOZOYA SANTIAGO	{bcrypt}$2a$10$9aTIZjHFo43oQAxsErn/auvvA7DABbFQ..FXAmhCtDaXKslwAxSjq	USER	ALUMNO	1
115	2020-10-12 18:46:50.960176	fabd8fab-caf4-4fe5-b47d-c54d2dc3afe7	2020-10-12 18:47:02.21145	carmona.barajas.juan.manuel	t	2o C Pre	Nivel 2	CARMONA BARAJAS JUAN MANUEL	{bcrypt}$2a$10$Cv3Vgj3/0yoCTYxbjq5O/OI7549re2JMawGw5WhMS2FRb5ZkYR2Xe	USER	ALUMNO	1
116	2020-10-12 18:46:51.067548	41ccfaa5-06e9-4934-8a28-3e18009e5a76	2020-10-12 18:47:02.211513	chavez.soto.santiago	t	2o C Pre	Nivel 2	CHÁVEZ SOTO SANTIAGO	{bcrypt}$2a$10$MPVIw5W9om3MWtPh938YtOrK3jhbThLssfvUu4Q8XoUlwxXTOoG.C	USER	ALUMNO	1
117	2020-10-12 18:46:51.173081	04c91b4f-84b1-4c3b-9eb0-cc98affdbdb3	2020-10-12 18:47:02.2116	collada.tron.alfonso	t	2o C Pre	Nivel 2	COLLADA TRON ALFONSO	{bcrypt}$2a$10$RIxESW8hD3eaPp5Q2fliueEvxd/VNvhYFYw5rlHnEgqgC7j0Tf8wi	USER	ALUMNO	1
118	2020-10-12 18:46:51.278266	196a2e55-da05-4d01-9653-fe4a5aa15d0a	2020-10-12 18:47:02.211668	curto.mendieta.barbara	t	2o C Pre	Nivel 2	CURTO MENDIETA BÁRBARA	{bcrypt}$2a$10$B62asCK3E5tADgaPz9UWDOQUjHy8LViDW5Dj8N5hOAEI6UHqX1Pj.	USER	ALUMNO	1
119	2020-10-12 18:46:51.38557	48e134c4-8787-4068-82c4-085693fe636a	2020-10-12 18:47:02.211734	davalos.alvarez.isabel	t	2o C Pre	Nivel 2	DÁVALOS ÁLVAREZ ISABEL	{bcrypt}$2a$10$1elm7usNI4KF/T7ZG23cfe1Vkwul68koPhETAOato9fLWUqkQm9nK	USER	ALUMNO	1
120	2020-10-12 18:46:51.493072	a66eccd4-dfb9-4bbd-966d-5a5a429f4d12	2020-10-12 18:47:02.211801	echenique.martinez.olivia	t	2o C Pre	Nivel 2	ECHENIQUE MARTÍNEZ OLIVIA	{bcrypt}$2a$10$3Z0RZdqvLUq8op/msx.ha.sC63tisIG7g5xSoav.YaW.Xh5/w5ETW	USER	ALUMNO	1
121	2020-10-12 18:46:51.601216	6dfeccba-6b26-48e7-9360-c04b13fda095	2020-10-12 18:47:02.211867	edelberg.villa.lea	t	2o C Pre	Nivel 2	EDELBERG VILLA LEA	{bcrypt}$2a$10$POTLAprAgCLALx1gzbEqh.JQ3Ujh0gbRYU2Duw8Vh1QgwBRFigA7i	USER	ALUMNO	1
122	2020-10-12 18:46:51.711028	03b2e456-8592-439e-99ff-bb1027881494	2020-10-12 18:47:02.211938	galeana.camacho.iker	t	2o C Pre	Nivel 2	GALEANA CAMACHO IKER	{bcrypt}$2a$10$8J89R7amAtU6fTtMrTV5i.TmxGAw7gsLQIqxu1lyJrMGt5EuBAsAm	USER	ALUMNO	1
123	2020-10-12 18:46:51.815744	5ea37c7f-5f98-412e-81aa-688265076da9	2020-10-12 18:47:02.21201	garza.estrada.jose.andres	t	2o C Pre	Nivel 2	GARZA ESTRADA JOSÉ ANDRÉS	{bcrypt}$2a$10$4Ronm4lUTwZbjSXJfYFIEeTmcWTw2OPLeD39lV9o3FUqPUUbWiqN6	USER	ALUMNO	1
124	2020-10-12 18:46:51.922147	34da9438-98b9-45b0-a004-c77e2714c762	2020-10-12 18:47:02.212107	gorostiza.gorostieta.ainhoa	t	2o C Pre	Nivel 2	GOROSTIZA GOROSTIETA AINHOA	{bcrypt}$2a$10$jxN2VbCMm.UdM9Rzc5kHveghaZVPKWO396MKDLtNzCy16lHaW/BAy	USER	ALUMNO	1
125	2020-10-12 18:46:52.027099	4645e292-6549-408f-93c2-dc19cc5b526f	2020-10-12 18:47:02.212169	herrejon.hernandez.lucia	t	2o C Pre	Nivel 2	HERREJÓN HERNÁNDEZ LUCÍA	{bcrypt}$2a$10$3tUf5f/rfPMQ3TaYwEJCX.5rlAMO8vuXA7nn0vXps4ST1ntrkAPjm	USER	ALUMNO	1
126	2020-10-12 18:46:52.133604	aa420ec7-6bbf-46ac-bb9c-a87547c5c5de	2020-10-12 18:47:02.212234	ibarra.gomez.jeronimo	t	2o C Pre	Nivel 2	IBARRA GÓMEZ JERÓNIMO	{bcrypt}$2a$10$dJtfaBpgHu.K9THBuEZtIeuckFcdOuam45bsaib13SIIYVV3Ygvaa	USER	ALUMNO	1
127	2020-10-12 18:46:52.241615	17d16f74-a335-441b-a19e-d83e50221fd5	2020-10-12 18:47:02.212313	martinez.soto.sofia	t	2o C Pre	Nivel 2	MARTÍNEZ SOTO SOFÍA	{bcrypt}$2a$10$0GhyxfgI.Zd7tHjnvUztuOrJ3dsfnnHP9EK5KlE5N3hPs9sSyQx5K	USER	ALUMNO	1
128	2020-10-12 18:46:52.347168	186c831f-23e1-4d91-9888-9d128e57c259	2020-10-12 18:47:02.212391	mejia.gil.maria	t	2o C Pre	Nivel 2	MEJÍA GIL MARÍA	{bcrypt}$2a$10$/J1WZnK2m2V7cYBzgskxJuo9UuFj34NW5Y1C.74NiXIYmz0yyikY.	USER	ALUMNO	1
129	2020-10-12 18:46:52.453697	adb6d3f9-ff2d-4a03-9bc8-0bdf6f8b2a27	2020-10-12 18:47:02.212519	morgan.palafox.mateo	t	2o C Pre	Nivel 2	MORGAN PALAFOX MATEO	{bcrypt}$2a$10$HtFbX5ElLHK3kT9Ter9A7.7yDLMWRydmXwRLExalUKQP3VLyLdQd.	USER	ALUMNO	1
130	2020-10-12 18:46:52.558794	94dd8979-cc94-413e-946b-da23fb675954	2020-10-12 18:47:02.212586	pestana.uribe.inaki	t	2o C Pre	Nivel 2	PESTANA URIBE IÑAKI	{bcrypt}$2a$10$CdwsFKkR5EbmWEwLyTGTXOWfwGsbdpw.3rf/pO1/e5mDbgpTm/k.i	USER	ALUMNO	1
131	2020-10-12 18:46:52.664207	093e0218-c64f-4d16-a07e-f682ec0e3c19	2020-10-12 18:47:02.212648	rosales.ledesma.carlos	t	2o C Pre	Nivel 2	ROSALES LEDESMA CARLOS	{bcrypt}$2a$10$IdE7FKqHpEBYetOtc6BS8uH1lOUUPFIBOH2nsv/FFueKNlc4Bs4f.	USER	ALUMNO	1
132	2020-10-12 18:46:52.769762	91530c30-c9aa-4f5b-bfb0-11839af8e390	2020-10-12 18:47:02.21271	rueda.contreras.santiago	t	2o C Pre	Nivel 2	RUEDA CONTRERAS SANTIAGO	{bcrypt}$2a$10$VvbxduxDahazVJ73kUHS9enK4Ndt7BWs7Sv4NbJ9WD/eA7UmmBSKq	USER	ALUMNO	1
133	2020-10-12 18:46:52.875166	6b8df679-91df-4b6e-8331-0bf14cc09eae	2020-10-12 18:47:02.212769	ruiz.barroso.javier	t	2o C Pre	Nivel 2	RUÍZ BARROSO JAVIER	{bcrypt}$2a$10$PmhsIXoI/HWmxvTPh0L/SudI.FraELZ1RgHrx7aRIU3uZYK7S0TuO	USER	ALUMNO	1
134	2020-10-12 18:46:52.980192	ee93871b-008e-48d7-94fd-c4ded0c665b9	2020-10-12 18:47:02.212834	sanchez.medina.andrea	t	2o C Pre	Nivel 2	SÁNCHEZ MEDINA ANDREA	{bcrypt}$2a$10$Pw2H6cRwlD5dxkJXzui2reP2U6TKSlaLilwyYl0FNIYD6YUs/8F3m	USER	ALUMNO	1
135	2020-10-12 18:46:53.086042	8516a50a-a4c6-4625-b98b-0066d4fe641c	2020-10-12 18:47:02.212929	sanchez.santander.sofia	t	2o C Pre	Nivel 2	SÁNCHEZ SANTANDER SOFÍA	{bcrypt}$2a$10$jdhPAv7EXS9n05tglvhcs.JVIsfBXq/LEtZ2loEo94Yfcrc4c.6xO	USER	ALUMNO	1
136	2020-10-12 18:46:53.197123	2a4daee6-12f2-4475-baf4-ffce87176ae3	2020-10-12 18:47:02.212991	tominey.ruiz.ophelia.eilidh	t	2o C Pre	Nivel 2	TOMINEY RUIZ OPHELIA EILIDH	{bcrypt}$2a$10$CKByGd4ejzi5.6FKmZew7eZWxsqnoZbep/9ROCGyyr8TioBU16WWy	USER	ALUMNO	1
137	2020-10-12 18:46:53.30813	32a5fb9c-c558-4461-afbc-992616dc6844	2020-10-12 18:47:02.213055	vazquez.menocal.valentina	t	2o C Pre	Nivel 2	VÁZQUEZ MENOCAL VALENTINA	{bcrypt}$2a$10$MDGWoHN66RguHIVGBdnAV.kPyno02g.zwzG8FWn9GkpgaaU2E12OK	USER	ALUMNO	1
138	2020-10-12 18:46:53.414347	131c6cfe-87dc-4f59-8dc2-82b78ca12ff7	2020-10-12 18:47:02.213116	zamora.sodi.patricio	t	2o C Pre	Nivel 2	ZAMORA SODI PATRICIO	{bcrypt}$2a$10$OdV9REyoL61OGJtdzVAnWO5GcbiFJXONBMj0LmVoZ5JadLF7YMfuC	USER	ALUMNO	1
139	2020-10-12 18:46:53.519667	6a88c8fb-5246-4d23-8968-ff1ad0e4e147	2020-10-12 18:47:02.213179	andrade.toledo.marianella	t	3o A Pre	Nivel 3	ANDRADE TOLEDO MARIANELLA	{bcrypt}$2a$10$YP7K9S.oHA03nFvsktWLSuxoudSOJQWIyiOneOa1k47h6keXR4hfq	USER	ALUMNO	1
140	2020-10-12 18:46:53.626107	5beccb2a-02f0-4270-9c86-9e92e2964d80	2020-10-12 18:47:02.213269	arroyo.prendes.martina	t	3o A Pre	Nivel 3	ARROYO PRENDES MARTINA	{bcrypt}$2a$10$exerNTsUsGj.ny9FBeinSuq1Fp9GkTTTFfdDfxZgaoaqlqSg9E6jW	USER	ALUMNO	1
141	2020-10-12 18:46:53.734952	5af6ed2a-f8ea-4c6d-9198-fa593c8d98dd	2020-10-12 18:47:02.213333	bauer.gallo.mila	t	3o A Pre	Nivel 3	BAUER GALLO MILA	{bcrypt}$2a$10$8eiSDFjpJVjaAtNBmL6Er.lEUW/vQR2jMWnfTfF3Pe1Gn4AFuuWzS	USER	ALUMNO	1
142	2020-10-12 18:46:53.841384	fb048021-15a2-4ebc-9a02-6662681ab98d	2020-10-12 18:47:02.213396	bueron.caruso.mikel	t	3o A Pre	Nivel 3	BUERON CARUSO MIKEL	{bcrypt}$2a$10$NyIZ141FhQU/5DkRFJ8gm.CcqX263/x.WhZpHr7Ru6vLq/gn6V.Ee	USER	ALUMNO	1
143	2020-10-12 18:46:53.953472	21e41706-6e18-43f0-abe2-87f2703c0c16	2020-10-12 18:47:02.213461	castillo.brassel.andrea	t	3o A Pre	Nivel 3	CASTILLO BRASSEL ANDREA	{bcrypt}$2a$10$/eGNJTAuDeuJKI6EX2q.wOMeDcYgU2aPbe4GVRku8k99xYSvoL942	USER	ALUMNO	1
144	2020-10-12 18:46:54.059074	de2ce635-7862-4534-9993-2fe136275835	2020-10-12 18:47:02.213529	cordier.garcia.emilia.fernanda	t	3o A Pre	Nivel 3	CORDIER GARCÍA EMILIA FERNANDA	{bcrypt}$2a$10$3yX8egOeWJuvJgPDXWttzuljgB4Bk5faC0IZDywQCmRVpPPUvuJ7a	USER	ALUMNO	1
145	2020-10-12 18:46:54.171122	639584f2-443e-47aa-8907-41a3ff73917f	2020-10-12 18:47:02.213594	de.la.rosa.bonner.estefania	t	3o A Pre	Nivel 3	DE LA ROSA BONNER ESTEFANIA	{bcrypt}$2a$10$t1ktsinVWd7CGkfOUU8vgOzufWmknAH8D7q/LEbt5gSEHvABEg3ke	USER	ALUMNO	1
146	2020-10-12 18:46:54.276002	68d183d3-f380-4ae7-b00a-f0390d38ab24	2020-10-12 18:47:02.213746	dersdepanian.sanjuan.carolina	t	3o A Pre	Nivel 3	DERSDEPANIAN SANJUAN CAROLINA	{bcrypt}$2a$10$rATyqzOGM7rlbjAlVsrHgOHIG7IYcc1ry4aN96FSXSgmQ9EVkBYHy	USER	ALUMNO	1
147	2020-10-12 18:46:54.381485	1fdc11a0-0d2b-4958-901c-c82384968b6b	2020-10-12 18:47:02.213811	dosal.nava.fatima	t	3o A Pre	Nivel 3	DOSAL NAVA FÁTIMA	{bcrypt}$2a$10$d4mBvrKCBCx7ZyuMAQKkq.3MI9U/AYpvhtH/sVG0Q9JzafCMAz862	USER	ALUMNO	1
148	2020-10-12 18:46:54.485901	bce9f991-75dd-4542-bc14-26788dfba294	2020-10-12 18:47:02.213875	favela.galinatti.fernando	t	3o A Pre	Nivel 3	FAVELA GALINATTI FERNANDO	{bcrypt}$2a$10$lc8pTmQWmxhA652VE76dgOuorIdJfJ9CWgIPxThMmp4SJHdCp9zSC	USER	ALUMNO	1
149	2020-10-12 18:46:54.592247	6b1a5b19-bbf0-4980-bbde-251405428e11	2020-10-12 18:47:02.213941	figueroa.arroyo.santino.tadeo	t	3o A Pre	Nivel 3	FIGUEROA ARROYO SANTINO TADEO	{bcrypt}$2a$10$/vF.luArO6.zxJHzUKbCO.FEQmt7bsaH/s10fE/wTpZ9chlkiyTYO	USER	ALUMNO	1
150	2020-10-12 18:46:54.701019	c0d8bd58-7e4f-48e2-8149-27d77113191b	2020-10-12 18:47:02.214017	flores.mendez.emiliana	t	3o A Pre	Nivel 3	FLORES MÉNDEZ EMILIANA	{bcrypt}$2a$10$4UEIRBS1qFGC1IqVVPogG.V1Vf.HEf/NQS1GK4Lx0X6Ml8bfO8a2y	USER	ALUMNO	1
151	2020-10-12 18:46:54.809099	35a8e6bb-2efc-47ff-8907-7d517a54d728	2020-10-12 18:47:02.21408	gomez.flores.abby	t	3o A Pre	Nivel 3	GOMEZ FLORES ABBY	{bcrypt}$2a$10$aXmRKOl6KEyt5ic/kdQTl.P2so2c5DsSvNf.DzXwlW/Bu0TAJS5HW	USER	ALUMNO	1
152	2020-10-12 18:46:54.914677	5299a7a6-c041-4aaf-a698-219e7273c92b	2020-10-12 18:47:02.214143	gongora.sosa.ana.sofia	t	3o A Pre	Nivel 3	GÓNGORA SOSA ANA SOFÍA	{bcrypt}$2a$10$ltEQpTAuI6Q8htwVOT2S5OPP6.k4c5n.uQujMiMkCe2RTFOZK1gSy	USER	ALUMNO	1
153	2020-10-12 18:46:55.019903	71ae7822-691f-4055-bc75-cbbed4336626	2020-10-12 18:47:02.214228	gonzalez.arenas.elena	t	3o A Pre	Nivel 3	GONZÁLEZ ARENAS ELENA	{bcrypt}$2a$10$D/MsuzeQn58uqNIZgXNQ6eFCXD4QAzf6.7./jkaMSuS6wEVSPnIJu	USER	ALUMNO	1
154	2020-10-12 18:46:55.125508	1d3fb24e-cf1c-47d2-b4a8-b365222291d2	2020-10-12 18:47:02.214297	insua.arguelles.diego	t	3o A Pre	Nivel 3	INSUA ARGÜELLES DIEGO	{bcrypt}$2a$10$aEMw53Wgj4Cdg1iJ5HDk8OZ8ozKxcBQejs8..xj63S0AQqNF3bntW	USER	ALUMNO	1
155	2020-10-12 18:46:55.232081	0c887f4e-81ea-4026-9db1-fc9f993fdb87	2020-10-12 18:47:02.214361	lorenzana.mendoza.andre	t	3o A Pre	Nivel 3	LORENZANA MENDOZA ANDRÉ	{bcrypt}$2a$10$Ukb1YYihPpc1McEvGjbsTe0eXX.CJXs9gRyrSghmyQRhwhvnb9R2.	USER	ALUMNO	1
156	2020-10-12 18:46:55.336568	de3c1098-a1ba-40a6-8197-06468cfc4b85	2020-10-12 18:47:02.214424	picazzo.coutino.rodrigo	t	3o A Pre	Nivel 3	PICAZZO COUTIÑO RODRIGO	{bcrypt}$2a$10$JPc.efRgG.Xo6.uEhm.sx.1xdAuHTjT4oaRsyBeEQWhA6TjwK3MIu	USER	ALUMNO	1
157	2020-10-12 18:46:55.441571	8c4d12ce-3961-4a21-a225-c9e0f4cc0820	2020-10-12 18:47:02.21449	pietra.santa.abud.paolo	t	3o A Pre	Nivel 3	PIETRA SANTA ABUD PAOLO	{bcrypt}$2a$10$azJHxumKKGZ8qPmWXG6LY.kf.uAandBrvXvVEBq4.9Sirusf.o7Ge	USER	ALUMNO	1
158	2020-10-12 18:46:55.546695	6045bf58-b92e-431f-b91c-8cafa73fc6a5	2020-10-12 18:47:02.21455	puente.ceron.emma	t	3o A Pre	Nivel 3	PUENTE CERON EMMA	{bcrypt}$2a$10$eKVLjzILAw0DE9WHCgXdYOuiV2Q2j/vhFirbuYQdKRewtQ5io30fG	USER	ALUMNO	1
159	2020-10-12 18:46:55.654774	047a9622-1656-41e3-9b4c-00677eb3d118	2020-10-12 18:47:02.21461	rafful.jose.marina	t	3o A Pre	Nivel 3	RAFFUL JOSÉ MARINA	{bcrypt}$2a$10$d/OzEUaBCyQsMYszmgygau39W2NLnFNZu5dJJXtzCjJIqpKzQJ4lO	USER	ALUMNO	1
160	2020-10-12 18:46:55.763848	faa31a82-6b7f-44c7-9569-e00c6f063394	2020-10-12 18:47:02.214667	rocha.aguilar.alejandro	t	3o A Pre	Nivel 3	ROCHA AGUILAR ALEJANDRO	{bcrypt}$2a$10$b20W5ETFgMPjvokF.xZOheHyhqpmhI2Z6NQ9JpG8LttH/PDN0e5MC	USER	ALUMNO	1
161	2020-10-12 18:46:55.869004	71195619-d01f-45e6-b907-f0bd63e706d1	2020-10-12 18:47:02.214726	rojon.haro.gonzalo	t	3o A Pre	Nivel 3	ROJÓN HARO GONZALO	{bcrypt}$2a$10$DF8UABL3rGrDBYsU0Zi9/.iWjuFX1GFN7uOIgfFdxEgDdx96y5efq	USER	ALUMNO	1
162	2020-10-12 18:46:55.974028	9ccec548-5909-48fe-985e-ef73ccd2f5e2	2020-10-12 18:47:02.214815	roldan.romo.luca	t	3o A Pre	Nivel 3	ROLDÁN ROMO LUCA	{bcrypt}$2a$10$lRTMmvXE4marBQg50B72X.A/OqjIg7qcJaJh5bDXXBNbBngSa7ip.	USER	ALUMNO	1
163	2020-10-12 18:46:56.079559	3bc63561-09ad-40e2-b25e-88f7e803d6c6	2020-10-12 18:47:02.214874	sadek.bravo.antonio	t	3o A Pre	Nivel 3	SADEK BRAVO ANTONIO	{bcrypt}$2a$10$oTplRg/98mExMqIQPMtUte2UTxbhq7OG50xbCd2f5K/bNmacEdKrO	USER	ALUMNO	1
164	2020-10-12 18:46:56.187483	380534ea-3c68-4e73-aeef-6ee2d628ac88	2020-10-12 18:47:02.214949	salgado.gaitan.humberto	t	3o A Pre	Nivel 3	SALGADO GAITAN HUMBERTO	{bcrypt}$2a$10$iHxEFU..1VFzwq7w.9sHSeVWxVmkp5nIKC0BoqwTxcMMQ13/y8ppO	USER	ALUMNO	1
165	2020-10-12 18:46:56.293935	f83356aa-6adb-4494-9dbc-35f90b315dcf	2020-10-12 18:47:02.215014	senosiain.lomelin.fernando	t	3o A Pre	Nivel 3	SENOSIAIN LOMELÍN FERNANDO	{bcrypt}$2a$10$yBkteT40shaeYGLGgyUns.SoPyjaTZLMtzG3v9LaaTNOjGzYd2Ysy	USER	ALUMNO	1
166	2020-10-12 18:46:56.398659	174abb3f-0323-451e-884d-f89c27e65e87	2020-10-12 18:47:02.215079	abreu.paez.luisa	t	3o B Pre	Nivel 3	ABREU PAEZ LUISA	{bcrypt}$2a$10$wB.izi4kukkANuUPUXRGSuPHEnrluNKE6eQWN9kuEpIhj1Hrk0ajK	USER	ALUMNO	1
167	2020-10-12 18:46:56.504996	97a935cd-d67f-4868-a16c-89be22ff5317	2020-10-12 18:47:02.215144	arbide.perdomo.nora	t	3o B Pre	Nivel 3	ARBIDE PERDOMO NORA	{bcrypt}$2a$10$6HA3GST/6pYtZkpq.W59xOe4hT.bME5InKdezbQsTq7097VKIDMgy	USER	ALUMNO	1
168	2020-10-12 18:46:56.609721	3e47d695-7a85-4113-b8a5-028407e1f487	2020-10-12 18:47:02.215209	bada.pellico.maria.ines	t	3o B Pre	Nivel 3	BADA PELLICO MARÍA INÉS	{bcrypt}$2a$10$jm34dmi.xiqOe6jrvq84SeFZ2gh8xQsUUrJxh2DtIzva/PYbsuudK	USER	ALUMNO	1
169	2020-10-12 18:46:56.716252	2704f5c3-8703-428a-940e-0f4afba2ba5f	2020-10-12 18:47:02.215272	bajos.medina.naim	t	3o B Pre	Nivel 3	BAJOS MEDINA NAIM	{bcrypt}$2a$10$t94BhnM9Uv6iTYUKiWnPX.oCNyYkTFiq4Hb3aC5/hvvRUiL3Wi3jq	USER	ALUMNO	1
170	2020-10-12 18:46:56.827659	78609b71-04d9-4880-865b-2294fc1a517e	2020-10-12 18:47:02.215335	borbolla.henderson.arantza	t	3o B Pre	Nivel 3	BORBOLLA HENDERSON ARANTZA	{bcrypt}$2a$10$GF/2pe6OVYRWcMzS1RGzLOdVH3rpEx4vlM825COimPAJvNykHhWW6	USER	ALUMNO	1
171	2020-10-12 18:46:56.93469	17868922-6280-44b6-a3ec-317ea81d36e8	2020-10-12 18:47:02.215397	caballero.garcia.juan.pablo	t	3o B Pre	Nivel 3	CABALLERO GARCIA JUAN PABLO	{bcrypt}$2a$10$.y3b5ZFSsbR0.kySKL7o5u3YiaTx93CU4gFaT76E6k5/ErqhmZtfG	USER	ALUMNO	1
172	2020-10-12 18:46:57.041378	31c1e556-0f53-467d-8315-3906704c9aed	2020-10-12 18:47:02.215465	calderon.guerra.santiago	t	3o B Pre	Nivel 3	CALDERÓN GUERRA SANTIAGO	{bcrypt}$2a$10$DLxiS/AMzhLU.laxFEOT.OcP9XoWtDflorLT8jx4CL9UiK9dt6Io6	USER	ALUMNO	1
173	2020-10-12 18:46:57.14921	f48176a1-de08-4020-bac3-5430e47e4aea	2020-10-12 18:47:02.215528	ceron.vazquez.jeronimo	t	3o B Pre	Nivel 3	CERÓN VÁZQUEZ JERÓNIMO	{bcrypt}$2a$10$9rxpnOF0z8h/I0HzZwMOkO2tv/V79.0Y0oqoXnNn38SyqMu8r/D/m	USER	ALUMNO	1
174	2020-10-12 18:46:57.2583	d61c410c-bb0a-4805-aba6-3a99e1bf8649	2020-10-12 18:47:02.215592	crestani.ordonez.nicolas	t	3o B Pre	Nivel 3	CRESTANI ORDÓÑEZ NICOLÁS	{bcrypt}$2a$10$.L86LF/gVY32GofXcyjqc.1AF4jGMuQmL4Djo/VHkReN18dCWzT8q	USER	ALUMNO	1
175	2020-10-12 18:46:57.366386	ebc9458d-6c16-41c1-b414-66e35b757e26	2020-10-12 18:47:02.215655	de.leon.garcia.maria.jose	t	3o B Pre	Nivel 3	DE LEON GARCIA MARIA JOSE	{bcrypt}$2a$10$VOJSLFowRG5cksmUQ9eQW.uc4MfetAM0xq2.ZNqFNL3xrH6xxXXp6	USER	ALUMNO	1
176	2020-10-12 18:46:57.475063	31453bae-47bc-493a-85d4-6ccd476bb072	2020-10-12 18:47:02.215718	garay.de.caso.luisa	t	3o B Pre	Nivel 3	GARAY DE CASO LUISA	{bcrypt}$2a$10$dohNjstbTT9WoEdMzH7KfOY1GCwUwQ3O3xx1Ow6K94uDiIuzdtWkO	USER	ALUMNO	1
177	2020-10-12 18:46:57.582801	a614e73d-ac28-46e2-a403-8a77fe1aee17	2020-10-12 18:47:02.215781	garcia.sosa.santiago	t	3o B Pre	Nivel 3	GARCIA SOSA SANTIAGO	{bcrypt}$2a$10$HhDA5UVoyAMXNo/Vc/LiROP.6CiRHSyo.q0GJoPV7cdcOzjhnJkPm	USER	ALUMNO	1
178	2020-10-12 18:46:57.691353	8cb44dc7-4d9b-4a1a-861b-6a616bb7af8f	2020-10-12 18:47:02.215844	gavinelli.garcia.camila	t	3o B Pre	Nivel 3	GAVINELLI GARCÍA CAMILA	{bcrypt}$2a$10$8qzqV.WydsDgQq5feAk84.n9H1dNM7yN.13Z4nwR3Et7icoha5iCa	USER	ALUMNO	1
179	2020-10-12 18:46:57.808227	c719aba7-e29a-4eef-a615-7c0d650f9ed7	2020-10-12 18:47:02.215909	gomez.chico.simon.almudena	t	3o B Pre	Nivel 3	GÓMEZ CHICO SIMÓN ALMUDENA	{bcrypt}$2a$10$9NBqIZnG/RcoW.XWBsU5.uGw3boObQfrbFhMJmO9VcC3BD3kl8Xta	USER	ALUMNO	1
180	2020-10-12 18:46:57.917868	91f0853f-2a83-45cd-9365-120efe911c90	2020-10-12 18:47:02.215973	gomez.gallardo.valcarcel.ema	t	3o B Pre	Nivel 3	GÓMEZ GALLARDO VALCÁRCEL EMA	{bcrypt}$2a$10$xIUVb8joll9GWfdJwAjynO8hr5jiZ0/4UNtJnu/JPfc/dx0/soCz6	USER	ALUMNO	1
181	2020-10-12 18:46:58.026793	8ccaaf61-1ec2-46c0-a433-dd74ee48b9d8	2020-10-12 18:47:02.216038	gonzalez.diaz.carlota	t	3o B Pre	Nivel 3	GONZÁLEZ DIAZ CARLOTA	{bcrypt}$2a$10$6Z2ReuM.GvvsIO6/MDA7gOAp4dHVn5mAv8eR8UOOQFokSZV0/6rl6	USER	ALUMNO	1
182	2020-10-12 18:46:58.134715	16095d63-cd08-4c9d-80c0-e49cb3d75d8f	2020-10-12 18:47:02.216101	lopez.alvarez.antia	t	3o B Pre	Nivel 3	LÓPEZ ÁLVAREZ ANTÍA	{bcrypt}$2a$10$vf0FoYhr3PHfY1mTIwvKgOD/xjY0rr6CtMOGJAOcmOoMu1fHGkPRi	USER	ALUMNO	1
183	2020-10-12 18:46:58.249698	98fa6593-a1b8-4f2e-9164-5c7dd98875dc	2020-10-12 18:47:02.216164	miguel.busto.rafael	t	3o B Pre	Nivel 3	MIGUEL BUSTO RAFAEL	{bcrypt}$2a$10$2zpyMWU44F2t9lDa4.fQCODwPZkPkO5Lm4DY.KDNqWIlAFey1fY1q	USER	ALUMNO	1
184	2020-10-12 18:46:58.357993	ddc239ef-f0da-4fc2-9a26-9663a7ee42c4	2020-10-12 18:47:02.216226	murcio.flores.ana.paola	t	3o B Pre	Nivel 3	MURCIO FLORES ANA PAOLA	{bcrypt}$2a$10$KyCepfDipMrkjDT0Voq1qen489TJlbxmsUq6JP1WJIlfN7geM7Aee	USER	ALUMNO	1
185	2020-10-12 18:46:58.468243	e819d997-7855-4cf3-8959-b44624ee8edc	2020-10-12 18:47:02.216285	paredes.perez.santino	t	3o B Pre	Nivel 3	PAREDES PÉREZ SANTINO	{bcrypt}$2a$10$fP05O0hWy9f/PDFC3mNaNuwRRM6K6EpYx5SqV1W5w4awQoY3zP9ga	USER	ALUMNO	1
186	2020-10-12 18:46:58.576203	c92b0927-01cd-4db3-b5f1-26fd79b4e919	2020-10-12 18:47:02.216342	perez.ponce.de.leon.maria	t	3o B Pre	Nivel 3	PÉREZ PONCE DE LEÓN MARÍA	{bcrypt}$2a$10$kq/vRvjqhlffLm0fEM9vbOsy8t/pYStPHlohNSem4rGDVUIfNlmcm	USER	ALUMNO	1
187	2020-10-12 18:46:58.683893	428d9c0b-f101-48d9-b983-f1505a7dd538	2020-10-12 18:47:02.2164	pin.herrejon.sofia	t	3o B Pre	Nivel 3	PIN HERREJÓN SOFÍA	{bcrypt}$2a$10$sOGqZtDQ.b1AeYpZH67gj.c7QGXME4pbv3cfQdQP7LeO3xnaJgqZa	USER	ALUMNO	1
188	2020-10-12 18:46:58.79242	78b1164a-f254-401d-84e6-7bf5fd91b23c	2020-10-12 18:47:02.216456	rihbany.musi.nicolas	t	3o B Pre	Nivel 3	RIHBANY MUSI NICOLÁS	{bcrypt}$2a$10$ukNOo9qskNGXxB.ZhXTP1uIGXmUDL.GNhCSqfCs9ykJQTJsbj7qHe	USER	ALUMNO	1
189	2020-10-12 18:46:58.900491	d04c0fc8-09a8-427a-ba7c-51ae32d9286f	2020-10-12 18:47:02.216515	rubio.-.manzanares.puron.borja	t	3o B Pre	Nivel 3	RUBIO - MANZANARES PURÓN BORJA	{bcrypt}$2a$10$Wk6BmL43lMjfQZonukezkOd.1Gf88f7lb5tLKpzXorhBOXBYaf956	USER	ALUMNO	1
190	2020-10-12 18:46:59.009248	c854783e-cd22-40ae-802e-171ace5b8c9c	2020-10-12 18:47:02.216574	sanchez.tena.de.pedro.iker	t	3o B Pre	Nivel 3	SANCHEZ TENA DE PEDRO IKER	{bcrypt}$2a$10$lXkIk1vMUG/8VenIbwEerO2gM6IfHLduz77sAmty88VURPKHZYY7a	USER	ALUMNO	1
191	2020-10-12 18:46:59.118807	946843f9-90e4-4fc6-905d-714769016763	2020-10-12 18:47:02.216632	solorzano.cardoso.jeronimo	t	3o B Pre	Nivel 3	SOLÓRZANO CARDOSO JERÓNIMO	{bcrypt}$2a$10$thGLaRQNWuP/QRAxR9ZxKewDhdgIzjDfkrj1tIyzac2Y8cwxZYyG.	USER	ALUMNO	1
192	2020-10-12 18:46:59.228756	2a9f4089-ec4b-4d31-b191-d527a5ebb8c7	2020-10-12 18:47:02.216693	uribe.jose.jeronimo	t	3o B Pre	Nivel 3	URIBE JOSÉ JERÓNIMO	{bcrypt}$2a$10$PrSmIBjFkljBCDIY7fSFxOnttLDilBe8CBeE44Bh/mCiC72Ijjrni	USER	ALUMNO	1
193	2020-10-12 18:46:59.337299	b3a3345e-9535-44c4-a0d7-bf372aaff38d	2020-10-12 18:47:02.216775	velderrain.rios.lorenzo	t	3o B Pre	Nivel 3	VELDERRAIN RÍOS LORENZO	{bcrypt}$2a$10$8HUbBcWqpXaherFDnqGVLeheT4pGbFJ/aVfv2HbzbjhN9/JB79cyq	USER	ALUMNO	1
194	2020-10-12 18:46:59.446152	493a8097-17c3-4b3e-a73b-83aef5516d51	2020-10-12 18:47:02.216833	aldana.orraca.lorenza	t	3o C Pre	Nivel 3	ALDANA ORRACA LORENZA	{bcrypt}$2a$10$cjnxMeZFEAAe34lzaP3fzegtRDmKVZYF3KSigD6xw/u63tBoYXzgC	USER	ALUMNO	1
195	2020-10-12 18:46:59.557252	881cba4b-1d60-4968-bbd2-1060e67a19e8	2020-10-12 18:47:02.21689	avilez.espinosa.elena	t	3o C Pre	Nivel 3	AVILEZ ESPINOSA ELENA	{bcrypt}$2a$10$.3HaP6vtzT7vX9Qn5yEqpOMNyMY9hWrqHhoXuD1r/MvH14nLsmwaO	USER	ALUMNO	1
196	2020-10-12 18:46:59.669538	e84a2915-be8a-47f2-b765-3e6cc53b4f0f	2020-10-12 18:47:02.216947	brassel.sosa.javier	t	3o C Pre	Nivel 3	BRASSEL SOSA JAVIER	{bcrypt}$2a$10$wy6PJdNgRAXOdfl6lHh4h.ew0qkfX4y2V6IkgfwdF28c8MiBCAEg.	USER	ALUMNO	1
197	2020-10-12 18:46:59.775786	dffc8216-cfa2-4af7-8779-1ba79c0a588d	2020-10-12 18:47:02.217004	campos.lemus.ana.cecilia	t	3o C Pre	Nivel 3	CAMPOS LEMUS ANA CECILIA	{bcrypt}$2a$10$xPd6JMwR0YNJuK4F0Wkwh.3yfh6akVfxHOtzQNqxDakm4rxIa3oUW	USER	ALUMNO	1
198	2020-10-12 18:46:59.88625	c920eadb-f1b8-4405-ad8a-f1f099f0e5a0	2020-10-12 18:47:02.217063	colin.velazquez.maria.jose	t	3o C Pre	Nivel 3	COLIN VELAZQUEZ MARIA JOSE	{bcrypt}$2a$10$TkUEqIBCFeVY7lA1ldi.pOhw/Fa502HJsi9W291FRHqQQ7GL/cUO6	USER	ALUMNO	1
199	2020-10-12 18:46:59.995101	91753fc0-1990-4de3-8bc4-4a416845aba2	2020-10-12 18:47:02.217119	corominas.morales.sofia	t	3o C Pre	Nivel 3	COROMINAS MORALES SOFIA	{bcrypt}$2a$10$D2RVJIWJ2jkg3mdKjv3UJukchKKwxpiWLgs.k9A.StAijxPjhQ/I2	USER	ALUMNO	1
200	2020-10-12 18:47:00.10528	e236581b-0c4a-4991-bf9a-9e0a8d61d6b9	2020-10-12 18:47:02.217176	curiel.gorozpe.pablo	t	3o C Pre	Nivel 3	CURIEL GOROZPE PABLO	{bcrypt}$2a$10$lOw7PuDzCXfFZWN3fV/7u.A4RSc/fozEVX5w/5CGMYq3uT49EW/DK	USER	ALUMNO	1
201	2020-10-12 18:47:00.21312	6a4de318-fd8a-4a05-ab92-23f1a0e874cf	2020-10-12 18:47:02.217235	chavez.soto.patricio	t	3o C Pre	Nivel 3	CHÁVEZ SOTO PATRICIO	{bcrypt}$2a$10$viPW1JNT7jJRBjrJzAjzjuOhI6ZxBffUe9Q70ojLYs5hVLxckuaaG	USER	ALUMNO	1
202	2020-10-12 18:47:00.322218	d4c8a0e9-fc1a-439a-b207-5f001664e1ee	2020-10-12 18:47:02.217295	dersdepanian.sanjuan.valentina	t	3o C Pre	Nivel 3	DERSDEPANIAN SANJUAN VALENTINA	{bcrypt}$2a$10$bnQpgqMz2MenD049OvNPwelYhYvkXEDrx9N8Pc3XNhYnT.sRe4qWi	USER	ALUMNO	1
203	2020-10-12 18:47:00.42982	e8431d23-d350-44c2-b1bb-1dd97ffba9c4	2020-10-12 18:47:02.217353	garcia.abreu.mariano	t	3o C Pre	Nivel 3	GARCÍA ABREU MARIANO	{bcrypt}$2a$10$o5pbMJJjHzPTwHYn2tgrF.0jj2wc7GP0L1MClkV4kvLZkQUeqrsdC	USER	ALUMNO	1
204	2020-10-12 18:47:00.539102	d9960a2b-fec5-489b-bb62-62865d7e8591	2020-10-12 18:47:02.217517	gudino.bobadilla.maria.jose	t	3o C Pre	Nivel 3	GUDIÑO BOBADILLA MARÍA JOSÉ	{bcrypt}$2a$10$xplizBCJXySkbL8Dqq7cu.qvY6mZgGm3x50tU5XVNl22pyPomww6i	USER	ALUMNO	1
205	2020-10-12 18:47:00.647041	cef410ec-62f1-4591-a3b9-93c2764f2240	2020-10-12 18:47:02.217582	hernandez.luelmo.mariela	t	3o C Pre	Nivel 3	HERNÁNDEZ LUELMO MARIELA	{bcrypt}$2a$10$sVqViac3pBDyGeNAy1aEvOlbxtfkXYqRYT6qq6sYW0fUVTlPa4Lte	USER	ALUMNO	1
206	2020-10-12 18:47:00.754242	7942edb2-7c42-41c6-a7b6-0b6db81063a8	2020-10-12 18:47:02.217643	hernandez.ortiz.ana.paula	t	3o C Pre	Nivel 3	HERNÁNDEZ ORTÍZ ANA PAULA	{bcrypt}$2a$10$aTLgCoRked3kOJe5JvIDYOmXt6GyGxv.PxiZUCkvuSjTyELMkZPv2	USER	ALUMNO	1
207	2020-10-12 18:47:00.861566	0dcecc06-7662-45f8-93da-2e2c7fccb209	2020-10-12 18:47:02.217703	ibanez.villavicencio.emilia	t	3o C Pre	Nivel 3	IBAÑEZ VILLAVICENCIO EMILIA	{bcrypt}$2a$10$uSl4pKmioKvSG/z2BR6Acuez8afL.Wz.gW9NuJvPpR2yT/KA.5IpK	USER	ALUMNO	1
208	2020-10-12 18:47:00.971093	51edaa2c-6bf4-4473-b634-232f3bd0bb84	2020-10-12 18:47:02.217763	isselin.sanchez.anna	t	3o C Pre	Nivel 3	ISSELIN SANCHEZ ANNA	{bcrypt}$2a$10$9Tzx9Y82H.sImuJtoK.c7eji3of.k8Vn31tqUuwblGSzlojZ2VEfO	USER	ALUMNO	1
209	2020-10-12 18:47:01.079421	e441dace-50b9-41d7-b844-c5eb2638f449	2020-10-12 18:47:02.21792	lopez.kalis.maria.ines	t	3o C Pre	Nivel 3	LÓPEZ KALIS MARÍA INÉS	{bcrypt}$2a$10$ku20ijFS6tD3tRGgv9ax2.zTqyuBovxfw8AkqcD3QA3E4tm.Zrvcu	USER	ALUMNO	1
210	2020-10-12 18:47:01.191034	f14976a1-9133-40df-aef0-639f62a2a64a	2020-10-12 18:47:02.217978	malo.juvera.mendez.ian	t	3o C Pre	Nivel 3	MALO JUVERA MENDEZ IAN	{bcrypt}$2a$10$v2mOA7eH0QUGoY0b9sFhneqJbF7Mj8Ep83VAzS.5RPyQPeTFdQQpS	USER	ALUMNO	1
211	2020-10-12 18:47:01.300549	cd8cce29-d824-45bf-a2a4-b1db740833c9	2020-10-12 18:47:02.21803	miracle.zubiria.alexander	t	3o C Pre	Nivel 3	MIRACLE ZUBIRÍA ALEXANDER	{bcrypt}$2a$10$frxyeeaPby2j84HYsvcRsO5NdBlkWLhjTJUpXmgLc2EPCJrWYrK9K	USER	ALUMNO	1
212	2020-10-12 18:47:01.41071	e5b9ad4d-8092-4c58-b5de-91bd4895bb65	2020-10-12 18:47:02.21809	montes.de.oca.rojas.rafaella	t	3o C Pre	Nivel 3	MONTES DE OCA ROJAS RAFAELLA	{bcrypt}$2a$10$65qsOcb/olz0SWK7tAIwaeNfa53fh38.rAo.ykgL.0u67l/Ftdjca	USER	ALUMNO	1
213	2020-10-12 18:47:01.522013	b7070d8f-e43a-46c6-afd4-6071e2160bcd	2020-10-12 18:47:02.218148	payro.estrada.luis.alejandro	t	3o C Pre	Nivel 3	PAYRO ESTRADA LUIS ALEJANDRO	{bcrypt}$2a$10$fZk3zUc8f3mVkiq3./wXUOCCxeSHecWTeibteptbCao9we/R9lII.	USER	ALUMNO	1
214	2020-10-12 18:47:01.631266	fb8bbcca-9577-4c2d-8175-f04cd9ba5d65	2020-10-12 18:47:02.218203	ramirez.cifuentes.jorge	t	3o C Pre	Nivel 3	RAMÍREZ CIFUENTES JORGE	{bcrypt}$2a$10$ID7J9dVP6sNUg8/NZ9fV.On5ZFHLYwiIcjTDtLo3ivkDPaa4BOHwq	USER	ALUMNO	1
215	2020-10-12 18:47:01.743023	c221fce1-0189-4646-8e00-8d63e0de6c34	2020-10-12 18:47:02.218262	rangel.villegas.elisa	t	3o C Pre	Nivel 3	RANGEL VILLEGAS ELISA	{bcrypt}$2a$10$EJss5hYYm8euM0q2CS1GBuSum9eP7gX/8Ai.1JFF9uQjHm0nFLDUW	USER	ALUMNO	1
216	2020-10-12 18:47:01.851493	2e91d059-4036-4172-8113-8a0a854b904e	2020-10-12 18:47:02.218317	sanchez.mendoza.fernando	t	3o C Pre	Nivel 3	SÁNCHEZ MENDOZA FERNANDO	{bcrypt}$2a$10$f.ogigV53i4BQERilKqaz.2ec4CmvaLewVw5YD1c28xR6G.Gc5m8W	USER	ALUMNO	1
217	2020-10-12 18:47:01.960523	e110a9ac-2392-437a-a9f4-678a6d9d45cc	2020-10-12 18:47:02.218375	santos.pliego.ignacio	t	3o C Pre	Nivel 3	SANTOS PLIEGO IGNACIO	{bcrypt}$2a$10$8vsRHdRYc44O2gV4BFZi.ONFAt2QLRs1LbO/Jdmt5ddYN.VtaHv/K	USER	ALUMNO	1
218	2020-10-12 18:47:02.069724	2b39fd87-3182-4e7c-bc4a-44e37396d0f9	2020-10-12 18:47:02.21843	valero.tejeda.sofia	t	3o C Pre	Nivel 3	VALERO TEJEDA SOFIA	{bcrypt}$2a$10$F15QhfDC0JKE29msa/u5v.U2iwdwZsqo4Zi6P9WZqzBbXY.oZonBG	USER	ALUMNO	1
219	2020-10-12 18:47:02.178264	b7117021-6c6e-4e79-9f26-d4589c2e3bad	2020-10-12 18:47:02.218487	valle.sordo.inigo	t	3o C Pre	Nivel 3	VALLE SORDO IÑIGO	{bcrypt}$2a$10$PSM2zLlZhO3vrxspMzjOb.moDFOGtfKzD2icStBBWd3ruipYXprnW	USER	ALUMNO	1
\.


--
-- Name: usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user01
--

SELECT pg_catalog.setval('public.usuario_id_seq', 219, true);


--
-- Name: archivo archivo_pkey; Type: CONSTRAINT; Schema: public; Owner: user01
--

ALTER TABLE ONLY public.archivo
    ADD CONSTRAINT archivo_pkey PRIMARY KEY (id);


--
-- Name: coleccion coleccion_pkey; Type: CONSTRAINT; Schema: public; Owner: user01
--

ALTER TABLE ONLY public.coleccion
    ADD CONSTRAINT coleccion_pkey PRIMARY KEY (id);


--
-- Name: documento documento_pkey; Type: CONSTRAINT; Schema: public; Owner: user01
--

ALTER TABLE ONLY public.documento
    ADD CONSTRAINT documento_pkey PRIMARY KEY (id);


--
-- Name: escuela escuela_pkey; Type: CONSTRAINT; Schema: public; Owner: user01
--

ALTER TABLE ONLY public.escuela
    ADD CONSTRAINT escuela_pkey PRIMARY KEY (id);


--
-- Name: grupo grupo_pkey; Type: CONSTRAINT; Schema: public; Owner: user01
--

ALTER TABLE ONLY public.grupo
    ADD CONSTRAINT grupo_pkey PRIMARY KEY (id);


--
-- Name: licencia licencia_pkey; Type: CONSTRAINT; Schema: public; Owner: user01
--

ALTER TABLE ONLY public.licencia
    ADD CONSTRAINT licencia_pkey PRIMARY KEY (id);


--
-- Name: spring_session_attributes spring_session_attributes_pk; Type: CONSTRAINT; Schema: public; Owner: user01
--

ALTER TABLE ONLY public.spring_session_attributes
    ADD CONSTRAINT spring_session_attributes_pk PRIMARY KEY (session_primary_id, attribute_name);


--
-- Name: spring_session spring_session_pk; Type: CONSTRAINT; Schema: public; Owner: user01
--

ALTER TABLE ONLY public.spring_session
    ADD CONSTRAINT spring_session_pk PRIMARY KEY (primary_id);


--
-- Name: usuario uk_5171l57faosmj8myawaucatdw; Type: CONSTRAINT; Schema: public; Owner: user01
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT uk_5171l57faosmj8myawaucatdw UNIQUE (email);


--
-- Name: escuela_licencias uk_c0c26ct3cedjfjr44ej1rah7n; Type: CONSTRAINT; Schema: public; Owner: user01
--

ALTER TABLE ONLY public.escuela_licencias
    ADD CONSTRAINT uk_c0c26ct3cedjfjr44ej1rah7n UNIQUE (licencias_id);


--
-- Name: coleccion_documentos uk_hh7jkhquu1yh6r6owol04lp29; Type: CONSTRAINT; Schema: public; Owner: user01
--

ALTER TABLE ONLY public.coleccion_documentos
    ADD CONSTRAINT uk_hh7jkhquu1yh6r6owol04lp29 UNIQUE (documentos_id);


--
-- Name: escuela_grupos uk_n2483dkfmg96yu8351kwvlghi; Type: CONSTRAINT; Schema: public; Owner: user01
--

ALTER TABLE ONLY public.escuela_grupos
    ADD CONSTRAINT uk_n2483dkfmg96yu8351kwvlghi UNIQUE (grupos_id);


--
-- Name: escuela_usuarios uk_ow1pn2p0qva0j5cwcvi32cb9j; Type: CONSTRAINT; Schema: public; Owner: user01
--

ALTER TABLE ONLY public.escuela_usuarios
    ADD CONSTRAINT uk_ow1pn2p0qva0j5cwcvi32cb9j UNIQUE (usuarios_id);


--
-- Name: escuela uk_tecn3hfl3p8mpvp5wdr0lnjs; Type: CONSTRAINT; Schema: public; Owner: user01
--

ALTER TABLE ONLY public.escuela
    ADD CONSTRAINT uk_tecn3hfl3p8mpvp5wdr0lnjs UNIQUE (nombre);


--
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: user01
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- Name: spring_session_ix1; Type: INDEX; Schema: public; Owner: user01
--

CREATE UNIQUE INDEX spring_session_ix1 ON public.spring_session USING btree (session_id);


--
-- Name: spring_session_ix2; Type: INDEX; Schema: public; Owner: user01
--

CREATE INDEX spring_session_ix2 ON public.spring_session USING btree (expiry_time);


--
-- Name: spring_session_ix3; Type: INDEX; Schema: public; Owner: user01
--

CREATE INDEX spring_session_ix3 ON public.spring_session USING btree (principal_name);


--
-- Name: licencia fk3h6s6f6rmhjuxk61c4dkge8x9; Type: FK CONSTRAINT; Schema: public; Owner: user01
--

ALTER TABLE ONLY public.licencia
    ADD CONSTRAINT fk3h6s6f6rmhjuxk61c4dkge8x9 FOREIGN KEY (coleccion_id) REFERENCES public.coleccion(id);


--
-- Name: escuela_licencias fk4b488e7p62topkbbasmrel8do; Type: FK CONSTRAINT; Schema: public; Owner: user01
--

ALTER TABLE ONLY public.escuela_licencias
    ADD CONSTRAINT fk4b488e7p62topkbbasmrel8do FOREIGN KEY (escuela_id) REFERENCES public.escuela(id);


--
-- Name: usuario fkatlwuce9mkhe993kugpd6p7hy; Type: FK CONSTRAINT; Schema: public; Owner: user01
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT fkatlwuce9mkhe993kugpd6p7hy FOREIGN KEY (escuela_id) REFERENCES public.escuela(id);


--
-- Name: licencia fkbk4oy46l87xxtuad3pye5v4mf; Type: FK CONSTRAINT; Schema: public; Owner: user01
--

ALTER TABLE ONLY public.licencia
    ADD CONSTRAINT fkbk4oy46l87xxtuad3pye5v4mf FOREIGN KEY (escuela_id) REFERENCES public.escuela(id);


--
-- Name: escuela_grupos fkcqs8fse8ehemrv845mdlgeae4; Type: FK CONSTRAINT; Schema: public; Owner: user01
--

ALTER TABLE ONLY public.escuela_grupos
    ADD CONSTRAINT fkcqs8fse8ehemrv845mdlgeae4 FOREIGN KEY (escuela_id) REFERENCES public.escuela(id);


--
-- Name: escuela_usuarios fkeh941dtf3rlvl5mw66a5pyapx; Type: FK CONSTRAINT; Schema: public; Owner: user01
--

ALTER TABLE ONLY public.escuela_usuarios
    ADD CONSTRAINT fkeh941dtf3rlvl5mw66a5pyapx FOREIGN KEY (usuarios_id) REFERENCES public.usuario(id);


--
-- Name: escuela_grupos fkggq7g29do2amiahklyuk2r3eu; Type: FK CONSTRAINT; Schema: public; Owner: user01
--

ALTER TABLE ONLY public.escuela_grupos
    ADD CONSTRAINT fkggq7g29do2amiahklyuk2r3eu FOREIGN KEY (grupos_id) REFERENCES public.grupo(id);


--
-- Name: coleccion_documentos fkhudm3inkupd4f2fq3pnm4hr0e; Type: FK CONSTRAINT; Schema: public; Owner: user01
--

ALTER TABLE ONLY public.coleccion_documentos
    ADD CONSTRAINT fkhudm3inkupd4f2fq3pnm4hr0e FOREIGN KEY (documentos_id) REFERENCES public.documento(id);


--
-- Name: escuela_usuarios fko09qplooxpy4lnyjcog2n6epa; Type: FK CONSTRAINT; Schema: public; Owner: user01
--

ALTER TABLE ONLY public.escuela_usuarios
    ADD CONSTRAINT fko09qplooxpy4lnyjcog2n6epa FOREIGN KEY (escuela_id) REFERENCES public.escuela(id);


--
-- Name: escuela_licencias fkoccr8l0kqpj75xmrwi84mk5qv; Type: FK CONSTRAINT; Schema: public; Owner: user01
--

ALTER TABLE ONLY public.escuela_licencias
    ADD CONSTRAINT fkoccr8l0kqpj75xmrwi84mk5qv FOREIGN KEY (licencias_id) REFERENCES public.licencia(id);


--
-- Name: grupo fkowphisb2r1bv52bko9xab07y5; Type: FK CONSTRAINT; Schema: public; Owner: user01
--

ALTER TABLE ONLY public.grupo
    ADD CONSTRAINT fkowphisb2r1bv52bko9xab07y5 FOREIGN KEY (escuela_id) REFERENCES public.escuela(id);


--
-- Name: coleccion_documentos fktre53co4qj56ocdm872ld07s8; Type: FK CONSTRAINT; Schema: public; Owner: user01
--

ALTER TABLE ONLY public.coleccion_documentos
    ADD CONSTRAINT fktre53co4qj56ocdm872ld07s8 FOREIGN KEY (coleccion_id) REFERENCES public.coleccion(id);


--
-- Name: spring_session_attributes spring_session_attributes_fk; Type: FK CONSTRAINT; Schema: public; Owner: user01
--

ALTER TABLE ONLY public.spring_session_attributes
    ADD CONSTRAINT spring_session_attributes_fk FOREIGN KEY (session_primary_id) REFERENCES public.spring_session(primary_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

