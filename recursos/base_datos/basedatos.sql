--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- Name: indicadores; Type: COMMENT; Schema: -; Owner: admin
--

COMMENT ON DATABASE indicadores IS 'Esta base de datos es utilizada para el sistema de Indicadores';


--
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: admin
--

CREATE PROCEDURAL LANGUAGE plpgsql;


ALTER PROCEDURAL LANGUAGE plpgsql OWNER TO admin;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: cat_area; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE cat_area (
    id_area integer NOT NULL,
    descripcion character varying(50) NOT NULL,
    inicial character varying(5) NOT NULL
);


ALTER TABLE public.cat_area OWNER TO admin;

--
-- Name: TABLE cat_area; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON TABLE cat_area IS 'Catalogo de area';


--
-- Name: cat_area_id_area_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE cat_area_id_area_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.cat_area_id_area_seq OWNER TO admin;

--
-- Name: cat_area_id_area_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE cat_area_id_area_seq OWNED BY cat_area.id_area;


--
-- Name: cat_area_id_area_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('cat_area_id_area_seq', 2, false);


--
-- Name: cat_canton; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE cat_canton (
    id_canton integer NOT NULL,
    descripcion character varying(50) NOT NULL,
    id_municipio integer NOT NULL,
    digestyc character varying(10)
);


ALTER TABLE public.cat_canton OWNER TO admin;

--
-- Name: TABLE cat_canton; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON TABLE cat_canton IS 'Catalogo de cantones';


--
-- Name: cat_canton_id_canton_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE cat_canton_id_canton_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.cat_canton_id_canton_seq OWNER TO admin;

--
-- Name: cat_canton_id_canton_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE cat_canton_id_canton_seq OWNED BY cat_canton.id_canton;


--
-- Name: cat_canton_id_canton_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('cat_canton_id_canton_seq', 1, false);


--
-- Name: cat_cargo_funcional; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE cat_cargo_funcional (
    id_cargofuncional integer NOT NULL,
    descripcion character varying(100) NOT NULL
);


ALTER TABLE public.cat_cargo_funcional OWNER TO admin;

--
-- Name: TABLE cat_cargo_funcional; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON TABLE cat_cargo_funcional IS 'Catalogo de cargo funcional';


--
-- Name: cat_cargo_nominal; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE cat_cargo_nominal (
    id_cargonominal integer NOT NULL,
    descripcion character varying(100) NOT NULL
);


ALTER TABLE public.cat_cargo_nominal OWNER TO admin;

--
-- Name: TABLE cat_cargo_nominal; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON TABLE cat_cargo_nominal IS 'Catalogo de cargops nominales';


--
-- Name: cat_cargo_nominal_id_cargonominal_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE cat_cargo_nominal_id_cargonominal_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.cat_cargo_nominal_id_cargonominal_seq OWNER TO admin;

--
-- Name: cat_cargo_nominal_id_cargonominal_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE cat_cargo_nominal_id_cargonominal_seq OWNED BY cat_cargo_nominal.id_cargonominal;


--
-- Name: cat_cargo_nominal_id_cargonominal_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('cat_cargo_nominal_id_cargonominal_seq', 1, false);


--
-- Name: cat_cargofuncional_id_cargofuncional_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE cat_cargofuncional_id_cargofuncional_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.cat_cargofuncional_id_cargofuncional_seq OWNER TO admin;

--
-- Name: cat_cargofuncional_id_cargofuncional_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE cat_cargofuncional_id_cargofuncional_seq OWNED BY cat_cargo_funcional.id_cargofuncional;


--
-- Name: cat_cargofuncional_id_cargofuncional_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('cat_cargofuncional_id_cargofuncional_seq', 1, false);


--
-- Name: cat_departamento; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE cat_departamento (
    id_departamento integer NOT NULL,
    descripcion character varying(100) NOT NULL,
    factor integer,
    gis integer,
    digestyc character varying(10),
    id_region integer NOT NULL,
    abreviatura character varying(5) NOT NULL
);


ALTER TABLE public.cat_departamento OWNER TO admin;

--
-- Name: cat_departamento_id_departamento_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE cat_departamento_id_departamento_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.cat_departamento_id_departamento_seq OWNER TO admin;

--
-- Name: cat_departamento_id_departamento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE cat_departamento_id_departamento_seq OWNED BY cat_departamento.id_departamento;


--
-- Name: cat_departamento_id_departamento_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('cat_departamento_id_departamento_seq', 1, false);


--
-- Name: cat_ecos; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE cat_ecos (
    idestasib integer NOT NULL,
    sibasi integer,
    subred integer,
    id_mun integer,
    tipo character varying(5),
    estasib character varying(150),
    lat integer,
    lng integer,
    nivelmspas integer,
    codigoucsf integer,
    id_region integer,
    id_simmow integer,
    anio_apertura integer
);


ALTER TABLE public.cat_ecos OWNER TO admin;

--
-- Name: cat_estabi; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE cat_estabi (
    idestasibi integer NOT NULL,
    estasib character varying(150),
    udep integer,
    id_mun integer,
    codigof integer
);


ALTER TABLE public.cat_estabi OWNER TO admin;

--
-- Name: cat_establecimiento; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE cat_establecimiento (
    id_establecimiento integer NOT NULL,
    etz integer,
    sib integer,
    subred integer,
    nomsibasi character varying(90) DEFAULT NULL::character varying,
    reg integer,
    dep integer,
    mun integer,
    idmun integer,
    tip character varying(3) DEFAULT NULL::character varying,
    udep integer,
    umun character varying(6) DEFAULT NULL::character varying,
    idtipoestablecimiento character varying(3) DEFAULT NULL::character varying,
    tipo integer,
    descripcion character varying(120) DEFAULT NULL::character varying,
    funchona character varying(3) DEFAULT NULL::character varying,
    establec character varying(18) DEFAULT NULL::character varying,
    codloc character varying(12) DEFAULT NULL::character varying,
    lat double precision,
    lng double precision,
    tipoexpediente character varying(1) DEFAULT 'G'::character varying NOT NULL
);


ALTER TABLE public.cat_establecimiento OWNER TO admin;

--
-- Name: cat_establecimiento_idestablecimiento_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE cat_establecimiento_idestablecimiento_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.cat_establecimiento_idestablecimiento_seq OWNER TO admin;

--
-- Name: cat_establecimiento_idestablecimiento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE cat_establecimiento_idestablecimiento_seq OWNED BY cat_establecimiento.id_establecimiento;


--
-- Name: cat_establecimiento_idestablecimiento_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('cat_establecimiento_idestablecimiento_seq', 1, false);


--
-- Name: cat_establecimiento_2012; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE cat_establecimiento_2012 (
    id_establecimiento integer DEFAULT nextval('cat_establecimiento_idestablecimiento_seq'::regclass) NOT NULL,
    etz integer,
    sib integer,
    subred integer,
    nomsibasi character varying(120) DEFAULT NULL::character varying,
    reg integer,
    dep integer,
    mun integer,
    idmun integer,
    tip character varying(5) DEFAULT NULL::character varying,
    udep integer,
    umun character varying(6) DEFAULT NULL::character varying,
    idtipoestablecimiento character varying(5) DEFAULT NULL::character varying,
    tipo integer,
    descripcion character varying(150) DEFAULT NULL::character varying,
    funchona character varying(5) DEFAULT NULL::character varying,
    establec character varying(18) DEFAULT NULL::character varying,
    codloc character varying(12) DEFAULT NULL::character varying,
    lat double precision,
    lng double precision,
    tipoexpediente character varying(1) DEFAULT 'G'::character varying NOT NULL
);


ALTER TABLE public.cat_establecimiento_2012 OWNER TO admin;

--
-- Name: cat_fuentefinanciamiento; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE cat_fuentefinanciamiento (
    id_fuentefinanciamiento integer NOT NULL,
    descripcion character varying(100) NOT NULL
);


ALTER TABLE public.cat_fuentefinanciamiento OWNER TO admin;

--
-- Name: TABLE cat_fuentefinanciamiento; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON TABLE cat_fuentefinanciamiento IS 'Catalogo de fuente de financiamiento';


--
-- Name: cat_fuentefinanciamiento_id_fuentefinanciamiento_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE cat_fuentefinanciamiento_id_fuentefinanciamiento_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.cat_fuentefinanciamiento_id_fuentefinanciamiento_seq OWNER TO admin;

--
-- Name: cat_fuentefinanciamiento_id_fuentefinanciamiento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE cat_fuentefinanciamiento_id_fuentefinanciamiento_seq OWNED BY cat_fuentefinanciamiento.id_fuentefinanciamiento;


--
-- Name: cat_fuentefinanciamiento_id_fuentefinanciamiento_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('cat_fuentefinanciamiento_id_fuentefinanciamiento_seq', 1, false);


--
-- Name: cat_genero; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE cat_genero (
    id_genero integer NOT NULL,
    descripcion character varying(100) NOT NULL
);


ALTER TABLE public.cat_genero OWNER TO admin;

--
-- Name: cat_genero_id_genero_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE cat_genero_id_genero_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.cat_genero_id_genero_seq OWNER TO admin;

--
-- Name: cat_genero_id_genero_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE cat_genero_id_genero_seq OWNED BY cat_genero.id_genero;


--
-- Name: cat_genero_id_genero_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('cat_genero_id_genero_seq', 2, true);


--
-- Name: cat_municipio; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE cat_municipio (
    id_municipio integer NOT NULL,
    descripcion character varying(100) NOT NULL,
    id_departamento integer,
    depto_digestyc character varying(5),
    munic_digestyc character varying(5),
    abrev_depto character varying(5),
    abrev_municipio character varying(25)
);


ALTER TABLE public.cat_municipio OWNER TO admin;

--
-- Name: TABLE cat_municipio; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON TABLE cat_municipio IS 'catalogo de municiio';


--
-- Name: cat_municipio_id_municipio_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE cat_municipio_id_municipio_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.cat_municipio_id_municipio_seq OWNER TO admin;

--
-- Name: cat_municipio_id_municipio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE cat_municipio_id_municipio_seq OWNED BY cat_municipio.id_municipio;


--
-- Name: cat_municipio_id_municipio_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('cat_municipio_id_municipio_seq', 1, false);


--
-- Name: cat_periodo_indicador; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE cat_periodo_indicador (
    id_periodo_indicador integer NOT NULL,
    descripcion character varying NOT NULL
);


ALTER TABLE public.cat_periodo_indicador OWNER TO admin;

--
-- Name: TABLE cat_periodo_indicador; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON TABLE cat_periodo_indicador IS 'Tabla que almacena los diferentes periodos del indicador';


--
-- Name: COLUMN cat_periodo_indicador.id_periodo_indicador; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN cat_periodo_indicador.id_periodo_indicador IS 'ID del tipo de periodo del indicador';


--
-- Name: COLUMN cat_periodo_indicador.descripcion; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN cat_periodo_indicador.descripcion IS 'Descripcion del Tipo de Periodo del Indicador';


--
-- Name: cat_periodo_indicador_id_periodo_indicador_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE cat_periodo_indicador_id_periodo_indicador_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.cat_periodo_indicador_id_periodo_indicador_seq OWNER TO admin;

--
-- Name: cat_periodo_indicador_id_periodo_indicador_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE cat_periodo_indicador_id_periodo_indicador_seq OWNED BY cat_periodo_indicador.id_periodo_indicador;


--
-- Name: cat_periodo_indicador_id_periodo_indicador_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('cat_periodo_indicador_id_periodo_indicador_seq', 7, true);


--
-- Name: cat_presentacion; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE cat_presentacion (
    id_presentacion integer NOT NULL,
    descripcion character varying(40) NOT NULL
);


ALTER TABLE public.cat_presentacion OWNER TO admin;

--
-- Name: TABLE cat_presentacion; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON TABLE cat_presentacion IS 'Catalogo que contiene las diferentes formas de presentacion de los indicadores';


--
-- Name: COLUMN cat_presentacion.id_presentacion; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN cat_presentacion.id_presentacion IS 'ID de tipo de presentacion';


--
-- Name: COLUMN cat_presentacion.descripcion; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN cat_presentacion.descripcion IS 'Nombre del tipo de presentacion

';


--
-- Name: cat_presentacion_id_presentacion_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE cat_presentacion_id_presentacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.cat_presentacion_id_presentacion_seq OWNER TO admin;

--
-- Name: cat_presentacion_id_presentacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE cat_presentacion_id_presentacion_seq OWNED BY cat_presentacion.id_presentacion;


--
-- Name: cat_presentacion_id_presentacion_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('cat_presentacion_id_presentacion_seq', 7, true);


--
-- Name: cat_programas; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE cat_programas (
    id_programa integer NOT NULL,
    descripcion character varying(100) NOT NULL
);


ALTER TABLE public.cat_programas OWNER TO admin;

--
-- Name: TABLE cat_programas; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON TABLE cat_programas IS 'Catalogo de programas del MINSAL';


--
-- Name: cat_programas_id_programas_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE cat_programas_id_programas_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.cat_programas_id_programas_seq OWNER TO admin;

--
-- Name: cat_programas_id_programas_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE cat_programas_id_programas_seq OWNED BY cat_programas.id_programa;


--
-- Name: cat_programas_id_programas_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('cat_programas_id_programas_seq', 1, false);


--
-- Name: cat_regiones; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE cat_regiones (
    id_region integer NOT NULL,
    descripcion character varying(50) NOT NULL
);


ALTER TABLE public.cat_regiones OWNER TO admin;

--
-- Name: TABLE cat_regiones; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON TABLE cat_regiones IS 'Catalogo de regiones';


--
-- Name: cat_regiones_id_region_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE cat_regiones_id_region_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.cat_regiones_id_region_seq OWNER TO admin;

--
-- Name: cat_regiones_id_region_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE cat_regiones_id_region_seq OWNED BY cat_regiones.id_region;


--
-- Name: cat_regiones_id_region_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('cat_regiones_id_region_seq', 1, false);


--
-- Name: cat_regiones_sinab; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE cat_regiones_sinab (
    id_region_sinab integer NOT NULL,
    descripcion character varying(50) NOT NULL
);


ALTER TABLE public.cat_regiones_sinab OWNER TO admin;

--
-- Name: TABLE cat_regiones_sinab; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON TABLE cat_regiones_sinab IS 'Catalogo de regiones SINAB';


--
-- Name: cat_regiones_sinab_id_region_sinab_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE cat_regiones_sinab_id_region_sinab_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.cat_regiones_sinab_id_region_sinab_seq OWNER TO admin;

--
-- Name: cat_regiones_sinab_id_region_sinab_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE cat_regiones_sinab_id_region_sinab_seq OWNED BY cat_regiones_sinab.id_region_sinab;


--
-- Name: cat_regiones_sinab_id_region_sinab_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('cat_regiones_sinab_id_region_sinab_seq', 1, false);


--
-- Name: cat_sexo; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE cat_sexo (
    id_sexo integer NOT NULL,
    descripcion character varying(50) NOT NULL,
    inicial character varying(5) NOT NULL
);


ALTER TABLE public.cat_sexo OWNER TO admin;

--
-- Name: TABLE cat_sexo; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON TABLE cat_sexo IS 'Catalogo de Sexo';


--
-- Name: cat_sexo_id_sexo_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE cat_sexo_id_sexo_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.cat_sexo_id_sexo_seq OWNER TO admin;

--
-- Name: cat_sexo_id_sexo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE cat_sexo_id_sexo_seq OWNED BY cat_sexo.id_sexo;


--
-- Name: cat_sexo_id_sexo_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('cat_sexo_id_sexo_seq', 2, true);


--
-- Name: cat_sibasi; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE cat_sibasi (
    idsibasi integer NOT NULL,
    nomsibasi character varying(100) NOT NULL,
    id_region integer NOT NULL
);


ALTER TABLE public.cat_sibasi OWNER TO admin;

--
-- Name: cat_sibasi_sinab; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE cat_sibasi_sinab (
    idsibasi_sinab integer NOT NULL,
    nomsibasi character varying(100) NOT NULL,
    id_region integer NOT NULL
);


ALTER TABLE public.cat_sibasi_sinab OWNER TO admin;

--
-- Name: cat_uscf_siban; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE cat_uscf_siban (
    id_establecimiento integer,
    descripcion character(150),
    id_sibasi integer,
    tipo character(2),
    mes_creacion integer
);


ALTER TABLE public.cat_uscf_siban OWNER TO admin;

--
-- Name: catalogos; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE catalogos (
    id_cat integer NOT NULL,
    nombre_tabla character varying NOT NULL,
    nombre_cat character varying(50) NOT NULL,
    campo_llave character varying(50),
    nombre_campo_descripcion character varying(25),
    codigo text,
    cat_padre_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.catalogos OWNER TO admin;

--
-- Name: TABLE catalogos; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON TABLE catalogos IS 'Catalogo de catalogos';


--
-- Name: COLUMN catalogos.id_cat; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN catalogos.id_cat IS 'ID de catalogo';


--
-- Name: COLUMN catalogos.nombre_tabla; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN catalogos.nombre_tabla IS 'Nombre de la tabla que contiene el catalogo';


--
-- Name: COLUMN catalogos.nombre_cat; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN catalogos.nombre_cat IS 'Nombre descriptivo del catalogo';


--
-- Name: COLUMN catalogos.campo_llave; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN catalogos.campo_llave IS 'Nombre del campo llave de la tabla del catalogo';


--
-- Name: COLUMN catalogos.nombre_campo_descripcion; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN catalogos.nombre_campo_descripcion IS 'Nombre del campo descripcion del catalogo';


--
-- Name: COLUMN catalogos.codigo; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN catalogos.codigo IS 'En este campo se guardara el codigo HTM y/o php necesario para incluir el elmento (catalogo) en el formulario dinamico';


--
-- Name: catalogos_id_cat_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE catalogos_id_cat_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.catalogos_id_cat_seq OWNER TO admin;

--
-- Name: catalogos_id_cat_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE catalogos_id_cat_seq OWNED BY catalogos.id_cat;


--
-- Name: catalogos_id_cat_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('catalogos_id_cat_seq', 20, true);


--
-- Name: clasificacion_nivel; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE clasificacion_nivel (
    id_clasificacion_nivel integer NOT NULL,
    descripcion character varying(50) NOT NULL,
    comentario text
);


ALTER TABLE public.clasificacion_nivel OWNER TO admin;

--
-- Name: TABLE clasificacion_nivel; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON TABLE clasificacion_nivel IS 'Tabla que contiene los criterios de clasificacion por nivel de uso';


--
-- Name: COLUMN clasificacion_nivel.id_clasificacion_nivel; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN clasificacion_nivel.id_clasificacion_nivel IS 'ID de criterio de clasificacion por nivel de uso del Indicador';


--
-- Name: COLUMN clasificacion_nivel.descripcion; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN clasificacion_nivel.descripcion IS 'Descripcion del criterio de clasificacion por nivel de uso del indicador';


--
-- Name: COLUMN clasificacion_nivel.comentario; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN clasificacion_nivel.comentario IS 'Una definicion clara del criterio de clasificacion';


--
-- Name: clasificacion_nivel_id_clasificacio_nivel_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE clasificacion_nivel_id_clasificacio_nivel_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.clasificacion_nivel_id_clasificacio_nivel_seq OWNER TO admin;

--
-- Name: clasificacion_nivel_id_clasificacio_nivel_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE clasificacion_nivel_id_clasificacio_nivel_seq OWNED BY clasificacion_nivel.id_clasificacion_nivel;


--
-- Name: clasificacion_nivel_id_clasificacio_nivel_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('clasificacion_nivel_id_clasificacio_nivel_seq', 6, true);


--
-- Name: clasificacion_privacidad; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE clasificacion_privacidad (
    id_clasificacion_privacidad integer NOT NULL,
    descripcion character varying(50) NOT NULL,
    comentario text
);


ALTER TABLE public.clasificacion_privacidad OWNER TO admin;

--
-- Name: TABLE clasificacion_privacidad; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON TABLE clasificacion_privacidad IS 'Clasificacion segun su provacidad';


--
-- Name: COLUMN clasificacion_privacidad.id_clasificacion_privacidad; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN clasificacion_privacidad.id_clasificacion_privacidad IS 'ID del criterio de clasificacion por nivel de privasidad del Indicador';


--
-- Name: COLUMN clasificacion_privacidad.descripcion; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN clasificacion_privacidad.descripcion IS 'Descripcion del criterio de clasificacion por nivel de privasidad';


--
-- Name: COLUMN clasificacion_privacidad.comentario; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN clasificacion_privacidad.comentario IS 'Unla definicion clara del criterio de clasificacion';


--
-- Name: clasificacion_privasidad_id_clasificacion_privacidad_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE clasificacion_privasidad_id_clasificacion_privacidad_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.clasificacion_privasidad_id_clasificacion_privacidad_seq OWNER TO admin;

--
-- Name: clasificacion_privasidad_id_clasificacion_privacidad_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE clasificacion_privasidad_id_clasificacion_privacidad_seq OWNED BY clasificacion_privacidad.id_clasificacion_privacidad;


--
-- Name: clasificacion_privasidad_id_clasificacion_privacidad_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('clasificacion_privasidad_id_clasificacion_privacidad_seq', 5, true);


--
-- Name: clasificacion_tecnica; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE clasificacion_tecnica (
    id_clasificacion_tecnica integer NOT NULL,
    descripcion character varying(50) NOT NULL,
    comentario text
);


ALTER TABLE public.clasificacion_tecnica OWNER TO admin;

--
-- Name: TABLE clasificacion_tecnica; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON TABLE clasificacion_tecnica IS 'Tbla que contiene los criterios de clasificacion tecnica';


--
-- Name: COLUMN clasificacion_tecnica.id_clasificacion_tecnica; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN clasificacion_tecnica.id_clasificacion_tecnica IS 'ID del criterio de clasificacion tecnica';


--
-- Name: COLUMN clasificacion_tecnica.descripcion; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN clasificacion_tecnica.descripcion IS 'Descripcion del criterio de clasificacion tecnica del indicador';


--
-- Name: COLUMN clasificacion_tecnica.comentario; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN clasificacion_tecnica.comentario IS 'Unla definicion clara del criterio de clasificacion';


--
-- Name: clasificacion_tecnica_id_clasificacion_tecnica_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE clasificacion_tecnica_id_clasificacion_tecnica_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.clasificacion_tecnica_id_clasificacion_tecnica_seq OWNER TO admin;

--
-- Name: clasificacion_tecnica_id_clasificacion_tecnica_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE clasificacion_tecnica_id_clasificacion_tecnica_seq OWNED BY clasificacion_tecnica.id_clasificacion_tecnica;


--
-- Name: clasificacion_tecnica_id_clasificacion_tecnica_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('clasificacion_tecnica_id_clasificacion_tecnica_seq', 6, true);


--
-- Name: clasificacion_uso; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE clasificacion_uso (
    id_clasificacion_uso integer NOT NULL,
    descripcion character varying(50) NOT NULL,
    comentario text
);


ALTER TABLE public.clasificacion_uso OWNER TO admin;

--
-- Name: TABLE clasificacion_uso; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON TABLE clasificacion_uso IS 'Catalogo de clasificacion de usoa';


--
-- Name: COLUMN clasificacion_uso.id_clasificacion_uso; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN clasificacion_uso.id_clasificacion_uso IS 'ID del tipo de clasificacion segun su uso del indicador';


--
-- Name: COLUMN clasificacion_uso.descripcion; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN clasificacion_uso.descripcion IS 'Descripcion del criterio de clasificacion dependiendo del uso';


--
-- Name: COLUMN clasificacion_uso.comentario; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN clasificacion_uso.comentario IS 'Una definicion clara del criterio de clasificacion';


--
-- Name: clasificacion_uso_id_clasificacion_uso_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE clasificacion_uso_id_clasificacion_uso_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.clasificacion_uso_id_clasificacion_uso_seq OWNER TO admin;

--
-- Name: clasificacion_uso_id_clasificacion_uso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE clasificacion_uso_id_clasificacion_uso_seq OWNED BY clasificacion_uso.id_clasificacion_uso;


--
-- Name: clasificacion_uso_id_clasificacion_uso_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('clasificacion_uso_id_clasificacion_uso_seq', 6, true);


--
-- Name: conexion; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE conexion (
    id_conexion integer NOT NULL,
    nombre_conexion character varying(100) NOT NULL,
    comentario text,
    ip character varying(15) NOT NULL,
    usuario character varying(25) NOT NULL,
    clave character varying(150) NOT NULL,
    nombre_base_datos character varying(50) NOT NULL,
    id_motor integer NOT NULL,
    puerto character varying(5),
    instancia character varying(50)
);


ALTER TABLE public.conexion OWNER TO admin;

--
-- Name: TABLE conexion; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON TABLE conexion IS 'Tabla que contiene los parametros para hacer la conexion a la base de datos que se quiere consultar';


--
-- Name: COLUMN conexion.id_conexion; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN conexion.id_conexion IS 'ID de la conexion a la base de datos';


--
-- Name: COLUMN conexion.nombre_conexion; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN conexion.nombre_conexion IS 'Nombre de la conexion';


--
-- Name: COLUMN conexion.comentario; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN conexion.comentario IS 'Comentario sobre la conexion, algun comentario en particular o referencia de contacto';


--
-- Name: COLUMN conexion.ip; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN conexion.ip IS 'IP del servidor donde se encuantra la abse de datos

';


--
-- Name: COLUMN conexion.usuario; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN conexion.usuario IS 'Nombre del usuario que tiene acceso a la base de datos';


--
-- Name: COLUMN conexion.clave; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN conexion.clave IS 'Clave asignada al usuario para el acceso a la abse de datos';


--
-- Name: COLUMN conexion.nombre_base_datos; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN conexion.nombre_base_datos IS 'Nombre de la base de datos que contiene la informacion para la consulta';


--
-- Name: COLUMN conexion.id_motor; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN conexion.id_motor IS 'ID del motor de la base de datos de la conexion';


--
-- Name: COLUMN conexion.puerto; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN conexion.puerto IS 'Puerto configurado para la conexion a la Base de Datos';


--
-- Name: COLUMN conexion.instancia; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN conexion.instancia IS 'Instancia de la base de datos

';


--
-- Name: conexion_id_conexion_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE conexion_id_conexion_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.conexion_id_conexion_seq OWNER TO admin;

--
-- Name: conexion_id_conexion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE conexion_id_conexion_seq OWNED BY conexion.id_conexion;


--
-- Name: conexion_id_conexion_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('conexion_id_conexion_seq', 17, true);


--
-- Name: ficha_tecnica; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE ficha_tecnica (
    id_ficha_tecnica integer NOT NULL,
    nombre character varying(150) NOT NULL,
    tema text,
    concepto text,
    objetivo text,
    uso text,
    definicion_operativa text,
    unidad_medida character varying(50) NOT NULL,
    formula character varying(300) NOT NULL,
    id_clasificacion_nivel integer NOT NULL,
    id_clasificacion_tecnica integer,
    id_clasificacion_privacidad integer,
    id_clasificacion_uso integer,
    id_responsable_indicador integer,
    observacion text,
    confiabilidad integer DEFAULT 0 NOT NULL,
    estandar numeric
);


ALTER TABLE public.ficha_tecnica OWNER TO admin;

--
-- Name: TABLE ficha_tecnica; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON TABLE ficha_tecnica IS 'Tabla que contiene la ficha tecnica del indicador';


--
-- Name: COLUMN ficha_tecnica.id_ficha_tecnica; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN ficha_tecnica.id_ficha_tecnica IS 'ID de la ficha tecnica';


--
-- Name: COLUMN ficha_tecnica.nombre; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN ficha_tecnica.nombre IS 'Nombre del indicador';


--
-- Name: COLUMN ficha_tecnica.tema; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN ficha_tecnica.tema IS 'Tema que identifica el indicador';


--
-- Name: COLUMN ficha_tecnica.concepto; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN ficha_tecnica.concepto IS 'Concepto o definicion del indicador';


--
-- Name: COLUMN ficha_tecnica.objetivo; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN ficha_tecnica.objetivo IS 'Objetivo del indicador';


--
-- Name: COLUMN ficha_tecnica.uso; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN ficha_tecnica.uso IS 'Condiciones de uso y limitaciones del indicador';


--
-- Name: COLUMN ficha_tecnica.definicion_operativa; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN ficha_tecnica.definicion_operativa IS 'Definicion operativa del indicador';


--
-- Name: COLUMN ficha_tecnica.unidad_medida; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN ficha_tecnica.unidad_medida IS 'Unidad de medida del indicador';


--
-- Name: COLUMN ficha_tecnica.formula; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN ficha_tecnica.formula IS 'formula o representacion matematica del indicador';


--
-- Name: COLUMN ficha_tecnica.id_clasificacion_nivel; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN ficha_tecnica.id_clasificacion_nivel IS 'Clasificacion del indicador por su nivel de uso';


--
-- Name: COLUMN ficha_tecnica.id_clasificacion_tecnica; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN ficha_tecnica.id_clasificacion_tecnica IS 'Clasificacion tecnica del indicador';


--
-- Name: COLUMN ficha_tecnica.id_clasificacion_privacidad; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN ficha_tecnica.id_clasificacion_privacidad IS 'Clasificacion desun su provacidad del indicador';


--
-- Name: COLUMN ficha_tecnica.id_clasificacion_uso; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN ficha_tecnica.id_clasificacion_uso IS 'Clasificacion por su uso del indicador';


--
-- Name: COLUMN ficha_tecnica.id_responsable_indicador; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN ficha_tecnica.id_responsable_indicador IS 'Responsable del mantenimiento y control del indicador';


--
-- Name: COLUMN ficha_tecnica.observacion; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN ficha_tecnica.observacion IS 'Observaciones o datos adicionales del indicador';


--
-- Name: COLUMN ficha_tecnica.confiabilidad; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN ficha_tecnica.confiabilidad IS 'Confiabilidad del indicador en %';


--
-- Name: COLUMN ficha_tecnica.estandar; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN ficha_tecnica.estandar IS 'Se registra el estandar nacional';


--
-- Name: ficha_tecnica_id_ficha_tecnica_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE ficha_tecnica_id_ficha_tecnica_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.ficha_tecnica_id_ficha_tecnica_seq OWNER TO admin;

--
-- Name: ficha_tecnica_id_ficha_tecnica_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE ficha_tecnica_id_ficha_tecnica_seq OWNED BY ficha_tecnica.id_ficha_tecnica;


--
-- Name: ficha_tecnica_id_ficha_tecnica_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('ficha_tecnica_id_ficha_tecnica_seq', 19, true);


--
-- Name: ficha_tecnica_periodicidad; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE ficha_tecnica_periodicidad (
    id_ficha_tecnica integer NOT NULL,
    id_periodicidad integer NOT NULL
);


ALTER TABLE public.ficha_tecnica_periodicidad OWNER TO admin;

--
-- Name: TABLE ficha_tecnica_periodicidad; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON TABLE ficha_tecnica_periodicidad IS 'Tabla que contiene la relacion de la ficha tecnica con las periodicidades del indicador';


--
-- Name: COLUMN ficha_tecnica_periodicidad.id_ficha_tecnica; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN ficha_tecnica_periodicidad.id_ficha_tecnica IS 'Id de la ficha tecnica';


--
-- Name: COLUMN ficha_tecnica_periodicidad.id_periodicidad; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN ficha_tecnica_periodicidad.id_periodicidad IS 'ID de la periodicidad';


--
-- Name: ficha_tecnica_presentacion; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE ficha_tecnica_presentacion (
    id_ficha_tecnica integer NOT NULL,
    id_presentacion integer NOT NULL
);


ALTER TABLE public.ficha_tecnica_presentacion OWNER TO admin;

--
-- Name: TABLE ficha_tecnica_presentacion; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON TABLE ficha_tecnica_presentacion IS 'Tabla que contiene la relacion entre la ficha tecnica y la presentacion';


--
-- Name: COLUMN ficha_tecnica_presentacion.id_ficha_tecnica; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN ficha_tecnica_presentacion.id_ficha_tecnica IS 'ID de la ficha tecnica';


--
-- Name: COLUMN ficha_tecnica_presentacion.id_presentacion; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN ficha_tecnica_presentacion.id_presentacion IS 'ID de la presentacion';


--
-- Name: ficha_tecnica_variable; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE ficha_tecnica_variable (
    id_ficha_tecnica integer NOT NULL,
    id_variable integer NOT NULL,
    orden integer
);


ALTER TABLE public.ficha_tecnica_variable OWNER TO admin;

--
-- Name: TABLE ficha_tecnica_variable; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON TABLE ficha_tecnica_variable IS 'Tabla que contiene la relacion entre la ficha tecnica y las variables';


--
-- Name: form; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE form (
    id_form integer NOT NULL,
    nombre character varying(100),
    menu_publicacion integer NOT NULL,
    comentario text NOT NULL,
    nombre_tabla character varying(50)
);


ALTER TABLE public.form OWNER TO admin;

--
-- Name: TABLE form; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON TABLE form IS 'Formularios dinamicos';


--
-- Name: form_2; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE form_2 (
    id_2 integer NOT NULL,
    id_establecimiento integer NOT NULL,
    f2v1 integer NOT NULL,
    f2v2 integer NOT NULL,
    f2v3 integer NOT NULL,
    f2v4 integer NOT NULL,
    f2v5 integer NOT NULL,
    f2v6 integer NOT NULL,
    f2v7 integer NOT NULL,
    f2v8 integer NOT NULL
);


ALTER TABLE public.form_2 OWNER TO admin;

--
-- Name: TABLE form_2; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON TABLE form_2 IS 'Formulario utilizado para ingresar la infraestructura de los servicios de Salud por cada establecimiento del Ministerio';


--
-- Name: COLUMN form_2.id_establecimiento; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN form_2.id_establecimiento IS 'Es Establecimiento al que se esta capturando la informacion';


--
-- Name: COLUMN form_2.f2v1; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN form_2.f2v1 IS 'Establecer la Cantidad de Consultorios Medicos que tiene el establecimiento';


--
-- Name: COLUMN form_2.f2v2; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN form_2.f2v2 IS 'Establecer la Cantidad de Consultorios Odontologicos que tiene el establecimiento';


--
-- Name: COLUMN form_2.f2v3; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN form_2.f2v3 IS 'Establecer la Cantidad de Salas de Parto que posee el establecimiento';


--
-- Name: COLUMN form_2.f2v4; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN form_2.f2v4 IS 'Establecer la Cantidad de Sala de Rayos X que tiene el establecimiento';


--
-- Name: COLUMN form_2.f2v5; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN form_2.f2v5 IS 'Establecer la Cantidad de Laboratorios Clinicos que tiene el establecimiento';


--
-- Name: COLUMN form_2.f2v6; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN form_2.f2v6 IS 'Establecer la Cantidad de Laboratorios de Citologia que tiene el establecimiento';


--
-- Name: COLUMN form_2.f2v7; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN form_2.f2v7 IS 'Establecer la Cantidad de Clinicas de colposcopia que tiene el establecimiento';


--
-- Name: COLUMN form_2.f2v8; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN form_2.f2v8 IS 'Establecer la Cantidad de Salas de Ultrasonografia que tiene el establecimiento';


--
-- Name: form_2_id_2_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE form_2_id_2_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.form_2_id_2_seq OWNER TO admin;

--
-- Name: form_2_id_2_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE form_2_id_2_seq OWNED BY form_2.id_2;


--
-- Name: form_2_id_2_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('form_2_id_2_seq', 1, true);


--
-- Name: form_36_id_36_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE form_36_id_36_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.form_36_id_36_seq OWNER TO admin;

--
-- Name: form_36_id_36_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('form_36_id_36_seq', 3, true);


--
-- Name: form_campos; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE form_campos (
    id_form integer NOT NULL,
    nombre_campo_t character varying(30) NOT NULL,
    nombre_campo_f character varying(50) NOT NULL,
    tipo_campo character varying(25) NOT NULL,
    tamano_campo integer NOT NULL,
    orden_campo integer NOT NULL,
    id_campo integer NOT NULL,
    objetivo text,
    llave integer DEFAULT 0 NOT NULL,
    llaveg integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.form_campos OWNER TO admin;

--
-- Name: TABLE form_campos; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON TABLE form_campos IS 'Tabla para almacenas los campos que contiene el formulario';


--
-- Name: COLUMN form_campos.id_form; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN form_campos.id_form IS 'ID de formulario al que pertenece el campo';


--
-- Name: COLUMN form_campos.nombre_campo_t; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN form_campos.nombre_campo_t IS 'Nombre del campo en la tabla(asignado por el sistema)';


--
-- Name: COLUMN form_campos.nombre_campo_f; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN form_campos.nombre_campo_f IS 'Nombre del campo definido por el usuario y es el que aparece en el formulario';


--
-- Name: COLUMN form_campos.tipo_campo; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN form_campos.tipo_campo IS 'Tipo de campo';


--
-- Name: COLUMN form_campos.tamano_campo; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN form_campos.tamano_campo IS 'Largo del campo';


--
-- Name: COLUMN form_campos.orden_campo; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN form_campos.orden_campo IS 'Orden del campo en el formulario';


--
-- Name: COLUMN form_campos.objetivo; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN form_campos.objetivo IS 'Ingresa el objetivo de la existencia del campo';


--
-- Name: COLUMN form_campos.llave; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN form_campos.llave IS '0 si no es llave

1 si es llave';


--
-- Name: form_campos_id_campo_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE form_campos_id_campo_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.form_campos_id_campo_seq OWNER TO admin;

--
-- Name: form_campos_id_campo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE form_campos_id_campo_seq OWNED BY form_campos.id_campo;


--
-- Name: form_campos_id_campo_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('form_campos_id_campo_seq', 17, true);


--
-- Name: form_cat; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE form_cat (
    id_form integer NOT NULL,
    id_cat integer NOT NULL,
    orden integer NOT NULL,
    objetivo text,
    llave integer DEFAULT 0 NOT NULL,
    llaveg integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.form_cat OWNER TO admin;

--
-- Name: TABLE form_cat; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON TABLE form_cat IS 'Tabla que relaciona el formulario con los catalogos

';


--
-- Name: COLUMN form_cat.llave; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN form_cat.llave IS '0  no es llave

1 es llave';


--
-- Name: form_id_form_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE form_id_form_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.form_id_form_seq OWNER TO admin;

--
-- Name: form_id_form_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE form_id_form_seq OWNED BY form.id_form;


--
-- Name: form_id_form_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('form_id_form_seq', 2, true);


--
-- Name: fuente_dato; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE fuente_dato (
    id_fuente_dato integer NOT NULL,
    nombre character varying(100) NOT NULL,
    contacto character varying(100) NOT NULL,
    correo character varying(50) NOT NULL,
    telefono character varying(15) NOT NULL,
    cargo character varying(50) NOT NULL
);


ALTER TABLE public.fuente_dato OWNER TO admin;

--
-- Name: TABLE fuente_dato; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON TABLE fuente_dato IS 'Tabla que almacena las fuentes de los datos institucion';


--
-- Name: COLUMN fuente_dato.id_fuente_dato; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN fuente_dato.id_fuente_dato IS 'ID de la Fuente de datos';


--
-- Name: COLUMN fuente_dato.nombre; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN fuente_dato.nombre IS 'Nombre de la institucion de la fuente de datos';


--
-- Name: COLUMN fuente_dato.contacto; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN fuente_dato.contacto IS 'Nombre de la persona contacto para realizar alguna consulta';


--
-- Name: COLUMN fuente_dato.correo; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN fuente_dato.correo IS 'Correo electronico de la persona contacto';


--
-- Name: COLUMN fuente_dato.telefono; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN fuente_dato.telefono IS 'Numero de telefono de la persona contacto';


--
-- Name: COLUMN fuente_dato.cargo; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN fuente_dato.cargo IS 'Cargo de la persona contacto';


--
-- Name: fuente_dato_id_fuente_dato_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE fuente_dato_id_fuente_dato_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.fuente_dato_id_fuente_dato_seq OWNER TO admin;

--
-- Name: fuente_dato_id_fuente_dato_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE fuente_dato_id_fuente_dato_seq OWNED BY fuente_dato.id_fuente_dato;


--
-- Name: fuente_dato_id_fuente_dato_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('fuente_dato_id_fuente_dato_seq', 8, true);


--
-- Name: grupos_etarios; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE grupos_etarios (
    id_grupo integer NOT NULL,
    descripcion character varying(25) NOT NULL,
    sentencia text
);


ALTER TABLE public.grupos_etarios OWNER TO admin;

--
-- Name: grupos_etarios_id_grupo_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE grupos_etarios_id_grupo_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.grupos_etarios_id_grupo_seq OWNER TO admin;

--
-- Name: grupos_etarios_id_grupo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE grupos_etarios_id_grupo_seq OWNED BY grupos_etarios.id_grupo;


--
-- Name: grupos_etarios_id_grupo_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('grupos_etarios_id_grupo_seq', 6, true);


--
-- Name: motor_bd; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE motor_bd (
    id_motor integer NOT NULL,
    nombre_motor character varying(50) NOT NULL
);


ALTER TABLE public.motor_bd OWNER TO admin;

--
-- Name: TABLE motor_bd; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON TABLE motor_bd IS 'Tabla que almacena los diferentes motores de bases de datos soportados por el sistema';


--
-- Name: COLUMN motor_bd.id_motor; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN motor_bd.id_motor IS 'ID del Motor de la Base de de datos que se utilizara para hacer la conexion';


--
-- Name: COLUMN motor_bd.nombre_motor; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN motor_bd.nombre_motor IS 'Nombre del motor de la base de datos a la cual se hara la conexion';


--
-- Name: motor_BD_id_motor_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE "motor_BD_id_motor_seq"
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public."motor_BD_id_motor_seq" OWNER TO admin;

--
-- Name: motor_BD_id_motor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE "motor_BD_id_motor_seq" OWNED BY motor_bd.id_motor;


--
-- Name: motor_BD_id_motor_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('"motor_BD_id_motor_seq"', 3, true);


--
-- Name: opciones_menu; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE opciones_menu (
    id_menu integer NOT NULL,
    nombre character varying(50) NOT NULL,
    id_padre integer DEFAULT 0 NOT NULL,
    ruta character varying(100) NOT NULL,
    publicado integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.opciones_menu OWNER TO admin;

--
-- Name: TABLE opciones_menu; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON TABLE opciones_menu IS 'Tabla que contiene las opciones de menu';


--
-- Name: COLUMN opciones_menu.id_menu; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN opciones_menu.id_menu IS 'ID de la opcion de menu';


--
-- Name: COLUMN opciones_menu.nombre; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN opciones_menu.nombre IS 'Nombre de la opcion de menu';


--
-- Name: COLUMN opciones_menu.id_padre; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN opciones_menu.id_padre IS 'ID del padre si es una sub opcion';


--
-- Name: COLUMN opciones_menu.ruta; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN opciones_menu.ruta IS 'Ruta del directorio o carpeta donde se encuentran los archovo';


--
-- Name: opciones_menu_id_menu_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE opciones_menu_id_menu_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.opciones_menu_id_menu_seq OWNER TO admin;

--
-- Name: opciones_menu_id_menu_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE opciones_menu_id_menu_seq OWNED BY opciones_menu.id_menu;


--
-- Name: opciones_menu_id_menu_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('opciones_menu_id_menu_seq', 34, true);


--
-- Name: periodos; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE periodos (
    id_periodo integer NOT NULL,
    descripcion character varying(25) NOT NULL,
    sentencia text
);


ALTER TABLE public.periodos OWNER TO admin;

--
-- Name: periodos_id_periodo_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE periodos_id_periodo_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.periodos_id_periodo_seq OWNER TO admin;

--
-- Name: periodos_id_periodo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE periodos_id_periodo_seq OWNED BY periodos.id_periodo;


--
-- Name: periodos_id_periodo_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('periodos_id_periodo_seq', 3, true);


--
-- Name: responsable_dato; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE responsable_dato (
    id_responsable_dato integer NOT NULL,
    nombre character varying(100) NOT NULL,
    contacto character varying(100) NOT NULL,
    correo character varying(50) NOT NULL,
    telefono character varying(15) NOT NULL,
    cargo character varying(50) NOT NULL
);


ALTER TABLE public.responsable_dato OWNER TO admin;

--
-- Name: TABLE responsable_dato; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON TABLE responsable_dato IS 'Tabla que almacena el responsable de los datos institucion';


--
-- Name: COLUMN responsable_dato.id_responsable_dato; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN responsable_dato.id_responsable_dato IS 'ID del responsable del datos';


--
-- Name: COLUMN responsable_dato.nombre; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN responsable_dato.nombre IS 'Nombre de la institucion del responsable del datos';


--
-- Name: COLUMN responsable_dato.contacto; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN responsable_dato.contacto IS 'Nombre de la persona contacto para realizar alguna consulta';


--
-- Name: COLUMN responsable_dato.correo; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN responsable_dato.correo IS 'Correo electronico de la persona contacto';


--
-- Name: COLUMN responsable_dato.telefono; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN responsable_dato.telefono IS 'Numero de telefono de la persona contacto';


--
-- Name: COLUMN responsable_dato.cargo; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN responsable_dato.cargo IS 'Cargo de la persona contacto';


--
-- Name: responsable_dato_id_responsable_dato_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE responsable_dato_id_responsable_dato_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.responsable_dato_id_responsable_dato_seq OWNER TO admin;

--
-- Name: responsable_dato_id_responsable_dato_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE responsable_dato_id_responsable_dato_seq OWNED BY responsable_dato.id_responsable_dato;


--
-- Name: responsable_dato_id_responsable_dato_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('responsable_dato_id_responsable_dato_seq', 9, true);


--
-- Name: responsable_indicador; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE responsable_indicador (
    id_responsable_indicador integer NOT NULL,
    nombre character varying(100) NOT NULL,
    contacto character varying(100) NOT NULL,
    correo character varying(50) NOT NULL,
    telefono character varying(15) NOT NULL,
    cargo character varying(50) NOT NULL
);


ALTER TABLE public.responsable_indicador OWNER TO admin;

--
-- Name: TABLE responsable_indicador; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON TABLE responsable_indicador IS 'Tabla que almacena el responsable de los indicadores institucion';


--
-- Name: COLUMN responsable_indicador.id_responsable_indicador; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN responsable_indicador.id_responsable_indicador IS 'ID del responsable del indicador';


--
-- Name: COLUMN responsable_indicador.nombre; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN responsable_indicador.nombre IS 'Nombre de la institucion del responsable del indicador';


--
-- Name: COLUMN responsable_indicador.contacto; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN responsable_indicador.contacto IS 'Nombre de la persona contacto para realizar alguna consulta';


--
-- Name: COLUMN responsable_indicador.correo; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN responsable_indicador.correo IS 'Correo electronico de la persona contacto';


--
-- Name: COLUMN responsable_indicador.telefono; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN responsable_indicador.telefono IS 'Numero de telefono de la persona contacto';


--
-- Name: COLUMN responsable_indicador.cargo; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN responsable_indicador.cargo IS 'Cargo de la persona contacto';


--
-- Name: responsable_indicador_id_responsable_indicador_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE responsable_indicador_id_responsable_indicador_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.responsable_indicador_id_responsable_indicador_seq OWNER TO admin;

--
-- Name: responsable_indicador_id_responsable_indicador_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE responsable_indicador_id_responsable_indicador_seq OWNED BY responsable_indicador.id_responsable_indicador;


--
-- Name: responsable_indicador_id_responsable_indicador_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('responsable_indicador_id_responsable_indicador_seq', 6, true);


--
-- Name: roles; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE roles (
    id_rol integer NOT NULL,
    rol character varying(30),
    descripcion text
);


ALTER TABLE public.roles OWNER TO admin;

--
-- Name: roles_id_rol_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE roles_id_rol_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.roles_id_rol_seq OWNER TO admin;

--
-- Name: roles_id_rol_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE roles_id_rol_seq OWNED BY roles.id_rol;


--
-- Name: roles_id_rol_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('roles_id_rol_seq', 8, true);


--
-- Name: roles_opciones; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE roles_opciones (
    id_rol integer,
    id_opcion integer
);


ALTER TABLE public.roles_opciones OWNER TO admin;

--
-- Name: sentencia; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE sentencia (
    id_sentencia integer NOT NULL,
    id_conexion integer NOT NULL,
    nombre_consulta character varying(100) NOT NULL,
    sentencia_sql text NOT NULL,
    comentario text
);


ALTER TABLE public.sentencia OWNER TO admin;

--
-- Name: TABLE sentencia; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON TABLE sentencia IS 'Tabla que almacena la sentencia SQL que extrae los datos para la consulta';


--
-- Name: COLUMN sentencia.id_sentencia; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sentencia.id_sentencia IS 'ID de la sentencia SQL que extraera los datos';


--
-- Name: COLUMN sentencia.id_conexion; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sentencia.id_conexion IS 'ID  de la conexion que permitira realizar la consulta';


--
-- Name: COLUMN sentencia.nombre_consulta; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sentencia.nombre_consulta IS 'Nombre de la consulta o nombre que define los daos que se extraera';


--
-- Name: COLUMN sentencia.sentencia_sql; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sentencia.sentencia_sql IS 'Sentencia SQL optimisada para recuperar los datos de la consulta';


--
-- Name: COLUMN sentencia.comentario; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN sentencia.comentario IS 'Algun comentario especifico sobre la consulta';


--
-- Name: sentencia_id_sentencia_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE sentencia_id_sentencia_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.sentencia_id_sentencia_seq OWNER TO admin;

--
-- Name: sentencia_id_sentencia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE sentencia_id_sentencia_seq OWNED BY sentencia.id_sentencia;


--
-- Name: sentencia_id_sentencia_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('sentencia_id_sentencia_seq', 48, true);


--
-- Name: series; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE series (
    id_usuario integer NOT NULL,
    id_indicador integer NOT NULL,
    temporal integer,
    seriex text[],
    seriey numeric(20,6)[],
    tipop character varying(20),
    tem integer,
    id_serie integer NOT NULL,
    texto text
);


ALTER TABLE public.series OWNER TO admin;

--
-- Name: series_id_serie_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE series_id_serie_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.series_id_serie_seq OWNER TO admin;

--
-- Name: series_id_serie_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE series_id_serie_seq OWNED BY series.id_serie;


--
-- Name: series_id_serie_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('series_id_serie_seq', 406, true);


--
-- Name: usuarios; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE usuarios (
    id_usuarios integer NOT NULL,
    usuario character varying(20),
    clave character varying(100) NOT NULL,
    nombre character varying(100) NOT NULL,
    id_rol integer
);


ALTER TABLE public.usuarios OWNER TO admin;

--
-- Name: usuarios_id_usuarios_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE usuarios_id_usuarios_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.usuarios_id_usuarios_seq OWNER TO admin;

--
-- Name: usuarios_id_usuarios_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE usuarios_id_usuarios_seq OWNED BY usuarios.id_usuarios;


--
-- Name: usuarios_id_usuarios_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('usuarios_id_usuarios_seq', 5, true);


--
-- Name: variable_dato; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE variable_dato (
    id_variable integer NOT NULL,
    id_sentencia integer,
    id_web_service integer,
    nombre character varying(200) NOT NULL,
    id_fuente integer NOT NULL,
    id_responsable integer NOT NULL,
    confiabilidad integer DEFAULT 0 NOT NULL,
    iniciales character varying NOT NULL,
    comentario text,
    es_poblacion boolean
);


ALTER TABLE public.variable_dato OWNER TO admin;

--
-- Name: TABLE variable_dato; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON TABLE variable_dato IS 'Tabla que almacena las varaibles o datos que forman el indicador';


--
-- Name: COLUMN variable_dato.id_variable; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN variable_dato.id_variable IS 'ID de la Variable o dato';


--
-- Name: COLUMN variable_dato.id_sentencia; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN variable_dato.id_sentencia IS 'ID de la sentencia que obtiene los datos para el calulo de la variable';


--
-- Name: COLUMN variable_dato.id_web_service; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN variable_dato.id_web_service IS 'ID del web service  que obtiene los datos para el calulo de la variable';


--
-- Name: COLUMN variable_dato.nombre; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN variable_dato.nombre IS 'Nombre de la varaible';


--
-- Name: COLUMN variable_dato.id_fuente; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN variable_dato.id_fuente IS 'ID de la fuente de datos';


--
-- Name: COLUMN variable_dato.id_responsable; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN variable_dato.id_responsable IS 'ID del responsable del dato';


--
-- Name: COLUMN variable_dato.confiabilidad; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN variable_dato.confiabilidad IS 'Confiabilidad del dato';


--
-- Name: COLUMN variable_dato.comentario; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN variable_dato.comentario IS 'Cualquier comentario de relevanvia sobre la variable';


--
-- Name: variable_dato_id_variable_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE variable_dato_id_variable_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.variable_dato_id_variable_seq OWNER TO admin;

--
-- Name: variable_dato_id_variable_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE variable_dato_id_variable_seq OWNED BY variable_dato.id_variable;


--
-- Name: variable_dato_id_variable_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('variable_dato_id_variable_seq', 27, true);


--
-- Name: vitacora; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE vitacora (
    usuario_id integer,
    ip character varying(20),
    fecha date[]
);


ALTER TABLE public.vitacora OWNER TO admin;

--
-- Name: web_service; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE web_service (
    id_web_service integer NOT NULL,
    nombre_web_service character varying(100) NOT NULL,
    url_web_service character varying(150) NOT NULL,
    nombre_func_web_service character varying(100) NOT NULL,
    credenciales_usuario character varying(150) NOT NULL,
    sentencia_consulta character varying(500) NOT NULL,
    comentario text
);


ALTER TABLE public.web_service OWNER TO admin;

--
-- Name: TABLE web_service; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON TABLE web_service IS 'Tabla que contiene los datos necesario para conectarse al web service y poder realizar las consultas';


--
-- Name: COLUMN web_service.id_web_service; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN web_service.id_web_service IS 'ID de la consulta a Web Service';


--
-- Name: COLUMN web_service.nombre_web_service; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN web_service.nombre_web_service IS 'Nombre de la consulta al Web Service';


--
-- Name: COLUMN web_service.url_web_service; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN web_service.url_web_service IS 'URL que direcciona a la consulta al WEb Serivice';


--
-- Name: COLUMN web_service.nombre_func_web_service; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN web_service.nombre_func_web_service IS 'Nombre de la funcion que realiza la consulta al Web Service';


--
-- Name: COLUMN web_service.credenciales_usuario; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN web_service.credenciales_usuario IS 'Credenciales del usuario que tiene derechos de realizar la consulta al Web Service';


--
-- Name: COLUMN web_service.sentencia_consulta; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN web_service.sentencia_consulta IS 'Sentencia que realiza la consulta al Web Service';


--
-- Name: COLUMN web_service.comentario; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN web_service.comentario IS 'Comentarios adicionales acerca del Web Service';


--
-- Name: web_service_id_web_service_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE web_service_id_web_service_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.web_service_id_web_service_seq OWNER TO admin;

--
-- Name: web_service_id_web_service_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE web_service_id_web_service_seq OWNED BY web_service.id_web_service;


--
-- Name: web_service_id_web_service_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('web_service_id_web_service_seq', 1, true);


--
-- Name: id_area; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY cat_area ALTER COLUMN id_area SET DEFAULT nextval('cat_area_id_area_seq'::regclass);


--
-- Name: id_canton; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY cat_canton ALTER COLUMN id_canton SET DEFAULT nextval('cat_canton_id_canton_seq'::regclass);


--
-- Name: id_cargofuncional; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY cat_cargo_funcional ALTER COLUMN id_cargofuncional SET DEFAULT nextval('cat_cargofuncional_id_cargofuncional_seq'::regclass);


--
-- Name: id_cargonominal; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY cat_cargo_nominal ALTER COLUMN id_cargonominal SET DEFAULT nextval('cat_cargo_nominal_id_cargonominal_seq'::regclass);


--
-- Name: id_departamento; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY cat_departamento ALTER COLUMN id_departamento SET DEFAULT nextval('cat_departamento_id_departamento_seq'::regclass);


--
-- Name: id_establecimiento; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY cat_establecimiento ALTER COLUMN id_establecimiento SET DEFAULT nextval('cat_establecimiento_idestablecimiento_seq'::regclass);


--
-- Name: id_fuentefinanciamiento; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY cat_fuentefinanciamiento ALTER COLUMN id_fuentefinanciamiento SET DEFAULT nextval('cat_fuentefinanciamiento_id_fuentefinanciamiento_seq'::regclass);


--
-- Name: id_genero; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY cat_genero ALTER COLUMN id_genero SET DEFAULT nextval('cat_genero_id_genero_seq'::regclass);


--
-- Name: id_municipio; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY cat_municipio ALTER COLUMN id_municipio SET DEFAULT nextval('cat_municipio_id_municipio_seq'::regclass);


--
-- Name: id_periodo_indicador; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY cat_periodo_indicador ALTER COLUMN id_periodo_indicador SET DEFAULT nextval('cat_periodo_indicador_id_periodo_indicador_seq'::regclass);


--
-- Name: id_presentacion; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY cat_presentacion ALTER COLUMN id_presentacion SET DEFAULT nextval('cat_presentacion_id_presentacion_seq'::regclass);


--
-- Name: id_programa; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY cat_programas ALTER COLUMN id_programa SET DEFAULT nextval('cat_programas_id_programas_seq'::regclass);


--
-- Name: id_region; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY cat_regiones ALTER COLUMN id_region SET DEFAULT nextval('cat_regiones_id_region_seq'::regclass);


--
-- Name: id_region_sinab; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY cat_regiones_sinab ALTER COLUMN id_region_sinab SET DEFAULT nextval('cat_regiones_sinab_id_region_sinab_seq'::regclass);


--
-- Name: id_sexo; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY cat_sexo ALTER COLUMN id_sexo SET DEFAULT nextval('cat_sexo_id_sexo_seq'::regclass);


--
-- Name: id_cat; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY catalogos ALTER COLUMN id_cat SET DEFAULT nextval('catalogos_id_cat_seq'::regclass);


--
-- Name: id_clasificacion_nivel; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY clasificacion_nivel ALTER COLUMN id_clasificacion_nivel SET DEFAULT nextval('clasificacion_nivel_id_clasificacio_nivel_seq'::regclass);


--
-- Name: id_clasificacion_privacidad; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY clasificacion_privacidad ALTER COLUMN id_clasificacion_privacidad SET DEFAULT nextval('clasificacion_privasidad_id_clasificacion_privacidad_seq'::regclass);


--
-- Name: id_clasificacion_tecnica; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY clasificacion_tecnica ALTER COLUMN id_clasificacion_tecnica SET DEFAULT nextval('clasificacion_tecnica_id_clasificacion_tecnica_seq'::regclass);


--
-- Name: id_clasificacion_uso; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY clasificacion_uso ALTER COLUMN id_clasificacion_uso SET DEFAULT nextval('clasificacion_uso_id_clasificacion_uso_seq'::regclass);


--
-- Name: id_conexion; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY conexion ALTER COLUMN id_conexion SET DEFAULT nextval('conexion_id_conexion_seq'::regclass);


--
-- Name: id_ficha_tecnica; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY ficha_tecnica ALTER COLUMN id_ficha_tecnica SET DEFAULT nextval('ficha_tecnica_id_ficha_tecnica_seq'::regclass);


--
-- Name: id_form; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY form ALTER COLUMN id_form SET DEFAULT nextval('form_id_form_seq'::regclass);


--
-- Name: id_2; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY form_2 ALTER COLUMN id_2 SET DEFAULT nextval('form_2_id_2_seq'::regclass);


--
-- Name: id_campo; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY form_campos ALTER COLUMN id_campo SET DEFAULT nextval('form_campos_id_campo_seq'::regclass);


--
-- Name: id_fuente_dato; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY fuente_dato ALTER COLUMN id_fuente_dato SET DEFAULT nextval('fuente_dato_id_fuente_dato_seq'::regclass);


--
-- Name: id_grupo; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY grupos_etarios ALTER COLUMN id_grupo SET DEFAULT nextval('grupos_etarios_id_grupo_seq'::regclass);


--
-- Name: id_motor; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY motor_bd ALTER COLUMN id_motor SET DEFAULT nextval('"motor_BD_id_motor_seq"'::regclass);


--
-- Name: id_menu; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY opciones_menu ALTER COLUMN id_menu SET DEFAULT nextval('opciones_menu_id_menu_seq'::regclass);


--
-- Name: id_periodo; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY periodos ALTER COLUMN id_periodo SET DEFAULT nextval('periodos_id_periodo_seq'::regclass);


--
-- Name: id_responsable_dato; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY responsable_dato ALTER COLUMN id_responsable_dato SET DEFAULT nextval('responsable_dato_id_responsable_dato_seq'::regclass);


--
-- Name: id_responsable_indicador; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY responsable_indicador ALTER COLUMN id_responsable_indicador SET DEFAULT nextval('responsable_indicador_id_responsable_indicador_seq'::regclass);


--
-- Name: id_rol; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY roles ALTER COLUMN id_rol SET DEFAULT nextval('roles_id_rol_seq'::regclass);


--
-- Name: id_sentencia; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY sentencia ALTER COLUMN id_sentencia SET DEFAULT nextval('sentencia_id_sentencia_seq'::regclass);


--
-- Name: id_serie; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY series ALTER COLUMN id_serie SET DEFAULT nextval('series_id_serie_seq'::regclass);


--
-- Name: id_usuarios; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY usuarios ALTER COLUMN id_usuarios SET DEFAULT nextval('usuarios_id_usuarios_seq'::regclass);


--
-- Name: id_variable; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY variable_dato ALTER COLUMN id_variable SET DEFAULT nextval('variable_dato_id_variable_seq'::regclass);


--
-- Name: id_web_service; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY web_service ALTER COLUMN id_web_service SET DEFAULT nextval('web_service_id_web_service_seq'::regclass);


--
-- Data for Name: cat_area; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY cat_area (id_area, descripcion, inicial) FROM stdin;
1	Urbano	U
2	Rural	R
\.


--
-- Data for Name: cat_canton; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY cat_canton (id_canton, descripcion, id_municipio, digestyc) FROM stdin;
1	CASCO URBANO	1	0000
2	ASHAPUCO	1	0001
3	CHANCUYO	1	0002
4	CHIPILAPA	1	0003
5	CUYANAUSUL	1	0004
6	EL ANONAL	1	0005
7	EL BARRO	1	0006
8	EL JUNQUILLO	1	0007
9	EL ROBLE	1	0008
10	EL TIGRE	1	0009
11	GUAYALTEPEC	1	0010
12	LA COYOTERA	1	0011
13	LA DANTA	1	0012
14	LA MONTAÑITA	1	0013
15	LAS CHINAMAS	1	0014
16	LLANO DE DOÑA MARIA	1	0015
17	LLANO DE LA LAGUNA O DEL ESPINO	1	0016
18	LOMA DE LA GLORIA	1	0017
19	LOS HUATALES	1	0018
20	LOS MAGUEYES	1	0019
21	LOS TOLES	1	0020
22	NEJAPA	1	0021
23	PALO PIQUE	1	0022
24	RIO FRIO	1	0023
25	SAN LAZARO	1	0024
26	SAN RAMON	1	0025
27	SANTA CRUZ	1	0026
28	SANTA ROSA ACACALCO	1	0027
29	SUNTECUMAT	1	0028
30	TACUBITA	1	0029
31	CASCO URBANO	2	0000
32	PALO VERDE	2	0001
33	QUEZALAPA	2	0002
34	SAITILLAL	2	0003
35	SAN RAMONCITO	2	0004
36	TALTAPANCA	2	0005
37	TIZAPA	2	0006
38	TULAPA	2	0007
39	CASCO URBANO	3	0000
40	EL CHAYAL	3	0001
41	EL TORTUGUERO	3	0002
42	IZCAQUILIO	3	0003
43	JOYA DEL PLATANAR	3	0004
44	JOYA DEL ZAPOTE	3	0005
45	LA ESPERANZA	3	0006
46	LOMA DE ALARCON	3	0007
47	PEPENANCE	3	0008
48	RINCON GRANDE	3	0009
49	SALITRERO	3	0010
50	SAN JUAN EL ESPINO	3	0011
51	SANTA RITA	3	0012
52	TAPACUN	3	0013
53	ZUNCA	3	0014
54	CASCO URBANO	4	0000
55	EL ARCO	4	0001
56	EL LIMO	4	0002
57	EL MOLINO	4	0003
58	EL NARANJITO	4	0004
59	EL TRONCONAL	4	0005
60	LA CEIBA	4	0006
61	LA JOYA DE LOS APANTES	4	0007
62	LOS TABLONES	4	0008
63	SAN JOSE	4	0009
64	SHUCUTITAN	4	0010
65	TEXUSIN CHIRIZO	4	0011
66	CASCO URBANO	5	0000
67	COMAPA	5	0001
68	EL ROSARIO	5	0002
69	SAN ANTONIO	5	0003
70	CASCO URBANO	6	0000
71	CAUTA ABAJO	6	0001
72	CAUTA ARRIBA	6	0002
73	EL CARMEN	6	0003
74	EL ROSARIO	6	0004
75	EL ZARZAL	6	0005
76	ESCALON	6	0006
77	ISTAGAPAN	6	0007
78	LA ESPERANZA	6	0008
79	LA PAZ	6	0009
80	LOS PLATANARES	6	0010
81	LOS PUENTECITOS	6	0011
82	MORRO GRANDE	6	0012
83	SAN ANDRES	6	0013
84	SAN MARTIN	6	0014
85	CASCO URBANO	7	0000
86	BARRA DE SANTIAGO	7	0001
87	EL DIAMANTE	7	0002
88	FAYA	7	0003
89	GUAYAPA ABAJO	7	0004
90	GUAYAPA ARRIBA	7	0005
91	LAS MESAS	7	0006
92	LOS AMATES	7	0007
93	ROSARIO ABAJO	7	0008
94	ROSARIO ARRIBA	7	0009
95	SAN ANTONIO	7	0010
96	SAN JOSE EL NARANJO	7	0011
97	TIHUICHA	7	0012
98	ZAPUA	7	0013
99	CASCO URBANO	8	0000
100	CARA SUCIA	8	0001
101	EL COROZO	8	0002
102	EL JOCOTILLO	8	0003
103	EL SACRAMENTO	8	0004
104	EL ZAPOTE	8	0005
105	GARITA PALMERA	8	0006
106	LA CEIBA	8	0007
107	LA HACHADURA	8	0008
108	SAN BENITO	8	0009
109	CASCO URBANO	9	0000
110	EL CONACASTE	9	0001
111	EL JICARAL	9	0002
112	EL PORTILLO	9	0003
113	LA GUASCOTA	9	0004
114	LAS POZAS	9	0005
115	SAN JUAN BUENAVISTA	9	0006
116	CASCO URBANO	10	0000
117	EL CORTEZ	10	0001
118	EL DURAZNO	10	0002
119	GUACHIPILIN	10	0003
120	LA CONCEPCION	10	0004
121	PULULAPA	10	0005
122	TEXISPULCO	10	0006
123	CASCO URBANO	11	0000
124	AGUA FRIA	11	0001
125	EL CHAGUITE	11	0002
126	EL JICARO	11	0003
127	EL NISPERO	11	0004
128	EL RODEO	11	0005
129	EL ROSARIO	11	0006
130	EL SINCUYO	11	0007
131	LA MONTAÑA	11	0008
132	LA PANDEADURA	11	0009
133	LA PUERTA	11	0010
134	LOMA LARGA	11	0011
135	MONTE HERMOSO	11	0012
136	SAN JUAN	11	0013
137	SAN RAFAEL	11	0014
138	CASCO URBANO	12	0000
139	EL JOBO	12	0001
140	EL PARAISO	12	0002
141	CASCO URBANO	13	0000
142	CASAS DE TEJA	13	0001
143	EL JUTE	13	0002
144	EL ZACAMIL	13	0003
145	LA CRIBA	13	0004
146	LA PARADA	13	0005
147	MONTE VERDE	13	0006
148	PIEDRAS AZULES	13	0007
149	SAN JERONIMO	13	0008
150	SAN JOSE PINALITO	13	0009
151	SAN VICENTE	13	0010
152	TIERRA BLANCA	13	0011
153	CASCO URBANO	14	0000
154	CAÑA BRAVA	14	0001
155	CONACASTE	14	0002
156	CONCEPCION	14	0003
157	EL CERRO	14	0004
158	EL JOCOTON	14	0005
159	EL JUNQUILLO	14	0006
160	EL RESBALADERO	14	0007
161	EL TINTERAL	14	0008
162	EL ZACATAL	14	0009
163	LA JOYA	14	0010
164	LAS PILETAS	14	0011
165	PALO NEGRO	14	0012
166	SAN FELIPE	14	0013
167	SAN JACINTO	14	0014
168	SIETE PRINCIPES	14	0015
169	SOLIMAN	14	0016
170	CASCO URBANO	15	0000
171	AYUTEPEQUE	15	0001
172	BUENOS AIRES	15	0002
173	EL ARADO	15	0003
174	EL COCO	15	0004
175	EL CUJE	15	0005
176	EL DURAZNILLO	15	0006
177	EL PASTE	15	0007
178	EL TANQUE	15	0008
179	GALEANO	15	0009
180	GUACHIPILIN	15	0010
181	LA LIBERTAD	15	0011
182	LAS CRUCES	15	0012
183	LAS FLORES	15	0013
184	MAGDALENA	15	0014
185	OJO DE AGUA	15	0015
186	PIEDRA RAJADA	15	0016
187	PORVENIR JOCOTILLO	15	0017
188	SAN JOSE	15	0018
189	SAN SEBASTIAN	15	0019
190	ZACAMIL	15	0020
191	CASCO URBANO	16	0000
192	EL GUINEO	16	0001
193	EL PEZOTE	16	0002
194	EL RODEO	16	0003
195	LA LAGUNA	16	0004
196	LA PRESA	16	0005
197	LOS PINOS	16	0006
198	MONTE BELLO	16	0007
199	SAN JOSE LAS FLORES	16	0008
200	CASCO URBANO	17	0000
201	EL ROSARIO	17	0001
202	SAN CRISTOBAL	17	0002
203	SAN JUAN CHIQUITO	17	0003
204	SANTA ROSA SENCA	17	0004
205	CASCO URBANO	18	0000
206	EL CARMEN	18	0001
207	HONDURITAS	18	0002
208	LA JOYA	18	0003
209	LA RUDA	18	0004
210	SAN SEBASTIAN	18	0005
211	CASCO URBANO	19	0000
212	ALDEA ZAPOTE	19	0001
213	BELEN GUIJAT	19	0002
214	CAÑAS DULCES	19	0003
215	CAMULIAN	19	0004
216	CARRIZALILLO	19	0005
217	CUYUISCAT	19	0006
218	EL BRUJO	19	0007
219	EL CAPULIN	19	0008
220	EL LIMO	19	0009
221	EL MALPASO	19	0010
222	EL PANAL	19	0011
223	EL ROSARIO	19	0012
224	EL SHISTE	19	0013
225	LA CEIBITA	19	0014
226	LA ISLA	19	0015
227	LA JOYA	19	0016
228	LAS PAVAS	19	0017
229	LAS PIEDRAS	19	0018
230	MATALAPA	19	0019
231	MONTENEGRO	19	0020
232	SAN ANTONIO LA JUNTA	19	0021
233	SAN ANTONIO MASAHUAT	19	0022
234	SAN JERONIMO	19	0023
235	SAN JOSE INGENIO	19	0024
236	SAN JUAN LAS MINAS	19	0025
237	SAN MIGUEL INGENIO	19	0026
238	SANTA RITA	19	0027
239	TAHUILAPA	19	0028
240	TECOMAPA	19	0029
241	CASCO URBANO	20	0000
242	EL TABLON	20	0001
243	LA PIEDRONA	20	0002
244	LOS ANGELES	20	0003
245	CASCO URBANO	21	0000
246	LOS AMATES	21	0001
247	SAN LUIS	21	0002
248	SANTA BARBARA	21	0003
249	SANTA ROSA	21	0004
250	CASCO URBANO	22	0000
251	ALDEA SAN ANTONIO	22	0001
252	AYUTA	22	0002
253	CALZONTES ABAJO	22	0003
254	CALZONTES ARRIBA	22	0004
255	CANTARRANA	22	0005
256	CHUPADERO	22	0006
257	COMECAYO	22	0007
258	CUTUMAY CAMONES	22	0008
259	EL PORTEZUELO	22	0009
260	FLOR AMARILLA ABAJO	22	0010
261	FLOR AMARILLA ARRIBA	22	0011
262	LA EMPALIZADA	22	0012
263	LA MONTAÑITA	22	0013
264	LAS ARADAS	22	0014
265	LOMA ALTA	22	0015
266	LOMA DE SAN MARCELINO	22	0016
267	LOS APOYOS	22	0017
268	MONTE LARGO	22	0018
269	NANCINTEPEQUE	22	0019
270	NATIVIDAD	22	0020
271	OCHUPSE ABAJO	22	0021
272	OCHUPSE ARRIBA	22	0022
273	PALO DE CAMPANA	22	0023
274	PINALITO	22	0024
275	PINALON	22	0025
276	PLANES DE LA LAGUNA	22	0026
277	POTRERILLOS DE LA LAGUNA	22	0027
278	POTRERILLOS DEL MATAZANO	22	0028
279	POTRERO GRANDE ABAJO	22	0029
280	POTRERO GRANDE ARRIBA	22	0030
281	PRIMAVERA	22	0031
282	RANCHADOR	22	0032
283	SAN JUAN BUENAVISTA	22	0033
284	TABLON DEL MATAZANO	22	0034
285	VALLE DEL MATAZANO	22	0035
286	CASCO URBANO	23	0000
287	EL DESPOBLADO	23	0001
288	EL MATAZANO	23	0002
289	LLANO DE LAS MAJADAS	23	0003
290	PALO GALAN	23	0004
291	SAN FCO.APANTA	23	0005
292	SN.JOSE CAPULIN	23	0006
293	CASCO URBANO	24	0000
294	EL FLOR	24	0001
295	GUACAMAYA	24	0002
296	LA DANTA	24	0003
297	LAS PILETAS	24	0004
298	LOS CHILAMATES	24	0005
299	SANTA CRUZ	24	0006
300	CASCO URBANO	25	0000
301	CHILCUYO	25	0001
302	COSTA RICA	25	0002
303	CUJUCUYO	25	0003
304	EL JUTE	25	0004
305	SAN MIGUEL	25	0005
306	SANTO TOMAS	25	0006
307	CASCO URBANO	26	0000
308	EL COYOL	26	0001
309	EL SALAMO	26	0002
310	EL SUNCITA	26	0003
311	METALIO	26	0004
312	MORRO GRANDE	26	0005
313	PUNTA REMEDIOS	26	0006
314	SAN JULIAN	26	0007
315	VALLE NUEVO	26	0008
316	CASCO URBANO	27	0000
317	AZACUALPA	27	0001
318	EL CERRO	27	0002
319	EL GUAYABO	27	0003
320	EL ROSARIO	27	0004
321	LA PUERTA	27	0005
322	LAS CRUCITAS	27	0006
323	LOS MANGOS	27	0007
324	TRES CEIBAS	27	0008
325	VALLE NUEVO	27	0009
326	CASCO URBANO	28	0000
327	AGUA CALIENTE	28	0001
328	CERRO ALTO	28	0002
329	EL CASTAÑO	28	0003
330	EL ZAPOTE	28	0004
331	CERRO DE LAS FLORES	28	0005
332	LOS GRAMALES	28	0006
333	PLAN DE AMAYO	28	0007
334	SUQUIAT	28	0008
335	CASCO URBANO	29	0000
336	AGUA SHUCA	29	0001
337	APANCOYO	29	0002
338	COQUIAMA	29	0003
339	EL BALSAMAR	29	0004
340	SAN LUCAS	29	0005
341	CASCO URBANO	30	0000
342	ACACHAPA	30	0001
343	APANCOYO	30	0002
344	ATILUYA	30	0003
345	EL COROZAL	30	0004
346	EL PARAISO	30	0005
347	LAS PIEDRAS	30	0006
348	MIRAMAR	30	0007
349	PASO DE CANOAS	30	0008
350	CASCO URBANO	31	0000
351	CANGREJERA	31	0001
352	CEIBA DEL CHARCO	31	0002
353	CHORRO ABAJO	31	0003
354	CHORRO ARRIBA	31	0004
355	CRUZ GRANDE	31	0005
356	CUNTAN	31	0006
357	CUYAGUALO	31	0007
358	EL SUNZA	31	0008
359	HUISCOYOLATE	31	0009
360	JOYA DE CEREN	31	0010
361	LA CHAPINA	31	0011
362	LAS HIGUERAS	31	0012
363	LAS LAJAS	31	0013
364	LAS MARIAS	31	0014
365	LOS TUNALMILES	31	0015
366	PIEDRAS PACHAS	31	0016
367	QUEBRADA ESPAÑOLA	31	0017
368	SAN ISIDRO	31	0018
369	SAN LUIS	31	0019
370	SHON SHON	31	0020
371	TALCOMUNCA	31	0021
372	TAPALSHUCUT	31	0022
373	TECUMA	31	0023
374	TESHCAL	31	0024
375	TRES CEIBAS	31	0025
376	CASCO URBANO	32	0000
377	BUENOS AIRES	32	0001
378	LA PUENTE	32	0002
379	LA UNION	32	0003
380	LOS APANTES	32	0004
381	LOS CAÑALES	32	0005
382	LOS NARANJOS	32	0006
383	OJO DE AGUA	32	0007
384	SAN JOSE LA MAJADA	32	0008
385	SAN JUAN DE DIOS	32	0009
386	VALLE NUEVO	32	0010
387	CASCO URBANO	33	0000
388	ANAL ABAJO	33	0001
389	ANAL ARRIBA	33	0002
390	CUSAMALUCO	33	0003
391	EL ARENAL	33	0004
392	EL CANELO	33	0005
393	EL CARRIZAL	33	0006
394	EL CERRITO	33	0007
395	EL CHAPARRON	33	0008
396	LA GUACAMAYA	33	0009
397	PUSHTAN	33	0010
398	SABANA GRANDE	33	0011
399	SABANA SAN JUAN ABAJO	33	0012
400	SABANA SAN JUAN ARRIBA	33	0013
401	SISIMETEPET	33	0014
402	TAJCUILUJLAN	33	0015
403	CASCO URBANO	34	0000
404	ALEMAN	34	0001
405	CONACASTE HERRADO	34	0002
406	EL GUAYABO	34	0003
407	PIEDRA DE MOLER	34	0004
408	CASCO URBANO	35	0000
409	EL PUENTE	35	0001
410	LOS ANIZALES	35	0002
411	CASCO URBANO	36	0000
412	AGUA SANTA	36	0001
413	EL CASTAÑO	36	0002
414	GUAYAPA ABAJO	36	0003
415	GUAYAPA ARRIBA	36	0004
416	LAS HOJAS	36	0005
417	SAN RAMON	36	0006
418	CASCO URBANO	37	0000
419	AGUA SHUCA	37	0001
420	CHILATA	37	0002
421	EL ACHIOTAL	37	0003
422	EL BEBEDERO	37	0004
423	LOS LAGARTOS	37	0005
424	PALO VERDE	37	0006
425	PEÑA BLANCA	37	0007
426	PETACAS	37	0008
427	TIERRA COLORADA	37	0009
428	CASCO URBANO	38	0000
429	CUYUAPA	38	0001
430	EL MATAZANO	38	0002
431	LAS PEÑAS	38	0003
432	SAN RAFAEL	38	0004
433	CASCO URBANO	39	0000
434	EL CARRIZAL	39	0001
435	EL CAULOTE	39	0002
436	EL ZARZAL	39	0003
437	EL ZOPE	39	0004
438	CASCO URBANO	40	0000
439	CHIQUIHUAT	40	0001
440	EL CACAO	40	0002
441	EL EDEN	40	0003
442	EL PRESIDIO	40	0004
443	LA ENSENADA	40	0005
444	LAS DELICIAS	40	0006
445	LAS TABLAS	40	0007
446	LOMA DEL MUERTO	40	0008
447	MIRAVALLES	40	0009
448	SALINAS DE AYACACHAPA	40	0010
449	SANTA EMILIA	40	0011
450	TONALA	40	0012
451	CASCO URBANO	41	0000
452	EL ALMENDRO	41	0001
453	CASCO URBANO	42	0000
454	AGUA FRIA	42	0001
455	AGUA ZARCA	42	0002
456	CERRO GRANDE	42	0003
457	ENCUMBRADO	42	0004
458	OBRAJUELO	42	0005
459	OJOS DE AGUA	42	0006
460	SANTA ROSA	42	0007
461	CASCO URBANO	43	0000
462	CERRO GRANDE	43	0001
463	EL SITIO	43	0002
464	ERAMO O TEQUEQUE	43	0003
465	GUALCIMACA	43	0004
466	LAS VEGAS	43	0005
467	LOS FILOS	43	0006
468	TEOSINTE	43	0007
469	CASCO URBANO	44	0000
470	CUESTA DE MARINA	44	0001
471	EL LLANO	44	0002
472	CASCO URBANO	45	0000
473	GUALCHO	45	0001
474	LAGUNETAS	45	0002
475	LLANO DE LA VIRGEN	45	0003
476	LOS PLANES	45	0004
477	SAN FRANCISCO	45	0005
478	SAN LORENZO	45	0006
479	SAN RAMON	45	0007
480	TALQUEZALAR	45	0008
481	CASCO URBANO	46	0000
482	CANDELARIA	46	0001
483	EL MORRO	46	0002
484	GUACHIPILIN	46	0003
485	LA JUNTA	46	0004
486	CASCO URBANO	47	0000
487	EL CONACASTE	47	0001
488	EL JOCOTILLO	47	0002
489	LLANO GRANDE	47	0003
490	EL ROSARIO	47	0004
491	MONTE REDONDO	47	0005
492	OLOSINGO	47	0006
493	CASCO URBANO	48	0000
494	CHIAPAS	48	0001
495	GUARJILA	48	0002
496	LAS MINAS	48	0003
497	SAN BARTOLO	48	0004
498	SAN JOSE	48	0005
499	UPATORO	48	0006
500	CASCO URBANO	49	0000
501	CHORRO BLANCO	49	0001
502	CUEVITAS	49	0002
503	EL COMUN	49	0003
504	EL OCOTAL	49	0004
505	EL ROSARIO	49	0005
506	GUTIERREZ	49	0006
507	LOS ACHIOTES	49	0007
508	LOS ENCUENTROS	49	0008
509	LOS SITIOS	49	0009
510	CASCO URBANO	50	0000
511	LA TRINIDAD	50	0001
512	PETAPA	50	0002
513	POTRERILLOS	50	0003
514	VAINILLAS	50	0004
515	CASCO URBANO	51	0000
516	EL TABLON	51	0001
517	SANTA BARBARA	51	0002
518	VALLE NUEVO	51	0003
519	CASCO URBANO	52	0000
520	LA CUCHILLA	52	0001
521	LAS PACAYAS	52	0002
522	LOS PRADOS	52	0003
523	PLAN VERDE	52	0004
524	SAN JOSE	52	0005
525	CASCO URBANO	53	0000
526	EL AGUACATAL	53	0001
527	EL GRAMAL	53	0002
528	LAS GRANADILLAS	53	0003
529	LOS HORCONES	53	0004
530	LOS PLANES	53	0005
531	SAN JOSE CALERAS	53	0006
532	SAN JOSE SACARE	53	0007
533	EL TUNEL	53	0008
534	CASCO URBANO	54	0000
535	EL PEPETO	54	0001
536	EL TIGRE	54	0002
537	LAS CAÑAS	54	0003
538	LAS PEÑAS	54	0004
539	LOS TECOMATES	54	0005
540	TALCHALUYA	54	0006
541	TILAPA	54	0007
542	CASCO URBANO	55	0000
543	CONACASTE	55	0001
544	EL SICAHUITE	55	0002
545	LA CEIBA	55	0003
546	LA LAGUNA	55	0004
547	LOS NARANJOS	55	0005
548	SAN JOSE	55	0006
549	CASCO URBANO	56	0000
550	ESCALANTE	56	0001
551	LOS HENRIQUEZ	56	0002
552	PATANERA	56	0003
553	PLAZUELAS	56	0004
554	POTRERILLOS	56	0005
555	QUIPURE	56	0006
556	CASCO URBANO	57	0000
557	CHILAMATES	57	0001
558	EL GAVILAN	57	0002
559	EL ZAPOTE	57	0003
560	LAGUNA SECA	57	0004
561	LAS TABLAS	57	0005
562	POTENCIANA	57	0006
563	POTRERO SULA	57	0007
564	SANTA RITA SIMARRON	57	0008
565	SANTA ROSA	57	0009
566	SUNAPA	57	0010
567	CASCO URBANO	58	0000
568	CARASQUE	58	0001
569	EL SITIO	58	0002
570	EL ZACAMIL	58	0003
571	HACIENDA VIEJA	58	0004
572	HUIZUCAR	58	0005
573	JAGUATALLA	58	0006
574	MANAQUIL	58	0007
575	CASCO URBANO	59	0000
576	COYOLAR	59	0001
577	EL PORTILLO	59	0002
578	EL SITIO	59	0003
579	EL TABLON	59	0004
580	EL ZAPOTAL	59	0005
581	LA MONTAÑITA	59	0006
582	YURIQUE	59	0007
583	CASCO URBANO	60	0000
584	CORRAL FALSO	60	0001
585	LA MONTAÑA	60	0002
586	MONTE REDONDO	60	0003
587	SANTA TERESA	60	0004
588	PLAN DE LAS POZAS	60	0005
589	CASCO URBANO	61	0000
590	COPALIO	61	0001
591	EL ZAPOTE	61	0002
592	SAN BENITO	61	0003
593	SANTA ANA	61	0004
594	CASCO URBANO	62	0000
595	EL GRAMAL	62	0001
596	CASCO URBANO	63	0000
597	JOCOTAN	63	0001
598	LOS LLANITOS	63	0002
599	VALLE DE JESUS	63	0003
600	SAN JUAN DE LA CRUZ	63	0004
601	CASCO URBANO	64	0000
602	LOS MENJIVAR	64	0001
603	LOS ZEPEDAS	64	0002
604	CASCO URBANO	65	0000
605	HIGUERAL	65	0001
606	PLAN DEL HORNO	65	0002
607	TREMEDAL	65	0003
608	LOS NARANJOS	65	0004
609	TEOSINTE	65	0005
610	SAN MIGUELITO	65	0006
611	SUMPUL AVELARES	65	0007
612	SUMPUL CHACONES	65	0008
613	CASCO URBANO	66	0000
614	EL CARMEN	66	0001
615	EL CENTRO	66	0002
616	EL PINAR	66	0003
617	EL ROSARIO	66	0004
618	LAS PILAS	66	0005
619	RIO CHIQUITO	66	0006
620	SANTA ROSA	66	0007
621	CASCO URBANO	67	0000
622	ALVARENGA	67	0001
623	EL MOJON	67	0002
624	EL SICAHUITAL	67	0003
625	LA MONTAÑA	67	0004
626	LOS AMATES	67	0005
627	CASCO URBANO	68	0000
628	CANDELARIA	68	0001
629	CONCEPCION	68	0002
630	LOS GUILLEN	68	0003
631	PORTILLO DEL NORTE	68	0004
632	CASCO URBANO	69	0000
633	ALDEA VIEJA	69	0001
634	HACIENDA	69	0002
635	HACIENDA VIEJA	69	0003
636	LAGUNITA	69	0004
637	LAS LIMAS	69	0005
638	LLANO VERDE	69	0006
639	CASCO URBANO	70	0000
640	EL PITAL	70	0001
641	SANTA CRUZ	70	0002
642	LOS NARANJOS	70	0003
643	CASCO URBANO	71	0000
644	CERRO DE LA CRUZ	71	0001
645	EL MATAZANO	71	0002
646	EL SALITRE	71	0003
647	LOS GUARDADO	71	0004
648	PIEDRAS GORDAS	71	0005
649	CASCO URBANO	72	0000
650	GUARDADO, LOS DESAMPARADOS	72	0001
651	OJOS DE AGUA	72	0002
652	SAN ANTONIO BUENAVISTA	72	0003
653	SAN JOSE LOS SITIOS	72	0004
654	CASCO URBANO	73	0000
655	BARRILLAS	73	0001
656	EL CHILAMATE	73	0002
657	SAN MIGUEL TOBIAS	73	0003
658	SAN NICOLAS PIEDRAS GORDAS	73	0004
659	CASCO URBANO	74	0000
660	AGUAJE ESCONDIDO	74	0001
661	ALDEITA	74	0002
662	LOS APOSENTOS	74	0003
663	CONCEPCION	74	0004
664	EL CARRIZAL	74	0005
665	EL CERRON	74	0006
666	EL SALITRE	74	0007
667	EL TRANSITO	74	0008
668	ESTANZUELAS	74	0009
669	EL IZOTAL	74	0010
670	LOS MARTINEZ	74	0011
671	QUITASOL	74	0012
672	RIO GRANDE DE ALVARADO	74	0013
673	RIO GRANDE DE CARDOZA	74	0014
674	SAN JOSE	74	0015
675	CASCO URBANO	75	0000
676	EL ESPINO	75	0001
677	LA LABRANZA	75	0002
2296	CASCO URBANO	262	0000
678	LA PUERTA DE LA LAGUNA	75	0003
679	SOLEDAD	75	0004
680	SANTA  ELENA	75	0005
681	CASCO URBANO	76	0000
682	EL CONACASTE	76	0001
683	LA ESPERANZA	76	0002
684	LA JOYITA	76	0003
685	LA REFORMA	76	0004
686	LAS CRUCES	76	0005
687	LAS LOMAS	76	0006
688	LOS ACOSTA	76	0007
689	SAN ANDRES	76	0008
690	SANTA LUCIA	76	0009
691	SANTA ROSA	76	0010
692	VERACRUZ	76	0011
693	ZAPOTITAN	76	0012
694	CASCO URBANO	77	0000
695	BOTONCILLAL	77	0001
696	CUYAGUALO	77	0002
697	EL CAPULIN	77	0003
698	EL COBANAL	77	0004
699	EL LIMON	77	0005
700	EL MANGUITO	77	0006
701	ENTRE RIOS	77	0007
702	HACIENDA NUEVA	77	0008
703	LAS ANGOSTURAS	77	0009
704	LAS BRISAS	77	0010
705	LAS MORAS	77	0011
706	LOMA LARGA	77	0012
707	LOURDES	77	0013
708	CASCO URBANO	78	0000
709	EL CONACASTE	78	0001
710	EL FARO	78	0002
711	EL MATAZANO	78	0003
712	EL PEÑON	78	0004
713	EL ROSARIO	78	0005
714	LA SHILA	78	0006
715	SAN ANTONIO	78	0007
716	SAN FRANCISCO POTRERON	78	0008
717	SAN JOSE EL PORVENIR	78	0009
718	CASCO URBANO	79	0000
719	CUERVO ABAJO	79	0001
720	CUERVO ARRIBA	79	0002
721	EL REGADILLO	79	0003
722	EL ZONTE	79	0004
723	JULUPE	79	0005
724	LAS FLORES	79	0006
725	LAS TERMOPILAS	79	0007
726	SANTA LUCIA	79	0008
727	SANTA MARTA	79	0009
728	SIBERIA	79	0010
729	TAQUILLO	79	0011
730	CASCO URBANO	80	0000
731	AMAQUILCO	80	0001
732	LA LIMA	80	0002
733	NAZARETH	80	0003
734	OJOS DE AGUA	80	0004
735	SAN JUAN BUENA VISTA	80	0005
736	TILAPA	80	0006
737	CASCO URBANO	81	0000
738	JUAN HIGINIO O LA CUMBRE	81	0001
739	LA LABOR	81	0002
740	LAS FLORES	81	0003
741	LA MINAS	81	0004
742	CASCO URBANO	82	0000
743	EL NISPERO	82	0001
744	LA ARGENTINA	82	0002
745	LA PERLA	82	0003
746	SAN JOSE EL TABLON	82	0004
747	EL CARRIZO	82	0005
748	CASCO URBANO	83	0000
749	CANGREJERA	83	0001
750	EL CIMARRON	83	0002
751	EL MAJAHUAL	83	0003
752	MELARA	83	0004
753	SAN ALFREDO	83	0005
754	SAN DIEGO	83	0006
755	SAN RAFAEL	83	0007
756	SANTA CRUZ	83	0008
757	TEPEAGUA	83	0009
758	TOLUCA	83	0010
759	CASCO URBANO	84	0000
760	CASCO URBANO	85	0000
761	ALVAREZ	85	0001
762	AYAGUALO	85	0002
763	BUENA VISTA	85	0003
764	EL LIMON	85	0004
765	EL MATAZANO	85	0005
766	EL PROGRESO	85	0006
767	QUEQUEISQUE	85	0007
768	EL SACAZIL	85	0008
769	EL TRIUNFO	85	0009
770	LAS GRANADILLAS	85	0010
771	LOMA LARGA	85	0011
772	LOS AMATES	85	0012
773	LOS PAJALES	85	0013
774	VICTORIA	85	0014
775	CASCO URBANO	86	0000
776	EL SEÑOR	86	0001
777	GIRON	86	0002
778	LAS MERCEDES	86	0003
779	MACANCE	86	0004
780	PLATANILLOS	86	0005
781	PRIMAVERA	86	0006
782	EL PUENTE	86	0007
783	SAN FRANCISCO	86	0008
784	SAN JUAN LOS PLANES	86	0009
785	SANTA ROSA	86	0010
786	SEGURA	86	0011
787	SITIO LOS NEJAPA	86	0012
788	TACACHICO	86	0013
789	CASCO URBANO	87	0000
790	ATEOS	87	0001
791	BUENA VISTA	87	0002
792	LA MONTAÑITA	87	0003
793	CASCO URBANO	88	0000
794	EL ESCALON	88	0001
795	EL MATAZANO	88	0002
796	EL PALOMAR	88	0003
797	LAS DISPENSAS	88	0004
798	TULA	88	0005
799	CASCO URBANO	89	0000
800	AGUA ESCONDIDA	89	0001
801	BARRANCA HONDA	89	0002
802	BUENA VISTA	89	0003
803	CHANMICO	89	0004
804	CHANTUSNENE	89	0005
805	EL ANGEL TALCUALUYA O EL CARMEN	89	0006
806	EL CASTILLO	89	0007
807	EL JABALI	89	0008
808	EL MATAZANO	89	0009
809	JOYA DE CEREN	89	0010
810	LA NUEVA ENCARNACION	89	0011
811	LAS DELICIAS	89	0012
812	LAS GRANADILLAS	89	0013
813	LOMAS DE SANTIAGO	89	0014
814	LOS AMATES	89	0015
815	MINAS DE PLOMO	89	0016
816	NOMBRE DE DIOS	89	0017
817	PITICHORRO	89	0018
818	SAN ANTONIO	89	0019
819	SAN FELIPE	89	0020
820	SAN JOSE LA CUEVA	89	0021
821	SN. NICOLAS LA ENCARNACION	89	0022
822	SN. NICOLAS LOS ENCUENTROS	89	0023
823	SAN PEDRO MARTIR	89	0024
824	SAN PEDRO ORIENTE	89	0025
825	SITIO DEL NIÑO	89	0026
826	SITIO GRANDE	89	0027
827	TEHUICHO	89	0028
828	CASCO URBANO	90	0000
829	EL JICARO	90	0001
830	EL JOCOTE	90	0002
831	LA PUEBLA	90	0003
832	LAS ANONAS	90	0004
833	MASAJAPA	90	0005
834	SAN PEDRO LAS FLORES	90	0006
835	SANTA ROSA	90	0007
836	SANTA TERESA	90	0008
837	CASCO URBANO	91	0000
838	ATIOCOYO	91	0001
839	CAMPANA	91	0002
840	EL TRANSITO	91	0003
841	SAN JUAN MESAS	91	0004
842	MOGOTES	91	0005
843	MONCAGUA	91	0006
844	OBRAJE NUEVO	91	0007
845	SAN ISIDRO	91	0008
846	CASCO URBANO	92	0000
847	BUENOS AIRES	92	0001
848	EL CUERVO	92	0002
849	EL PALMAR	92	0003
850	EL PINAL	92	0004
851	EL SUNZAL	92	0005
852	SAN ALFONSO	92	0006
853	SAN BENITO	92	0007
854	SAN EMILIO	92	0008
855	SAN ISIDRO	92	0009
856	SANTA LUCIA	92	0010
857	TARPEYA	92	0011
858	SAN ANTONIO	92	0012
859	CASCO URBANO	93	0000
860	EL TRANSITO	93	0001
861	LAS QUEBRADAS	93	0002
862	LOS CIPRESES	93	0003
863	LOS LAURELES	93	0004
864	SAN CARLOS	93	0005
865	SAN JOSE LOS SITIOS	93	0006
866	SANTA LUCIA	93	0007
867	CASCO URBANO	94	0000
868	EL ANGEL	94	0001
869	EL MATAZANO	94	0002
870	EL NISPERO	94	0003
871	LOS IZOTES	94	0004
872	MIZATA	94	0005
873	SAN BENITO	94	0006
874	SAN ISIDRO	94	0007
875	SAN MARCOS	94	0008
876	SANTA MARIA MIZATA	94	0009
877	SIHUAPILAPA	94	0010
878	CASCO URBANO	95	0000
879	EL CARRIZO	95	0001
880	EL GUAMO	95	0002
881	EL MOJON	95	0003
882	EL ZACAMIL	95	0004
883	LA JAVIA	95	0005
884	LAS FLORES	95	0006
885	LOS ALPES O EL ZOPE	95	0007
886	LOS LAURELES	95	0008
887	SAN ANTONIO	95	0009
888	TIERRA COLORADA	95	0010
889	CASCO URBANO	96	0000
890	EL BARRILLO	96	0001
891	GUADALUPE	96	0002
892	SAN FRANCISCO	96	0003
893	SAN SEBASTIAN	96	0004
894	CASCO URBANO	97	0000
895	LA FLORIDA	97	0001
896	LAS TUNAS	97	0002
897	LOS MANGOS	97	0003
898	PIÑALITOS	97	0004
899	PISHISHAPA	97	0005
900	CASCO URBANO	98	0000
901	EL ANGEL	98	0001
902	GUADALUPE	98	0002
903	JOYA GALANA	98	0003
904	JOYA GRANDE	98	0004
905	LAS DELICIAS	98	0005
906	SAN NICOLAS	98	0006
907	SUCHINANGO	98	0007
908	TRES CEIBAS	98	0008
909	CASCO URBANO	99	0000
910	EL ZAPOTE	99	0001
911	LOS LLANITOS	99	0002
912	CASCO URBANO	100	0000
913	SAN LUIS MARIONA	100	0001
914	CASCO URBANO	101	0000
915	EL JICARON	101	0001
916	EL MATAZANO	101	0002
917	EL TRONADOR	101	0003
918	LA CABAÑA	101	0004
919	LAS DELICIAS	101	0005
920	LAS VENTANAS	101	0006
921	LOS DOS CERROS	101	0007
922	NATIVIDAD	101	0008
923	POTRERO GRANDE	101	0009
924	SAN ANTONIO GRANDE	101	0010
925	SAN DIEGO	101	0011
926	SAN RAFAEL	101	0012
927	CASCO URBANO	102	0000
928	CALLE NUEVA	102	0001
929	LOMA DE RAMOS	102	0002
930	NANCE VERDE	102	0003
931	SAN CRISTOBAL	102	0004
932	SAN  JERONIMO	102	0005
933	SAN LUCAS	102	0006
934	SANTA BARBARA	102	0007
935	ZACAMIL	102	0008
936	CASCO URBANO	103	0000
937	CHANGALLO	103	0001
938	DOLORES APULO	103	0002
939	SAN BARTOLO	103	0003
940	CASCO URBANO	104	0000
941	CHANCALA	104	0001
942	SAN MIGUEL	104	0002
943	SAN ROQUE	104	0003
944	CASCO URBANO	105	0000
945	ALDEA MERCEDES	105	0001
946	BONETE	105	0002
947	CAMOTEPEQUE	105	0003
948	EL CONACASTE	105	0004
949	EL SALITRE	105	0005
950	GALERA QUEMADA	105	0006
951	SAN JERONIMO LOS PLANES	105	0007
952	TUTULTEPEQUE	105	0008
953	CASCO URBANO	106	0000
954	AMAYON	106	0001
955	AZACUALPA	106	0002
956	EL CEDRO	106	0003
957	EL DIVISADERO	106	0004
958	EL GUAYABO	106	0005
959	LOMA Y MEDIA	106	0006
960	LOS PAJALES	106	0007
961	LOS PALONES	106	0008
962	LOS TRONCONES	106	0009
963	PANCHIMALQUITO	106	0010
964	PLANES DE RENDEROS	106	0011
965	QUEZALAPA	106	0012
966	SAN ISIDRO	106	0013
967	LAS CRUCITAS	106	0014
968	CASCO URBANO	107	0000
969	EL JUTILLO	107	0001
970	CERCO DE PIEDRA	107	0002
971	EL CARRIZAL	107	0003
972	LAS BARROSAS	107	0004
973	PLAN DEL MANGO	107	0005
974	PALO GRANDE	107	0006
975	SAN RAMON	107	0007
976	CASCO URBANO	108	0000
977	CASA DE PIEDRA	108	0001
978	EL PEPETO	108	0002
979	GUADALUPE EL MANGO	108	0003
980	SAN JOSE AHUACATITAN	108	0004
981	CASCO URBANO	109	0000
982	LA FLOR	109	0001
983	EL ROSARIO	109	0002
984	EL SAUCE	109	0003
985	LA PALMA	109	0004
986	LAS ANIMAS	109	0005
987	LAS DELICIAS	109	0006
988	SAN JOSE PRIMERO	109	0007
989	SAN JOSE SEGUNDO	109	0008
990	CASCO URBANO	110	0000
991	CASCO URBANO	111	0000
992	ASINO	111	0001
993	EL MORRO	111	0002
994	JOYA GRANDE	111	0003
995	LA CUCHILLA	111	0004
996	SHALTIPA	111	0005
997	CASCO URBANO	112	0000
998	CAÑA BRAVA	112	0001
999	CHALTEPE	112	0002
1000	CUAPA	112	0003
1001	EL CARMEN	112	0004
1002	EL CIPRES	112	0005
1003	EL GUAJE	112	0006
1004	EL PORVENIR	112	0007
1005	SN. JOSE CASITAS	112	0008
1006	POTRERILLOS	112	0009
1007	CASCO URBANO	113	0000
1008	CASCO URBANO	114	0000
1009	EL ROSARIO	114	0001
1010	EL SAUCE	114	0002
1011	EL TRANSITO	114	0003
1012	LA FUENTE	114	0004
1013	LA UNION	114	0005
1014	LAS FLORES	114	0006
1015	MALACOFF	114	0007
1016	VERACRUZ	114	0008
1017	EL TRIUNFO	114	0009
1018	CASCO URBANO	115	0000
1019	CALLE REAL	115	0001
1020	EL ARENAL	115	0002
1021	EL CALLEJON	115	0003
1022	LA CABAÑA	115	0004
1023	MILINGO	115	0005
1024	PLAN DEL PINO	115	0006
1025	SAN JOSE CORTEZ	115	0007
1026	SAN LAUREANO	115	0008
1027	CASCO URBANO	116	0000
1028	CONCEPCION	116	0001
1029	EL ROSARIO	116	0002
1030	SAN ANTONIO	116	0003
1031	SAN JOSE LA CEIBA	116	0004
1032	SAN JUAN MIRAFLORES ABAJO	116	0005
1033	SAN JUAN MIRAFLORES ARRIBA	116	0006
1034	SAN MIGUEL NANCE VERDE	116	0007
1035	SAN RAFAEL LA LOMA	116	0008
1036	CASCO URBANO	117	0000
1037	CUJUAPA	117	0001
1038	EL CARRIZAL	117	0002
1039	JIÑUCO	117	0003
1040	LA PALMA	117	0004
1041	LOS NARANJOS	117	0005
1042	OJO DE AGUA	117	0006
1043	CASCO URBANO	118	0000
1044	CANDELARIA	118	0001
1045	CONCEPCION	118	0002
1046	EL CARMEN	118	0003
1047	LA PAZ	118	0004
1048	SAN ANTONIO	118	0005
1049	SAN SEBASTIAN	118	0006
1050	SANTA LUCIA	118	0007
1051	CASCO URBANO	119	0000
1052	EL AMATILLO	119	0001
1053	EL CALVARIO	119	0002
1054	SAN MARTIN	119	0003
1055	VERACRUZ	119	0004
1056	CASCO URBANO	120	0000
1057	CANDELARIA	120	0001
1058	CONCEPCION	120	0002
1059	EL CARMEN	120	0003
1060	EL ROSARIO	120	0004
1061	LA SOLEDAD	120	0005
1062	SAN ANDRES	120	0006
1063	SAN ANTONIO	120	0007
1064	SAN JOSE	120	0008
1065	SAN MARTIN	120	0009
1066	SAN NICOLAS	120	0010
1067	CASCO URBANO	121	0000
1068	PALACIOS	121	0001
1069	TACANAGUA	121	0002
1070	CASCO URBANO	122	0000
1071	EL TRIUNFO	122	0001
1072	LAS LOMAS	122	0002
1073	CASCO URBANO	123	0000
1074	LA VIRGEN	123	0001
1075	SAN ANTONIO	123	0002
1076	SAN FRANCISCO	123	0003
1077	SAN JOSE	123	0004
1078	SANTA ANITA	123	0005
1079	SANTA CRUZ	123	0006
1080	CASCO URBANO	124	0000
1081	LAS ANIMAS	124	0001
1082	EL SALITRE	124	0002
1083	LA CRUZ	124	0003
1084	LLANO GRANDE	124	0004
1085	MELENDEZ	124	0005
1086	PALACIOS	124	0006
1087	PIEDRA LABRADA	124	0007
1088	RAMIREZ	124	0008
1089	RODRIGUEZ	124	0009
1090	CASCO URBANO	125	0000
1091	BUENA VISTA	125	0001
1092	BUENOS AIRES	125	0002
1093	EL CARMEN	125	0003
1094	EL ESPINO	125	0004
1095	EL LIMON	125	0005
1096	EL PARAISO	125	0006
1097	EL RODEO	125	0007
1098	HUISILTEPEQUE	125	0008
1099	ISTAGUA	125	0009
1100	LA ESPERANZA	125	0010
1101	LA LOMA	125	0011
1102	MIRAFLORES	125	0012
1103	SAN AGUSTIN	125	0013
1104	SAN FRANCISCO	125	0014
1105	TECOLUCA	125	0015
1106	TECOMATEPEQUE	125	0016
1107	SANTA CRUZ	125	0017
1108	CASCO URBANO	126	0000
1109	CERRO COLORADO	126	0001
1110	COPINOL	126	0002
1111	EL ESPINAL	126	0003
1112	JIBOA	126	0004
1113	PALACIOS	126	0005
1114	SOLEDAD	126	0006
1115	CASCO URBANO	127	0000
1116	SAN AGUSTIN	127	0001
1117	SAN PABLO	127	0002
1118	SAN PEDRO	127	0003
1119	SANTA ISABEL	127	0004
1120	CASCO URBANO	128	0000
1121	BARRIO ABAJO	128	0001
1122	CASCO URBANO	129	0000
1123	ANIMAS	129	0001
1124	BUENA VISTA	129	0002
1125	DELICIAS	129	0003
1126	EL CENTRO	129	0004
1127	MICHAPA	129	0005
1128	ROSALES	129	0006
1129	CASCO URBANO	130	0000
1130	AGUACAYO	130	0001
1131	BUENA VISTA	130	0002
1132	CAULOTE	130	0003
1133	COLIMA	130	0004
1134	CONSOLACION	130	0005
1135	COPAPAYO	130	0006
1136	EL COROZAL	130	0007
1137	EL MOLINO	130	0008
1138	EL ROBLE	130	0009
1139	EL ZAPOTE	130	0010
1140	ESTANZUELAS	130	0011
1141	GUADALUPE	130	0012
1142	HACIENDITA	130	0013
1143	ICHANQUEZO	130	0014
1144	LA BERMUDA	130	0015
1145	LA TRINIDAD	130	0016
1146	LAS DELICIAS	130	0017
1147	MILINGO	130	0018
1148	MIRANDILLA	130	0019
1149	MONTEPEQUE	130	0020
1150	PALACIOS	130	0021
1151	PALO GRANDE	130	0022
1152	PEPEISHTENANGO	130	0023
1153	PLATANAR	130	0024
1154	SAN CRISTOBAL	130	0025
1155	SAN LUCAS	130	0026
1156	TENANGO	130	0027
1157	SAN JUAN	130	0028
1158	CASCO URBANO	131	0000
1159	AJULUCO	131	0001
1160	COPALCHAN	131	0002
1161	CORRAL VIEJO	131	0003
1162	EL PEPETO	131	0004
1163	HUISILTEPEQUE (HDA.NVA.H.)	131	0005
1164	JIÑUCO	131	0006
1165	LA CRUZ	131	0007
1166	ROSARIO PERICO	131	0008
1167	ROSARIO TABLON	131	0009
1168	SANTA ANITA	131	0010
1169	CASCO URBANO	132	0000
1170	SAN ANTONIO	132	0001
1171	SAN ISIDRO	132	0002
1172	CASCO URBANO	133	0000
1173	EL CERRO	133	0001
1174	ASUNCION AMATEPEC	133	0002
1175	EL PEDREGAL	133	0003
1176	TILAPA	133	0004
1177	CASCO URBANO	134	0000
1178	EL CONACASTE	134	0001
1179	EL ESPINO	134	0002
1180	LOS ROMERO	134	0003
1181	VERACRUZ	134	0004
1182	CASCO URBANO	135	0000
1183	SAN ANTONIO	135	0001
1184	SAN LUIS	135	0002
1185	CASCO URBANO	136	0000
1186	CUPINCO	136	0001
1187	EL CHILAMATE	136	0002
1188	JAYUCA	136	0003
1189	JOYA DE GIRON	136	0004
1190	LA ESPERANZA	136	0005
1191	LOS GUACHIPILINES	136	0006
1192	PLANES DE LAS DELICIAS	136	0007
1193	SAN ANTONIO GIRON	136	0008
1194	SAN JOSE BUENAVISTA	136	0009
1195	SAN SEBASTIAN	136	0010
1196	SANTA FE	136	0011
1197	SANTA LUCIA LA BARRANCA	136	0012
1198	SANTO TOMAS	136	0013
1199	CASCO URBANO	137	0000
1200	EL COPINOL	137	0001
1201	LOS ZACATALES	137	0002
1202	CASCO URBANO	138	0000
1203	BELEN	138	0001
1204	EL SOCORRO	138	0002
1205	SAN ANTONIO LA LOMA	138	0003
1206	SN JOSE LA INSTANCIA	138	0004
1207	SAN JOSE LOS SOLARES	138	0005
1208	CASCO URBANO	139	0000
1209	CONCEPCION LOURDES	139	0001
1210	SAN JOSE COSTA RICA	139	0002
1211	CASCO URBANO	140	0000
1212	CANDELARIA	140	0001
1213	CONCEPCION LOS PLANES	140	0002
1214	SAN ANTONIO PANCHIMILAMA	140	0003
1215	SAN JOSE LA MONTAÑA	140	0004
1216	SANTA CRUZ LA VEGA	140	0005
1217	CASCO URBANO	141	0000
1218	EL CHILE	141	0001
1219	EL GOLFO	141	0002
1220	EL PAJAL	141	0003
1221	EL SALTO	141	0004
1222	LA LAGUNETA	141	0005
1223	LA LONGANIZA	141	0006
1224	LAS DELICIAS	141	0007
1225	LAS PIEDRONAS	141	0008
1226	LOS ZACATILLOS	141	0009
1227	TEHUISTE ABAJO	141	0010
1228	TEHUISTE ARRIBA	141	0011
1229	TIERRA COLORADA	141	0012
1230	CASCO URBANO	142	0000
1231	COMALAPA	142	0001
1232	TOBALON	142	0002
1233	VERACRUZ	142	0003
1234	CASCO URBANO	143	0000
1235	LA CRUZ	143	0001
1236	LA ESPERANZA	143	0002
1237	LOS LAURELES	143	0003
1238	CASCO URBANO	144	0000
1239	AMATECAMPO	144	0001
1240	CUCHILLA DE COMALAPA	144	0002
1241	EL PIMIENTAL	144	0003
1242	EL PORVENIR	144	0004
1243	NUEVO EDEN	144	0005
1244	SAN FRANCISCO AMATEPEC	144	0006
1245	TECUALUYA	144	0007
1246	ZAMBOBERA	144	0008
1247	CASCO URBANO	145	0000
1248	SAN BARTOLO	145	0001
1249	SOLEDAD LAS FLORES	145	0002
1250	CASCO URBANO	146	0000
1251	BARAHONA	146	0001
1252	BUENAVISTA	146	0002
1253	DULCE NOMBRE	146	0003
1254	EL ACHIOTAL	146	0004
1255	EL ANGEL	146	0005
1256	EL CARMEN	146	0006
1257	EL PAREDON	146	0007
1258	EL PIMIENTAL	146	0008
1259	EL PORVENIR	146	0009
1260	EL SICAHUITE	146	0010
1261	LAS DELICIAS	146	0011
1262	LAS FLORES	146	0012
1263	LAS HOJAS	146	0013
1264	LAS ISLETAS	146	0014
1265	MARCELINO	146	0015
1266	SANTA MARIA LA SABANA	146	0016
1267	SAN JOSE LUNA	146	0017
1268	CASCO URBANO	147	0000
1269	EL LAZARETO	147	0001
1270	EL ROBLE	147	0002
1271	HACIENDA VIEJA	147	0003
1272	LA CARBONERA	147	0004
1273	LA COMUNIDAD	147	0005
1274	NAHUILSTEPEQUE	147	0006
1275	SAN RAMON	147	0007
1276	CASCO URBANO	148	0000
1277	EL CARAO	148	0001
1278	LA LONGANIZA	148	0002
1279	LA PALMA	148	0003
1280	SAN JERONIMO	148	0004
1281	SAN RAFAEL OBRAJUELO O VALLE VIEJO	148	0005
1282	SAN PEDRO MARTIR	148	0006
1283	CASCO URBANO	149	0000
1284	CONCEPCION	149	0001
1285	EL CHAPERNO	149	0002
1286	EL TRANSITO	149	0003
1287	LOMA LARGA	149	0004
1288	SAN ANTONIO	149	0005
1289	SAN ISIDRO	149	0006
1290	SAN JOSE CARRIZAL	149	0007
1291	CASCO URBANO	150	0000
1292	AMULUNCO	150	0001
1293	CHANCUYO	150	0002
1294	CONCEPCION JALPONGA	150	0003
1295	EL SAUCE	150	0004
1296	JALPONGUITA	150	0005
1297	LA CRUZ DEL MOJON	150	0006
1298	LAS ANIMAS	150	0007
1299	LAS GUARUMAS	150	0008
1300	SAN ANTONIO ABAJO	150	0009
1301	SAN ANTONIO ARRIBA	150	0010
1302	SAN FRANCISCO EL PORFIADO	150	0011
1303	SAN FRANCISCO HACIENDA	150	0012
1304	SAN ANTONIO	150	0013
1305	SAN JOSE ARRIBA	150	0014
1306	SAN JOSE LOMA	150	0015
1307	SAN JOSE  OBRAJITO	150	0016
1308	SAN SEBASTIAN ABAJO	150	0017
1309	SAN SEBASTIAN ARRIBA	150	0018
1310	SANTA CRUZ CHACASTAL	150	0019
1311	SANTA CRUZ LA LOMA	150	0020
1312	SANTA RITA ALMENDRO	150	0021
1313	SANTA TERESA	150	0022
1314	CASCO URBANO	151	0000
1315	LA BASA	151	0001
1316	LAS LAJAS	151	0002
1317	SAN PEDRO LA PALMA	151	0003
1318	CASCO URBANO	152	0000
1319	AGUA ZARCA	152	0001
1320	AMAYO	152	0002
1321	ANIMAS ABAJO	152	0003
1322	ANIMAS ARRIBA	152	0004
1323	AZACUALPA	152	0005
1324	BUENAVISTA ABAJO	152	0006
1325	BUENAVISTA ARRIBA	152	0007
1326	BUENAVISTA ARRINCONADO	152	0008
1327	EL AMATE	152	0009
1328	EL CALLEJON	152	0010
1329	EL CARMEN	152	0011
1330	EL COPINOL	152	0012
1331	EL DESPOBLADO	152	0013
1332	EL ESPINO ABAJO	152	0014
1333	EL ESPINO ARRIBA	152	0015
1334	EL MENEADERO	152	0016
1335	EL SOCORRO	152	0017
1336	TEPECHAME	152	0018
1337	HATO DE LOS REYES	152	0019
1338	EL ZAPOTE	152	0020
1339	LA JOYA	152	0021
1340	LA LUCHA	152	0022
1341	LAS ISLETAS	152	0023
1342	LAS TABLAS	152	0024
1343	LIEVANO	152	0025
1344	LOS MARRANITOS	152	0026
1345	LOS PLATANARES	152	0027
1346	PENITENTE ABAJO	152	0028
1347	PENITENTE ARRIBA	152	0029
1348	PIEDRA GRANDE ABAJO	152	0030
1349	PIEDRA GRANDE ARRIBA	152	0031
1350	PINEDA	152	0032
1351	SAN FRANCISCO LOS REYES	152	0033
1352	SAN JOSECITO	152	0034
1353	SAN JOSE LA MONTAÑA	152	0035
1354	SAN LUCAS	152	0036
1355	SAN MARCOS DE LA CRUZ	152	0037
1356	SAN RAFAEL	152	0038
1357	SAN SEBASTIAN LA ZORRA	152	0039
1358	SANTA LUCIA	152	0040
1359	TIERRA BLANCA	152	0041
1360	ULAPA	152	0042
1361	CASCO URBANO	153	0000
1362	EL CORDONCILLO	153	0001
1363	EL ESCOBAL	153	0002
1364	EL LLANO	153	0003
1365	EL ZAPOTE	153	0004
1366	GUADALUPE LA ZORRA	153	0005
1367	LA ANONA	153	0006
1368	LA CALZADA	153	0007
1369	SAN ANTONIO LOS BLANCOS	153	0008
1370	SAN RAFAEL TASAJERA	153	0009
1371	SAN SEBASTIAN EL CHINGO	153	0010
1372	CASCO URBANO	154	0000
1373	EL CACAO O EL TRANSITO	154	0001
1374	HUILIHUISTE	154	0002
1375	LA ESCOPETA O DULCE NOMBRE	154	0003
1376	SAN ANTONIO	154	0004
1377	SAN BENITO	154	0005
1378	SAN JOSE EL TULE	154	0006
1379	SAN NICOLAS	154	0007
1380	VALLE NUEVO	154	0008
1381	CASCO URBANO	155	0000
1382	AGUA ZARCA	155	0001
1383	EL BAÑADERO	155	0002
1384	TEMPISQUE	155	0003
1385	CASCO URBANO	156	0000
1386	AGUA ZARCA	156	0001
1387	AZACUALPA	156	0002
1388	CALERA	156	0003
1389	CERRO COLORADO	156	0004
1390	MESTIZO	156	0005
1391	EL POTRERO (EL POTRERO EL CARMEN)	156	0006
1392	LA LABOR	156	0007
1393	LAS HUERTAS	156	0008
1394	LOS HOYOS	156	0009
1395	LOS LLANITOS	156	0010
1396	MAQUILISHUAT	156	0011
1397	NANASTEPEQUE	156	0012
1398	ORATORIO	156	0013
1399	SAN FRANCISCO DEL MONTE	156	0014
1400	SAN FRANCISCO IRAHETA	156	0015
1401	SAN JOSE EL MESTIZO	156	0016
1402	SANTA CRUZ	156	0017
1403	SITIO VIEJO	156	0018
1404	CASCO URBANO	157	0000
1405	CALERAS	157	0001
1406	CAROLINA	157	0002
1407	EL PLATANAR	157	0003
1408	LLANO LARGO	157	0004
1409	PALACIOS	157	0005
1410	SAN SEBASTIAN	157	0006
1411	SANTA BARBARA	157	0007
1412	CASCO URBANO	158	0000
1413	EL AMATE	158	0001
1414	IZCATAL	158	0002
1415	LLANO DE LA HACIENDA	158	0003
1416	LOS JOBOS	158	0004
1417	POTRERO DE BATRES	158	0005
1418	POTRERO Y TABLA	158	0006
1419	SAN FRANCISCO	158	0007
1420	CASCO URBANO	159	0000
1421	EL CHUNTE	159	0001
1422	COPINOLAPA	159	0002
1423	CUNCHIQUE	159	0003
1424	CUYANTEPEQUE	159	0004
1425	EL AGUACATE	159	0005
1426	EL VOLCAN	159	0006
1427	LA TRINIDAD	159	0007
1428	LAS MARIAS	159	0008
1429	LLANO GRANDE	159	0009
1430	LOS LLANITOS	159	0010
1431	NOMBRE DE DIOS	159	0011
1432	PIE DE LA CUESTA	159	0012
1433	RIO GRANDE	159	0013
1434	ROJAS	159	0014
1435	SAN GREGORIO	159	0015
1436	SAN LORENZO	159	0016
1437	SAN MARCOS	159	0017
1438	SAN MATIAS	159	0018
1439	SAN NICOLAS	159	0019
1440	SANTA ROSA	159	0020
1441	TEMPISQUE	159	0021
1442	TRONALAGUA	159	0022
1443	CASCO URBANO	160	0000
1444	CONCEPCION	160	0001
1445	EL ZAPOTE	160	0002
1446	SAN ANTONIO BUENAVISTA	160	0003
1447	SAN FRANCISCO ECHEVERRIA	160	0004
1448	SANTA OLAYA	160	0005
1449	SANTA RITA	160	0006
1450	CASCO URBANO	161	0000
1451	AZACUALPA	161	0001
1452	EL CARACOL	161	0002
1453	EL ZAPOTE	161	0003
1454	LA BERMUDA	161	0004
1455	LA UVILLA	161	0005
1456	PARATAO	161	0006
1457	PEÑA BLANCA	161	0007
1458	ROJITAS	161	0008
1459	SAN ANTONIO	161	0009
1460	SAN PEDRO	161	0010
1461	SANTA MARTA	161	0011
1462	CASCO URBANO	162	0000
1463	CAÑAFISTULA	162	0001
1464	CHAPELCORO	162	0002
1465	CURAREN	162	0003
1466	EL RINCON	162	0004
1467	NIQUERESQUE	162	0005
1468	SAN CARLOS	162	0006
1469	CASCO URBANO	163	0000
1470	CALDERAS	163	0001
1471	CUTUMAYO	163	0002
1472	EL GUAYABO	163	0003
1473	LAS MINAS	163	0004
1474	SAN FELIPE	163	0005
1475	SAN JACINTO	163	0006
1476	SAN JOSE ALMENDROS	163	0007
1477	SAN JUAN DE MERINO	163	0008
1478	SAN NICOLAS	163	0009
1479	SAN PEDRO	163	0010
1480	CASCO URBANO	164	0000
1481	JOYA DE MUNGUIA	164	0001
1482	SAN ANTONIO LOS RANCHOS	164	0002
1483	SAN BENITO PIEDRA GORDA	164	0003
1484	SAN EMIGDIO EL TABLON	164	0004
1485	SAN FRANCISCO AGUAS AGRIAS	164	0005
1486	SAN JOSE CARBONEL	164	0006
1487	CASCO URBANO	165	0000
1488	CANDELARIA	165	0001
1489	CERRO GRANDE	165	0002
1490	CASCO URBANO	166	0000
1491	AGUA HELADA	166	0001
1492	EL ROSARIO	166	0002
1493	EL TORTUGUERO	166	0003
1494	SAN JERONIMO	166	0004
1495	SAN JUAN DE MERINO	166	0005
1496	SANTA ROSA	166	0006
1497	CASCO URBANO	167	0000
1498	EL REFUGIO	167	0001
1499	IZCANALES	167	0002
1500	LOS RODRIGUEZ	167	0003
1501	TALPETATES (SAN JUAN TALPETATES)	167	0004
1502	CASCO URBANO	168	0000
1503	AMATITAN ABAJO	168	0001
1504	AMATITAN ARRIBA	168	0002
1505	CERRO DE SAN PEDRO	168	0003
1506	SAN ESTEBAN	168	0004
1507	SAN ILDEFONSO	168	0005
1508	SN. JACINTO LA BURRERA	168	0006
1509	SANTA CATARINA	168	0007
1510	CASCO URBANO	169	0000
1511	CANDELARIA LEMPA	169	0001
1512	GUACHIPILIN	169	0002
1513	LAJAS Y CANOAS	169	0003
1514	SAN FRANCISCO	169	0004
1515	SAN LORENZO	169	0005
1516	SAN PABLO CAÑALES	169	0006
1517	CASCO URBANO	170	0000
1518	LA CRUZ	170	0001
1519	LAS ANIMAS	170	0002
1520	SAN FRANCISCO	170	0003
1521	SANTA LUCIA	170	0004
1522	CASCO URBANO	171	0000
1523	EL PARAISO	171	0001
1524	EL PORVENIR AGUACAYO	171	0002
1525	LA ESPERANZA	171	0003
1526	LA LABOR	171	0004
1527	LAS ROSAS	171	0005
1528	LOS LAURELES	171	0006
1529	SAN FRANCISCO	171	0007
1530	SANTA ELENA	171	0008
1531	SANTA TERESA	171	0009
1532	CASCO URBANO	172	0000
1533	ANTON FLORES	172	0001
1534	CHUCUYO	172	0002
1535	DOS QUEBRADAS	172	0003
1536	EL CARACOL	172	0004
1537	EL REBELDE	172	0005
1538	LA JOYA	172	0006
1539	LA SOLEDAD	172	0007
1540	LEON DE PIEDRA	172	0008
1541	LLANO DE ACHICHILCO	172	0009
1542	LOS LAURELES	172	0010
1543	LOS POZOS	172	0011
1544	OBRAJUELO LEMPA	172	0012
1545	PARRAS LEMPA	172	0013
1546	SAN ANTONIO ACHICHILQUITO	172	0014
1547	SAN ANTONIO CAMINOS	172	0015
1548	SAN ANTONIO TRAS EL CERRO	172	0016
1549	SAN BARTOLO ICHANMICO	172	0017
1550	SAN DIEGO	172	0018
1551	SAN FRANCISCO CHAMOCO	172	0019
1552	SAN JACINTO	172	0020
1553	SAN JOSE RIO FRIO	172	0021
1554	SAN JUAN DE LA BUENAVISTA	172	0022
1555	SAN RAFAEL SAN DIEGO	172	0023
1556	SANTA GERTRUDIS	172	0024
1557	VOLCAN OPICO	172	0025
1558	EL MARQUEZADO	172	0026
1559	CASCO URBANO	173	0000
1560	BARRIO NUEVO	173	0001
1561	EL ARCO	173	0002
1562	EL CAMPANARIO	173	0003
1563	EL CARAO	173	0004
1564	EL COYOLITO	173	0005
1565	EL PACUN	173	0006
1566	EL PALOMAR	173	0007
1567	EL PERICAL	173	0008
1568	EL PORRILLO (PORTILLO)	173	0009
1569	EL PUENTE	173	0010
1570	EL SOCORRO	173	0011
1571	LA ESPERANZA	173	0012
1572	LAS ANONAS	173	0013
1573	LAS MESAS	173	0014
1574	SAN ANDRES ACHIOTES	173	0015
1575	SAN BENITO	173	0016
1576	SAN CARLOS	173	0017
1577	SAN FERNANDO	173	0018
1578	SAN FRANCISCO ANGULO	173	0019
1579	SAN JOSE LLANO GRANDE	173	0020
1580	SAN NICOLAS LEMPA	173	0021
1581	SAN RAMON GRIFAL	173	0022
1582	SANTA BARBARA	173	0023
1583	SANTA CRUZ	173	0024
1584	CASCO URBANO	174	0000
1585	CONCEPCION DE CAÑAS	174	0001
1586	LA VIRGEN	174	0002
1587	LOMA ALTA	174	0003
1588	CASCO URBANO	175	0000
1589	EL CARMEN	175	0001
1590	MOLINEROS	175	0002
1591	SAN ANTONIO JIBOA	175	0003
1592	SAN ISIDRO	175	0004
1593	SAN JERONIMO LIMON	175	0005
1594	SAN JOSE BORJA	175	0006
1595	SAN JUAN BUENA VISTA	175	0007
1596	SAN PEDRO AGUA CALIENTE	175	0008
1597	CASCO URBANO	176	0000
1598	APASTEPEQUE	176	0001
1599	LA PEÑA	176	0002
1600	LAS CASITAS	176	0003
1601	MONTAÑITA	176	0004
1602	QUEBRACHO	176	0005
1603	SAN JUAN	176	0006
1604	YOMO	176	0007
1605	ZAPOTILLO	176	0008
1606	CASCO URBANO	177	0000
1607	COLON	177	0001
1608	CONCEPCION	177	0002
1609	EL COROZAL	177	0003
1610	EL TABLON	177	0004
1611	LA UNION	177	0005
1612	LAS DELICIAS	177	0006
1613	LAS PILETAS	177	0007
1614	TALPETATES	177	0008
1615	SAN FELIPE	177	0009
1616	SAN FRANCISCO	177	0010
1617	SAN ISIDRO	177	0011
1618	SAN JOSE	177	0012
1619	SAN JUAN LOMA ALTA	177	0013
1620	SAN LORENZO	177	0014
1621	SANTA CRUZ	177	0015
1622	VIRGINIA	177	0016
1623	CASCO URBANO	178	0000
1624	EL POZON	178	0001
1625	CASCO URBANO	179	0000
1626	EL CAÑAL	179	0001
1627	EL PARAIZAL	179	0002
1628	EL PORVENIR	179	0003
1629	HACIENDA NUEVA	179	0004
1630	LA ANCHILA	179	0005
1631	LA DANTA	179	0006
1632	SAN ANTONIO	179	0007
1633	SAN FELIPE	179	0008
1634	SAN ILDEFONSO	179	0009
1635	CASCO URBANO	180	0000
1636	EL JICARITO	180	0001
1637	EL PALON	180	0002
1638	LA PALMERA	180	0003
1639	SAN ANTONIO	180	0004
1640	CASCO URBANO	181	0000
1641	ANALCO	181	0001
1642	LA CEIBA	181	0002
1643	LOS ENCUENTROS	181	0003
1644	MACULIS	181	0004
1645	PIEDRA ANCHA	181	0005
1646	CASCO URBANO	182	0000
1647	CONDADILLO	182	0001
1648	EL CARAGUAL	182	0002
1649	EL OJUSHTE	182	0003
1650	EL TECOMATAL	182	0004
1651	ESCARBADERO	182	0005
1652	LA CRUZ	182	0006
1653	POTRERO DE JOCO	182	0007
1654	SAN PEDRO	182	0008
1655	SITIO DE SAN ANTONIO	182	0009
1656	CASCO URBANO	183	0000
1657	AGUACAYO	183	0001
1658	BOLIVAR	183	0002
1659	CABOS NEGROS	183	0003
1660	CALIFORNIA	183	0004
1661	CARRIZAL	183	0005
1662	CEIBA GACHA	183	0006
1663	CRUZADILLA DE SAN JUAN	183	0007
1664	LAS DELICIAS	183	0008
1665	EL CARMEN	183	0009
1666	EL CASTAÑO	183	0010
1667	EL COYOLITO	183	0011
1668	EL MARILLO	183	0012
1669	EL PARAISO	183	0013
1670	HULE CHACHO	183	0014
1671	ISLA DE MENDEZ	183	0015
1672	LA CANOA	183	0016
1673	LA CONCORDIA	183	0017
1674	LA MONTAÑA	183	0018
1675	LA NORIA	183	0019
1676	LA TIRANA	183	0020
1677	LAS FLORES	183	0021
1678	LOS CAMPOS	183	0022
1679	LOS LIMONES	183	0023
1680	LOS TRES CACHORROS	183	0024
1681	NUEVA CALIFORNIA	183	0025
1682	PUERTO LOS AVALOS	183	0026
1683	EL ROQUINTE	183	0027
1684	SALINAS DE SISIGUAYO	183	0028
1685	SALINAS EL POTRERO	183	0029
1686	SAN ANTONIO POTRERILLOS	183	0030
1687	SAN JOSE O HDA. LA CARRERA	183	0031
1688	SAN JUAN DE LETRAN	183	0032
1689	SAN JUAN DEL GOZO	183	0033
1690	SAN JUDAS	183	0034
1691	SAN MARCOS LEMPA	183	0035
1692	SAN PEDRO	183	0036
1693	TABURETE JAGUAL	183	0037
1694	TABURETE LOS CLAROS	183	0038
1695	TIERRA BLANCA, NVA. ESPARTA	183	0039
1696	ZAMORAN	183	0040
1697	LAS MESITAS	183	0041
1698	CASCO URBANO	184	0000
1699	EL AMATON	184	0001
1700	EL CHAGUITE	184	0002
1701	EL NISPERO	184	0003
1702	LLANO EL CHILAMATE	184	0004
1703	LLANO GRANDE DE LAS PIEDRAS	184	0005
1704	LOMA DE LA CRUZ	184	0006
1705	PLAN GRANDE	184	0007
1706	TEPESQUILLO ALTO	184	0008
1707	TEPESQUILLO BAJO	184	0009
1708	CASCO URBANO	185	0000
1709	EL JICARO	185	0001
1710	EL JUTAL	185	0002
1711	EL LLANO	185	0003
1712	EL PROGRESO	185	0004
1713	EL ZAPOTE	185	0005
1714	LA CRUZ	185	0006
1715	SUMARIA	185	0007
1716	CASCO URBANO	186	0000
1717	EL CAULOTE	186	0001
1718	EL JICARO	186	0002
1719	EL JOCOTILLO	186	0003
1720	LA MONTAÑITA	186	0004
1721	LA PUERTA	186	0005
1722	LOS HORCONES	186	0006
1723	LOS TALNETES	186	0007
1724	SAN BENITO	186	0008
1725	SANTA ANITA	186	0009
1726	CASCO URBANO	187	0000
1727	AZACUALPIA DE GUALCHO	187	0001
1728	AZACUALPIA DE JOCO	187	0002
1729	EL AMATILLO	187	0003
1730	JOCOMONTIQUE	187	0004
1731	LA ISLETA	187	0005
1732	LA PALOMILLA	187	0006
1733	LAS LLAVES	187	0007
1734	LEPAZ	187	0008
1735	NUEVO CARRIZAL	187	0009
1736	POTRERO DE JOCO	187	0010
1737	SAN JOSE	187	0011
1738	CASCO URBANO	188	0000
1739	EL DELIRIO	188	0001
1740	EL PALMITAL	188	0002
1741	JOYA DEL PILAR	188	0003
1742	LA BREÑA	188	0004
1743	LA POZA	188	0005
1744	LAS TRANCAS	188	0006
1745	CASCO URBANO	189	0000
1746	CORRAL DE MULAS	189	0001
1747	EL ESPIRITU SANTO	189	0002
1748	MADRESAL	189	0003
1749	SITIO DE SANTA LUCIA	189	0004
1750	CASCO URBANO	190	0000
1751	BUENOS AIRES	190	0001
1752	EL CEDRO	190	0002
1753	EL COROZO	190	0003
1754	EL JICARO	190	0004
1755	EL JOCOTE	190	0005
1756	GALINGAGUA	190	0006
1757	JOBAL ARROZALES	190	0007
1758	LAS CEIBAS	190	0008
1759	LA MORA	190	0009
1760	LA QUESERA	190	0010
1761	LINARES O CAULOTE	190	0011
1762	LOS ARRAZOLES	190	0012
1763	LOS EUCALIPTOS	190	0013
1764	LOS PLANES	190	0014
1765	NOMBRE DE DIOS	190	0015
1766	TRES CALLES O SAN JOAQUIN	190	0016
1767	CASCO URBANO	191	0000
1768	EL ACEITUNO	191	0001
1769	EL SEMILLERO	191	0002
1770	LA CARIDAD	191	0003
1771	LA TRONCONADA	191	0004
1772	LAS CHARCAS	191	0005
1773	LOS ESPINOS	191	0006
1774	CASCO URBANO	192	0000
1775	IGLESIA VIEJA	192	0001
1776	MUNDO NUEVO	192	0002
1777	SAN FRANCISCO	192	0003
1778	CASCO URBANO	193	0000
1779	EL AMATE	193	0001
1780	EL NANZAL	193	0002
1781	EL NISPERAL	193	0003
1782	EL VOLCAN	193	0004
1783	JOYA ANCHA ABAJO	193	0005
1784	JOYA ANCHA ARRIBA	193	0006
1785	LAS CRUCES	193	0007
1786	PIEDRA DE AGUA	193	0008
1787	EL REBALCE	193	0009
1788	CASCO URBANO	194	0000
1789	EL PALMO	194	0001
1790	EL TABLON	194	0002
1791	EL ZUNGANO	194	0003
1792	JOBAL HORNOS	194	0004
1793	LA CRUZ	194	0005
1794	LA PEÑA	194	0006
1795	LOS HORCONES	194	0007
1796	LOS HORNOS	194	0008
1797	LOS RIOS	194	0009
1798	CASCO URBANO	195	0000
1799	MEJICAPA	195	0001
1800	SAN FRANCISCO	195	0002
1801	CASCO URBANO	196	0000
1802	BATRES	196	0001
1803	EL MARQUEZADO	196	0002
1804	EL TIGRE	196	0003
1805	LAS FLORES	196	0004
1806	PLAYITAS	196	0005
1807	LOMAS DE LOS GONZALEZ	196	0006
1808	CASCO URBANO	197	0000
1809	CERRO VERDE	197	0001
1810	EL JICARO	197	0002
1811	LOS CHAPETONES	197	0003
1812	LOS HORCONES	197	0004
1813	PASO DE GUALACHE (GUACAMAE)	197	0005
1814	CASCO URBANO	198	0000
1815	EL CERRITO	198	0001
1816	EL OJUSHTE	198	0002
1817	EL TRILLO	198	0003
1818	LA JOYA DE TOMASITO	198	0004
1819	LA LAGUNA	198	0005
1820	LA PEÑA	198	0006
1821	LA PRESA	198	0007
1822	LAS SALINAS	198	0008
1823	OBRAJUELO	198	0009
1824	OJO DE AGUA	198	0010
1825	PALO GALAN	198	0011
1826	SANTA BARBARA	198	0012
1827	TALPETATE	198	0013
1828	LOS DESMONTES	198	0014
1829	CAPITAN LAZO	198	0015
1830	CASCO URBANO	199	0000
1831	LA CEIBITA	199	0001
1832	LA ORILLA	199	0002
1833	MIRACAPA	199	0003
1834	ROSAS NACASPILO	199	0004
1835	SOLEDAD TERRERO	199	0005
1836	CASCO URBANO	200	0000
1837	BELEN	200	0001
1838	GUANASTE	200	0002
1839	LA MONTAÑITA	200	0003
1840	LLANO EL ANGEL	200	0004
1841	NUEVO PORVENIR	200	0005
1842	SAN CRISTOBAL	200	0006
1843	SAN JUAN	200	0007
1844	SAN LUISITO	200	0008
1845	SAN MATIAS	200	0009
1846	TEPONAHUASTE	200	0010
1847	TORRECILLA	200	0011
1848	CASCO URBANO	201	0000
1849	CANDELARIA	201	0001
1850	EL COLORADO	201	0002
1851	EL HORMIGUERO	201	0003
1852	EL JICARAL	201	0004
1853	PLATANARILLO	201	0005
1854	CASCO URBANO	202	0000
1855	CERCAS DE PIEDRA	202	0001
1856	HUALAMA	202	0002
1857	LA TRINIDAD	202	0003
1858	LOS AMATES	202	0004
1859	SAN JERONIMO	202	0005
1860	SAN PEDRO	202	0006
1861	CASCO URBANO	203	0000
1862	EL BOQUERON	203	0001
1863	CHAMBALA	203	0002
1864	CONACASTAL	203	0003
1865	COPINOL PRIMERO	203	0004
1866	COPINOL SEGUNDO	203	0005
1867	EL JOCOTE SAN ISIDRO	203	0006
1868	JOCOTE DULCE	203	0007
1869	LA CRUZ PRIMERO	203	0008
1870	LA CRUZ SEGUNDO	203	0009
1871	LAS MARIAS	203	0010
1872	LA PEÑA	203	0011
1873	LAS MESAS	203	0012
1874	OJO DE AGUA	203	0013
1875	OROMONTIQUE	203	0014
1876	SAN ANTONIO	203	0015
1877	SAN PEDRO ARENALES	203	0016
1878	ZARAGOZA	203	0017
1879	LOS PLANES I	203	0018
1880	LOS PLANES II	203	0019
1881	LOS PLANES III	203	0020
1882	CASCO URBANO	204	0000
1883	EL CAPULIN	204	0001
1884	CHILANGUERA	204	0002
1885	GUADALUPE	204	0003
1886	HOJA DE SAL	204	0004
1887	LA ESTRECHURA	204	0005
1888	NUEVA CONCEPCION	204	0006
1889	SAN JOSE GUALOZO	204	0007
1890	SAN PEDRO	204	0008
1891	TIERRA BLANCA	204	0009
1892	CASCO URBANO	205	0000
1893	CALLE NUEVA	205	0001
1894	LLANO EL COYOL	205	0002
1895	MOROPALA	205	0003
1896	PRIMAVERA O MEANGULO	205	0004
1897	CASCO URBANO	206	0000
1898	AMAYA	206	0001
1899	CONCEPCION	206	0002
1900	EL JICARO	206	0003
1901	EL NANCITO	206	0004
1902	EL PALON	206	0005
1903	LAS VENTAS	206	0006
1904	SAN FRANCISCO	206	0007
1905	SANTA BARBARA	206	0008
1906	VALENCIA	206	0009
1907	CASCO URBANO	207	0000
1908	EL CERRO	207	0001
1909	EL JOBO	207	0002
1910	EL PAPALON	207	0003
1911	PLATANAR	207	0004
1912	EL RODEO	207	0005
1913	LA ESTANCIA	207	0006
1914	LA FRAGUA	207	0007
1915	LOS EJIDOS	207	0008
1916	SALAMAR	207	0009
1917	SANTA BARBARA	207	0010
1918	TONGOLONA	207	0011
1919	VALLE ALEGRE	207	0012
1920	CASCO URBANO	208	0000
1921	LOS PLANES SAN SEBASTIAN	208	0001
1922	SAN LUIS	208	0002
1923	CASCO URBANO	209	0000
1924	CUCURUCHO	209	0001
1925	EL OJEO	209	0002
1926	JARDIN	209	0003
1927	LOS LAURELES	209	0004
1928	MONTECILLOS	209	0005
1929	QUESERAS	209	0006
1930	SAN SEBASTIAN	209	0007
1931	CASCO URBANO	210	0000
1932	EL OBRAJUELO	210	0001
1933	EL TAMBORAL	210	0002
1934	SAN JOSE	210	0003
1935	SAN ANTONIO	210	0004
1936	CASCO URBANO	211	0000
1937	SAN DIEGO	211	0001
1938	SAN MARCOS	211	0002
1939	CASCO URBANO	212	0000
1940	LAGUNA	212	0001
1941	LA JOYA	212	0002
1942	QUEBRACHO	212	0003
1943	SAN GERONIMO	212	0004
1944	CASCO URBANO	213	0000
1945	CANDELARIA	213	0001
1946	JOYA DE VENTURA	213	0002
1947	LA CEIBA	213	0003
1948	MORITA	213	0004
1949	SAN JULIAN	213	0005
1950	CASCO URBANO	214	0000
1951	EL JUNQUILLO	214	0001
1952	OSTUCAL	214	0002
1953	SAN ANTONIO	214	0003
1954	SAN JUAN	214	0004
1955	CASCO URBANO	215	0000
1956	ALTOMIRO	215	0001
1957	ANCHICO	215	0002
1958	CERRO BONITO	215	0003
1959	CONCEPCION COROZAL	215	0004
1960	EL AMATE	215	0005
1961	EL BRAZO	215	0006
1962	EL DELIRIO	215	0007
1963	EL DIVISADERO	215	0008
1964	EL HAVILLAL	215	0009
1965	EL JUTE	215	0010
1966	EL NIÑO	215	0011
1967	EL PAPALON	215	0012
1968	EL PROGRESO	215	0013
1969	EL SITIO	215	0014
1970	EL TECOMATAL	215	0015
1971	EL VOLCAN	215	0016
1972	EL ZAMORAN O ZAMORANO	215	0017
1973	HATO NUEVO	215	0018
1974	JALACATAL	215	0019
1975	LA CANOA	215	0020
1976	LA PUERTA	215	0021
1977	LA TRINIDAD	215	0022
1978	LAS DELICIAS	215	0023
1979	LAS LOMITAS	215	0024
1980	MIRAFLORES	215	0025
1981	MONTE GRANDE	215	0026
1982	SAN ANDRES	215	0027
1983	SAN ANTONIO CHAVEZ	215	0028
1984	SAN ANTONIO SILVA	215	0029
1985	SAN CARLOS	215	0030
1986	SAN JACINTO	215	0031
1987	SANTA INES	215	0032
1988	CASCO URBANO	216	0000
1989	LOS ZELAYA	216	0001
1990	PIEDRA AZUL	216	0002
1991	RODEO DE PIEDRON	216	0003
1992	SANTA CLARA	216	0004
1993	CASCO URBANO	217	0000
1994	CHARLACA	217	0001
1995	EL ESPIRITU SANTO	217	0002
1996	EL TABLON	217	0003
1997	LAS MESAS	217	0004
1998	MANAGUERA	217	0005
1999	MAZATEPEQUE	217	0006
2000	MINITAS	217	0007
2001	PETACONES	217	0008
2002	SAN JACINTO	217	0009
2003	SAN SEBASTIAN	217	0010
2004	SANTA ROSA	217	0011
2005	CASCO URBANO	218	0000
2006	JUAN YANES	218	0001
2007	LOS PILONES	218	0002
2008	RIO VARGAS	218	0003
2009	CASCO URBANO	219	0000
2010	PUEBLO VIEJO	219	0003
2011	TIERRA COLORADA	219	0004
2012	CASCO URBANO	220	0000
2013	AGUA BLANCA	220	0001
2014	CALAVERA	220	0002
2015	GUACHIPILIN	220	0003
2016	JUNQUILLO	220	0004
2017	LA ESTANCIA	220	0005
2018	OCOTILLO	220	0006
2019	SUNSULACA	220	0007
2020	CASCO URBANO	221	0000
2021	CORRALITO	221	0001
2022	HONDABLE	221	0002
2023	LA LAGUNA	221	0003
2024	SAN FELIPE	221	0004
2025	VARRILLA NEGRA	221	0005
2026	CASCO URBANO	222	0000
2027	EL CHAPARAL	222	0001
2028	EL PEDERNAL	222	0002
2029	JOYA DEL MATAZANO	222	0003
2030	LAJITAS	222	0004
2031	PIEDRA PARADA	222	0005
2032	CASCO URBANO	223	0000
2033	EL VOLCAN	223	0001
2034	LA CUCHILLA	223	0002
2035	CASCO URBANO	224	0000
2036	LLANO DE SANTIAGO	224	0001
2037	LOMA LARGA	224	0002
2038	LOMA TENDIDA	224	0003
2039	NOMBRE DE JESUS	224	0004
2040	SAN PEDRO	224	0005
2041	SANTA ANITA	224	0006
2042	VILLA MODELO	224	0007
2043	CASCO URBANO	225	0000
2044	LA LAGUNA	225	0001
2045	OJO DE AGUA	225	0002
2046	CASCO URBANO	226	0000
2047	LA JOYA	226	0001
2048	SAN LUCAS	226	0002
2049	CASCO URBANO	227	0000
2050	EL SIRIGUAL	227	0001
2051	EL VOLCAN	227	0002
2052	LOS ABELINOS	227	0003
2053	MAIGUERA	227	0004
2054	PAJIGUA	227	0005
2055	SAN BARTOLO	227	0006
2056	CASCO URBANO	228	0000
2057	EL VOLCANCILLO	228	0001
2058	EL ZAPOTAL	228	0002
2059	PATURLA	228	0003
2060	CASCO URBANO	229	0000
2061	EL RODEO	229	0001
2062	EL VOLCANCILLO	229	0002
2063	CASCO URBANO	230	0000
2064	FLAMENCO	230	0001
2065	GUACHIPILIN	230	0002
2066	LAGUNETAS	230	0003
2067	LAS MARIAS	230	0004
2068	LOS LAURELES	230	0005
2069	SAN FELIPE	230	0006
2070	SAN JOSE	230	0007
2071	SAN JUAN	230	0008
2072	CASCO URBANO	231	0000
2073	GUALINDO	231	0001
2074	LA MANZANILLA	231	0002
2075	CASCO URBANO	232	0000
2076	CERRO PANDO	232	0001
2077	GUACAMAYA	232	0002
2078	LA JOYA	232	0003
2079	SOLEDAD	232	0004
2080	CASCO URBANO	233	0000
2081	AGUA ZARCA	233	0001
2082	CERRO DEL COYOL	233	0002
2083	HUILIHUISTE	233	0003
2084	LA MONTAÑA	233	0004
2085	LLANO ALEGRE	233	0005
2086	CASCO URBANO	234	0000
2087	CASA BLANCA	234	0001
2088	CASCO URBANO	235	0000
2089	LA JAGUA	235	0001
2090	SAN DIEGO	235	0002
2091	SAN MARCOS	235	0003
2092	VALLE NUEVO	235	0004
2093	CASCO URBANO	236	0000
2094	AZACUALPA	236	0001
2095	CAÑAVERALES	236	0002
2096	CASCO URBANO	237	0000
2097	CACAHUATALEJO	237	0001
2098	EL NORTE	237	0002
2099	EL TRIUNFO	237	0003
2100	SAN FRANCISQUITO	237	0004
2101	SAN JOSE	237	0005
2102	CASCO URBANO	238	0000
2103	EL ROSARIO	238	0001
2104	PIEDRA PARADA	238	0002
2105	CASCO URBANO	239	0000
2106	EL CARRIZAL	239	0001
2107	LAS QUEBRADAS	239	0002
2108	POTRERO ADENTRO	239	0003
2109	VALLE GRANDE	239	0004
2110	EL CERRO	239	0005
2111	SAN FRANCISCO	239	0006
2112	CASCO URBANO	240	0000
2113	EL LIMON	240	0001
2114	EL RODEO	240	0002
2115	CASCO URBANO	241	0000
2116	ANIMAS	241	0001
2117	BEJUCAL	241	0002
2118	CALPULES	241	0003
2119	CANDELARIA	241	0004
2120	EL PEÑON	241	0005
2121	EL TABLON	241	0006
2122	LABRANZA	241	0007
2123	LA JOYA	241	0008
2124	CASCO URBANO	242	0000
2125	AGUA ZARCA	242	0001
2126	CERRITOS	242	0002
2127	EL PROGRESO	242	0003
2128	TIJERETAS	242	0004
2129	CASCO URBANO	243	0000
2130	JOYA DEL MATAZANO	243	0001
2131	LOMA DEL CHILE	243	0002
2132	SAN FRANCISQUITO	243	0003
2133	SAN JUAN	243	0004
2134	CASCO URBANO	244	0000
2135	EL ACEITUNO	244	0001
2136	EL VOLCAN	244	0002
2137	CASCO URBANO	245	0000
2138	AGUA BLANCA	245	0001
2139	CARBONAL	245	0002
2140	CORDONCILLO	245	0003
2141	EL CEDRO	245	0004
2142	TIZATE	245	0005
2143	HUERTAS VIEJAS	245	0006
2144	TERRERITOS	245	0007
2145	TULIMA	245	0008
2146	CASCO URBANO	246	0000
2147	ALBORNOZ	246	0001
2148	CANDELARIA ALBORNOZ	246	0002
2149	EL TRANSITO	246	0003
2150	GUADALUPE	246	0004
2151	LA PAZ	246	0005
2152	LA RINCONADA	246	0006
2153	NUEVA GUADALUPE	246	0007
2154	SANTA LUCIA	246	0008
2155	JOYA LAS TUNAS	246	0009
2156	CASCO URBANO	247	0000
2157	GUAYABO	247	0001
2158	EL MOLINO	247	0002
2159	ZAPOTE	247	0003
2160	GUERIPE	247	0004
2161	CASCO URBANO	248	0000
2162	CERRO EL JIOTE	248	0001
2163	CONCHAGUITA	248	0002
2164	EL CACAO	248	0003
2165	EL CIPRES	248	0004
2166	EL FARO	248	0005
2167	EL PILON	248	0006
2168	EL TAMARINDO	248	0007
2169	HUISQUIL	248	0008
2170	LLANO DE LOS PATOS	248	0009
2171	LOS ANGELES	248	0010
2172	MAQUIGUE	248	0011
2173	PIEDRAS BLANCAS	248	0012
2174	PIEDRA RAYADA	248	0013
2175	YOLOGUAL	248	0014
2176	EL JAGUEY	248	0015
2177	PLAYAS NEGRAS	248	0016
2178	LAS TUNAS	248	0017
2179	EL FARITO	248	0018
2180	CASCO URBANO	249	0000
2181	ALTO EL ROBLE	249	0001
2182	CAULOTILLO	249	0002
2183	EL GAVILAN	249	0003
2184	EL PICHE	249	0004
2185	EL TEJAR	249	0005
2186	EL ZAPOTAL	249	0006
2187	LA CAÑADA	249	0007
2188	LAS PITAS	249	0008
2189	LOS CONEJOS	249	0009
2190	OLOMEGA	249	0010
2191	SALALAGUA	249	0011
2192	CASCO URBANO	250	0000
2193	CANAIRE	250	0001
2194	EL RINCON	250	0002
2195	TALPETATE	250	0003
2196	SAN JUAN GUALARE	250	0004
2197	SANTA ROSITA	250	0005
2198	CASCO URBANO	251	0000
2199	EL CARAO	251	0001
2200	LA LEONA	251	0002
2201	CASCO URBANO	252	0000
2202	AGUA CALIENTE	252	0001
2203	AGUA ESCONDIDA	252	0002
2204	AMAPALITA	252	0003
2205	EL COYOLITO	252	0004
2206	EL JICARO	252	0005
2207	ISLA ZACATILLO	252	0006
2208	LA QUEZADILLA	252	0007
2209	LOMA LARGA	252	0008
2210	SIRAMA	252	0009
2211	EL TIHUILOTAL	252	0010
2212	VOLCANCILLO	252	0011
2213	CHIQUIRIN	252	0012
2214	LAS MADERAS	252	0013
2215	CASCO URBANO	253	0000
2216	AGUA FRIA	253	0001
2217	DERRUMBADO	253	0002
2218	GUAJINIQUIL	253	0003
2219	TERRERO	253	0004
2220	HIGUERAS	253	0005
2221	PILAS	253	0006
2222	CASCO URBANO	254	0000
2223	EL PORTILLO	254	0001
2224	HONDURITAS	254	0002
2225	LAS MARIAS	254	0003
2226	MONTECA	254	0004
2227	OCOTILLO	254	0005
2228	TALPETATE	254	0006
2229	CASCO URBANO	255	0000
2230	CERRO PELON	255	0001
2231	EL TABLON	255	0002
2232	EL REBALSE	255	0003
2233	HORCONES	255	0004
2234	PIEDRAS BLANCAS	255	0005
2235	SAN EDUARDO	255	0006
2236	SAN FELIPE	255	0007
2237	SANTA CLARA	255	0008
2238	VALLE AFUERA	255	0009
2239	CASCO URBANO	256	0000
2240	BOQUIN	256	0001
2241	CARPINTERO	256	0002
2242	OCOTE	256	0003
2243	RODEO	256	0004
2244	LAJITAS	256	0005
2245	MALA LAJA	256	0006
2246	PUEBLO	256	0007
2247	CASCO URBANO	257	0000
2248	AGUA FRIA	257	0001
2249	BOBADILLA	257	0002
2250	CEIBILLAS	257	0003
2251	CERCOS DE PIEDRA	257	0004
2252	EL CARAON	257	0005
2253	COPALIO	257	0006
2254	EL TAMARINDO	257	0007
2255	TIZATILLO	257	0008
2256	HATO NUEVO	257	0009
2257	LAS QUECERAS	257	0010
2258	LOS JIOTES	257	0011
2259	MOGOTILLO	257	0012
2260	SAN JERONIMO	257	0013
2261	SANTA CRUZ	257	0014
2262	TERRERO BLANCO	257	0015
2263	SAN JOSE	257	0016
2264	PAVANA	257	0017
2265	PIEDRA GORDA	257	0018
2266	LA PRESA	257	0019
2267	CASCO URBANO	258	0000
2268	EL CHAGUITILLO	258	0001
2269	EL ZAPOTE	258	0002
2270	LA JOYA	258	0003
2271	EL SOMBRERITO	258	0004
2272	CASCO URBANO	259	0000
2273	COPETILLOS	259	0001
2274	EL ALGODON	259	0002
2275	EL PORTILLO	259	0003
2276	LA CHORRERA	259	0004
2277	LAS CAÑAS	259	0005
2278	LOS MOJONES	259	0006
2279	PASAQUINITA	259	0007
2280	SAN SEBASTIAN	259	0008
2281	CASCO URBANO	260	0000
2282	CENTENO	260	0001
2283	EL PASTOR	260	0002
2284	EL SOCORRO	260	0003
2285	LOS AMATES	260	0004
2286	CASCO URBANO	261	0000
2287	CANDELARIA	261	0001
2288	CIRICUARIO	261	0002
2289	LA CAÑADA	261	0003
2290	LAS MARIAS	261	0004
2291	LOS HATILLOS	261	0005
2292	TEPEMECHIN	261	0006
2293	VALLE NUEVO	261	0007
2294	EL CARMEN	261	0008
2295	CRUCES	261	0009
2297	EL SALVADOR	262	0001
2298	GUERRERO	262	0002
2299	ISLA CONCHAGUITA	262	0003
\.


--
-- Data for Name: cat_cargo_funcional; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY cat_cargo_funcional (id_cargofuncional, descripcion) FROM stdin;
1	Abogado
2	Abogado I
3	Administrador de Centro de Salud
4	Analista de Pruebas Físico-Químicas
5	Analista de Pruebas Microbiológicas
6	Analista Programador
7	Asesor de Planificación en Salud
8	Asesor del Despacho
9	Asesor del Programa Nacional de ITS/VIH/SIDA
10	Asesor Jurídico
11	Asistente Administrativo (Nivel Central)
12	Asistente de Comunicaciones
13	Asistente de Estadística
14	Asistente de Suministros Departamental
15	Asistente Dental
16	Asistente Financiero
17	Asistente Técnico
18	Asistente Técnico Administrativo
19	Asistente Técnico Administrativo (Nivel Central)
20	Auditor
21	Auditor I
22	Auditor II
23	Auxiliar Administrativo
24	Auxiliar Administrativo I
25	Auxiliar Administrativo II
26	Auxiliar Contable
27	Auxiliar de Almacén
28	Auxiliar de Almacén I
29	Auxiliar de Almacén II
30	Auxiliar de Auditoría
31	Auxiliar de Auditoria I
32	Auxiliar de Bodega
33	Auxiliar de Compras y Suministros
34	Auxiliar de Control de Calidad
35	Auxiliar de Enfermería
36	Auxiliar de Enfermería de Salud Comunitaria
37	Auxiliar de Enfermería de Servicio Especializado
38	Auxiliar de Enfermería Hospitalaria
39	Auxiliar de Estadística
40	Auxiliar de Estadística (Hospital)
41	Auxiliar de Farmacia
42	Auxiliar de Impresiones
43	Auxiliar de Laboratorio
44	Auxiliar de Mantenimiento
45	Auxiliar de Mantenimiento I
46	Auxiliar de Nutrición
47	Auxiliar de Pagaduría
48	Auxiliar de Pagaduría II
49	Auxiliar de Personal I (Departamental y Hospitalario)
50	Auxiliar de Personal I (Nivel Regional y Hospitalario)
51	Auxiliar de Personal II
52	Auxiliar de Proveeduría
53	Auxiliar de Reproducción
54	Auxiliar de Servicio
55	Auxiliar de Servicio Varios
56	Auxiliar de Servicios
57	Auxiliar de Tesorería
58	Auxiliar Financiero
59	Ayudante de Almacén
60	Ayudante de Enfermería
61	Ayudante de Fisioterapia
62	Ayudante de Laboratorio
63	Bibliotecario
64	Bodeguero
65	Cajero
66	Camarógrafo
67	Capellán (tiempo parcial)
68	Citotecnólogo
69	Cocinero
70	Colaborador Administrativo
71	Colaborador Administrativo I
72	Colaborador Administrativo II
73	Colaborador Asistente
74	Colaborador de Recursos Humanos
75	Colaborador de Soporte Técnico
76	Colaborador Financiero
77	Colaborador Jurídico
78	Colaborador Jurídico I
79	Colaborador Jurídico II
80	Colaborador Técnico - Científico de Medicamentos e Insumos Médicos
81	Colaborador Técnico (Médico Especialista)
82	Colaborador Técnico (Nivel Central)
83	Colaborador Técnico Administrativo
84	Colaborador Técnico de Enfermería
85	Colaborador Técnico de Epidemiología
86	Colaborador Técnico de Formación y Capacitación
87	Colaborador Técnico de Nutrición (Hospital Especializado y Regional)
88	Colaborador Técnico de Supervisoría Médica
89	Colaborador Técnico en Nutrición (Hospital Especializado)
90	Colaborador Técnico Especialista
91	Colaborador Técnico Especializado
92	Colaborador Técnico I (Nivel Central)
93	Colaborador Técnico II
94	Colaborador Técnico III
95	Colaborador Técnico IV
96	Colaborador Técnico Médico
97	Colaborador Técnico Médico I
98	Colaborador Técnico V
99	Colaborador Técnico VI
100	Colector
101	Contador (Hospital)
102	Contador (Nivel Central y Departamental)
103	Contador de Hospitales
104	Contador Institucional
105	Coordinador Administrativo
106	Coordinador Area de Fondos Externos
107	Coordinador Area de Presupuesto
108	Coordinador de Area de Laboratorio Clínico
109	Coordinador de Area de Laboratorio Clínico (Segundo Nivel)
110	Coordinador de Area de Laboratorio Clínico (Tercer Nivel)
111	Coordinador de Centro de Cómputo
112	Coordinador de Información Ministerial
113	Coordinador de Informática
114	Coordinador de la Infraestructura de Salud
115	Coordinador de la Inversión Pública
116	Coordinador de Muestras e Inspección por Atributos
117	Coordinador de Programa
118	Coordinador de Programa Protección de Alimentos
119	Coordinador de Proyectos
120	Coordinador Jurídico
121	Coordinador Nacional de Desastres
122	Coordinador Nacional del Area Jurídica
123	Coordinador Unidad de Información en Salud
124	Costurera (Hospital)
125	Dibujante de Ilustraciones
126	Digitador
127	Digitador de Datos
128	Director Atención al Medio Ambiente
129	Director de Control y Vigilancia Epidemiológica
130	Director de Planificación y Modernización Institucional y Reforma Sectorial
131	Director de Regulación
132	Director General de Administración y Finanzas
133	Director General de Salud y Aseguramiento de la Calidad
134	Director Médico Hospital Especializado
135	Director Médico Hospital Regional y Departamental
136	Diseñador
137	Diseñador Gráfico
138	Educador para la Salud (Nivel Local)
139	Educador Supervisor
140	Educador Supervisor (Nivel Central)
141	Educador Supervisor Departamental
142	Encargada Clínica Asistencial (Nivel Central)
143	Encargada de Fondos
144	Encargada de Kardex
145	Encargada de Relaciones Publicas
146	Encargado de Activo Fijo
147	Encargado de Asuntos Jurídicos
148	Encargado de Compras
149	Encargado de Control de Estupefacientes (Suministros)
150	Encargado de Control Presupuestario
151	Encargado de Despensa
152	Encargado de Farmacia
153	Encargado de Fórmulas Nutricionales
154	Encargado de Impresión
155	Encargado de Informática
156	Encargado de Programa Saneamiento Ambiental
157	Encargado de Proyecto
158	Encargado de Unidad de Patrimonio
159	Enfermera
160	Enfermera Colaborador Técnico de Capacitación
161	Enfermera Comunitaria
162	Enfermera de Unidad Móvil Rural
163	Enfermera Hospitalaria
164	Enfermera Jefe de Unidad Hospitalaria
165	Enfermera Jefe del Departamento de Enfermería (Hospital Especializado)
166	Enfermera Jefe del Servicio de Arsenal y Central de Esterilización
167	Enfermera Jefe Departamental
168	Enfermera Jefe Departamento de Enfermería (Hospital Regional y Departamental)
169	Enfermera Jefe División de Enfermería
170	Enfermera Subjefe Departamento de Enfermería (Hospital Regional y Departamental)
171	Enfermera Subjefe Departamento de Enfermería (Hospital)
172	Enfermera Supervisora
173	Enfermera Supervisora (Nivel Central)
174	Enfermera Supervisora (Nivel Local)
175	Enfermera Supervisora Departamental
176	Enfermera Supervisora Hospitalaria
177	Enfermera Supervisora Local
178	Entomólogo de Enfermedades Transmisibles por Vectores
179	Especialista en Alimentos
180	Estadístico Asesor (Nivel Central)
181	Estadístico Supervisor Departamental
182	Estudiante de Medicina en Servicio Social (Director de Unidad de Salud y Unidad Móvil)
183	Estudiante de Medicina en Servicio Social Director de Unidad de Salud y Unidad Móvil Rural
184	Estudiante de Odontologia en Servicio Social
185	Estudiante de Odontología en Servicio Social (4 horas diarias)
186	Fisioterapista
187	Fisioterapista (5 horas)
188	Gerente de Programa Atención Integral en Salud
189	Guardalmacén (con fianza, Centros y Hospitales)
190	Guardalmacén I (con fianza, Centros y Hospitales)
191	Guardalmacén I (con fianza, Hospital)
192	Guardalmacén II (con fianza, Departamental y Nivel Central)
193	Guardalmacén II (con fianza)
194	Impresor
195	Ingeniero Biomédico
196	Ingeniero Eléctrico
197	Inspector de Control de Calidad de Medicamentos
198	Inspector de Saneamiento Ambiental
199	Inspector Promotor Antimalaria
200	Inspector Promotor Departamental
201	Inspector Técnico en Saneamiento Ambiental
202	Interventor
203	Jardinero
204	Jefe  de Laboratorio Clínico (Primer Nivel)
205	Jefe  Departamento  Financiero  Contable (Hospital Regional y Departamental)
206	Jefe  Departamento  Financiero Contable (Hospital Especializado)
207	Jefe  Departamento Financiero Contable (Departamental y Hospital)
208	Jefe Administrativo (Nivel Central)
209	Jefe Administrativo Departamental
210	Jefe Area de Banco de Sangre (Segundo Nivel)
211	Jefe Area de Banco de Sangre (Tercer Nivel)
212	Jefe Area de Laboratorio Productos Biológicos
213	Jefe Centro Nacional de Biológicos
214	Jefe de  Laboratorio Clínico (Segundo Nivel)
215	Jefe de Almacenes (Nivel Central)
216	Jefe de Area Clínica
217	Jefe de Auditoría
218	Jefe de Cocina
219	Jefe de Consulta Externa
220	Jefe de Consulta Externa (2 horas diarias)
221	Jefe de Consulta Externa (3 horas diarias)
222	Jefe de Consulta Externa (4 horas diarias)
223	Jefe de Consulta Externa (6 horas diarias)
224	Jefe de Cuadrilla de Rociado
225	Jefe de Departamento Alimentación y Dietas
226	Jefe de Departamento de Alimentación y Dietas (Hospital)
227	Jefe de Departamento de Mantenimiento (Hospital Especializado)
228	Jefe de Departamento de Recursos Humanos (Hospital Regional y Departamental)
229	Jefe de Departamento Financiero Contable (Hospital Regional y Departamental)
230	Jefe de División Administración de Recursos Humanos
231	Jefe de Educación para la Salud Departamental
232	Jefe de Electromecánica y Biomédica Departamental
233	Jefe de Estadística
234	Jefe de Estadística Departamental
235	Jefe de Evaluación y Control de Abastecimientos
236	Jefe de Farmacia
237	Jefe de Farmacia (4 horas diarias)
238	Jefe de la Unidad de Admisiòn y Contribuciones
239	Jefe de la Unidad de Informática
240	Jefe de la Unidad Técnica de Medicamentos e Insumos Médicos
241	Jefe de Laboratorio  Clínico (Tercer Nivel)
242	Jefe de Laboratorio Clínico (Hospital Especializado y Regional)
243	Jefe de Laboratorio Clínico (Primer Nivel)
244	Jefe de Laboratorio Clínico (Segundo Nivel)
245	Jefe de Mantenimiento
246	Jefe de Nutrición Departamental
247	Jefe de Programa Nacional de Salud Mental
248	Jefe de Radiología
249	Jefe de Recursos Humanos
250	Jefe de Recursos Humanos Departamental
251	Jefe de Residentes
252	Jefe de Saneamiento Ambiental
253	Jefe de Sección de Lavandería (Hospital)
254	Jefe de Sección Unidad de Informática (Nivel Central)
255	Jefe de Servicio de Fisioterapia
256	Jefe de Servicio Radiología
257	Jefe de Servicios Generales Departamental
258	Jefe de Suministros Departamental
259	Jefe de Telefonía (Hospital)
260	Jefe de Trabajo Social
261	Jefe de Transporte Departamental
262	Jefe de Unidad de  Vigilancia Epidemiológica
263	Jefe de Unidad de Asesoría Jurídica
264	Jefe de Unidad de Auditoría Interna (Hospital Especializado)
265	Jefe de Unidad de Control Vectorial
266	Jefe de Unidad de Cuidados Intensivos (Hospital Especializado)
267	Jefe de Unidad de Emergencia (Hospital Especializado, 8 horas diarias)
268	Jefe de Unidad de Emergencia (Hospital Especializado)
269	Jefe de Unidad de Enseñanza (Hospital Especializado, 4 horas diarias)
270	Jefe del Area de Citología (Nivel Central, 6 horas diarias)
271	Jefe del Area de Laboratorio de Bromatología (Nivel Central)
272	Jefe del Departamento Alimentación y Dietas (Hospital Regional y Departamental)
273	Jefe del Departamento de Alimentación y Dietas (Hospital Especializado)
274	Jefe del Servicio de Fisioterapia
275	Jefe del Servicio de Terapia Ocupacional
276	Jefe Departamental Sección de Inspectores en Saneamiento Ambiental
277	Jefe Departamento Alimentación y Dietas (Hospital Regional y Departamental)
278	Jefe Departamento Arsenal y Central de Esterilización
279	Jefe Departamento Capacitación y Desarrollo
280	Jefe Departamento Control de Vectores (Nivel Central)
281	Jefe Departamento de Diagnóstico y Servicios de Apoyo (Hospital Especializado 6 horas diarias)
282	Jefe Departamento de Diagnóstico y Servicios de Apoyo (Hospital Especializado, 4 Horas diarias)
283	Jefe Departamento de Diagnóstico y Servicios de Apoyo (Hospital Especializado)
285	Jefe Departamento de Farmacia
286	Jefe Departamento de Mantenimiento (Hospital Especializado)
287	Jefe Departamento de Mantenimiento (Hospital Regional y Departamental)
288	Jefe Departamento de Nutrición (Nivel Central)
289	Jefe Departamento de Prestaciones Sociales y Laborales
290	Jefe Departamento de Recursos Humanos (Hospital Especializado)
291	Jefe Departamento de Recursos Humanos (Hospital Regional y Departamental)
292	Jefe Departamento de Relaciones Públicas
293	Jefe Departamento de Suministros
294	Jefe Departamento de Suministros (Hospital Especializado)
295	Jefe Departamento de Suministros (Hospital Regional y Departamental)
296	Jefe Departamento Financiero Contable
297	Jefe Departamento Financiero Contable (Hospital Regional y Departamental)
298	Jefe Departamento Gestión de Suministros
299	Jefe Departamento Laboratorio de Control de Calidad (Nivel Central)
300	Jefe Departamento Médico (Hospital Regional y Departamental, 2 horas diarias)
301	Jefe Departamento Médico (Hospital Regional y Departamental, 4 horas diarias)
302	Jefe Departamento Médico (Hospital Regional y Departamental, 6 horas diarias)
303	Jefe Departamento Médico de Hospital Especializado
304	Jefe Departamento Médico de Hospital Especializado (2 horas diarias)
305	Jefe Departamento Médico de Hospital Especializado (4 horas diarias)
306	Jefe Departamento Médico de Hospital Especializado (8 horas diarias)
307	Jefe Departamento Recursos Humanos (Departamental y Hospital)
308	Jefe Departamento Servicios Auxiliares
309	Jefe Departamento Servicios Generales (Hospital Especializado)
310	Jefe Departamento Servicios Generales (Hospital Regional y Departamental)
311	Jefe División Administrativa (Hospital Especializado)
312	Jefe División Administrativa (Hospital Regional y Departamental)
313	Jefe División Control de Calidad
314	Jefe División de Diagnóstico y Servicios de Apoyo (Hospital Especializado, 4 horas diarias)
315	Jefe División de Diagnóstico y Servicios de Apoyo (Hospital Especializado)
316	Jefe División Mantenimiento General (Nivel Central)
317	Jefe División Médica (Hospital Regional y Departamental, 4 horas diarias)
318	Jefe División Médica (Hospital Regional y Departamental)
319	Jefe División Médica de Hospital Especializado
320	Jefe División Médica de Hospital Especializado (4 horas diarias)
321	Jefe División Médica de Hospital Especializado (6 horas diarias)
322	Jefe División Saneamiento Ambiental
323	Jefe División Servicios Generales (Nivel Central)
324	Jefe Encargado de Oxígeno (Hospital)
325	Jefe Financiero Contable Departamental
326	Jefe Operación de Campo
327	Jefe Programas de Salud
328	Jefe Sección Auxiliares de Servicio
329	Jefe Sección Auxiliares de Servicio (Hospital)
330	Jefe Sección Capacitación de Mantenimiento (Nivel Central)
331	Jefe Sección Correspondencia y Archivo (Nivel Central)
332	Jefe Sección Costurería (Hospitales)
333	Jefe Sección de Calidad
334	Jefe Sección de Estadística y Documentos Médicos (Hospital)
335	Jefe Sección de Lavandería (Hospital)
336	Jefe Sección de Personal
337	Jefe Sección de Porteros Vigilantes (Hospital)
338	Jefe Sección de Transporte
339	Jefe Sección de Transportes (Hospital)
340	Jefe Sección Distribución de Vehículos (Nivel Central)
341	Jefe Sección Electromecánica (Nivel Central)
342	Jefe Sección Equipo Médico (Nivel Central)
343	Jefe Sección Lavandería (Hospital)
344	Jefe Sección Mecánica General (Nivel Central)
345	Jefe Sección Operativo de Almacén (Nivel Central)
346	Jefe Sección Planta Física y Mobiliario (Nivel Central)
347	Jefe Sección Porteros Vigilantes
348	Jefe Sección Servicios Auxiliares (Nivel Central)
349	Jefe Sección Trámites de Importación (Nivel Central)
350	Jefe Sección Zoonosis
351	Jefe Sector de Malaria
352	Jefe Servicio de Fisioterapia
353	Jefe Unidad Adquisiciones y Contrataciones (UACI)
354	Jefe Unidad Adquisiciones y Contrataciones Institucionales
355	Jefe Unidad Asesora Proyectos de Ingeniería
356	Jefe Unidad Auditoría Interna (Hospital Especializado)
357	Jefe Unidad Cooperación Externa
358	Jefe Unidad de Comunicaciones
359	Jefe Unidad de Cuidados Intensivos Hospital Especializado (4 horas diarias)
360	Jefe Unidad de Emergencia Hospital Especializado
361	Jefe Unidad de Enseñanza Hospital Especializado
362	Jefe Unidad de Odontología
363	Jefe Unidad de Planificación
364	Jefe Unidad de Planificación Hospital Especializado
365	Jefe Unidad de Relaciones Públicas
366	Jefe Unidad Financiera Institucional
367	Jefe Unidad Laboratorio Central
368	Kardista
369	Kardista (Hospital)
370	Laboratorista
371	Laboratorista (4 horas diarias)
372	Laboratorista II
373	Lavandera y Planchadora
374	Lavandera y Planchadora (Hospital)
375	Médico Colaborador Técnico
376	Médico Consulta General (10 horas semanales)
377	Médico Consulta General (2 horas diarias)
378	Médico Consulta General (3 horas diarias)
379	Médico Consulta General (8 horas diarias)
380	Médico de Consulta General (1 hora diaria)
381	Médico de Consulta General (2 horas diarias)
382	Médico de Consulta General (3 horas diarias)
383	Médico de Consulta General (4 horas diarias)
384	Médico de Consulta General (6 horas diarias)
385	Médico Director de Unidad de Salud (Comunitario y Rural, 2 horas diarias)
386	Médico Director de Unidad de Salud (Comunitario y Rural, 4 horas diarias)
387	Médico Director de Unidad de Salud (Comunitario y Rural, 6 horas diarias)
388	Médico Director de Unidad de Salud (Comunitario y Rural)
389	Médico Docente e Investigación
390	Médico Docente e Investigación (2 horas diarias)
391	Médico Docente e Investigación (4 horas diarias)
392	Médico Epidemiólogo
393	Médico Epidemiólogo (1 hora diaria)
394	Médico Epidemiólogo (4 horas diarias)
395	Médico Epidemiólogo (6 horas diarias)
396	Médico Especialista
397	Médico Especialista (6 horas diarias)
398	Médico Especialista I
399	Médico Especialista I (1 hora diaria)
400	Médico Especialista I (2 horas diarias)
401	Médico Especialista I (3 horas diarias)
402	Médico Especialista I (4 horas diarias)
403	Médico Especialista I (6 horas diarias)
404	Médico Especialista I (8 horas diarias)
405	Médico Especialista II
406	Médico Especialista II (2 horas diarias)
407	Médico Especialista II (3 horas diarias)
408	Médico Especialista II (4 horas diarias)
409	Médico Especialista II (6 horas diarias)
410	Médico Especialista II (8 horas diarias)
411	Médico Jefe de Emergencias
412	Médico Jefe de Emergencias (2 horas diarias)
413	Médico Jefe de Emergencias (3 horas diarias)
414	Médico Jefe de Emergencias (4 horas diarias)
415	Médico Jefe de Servicio
416	Médico Jefe de Servicio (2 horas diarias)
417	Médico Jefe de Servicio (3 horas diarias)
418	Médico Jefe de Servicio (4 horas diarias)
419	Médico Jefe de Servicio (6 horas diarias)
420	Médico Practicante Interno de Medicina
421	Médico Residente
422	Médico Residente en Subespecialidad
423	Médico Residente I
424	Médico Residente I (Becario)
425	Médico Residente II
426	Médico Residente II (Becario)
427	Médico Residente III (Becario)
428	Médico Subdirector de Unidad de Salud (6 horas diarias)
429	Médico Supervisor
430	Médico Veterinario
431	Mensajero
432	Mensajero (Nivel Central)
433	Ministro
434	Motorista
435	Motorista del Despacho
436	Motorista I
437	Motorista II
438	Nutricionista Supervisor Departamental
439	Obrero de Mantenimiento
440	Obrero de Mantenimiento I
441	Obrero de Mantenimiento II
442	Odontólogo (2 horas diarias)
443	Odontólogo (4 horas diarias)
444	Odontólogo (6 horas diarias)
445	Odontólogo (8 horas diarias)
446	Odontólogo Colaborador Técnico
447	Odontólogo Colaborador Técnico (Nivel Central)
448	Odontólogo Consulta Externa ( 2 hras diarias )
449	Odontólogo Docente Asistencial (2 horas diarias)
450	Odontólogo Especialista (2 horas diarias)
451	Odontólogo Especialista (4 horas diarias)
452	Odontólogo Jefe de Servicio (2 horas diarias)
453	Odontólogo Supervisor Departamental
454	Odontólogo Supervisor Departamental (6 horas diarias)
455	Operador de Cuarto Oscuro
456	Operador de Sistemas I
457	Operador Equipo Audiovisual
458	Operador Técnico de Equipo
459	Ordenanza
460	Ordenanza Mensajero
461	P
462	Pagador Auxiliar de Remuneraciones (Nivel Central)
463	Pintor
464	Portero Vigilante
465	Practicante Interno
466	Prensista
467	Preparador de Fórmulas Nutricionales
468	Profesional de Nutrición
469	Profesional en  Laboratorio  Clínico Primer Nivel( 4 horas diarias)
470	Profesional en Laboratorio  Clínico (Tercer Nivel)
471	Profesional en Laboratorio Clínico (Nivel Central)
472	Profesional en Laboratorio Clínico (Primer Nivel)
473	Profesional en Laboratorio Clínico (Segundo Nivel)
474	Profesional en Nutrición (Nivel Central)
475	Profesional en Planeación Estratégica
476	Profesional en Producción de Biológicos
477	Profesional en Química y Farmacia
478	Profesional en Química y Farmacia (4 horas diarias)
479	Promotor
480	Promotor Antidengue
481	Promotor de Educación Antimalaria
482	Promotor de Nutrición (4 horas diarias)
483	Promotor de Salud
484	Psicólogo
485	Psicólogo (2 horas diarias)
486	Psicólogo (4 horas diarias)
487	Psicólogo (6 horas diarias)
488	Psicólogo (8 horas diarias)
489	Químico Analista II
490	Químico Farmacéutico
491	Radiotecnólogo
492	Religiosa
493	Rociador de Malaria
494	Secretaria
495	Secretaria  I
496	Secretaria  III
497	Secretaria - Recepcionista
498	Secretaria del Despacho
499	Secretaria Ejecutiva
500	Secretaria I
501	Secretaria II
502	Secretaria III
503	Subdirector Médico Hospital Especializado
504	Subdirector Médico Hospital Especializado (8 horas diarias)
505	Subdirector Médico Hospital Regional y Departamental
506	Subdirector Médico Hospital Regional y Departamental (4 horas diarias)
507	Subdirector Médico Hospital Regional y Departamental (6 horas diarias)
508	Subjefe de Estadística Departamental
509	Subjefe de Farmacia
510	Subjefe de Farmacia (4 horas diarias)
511	Subjefe de la Unidad de Informática (Nivel Central)
512	Subjefe del Servicio de Anestesiología
513	Subjefe Departamento Almacenamiento y Distribución (Nivel Central)
514	Subjefe Departamento de Nutrición (Nivel Central)
515	Subjefe Departamento Laboratorio Control de Calidad (Nivel Central)
516	Subjefe División Saneamiento Ambiental
517	Subjefe Sección de Estadística y Documentos Médicos (Hospital)
518	Subjefe Unidad Asesoria Jurídica
519	Supervisor de Almacenes
520	Supervisor de Laboratorio (Primer Nivel)
521	Supervisor de Lavandería (Hospital)
522	Supervisor de Limpieza
523	Supervisor de Obras
524	Supervisor del Nivel Central en Saneamiento Ambiental
525	Supervisor Departamental de Malaria
526	Supervisor Departamental de Salud Comunitaria
527	Supervisor Departamental del Control de Enfermedades Transmisibles por Vectores
528	Supervisor Departamental Jefe de Promotores
529	Supervisor Departamental Técnico en Saneamiento Ambiental
530	Supervisor Específico de Promotores de Salud
531	Supervisor Local Técnico en Saneamiento Ambiental
532	Técnico Administrativo (Nivel Central)
533	Técnico Anestesista
534	Técnico Audiometrista
535	Técnico Auxiliar
536	Técnico Auxiliar I
537	Técnico Biomedico
538	Técnico de Comunicaciones
539	Técnico de Fotografía
540	Técnico de Mantenimiento I
541	Técnico de Mantenimiento II
542	Técnico de Mantenimiento III
543	Técnico de Personal I
544	Técnico de Personal II
545	Técnico de Planificación
546	Técnico en Anatomía Patológica
547	Técnico en Anestesia
548	Técnico en Arsenal y Central de Esterilización
549	Técnico en Autopsia
550	Técnico en Citopatología
551	Técnico en Electroencefalografía y Electrocardiograma
552	Técnico en Estadística y Documentos Médicos (Hospital)
553	Técnico en Farmacia
554	Técnico en Fisioterapia
555	Técnico en Gammografía
556	Técnico en Mantenimiento I
557	Técnico en Mantenimiento II
558	Técnico en Mantenimiento III
559	Técnico en Presupuesto
560	Técnico en Proyectos
561	Técnico en Radio-Isótopos
562	Técnico en Radiología
563	Técnico en Saneamiento Ambiental
564	Técnico en Terapia Ocupacional
565	Técnico en Terapia Respiratoria
566	Técnico en Terapia Respiratoria (4 horas diarias)
567	Técnico Especialista Materno Infantil
568	Técnico Especialista Programas de Salud
569	Técnico Financiero
570	Técnico I
571	Técnico Informatico
572	Técnico Optometrista
573	Técnico Supervisor de Mantenimiento
574	Técnico UFI
575	Tecnólogo de Alimentos
576	Tecnólogo Departamental de Alimentos
577	Tecnólogo en Anestesia
578	Tecnólogo en Fisioterapia
579	Tecnólogo en Radiología
580	Telefonista
581	Telefonista-Conmutador
582	Tesorero Institucional
583	Trabajador de Cuadrilla de Saneamiento Ambiental
584	Trabajador de Mantenimiento
585	Trabajador Social
586	Tramitador
587	Tramitador Aduanal
588	Viceministro
\.


--
-- Data for Name: cat_cargo_nominal; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY cat_cargo_nominal (id_cargonominal, descripcion) FROM stdin;
1	Abogado
2	Abogado I
3	Administrador de Centro de Salud
4	Analista de Pruebas Físico-Químicas
5	Analista de Pruebas Microbiológicas
6	Analista Programador
7	Asesor de Planificación en Salud
8	Asesor del Despacho
9	Asesor del Programa Nacional de ITS/VIH/SIDA
10	Asesor Jurídico
11	Asistente Administrativo (Nivel Central)
12	Asistente de Comunicaciones
13	Asistente de Estadística
14	Asistente de Suministros Departamental
15	Asistente Dental
16	Asistente Financiero
17	Asistente Técnico
18	Asistente Técnico Administrativo
19	Asistente Técnico Administrativo (Nivel Central)
20	Auditor
21	Auditor I
22	Auditor II
23	Auxiliar Administrativo
24	Auxiliar Administrativo I
25	Auxiliar Administrativo II
26	Auxiliar Contable
27	Auxiliar de Almacén
28	Auxiliar de Almacén I
29	Auxiliar de Almacén II
30	Auxiliar de Auditoría
31	Auxiliar de Auditoria I
32	Auxiliar de Bodega
33	Auxiliar de Compras y Suministros
34	Auxiliar de Control de Calidad
35	Auxiliar de Enfermería
36	Auxiliar de Enfermería de Salud Comunitaria
37	Auxiliar de Enfermería de Servicio Especializado
38	Auxiliar de Enfermería Hospitalaria
39	Auxiliar de Estadística
40	Auxiliar de Estadística (Hospital)
41	Auxiliar de Farmacia
42	Auxiliar de Impresiones
43	Auxiliar de Laboratorio
44	Auxiliar de Mantenimiento
45	Auxiliar de Mantenimiento I
46	Auxiliar de Nutrición
47	Auxiliar de Pagaduría
48	Auxiliar de Pagaduría II
49	Auxiliar de Personal I (Departamental y Hospitalario)
50	Auxiliar de Personal I (Nivel Regional y Hospitalario)
51	Auxiliar de Personal II
52	Auxiliar de Proveeduría
53	Auxiliar de Reproducción
54	Auxiliar de Servicio
55	Auxiliar de Servicio Varios
56	Auxiliar de Servicios
57	Auxiliar de Tesorería
58	Auxiliar Financiero
59	Ayudante de Almacén
60	Ayudante de Enfermería
61	Ayudante de Fisioterapia
62	Ayudante de Laboratorio
63	Bibliotecario
64	Bodeguero
65	Cajero
66	Camarógrafo
67	Capellán (tiempo parcial)
68	Citotecnólogo
69	Cocinero
70	Colaborador Administrativo
71	Colaborador Administrativo I
72	Colaborador Administrativo II
73	Colaborador Asistente
74	Colaborador de Recursos Humanos
75	Colaborador de Soporte Técnico
76	Colaborador Financiero
77	Colaborador Jurídico
78	Colaborador Jurídico I
79	Colaborador Jurídico II
80	Colaborador Técnico - Científico de Medicamentos e Insumos Médicos
81	Colaborador Técnico (Médico Especialista)
82	Colaborador Técnico (Nivel Central)
83	Colaborador Técnico Administrativo
84	Colaborador Técnico de Enfermería
85	Colaborador Técnico de Epidemiología
86	Colaborador Técnico de Formación y Capacitación
87	Colaborador Técnico de Nutrición (Hospital Especializado y Regional)
88	Colaborador Técnico de Supervisoría Médica
89	Colaborador Técnico en Nutrición (Hospital Especializado)
90	Colaborador Técnico Especialista
91	Colaborador Técnico Especializado
92	Colaborador Técnico I (Nivel Central)
93	Colaborador Técnico II
94	Colaborador Técnico III
95	Colaborador Técnico IV
96	Colaborador Técnico Médico
97	Colaborador Técnico Médico I
98	Colaborador Técnico V
99	Colaborador Técnico VI
100	Colector
101	Contador (Hospital)
102	Contador (Nivel Central y Departamental)
103	Contador de Hospitales
104	Contador Institucional
105	Coordinador Administrativo
106	Coordinador Area de Fondos Externos
107	Coordinador Area de Presupuesto
108	Coordinador de Area de Laboratorio Clínico
109	Coordinador de Area de Laboratorio Clínico (Segundo Nivel)
110	Coordinador de Area de Laboratorio Clínico (Tercer Nivel)
111	Coordinador de Centro de Cómputo
112	Coordinador de Información Ministerial
113	Coordinador de Informática
114	Coordinador de la Infraestructura de Salud
115	Coordinador de la Inversión Pública
116	Coordinador de Muestras e Inspección por Atributos
117	Coordinador de Programa
118	Coordinador de Programa Protección de Alimentos
119	Coordinador de Proyectos
120	Coordinador Jurídico
121	Coordinador Nacional de Desastres
122	Coordinador Nacional del Area Jurídica
123	Coordinador Unidad de Información en Salud
124	Costurera (Hospital)
125	Dibujante de Ilustraciones
126	Digitador
127	Digitador de Datos
128	Director Atención al Medio Ambiente
129	Director de Control y Vigilancia Epidemiológica
130	Director de Planificación y Modernización Institucional y Reforma Sectorial
131	Director de Regulación
132	Director General de Administración y Finanzas
133	Director General de Salud y Aseguramiento de la Calidad
134	Director Médico Hospital Especializado
135	Director Médico Hospital Regional y Departamental
136	Diseñador
137	Diseñador Gráfico
138	Educador para la Salud (Nivel Local)
139	Educador Supervisor
140	Educador Supervisor (Nivel Central)
141	Educador Supervisor Departamental
142	Encargada Clínica Asistencial (Nivel Central)
143	Encargada de Fondos
144	Encargada de Kardex
145	Encargada de Relaciones Publicas
146	Encargado de Activo Fijo
147	Encargado de Asuntos Jurídicos
148	Encargado de Compras
149	Encargado de Control de Estupefacientes (Suministros)
150	Encargado de Control Presupuestario
151	Encargado de Despensa
152	Encargado de Farmacia
153	Encargado de Fórmulas Nutricionales
154	Encargado de Impresión
155	Encargado de Informática
156	Encargado de Programa Saneamiento Ambiental
157	Encargado de Proyecto
158	Encargado de Unidad de Patrimonio
159	Enfermera
160	Enfermera Colaborador Técnico de Capacitación
161	Enfermera Comunitaria
162	Enfermera de Unidad Móvil Rural
163	Enfermera Hospitalaria
164	Enfermera Jefe de Unidad Hospitalaria
165	Enfermera Jefe del Departamento de Enfermería (Hospital Especializado)
166	Enfermera Jefe del Servicio de Arsenal y Central de Esterilización
167	Enfermera Jefe Departamental
168	Enfermera Jefe Departamento de Enfermería (Hospital Regional y Departamental)
169	Enfermera Jefe División de Enfermería
170	Enfermera Subjefe Departamento de Enfermería (Hospital Regional y Departamental)
171	Enfermera Subjefe Departamento de Enfermería (Hospital)
172	Enfermera Supervisora
173	Enfermera Supervisora (Nivel Central)
174	Enfermera Supervisora (Nivel Local)
175	Enfermera Supervisora Departamental
176	Enfermera Supervisora Hospitalaria
177	Enfermera Supervisora Local
178	Entomólogo de Enfermedades Transmisibles por Vectores
179	Especialista en Alimentos
180	Estadístico Asesor (Nivel Central)
181	Estadístico Supervisor Departamental
182	Estudiante de Medicina en Servicio Social (Director de Unidad de Salud y Unidad Móvil)
183	Estudiante de Medicina en Servicio Social Director de Unidad de Salud y Unidad Móvil Rural
184	Estudiante de Odontologia en Servicio Social
185	Estudiante de Odontología en Servicio Social (4 horas diarias)
186	Fisioterapista
187	Fisioterapista (5 horas)
188	Gerente de Programa Atención Integral en Salud
189	Guardalmacén (con fianza, Centros y Hospitales)
190	Guardalmacén I (con fianza, Centros y Hospitales)
191	Guardalmacén I (con fianza, Hospital)
192	Guardalmacén II (con fianza, Departamental y Nivel Central)
193	Guardalmacén II (con fianza)
194	Impresor
195	Ingeniero Biomédico
196	Ingeniero Eléctrico
197	Inspector de Control de Calidad de Medicamentos
198	Inspector de Saneamiento Ambiental
199	Inspector Promotor Antimalaria
200	Inspector Promotor Departamental
201	Inspector Técnico en Saneamiento Ambiental
202	Interventor
203	Jardinero
204	Jefe  de Laboratorio Clínico (Primer Nivel)
205	Jefe  Departamento  Financiero  Contable (Hospital Regional y Departamental)
206	Jefe  Departamento  Financiero Contable (Hospital Especializado)
207	Jefe  Departamento Financiero Contable (Departamental y Hospital)
208	Jefe Administrativo (Nivel Central)
209	Jefe Administrativo Departamental
210	Jefe Area de Banco de Sangre (Segundo Nivel)
211	Jefe Area de Banco de Sangre (Tercer Nivel)
212	Jefe Area de Laboratorio Productos Biológicos
213	Jefe Centro Nacional de Biológicos
214	Jefe de  Laboratorio Clínico (Segundo Nivel)
215	Jefe de Almacenes (Nivel Central)
216	Jefe de Area Clínica
217	Jefe de Auditoría
218	Jefe de Cocina
219	Jefe de Consulta Externa
220	Jefe de Consulta Externa (2 horas diarias)
221	Jefe de Consulta Externa (3 horas diarias)
222	Jefe de Consulta Externa (4 horas diarias)
223	Jefe de Consulta Externa (6 horas diarias)
224	Jefe de Cuadrilla de Rociado
225	Jefe de Departamento Alimentación y Dietas
226	Jefe de Departamento de Alimentación y Dietas (Hospital)
227	Jefe de Departamento de Mantenimiento (Hospital Especializado)
228	Jefe de Departamento de Recursos Humanos (Hospital Regional y Departamental)
229	Jefe de Departamento Financiero Contable (Hospital Regional y Departamental)
230	Jefe de División Administración de Recursos Humanos
231	Jefe de Educación para la Salud Departamental
232	Jefe de Electromecánica y Biomédica Departamental
233	Jefe de Estadística
234	Jefe de Estadística Departamental
235	Jefe de Evaluación y Control de Abastecimientos
236	Jefe de Farmacia
237	Jefe de Farmacia (4 horas diarias)
238	Jefe de la Unidad de Admisiòn y Contribuciones
239	Jefe de la Unidad de Informática
240	Jefe de la Unidad Técnica de Medicamentos e Insumos Médicos
241	Jefe de Laboratorio  Clínico (Tercer Nivel)
242	Jefe de Laboratorio Clínico (Hospital Especializado y Regional)
243	Jefe de Laboratorio Clínico (Primer Nivel)
244	Jefe de Laboratorio Clínico (Segundo Nivel)
245	Jefe de Mantenimiento
246	Jefe de Nutrición Departamental
247	Jefe de Programa Nacional de Salud Mental
248	Jefe de Radiología
249	Jefe de Recursos Humanos
250	Jefe de Recursos Humanos Departamental
251	Jefe de Residentes
252	Jefe de Saneamiento Ambiental
253	Jefe de Sección de Lavandería (Hospital)
254	Jefe de Sección Unidad de Informática (Nivel Central)
255	Jefe de Servicio de Fisioterapia
256	Jefe de Servicio Radiología
257	Jefe de Servicios Generales Departamental
258	Jefe de Suministros Departamental
259	Jefe de Telefonía (Hospital)
260	Jefe de Trabajo Social
261	Jefe de Transporte Departamental
262	Jefe de Unidad de  Vigilancia Epidemiológica
263	Jefe de Unidad de Asesoría Jurídica
264	Jefe de Unidad de Auditoría Interna (Hospital Especializado)
265	Jefe de Unidad de Control Vectorial
266	Jefe de Unidad de Cuidados Intensivos (Hospital Especializado)
267	Jefe de Unidad de Emergencia (Hospital Especializado, 8 horas diarias)
268	Jefe de Unidad de Emergencia (Hospital Especializado)
269	Jefe de Unidad de Enseñanza (Hospital Especializado, 4 horas diarias)
270	Jefe del Area de Citología (Nivel Central, 6 horas diarias)
271	Jefe del Area de Laboratorio de Bromatología (Nivel Central)
272	Jefe del Departamento Alimentación y Dietas (Hospital Regional y Departamental)
273	Jefe del Departamento de Alimentación y Dietas (Hospital Especializado)
274	Jefe del Servicio de Fisioterapia
275	Jefe del Servicio de Terapia Ocupacional
276	Jefe Departamental Sección de Inspectores en Saneamiento Ambiental
277	Jefe Departamento Alimentación y Dietas (Hospital Regional y Departamental)
278	Jefe Departamento Arsenal y Central de Esterilización
279	Jefe Departamento Capacitación y Desarrollo
280	Jefe Departamento Control de Vectores (Nivel Central)
281	Jefe Departamento de Diagnóstico y Servicios de Apoyo (Hospital Especializado 6 horas diarias)
282	Jefe Departamento de Diagnóstico y Servicios de Apoyo (Hospital Especializado, 4 Horas diarias)
283	Jefe Departamento de Diagnóstico y Servicios de Apoyo (Hospital Especializado)
285	Jefe Departamento de Farmacia
286	Jefe Departamento de Mantenimiento (Hospital Especializado)
287	Jefe Departamento de Mantenimiento (Hospital Regional y Departamental)
288	Jefe Departamento de Nutrición (Nivel Central)
289	Jefe Departamento de Prestaciones Sociales y Laborales
290	Jefe Departamento de Recursos Humanos (Hospital Especializado)
291	Jefe Departamento de Recursos Humanos (Hospital Regional y Departamental)
292	Jefe Departamento de Relaciones Públicas
293	Jefe Departamento de Suministros
294	Jefe Departamento de Suministros (Hospital Especializado)
295	Jefe Departamento de Suministros (Hospital Regional y Departamental)
296	Jefe Departamento Financiero Contable
297	Jefe Departamento Financiero Contable (Hospital Regional y Departamental)
298	Jefe Departamento Gestión de Suministros
299	Jefe Departamento Laboratorio de Control de Calidad (Nivel Central)
300	Jefe Departamento Médico (Hospital Regional y Departamental, 2 horas diarias)
301	Jefe Departamento Médico (Hospital Regional y Departamental, 4 horas diarias)
302	Jefe Departamento Médico (Hospital Regional y Departamental, 6 horas diarias)
303	Jefe Departamento Médico de Hospital Especializado
304	Jefe Departamento Médico de Hospital Especializado (2 horas diarias)
305	Jefe Departamento Médico de Hospital Especializado (4 horas diarias)
306	Jefe Departamento Médico de Hospital Especializado (8 horas diarias)
307	Jefe Departamento Recursos Humanos (Departamental y Hospital)
308	Jefe Departamento Servicios Auxiliares
309	Jefe Departamento Servicios Generales (Hospital Especializado)
310	Jefe Departamento Servicios Generales (Hospital Regional y Departamental)
311	Jefe División Administrativa (Hospital Especializado)
312	Jefe División Administrativa (Hospital Regional y Departamental)
313	Jefe División Control de Calidad
314	Jefe División de Diagnóstico y Servicios de Apoyo (Hospital Especializado, 4 horas diarias)
315	Jefe División de Diagnóstico y Servicios de Apoyo (Hospital Especializado)
316	Jefe División Mantenimiento General (Nivel Central)
317	Jefe División Médica (Hospital Regional y Departamental, 4 horas diarias)
318	Jefe División Médica (Hospital Regional y Departamental)
319	Jefe División Médica de Hospital Especializado
320	Jefe División Médica de Hospital Especializado (4 horas diarias)
321	Jefe División Médica de Hospital Especializado (6 horas diarias)
322	Jefe División Saneamiento Ambiental
323	Jefe División Servicios Generales (Nivel Central)
324	Jefe Encargado de Oxígeno (Hospital)
325	Jefe Financiero Contable Departamental
326	Jefe Operación de Campo
327	Jefe Programas de Salud
328	Jefe Sección Auxiliares de Servicio
329	Jefe Sección Auxiliares de Servicio (Hospital)
330	Jefe Sección Capacitación de Mantenimiento (Nivel Central)
331	Jefe Sección Correspondencia y Archivo (Nivel Central)
332	Jefe Sección Costurería (Hospitales)
333	Jefe Sección de Calidad
334	Jefe Sección de Estadística y Documentos Médicos (Hospital)
335	Jefe Sección de Lavandería (Hospital)
336	Jefe Sección de Personal
337	Jefe Sección de Porteros Vigilantes (Hospital)
338	Jefe Sección de Transporte
339	Jefe Sección de Transportes (Hospital)
340	Jefe Sección Distribución de Vehículos (Nivel Central)
341	Jefe Sección Electromecánica (Nivel Central)
342	Jefe Sección Equipo Médico (Nivel Central)
343	Jefe Sección Lavandería (Hospital)
344	Jefe Sección Mecánica General (Nivel Central)
345	Jefe Sección Operativo de Almacén (Nivel Central)
346	Jefe Sección Planta Física y Mobiliario (Nivel Central)
347	Jefe Sección Porteros Vigilantes
348	Jefe Sección Servicios Auxiliares (Nivel Central)
349	Jefe Sección Trámites de Importación (Nivel Central)
350	Jefe Sección Zoonosis
351	Jefe Sector de Malaria
352	Jefe Servicio de Fisioterapia
353	Jefe Unidad Adquisiciones y Contrataciones (UACI)
354	Jefe Unidad Adquisiciones y Contrataciones Institucionales
355	Jefe Unidad Asesora Proyectos de Ingeniería
356	Jefe Unidad Auditoría Interna (Hospital Especializado)
357	Jefe Unidad Cooperación Externa
358	Jefe Unidad de Comunicaciones
359	Jefe Unidad de Cuidados Intensivos Hospital Especializado (4 horas diarias)
360	Jefe Unidad de Emergencia Hospital Especializado
361	Jefe Unidad de Enseñanza Hospital Especializado
362	Jefe Unidad de Odontología
363	Jefe Unidad de Planificación
364	Jefe Unidad de Planificación Hospital Especializado
365	Jefe Unidad de Relaciones Públicas
366	Jefe Unidad Financiera Institucional
367	Jefe Unidad Laboratorio Central
368	Kardista
369	Kardista (Hospital)
370	Laboratorista
371	Laboratorista (4 horas diarias)
372	Laboratorista II
373	Lavandera y Planchadora
374	Lavandera y Planchadora (Hospital)
375	Médico Colaborador Técnico
376	Médico Consulta General (10 horas semanales)
377	Médico Consulta General (2 horas diarias)
378	Médico Consulta General (3 horas diarias)
379	Médico Consulta General (8 horas diarias)
380	Médico de Consulta General (1 hora diaria)
381	Médico de Consulta General (2 horas diarias)
382	Médico de Consulta General (3 horas diarias)
383	Médico de Consulta General (4 horas diarias)
384	Médico de Consulta General (6 horas diarias)
385	Médico Director de Unidad de Salud (Comunitario y Rural, 2 horas diarias)
386	Médico Director de Unidad de Salud (Comunitario y Rural, 4 horas diarias)
387	Médico Director de Unidad de Salud (Comunitario y Rural, 6 horas diarias)
388	Médico Director de Unidad de Salud (Comunitario y Rural)
389	Médico Docente e Investigación
390	Médico Docente e Investigación (2 horas diarias)
391	Médico Docente e Investigación (4 horas diarias)
392	Médico Epidemiólogo
393	Médico Epidemiólogo (1 hora diaria)
394	Médico Epidemiólogo (4 horas diarias)
395	Médico Epidemiólogo (6 horas diarias)
396	Médico Especialista
397	Médico Especialista (6 horas diarias)
398	Médico Especialista I
399	Médico Especialista I (1 hora diaria)
400	Médico Especialista I (2 horas diarias)
401	Médico Especialista I (3 horas diarias)
402	Médico Especialista I (4 horas diarias)
403	Médico Especialista I (6 horas diarias)
404	Médico Especialista I (8 horas diarias)
405	Médico Especialista II
406	Médico Especialista II (2 horas diarias)
407	Médico Especialista II (3 horas diarias)
408	Médico Especialista II (4 horas diarias)
409	Médico Especialista II (6 horas diarias)
410	Médico Especialista II (8 horas diarias)
411	Médico Jefe de Emergencias
412	Médico Jefe de Emergencias (2 horas diarias)
413	Médico Jefe de Emergencias (3 horas diarias)
414	Médico Jefe de Emergencias (4 horas diarias)
415	Médico Jefe de Servicio
416	Médico Jefe de Servicio (2 horas diarias)
417	Médico Jefe de Servicio (3 horas diarias)
418	Médico Jefe de Servicio (4 horas diarias)
419	Médico Jefe de Servicio (6 horas diarias)
420	Médico Practicante Interno de Medicina
421	Médico Residente
422	Médico Residente en Subespecialidad
423	Médico Residente I
424	Médico Residente I (Becario)
425	Médico Residente II
426	Médico Residente II (Becario)
427	Médico Residente III (Becario)
428	Médico Subdirector de Unidad de Salud (6 horas diarias)
429	Médico Supervisor
430	Médico Veterinario
431	Mensajero
432	Mensajero (Nivel Central)
433	Ministro
434	Motorista
435	Motorista del Despacho
436	Motorista I
437	Motorista II
438	Nutricionista Supervisor Departamental
439	Obrero de Mantenimiento
440	Obrero de Mantenimiento I
441	Obrero de Mantenimiento II
442	Odontólogo (2 horas diarias)
443	Odontólogo (4 horas diarias)
444	Odontólogo (6 horas diarias)
445	Odontólogo (8 horas diarias)
446	Odontólogo Colaborador Técnico
447	Odontólogo Colaborador Técnico (Nivel Central)
448	Odontólogo Consulta Externa ( 2 hras diarias )
449	Odontólogo Docente Asistencial (2 horas diarias)
450	Odontólogo Especialista (2 horas diarias)
451	Odontólogo Especialista (4 horas diarias)
452	Odontólogo Jefe de Servicio (2 horas diarias)
453	Odontólogo Supervisor Departamental
454	Odontólogo Supervisor Departamental (6 horas diarias)
455	Operador de Cuarto Oscuro
456	Operador de Sistemas I
457	Operador Equipo Audiovisual
458	Operador Técnico de Equipo
459	Ordenanza
460	Ordenanza Mensajero
461	P
462	Pagador Auxiliar de Remuneraciones (Nivel Central)
463	Pintor
464	Portero Vigilante
465	Practicante Interno
466	Prensista
467	Preparador de Fórmulas Nutricionales
468	Profesional de Nutrición
469	Profesional en  Laboratorio  Clínico Primer Nivel( 4 horas diarias)
470	Profesional en Laboratorio  Clínico (Tercer Nivel)
471	Profesional en Laboratorio Clínico (Nivel Central)
472	Profesional en Laboratorio Clínico (Primer Nivel)
473	Profesional en Laboratorio Clínico (Segundo Nivel)
474	Profesional en Nutrición (Nivel Central)
475	Profesional en Planeación Estratégica
476	Profesional en Producción de Biológicos
477	Profesional en Química y Farmacia
478	Profesional en Química y Farmacia (4 horas diarias)
479	Promotor
480	Promotor Antidengue
481	Promotor de Educación Antimalaria
482	Promotor de Nutrición (4 horas diarias)
483	Promotor de Salud
484	Psicólogo
485	Psicólogo (2 horas diarias)
486	Psicólogo (4 horas diarias)
487	Psicólogo (6 horas diarias)
488	Psicólogo (8 horas diarias)
489	Químico Analista II
490	Químico Farmacéutico
491	Radiotecnólogo
492	Religiosa
493	Rociador de Malaria
494	Secretaria
495	Secretaria  I
496	Secretaria  III
497	Secretaria - Recepcionista
498	Secretaria del Despacho
499	Secretaria Ejecutiva
500	Secretaria I
501	Secretaria II
502	Secretaria III
503	Subdirector Médico Hospital Especializado
504	Subdirector Médico Hospital Especializado (8 horas diarias)
505	Subdirector Médico Hospital Regional y Departamental
506	Subdirector Médico Hospital Regional y Departamental (4 horas diarias)
507	Subdirector Médico Hospital Regional y Departamental (6 horas diarias)
508	Subjefe de Estadística Departamental
509	Subjefe de Farmacia
510	Subjefe de Farmacia (4 horas diarias)
511	Subjefe de la Unidad de Informática (Nivel Central)
512	Subjefe del Servicio de Anestesiología
513	Subjefe Departamento Almacenamiento y Distribución (Nivel Central)
514	Subjefe Departamento de Nutrición (Nivel Central)
515	Subjefe Departamento Laboratorio Control de Calidad (Nivel Central)
516	Subjefe División Saneamiento Ambiental
517	Subjefe Sección de Estadística y Documentos Médicos (Hospital)
518	Subjefe Unidad Asesoria Jurídica
519	Supervisor de Almacenes
520	Supervisor de Laboratorio (Primer Nivel)
521	Supervisor de Lavandería (Hospital)
522	Supervisor de Limpieza
523	Supervisor de Obras
524	Supervisor del Nivel Central en Saneamiento Ambiental
525	Supervisor Departamental de Malaria
526	Supervisor Departamental de Salud Comunitaria
527	Supervisor Departamental del Control de Enfermedades Transmisibles por Vectores
528	Supervisor Departamental Jefe de Promotores
529	Supervisor Departamental Técnico en Saneamiento Ambiental
530	Supervisor Específico de Promotores de Salud
531	Supervisor Local Técnico en Saneamiento Ambiental
532	Técnico Administrativo (Nivel Central)
533	Técnico Anestesista
534	Técnico Audiometrista
535	Técnico Auxiliar
536	Técnico Auxiliar I
537	Técnico Biomedico
538	Técnico de Comunicaciones
539	Técnico de Fotografía
540	Técnico de Mantenimiento I
541	Técnico de Mantenimiento II
542	Técnico de Mantenimiento III
543	Técnico de Personal I
544	Técnico de Personal II
545	Técnico de Planificación
546	Técnico en Anatomía Patológica
547	Técnico en Anestesia
548	Técnico en Arsenal y Central de Esterilización
549	Técnico en Autopsia
550	Técnico en Citopatología
551	Técnico en Electroencefalografía y Electrocardiograma
552	Técnico en Estadística y Documentos Médicos (Hospital)
553	Técnico en Farmacia
554	Técnico en Fisioterapia
555	Técnico en Gammografía
556	Técnico en Mantenimiento I
557	Técnico en Mantenimiento II
558	Técnico en Mantenimiento III
559	Técnico en Presupuesto
560	Técnico en Proyectos
561	Técnico en Radio-Isótopos
562	Técnico en Radiología
563	Técnico en Saneamiento Ambiental
564	Técnico en Terapia Ocupacional
565	Técnico en Terapia Respiratoria
566	Técnico en Terapia Respiratoria (4 horas diarias)
567	Técnico Especialista Materno Infantil
568	Técnico Especialista Programas de Salud
569	Técnico Financiero
570	Técnico I
571	Técnico Informatico
572	Técnico Optometrista
573	Técnico Supervisor de Mantenimiento
574	Técnico UFI
575	Tecnólogo de Alimentos
576	Tecnólogo Departamental de Alimentos
577	Tecnólogo en Anestesia
578	Tecnólogo en Fisioterapia
579	Tecnólogo en Radiología
580	Telefonista
581	Telefonista-Conmutador
582	Tesorero Institucional
583	Trabajador de Cuadrilla de Saneamiento Ambiental
584	Trabajador de Mantenimiento
585	Trabajador Social
586	Tramitador
587	Tramitador Aduanal
588	Viceministro
\.


--
-- Data for Name: cat_departamento; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY cat_departamento (id_departamento, descripcion, factor, gis, digestyc, id_region, abreviatura) FROM stdin;
1	Ahuachapan	24	4	01	1	AH
2	Santa Ana	24	14	02	1	SA
3	Sonsonate	24	10	03	1	SO
6	San Salvador	40	6	06	5	SS
7	Cuscatlan	12	2	07	4	CU
8	La Paz	12	13	08	4	LP
9	Cabañas	12	7	09	4	CA
10	San Vicente	12	11	10	4	SV
11	Usulutan	24	12	11	2	US
12	San Miguel	24	9	12	2	SM
13	Morazan	24	3	13	2	MO
14	La Union	24	8	14	2	LU
15	Guatemala	\N	\N	NULL	9	NULL
16	Honduras	\N	\N	NULL	9	NULL
17	Nicaragua	\N	\N	NULL	9	NULL
18	Costa Rica	\N	\N	NULL	9	NULL
19	Panama	\N	\N	NULL\t	9	NULL
20	Otros Paises	\N	\N	NULL	9	NULL
4	Chalatenango	18	1	04	3	CH
5	La Libertad	18	5	05	3	LL
\.


--
-- Data for Name: cat_ecos; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY cat_ecos (idestasib, sibasi, subred, id_mun, tipo, estasib, lat, lng, nivelmspas, codigoucsf, id_region, id_simmow, anio_apertura) FROM stdin;
1	6	0	45	J	UCSF Citala CH	0	0	1	1	5	1	2010
2	6	0	45	J	UCSF Cítala CH San Ramon	0	0	1	2	5	2	2010
3	6	0	53	L	UCSFE La Palma CH	0	0	1	3	5	3	2010
4	6	0	53	J	UCSF La Palma CH Horcones	0	0	1	4	5	4	2010
5	6	0	53	J	UCSF La Plama CH San José Sacare	0	0	1	5	5	5	2010
6	6	0	53	J	UCSF La Palma CH Granadillas	0	0	1	6	5	6	2010
7	6	0	66	J	UCSF San Ignacio CH	0	0	1	7	5	7	2010
8	6	0	66	J	UCSF San Ignacio CH El Carmen	0	0	1	8	5	8	2010
9	6	0	66	J	UCSF San Ignacio CH Las Pilas	0	0	1	9	5	9	2010
10	6	0	54	J	UCSF La Reina CH	0	0	1	10	5	10	2010
11	6	0	54	J	UCSF La Reina CH El Pepeto	0	0	1	11	5	11	2010
12	6	0	54	J	UCSF La Reina CH El Tigre	0	0	1	12	5	12	2010
13	6	0	43	J	UCSF Arcatao CH	0	0	1	13	5	13	2010
14	6	0	58	J	UCSF Nueva Trinidad CH	0	0	1	14	5	14	2010
15	6	0	69	J	UCSF San Jose Las Flores CH	0	0	1	15	5	15	2010
16	6	0	56	J	UCSF Nombre de Jesus CH	0	0	1	16	5	16	2010
17	6	0	56	J	UCSF Nombre de Jesus CH Junquillo	0	0	1	17	5	17	2010
18	6	0	61	J	UCSF San Antonio de la Cruz CH	0	0	1	18	5	18	2010
19	6	0	67	J	UCSF San Isidro Labrador CH	0	0	1	19	5	19	2010
20	6	0	68	J	UCSF San José Cancasque CH	0	0	1	20	5	20	2010
21	6	0	60	J	UCSF Potonico CH	0	0	1	21	5	21	2010
22	6	0	62	J	UCSF San Antonio los Ranchos CH	0	0	1	22	5	22	2010
23	6	0	71	J	UCSF San Miguel de Mercedes CH	0	0	1	23	5	23	2010
24	6	0	55	J	UCSF Las Vueltas CH	0	0	1	24	5	24	2010
25	6	0	59	J	UCSF Ojos de Agua CH	0	0	1	25	5	25	2010
26	6	0	59	J	UCSF Ojos de Agua CH El Zapotal	0	0	1	26	5	26	2010
27	6	0	50	J	UCSF El Carrizal CH	0	0	1	27	5	27	2010
28	6	0	50	J	UCSF El Carrizal CH Vanillas	0	0	1	28	5	28	2010
29	6	0	52	J	UCSF La Laguna CH	0	0	1	29	5	29	2010
30	6	0	52	J	UCSF La Laguna CH San Jose	0	0	1	30	5	30	2010
31	6	0	46	J	UCSF Comalapa CH	0	0	1	31	5	31	2010
32	6	0	46	J	UCSF Comalapa CH Guachipilín	0	0	1	32	5	32	2010
33	6	0	48	L	UCSFE Chalatenango CH Guarjila	0	0	1	33	5	33	2010
34	6	0	49	J	UCSF Dulce Nombre de Maria CH	0	0	1	34	5	34	2010
35	6	0	49	J	UCSF Dulce Nombre de Maria CH Ocotal	0	0	1	35	5	35	2010
36	6	0	49	J	UCSF Dulce Nombre de Maria CH Gutierrez	0	0	1	36	5	36	2010
37	6	0	72	J	UCSF San Rafael CH	0	0	1	37	5	37	2010
38	6	0	72	J	UCSF San Rafael CH San Jose Los Sitios	0	0	1	38	5	38	2010
39	6	0	73	J	UCSF Santa Rita CH	0	0	1	39	5	39	2010
40	6	0	73	J	UCSF Santa Rita CH El Sol	0	0	1	40	5	40	2010
41	6	0	63	J	UCSF San Fernando CH	0	0	1	41	5	41	2010
42	6	0	47	J	UCSF Concepción Quezaltepeque	0	0	1	42	5	42	2010
43	6	0	47	J	UCSF Concepción Quezaltepeque CH Llano Grande	0	0	1	43	5	43	2010
44	6	0	47	J	UCSF Concepción Quezaltepeque CH Monte Redondo	0	0	1	44	5	44	2010
45	6	0	42	J	UCSF Agua Caliente CH	0	0	1	45	5	45	2010
46	6	0	42	J	UCSF Agua Caliente CH El Carmen	0	0	1	46	5	46	2010
47	6	0	42	J	UCSF Agua Caliente CH Cerro Grande	0	0	1	47	5	47	2010
48	6	0	42	J	UCSF Agua Caliente CH Obrajuelo	0	0	1	48	5	48	2010
49	6	0	70	J	UCSF San Luis del Carmen CH	0	0	1	49	5	49	2010
50	6	0	65	J	UCSF San Francisco Morazan CH	0	0	1	50	5	50	2010
51	12	0	209	J	UCSF Nuevo Eden de San juan SM	0	0	1	51	4	51	2010
52	12	0	209	J	UCSF Nuevo Eden de San Juan SM San Sebastian	0	0	1	52	4	52	2010
53	12	0	156	J	UCSF Ilobasco CA San Jose	0	0	1	53	4	53	2010
54	12	0	156	J	UCSF Ilobasco CA Agua Zarca	0	0	1	54	4	54	2010
55	12	0	156	J	UCSF Ilobasco CA Cerro Colorado	0	0	1	55	4	55	2010
56	12	0	156	J	UCSF Ilobasco CA San Francisco Iraheta	0	0	1	56	4	56	2010
57	12	0	156	J	UCSF Ilobasco CA Potreros	0	0	1	57	4	57	2010
58	12	0	156	J	UCSF Ilobasco CA Los Llanitos	0	0	1	58	4	58	2010
59	12	0	156	J	UCSF Ilobasco CA Huertas	0	0	1	59	4	59	2010
60	12	0	156	J	UCSF Ilobasco CA Sitio Viejo	0	0	1	60	4	60	2010
61	12	0	156	J	UCSF Ilobasco CA Maquilishuat Santa Lucia	0	0	1	61	4	61	2010
62	12	0	156	J	UCSF Ilobasco CA Maquilishuat El Limón	0	0	1	62	4	62	2010
63	12	0	156	J	UCSF Ilobasco CA San Francisco del Monte	0	0	1	63	4	63	2010
64	12	0	157	J	UCSF Jutiapa CA	0	0	1	64	4	64	2010
65	12	0	157	J	UCSF Jutiapa CA Carolina	0	0	1	65	4	65	2010
66	12	0	154	J	UCSF Cinquera CA	0	0	1	66	4	66	2010
67	12	0	160	J	UCSF Tejutepeque CA	0	0	1	67	4	67	2010
68	12	0	160	J	UCSF Tejutepeque CA Concepción	0	0	1	68	4	68	2010
69	12	0	160	J	UCSF Tejutepeque CA El Zapote	0	0	1	69	4	69	2010
70	12	0	161	J	UCSF Victoria CA	0	0	1	70	4	70	2010
71	12	0	161	J	UCSF Victoria CA Azacualpa	0	0	1	71	4	71	2010
72	12	0	161	J	UCSF Victoria CA SanAntonio	0	0	1	72	4	72	2010
73	12	0	161	J	UCSF Victoria CA San Pedro	0	0	1	73	4	73	2010
74	12	0	161	J	UCSF Victoria CA Santa Marta	0	0	1	74	4	74	2010
75	12	0	162	J	UCSF Dolores CA	0	0	1	75	4	75	2010
76	12	0	162	J	UCSF Dolores CA San Carlos	0	0	1	76	4	76	2010
77	17	0	211	J	UCSF San Antonio SM	0	0	1	77	2	77	2010
78	17	0	199	J	UCSF Carolina SM 1	0	0	1	78	2	78	2010
79	17	0	199	J	UCSF Carolina SM La Ceibita	0	0	1	79	2	79	2010
80	17	0	199	J	UCSF Carolina SM Rosa Nacaspilo	0	0	1	80	2	80	2010
81	17	0	212	J	UCSF San Gerardo SM San Jeronimo	0	0	1	81	2	81	2010
82	17	0	212	J	UCSF San Gerardo SM 2	0	0	1	82	2	82	2010
83	20	0	227	J	UCSF Guatajiagua MO 1	0	0	1	83	2	83	2010
84	20	0	227	J	UCSF Guatajiagua MO 2	0	0	1	84	2	84	2010
85	20	0	227	J	UCSF Guatajiagua MO Maiguera	0	0	1	85	2	85	2010
86	20	0	227	J	UCSF Guatajiagua MO San Bartolo	0	0	1	86	2	86	2010
87	20	0	227	J	UCSF Guatajiagua MO Los Abelines	0	0	1	87	2	87	2010
88	20	0	240	J	UCSF Sensembra MO	0	0	1	88	2	88	2010
89	20	0	243	J	UCSF Yamabal MO San Juan de La Cruz	0	0	1	89	2	89	2010
90	20	0	243	J	UCSF Yamabal MO Isletas	0	0	1	90	2	90	2010
91	20	0	242	J	UCSF Torola MO	0	0	1	91	2	91	2010
92	20	0	236	J	UCSF San Fernando MO	0	0	1	92	2	92	2010
93	20	0	229	J	UCSF Jocoaitique MO	0	0	1	93	2	93	2010
94	20	0	229	J	UCSF Jocoaitique MO Quebrachos	0	0	1	94	2	94	2010
95	20	0	219	J	UCSF Arambala MO	0	0	1	95	2	95	2010
96	20	0	228	J	UCSF Joateca MO	0	0	1	96	2	96	2010
97	20	0	228	J	UCSF Joateca MO La Laguna	0	0	1	97	2	97	2010
98	20	0	225	J	UCSF El Rosario MO Villa el Rosario	0	0	1	98	2	98	2010
99	20	0	238	J	UCSF San Isidro MO	0	0	1	99	2	99	2010
100	20	0	239	J	UCSF San Simón MO 3	0	0	1	100	2	100	2010
101	20	0	239	J	UCSF San Simón MO Potrero Adentro	0	0	1	101	2	101	2010
102	17	0	239	J	UCSF San Simón MO El Carrizal 1	0	0	1	102	2	102	2010
103	17	0	239	J	UCSF San Simón MO Las Quebradas	0	0	1	103	2	103	2010
104	20	0	226	J	UCSF Gualococti MO	0	0	1	104	2	104	2010
105	20	0	223	J	UCSF Delicias de Concepción MO 1	0	0	1	105	2	105	2010
106	20	0	223	J	UCSF Delicias de Concepción MO El Volcan	0	0	1	106	2	106	2010
107	20	0	222	J	UCSF Chilanga MO 1	0	0	1	107	2	107	2010
108	20	0	222	J	UCSF Chilanga MO Las Crucitas	0	0	1	108	2	108	2010
109	20	0	222	J	UCSF Chilanga MO Piedra Parada	0	0	1	109	2	109	2010
110	20	0	221	J	UCSF Corinto MO 1	0	0	1	110	2	110	2010
111	20	0	221	J	UCSF Corinto MO 2	0	0	1	111	2	111	2010
112	20	0	221	J	UCSF Corinto MO Corralito San Francisco	0	0	1	112	2	112	2010
113	20	0	221	J	UCSF Corinto MO San Felipe Los Villatoro	0	0	1	113	2	113	2010
114	20	0	221	J	UCSF Corinto MO La Hermita	0	0	1	114	2	114	2010
115	20	0	231	J	UCSF Lolotiquillo MO	0	0	1	115	2	115	2010
116	20	0	231	J	UCSF Lolotiquillo MO Gualindo	0	0	1	116	2	116	2010
117	20	0	220	J	UCSF Cacaopera MO	0	0	1	117	2	117	2010
118	20	0	220	J	UCSF Cacaopera MO La Estancia	0	0	1	118	2	118	2010
119	20	0	220	J	UCSF Cacaopera MO Agua Blanca	0	0	1	119	2	119	2010
120	20	0	220	J	UCSF Cacaopera MO Sunsula	0	0	1	120	2	120	2010
121	21	0	253	J	UCSF Lislique LU	0	0	1	121	2	121	2010
122	21	0	253	J	UCSF Lislique LU Pilas	0	0	1	122	2	122	2010
123	21	0	253	J	UCSF Lislique LU El Derrumbado	0	0	1	123	2	123	2010
124	21	0	253	J	UCSF Lislique LU Higueras	0	0	1	124	2	124	2010
125	21	0	253	J	UCSF Lislique LU Guajiniquil	0	0	1	125	2	125	2010
126	21	0	258	J	UCSF San Jose La Fuente LU	0	0	1	126	2	126	2010
127	17	0	260	J	UCSF Yayantique LU	0	0	1	127	2	127	2010
128	17	0	260	J	UCSF Yayantique LU El Pastor	0	0	1	128	2	128	2010
129	17	0	260	J	UCSF Yayantique LU Los Amates	0	0	1	129	2	129	2010
130	21	0	254	J	UCSF Nueva Esparta LU	0	0	1	130	2	130	2010
131	21	0	254	J	UCSF Nueva esparta LU Monteca	0	0	1	131	2	131	2010
132	21	0	254	J	UCSF Nueva Esparta LU Las Marias	0	0	1	132	2	132	2010
133	21	0	254	J	UCSF Nueva Esparta LU Honduritas	0	0	1	133	2	133	2010
134	21	0	256	J	UCSF Poloros LU	0	0	1	134	2	134	2010
135	21	0	256	J	UCSF Poloros LU Boquin	0	0	1	135	2	135	2010
136	21	0	256	J	UCSF Poloros LU Carpintero	0	0	1	136	2	136	2010
137	21	0	256	J	UCSF Poloros LU Ocote	0	0	1	137	2	137	2010
138	2	0	17	J	UCSF El Porvenir SA	0	0	1	138	1	138	2010
139	2	0	17	J	UCSF El Porvenir SA El Cerrón	0	0	1	139	1	139	2010
140	2	0	17	J	UCSF El Porvenir SA Amate Blanco	0	0	1	140	1	140	2010
141	2	0	17	J	UCSF El Porvenir SA San Juan Chiquito	0	0	1	141	1	141	2010
142	2	0	18	J	UCSF Masahuat SA	0	0	1	142	1	142	2010
143	2	0	18	J	UCSF Masahuat SA La Joya	0	0	1	143	1	143	2010
144	2	0	23	J	UCSF Santa Rosa de Guachipilín SA	0	0	1	144	1	144	2010
145	2	0	23	J	UCSF Santa Rosa Guachipilín SA El Despoblado	0	0	1	145	1	145	2010
146	2	0	24	J	UCSF Santiago La Frontera SA	0	0	1	146	1	146	2010
147	2	0	24	J	UCSF Santiago La Frontera SA Las Piletas	0	0	1	147	1	147	2010
148	2	0	24	J	UCSF Santiago La Frontera SA Santa Cruz	0	0	1	148	1	148	2010
149	2	0	15	J	UCSF Chalchuapa SA	0	0	1	149	1	149	2010
150	2	0	15	J	UCSF Chalchuapa SA Magdalena 1	0	0	1	150	1	150	2010
151	2	0	15	J	UCSF Chalchuapa SA Magdalena 2	0	0	1	151	1	151	2010
152	2	0	15	J	UCSF Chalchuapa SA San Sebastian	0	0	1	152	1	152	2010
153	2	0	15	J	UCSF Chalchuapa SA Galeano	0	0	1	153	1	153	2010
154	2	0	15	J	UCSF Chalchuapa SA Zacamil	0	0	1	154	1	154	2010
155	2	0	15	J	UCSF Chalchuapa SA Las Flores	0	0	1	155	1	155	2010
156	2	0	15	J	UCSF Chalchuapa SA El Paste	0	0	1	156	1	156	2010
157	2	0	15	J	UCSF Chalchuapa SA El Coco	0	0	1	157	1	157	2010
158	2	0	15	J	UCSF Chalchuapa SA San José	0	0	1	158	1	158	2010
159	2	0	15	J	UCSF Chalchuapa SA Las Lomas	0	0	1	159	1	159	2010
160	2	0	15	J	UCSF Chalchuapa SA Las Lajas	0	0	1	160	1	160	2010
161	2	0	15	J	UCSF Chalchuapa SA Las Cruces	0	0	1	161	1	161	2010
162	1	0	1	J	UCSF Ahuachapan AH Un Rancho y un lucero	0	0	1	162	1	162	2010
163	1	0	9	J	UCSF San Lorenzo AH Guascota	0	0	1	163	1	163	2010
164	1	0	12	J	UCSF Turín AH El Paraiso	0	0	1	164	1	164	2010
165	1	0	3	J	UCSF Atiquizaya AH Rio Frio 1	0	0	1	165	1	165	2010
166	1	0	5	J	UCSF El Refugio AH El Rosario	0	0	1	166	1	166	2010
167	17	0	211	J	UCSF san antonio SM San Marcos	0	0	1	167	2	167	2010
168	17	0	212	J	UCSF San Gerardo SM La Laguna	0	0	1	168	2	168	2010
169	1	0	12	J	UCSF Turín AH	0	0	1	169	1	169	2010
170	6	0	53	J	UCSF La Palma CH	0	0	1	170	5	170	2010
171	1	0	3	J	UCSF Atiquizaya AH Lomas de Alarcón	0	0	1	171	1	171	2010
172	1	0	3	J	UCSF Atiquizaya AH 1	0	0	1	172	1	172	2010
173	1	0	3	J	UCSF Atiquizaya AH 2	0	0	1	173	1	173	2010
174	1	0	3	J	UCSF Atiquizaya AH 3	0	0	1	174	1	174	2010
175	1	0	3	J	UCSF Atiquizaya AH Izcatillo 1	0	0	1	175	1	175	2010
176	1	0	3	J	UCSF Atiquizaya AH Izcatillo 2	0	0	1	176	1	176	2010
177	1	0	3	J	UCSF Atiquizaya AH Izcatillo 3	0	0	1	177	1	177	2010
178	1	0	3	J	UCSF Atiquizaya AH El Chayal	0	0	1	178	1	178	2010
179	1	0	3	J	UCSF Atiquizaya AH El Zapote	0	0	1	179	1	179	2010
180	1	0	5	J	UCSF El Refugio AH San Antonio	0	0	1	180	1	180	2010
181	1	0	5	J	UCSF El Refugio AH Salitrero	0	0	1	181	1	181	2010
182	1	0	5	J	UCSF El Refugio AH San Juan El Espino	0	0	1	183	1	182	2010
183	1	0	5	J	UCSF El Refugio AH	0	0	1	184	1	183	2010
184	12	0	156	L	UCSFE Ilobasco CA	0	0	1	185	4	184	2010
185	12	0	9	L	UCSFE Sensuntepeque CA	0	0	1	186	4	185	2010
186	2	0	15	L	UCSFE Chalchuapa SA	0	0	1	187	1	186	2010
187	6	0	49	L	UCSFE Dulce Nombre de Maria CH	0	0	1	188	5	187	2010
188	6	0	47	L	UCSFE Concepción Quezaltepeque CH	0	0	1	189	5	188	2010
189	21	0	258	J	UCSF San Jose la Fuente LU El Sombrerito	0	0	1	191	2	189	2010
190	25	0	109	J	UCSF San Martín SS Los Letona	0	0	1	192	6	190	2010
191	25	0	109	J	UCSF San Martín SS La Flor	0	0	1	193	6	191	2010
192	24	0	107	J	UCSF Rosario de Mora SS Palo Grande	0	0	1	194	6	192	2010
193	24	0	106	J	UCSF Panchimalco SS Quezalapa	0	0	1	195	6	193	2010
194	24	0	106	J	UCSF Panchimalco SS Amayon	0	0	1	196	6	194	2010
195	23	0	101	J	UCSF El Paisnal SS San Francisco dos Cerros	0	0	1	197	6	195	2010
196	23	0	97	J	UCSF Aguilares SS La Florida	0	0	1	198	6	196	2010
197	20	0	234	L	UCSFE Perquin MO	0	0	1	199	2	197	2010
198	20	0	221	L	UCSFE Corinto MO	0	0	1	200	2	198	2010
199	20	0	240	J	UCSFE Semsembra MO	0	0	1	201	2	199	2010
200	20	0	233	L	UCSFE Osicala MO	0	0	1	202	2	200	2010
201	21	0	245	L	UCSFE Anamoros LU	0	0	1	203	2	201	2010
202	17	0	199	L	UCSFE Carolina SM	0	0	1	204	2	202	2010
203	12	0	156	J	UCSF Ilobasco CA Hoyos	0	0	1	205	4	203	2010
204	6	0	48	J	UCSF Chalatenango CH Guarjila	0	0	1	206	5	204	2010
205	20	0	227	J	UCSF Guatajiagua MO Pajigua	0	0	1	207	2	205	2010
206	20	0	211	J	UCSF San Antonio SM San Diego	0	0	1	208	2	206	2010
207	20	0	221	J	UCSF Corinto MO Corralito Atillo	0	0	1	209	2	207	2010
208	21	0	248	J	UCSF Conchagua LU Las Tunas	0	0	1	210	2	208	2010
209	21	0	248	J	UCSF Conchagua LU El Pilón	0	0	1	211	2	209	2010
1650	6	0	74	J	UCSF Tejutla CH 	0	0	1	500	5	500	2011
1651	6	0	74	J	UCSF Tejutla CH Los Hernandez	0	0	1	501	5	501	2011
1652	6	0	74	J	UCSF Tejutla CH Agua Escondido	0	0	1	502	5	502	2011
1654	6	0	74	J	UCSF Tejutla CH El Coyolito	0	0	1	504	5	504	2011
1655	8	0	77	J	UCSF Colón LL	0	0	1	505	5	505	2011
1656	8	0	77	J	UCSF Colón LL El Pital	0	0	1	506	5	506	2011
1657	8	0	86	J	UCSF Quezaltepeque LL San Jacinto	0	0	1	507	5	507	2011
1658	8	0	86	J	UCSF Quezaltepeque LL Santa Emilia	0	0	1	508	5	508	2011
1659	9	0	130	J	UCSF Suchitoto CU	0	0	1	509	4	509	2011
1660	27	0	104	J	UCSF Mejicanos SS Las nubes	0	0	1	510	6	510	2011
1661	27	0	104	J	UCSF Mejicanos SS San Roque	0	0	1	511	6	511	2011
1662	27	0	110	J	UCSF San Salvador SS Las Lajas	0	0	1	512	6	512	2011
1663	27	0	110	J	UCSF San Salvador SS Coro Quiñones	0	0	1	513	6	513	2011
1664	27	0	104	J	UCSF Mejicanos SS Cristo Redentor	0	0	1	514	6	514	2011
1665	27	0	110	J	UCSF San Salvador SS La Naval	0	0	1	515	6	515	2011
1666	27	0	110	J	UCSF San Salvador SS Mano de León	0	0	1	516	6	516	2011
1667	27	0	110	J	UCSF San Salvador SS Las Brisas	0	0	1	517	6	517	2011
1668	24	0	106	J	UCSF Panchimalco SS San Isidro	0	0	1	518	6	518	2011
1669	24	0	106	J	UCSF Panchimalco SS Cnt El Cedro	0	0	1	519	6	519	2011
1670	24	0	110	J	UCSF San Sanlvador SS Cmnd Miraflores	0	0	1	520	6	520	2011
1671	24	0	110	J	UCSF San Sanlvador SS Cmnd Las Esmeraldas	0	0	1	521	6	521	2011
1608	13	0	173	J	UCSF Tecoluca SV San Carlos Lempa	0	0	1	472	4	0	2011
1672	24	0	108	J	UCSF San Marcos SS Cmnd Linda Vista	0	0	1	522	6	522	2011
1673	24	0	108	J	UCSF San Marcos SS Cmnd El Transito	0	0	1	523	6	523	2011
1674	23	0	105	J	UCSF Nejapa SS El Llano	0	0	1	524	6	524	2011
1675	23	0	101	J	UCSF El Paisnal SS Cmnd Rutilio Grande	0	0	1	525	6	525	2011
1676	25	0	109	J	UCSF San Martin SS Cmnd Santa Fe	0	0	1	526	6	526	2011
1677	25	0	109	J	UCSF San Martin SS Cnt El Rosario	0	0	1	527	6	527	2011
1678	25	0	109	J	UCSF San Martin SS Cnt El Rosario	0	0	1	527	6	527	2011
1346	12	0	159	J	UCSF Sensuntepeque CA San Gregorio	0	0	1	455	4	1346	2010
1347	12	0	159	J	UCSF Sensuntepeque CA San Lorenzo	0	0	1	456	4	1347	2010
1348	12	0	159	J	UCSF Sensuntepeque CA Chunte	0	0	1	457	4	1348	2010
1349	12	0	159	J	UCSF Sensuntepeque CA Rio Grande	0	0	1	458	4	1349	2010
1350	12	0	159	J	UCSF Sensuntepeque CA Cuyantepeque	0	0	1	459	4	1350	2010
1351	12	0	159	J	UCSF Sensuntepeque CA Copinolapa	0	0	1	460	4	1351	2010
1352	12	0	159	J	UCSF Sensuntepeque CA San Nicolas	0	0	1	461	4	1352	2010
1353	12	0	155	J	UCSF Guacotecti CA	0	0	1	462	4	1353	2010
1354	12	0	155	J	UCSF Guacotecti CA Agua Zarca	0	0	1	463	4	1354	2010
1355	12	0	158	J	UCSF San Isidro CA	0	0	1	464	4	1355	2010
1356	12	0	158	J	UCSF San Isidro CA Potrero de Batres	0	0	1	465	4	1356	2010
1357	12	0	158	J	UCSF San Isidro CA San Francisco	0	0	1	466	4	1357	2010
1649	2	0	21	J	UCSF San Sebastian Salitrillo SA Santa Rosa	0	0	1	484	1	1383	2011
1388	9	0	118	J	UCSF El Carmen CU San Sebastian	0	0	1	427	4	0	2011
1638	5	0	26	J	UCSF Acajutla SO Villa Centenario	0	0	1	489	1	0	2011
1364	14	0	176	J	UCSF Alegria US El Zapotillo	0	0	1	323	2	0	2011
1365	1	0	2	J	UCSF Apaneca AH Quezalapa	0	0	1	388	1	0	2011
1366	13	0	163	J	UCSF Apastepeque SV	0	0	1	259	4	0	2011
1367	13	0	163	J	UCSF Apastepeque SV Calderas	0	0	1	260	4	0	2011
1368	13	0	163	J	UCSF Apastepeque SV Las Minas	0	0	1	261	4	0	2011
1369	13	0	163	J	UCSF Apastepeque SV San Felipe	0	0	1	262	4	0	2011
1370	13	0	163	J	UCSF Apastepeque SV San Jacinto	0	0	1	263	4	0	2011
1371	13	0	163	J	UCSF Apastepeque SV San Nicolas	0	0	1	264	4	0	2011
1372	13	0	163	J	UCSF Apastepeque SV San Pedro	0	0	1	265	4	0	2011
1373	6	0	44	J	UCSF Azacualpa CH	0	0	1	235	5	0	2011
1374	14	0	177	L	UCSFE Berlin US	0	0	1	313	2	0	2011
1375	14	0	177	J	UCSF Berlin US 1	0	0	1	314	2	0	2011
1376	14	0	177	J	UCSF Berlin US 2	0	0	1	315	2	0	2011
1377	14	0	177	J	UCSF Berlin US San José	0	0	1	316	2	0	2011
1378	14	0	177	J	UCSF Berlin US Talpetate	0	0	1	317	2	0	2011
1379	14	0	177	J	UCSF Berlin US Virginia	0	0	1	318	2	0	2011
1380	14	0	177	J	UCSF Berlin US San Isidro	0	0	1	319	2	0	2011
1381	5	0	28	J	UCSF Caluco SO Plan de Amayo	0	0	1	389	1	0	2011
1382	5	0	28	J	UCSF Caluco SO El Zapote	0	0	1	390	1	0	2011
1384	9	0	116	J	UCSF Candelaria CU	0	0	1	413	4	0	2011
1385	9	0	116	J	UCSF Candelaria CU El Rosario	0	0	1	414	4	0	2011
1386	9	0	116	J	UCSF Candlaria CU Concepción	0	0	1	415	4	0	2011
1387	9	0	116	J	UCSF Candelaria CU Miraflores Arriba	0	0	1	416	4	0	2011
1390	8	0	79	J	UCSF Chiltiupán LL	0	0	1	216	5	0	2011
1391	8	0	79	J	UCSF Chiltiupán LL Termophilas	0	0	1	217	5	0	2011
1392	8	0	79	J	UCSF Chiltiupán LL Taquillo Ing. Orlando Recinos	0	0	1	218	5	0	2011
1393	17	0	200	J	UCSF Ciudad Barrios SM	0	0	1	292	2	0	2011
1394	17	0	200	J	UCSF Ciudad Barrios SM Guanaste	0	0	1	293	2	0	2011
1395	17	0	200	J	UCSF Ciudad Barrios SM El Porvenir	0	0	1	294	2	0	2011
1396	17	0	200	J	UCSF Ciudad Barrios SM San Matias	0	0	1	295	2	0	2011
1397	17	0	200	J	UCSF Ciudad Barrios SM San Cristobal	0	0	1	296	2	0	2011
1398	17	0	200	J	UCSF Ciudad Barrios SM Llano el Angel	0	0	1	297	2	0	2011
1399	2	0	14	J	UCSF Coatepeque SA Piletas	0	0	1	406	1	0	2011
1401	8	0	77	L	UCSFE Colón LL Ciudad Mujer	0	0	1	234	5	0	2011
1402	8	0	78	J	UCSF Comasagua LL	0	0	1	220	5	0	2011
1403	8	0	78	J	UCSF Comasagua LL La Shila	0	0	1	221	5	0	2011
1404	8	0	78	J	UCSF Comasagua LL Los Conacastes	0	0	1	222	5	0	2011
1405	8	0	78	J	UCSF Comasagua LL El Matazano	0	0	1	223	5	0	2011
1406	14	0	179	L	UCSFE Concepcion Batres US	0	0	1	349	2	0	2011
1407	14	0	179	J	UCSF Concepcion Batres US	0	0	1	350	2	0	2011
1408	14	0	179	J	UCSF Concepcion Batres US San Felipe	0	0	1	351	2	0	2011
1409	14	0	179	J	UCSF Concepcion Batres US Hacienda Nueva	0	0	1	352	2	0	2011
1410	14	0	179	J	UCSF Concepcion Batres US El Cañal	0	0	1	353	2	0	2011
1411	5	0	29	J	UCSF Cuisnahuat SO Agua Shuca	0	0	1	392	1	0	2011
1412	5	0	29	J	UCSF Cuisnahuat SO Coquiama	0	0	1	393	1	0	2011
1413	5	0	29	J	UCSF Cuisnahuat SO San Lucas	0	0	1	394	1	0	2011
1414	5	0	29	J	UCSF Cuisnahuat SO	0	0	1	395	1	0	2011
1415	10	0	132	J	UCSF Cuyultitan LP	0	0	1	441	4	0	2011
1416	10	0	132	J	UCSF Cuyultitan LP San Antonio	0	0	1	442	4	0	2011
1417	9	0	118	J	UCSF El Carmen CU San Antonio	0	0	1	255	4	0	2011
1418	9	0	118	J	UCSF El Carmen CU	0	0	1	426	4	0	2011
1419	9	0	118	J	UCSF El Carmen CU Candelaria	0	0	1	429	4	0	2011
1421	9	0	119	J	UCSF El Carmen CU Santa Lucía	0	0	1	428	4	0	2011
1422	10	0	133	J	UCSF Rosario La Paz LP El Nao Amatepe	0	0	1	440	4	0	2011
1423	14	0	181	J	UCSF Ereguayquin US Analco	0	0	1	355	2	0	2011
1425	14	0	182	J	UCSF Estanzuelas US Escarbadero	0	0	1	307	2	0	2011
1426	14	0	182	J	UCSF Estanzuelas US La Cruz	0	0	1	308	2	0	2011
1429	1	0	6	L	UCSFE Guaymango AH	0	0	1	356	1	0	2011
1430	1	0	6	J	UCSF Guaymango AH	0	0	1	357	1	0	2011
1431	1	0	6	J	UCSF Guaymango AH Platanares	0	0	1	358	1	0	2011
1432	1	0	6	J	UCSF Guaymango AH El Escalon	0	0	1	359	1	0	2011
1433	1	0	6	J	UCSF Guaymango AH Morro Grande	0	0	1	360	1	0	2011
1400	2	0	14	J	UCSF Coatepeque SA Conacaste	0	0	1	407	1	0	2011
1389	17	0	202	J	UCSF Chapeltique SM La Trinidad (El Rodeo)	0	0	1	302	2	0	2011
1434	1	0	6	J	UCSF Guaymango AH San Martin	0	0	1	361	1	0	2011
1435	1	0	6	J	UCSF Guaymango AH Cauta Arriba	0	0	1	362	1	0	2011
1437	13	0	134	J	UCSF Jerusalen LP	0	0	1	470	4	0	2011
1438	8	0	82	J	UCSF Jicalapa LL La Perla	0	0	1	219	5	0	2011
1439	14	0	185	J	UCSF Jucuaran US	0	0	1	345	2	0	2011
1440	14	0	185	J	UCSF Jucuaran US El Jutal	0	0	1	346	2	0	2011
1441	14	0	185	J	UCSF Jucuaran US El Espino	0	0	1	347	2	0	2011
1442	14	0	185	J	UCSF Jucuaran US El Zapote	0	0	1	348	2	0	2011
1443	1	0	7	J	UCSF Jujutla AH	0	0	1	363	1	0	2011
1444	1	0	7	J	UCSF Jujutla AH Tihuicha	0	0	1	364	1	0	2011
1445	1	0	7	J	UCSF Jujutla AH Barra de Santiago	0	0	1	365	1	0	2011
1446	1	0	7	J	UCSF Jujutla AH Falla	0	0	1	366	1	0	2011
1447	1	0	7	J	UCSF Jujutla AH Guayapa Abajo	0	0	1	367	1	0	2011
1448	1	0	7	J	UCSF Jujutla AH Santa Rosa Guayapa	0	0	1	368	1	0	2011
1449	1	0	7	J	UCSF Jujutla AH San José El Naranjo	0	0	1	369	1	0	2011
1450	1	0	7	J	UCSF Jujutla AH San Antonio	0	0	1	370	1	0	2011
1451	13	0	135	J	UCSF Mercedes la Ceiba LP	0	0	1	471	4	0	2011
1452	14	0	186	J	UCSF Mercedes Umaña US	0	0	1	309	2	0	2011
1453	14	0	186	J	UCSF Mercedes Umaña US La Puerta	0	0	1	310	2	0	2011
1454	14	0	186	J	UCSF Mercedes Umaña US Santa Anita	0	0	1	311	2	0	2011
1455	14	0	186	J	UCSF Mercedes Umaña US Los Horcones	0	0	1	312	2	0	2011
1456	9	0	120	J	UCSF Monte San Juan CU	0	0	1	244	4	0	2011
1457	9	0	120	J	UCSF Monte San Juan CU San Nicolas 	0	0	1	245	4	0	2011
1458	9	0	120	J	UCSF Monte San Juan CU Soledad	0	0	1	246	4	0	2011
1459	14	0	187	J	UCSF Nueva Granada US	0	0	1	304	2	0	2011
1460	14	0	187	J	UCSF Nueva Granada US Nuevo Gualcho	0	0	1	305	2	0	2011
1461	10	0	136	J	UCSF Olocuilta LP San Sebastían	0	0	1	443	4	0	2011
1462	10	0	136	J	UCSF Olocuilta LP Santa Lucía Orcoyo	0	0	1	452	4	0	2011
1463	10	0	136	L	UCSFE Olocuilta LP	0	0	1	291	4	0	2011
1464	9	0	121	J	UCSF Oratorio Concepción CU	0	0	1	430	4	0	2011
1465	14	0	188	J	UCSF Ozatlan US 	0	0	1	327	2	0	2011
1466	14	0	188	J	UCSF Ozatlan US Las Trancas	0	0	1	328	2	0	2011
1467	14	0	188	J	UCSF Ozatlan US La Poza	0	0	1	329	2	0	2011
1468	14	0	188	J	UCSF Ozatlan US La Breña	0	0	1	330	2	0	2011
1469	9	0	137	J	UCSF Paraiso de Osorio LP	0	0	1	238	4	0	2011
1470	14	0	189	J	UCSF Puerto El Triunfo US La Palmera	0	0	1	354	2	0	2011
1471	8	0	83	L	UCSFE Puerto La Libertad LL	0	0	1	233	5	0	2011
1472	14	0	190	J	UCSF San Agustín US	0	0	1	331	2	0	2011
1473	14	0	190	J	UCSF San Agustín US El Eucalipto	0	0	1	332	2	0	2011
1474	14	0	190	J	UCSF San Agustín US Caulotal	0	0	1	333	2	0	2011
1475	10	0	138	J	UCSF San Antonio Masahuat LP 	0	0	1	288	4	0	2011
1476	10	0	138	J	UCSF San Antonio Masahuat LP La Loma	0	0	1	289	4	0	2011
1477	13	0	165	J	UCSF San Cayetano Istepeque SV	0	0	1	467	4	0	2011
1478	13	0	165	J	UCSF San Cayetano Istepeque SV Candelaria	0	0	1	468	4	0	2011
1479	9	0	123	J	UCSF San Cristobal CU	0	0	1	241	4	0	2011
1480	9	0	123	J	UCSF San Cristobal CU Santa  Anita 	0	0	1	242	4	0	2011
1481	9	0	123	J	UCSF San Cristobal CU La Virgen	0	0	1	243	4	0	2011
1482	9	0	139	J	UCSF San Emigdio LP	0	0	1	240	4	0	2011
1483	13	0	168	J	UCSF San Esteban Catarina SV	0	0	1	275	4	0	2011
1484	13	0	168	J	UCSF San Esteban Catarina SV San Jacinto la burrera	0	0	1	276	4	0	2011
1485	10	0	140	J	UCSF San Francisco Chinameca LP San José La Montaña	0	0	1	444	4	0	2011
1486	10	0	140	J	UCSF San Francisco Chinameca LP Candelaria	0	0	1	445	4	0	2011
1487	10	0	140	J	UCSF SanFrancisco Chinameca LP	0	0	1	446	4	0	2011
1488	14	0	194	J	UCSF San Francisco Javier US	0	0	1	334	2	0	2011
1489	14	0	194	J	UCSF San Francisco Javier US Los Hornos	0	0	1	335	2	0	2011
1490	14	0	194	J	UCSF San Francisco Javier US La Cruz	0	0	1	336	2	0	2011
1492	13	0	169	J	UCSF San Ildefonso SV	0	0	1	272	4	0	2011
1493	13	0	169	J	UCSF San Ildefonso SV Guachipilín	0	0	1	273	4	0	2011
1494	13	0	169	J	UCSF San Ildefonso SV San Lorenzo	0	0	1	274	4	0	2011
1498	14	0	213	J	UCSF San Jorge US	0	0	1	342	2	0	2011
1499	14	0	213	J	UCSF San Jorge US San Julian	0	0	1	343	2	0	2011
1500	14	0	213	J	UCSF San Jorge US Joya de Ventura	0	0	1	344	2	0	2011
1501	9	0	124	J	UCSF San Jose Guayabal CU Llano Grande	0	0	1	250	4	0	2011
1502	9	0	124	J	UCSF San José Guayabal CU	0	0	1	419	4	0	2011
1503	9	0	124	J	UCSF San José Guayabal CU La Cruz	0	0	1	420	4	0	2011
1504	9	0	124	J	UCSF San José Guayabal CU Animas	0	0	1	421	4	0	2011
1505	10	0	142	J	UCSF San Juan Talpa LP	0	0	1	437	4	0	2011
1506	10	0	142	J	UCSF San Juan Talpa LP Veracruz	0	0	1	438	4	0	2011
1507	10	0	142	J	UCSF San Juan Talpa LP Comalapa	0	0	1	481	4	0	2011
1508	10	0	143	J	UCSF San Juan Tepezontes LP 	0	0	1	285	4	0	2011
1509	13	0	170	J	UCSF San Lorenzo SV	0	0	1	277	4	0	2011
1510	13	0	170	J	UCSF San Lorenzo SV Santa Lucia	0	0	1	278	4	0	2011
1511	10	0	153	J	UCSF San Luis la Herradura LP El Zapote	0	0	1	433	4	0	2011
1512	10	0	153	J	UCSF San Luis la Herradura LP Los Blancos	0	0	1	480	4	0	2011
1513	10	0	14	J	UCSF San Luis Talpa LP El Pimental	0	0	1	436	4	0	2011
1514	10	0	144	J	UCSF San Luis Talpa LP Hacienda Amatepe	0	0	1	449	4	0	2011
1515	25	0	109	L	UCSFE San Martin SS	0	0	1	408	6	0	2011
1516	25	0	109	J	UCSF San Martin SS Santa Gertrudis	0	0	1	409	6	0	2011
1517	10	0	145	J	UCSF San Miguel Tepezontes LP 	0	0	1	286	4	0	2011
1518	10	0	145	J	UCSF San Miguel Tepezontes LP Soledad Las Flores	0	0	1	287	4	0	2011
1519	8	0	91	J	UCSF San Pablo Tacachico LL	0	0	1	228	5	0	2011
1520	8	0	91	J	UCSF San Pablo Tacachico LL San Isidro	0	0	1	229	5	0	2011
1521	8	0	91	J	UCSF San Pablo Tacachico LL Atiocoyo	0	0	1	230	5	0	2011
1522	8	0	91	J	UCSF San Pablo Tacachico LL Obraje Nuevo	0	0	1	231	5	0	2011
1523	8	0	91	J	UCSF San Pablo Tacachico LL Valle  Mesas	0	0	1	232	5	0	2011
1524	10	0	146	J	UCSF San Pedro Masahuat LP El Achiotal	0	0	1	434	4	0	2011
1525	10	0	146	J	UCSF San Pedro Masahuat LP Las Marías	0	0	1	435	4	0	2011
1526	10	0	147	J	UCSF San Pedro Nonualco LP 	0	0	1	282	4	0	2011
1527	10	0	147	J	UCSF San Pedro Nonualco LP San Juan Nuhuistepeque	0	0	1	283	4	0	2011
1528	10	0	147	J	UCSF San Pedro Nonualco LP San Ramón	0	0	1	284	4	0	2011
1529	9	0	125	L	UCSFE San Pedro Perulapan CU	0	0	1	252	4	0	2011
1530	9	0	125	J	UCSF San Pedro Perulapan CU La Esperanza	0	0	1	253	4	0	2011
1531	9	0	125	J	UCSF San Pedro Perulapan CU San Francisco	0	0	1	254	4	0	2011
1532	1	0	10	J	UCSF San Pedro Puxtla AH Los Aguirre	0	0	1	371	1	0	2011
1533	1	0	10	J	UCSF San Pedro Puxtla AH Los Chacon	0	0	1	372	1	0	2011
1534	1	0	10	J	UCSF San Pedro Puxtla AH	0	0	1	373	1	0	2011
1535	9	0	126	J	UCSF San Rafael Cedros CU Soledad	0	0	1	251	4	0	2011
1536	9	0	126	J	UCSF San Rafael Cedros CU	0	0	1	422	4	0	2011
1537	9	0	126	J	UCSF San Rafael Cedros CU Cerro Colorado	0	0	1	423	4	0	2011
1538	9	0	126	J	UCSF San Rafael Cedros CU Jiboa	0	0	1	424	4	0	2011
1539	9	0	126	J	UCSF San Rafael Cedros CU Palacios	0	0	1	425	4	0	2011
1540	10	0	148	J	UCSF San Rafael Obrajuelo LP La Palma	0	0	1	453	4	0	2011
1541	10	0	148	J	UCSF San Rafael Obrajuelo LP San Pedro Martir	0	0	1	454	4	0	2011
1542	9	0	127	J	UCSF San Ramon CU	0	0	1	417	4	0	2011
1543	9	0	127	J	UCSF San Ramón CU Santa Isabel	0	0	1	418	4	0	2011
1544	24	0	110	L	UCSFE San Salvador SS San Jacinto	0	0	1	410	6	0	2011
1545	24	0	110	J	UCSF San Salvador SS Comunidad Modelo 3	0	0	1	411	6	0	2011
1546	24	0	110	J	UCSF San Salvador SS San Cristobal	0	0	1	412	6	0	2011
1547	24	0	110	J	UCSF San Salvador SS Comunidad Nicaragua 2	0	0	1	439	6	0	2011
1548	13	0	171	J	UCSF Sen Sebastián SV La Esperanza	0	0	1	479	4	0	2011
1549	13	0	172	J	UCSF San Vicente SV Guajoyo	0	0	1	477	4	0	2011
1550	13	0	172	J	UCSF San Vicente SV El Rebelde	0	0	1	478	4	0	2011
1551	5	0	38	J	UCSF Santa Catarina Masahuat SO El Guayabo	0	0	1	396	1	0	2011
1552	5	0	38	J	UCSF Santa Catarina Masahuat SO Tres caminos	0	0	1	397	1	0	2011
1553	5	0	38	J	UCSF Santa Catarina Masahuat SO	0	0	1	398	1	0	2011
1554	13	0	166	J	UCSF Santa Clara SV	0	0	1	270	4	0	2011
1555	13	0	166	J	UCSF Santa Clara SV Santa Rosa	0	0	1	271	4	0	2011
1556	9	0	128	J	UCSF Santa Cruz Analquito CU	0	0	1	239	4	0	2011
1557	9	0	129	J	UCSF Santa Cruz Michapa CU Buena Vista	0	0	1	256	4	0	2011
1588	9	0	130	J	UCSF Suchitoto CU Palo Grande CU	0	0	1	258	4	0	2011
1589	1	0	11	L	UCSFE Tacuba AH	0	0	1	374	1	0	2011
1590	1	0	11	J	UCSF Tacuba AH	0	0	1	375	1	0	2011
1591	1	0	11	J	UCSF Tacuba AH San Rafael	0	0	1	376	1	0	2011
1592	1	0	11	J	UCSF Tacuba AH Las Palmeras	0	0	1	377	1	0	2011
1593	1	0	11	J	UCSF Tacuba AH Chaguite	0	0	1	378	1	0	2011
1594	1	0	11	J	UCSF Tacuba AH El Jicaro	0	0	1	379	1	0	2011
1595	1	0	11	J	UCSF Tacuba AH El Sincuyo	0	0	1	380	1	0	2011
1596	1	0	11	J	UCSF Tacuba AH La Magdalena	0	0	1	381	1	0	2011
1597	1	0	11	J	UCSF Tacuba AH Pandiadura	0	0	1	382	1	0	2011
1598	1	0	11	J	UCSF Tacuba AH Valle La Puerta	0	0	1	383	1	0	2011
1599	1	0	11	J	UCSF Tacuba AH La Escuela de El Rodeo	0	0	1	384	1	0	2011
1600	8	0	92	J	UCSF Tamanique LL	0	0	1	224	5	0	2011
1601	8	0	92	J	UCSF Tamanique LL Buenos Aires	0	0	1	225	5	0	2011
1602	8	0	92	J	UCSF Tamanique LL San Alfonso	0	0	1	226	5	0	2011
1603	8	0	92	J	UCSF Tamanique LL El Palmar	0	0	1	227	5	0	2011
1604	10	0	151	J	UCSF Tapalhuaca LP	0	0	1	290	4	0	2011
1605	14	0	197	J	UCSF Tecapan US	0	0	1	324	2	0	2011
1606	14	0	197	J	UCSF Tecapan US Gualache	0	0	1	325	2	0	2011
1607	14	0	197	J	UCSF Tecapan US Chapetones	0	0	1	326	2	0	2011
1609	13	0	173	J	UCSF Tecoluca SV Puerto Nuevo	0	0	1	473	4	0	2011
1610	13	0	173	J	UCSF Tecoluca SV San Nicolas Lempa	0	0	1	474	4	0	2011
1611	13	0	173	J	UCSF Tecoluca SV El Carao	0	0	1	475	4	0	2011
1612	13	0	173	J	UCSF Tecoluca SV Santa Cruz Paraiso	0	0	1	476	4	0	2011
1613	9	0	131	J	UCSF Tenancingo CU	0	0	1	247	4	0	2011
1614	9	0	131	J	UCSF Tenancingo CU Corral Viejo	0	0	1	248	4	0	2011
1615	9	0	131	J	UCSF Tenancingo CU Rosario Tablon	0	0	1	249	4	0	2011
1616	8	0	94	J	UCSF Teotepeque LL	0	0	1	212	5	0	2011
1617	8	0	94	J	UCSF Teotepeque LL El Angel	0	0	1	213	5	0	2011
1618	8	0	94	J	UCSF Teotepeque LL Mizata	0	0	1	214	5	0	2011
1619	8	0	94	J	UCSF Teotepeque LL Aguacayo	0	0	1	215	5	0	2011
1620	13	0	174	J	UCSF Tepetitan SV	0	0	1	469	4	0	2011
1621	13	0	175	L	UCSFE Verapaz SV	0	0	1	266	4	0	2011
1622	13	0	175	J	UCSF Verapaz SV	0	0	1	267	4	0	2011
1623	13	0	175	J	UCSF Verapaz SV El Carmen	0	0	1	268	4	0	2011
1624	13	0	175	J	UCSF Verapaz SV San Isidro	0	0	1	269	4	0	2011
1625	10	0	152	J	UCSF Zacatecoluca LP Santa Lucía	0	0	1	431	4	0	2011
1626	10	0	152	J	UCSF Zacatecoluca LP San Faustino	0	0	1	450	4	0	2011
1627	10	0	152	J	UCSF Zacatecoluca LP Azacualpa	0	0	1	451	4	0	2011
1383	5	0	28	J	UCSF Caluco SO	0	0	1	391	1	0	2011
1639	5	0	26	J	UCSF Acajutla SO Costa Azul	0	0	1	490	1	0	2011
1640	5	0	40	J	UCSF Sonsonate SO El Cacao	0	0	1	491	1	0	2011
1641	5	0	26	J	UCSF Sonsonate SO El Presidio	0	0	1	492	1	0	2011
1642	5	0	31	J	UCSF Izalco SO Tunalmiles Centro	0	0	1	493	1	0	2011
1643	5	0	31	J	UCSF Izalco SO Chorro Arriba	0	0	1	494	1	0	2011
1644	5	0	31	J	UCSF Izalco SO Las Lajas	0	0	1	495	1	0	2011
1645	5	0	31	J	UCSF Izalco SO Las Marías	0	0	1	496	1	0	2011
1646	5	0	31	J	UCSF Izalco SO Cuyagualo	0	0	1	497	1	0	2011
1647	5	0	33	J	UCSF Nahuizalco SO El Carrizal	0	0	1	498	1	0	2011
1648	5	0	33	J	UCSF Nahuizalco SO Tajcuilujlan	0	0	1	499	1	0	2011
1436	5	0	31	L	UCSFE Izalco	0	0	1	404	1	0	2011
1358	1	0	1	J	UCSF Ahuachapan AH Ashapuco	0	0	1	385	1	0	2011
1359	1	0	1	J	UCSF Ahuachapan AH El Barro	0	0	1	386	1	0	2011
1360	1	0	1	J	UCSF Ahuachapan AH Llano la Laguna	0	0	1	387	1	0	2011
1361	14	0	176	J	UCSF Alegria US	0	0	1	320	2	0	2011
1362	14	0	176	J	UCSF Alegria US Las Casitas	0	0	1	321	2	0	2011
1363	14	0	176	J	UCSF Alegria US El Quebracho	0	0	1	322	2	0	2011
1420	9	0	119	J	UCSF EL Rosario CU	0	0	1	237	4	0	2011
1424	14	0	182	J	UCSF Estanzuelas US	0	0	1	306	2	0	2011
1491	6	0	64	J	UCSF San Fransisco Lempa CH	0	0	1	236	5	0	2011
1558	14	0	193	J	UCSF Santa Elena US	0	0	1	337	2	0	2011
1559	14	0	193	J	UCSF Santa Elena US El Nanzal 1	0	0	1	338	2	0	2011
1560	14	0	193	J	UCSF Santa Elena US El Volcan	0	0	1	339	2	0	2011
1561	14	0	193	J	UCSF Santa Elena US Joya Ancha Arriba	0	0	1	340	2	0	2011
1562	14	0	193	J	UCSF Santa Elena US Amate Norte	0	0	1	341	2	0	2011
1563	5	0	30	J	UCSF Santa Isabel Ishuatan SO	0	0	1	399	1	0	2011
1564	5	0	30	J	UCSF Santa Isabel Ishuatan SO Las Piedras	0	0	1	400	1	0	2011
1565	5	0	30	J	UCSF Santa Isabel Ishuatan SO Acachapa	0	0	1	401	1	0	2011
1566	10	0	149	J	UCSF Santa María Ostuma LP	0	0	1	279	4	0	2011
1567	10	0	149	J	UCSF Santa María Ostuma LP El Carrizal	0	0	1	280	4	0	2011
1568	10	0	149	J	UCSF Santa María Ostuma LP El Chaperno	0	0	1	281	4	0	2011
1569	10	0	150	J	UCSF Santiago Nonualco LP San José Abajo	0	0	1	432	4	0	2011
1570	10	0	150	J	UCSF Santiago Nonualco LP San José La Paz	0	0	1	447	4	0	2011
1571	10	0	150	J	UCSF Santiago Nonualco LP San Sebastían Arriba	0	0	1	448	4	0	2011
1587	9	0	130	J	UCSF Suchitoto CU Laura López	0	0	1	257	4	0	2011
1572	5	0	39	J	UCSF Santo Domingo de Guzman SO El Carrizal	0	0	1	402	1	0	2011
1573	5	0	39	J	UCSF Santo Domingo de Guzman SO	0	0	1	403	1	0	2011
1581	17	0	217	J	UCSF Sesori SM  El Tablon	0	0	1	298	2	0	2011
1582	17	0	217	J	UCSF Sesori SM  San Sebastian	0	0	1	299	2	0	2011
1583	17	0	217	J	UCSF Sesori SM  Managuara	0	0	1	300	2	0	2011
1584	17	0	217	J	UCSF Sesori SM 	0	0	1	301	2	0	2011
1585	17	0	217	L	UCSFE Sesori SM 	0	0	1	303	2	0	2011
1586	5	0	41	L	UCSFE Sonzacate	0	0	1	405	1	0	2011
1653	6	0	74	J	UCSF Tejutla CH El Salitre	0	0	1	503	5	503	2011
\.


--
-- Data for Name: cat_estabi; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY cat_estabi (idestasibi, estasib, udep, id_mun, codigof) FROM stdin;
1	HOSPITAL ROSALES SAN SALVADOR	6	110	900001
2	HOSPITAL BENJAMIN BLOOM SAN SALVADOR	6	110	900002
3	HOSPITAL DR.ARGUELLO ESCOLAN MATERNIDAD	6	110	900003
4	CASA DE SALUD SAN MARTIN (GUAYMANGO)	1	6	900004
5	HOSPITAL FRANCISCO MENENDEZ AHUACHAPAN	1	1	900005
6	CRN EL ZAPOTE	1	8	900006
7	UDS AHUACHAPAN	1	1	900007
8	CASA DE SALUD SAN BENITO(SN.FCO.MENEND)	1	8	900008
9	UDS APANECA	1	2	900009
10	CASA DE SALUD CANTON RIO FRIO	1	1	900010
11	UDS ATIQUIZAYA	1	3	900011
12	CASA DE SALUD CANTON EL TIGRE (AHUACH.)	1	1	900012
13	UDS CARA SUCIA	1	8	900013
14	CASA DE SALUD CANTON CHAGUITE (TACUBA)	1	11	900014
15	UDS ATACO	1	4	900015
16	UDS TACUBA	1	11	900016
17	UDS LA HACHADURA	1	8	900017
18	UDS GUAYMANGO	1	6	900018
19	UDS JUJUTLA	1	7	900019
20	UDS SAN JOSE EL NARANJO (JUJUTLA)	1	7	900020
21	UDS LAS CHINAMAS	1	1	900021
22	UDS GUAYAPA ABAJO	1	7	900022
23	UDS SAN PEDRO PUXTLA	1	10	900023
24	UDS SAN LORENZO (AHUACHAPAN)	1	9	900024
25	UDS TURIN	1	12	900025
26	UDS EL REFUGIO	1	5	900026
27	UDS SAN FRANCISCO MENENDEZ	1	8	900027
28	UDS BARRA DE SANTIAGO	1	7	900028
29	UDS EL ZAPOTE (SAN FCO.MENENDEZ)	1	8	900029
30	UDS GARITA PALMERA	1	8	900030
31	UDS ING.JAVIER ESTRADA	1	8	900031
32	HOSPITAL SAN JUAN DE DIOS SANTA ANA	2	22	900032
33	CRN PRIMAVERA (STA.ANA)	2	22	900033
34	UDS DR.TOMAS PINEDA MARTINEZ	2	22	900034
35	UDS CASA DEL NIÑO	2	22	900035
36	UDS EL PALMAR	2	22	900036
37	UDS SANTA LUCIA (SANTA ANA)	2	22	900037
38	UDS SAN MIGUELITO STA.ANA	2	22	900038
39	UDS SAN RAFAEL (SANTA ANA)	2	22	900039
40	UDS SANTA BARBARA	2	22	900040
41	CASA DE SALUD LOS APOYOS	2	22	900041
42	UDS COATEPEQUE	2	14	900042
43	CASA DE SALUD LOS RIVAS	2	13	900043
44	UDS TEXISTEPEQUE	2	25	900044
45	UDS EL CONGO	2	16	900045
46	UDS CANDELARIA DE LA FRONTERA	2	13	900046
47	UDS GUARNECIA	2	25	900047
48	UDS PLANES DE LA LAGUNA	2	22	900048
49	UDS  NATIVIDAD	2	22	900049
50	CASA DE SALUD EL PINALON	2	22	900050
51	CASA DE SALUD LOMAS DE SAN MARCELINO	2	22	900051
52	CASA DE SALUD PILETAS (COATEPEQUE)	2	14	900052
53	UDS LA PARADA ALDEA BOLAÑOS	2	13	900053
54	UDS SAN JACINTO(COATEPEQUE)	2	14	900054
55	UDS SANTIAGO DE LA FRONTERA	2	24	900055
56	UDS SAN ANTONIO PAJONAL	2	20	900056
57	UDS EL TINTERAL	2	14	900057
58	UDS SAN MIGUEL TEXISTEPEQUE	2	25	900058
59	UDS SABANETAS EL PASTE	2	15	900059
60	CASA DE SALUD SAN VICENTE(CAND.LA FRONT	2	13	900060
61	CASA DE SALUD SAN J.LAS FLORES EL CONGO	2	16	900061
62	CRN SAN MIGUEL	2	13	900062
63	HOSPITAL NACIONAL METAPAN	2	19	900063
64	CASA DE SALUD MONTENEGRO	2	19	900064
65	UDS SANTA ROSA GUACHIPILIN	2	23	900065
66	UDS SAN JUAN LAS MINAS (METAPAN)	2	19	900066
67	UDS MASAHUAT (SANTA ANA)	2	18	900067
68	UDS SAN JERONIMO (METAPAN)	2	19	900068
69	UDS BELEN GUIJATH (METAPAN)	2	19	900069
70	UDS SAN JOSE INGENIO(METAPAN)	2	19	900070
71	CRN CRISTOBAL LA MAGDALENA	2	15	900071
72	HOSPITAL NACIONAL CHALCHUAPA	2	15	900072
73	UDS EL PORVENIR	2	17	900073
74	UDS SAN SEBASTIAN SALITRILLO	2	21	900074
75	UDS EL COCO	2	15	900075
76	UDS CHALCHUAPA	2	15	900076
77	CASA DE SALUD PIEDRAS PACHAS	3	31	900077
78	HOSP.DR.JORGE MAZZINI VILLACORTA SONSON.	3	40	900078
79	UDS IZALCO	3	31	900079
80	CASA DE SALUD CANTON CUYAGUALO (IZALCO)	3	31	900080
81	CRN LAS LAJAS	3	31	900081
82	UDS NAHUIZALCO	3	33	900082
83	CASA DE SALUD CANTON TALCOMUNCA	3	31	900083
84	CRN LOS LAGARTOS	3	37	900084
85	UDS ARMENIA	3	27	900085
86	CASA DE SALUD CANTON SAN LUCAS CUISNA	3	29	900086
87	CRN SAN JUAN DE DIOS	3	32	900087
88	UDS SAN JULIAN	3	37	900088
89	CASA DE SALUD CTON.SN JUAN DE DIOS JUAY	3	32	900089
90	UDS ACAJUTLA	3	26	900090
91	UDS DR.FRANCISCO MAGAÑA H.JUAYUA	3	32	900091
92	UDS DR.LEONARDO A.LOPEZ V(SONZACATE)	3	41	900092
93	UDS METALIO (ACAJUTLA)	3	26	900093
94	UDS LA MAJADA (JUAYUA)	3	32	900094
95	UDS NAHULINGO	3	34	900095
96	UDS SANTA CATARINA MASAHUAT	3	38	900096
97	UDS SANTO DOMINGO DE GUZMAN	3	39	900097
98	UDS SANTA ISABEL ISHUATAN	3	30	900098
99	UDS SALINAS DE AYACACHAPA	3	40	900099
100	UDS CALUCO	3	28	900100
101	UDS CUISNAHUAT	3	29	900101
102	UDS SAN ANTONIO DEL MONTE	3	36	900102
103	UDS SALCOATITAN	3	35	900103
104	UDS LOS ARENALES (NAHUIZAL)	3	33	900104
105	CASA DE SALUD LLANO GRANDE	4	47	900105
106	HOSPITAL DR. LUIS E.VAZQUEZ CHALATENANGO	4	48	900106
107	CRN SANTA BARBARA	4	51	900107
108	CASA DE SALUD GUACHIPILIN	4	46	900108
109	CRN LOS CRUCES	4	51	900109
110	UDS SAN JOSE LAS FLORES	4	69	900110
111	CASA DE SALUD TEOSINTE	4	65	900111
112	UDS EL DORADO (CHALATENANGO)	4	48	900112
113	CRN LOS DERAS	4	72	900113
114	UDS DULCE NOMBRE DE MARIA	4	49	900114
115	UDS NOMBRE DE JESUS	4	56	900115
116	CRN LAS FLORES	4	47	900116
117	CRN EL CHUPADERO	4	73	900117
118	UDS EL PARAISO	4	51	900118
119	CRN ROBLE 2	4	51	900119
120	UDS ARCATAO	4	43	900120
121	UDS LAS VUELTAS	4	55	900121
122	UDS LA LAGUNA	4	52	900122
123	UDS SAN FRANCISCO MORAZAN	4	64	900123
124	UDS COMALAPA	4	46	900124
125	UDS OJOS DE AGUA	4	59	900125
126	UDS SAN LUIS DEL CARMEN	4	70	900126
127	UDS SAN ANTONIO LOS RANCHOS	4	62	900127
128	UDS POTONICO	4	60	900128
129	UDS AZACUALPA	4	44	900129
130	UDS SAN FERNANDO (CHALATEN)	4	63	900130
131	UDS SAN FRANCISCO LEMPA	4	64	900131
132	UDS NUEVA TRINIDAD	4	58	900132
133	UDS SAN RAFAEL	4	72	900133
134	UDS CONCEPCION QUEZALTEPEQUE	4	47	900134
135	UDS EL CARRIZAL	4	50	900135
136	UDS SANTA RITA	4	73	900136
137	UDS SAN ANTONIO DE LA CRUZ	4	61	900137
138	UDS SAN MIGUEL DE MERCEDES	4	71	900138
139	UDS SAN JOSE CANCASQUE	4	68	900139
140	UDS SAN ISIDRO LABRADOR	4	67	900140
141	UDS VAINILLAS	4	50	900141
142	CASA DE SALUD CANDELARIA (COMALAPA)	4	73	900142
143	UDS LA PALMA	4	53	900143
144	HOSPITAL NACIONAL DE NUEVA CONCEPCION	4	57	900144
145	CRN AGUAJE ESCONDIDO	4	60	900145
146	CASA DE SALUD EL TIGRE	4	54	900146
147	CASA DE SALUD EL PEPETO	4	54	900147
148	CASA DE SALUD EL EMCUMBRADO	4	42	900148
149	UDS AGUA CALIENTE	4	42	900149
150	CASA DE SALUD CERRO GRANDE	4	42	900150
151	CRN SAN ANTONIO	4	63	900151
152	UDS TEJUTLA	4	74	900152
153	CASA DE SALUD OBRAJUELO	4	42	900153
154	CRN LA CRUZ	4	57	900154
155	UDS LA REINA	4	54	900155
156	CASA DE SALUD LOS PLANES	4	53	900156
157	CASA DE SALUD SUNAPA	4	57	900157
158	UDS CITALA	4	45	900158
159	UDS SAN IGNACIO	4	66	900159
160	UDS POTRERO SULA	4	57	900160
161	UDS ARRACAOS	4	57	900161
162	UDS LAS PILAS	4	66	900162
163	HOSPITAL SAN RAFAEL SANTA TECLA	5	85	900163
164	CRN SHUTIA	5	79	900164
165	UDS PUERTO LA LIBERTAD	5	83	900165
166	CRN CANGREJERA (SAN ARTURO NIZA)	5	83	900166
167	UDS DR.FCO.LIMA (JAYAQUE)	5	81	900167
168	CASA DE SALUD LAS GRANADILLAS(SANTA TEC	5	85	900168
169	CRN MELARA	5	83	900169
170	UDS CIUDAD ARCE	5	76	900170
171	CASA DE SALUD EL PROGRESO	5	85	900171
172	CRN EL CONACASTE	5	96	900172
173	UDS QUEZALTEPEQUE	5	86	900173
174	CRN SITIO GRANDE	5	89	900174
175	UDS SAN JUAN OPICO	5	89	900175
176	UDS SAN PABLO TACACHICO	5	91	900176
177	UDS LOURDES (COLON)	5	77	900177
178	UDS SITIO DEL NIÑO	5	89	900178
179	UDS DR. ALBERTO AGUILAR RIVAS	5	85	900179
180	UDS COMASAGUA	5	78	900180
181	CASA DE SALUD LA ESMERALDITA	5	96	900181
182	UDS SAN MATIAS	5	90	900182
183	UDS TEPECOYO	5	95	900183
184	CASA DE SALUD ALVAREZ	5	85	900184
185	UDS HUIZUCAR	5	80	900185
187	UDS SAN JOSE VILLANUEVA	5	88	900186
188	UDS ZARAGOZA	5	96	900187
189	UDS MIZATA	5	94	900188
190	UDS CHILTIUPAN	5	79	900189
191	UDS DR.CARLOS DIAZ DEL PINAL	5	85	900190
192	UDS TAMANIQUE	5	92	900191
193	UDS SACACOYO	5	87	900192
194	UDS JICALAPA	5	82	900193
195	UDS TALNIQUE	5	93	900194
196	UDS ANTIGUO CUSCATLAN	5	75	900195
197	UDS NUEVO CUSCATLAN	5	84	900196
198	UDS ING. ORLANDO RECINOS	5	79	900197
199	UDS SAN JOSE LOS SITIOS	5	93	900198
200	UDS DR.MANUEL GALLADRO COLON	5	77	900199
201	CASA DE SALUD LAS GRANADILLAS(S.DEL NIÑ	5	89	900200
202	CASA DE SALUD MELARA (SANTA TECLA)	5	75	900201
203	CASA DE SALUD VILLA TZU-CHI I	5	87	900202
204	CASA DE SALUD CANTON EL ESPINO	7	125	900203
205	UDS SAN PEDRO PERULAPAN	7	125	900204
206	CASA DE SALUD CANTON EL CARMEN (SPPERU)	7	125	900205
207	HOSPITAL NAC.NUESTRA SEÑORA DE FATIMA	7	117	900206
208	CASA DE SALUD CANTON TECOLUCO	7	125	900207
209	UDS SAN RAFAEL CEDROS	7	126	900208
210	UDS SANTA CRUZ MICHAPA	7	129	900209
211	CASA DE SALUD CANTON CORRAL VIEJO	7	131	900210
212	UDS TENANCINGO	7	131	900211
213	CASA DE SALUD CANTON SAN ANTONIO	7	118	900212
214	UDS SANTA CRUZ ANALQUITO	7	128	900213
215	CASA DE SALUD CANTON PIEDRA LABRADA	7	124	900214
216	UDS CANDELARIA CUSCATLAN	7	116	900215
217	CASA DE SALUD CANTON SOLEDAD SRCEDROS	7	126	900216
218	UDS ROSARIO CUSCATLAN	7	119	900217
219	UDS MONTE SAN JUAN	7	120	900218
220	UDS SAN CRISTOBAL	7	123	900219
221	UDS SAN RAMON	7	127	900220
222	UDS EL CARMEN CUSCATLAN	7	118	900221
223	UDS SAN EMIGDIO	8	139	900222
224	UDS PARAISO DE OSORIO	8	137	900223
225	CASA DE SALUD CANTON COPINOL	7	117	900224
226	CASA DE SALUD CANTON CANDELARIA	7	117	900225
227	CASA DE SALUD CTON SOLEDAD MONT S JUAN	7	120	900226
228	HOSPITAL SANTA TERESA ZACATECOLUCA	8	152	900227
229	CRN LAS MONJAS	8	144	900228
230	UDS SAN PEDRO NONUALCO	8	147	900229
231	CASA DE SALUD AMATECAMPO	8	144	900230
232	CRN EL TIHUILOCOYO	8	150	900231
233	UDS SAN PEDRO MASAHUAT	8	146	900232
234	CASA DE SALUD GUADALUPE LA ZORRA	8	153	900233
235	CRN HOJA DE SAL	8	150	900234
236	UDS SANTIAGO NONUALCO	8	150	900235
237	CASA DE SALUD LA CALZADA	8	153	900236
238	CRN EL PORFIADO	8	150	900237
239	UDS SAN LUIS LA HERRADURA	8	153	900238
240	CASA DE SALUD ASTORIA	8	146	900239
241	CRN VILLA PALESTINA	8	146	900240
242	UDS SAN LUIS TALPA	8	144	900241
243	CASA DE SALUD BARAHONA	8	146	900242
244	CRN EL ACHIOTAL	8	146	900243
245	UDS OLOCUILTA	8	136	900244
246	CASA DE SALUD LA ESPERANZA (OLOCUILTA)	8	136	900245
247	CRN EL PORVENIR	8	146	900246
248	UDS ROSARIO DE LA PAZ	8	133	900247
249	CASA DE SALUD SAN SEBASTIAN	8	136	900248
250	CRN EL PEDREGAL	8	133	900249
251	UDS SAN JUAN NONUALCO	8	141	900250
252	CRN SAN MARCOS JIBOA	8	146	900251
253	UDS SANTA MARÍA OSTUMA	8	149	900252
254	CRN GUADALUPE LA ZORRA	8	153	900253
255	UDS SAN MIGUEL TEPEZONTES	8	145	900254
256	UDS SAN RAFAEL OBRAJUELO	8	148	900255
257	UDS SAN JUAN TALPA	8	142	900256
258	UDS SAN JUAN TEPEZONTES	8	143	900257
259	UDS SAN FRANCISCO CHINAMECA	8	140	900258
260	UDS JERUSALEN	8	134	900259
261	UDS SANTA LUCÍA ORCOYO	8	136	900260
262	UDS CUYULTITAN	8	132	900261
263	UDS LAS ISLETAS	8	146	900262
264	UDS SAN PEDRO MASAHUAT EL ACHIOTAL 	8	146	900263
265	UDS SAN JOSÉ LA PAZ ARRRIBA	8	150	900264
266	UDS LA HERRADURA EL ZAPOTE	8	153	900265
267	UDS SAN ANTONIO MASAHUAT	8	138	900266
268	UDS SAN LUIS TALPA EL PIMENTAL	8	144	900267
269	UDS TAPALCHUACA	8	151	900268
270	UDS DR. CARLOS ALBERTO GALEANO	8	152	900269
271	CASA DE SALUD EL PICHICHE (ZACATECOLUCA	8	152	900270
272	CASA DE SALUD AZACUALPA	8	152	900271
273	UDS MERCEDESLA CEIBA	8	135	900272
274	CASA DE SALUD SAN FAUSTINO	8	152	900273
275	OSI San Juan Talpa LP Aeropuerto Internacional	8	142	900274
276	HOSPITAL NACIONAL  SENSUNTEPEQUE	9	159	900275
277	UDS SAN ISIDRO (CABAÑAS)	9	158	900276
278	CRN  IZCATAL	9	158	900277
279	UDS VICTORIA	9	161	900278
280	CRN HACIENDA VIEJA	9	158	900279
281	CRN PUERTONA	9	158	900280
282	CASA DE SALUD COPINOLAPA	9	159	900281
283	CRN JOBITOS	9	158	900282
284	CASA DE SALUD SAN MARCOS	9	159	900283
285	UDS DOLORES	9	162	900284
286	CASA DE SALUD SAN GREGORIO	9	159	900285
287	CASA DE SALUD CUYANTEPEQUE	9	159	900286
288	CASA DE SALUD SAN PEDRO	9	161	900287
289	CRN SANTA CRUZ LA JUNTA	9	159	900288
290	UDS GUACOTECTI	9	155	900289
291	CASA DE SALUD PARATAO	9	161	900290
292	CASA DE SALUD SAN CARLOS	9	162	900291
293	UDS SENSUNTEPEQUE	9	159	900292
294	UDS SANTA MARTA	9	161	900293
295	UDS NUEVO EDEN DE SAN JUAN	12	209	900294
296	CASA DE SALUD SAN FRANCISCO IRAHETA	9	156	900295
297	CRN ORATORIO CENTRO	9	159	900296
298	CASA DE SALUD POTRERO	9	156	900297
299	HOSPITAL DR.JOSE L.SACA (ILOBASCO)	9	156	900298
300	CASA DE SALUD HUERTAS	9	156	900299
301	CASA DE SALUD SAN SEBAST.CERRON GRANDE	9	157	900300
302	UDS CINQUERA	9	162	900301
303	CASA DE SALUD SAN NICOLAS	9	159	900302
304	UDS TEJUTEPEQUE	9	160	900303
305	UDS JUTIAPA	9	161	900304
306	CRN SAN NICOLAS	9	154	900305
307	CRN CAMPAMENTO 2 CANTON SAN NICOLAS	9	154	900306
308	UDS SANTA LUCIA (ILOBASCO)	9	159	900307
309	UDS CAROLINA (JUTIAPA )	9	161	900308
310	UDS SAN FCO.DEL MONTE	9	159	900309
311	UDS ILOBASCO	9	156	900310
312	CASA DE SALUD EL ZAPOTE (TEJUTEPEQUE)	9	160	900311
313	CASA DE SALUD SAN JOSE (ILOBASCO)	9	156	900312
314	HOSPITAL SANTA GERTRUDIS SAN VICENTE	10	172	900313
315	CRN FENADESAL	10	163	900314
316	UDS SAN SEBASTIAN	10	171	900315
317	CRN SAN CAYETANO ISTEPEQUE	10	165	900316
318	UDS GUADALUPE	10	164	900317
319	UDS TECOLUCA	10	173	900318
320	CASA DE SALUD AGUA CALIENTE	10	172	900319
321	UDS APASTEPEQUE	10	163	900320
322	CASA DE SALUD DOS QUEBRADAS	10	172	900321
323	UDS VERAPAZ	10	175	900322
324	UDS SANTO DOMINGO	10	167	900323
325	UDS TEPETITAN	10	174	900324
326	UDS PERIFERICA SAN VICENTE	10	172	900325
327	UDS SAN ILDEFONSO	10	169	900326
328	UDS SAN ESTEBAN CATARINA	10	168	900327
329	UDS SAN CARLOS LEMPA	10	173	900328
330	UDS SANTA CLARA	10	166	900329
331	UDS SAN LORENZO(SN.VICENTE)	10	170	900330
332	UDS SAN CAYETANO ISTEPEQUE	10	165	900331
333	UDS SAN NICOLAS LEMPA	10	173	900332
334	HOSPITAL SAN PEDRO USULUTAN	11	198	900333
335	CRN HACIENDA NUEVA	11	179	900334
336	CASA DE SALUD CANTON SAMURIA	11	185	900335
337	CRN MONTEFRESCO	11	179	900336
338	CASA DE SALUD CANTON EL JUTAL	11	185	900337
339	UDS SANTA ELENA	11	193	900338
340	UDS JUCUARAN	11	185	900339
341	UDS OZATLAN	11	188	900340
342	CASA DE SALUD CANTON LA PEÑA (USULUTAN)	11	198	900341
343	UDS CONCEPCION BATRES	11	179	900342
344	UDS SANTA MARIA	11	195	900343
345	UDS EL MOLINO	11	198	900344
346	UDS EREGUAYQUIN	11	181	900345
347	UDS PUERTO PARADA	11	198	900346
348	UDS EL ESPINO	11	185	900347
349	UDS SAN DIONISIO	11	192	900348
350	UDS LA CRUZ	11	198	900349
351	UDS SAN RAFAEL ORIENTE	12	216	900350
352	UDS EL TRANSITO	12	205	900351
353	UDS SAN JORGE	12	213	900352
354	UDS PRIMAVERA	12	205	900353
355	UDS BERLIN	11	177	900354
356	HOSPITAL SANTIAGO DE MARIA	11	196	900355
357	CASA DE SALUD CTN.LA CRUZ (ESTANZUELA)	11	182	900356
358	UDS ESTANZUELAS	11	182	900357
359	CASA DE SALUD CANTON AZACUALPIA JOCOMONT	11	187	900358
360	CASA DE SALUD CANTON CHAPETONES	11	197	900359
361	CASA DE SALUD CTON.SAN JOSE (NVA.GRANAD	11	187	900360
362	CASA DE SALUD CTON.PALOMILLA DE GUALCHO	11	187	900361
363	CASA DE SALUD CTON.AZACUALPIA D GUALCHO	11	187	900362
364	UDS ALEGRIA	11	176	900363
365	UDS MERCEDES UMAÑA	11	186	900364
366	UDS CALIFORNIA	11	178	900365
367	UDS NUEVA GRANADA	11	187	900366
368	UDS TECAPAN	11	197	900367
369	UDS EL TRIUNFO	11	180	900368
370	UDS EL CERRITO	11	196	900369
371	CASA DE SALUD LOS ESPERANZA (JIQUILISC)	11	183	900370
372	HOSPITAL JIQUILISCO	11	183	900371
373	CRN ISLA MADRE SAL	11	189	900372
374	UDS TIERRA BLANCA (JIQUILISCO)	11	183	900373
375	UDS PUERTO EL TRIUNFO	11	189	900374
376	UDS SAN AGUSTIN	11	190	900375
377	UDS SAN FRANCISCO JAVIER	11	194	900376
378	UDS ISLA DE MENDEZ	11	183	900377
379	UDS EL QUEBRADO	11	183	900378
380	UDS CORRAL DE MULAS	11	189	900379
381	UDS LA CANOA	11	183	900380
382	UDS SALINAS DE SISIGUAYO	11	183	900381
383	UDS NUEVO AMANECER	11	183	900382
384	CASA DE SALUD SAN HILARIO	11	178	900383
385	HOSPITAL SAN JUAN DE DIOS SAN MIGUEL	12	215	900384
386	CRN MAYUCAQUIN	12	215	900385
387	CASA DE SALUD LOS RANCHOS	12	215	900386
388	UDS SESORI	12	217	900387
389	CASA DE SALUD SANTA FIDELIA	12	215	900388
390	CASA DE SALUD CASA DE LA MISERICORDIA	12	215	900389
391	CASA DE SALUD ASILO SAN ANTONIO	12	215	900390
392	CASA DE SALUD LOS CARRETOS	12	215	900391
393	UDS DR.ROBERTO A.CARIAS (LA PRESITA)	12	215	900392
394	CASA DE SALUD CHAMBALA	12	203	900393
395	UDS CHIRILAGUA	12	204	900394
396	UDS MILAGRO DE LA PAZ	12	215	900395
397	UDS LAS PLACITAS	12	203	900396
398	UDS CHAPELTIQUE	12	202	900397
399	UDS EL ZAMORAN	12	215	900398
400	CASA DE SALUD EL TABLON	12	217	900399
401	UDS SAN CARLOS (SAN MIGUEL)	12	215	900400
402	CASA DE SALUD CHILANGUERA	12	204	900401
403	UDS SAN ANTONIO SILVA	12	215	900402
404	UDS EL PLATANAR	12	207	900403
405	UDS ULUAZAPA	12	218	900404
406	UDS COMACARAN	12	201	900405
407	UDS EL CUCO	12	204	900406
408	UDS SAN PEDRO CHIRILAGUA	12	204	900407
409	UDS QUELEPA	12	210	900408
410	UDS EL TECOMATAL	12	215	900409
411	UDS EL NIÑO	12	215	900410
412	UDS TIERRA BLANCA (CHIRILAGUA)	12	204	900411
413	UDS EL JOCOTE DULCE	12	203	900412
414	UDS MARTIN ZALDIVAR COL.CARRILLO	12	215	900413
415	UDS TONGOLONA	12	207	900414
416	UDS MIRAFLORES	12	215	900415
417	UDS YUCUAIQUIN	14	261	900416
418	UDS YAYANTIQUE	14	260	900417
419	CASA DE SALUD SAN ANTONIO CHAVEZ	12	215	900418
420	CASA DE SALUD CONCEPCION COROZAL	12	215	900419
421	CASA DE SALUD LOS HATILLOS (YUCUAIQUIN)	14	261	900420
422	UDS SAN MIGUEL	12	215	900421
423	HOSPITAL MONSEÑOR OSCAR ARNULFO ROM.C.B.	12	200	900422
424	UDS SAN GERARDO	12	212	900423
425	CASA DE SALUD LA LAGUNA SAN GERARDO	12	212	900424
426	CASA DE SALUD SAN JERONIMO (SAN GERARDO	12	212	900425
427	UDS SAN LUIS DE LA REINA	12	214	900426
428	UDS CAROLINA	12	199	900427
429	UDS SAN ANTONIO DEL NORTE	12	211	900428
430	CASA DE SALUD LA CEIBITA (CAROLINA)	12	199	900429
431	UDS JUCUAPA	11	184	900430
432	UDS LAS CHARCAS (SN.BUENA.)	11	191	900431
433	UDS SAN BUENA VENTURA	11	191	900432
434	UDS CHINAMECA	12	203	900433
435	HOSPITAL NUEVA GUADALUPE	12	208	900434
436	UDS MONCAGUA	12	207	900435
437	CASA DE SALUD SAN PEDRO ARENALES	12	203	900436
438	CASA DE SALUD SAN ANTONIO (CHINAMECA)	12	203	900437
439	UDS LOLOTIQUE	12	206	900438
440	CASA DE SALUD CRUZ SEGUNDA (CHINAMECA)	12	203	900439
441	UDS LAS MARIAS	12	203	900440
442	CASA DE SALUD EL BARRIAL	13	240	900441
443	HOSPITAL NACIONAL SAN FRANCISCO GOTERA	13	237	900442
444	UDS JOCORO	13	230	900443
445	CASA DE SALUD QUEBRACHOS (JOCOAI)	13	229	900444
446	UDS OSICALA	13	233	900445
447	CASA DE SALUD CIMIENTOS (YAMABAL)	13	243	900446
448	UDS EL DIVISADERO	13	224	900447
449	CASA DE SALUD EL PEÑON  (SOCIEDAD)	13	241	900448
450	UDS CORINTO	13	221	900449
451	CASA DE SALUD EL CARRIZAL (SAN SIMON)	13	239	900450
452	UDS PERQUIN	13	234	900451
453	CASA DE SALUD LA JOYA  MATAZANO(CHILANG	13	222	900452
454	UDS CACAOPERA	13	220	900453
455	UDS SAN LUIS (MEANGUERA)	13	232	900454
456	UDS SOCIEDAD	13	241	900455
457	UDS GUATAJIAGUA	13	227	900456
458	UDS JOCOITIQUE	13	229	900457
459	UDS TOROLA	13	242	900458
460	UDS MEANGUERA	13	232	900459
461	UDS SAN FERNANDO (MORAZAN)	13	236	900460
462	UDS JOATECA	13	228	900461
463	UDS SAN SIMON	13	239	900462
464	UDS DELICIAS DE CONCEPCION	13	223	900463
465	UDS CHILANGA	13	222	900464
466	UDS SENSEMBRA (YAMABAL)	13	240	900465
467	UDS SAN ISIDRO (MORAZAN)	13	238	900466
468	UDS SAN CARLOS (MORAZAN)	13	235	900467
469	UDS VILLA EL ROSARIO	13	225	900468
470	UDS GUALOCOCTI	13	226	900469
471	UDS YOLOAIQUIN	13	244	900470
472	UDS LOLOTIQUILLO	13	231	900471
473	UDS ARAMBALA	13	219	900472
474	CASA DE SALUD SAN BARTOLO (GUATAJIAGUA)	13	227	900473
475	CASA DE SALUD LA JOYA (SOCIEDAD)	13	241	900474
476	CASA DE SALUD HONDABLE (CORINTO)	13	221	900475
477	CASA DE SALUD CHAPARRAL (CHILANGA)	13	222	900476
478	CASA DE SALUD CALAVERA  (CACAOPERA)	13	220	900477
479	CASA DE SALUD RANCHO QUEMADO (PERQUIN)	13	234	900478
480	CASA DE SALUD AGUA ZARCA (OSICALA)	13	233	900479
481	HOSPITAL NACIONAL LA UNION	14	252	900480
482	UDS ENF.ZOILA E.TURCIOS DE JIMENEZ	14	252	900481
483	CASA DE SALUD LAS TUNAS	14	248	900482
484	CASA DE SALUD EL CACAO	14	248	900483
485	UDS SAN ALEJO	14	257	900484
486	CASA DE SALUD EL COYOLITO (LA UNION)	14	252	900485
487	UDS INTIPUCA	14	251	900486
488	CASA DE SALUD AGUA FRIA (SAN ALEJO)	14	257	900487
489	UDS CONCHAGUA	14	248	900488
490	CASA DE SALUD SAN JERONIMO (SAN ALEJO)	14	257	900489
491	UDS MEANGUERA DEL GOLFO	14	262	900490
492	UDS EL TAMARINDO	14	248	900491
493	UDS OLOMEGA (EL CARMEN)	14	249	900492
494	UDS ISLA ZACATILLO	14	252	900493
495	UDS ISLA CONCHAGUITA (MEANG.D/GOLFO)	14	262	900494
496	UDS EL CARMEN LA UNION	14	249	900495
497	UDS AGUA CALIENTE(LA UNION)	14	252	900496
498	UDS HATO NUEVO (SN. ALEJO)	14	257	900497
499	UDS LLANO LOS PATOS	14	248	900498
500	UDS AGUA ESCONDIDA	14	252	900499
501	UDS BOBADILLA (SAN ALEJO)	14	257	900500
502	UDS EL HUISQUIL (CONCHAGUA)	14	248	900501
503	UDS EL FARO (CONCHAGUA)	14	248	900502
504	UDS EL PICHE	14	249	900503
505	UDS LOS LEONES-SN.CARLOS BORROMEO	14	252	900504
506	CRN EL CIPRES	14	248	900505
507	CASA DE SALUD BARRANCONES/PIEDRAS BLAN	14	255	900506
508	CRN EL DERRUMBADO	14	253	900507
509	HOSPITAL NACIONAL SANTA ROSA DE LIMA	14	259	900508
510	UDS ANA MARIA ALFARO SANCHEZ NUEVA ESPART	14	254	900509
511	UDS PASAQUINA	14	255	900510
512	CASA DE SALUD EL RINCON (EL SAUCE)	14	250	900511
513	UDS EL GUAJINIQUIL (LISLIQUE)	14	253	900512
514	UDS ANAMOROS	14	245	900513
515	UDS TROMPINA/EL BEJUCAL	13	224	900514
516	UDS EL SAUCE	14	250	900515
517	CASA DE SALUD EL TALPETATE	14	254	900516
518	CASA DE SALUD AGUA BLANCA (ANAMOROS)	14	245	900517
519	UDS CONCEPCION DE ORIENTE	14	247	900518
520	UDS LISLIQUE	14	253	900519
521	UDS MONTECA	14	254	900520
522	UDS BOLIVAR	14	246	900521
523	UDS POLOROS	14	256	900522
524	UDS SAN JOSE DE LA FUENTE	14	258	900523
525	UDS SAN FELIPE (PASAQUINA)	14	255	900524
526	CASA DE SALUD DOS DE MAYO	6	105	900525
527	CRN MAPILAPA (NEJAPA)	6	105	900526
528	CASA DE SALUD SAN JERONIMO LOS PLANES	6	105	900527
529	CASA DE SALUD MALACOFF	6	114	900528
530	CASA DE SALUD EL TRANSITO	6	114	900529
531	CASA DE SALUD TUTULTEPEQUE	6	105	900530
532	CASA DE SALUD LOS RAMIREZ	7	124	900531
533	CASA DE SALUD SAN ANTONIO SEGURA	5	86	900532
534	CASA DE SALUD SAN ANTONIO GRANDE	6	101	900533
535	CASA DE SALUD SAN DIEGO	6	101	900534
536	CASA DE SALUD LA JOYA (PAISNAL)	6	101	900535
537	CASA DE SALUD LA CABAÑA	6	101	900536
538	CASA DE SALUD GARCITAS	6	101	900537
539	UDS APOPA	6	98	900538
540	CASA DE SALUD EL TRAPICHITO	7	130	900539
541	UDS NEJAPA	6	105	900540
542	UDS GUAZAPA	6	102	900541
543	UDS AGUILARES	6	97	900542
544	UDS TONACATEPEQUE	6	114	900543
545	CASA DE SALUD COLIMA	7	130	900544
546	UDS EL PAISNAL	6	101	900545
547	UDS DISTRITO ITALIA	6	114	900546
548	UDS POPOTLAN	6	98	900547
549	UDS CHINTUC	6	98	900548
550	UDS DR.MAURICIO SOL NERIO SN.JAC.	6	110	900549
551	CRN EL CEDRO (PANCHIMALCO)	6	106	900550
552	HOSPITAL DR.JOSE A.SALDAÑA (NEUMOLOGICO)	6	110	900551
553	UDS DR.ROBERTO CACERES B (SAN MARCOS)	6	108	900552
554	UDS DR.JOSE E.AVALOS LA GUARDIA  SANTO TOMAS	6	112	900553
555	CASA DE SALUD ALTOS DE JARDINES	6	97	900554
556	CASA DE SALUD JOYA GRANDE	6	111	900555
557	CASA DE SALUD PANCHIMALQUITO	6	106	900556
558	CASA DE SALUD EL AMAYON	6	107	900557
559	CASA DE SALUD LAS BARROSAS	6	107	900558
560	UDS SANTIAGO TEXACUANGO	6	111	900559
561	CASA DE SALUD PALO GRANDE	6	107	900560
562	CASA DE SALUD PLAN DEL MANGO	6	107	900561
563	UDS PANCHIMALCO	6	106	900562
564	CASA DE SALUD SAN ISIDRO	6	106	900563
565	UDS ROSARIO DE MORA	6	107	900564
566	UDS PLANES DE RENDEROS	6	106	900565
567	CASA DE SALUD INTERCOMUNAL (SANTO TOMAS	6	112	900566
568	CASA DE SALUD CAMPAMENTO MORAZAN	6	99	900567
569	HOSP.DR.JOSE MOLINA MARTINEZ (PSIQUIAT.)	6	113	900568
570	UDS ZOILA M DE GUADRON SOYAPANGO	6	113	900569
571	UDS AMATEPEC	6	113	900570
572	UDS UNICENTRO	6	113	900571
573	CRN CANTON LAS DELICIAS (SAN MARTIN)	6	105	900572
574	CRN VALLE LAS DELICIAS	6	105	900573
575	HOSPITAL ENF.ANGELICA VIDAL DE NAJARRO	6	103	900574
576	UDS SANTA LUCIA (ILOPANGO)	6	103	900575
577	UDS SAN MARTIN	6	109	900576
578	CASA DE SALUD CANTON EL SAUCE	6	109	900577
579	UDS SAN BARTOLOME PERULAPIA	7	122	900578
580	CLINICA DE EMPLEADOS MSPAS	6	110	900579
581	CASA DE SALUD CORO QUIÑONEZ	6	110	900580
582	UDS DR.JUAN R.ALVARENGA.SN.MIGUELITO	6	110	900581
583	CASA DE SALUD FINCA SERPA (S.S.)	6	110	900582
584	UDS CONCEPCION	6	110	900583
585	CASA DE SALUD SANTA ROSA ATLACATL (C.D)	6	115	900584
586	UDS BARRIOS	6	110	900585
587	CASA DE SALUD LAS PALMAS	6	110	900586
588	UDS MONSERRAT	6	110	900587
589	HOSPITAL.DR.JUAN JOSE FERNANDEZ ZACAMIL	6	99	900588
590	UDS LOURDES (SAN SALVADOR)	6	110	900589
591	CASA DE SALUD PAPINI	6	97	900590
592	UDS ZACAMIL	6	99	900591
593	CASA DE SALUD LAS LAJAS	6	110	900592
594	UDS DR.HUGO MORAN QUIJADA MEJICANOS	6	104	900593
595	CASA DE SALUD BRISAS DE CANDELARIA	6	110	900594
596	UDS CUSCATANCINGO	6	100	900595
597	UDS CIUDAD DELGADO	6	115	900596
598	CASA DE SALUD CABAÑAS	6	115	900597
599	UDS SAN ANTONIO ABAD	6	110	900598
600	CASA DE SALUD EL CARMEN (SAN SALVADOR)	6	110	900599
601	UDS HABITAT CONFIEN	6	115	900600
602	UDS VILLA MARIONA	6	100	900601
603	HOSPITAL NACIONAL SUCHITOTO	7	130	900602
604	UDS SAN JOSE GUAYABAL	7	124	900603
605	CASA DE SALUD CANTON TECOMATEPEQUE	7	125	900604
606	UDS ORATORIO DE CONCEPCION	7	121	900605
667	CASA DE SALUD CANTON SANTA LUCIA	7	118	900606
608	CASA DE SALUD MOROPALA	12	205	900607
609	CASA DE SALUD PRIMAVERA (SAN VICENTE)	10	172	900608
610	UDS  ALTA VISTA	6	114	900609
611	CASA DE SALUD NIÑOS DE LA CALLE 2000	6	110	900610
612	CASA DE SALUD CANTON SAN SEBASTIAN	7	118	900611
613	CASA DE SALUD SAN ANTONIO (VICTORIA)	9	161	900612
614	CASA DE SALUD ESCUINTLA (ZACATECOLUCA)	8	152	900613
615	CASA DE SALUD CANTON MIRAFLORES	7	125	900614
616	CLINICA ISNA ILOBASCO	9	156	900615
617	CASA DE SALUD CHORRO ARRIBA (IZALCO)	3	31	900616
618	CASA DE SALUD BUENOS AIRES (JUAYUA)	3	32	900617
619	CASA DE SALUD CUSAMALUCO (NAUHIZALCO)	3	33	900618
620	CASA DE SALUD TRES CEIBAS  (ARMENIA)	3	27	900619
621	CASA DE SALUD LOS NARANJOS (JUAYUA)	3	32	900620
622	CASA DE SALUD EL MATAZANO(STA.CATARIN M	3	38	900621
623	CASA DE SALUD VILLA TZU-CHI II	5	89	900622
624	CASA DE SALUD HOG DEL NIÑO San Vicente de  Paul	6	110	900623
625	CASA DE SALUD CIPI	6	110	900624
626	UNIDAD MEDICA ISSS SAN VICENTE	10	172	900625
627	UDS METAPAN	2	19	900626
628	CASA DE SALUD LAS MARIAS	14	254	900627
629	UDS ANEXO HOSPITAL AHUACHAPAN	1	1	900628
630	ONG  FUSAL LISLIQUE	14	253	900629
631	CASA DE SALUD EL JICARO	14	252	900630
632	CASA DE SALUD PUEBLO VIEJO	14	252	900631
633	CAE LA LIBERTAD	5	77	900632
634	UDS SONSONATE	3	40	900633
732	ONG ASAPROSAR MASAHUAT	2	18	900634
730	UDS TEOTEPEQUE	5	94	900635
740	ONG FUSAL TEJUTEPEQUE	9	160	900636
737	ONG FUSAL GUATAJIAGUA - CHAPELTIQUE	13	227	900637
743	UDS ESPIRITU SANTO	11	189	900638
738	ONG FUSAL GUATAJIAGUA (C.BARRIOS)	13	227	900639
739	ONG FUSAL CINQUERA	9	154	900640
742	ONG FUSAL CAROLINA - JUTIAPA	9	157	900641
635	CASA DE SALUD MONTELIMAR	8	136	900642
636	CASA DE SALUD LLANO LAS ROSAS	12	204	900643
637	CASA DE SALUD MAJAGUE	11	185	900644
638	CASA DE SALUD GUADALUPE	12	204	900645
639	ONG AMS  CACAOPERA	13	220	900646
640	ONG AMS DELICIAS DE CONCEPCION	13	223	900647
641	ONG AMS SAN SIMON CIUDAD BARRIOS	13	239	900648
642	ONG CALMA TOROLA	13	242	900649
643	ONG CALMA SAN FERNANDO (MOR)	13	236	900650
644	ONG CALMA JOCOAITIQUE	13	229	900651
645	ONG FUSAL GUATAJIAGUA (MORAZAN)	13	227	900652
646	ONG FUSAL SENSEMBRA	13	240	900653
647	ONG FUSAL YAMABAL	13	243	900654
648	ONG FUSAL SAN ISIDRO	13	238	900655
649	ONG FUSAL GUALOCOCTI	13	226	900656
650	ONG FUSAL JOATECA	13	228	900657
651	ONG FUNDEMUN YAYANTIQUE	14	260	900658
652	ONG FUSAL SAN ANTONIO SILVA	12	215	900659
653	ONG FUSAL SAN ANTONIO DEL NORTE	12	211	900660
654	ONG FUSAL CAROLINA	12	199	900661
655	ONG AMS SAN SIMON	13	239	900662
656	ONG FUSAL CITALA	4	45	900663
657	ONG FUSAL LA PALMA	4	53	900664
658	ONG FUNDEMUN SAN IGNACIO	4	66	900665
659	ONG FUNDEMUN LAS PILAS	4	66	900666
660	ONG FUNDEMUN LA REINA	4	54	900667
661	CASA DE SALUD LA JOYA (METAPAN)	2	19	900668
662	CASA DE SALUD SAN MIGUEL INGENIO	2	19	900669
663	UDS NUEVA CONCEPCION	4	57	900670
736	ONG ASAPROSAR MASHUAT- GUARNECIA	2	18	900671
664	UDS CHALATENANGO	4	48	900672
741	ONG FUSAL JUTIAPA	9	157	900673
733	ONG ASAPROSAR SANTA ROSA GUACHIPILIN	2	23	900674
665	CASA DE SALUD BOQUIN	14	256	900675
735	ONG ASAPROSAR SANTIAGO LA FRONTERA	2	24	900676
731	ONG CALMA SAN FERNANDO (CHA)	4	63	900677
734	ONG FUNDEMUN SAN JOSE LA FUENTE	14	258	900678
666	CASA DE SALUD CENTRO MATERNO SAN JULIAN	3	37	900679
668	CASA DE SALUD SAN AGUSTIN	7	125	900680
669	ONG CIRES  ARCATAO	4	43	900681
670	ONG CIRES NUEVA TRINIDAD	4	58	900682
671	ONG CIRES  SAN JOSE LAS FLORES	4	69	900683
672	OP CALMA TACUBA	1	11	900684
673	OP CALMA JUJUTLA	1	7	900685
674	OP CALMA GUAYMANGO	1	6	900686
675	OP CALMA CONCEPCION DE ATACO	1	4	900687
676	OP CALMA SAN PEDRO PUXTLA	1	10	900688
677	OP ASAPROSAR AHUACHAPAN	1	1	900689
678	OP ASAPROSAR TURIN	1	12	900690
679	OP CALMA  SAN FRANC. MEN.(HACHADURA)	1	8	900691
680	OP ASAPROSAR  AHUACH. (LAS CHINAMA	1	1	900692
681	OP ASAPROSAR  ATIQUIZAYA	1	3	900693
682	OP ASAPROSAR  SAN LORENZO	1	9	900694
683	OP SERAPHIN SN.FRCO.MENEND.CARA S	1	8	900695
684	OP SERAPHIN  EL REFUGIO	1	5	900696
685	OP SERAPHIN JUJUTLA BARRA DE SANT.	1	7	900697
686	OP SERAPHIN JUJUTLA GUAYAPA ABAJO	1	7	900698
687	OP SERAPHIN ATIQUIZAYA	1	3	900699
688	OP SERAPHIN JUJUTLA	1	7	900700
689	OP SERAPHIN SN.FRCO.MENENDEZ HACHAD	1	8	900701
690	OP CALMA JUJUTLA GUAYAPA ABAJO	1	7	900702
691	OP CALMA JUJUTLA SN.JOSE EL NARAJ	1	7	900703
692	OP ASAPROSAR JUJUTLA GUAYAPA ABAJ	1	7	900704
693	OP ASAPROSAR  JUJUTLA SN.JOSE EL NAR	1	7	900705
694	OP FUSAL  NAHUIZALCO	3	33	900706
695	OP FUSAL JUAYUA	3	32	900707
696	OP SERAPHIN NAHUIZALCO	3	33	900708
697	OP SERAPHIN JUAYUA	3	32	900709
698	OP CALMA  SAN ANTONIO DEL MONTE	3	36	900710
699	OP CALMA NAHUIZALCO	3	33	900711
700	OP CALMA SANTO DOMINGO DE GUZMAN	3	39	900712
701	OP CALMA SANTA CATARINA MASAHUAT	3	38	900713
702	OP ASAPROSAR  ACAJUTLA	3	26	900714
703	OP SERAPHIN SONSONATE	3	40	900715
704	OP SERAPHIN  IZALCO	3	31	900716
705	OP SERAPHIN SAN ANTONIO DEL MONTE	3	36	900717
706	OP SERAPHIN NAHUILINGO	3	34	900718
707	OP FUSAL IZALCO	3	31	900719
708	OP SERAPHIN SONSONATE (SALINAS AYAC	3	40	900720
709	OP SERAPHIN SANTA ISABEL ISHUATAN	3	30	900721
710	OP SERAPHIN CUISNAHUAT	3	29	900722
711	OP SERAPHIN SAN JULIAN	3	37	900723
712	OP SERAPHIN CALUCO	3	28	900724
713	OP CALMA SONSONATE	3	40	900725
714	ONG CALMA  SAN RAFAEL	4	72	900726
715	ONG CALMA SANTA RITA	4	66	900727
716	ONG CALMA DULCE NOMBRE DE MARIA	4	49	900728
717	ONG CALMA SAN FRANCISCO MORAZAN	4	65	900729
718	ONG FUNDEMUN  OJOS DE AGUA	4	59	900730
719	ONG FUNDEMUN LAS VUELTAS	4	55	900731
720	ONG FUNDEMUN SAN ANTONIO LOS RANCH	4	62	900732
721	ONG FUNDEMUN LA LAGUNA	4	52	900733
722	ONG FUNDEMUN COMALAPA	4	46	900734
723	ONG FUNDEMUN SAN MIGUEL DE MERCEDE	4	71	900735
724	ONG CALMA  NOMBRE DE JESUS	4	56	900736
725	ONG CALMA SAN ANTONIO LA CRUZ	4	61	900737
726	ONG FUNDEMUN EL CARRIZAL	4	50	900738
727	ONG CALMA  SAN ISIDRO LABRADOR	4	42	900739
728	ONG CALMA POTONICO	4	60	900740
729	ONG CALMA SAN JOSE CANCASQUE	4	68	900741
744	ONG CIDECO NUESTRA SEÑORA DE LOURDES	8	150	900742
745	CLINICA INMACULADA CONCEPCION	8	147	900743
746	HOSPITAL ISSS REGIONAL  SANTA ANA 	2	22	900744
747	HOSPITAL ISSS REGIONAL SONSONATE 	3	40	900745
748	HOSPITAL ISSS REGIONAL SAN MIGUEL	12	215	900746
749	HOSPITAL 1º DE MAYO	6	110	900747
750	HOSPITAL ISSS POLICLINICO PLANES DE RENDEROS	6	110	900748
751	HOSPITAL ISSS MEDICO QUIRURGICO Y ONCOLOGIA	6	110	900749
752	HOSPITAL AMATEPEC (ISSS)	6	113	900750
753	HOSPITAL ISSS POLICLINICO  ROMA 	6	110	900751
754	HOSPITAL GENERAL ISSS	6	110	900752
755	HOSPITAL ONCOLOGICO (ISSS)	6	110	900753
756	UDS PERIFERICA SANTA ROSA DE LIMA	14	259	900754
757	ONG INTERVIDA (LA LIBERTAD)	5	85	900755
758	CAE APOPA	6	98	900756
759	ONG AMS SAN ISIDRO	13	238	900757
760	ONG AMS GUALOCOCTI	13	226	900758
761	ONG AMS CHILANGA	13	222	900759
762	ONG AMS CORINTO	13	221	900760
763	ONG AMS LOLOTIQUILLO	13	231	900761
764	ONG FUSAL SANTA MARTA	9	161	900762
765	ONG FUSAL DOLORES	9	162	900763
766	ONG FUSAL NUEVO EDEN	12	209	900764
767	ONG CALMA GUATAJIAGUA	13	227	900765
768	ONG CALMA SEMSENBRA	13	240	900766
769	ONG  CALMA YAMABAL	13	243	900767
770	ONG CALMA ARAMBALA	13	219	900768
771	ONG CALMA JOATECA	13	228	900769
772	ONG CALMA VILLA EL ROSARIO	13	225	900770
773	ONG FUNDEMUN LISLIQUE	14	253	900771
774	ONG CALMA ARCATAO	4	43	900772
775	ONG CALMA NUEVA TRINIDAD	4	58	900773
776	ONG CALMA SAN JOSE LAS FLORES	4	69	900774
777	ONG CALMA SAN ANTONIO LOS RANCHOS	4	62	900775
778	ONG ASAPROSAR SESORI	12	217	900776
779	ONG ASAPROSAR CIUDAD BARRIOS	12	200	900777
780	ONG CALMA SAN MIGUEL DE MERCEDES	4	71	900778
781	ONG CALMA LAS VUELTAS	4	55	900779
782	ONG  CALMA SAN JOSE OJOS DE AGUA	4	59	900780
783	ONG CALMA EL CARRIZAL	4	50	900781
784	ONG CALMA LA LAGUNA	4	52	900782
785	ONG CALMA COMALAPA	4	46	900783
786	ONG CALMA VAINILLAS	4	50	900784
787	ONG FUNDEMUN YAYANTIQUE-SN.ANTONIO SILVA	14	260	900785
788	ONG FUSAL SAN GERARDO	12	212	900786
789	ONG FUSA SAN SIMON	13	239	900787
790	ONG ASAPROSAR GUATAJIAGUA-CIUDAD BARRIOS	13	227	900788
791	ONG SERAPHIM CITALA	4	45	900789
792	ONG SERAPHIM LA PALMA	4	53	900790
793	ONG SERAPHIM SAN IGNACIO	4	66	900791
794	ONG SERAPHIM LA REINA	4	54	900792
795	ONG SERAPHIM LAS PILAS	4	66	900793
796	CENTRO PENAL DE READAPTACION DE MENORES	6	114	900794
797	HOSPITAL MILITAR SAN SALVADOR SS	6	110	900795
798	UNIDAD MEDICA ISSS  ZACATECOLUCA 	8	152	900796
799	ONG CALMA GUATAJIAGUA-CHAPELTIQUE	12	202	900797
800	CASA DE SALUD AMAPALITA (EL FARO)	14	248	900798
801	CASA DE SALUD UPIRE FOSALUD	14	254	900799
802	CAE SAN MARTIN	6	109	900800
803	UNIDAD MEDICA ISSS CHALATENANGO 	4	48	900801
804	UNIDAD MEDICA  ISSS LA LIBERTAD 	5	83	900802
805	UNIDAD MEDICA ISSS QUEZALTEPEQUE	5	86	900803
806	UNIDAD MEDICA ISSS SANTA TECLA	5	85	900804
807	CLINICA COMUNAL ISSS  ANTIGUO CUSCATLAN	5	75	900805
808	CLINICA COMUNAL ISSS SAN ANTONIO	5	85	900806
809	CLINICA COMUNAL ISSS SANTA MONICA	5	85	900807
810	CLINICA COMUNAL ISSS MERLIOT	5	75	900808
811	CLINICA COMUNAL ISSS LOURDES	5	77	900809
812	CLINICA COMUNAL ISSS SITIO DEL NIÑO	5	89	900810
813	UNIDAD MEDICA  ISSS  ATEOS	5	87	900811
814	ONG FUSAL VICTORIA	9	161	900812
815	UDS SAN JUAN DE LA CRUZ YAMABAL	13	243	900813
816	UDS RANCHO QUEMADO  FOSALUD	13	234	900814
817	CLINICA MUNICIPAL DEL PAISNAL	6	101	900815
818	ONG FUNDEMUN GUAJINIQUIL/LISLIQUE	14	253	900816
819	UDS PERIFERICA CIUDAD BARRIOS	12	200	900817
820	UDS PERIFERICA DE COJUTEPEQUE	7	117	900818
821	ONG CALMA SAN ATONIO DEL MOSCO-TOROLA	12	211	900819
822	CASA DE SALUD EL AMATILLO	14	259	900820
823	CASA DE SALUD LOMA LARGA	14	252	900821
824	CENTRO DE S. VILASECA. COL.CDAD. PACIF.	12	199	900822
825	CLINICA PRIVADA SAN JUDAS TADEO	8	146	900823
826	HOSPITAL DE DESNUTRICION DE AGAPE	3	41	900824
827	UNIDAD MOVIL 1 FOSALUD	10	172	900825
828	UNIDAD MOVIL 2 FOSALUD	1	1	900826
829	UNIDAD MOVIL 3 FOSALUD	2	22	900827
830	UNIDAD MOVIL 4 FOSALUD	2	22	900828
831	UNIDAD MOVIL 5 FOSALUD	6	110	900829
833	CENTRO REHABILITACION OCCIDENTE	2	22	900830
834	CENTRO REHABILITACION INTEGRAL ORIENTE	12	215	900831
835	APARATO LOCOMOTOR	6	110	900832
836	AUDICION Y LENGUAJE	6	110	900833
837	ATENCION A ANCIANOS SARA ZALDIVAR	6	110	900834
838	REHABILITACION DE CIEGOS EUGENIA DUEÑAS	6	110	900835
839	REHABILITACION INTEGRAL NIÑEZ Y ADOLESCE	6	110	900836
840	CONSULTA EXTERNA Y GERIATRICA	6	110	900837
841	ONG ASAPROSAR SAN FRANCISCO DEL MONTE	9	156	900838
842	ONG ASAPROSAR SANTA LUCIA	9	156	900839
843	ONG ASAPROSAR ILOBASCO	9	156	900840
844	INSTITUTO DEL CANCER	6	110	900841
845	FUDEM	6	110	900842
846	ONG CALMA CONCEPCION QUEZALTEPEQUE	4	47	900843
847	ONG ASAPROSAR EL PORVENIR	2	17	900844
848	ONG SERAPHIM AGUA CALIENTE	4	42	900845
849	CASA DE SALUD ISLA COLORADA	8	153	900846
850	CASA DE SALUD ISLA SAN RAFAEL TASAJERA	8	153	900847
851	CASA DE SALUD EL CHINGO	8	153	900848
853	ONG LIBRAS DE AMOR APANECA	1	2	900849
854	ONG LIBRAS DE AMOR ATACO	1	4	900850
855	ONG LIBRAS DE AMOR GUAYMANGO	1	6	900851
856	ONG LIBRAS DE AMOR SAN MIGUELITO	2	22	900852
857	ONG LIBRAS DE AMOR TOMAS PINEDA MARTINEZ	2	22	900853
858	ONG LIBRAS DE AMOR EL PALMAR	2	22	900854
859	ONG LIBRAS DE AMOR EL CONGO	2	16	900855
860	ONG LIBRAS DE AMOR SANTA LUCIA	2	22	900856
861	ONG LIBRAS DE AMOR PLANES DE LA LAGUNA	2	22	900857
862	ONG LIBRAS DE AMOR SAN JULIAN (LUIS POMA	3	37	900858
863	ONG ASPS  CHALCHUAPA	2	15	900859
864	CASA DE SALUD CONCHAGUA LU EL PILON	14	248	900860
865	CS Pasaquina LU Raul Napoleon Chicas	14	255	900861
867	BMSALVADOREÑA-CUBANA	10	172	900862
868	UNIDAD MEDICA ISSS ZACAMIL 	6	99	900863
870	UDS COLON LL EL BOTONCILLAL	5	77	900864
871	Centro Penal de Maxima Seguridad	8	152	900865
872	CS Izalco Sonsonate San Isidro	3	31	900866
873	OSI La Union LU Puerto de la Union	14	252	900867
874	UDS LA PLAYA	14	252	900868
876	OSI Francisco Menendez AH Frontera La Hachadura	1	1	900869
877	OSI Ahuachapan AH Frontera Las Chinamas	1	1	900870
878	OSI Candelaria de La Frontera SA Frontera San Cristobal	2	13	900871
879	OSI Metapan SA Frontera Anguiatu	2	19	900872
880	OSI Citala CH Frontera el Poy	4	45	900873
881	OSI Pasaquina LU Frontera el Amatillo	14	255	900874
882	OSI Acajutla SO Puerto	3	26	900875
1099	ONG LIBRAS DE AMOR  SONSONATE SAN ANTONIO DEL MONTE	3	36	900876
1098	ONG LIBRAS DE AMOR AHUACHAPAN	1	1	900877
1088	UDS USULUTAN US	11	198	900878
1100	ONG LIBRAS DE AMOR  SONSONATE SANTA CATARINA MASAHUAT	3	38	900879
1101	UNIDAD MEDICA ISSS  ILOPANGO SS	6	103	900880
1102	UDS CHALATENANGO CH GUARJILA	4	48	900881
1103	CONSULTORIO DE ESPECIALIDADES	6	110	900882
1376	UCSF Suchitoto CU Laura Lopez	7	130	900883
1372	HOSPITAL MILITAR SAN MIGUEL SM	12	215	900884
1378	UDS ILOPANGO SS	6	103	900885
1379	UCSF San Luis Talpa LP Amatecampo  (ECOSF parcial)	8	144	900886
1380	FUNTER MERLIOT  LL 	5	75	900887
1381	FUNTER SONSONATE SO	3	40	900888
1382	FUNTER SAN VICENTE SV	10	172	900889
1399	UNIDAD MEDICA ISSS LA UNION LU	14	252	900890
1409	CENTRO PENAL SAN FRANCISCO GOTERA MO	13	237	900891
1410	DESTACAMENTO MILITAR No. 4 MORAZAN	13	237	900892
1430	UCSF San Cristobal CU San Antonio	7	123	900893
884	UCSF Citala CH	4	45	1
885	UCSF Cítala CH San Ramon	4	45	2
886	UCSFE La Palma CH	4	53	3
887	UCSF La Palma CH Horcones	4	53	4
888	UCSF La Plama CH San José Sacare	4	53	5
889	UCSF La Palma CH Granadillas	4	53	6
890	UCSF San Ignacio CH	4	66	7
891	UCSF San Ignacio CH El Carmen	4	66	8
892	UCSF San Ignacio CH Las Pilas	4	66	9
893	UCSF La Reina CH	4	54	10
894	UCSF La Reina CH El Pepeto	4	54	11
895	UCSF La Reina CH El Tigre	4	54	12
896	UCSF Arcatao CH	4	43	13
897	UCSF Nueva Trinidad CH	4	58	14
898	UCSF San Jose Las Flores CH	4	69	15
899	UCSF Nombre de Jesus CH	4	56	16
900	UCSF Nombre de Jesus CH Junquillo	4	56	17
901	UCSF San Antonio de la Cruz CH	4	61	18
902	UCSF San Isidro Labrador CH	4	67	19
903	UCSF San José Cancasque CH	4	68	20
904	UCSF Potonico CH	4	60	21
905	UCSF San Antonio los Ranchos CH	4	62	22
906	UCSF San Miguel de Mercedes CH	4	71	23
907	UCSF Las Vueltas CH	4	55	24
908	UCSF Ojos de Agua CH	4	59	25
909	UCSF Ojos de Agua CH El Zapotal	4	59	26
910	UCSF El Carrizal CH	4	50	27
911	UCSF El Carrizal CH Vanillas	4	50	28
912	UCSF La Laguna CH	4	52	29
913	UCSF La Laguna CH San Jose	4	52	30
914	UCSF Comalapa CH	4	46	31
915	UCSF Comalapa CH Guachipilín	4	46	32
883	UCSFE Chalatenango CH Guarjila	4	48	33
916	UCSF Dulce Nombre de Maria CH	4	49	34
917	UCSF Dulce Nombre de Maria CH Ocotal	4	49	35
918	UCSF Dulce Nombre de Maria CH Gutierrez	4	49	36
919	UCSF San Rafael CH	4	72	37
921	UCSF San Rafael CH San Jose Los Sitios	4	72	38
920	UCSF Santa Rita CH	4	73	39
922	UCSF Santa Rita CH El Sol	4	73	40
923	UCSF San Fernando CH	4	63	41
924	UCSF Concepción Quezaltepeque	4	47	42
925	UCSF Concepción Quezaltepeque CH Llano Grande	4	47	43
926	UCSF Concepción Quezaltepeque CH Monte Redondo	4	47	44
927	UCSF Agua Caliente CH	4	42	45
928	UCSF Agua Caliente CH El Carmen	4	42	46
929	UCSF Agua Caliente CH Cerro Grande	4	42	47
930	UCSF Agua Caliente CH Obrajuelo	4	42	48
931	UCSF San Luis del Carmen CH	4	70	49
932	UCSF San Francisco Morazan CH	4	65	50
935	UCSF Nuevo Eden de San juan SM	12	209	51
936	UCSF Nuevo Eden de San Juan SM San Sebastian	12	209	52
937	UCSF Ilobasco CA San Jose	9	156	53
938	UCSF Ilobasco CA Agua Zarca	9	156	54
939	UCSF Ilobasco CA Cerro Colorado	9	156	55
940	UCSF Ilobasco CA San Francisco Iraheta	9	156	56
941	UCSF Ilobasco CA Potreros	9	156	57
942	UCSF Ilobasco CA Los Llanitos	9	156	58
943	UCSF Ilobasco CA Huertas	9	156	59
944	UCSF Ilobasco CA Sitio Viejo	9	156	60
945	UCSF Ilobasco CA  Maquilishuat Santa Lucia	9	156	61
946	UCSF Ilobasco CA Maquilishuat  El Limón	9	156	62
947	UCSF Ilobasco CA San Francisco del Monte	9	156	63
948	UCSF Jutiapa CA	9	157	64
950	UCSF Jutiapa CA Carolina	9	157	65
949	UCSF Cinquera CA	9	154	66
951	UCSF Tejutepeque CA	9	160	67
952	UCSF Tejutepeque CA Concepción	9	160	68
953	UCSF Tejutepeque CA El Zapote	9	160	69
954	UCSF Victoria CA	9	161	70
955	UCSF Victoria CA Azacualpa	9	161	71
956	UCSF Victoria CA SanAntonio	9	161	72
959	UCSF Victoria CA San Pedro	9	161	73
957	UCSF Victoria CA Santa Marta	9	161	74
958	UCSF Dolores CA	9	162	75
960	UCSF Dolores CA San Carlos	9	162	76
961	UCSF San Antonio SM	12	211	77
962	UCSF Carolina SM 1	12	199	78
963	UCSF Carolina SM La Ceibita	12	199	79
964	UCSF Carolina SM Rosa Nacaspilo	12	199	80
965	UCSF San Gerardo SM San Jeronimo	12	212	81
966	UCSF San Gerardo SM 1	12	212	82
967	UCSF Guatajiagua MO 1	13	227	83
968	UCSF Guatajiagua MO 2	13	227	84
969	UCSF Guatajiagua MO Maiguera	13	227	85
970	UCSF Guatajiagua MO San Bartolo	13	227	86
971	UCSF Guatajiagua MO Los Abelines	13	227	87
972	UCSF Sensembra MO	13	240	88
973	UCSF Yamabal MO San Juan de La Cruz	13	243	89
974	UCSF Yamabal MO Isletas	13	243	90
975	UCSF Torola MO	13	242	91
976	UCSF San Fernando MO	13	236	92
977	UCSF Jocoaitique MO	13	229	93
978	UCSF Jocoaitique MO Quebrachos	13	229	94
979	UCSF Arambala MO	13	219	95
980	UCSF Joateca MO	13	228	96
981	UCSF Joateca MO La Laguna	13	228	97
982	UCSF El Rosario MO	13	225	98
983	UCSF San Isidro MO	13	238	99
984	UCSF San Simón MO 3	13	239	100
985	UCSF San Simón MO Potrero Adentro	13	239	101
986	UCSF San Simón MO El Carrizal 1	13	239	102
987	UCSF San Simón MO Las Quebradas	13	239	103
988	UCSF Gualococti MO	13	226	104
989	UCSF Delicias de Concepción MO 1	13	223	105
990	UCSF Delicias de Concepción MO El Volcan	13	223	106
991	UCSF Chilanga MO 1	13	222	107
992	UCSF Chilanga MO Las Crucitas	13	222	108
993	UCSF Chilanga MO Piedra Parada	13	222	109
994	UCSF Corinto MO 1	13	221	110
995	UCSF Corinto MO 2	13	221	111
996	UCSF Corinto MO Corralito San Francisco	13	221	112
997	UCSF Corinto MO San Felipe Los Villatoro	13	221	113
998	UCSF Corinto MO La Hermita	13	221	114
999	UCSF Lolotiquillo MO	13	231	115
1000	UCSF Lolotiquillo MO Gualindo	13	231	116
1001	UCSF Cacaopera MO	13	220	117
1002	UCSF Cacaopera MO La Estancia	13	220	118
1003	UCSF Cacaopera MO Agua Blanca	13	220	119
1004	UCSF Cacaopera MO Sunsulaca	13	220	120
1005	UCSF Lislique LU	14	253	121
1006	UCSF Lislique LU Pilas	14	253	122
1007	UCSF Lislique LU El Derrumbado	14	253	123
1008	UCSF Lislique LU Higueras	14	253	124
1009	UCSF Lislique LU Guajiniquil	14	253	125
1010	UCSF San Jose La Fuente LU	14	258	126
1011	UCSF Yayantique LU	14	260	127
1012	UCSF Yayantique LU El Pastor	14	260	128
1013	UCSF Yayantique LU Los Amates	14	260	129
1014	UCSF Nueva Esparta LU	14	254	130
1015	UCSF Nueva esparta LU Monteca	14	254	131
1016	UCSF Nueva Esparta LU Las Marias	14	254	132
1017	UCSF Nueva Esparta LU Honduritas	14	254	133
1018	UCSF Poloros LU	14	256	134
1019	UCSF Poloros LU Boquin	14	256	135
1020	UCSF Poloros LU Carpintero	14	256	136
1021	UCSF Poloros LU Ocote	14	256	137
1022	UCSF El Porvenir SA	2	17	138
1023	UCSF El Porvenir SA El Cerrón	2	17	139
1024	UCSF El Porvenir SA Amate Blanco	2	17	140
1025	UCSF El Porvenir SA San Juan Chiquito	2	17	141
1026	UCSF Masahuat SA	2	18	142
1027	UCSF Masahuat SA La Joya	2	18	143
1028	UCSF Santa Rosa de Guachipilín SA	2	23	144
1029	UCSF Santa Rosa Guachipilín SA  El Despoblado	2	23	145
1030	UCSF Santiago La Frontera SA	2	24	146
1031	UCSF Santiago La Frontera SA Las Piletas	2	24	147
1032	UCSF Santiago La Frontera SA Santa Cruz	2	24	148
1033	UCSF Chalchuapa SA	2	15	149
1034	UCSF Chalchuapa SA Magdalena 1	2	15	150
1035	UCSF Chalchuapa SA Magdalena 2	2	15	151
1036	UCSF Chalchuapa SA San Sebastian	2	15	152
1037	UCSF Chalchuapa SA Galeano	2	15	153
1038	UCSF Chalchuapa SA Zacamil	2	15	154
1039	UCSF Chalchuapa SA Las Flores	2	15	155
1040	UCSF Chalchuapa SA El Paste	2	15	156
1041	UCSF Chalchuapa SA El Coco	2	15	157
1042	UCSF Chalchuapa SA San José	2	15	158
1043	UCSF Chalchuapa SA Las Lomas	2	15	159
1044	UCSF Chalchuapa SA Las Lajas	2	15	160
1045	UCSF Chalchuapa SA Las Cruces	2	15	161
1067	UCSF Ahuachapan AH Un Rancho y un lucero	1	1	162
1050	UCSF San Lorenzo AH Guascota	1	9	163
1052	UCSF Turín AH El Paraiso	1	12	164
1056	UCSF Atiquizaya AH Lomas de Alarcon	1	3	165
1051	UCSF El Refugio AH El Rosario	1	5	166
1095	UCSF San Antonio SM San Marcos	12	211	167
1094	UCSF San Gerardo SM La Laguna	12	212	168
1089	UCSF La Palma CH	4	53	170
869	UCSFE  Jiquilisco US Bajo Lempa Salud Renal	11	183	172
933	UCSFE Ilobasco CA	9	156	185
934	UCSFE Sensuntepeque CA	9	159	186
1049	UCSFE Chalchuapa SA	2	15	187
1070	UCSFE Dulce Nombre de Maria CH	4	49	188
1071	UCSFE Concepción Quezaltepeque CH	4	47	189
1073	UCSF San Jose la Fuente LU El Sombrerito	14	258	191
1080	UCSF San Martín SS Los Letona	6	109	192
1081	UCSF San Martín SS La Flor	6	109	193
1082	UCSF Rosario de Mora SS Palo Grande	6	107	194
1083	UCSF  Panchimalco SS Quezalapa	6	106	195
1084	UCSF  Panchimalco SS Amayon	6	106	196
1085	UCSF El Paisnal SS San Francisco dos Cerros	6	101	197
1086	UCSF Aguilares SS La Florida	6	97	198
1074	UCSFE Perquin MO	13	234	199
1075	UCSFE Corinto MO	13	221	200
1076	UCSFE Semsembra MO	13	240	201
1077	UCSFE Osicala MO	13	233	202
1078	UCSFE Anamoros LU	14	245	203
1079	UCSFE Carolina SM	12	199	204
1087	UCSF Ilobasco CA Hoyos	9	156	205
1090	UCSF Chalatenango CH Guarjila	4	48	206
1091	UCSF Guatajiagua MO Pajigua	13	227	207
1092	UCSF San Antonio SM San Diego	12	211	208
1093	UCSF Corinto MO Corralito Atillo	13	221	209
1096	UCSF Conchagua LU Las Tunas	14	248	210
1097	UCSF Conchagua LU El Pilón	14	248	211
1104	UCSF Teotepeque LL	5	94	212
1105	UCSF Teotepeque LL El Angel	5	94	213
1106	UCSF Teotepeque LL Mizata	5	94	214
1107	UCSF Teotepeque LL Aguacayo 	5	94	215
1108	UCSF Chiltiupán LL	5	79	216
1109	UCSF Chiltiupán LL Termophilas	5	79	217
1110	UCSF Chiltiupán LL Taquillo Ing. Orlando Recinos	5	79	218
1111	UCSF Jicalapa LL La Perla	5	82	219
1112	UCSF Comasagua LL	5	78	220
1113	UCSF Comasagua LL La Shila	5	78	221
1114	UCSF Comasagua LL Los Conacastes	5	78	222
1115	UCSF Comasagua LL El Matazano	5	78	223
1116	UCSF Tamanique LL	5	92	224
1117	UCSF Tamanique LL Buenos Aires	5	92	225
1118	UCSF  Tamanique LL San Alfonso	5	92	226
1119	UCSF Tamanique LL El Palmar	5	92	227
1120	UCSF San Pablo Tacachico LL	5	91	228
1121	UCSF San Pablo Tacachico LL San Isidro	5	91	229
1122	UCSF San Pablo Tacachico LL Atiocoyo	5	91	230
1123	UCSF San Pablo Tacachico LL Obraje Nuevo	5	91	231
1124	UCSF San Pablo Tacachico LL Valle Mesas	5	91	232
1291	UCSFE Puerto La Libertad LL	5	83	233
1292	UCSFE Colón LL Ciudad Mujer	5	77	234
1125	UCSF Azacualpa CH	4	44	235
1126	UCSF San Francisco Lempa CH	4	44	236
1127	UCSF El Rosario CU 	7	119	237
1128	UCSF Paraiso de Osorio LP	8	137	238
1129	UCSF Santa Cruz Analquito CU	7	128	239
1130	UCSF San Emigdio LP	8	139	240
1131	UCSF  San Cristobal CU	7	123	241
1132	UCSF San Cristobal CU Santa Anita	7	123	242
1133	UCSF San Cristobal CU La Virgen	7	123	243
1134	UCSF Monte San Juan CU	7	120	244
1135	UCSF Monte San Juan CU San Nicolas	7	120	245
1136	UCSF Monte San Juan CU Soledad	7	120	246
1137	UCSF Tenancingo CU	7	131	247
1138	UCSF Tenancingo CU Corral Viejo	7	131	248
1139	UCSF Tenancingo CU Rosario Tablon	7	131	249
1140	UCSF San Jose Guayabal CU Llano Grande	7	124	250
1141	UCSF San Rafael Cedros CU Soledad	7	126	251
1293	UCSFE San Pedro perulapan CU	7	125	252
1142	UCSF San Pedro Perulapan CU La Esperanza	7	125	253
1143	UCSF San Pedro Perulapan CU San Francisco	7	125	254
1144	UCSF El Carmen CU San Antonio	7	118	255
1145	UCSF Santa Cruz Michapa CU Buena Vista	7	129	256
1147	UCSF Suchitoto CU Palo Grande	7	130	258
1148	UCSF Apastepeque SV	10	163	259
1149	UCSF Apastepeque SV Calderas	10	163	260
1150	UCSF  Apastepeque SV Las Minas	10	163	261
1151	UCSF Apastepeque SV San Felipe	10	163	262
1152	UCSF Apastepeque SV San Jacinto	10	163	263
1153	UCSF Apastepeque SV San Nicolas	10	163	264
1154	UCSF Apastepeque SV San Pedro	10	163	265
1294	UCSFE Verapaz SV	10	175	266
1155	UCSF Verapaz SV 	10	175	267
1156	UCSF Verapaz SV El Carmen	10	175	268
1157	UCSF Verapaz SV San Isidro	10	175	269
1158	UCSF Santa Clara SV	10	166	270
1159	UCSF Santa Clara SV Santa Rosa	10	166	271
1160	UCSF San Ildefonso SV	10	169	272
1161	UCSF San Ildefonso SV Guachipilín	10	169	273
1162	UCSF San Ildefonso SV San Lorenzo	10	169	274
1163	UCSF San Esteban Catarina SV	10	168	275
1164	UCSF San Esteban Catarina SV San Jacinto la Burrera	10	168	276
1165	UCSF San Lorenzo SV	10	170	277
1166	UCSF San Lorenzo SV Santa Lucia	10	170	278
1167	UCSF Santa Maria Ostuma LP	8	149	279
1168	UCSF Santa María Ostuma LP El Carrizal	8	149	280
1169	UCSF Santa María Ostuma LP El Chaperno	8	149	281
1170	UCSF San Pedro Nonualco LP	8	147	282
1171	UCSF San Pedro Nonualco LP San Juan Nuhuistepeque	8	147	283
1172	UCSF San Pedro Nonualco LP San Ramón	8	147	284
1173	UCSF San Juan Tepezontes LP	8	143	285
1174	UCSF San Miguel Tepezontes LP	8	145	286
1175	UCSF San Miguel Tepezontes LP Soledad Las Flores	8	145	287
1176	UCSF San Antonio Masahuat LP	8	146	288
1177	UCSF San Antonio Masahuat LP La Loma	8	138	289
1178	UCSF Tapalhuaca LP	8	151	290
1295	UCSFE Olocuilta LP	8	136	291
1179	UCSF Ciudad Barrios SM	12	200	292
1180	UCSF Ciudad Barrios SM Guanaste	12	200	293
1181	UCSF Ciudad Barrios SM El Porvenir	12	200	294
1182	UCSF Ciudad Barrios SM San Matias	12	199	295
1183	UCSF Ciudad Barrios SM San Cristobal	12	200	296
1184	UCSF Ciudad Barrios SM Llano el Angel	12	200	297
1185	UCSF Sesori SM El Tablon	12	217	298
1186	UCSF Sesori SM San Sebastían	12	217	299
1187	UCSF Sesori SM Managuara	12	217	300
1188	UCSF Sesori SM	12	217	301
1189	UCSF Chapeltique SM La Trinidad (El Rodeo)	12	202	302
1296	UCSFE Sesori SM	12	217	303
1190	UCSF Nueva Granada US	11	187	304
1191	UCSF Nueva Granada US Nuevo Gualcho	11	187	305
1192	UCSF Estanzuelas US	11	182	306
1193	UCSF Estanzuelas US Escarbadero	11	182	307
1194	UCSF Estanzuelas US la Cruz	11	182	308
1195	UCSF Mercedes Umaña US	11	186	309
1196	UCSF Mercedes Umaña US La Puerta	11	186	310
1197	UCSF Mercedes Umaña US Santa Anita	11	186	311
1198	UCSF Mercedes Umaña US Los Horcones	11	186	312
1297	UCSFE Berlín US	11	177	313
1199	UCSF Berlin US 1	11	177	314
1200	UCSF Berlin US 2	11	177	315
1201	UCSF Berlin US San José	11	177	316
1202	UCSF Berlin US Talpetate	11	177	317
1203	UCSF Berlin US Virginia	11	177	318
1204	UCSF Berlin US San Isidro	11	177	319
1205	UCSF Alegria US	11	176	320
1206	UCSF Alegría US Las Casitas	11	176	321
1207	UCSF Alegria US El Quebracho	11	176	322
1208	UCSF Alegría US El Zapotillo	11	176	323
1209	UCSF Tecapan US	11	197	324
1210	UCSF Tecapan US Gualache	11	197	325
1211	UCSF Tecapan US Chapetones	11	197	326
1212	UCSF Ozatlan US	11	188	327
1213	UCSF Ozatlan US Las Trancas	11	188	328
1214	UCSF Ozatlan US La Poza	11	188	329
1215	UCSF Ozatlan US La Breña	11	188	330
1216	UCSF San Agustín US	11	190	331
1217	UCSF San Agustín US El Eucalipto	11	190	332
1218	UCSF San Agustín US El Caulotal	11	190	333
1219	UCSF San Francisco Javier US	11	194	334
1220	UCSF San Francisco Javier US Los Hornos	11	194	335
1221	UCSF San Francisco Javier US La Cruz	11	194	336
1222	UCSF Santa Elena US	11	193	337
1223	UCSF Santa Elena US El Nanzal 1	11	193	338
1224	UCSF Santa Elena US El Volcan	11	193	339
1225	UCSF Santa Elena US Joya Ancha Arriba	11	193	340
1226	UCSF Santa Elena US Amate Norte	11	193	341
1227	UCSF San Jorge SM	12	213	342
1228	UCSF San Jorge SM San Julian	12	213	343
1229	UCSF San Jorge US Joya de Ventura	12	213	344
1230	UCSF Jucuaran US	11	185	345
1231	UCSF Jucuaran US El Jutal	11	185	346
1232	UCSF Jucuaran US El Espino	11	185	347
1233	UCSF Jucuaran US El Zapote	11	185	348
1298	UCSFE Concepción Batres US	11	179	349
1234	UCSF Concepción Batres US 	11	179	350
1235	UCSF Concepción Batres US San Felipe	11	179	351
1236	UCSF Concepción Batres US Hacienda Nueva	11	179	352
1237	UCSF Concepción Batres US El Cañal	11	179	353
1238	UCSF Puerto el Triunfo US La Palmera	11	189	354
1239	UCSF Ereguayquin US Analco	11	181	355
1299	UCSFE Guaymango AH	1	6	356
1240	UCSF Guaymango AH	1	6	357
1241	UCSF Guaymango AH Platanares	1	6	358
1242	UCSF Guaymango AH El Escalón	1	6	359
1243	UCSF Guaymango AH Morro Grande	1	6	360
1244	UCSF Guaymango AH San Martín	1	6	361
1245	UCSF Guaymango AH Cauta Arriba	1	6	362
1246	UCSF Jujutla AH	1	7	363
1247	UCSF Jujutla AH Tihuicha	1	7	364
1248	UCSF Jujutla AH Barra de Santiago	1	7	365
1249	UCSF Jujutla AH Falla	1	7	366
1250	UCSF Jujutla AH Guayapa Abajo	1	7	367
1251	UCSF Jujutla AH Santa Rosa Guayapa	1	7	368
1252	UCSF Jujutla AH San José El Naranjo	1	7	369
1253	UCSF Jujutla AH San Antonio	1	7	370
1254	UCSF San Pedro Puxtla AH Los Aguirre	1	10	371
1255	UCSF San Pedro Puxtla AH Los Chacón	1	10	372
1256	UCSF San Pedro Puxtla AH 	1	10	373
1300	UCSFE Tacuba AH	1	11	374
1257	UCSF  Tacuba AH	1	11	375
1258	UCSF Tacuba AH San Rafael	1	11	376
1259	UCSF Tacuba AH Las Palmeras	1	11	377
1260	UCSF Tacuba AH Chaguite	1	11	378
1261	UCSF Tacuba AH El Jicaro	1	11	379
1262	UCSF Tacuba AH El Sincuyo	1	11	380
1263	UCSF Tacuba AH La Magdalena	1	11	381
1264	UCSF Tacuba AH Pandiadura	1	11	382
1265	UCSF Tacuba AH Valle la Puerta	1	11	383
1266	UCSF Tacuba AH La Escuela de El Rodeo	1	11	384
1267	UCSF Ahuachapan AH Ashapuco	1	1	385
1268	UCSF Ahuachapan AH El Barro	1	1	386
1269	UCSF Ahuachapan AH Llano la Laguna	1	1	387
1270	UCSF Apaneca AH Quezalapa	1	2	388
1271	UCSF Caluco SO Plan de Amayo	3	28	389
1272	UCSF Caluco SO El Zapote	3	28	390
1273	UCSF Caluco SO 	3	28	391
1274	UCSF Cuisnahuat SO Agua Shuca	3	29	392
1275	UCSF Cuisnahuat SO Coquiama	3	29	393
1276	UCSF Cuisnahuat SO San Lucas	3	29	394
1277	UCSF Cuisnahuat SO	3	29	395
1278	UCSF Santa Catarina Masahuat SO El Guayabo	3	38	396
1279	UCSF Santa Catarina Masahuat SO Tres Caminos	3	38	397
1280	UCSF Santa Catarina Mashuat SO	3	38	398
1281	UCSF Santa Isabel Ishuatan SO	3	30	399
1282	UCSF Santa Isabel Ishuatan SO Las Piedras	3	30	400
1283	UCSF Santa Isabel Ishuatan SO Acachapa	3	30	401
1284	UCSF Santo Domingo de Guzman SO El Carrizal	3	39	402
1285	UCSF Santo Domingo de Guzman SO	3	39	403
1301	UCSFE Izalco	3	31	404
1302	UCSFE Sonzacate SO	3	41	405
1286	UCSF Coatepeque Las Piletas	2	14	406
1287	UCSF Coatepeque SA Conacaste	2	14	407
1303	UCSFE San Matín SS	6	109	408
1288	UCSF San Martín SS Santa Gertrudis	6	109	409
1304	UCSFE San Salvador SS San Jacinto	6	110	410
1289	UCSF San Salvador SS Comunidad Modelo 3	6	110	411
1290	UCSF San Salvador SS San Cristobal	6	110	412
1305	UCSF Candelaria CU (ECOSF parcial)	7	116	413
1306	UCSF Candelaria CU El Rosario (ECOSF parcial)	7	116	414
1307	UCSF Candlaria CU Concepción  (ECOSF parcial)	7	116	415
1308	UCSF Candelaria CU Miraflores Arriba  (ECOSF parcial)	7	116	416
1309	UCSF San Ramon CU  (ECOSF parcial)	7	127	417
1310	UCSF San Ramón CU Santa Isabel  (ECOSF parcial)	7	127	418
1311	UCSF San José Guayabal CU (ECOSF parcial)	7	124	419
1312	UCSF San José Guayabal CU La Cruz  (ECOSF parcial)	7	124	420
1313	UCSF San José Guayabal CU Animas  (ECOSF parcial)	7	124	421
1314	UCSF San Rafael Cedros CU  (ECOSF parcial)	7	126	422
1315	UCSF San Rafael Cedros CU Cerro Colorado  (ECOSF parcial)	7	126	423
1316	UCSF San Rafael Cedros CU Jiboa  (ECOSF parcial)	7	126	424
1317	UCSF San Rafael Cedros CU Palacios  (ECOSF parcial)	7	126	425
1318	UCSF El Carmen CU  (ECOSF parcial)	7	118	426
1319	UCSF El Carmen CU San Sebastian  (ECOSF parcial)	7	118	427
1320	UCSF El Carmen CU Santa Lucía  (ECOSF parcial)	7	118	428
1321	UCSF El Carmen CU Candelaria   (ECOSF parcial)	7	118	429
1322	UCSF Oratorio Concepción CU  (ECOSF parcial)	7	121	430
1323	UCSF Zacatecoluca LP Santa Lucía  (ECOSF parcial)	8	152	431
1324	UCSF Santiago Nonualco LP San José Abajo  (ECOSF parcial)	8	150	432
1325	UCSF San Luis la Herradura LP El Zapote  (ECOSF parcial)	8	153	433
1326	UCSF San Pedro Masahuat LP El Achiotal  (ECOSF parcial)	8	146	434
1327	UCSF San Pedro Masahuat LP Las Marías  (ECOSF parcial)	8	146	435
1328	UCSF San Luis Talpa LP El Pimental  (ECOSF parcial)	8	144	436
1329	UCSF San Juan Talpa  LP (ECOSF parcial)	8	142	437
1330	UCSF San Juan Talpa LP Veracruz   (ECOSF parcial)	8	142	438
1371	UCSF San Salvador SS Comunidad Nicaragua 2	6	110	439
1331	UCSF Rosario La Paz LP El Nao Amatepe   (ECOSF parcial)	8	133	440
1332	UCSF Cuyultitan LP  (ECOSF parcial)	8	132	441
1333	UCSF Cuyultitan LP San Antonio   (ECOSF parcial)	8	132	442
1334	UCSF Olocuilta  LP San Sebastían   (ECOSF parcial)	8	136	443
1335	UCSF  San Francisco Chinameca LP  San José La Montaña  (ECOSF parcial)	8	140	444
1336	UCSF San Francisco Chinameca  LP Candelaria   (ECOSF parcial)	8	140	445
1338	UCSF San Francisco Chinameca LP	8	140	446
1337	UCSF Santiago Nonualco LP San José La Paz  (ECOSF parcial)	8	150	447
1339	UCSF Santiago Nonualco LP San Sebastían Arriba  (ECOSF parcial)	8	150	448
1340	UCSF San Luis Talpa LP Hacienda Amatepe   (ECOSF parcial)	8	144	449
1341	UCSF Zacatecoluca LP San Faustino     (ECOSF parcial)	8	152	450
1342	UCSF Zacatecoluca LP Azacualpa   (ECOSF parcial)	8	152	451
1343	UCSF Olocuilta LP Santa Lucía Orcoyo   (ECOSF parcial)	8	136	452
1344	UCSF San Rafael Obrajuelo LP La Palma   (ECOSF parcial)	8	148	453
1345	UCSF San Rafael Obrajuelo LP San Pedro Martir    (ECOSF parcial)	8	148	454
1346	UCSF Sensuntepeque CA San Gregoria (ECOSF parcial)	9	159	455
1347	UCSF Sensuntepeque  CA San Lorenzo  (ECOSF parcial)	9	159	456
1348	UCSF Sensuntepeque CA Chunte   (ECOSF parcial)	9	159	457
1349	UCSF Sensuntepeque  CA Rio Grande   (ECOSF parcial)	9	159	458
1350	UCSF  Sensuntepeque CA Cuyantepeque  (ECOSF parcial)	9	159	459
1351	UCSF Sensuntepeque CA Copinolapa  (ECOSF parcial)	9	159	460
1352	UCSF Sensuntepeque CA San Nicolas  (ECOSF parcial)	9	159	461
1353	UCSF Guacotecti CA (ECOSF parcial)	9	155	462
1354	UCSF Guacotecti CA Agua Zarca  (ECOSF parcial)	9	155	463
1355	UCSF San Isidro CA  (ECOSF parcial)	9	158	464
1356	UCSF San Isidro CA Potrero de Batres   (ECOSF parcial)	9	158	465
1357	UCSF San Isidro CA San Francisco  (ECOSF parcial)	9	158	466
1358	UCSF San Cayetano Istepeque SV  (ECOSF parcial)	10	165	467
1359	UCSF San Cayetano Istepeque SV Candelaria (ECOSF parcial)	10	165	468
1360	UCSF Tepetitan SV (ECOSF parcial)	10	174	469
1361	UCSF Jerusalen LP  (ECOSF parcial)	8	134	470
1362	UCSF Mercedes la Ceiba  LP (ECOSF parcial)	8	135	471
1363	UCSF Tecoluca  SV San Carlos Lempa  (ECOSF parcial)	10	173	472
1364	UCSF Tecoluca SV Puerto Nuevo  (ECOSF parcial)	10	173	473
1365	UCSF Tecoluca SV San Nicolas Lempa   (ECOSF parcial)	10	173	474
1366	UCSF Tecoluca SV El Carao  (ECOSF parcial)	10	173	475
1367	UCSF Tecoluca SV Santa Cruz Paraiso  (ECOSF parcial)	10	173	476
1368	UCSF San Vicente SV Guajoyo   (ECOSF parcial)	10	172	477
1369	UCSF  San Vicente SV El Rebelde  (ECOSF parcial)	10	172	478
1370	UCSF San Sebastián SV  La Esperanza  (ECOSF parcial)	10	171	479
1373	UCSF San Luis la Herradura LP Los Blancos (ECOSF parcial)	8	153	480
1374	UCSF San Juan Talpa LP  Comalapa (ECOSF parcial)	8	142	481
1375	UCSF Ilobasco CA 	9	156	482
1377	UCSF San Pedro Masahuat  LP Astoria (UCSF parcial)	8	146	483
1383	UCSF San Sebastián Salitrillo SA  Santa Rosa	2	21	484
1384	UCSF Zacatecoluca LP Escuintla	8	152	485
1385	UCSF San Salvador SS La Fosa	6	110	486
1386	UCSF San Salvador SS Saavedra	6	110	487
1387	UCSF San Salvador SS Rosales	6	110	488
1388	UCSF Acajutla SO Villa Centenario	3	26	489
1389	UCSF Acajutla SO Costa Azul	3	26	490
1390	UCSF Sonsonate SO El Cacao	3	40	491
1391	UCSF Sonsonate SO El Presidio	3	40	492
1392	las marias	3	31	493
1393	UCSF Izalco SO Chorro Arriba	3	31	494
1394	UCSF Izalco SO Las Lajas	3	31	495
1395	UCSF Izalco SO Las Marías	3	31	496
1396	UCSF Izalco SO Cuyagualo	3	40	497
1397	UCSF Nahuizalco SO El Carrizal	3	33	498
1398	UCSF Nahuizalco SO Tajcuilujlan	3	33	499
1400	UCSF Tejutla CH 	4	74	500
1401	UCSF Tejutla CH Los Hernandez	4	74	501
1402	UCSF Tejutla CH Agua Escondido	4	74	502
1403	UCSF Tejutla CH El Salitre	4	74	503
1404	UCSF Tejutla CH El Coyolito	4	74	504
1405	UCSF Colón LL 	5	77	505
1406	UCSF Colón LL El Pital	5	77	506
1407	UCSF Quezaltepeque LL San Jacinto	5	86	507
1408	UCSF Quezaltepeque LL Santa Emilia	5	86	508
1411	UCSF Suchitoto CU	7	130	509
1412	UCSF Mejicanos SS Las nubes	6	104	510
1413	UCSF Mejicanos SS San Roque	6	104	511
1414	UCSF San Salvador SS Las Lajas	6	110	512
1415	UCSF San Salvador SS Coro Quiñones	6	110	513
1416	UCSF Mejicanos SS Cristo Redentor	6	104	514
1417	UCSF San Salvador SS La Naval	6	110	515
1418	UCSF San Salvador SS Mano de León	6	110	516
1419	UCSF San Salvador SS Las Brisas	6	110	517
1420	UCSF Panchimalco SS San Isidro	6	106	518
1421	UCSF Panchimalco SS Cnt El Cedro	6	106	519
1422	UCSF San Sanlvador SS Cmnd Miraflores	6	110	520
1423	UCSF San Sanlvador SS Cmnd Las Esmeraldas	6	110	521
1424	UCSF San Marcos SS Cmnd Linda Vista	6	108	522
1425	UCSF San Marcos SS Cmnd El Transito	6	108	523
1426	UCSF Nejapa SS El Llano	6	105	524
1427	UCSF El Paisnal SS Cmnd Rutilio Grande	6	101	525
1428	UCSF San Martin SS Cmnd Santa Fe	6	109	526
1429	UCSF San Martin SS Cnt El Rosario	6	109	527
\.


--
-- Data for Name: cat_establecimiento; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY cat_establecimiento (id_establecimiento, etz, sib, subred, nomsibasi, reg, dep, mun, idmun, tip, udep, umun, idtipoestablecimiento, tipo, descripcion, funchona, establec, codloc, lat, lng, tipoexpediente) FROM stdin;
1	0	29	145	SIBASI CERN ROSALES	5	6	1	110	H	6	01	H	1	HOSPITAL ROSALES SAN SALVADOR	S	50601H	0601	13.7006	-89.205600000000004	G
2	0	29	145	SIBASI CERN BLOOM	5	6	2	110	H	6	01	H	1	HOSPITAL BENJAMIN BLOOM SAN SALVADOR	S	50602H	0601	13.7141	-89.204099999999997	G
3	0	29	145	SIBASI CERN MATERNIDAD	5	6	3	110	H	6	01	H	1	HOSPITAL DR.ARGUELLO ESCOLAN MATERNIDAD	S	50603H	0601	13.700699999999999	-89.204599999999999	G
4	1	1	12	SIBASI AHUACHAPAN	1	1	1	6	D	1	07	D	6	CASA DE SALUD SAN MARTIN (GUAYMANGO)	S	10101D	0107	\N	\N	G
5	1	1	117	SIBASI AHUACHAPAN	1	1	1	1	H	1	01	H	1	HOSPITAL FRANCISCO MENENDEZ AHUACHAPAN	S	10101H	0101	13.928699999999999	-89.846500000000006	G
6	1	1	10	SIBASI AHUACHAPAN	1	1	1	8	N	1	02	N	7	CRN EL ZAPOTE	S	10101N	0102	\N	\N	G
7	1	1	10	SIBASI AHUACHAPAN	1	1	1	1	U	1	01	U	3	U.de S. AHUACHAPAN	S	10101U	0101	\N	\N	G
8	1	1	1	SIBASI AHUACHAPAN	1	1	2	8	D	1	02	D	6	CASA DE SALUD SAN BENITO(SN.FCO.MENEND)	S	10102D	0102	\N	\N	G
9	1	1	10	SIBASI AHUACHAPAN	1	1	2	2	U	1	05	U	3	U.de S. APANECA	S	10102U	0105	\N	\N	G
10	1	1	10	SIBASI AHUACHAPAN	1	1	3	1	D	1	01	D	6	CASA DE SALUD CANTON RIO FRIO	S	10103D	0101	\N	\N	G
11	1	1	11	SIBASI AHUACHAPAN	1	1	3	3	U	1	09	U	3	U.de S. ATIQUIZAYA	S	10103U	0109	\N	\N	G
12	1	1	10	SIBASI AHUACHAPAN	1	1	4	1	D	1	01	D	6	CASA DE SALUD CANTON EL TIGRE (AHUACH.)	S	10104D	0101	\N	\N	G
13	1	1	1	SIBASI AHUACHAPAN	1	1	4	8	U	1	02	U	3	U.de S. CARA SUCIA	S	10104U	0102	\N	\N	G
14	1	1	10	SIBASI AHUACHAPAN	1	1	5	11	D	1	04	D	6	CASA DE SALUD CANTON CHAGUITE (TACUBA)	S	10105D	0104	\N	\N	G
15	1	1	10	SIBASI AHUACHAPAN	1	1	5	4	U	1	03	U	3	U.de S. ATACO	S	10105U	0103	\N	\N	G
16	1	1	10	SIBASI AHUACHAPAN	1	1	6	11	U	1	04	U	3	U.de S. TACUBA	S	10106U	0104	\N	\N	G
17	1	1	1	SIBASI AHUACHAPAN	1	1	7	8	U	1	02	U	3	U.de S. LA HACHADURA	S	10107U	0102	\N	\N	G
18	1	1	12	SIBASI AHUACHAPAN	1	1	8	6	U	1	07	U	3	U.de S. GUAYMANGO	S	10108U	0107	\N	\N	G
19	1	1	12	SIBASI AHUACHAPAN	1	1	9	7	U	1	08	U	3	U.de S. JUJUTLA	S	10109U	0108	\N	\N	G
20	1	1	12	SIBASI AHUACHAPAN	1	1	10	7	U	1	08	U	3	U.de S. SAN JOSE EL NARANJO (JUJUTLA)	S	10110U	0108	\N	\N	G
21	1	1	10	SIBASI AHUACHAPAN	1	1	11	1	U	1	01	U	3	U.de S. LAS CHINAMAS	S	10111U	0101	\N	\N	G
22	1	1	12	SIBASI AHUACHAPAN	1	1	12	7	U	1	08	U	3	U.de S. GUAYAPA ABAJO	S	10112U	0108	\N	\N	G
23	1	1	12	SIBASI AHUACHAPAN	1	1	13	10	U	1	06	U	3	U.de S. SAN PEDRO PUXTLA	S	10113U	0106	\N	\N	G
24	1	1	11	SIBASI AHUACHAPAN	1	1	14	9	U	1	11	U	3	U.de S. SAN LORENZO(AHUACHAPAN)	S	10114U	0111	\N	\N	G
25	1	1	11	SIBASI AHUACHAPAN	1	1	15	12	U	1	10	U	3	U.de S. TURIN	S	10115U	0110	\N	\N	G
26	1	1	11	SIBASI AHUACHAPAN	1	1	16	5	U	1	12	U	3	U.de S. EL REFUGIO	S	10116U	0112	\N	\N	G
27	1	1	1	SIBASI AHUACHAPAN	1	1	17	8	U	1	02	U	3	U.de S. SAN FRANCISCO MENENDEZ	S	10117U	0102	\N	\N	G
28	1	1	12	SIBASI AHUACHAPAN	1	1	18	7	U	1	08	U	3	U.de S. BARRA DE SANTIAGO	S	10118U	0108	\N	\N	G
29	1	1	1	SIBASI AHUACHAPAN	1	1	19	8	U	1	02	U	3	U.de S. EL ZAPOTE (SAN FCO.MENENDEZ)	S	10119U	0102	\N	\N	G
30	1	1	1	SIBASI AHUACHAPAN	1	1	20	8	U	1	02	U	3	U.de S. GARITA PALMERA	S	10120U	0102	\N	\N	G
31	1	1	1	SIBASI AHUACHAPAN	1	1	21	8	U	1	02	U	3	U.de S. ING.JAVIER ESTRADA	S	10121U	0102	\N	\N	G
32	1	2	136	SIBASI SANTA ANA	1	2	1	22	H	2	01	H	1	HOSPITAL SAN JUAN DE DIOS SANTA ANA	S	10201H	0201	13.9916	-89.551199999999994	G
33	1	2	13	SIBASI SANTA ANA	1	2	1	22	N	2	01	N	7	CRN PRIMAVERA (STA.ANA)	S	10201N	0201	\N	\N	G
34	1	2	13	SIBASI SANTA ANA	1	2	1	22	U	2	01	U	3	U.de S. DR.TOMAS PINEDA MARTINEZ	S	10201U	0201	\N	\N	G
35	1	2	13	SIBASI SANTA ANA	1	2	2	22	U	2	01	U	3	U.de S. CASA DEL NIÑO	S	10202U	0201	\N	\N	G
36	1	2	13	SIBASI SANTA ANA	1	2	3	22	U	2	01	U	3	U.de S. EL PALMAR	S	10203U	0201	\N	\N	G
37	1	2	13	SIBASI SANTA ANA	1	2	4	22	U	2	01	U	3	U.de S. SANTA LUCIA (SANTA ANA)	S	10204U	0201	\N	\N	G
38	1	2	14	SIBASI SANTA ANA	1	2	5	22	U	2	01	U	3	U.de S. SAN MIGUELITO	S	10205U	0201	\N	\N	G
39	1	2	14	SIBASI SANTA ANA	1	2	6	22	U	2	01	U	3	U.de S. SAN RAFAEL (SANTA ANA)	S	10206U	0201	\N	\N	G
40	1	2	14	SIBASI SANTA ANA	1	2	7	22	U	2	01	U	3	U.de S. SANTA BARBARA	S	10207U	0201	\N	\N	G
41	1	2	13	SIBASI SANTA ANA	1	2	8	22	D	2	01	D	6	CASA DE SALUD LOS APOYOS	S	10208D	0201	\N	\N	G
42	1	2	16	SIBASI SANTA ANA	1	2	8	14	U	2	03	U	3	U.de S. COATEPEQUE	S	10208U	0203	\N	\N	G
43	1	2	13	SIBASI SANTA ANA	1	2	9	13	D	2	01	D	6	CASA DE SALUD LOS RIVAS	S	10209D	0201	\N	\N	G
44	1	2	15	SIBASI SANTA ANA	1	2	9	25	U	2	04	U	3	U.de S. TEXISTEPEQUE	S	10209U	0204	\N	\N	G
45	1	2	16	SIBASI SANTA ANA	1	2	10	16	U	2	02	U	3	U.de S. EL CONGO	S	10210U	0202	\N	\N	G
46	1	2	17	SIBASI SANTA ANA	1	2	11	13	U	2	06	U	3	U.de S. CANDELARIA DE LA FRONTERA	S	10211U	0206	\N	\N	G
47	1	2	15	SIBASI SANTA ANA	1	2	13	25	U	2	04	U	3	U.de S. GUARNECIA	S	10213U	0204	\N	\N	G
48	1	2	16	SIBASI SANTA ANA	1	2	14	22	U	2	01	U	3	U.de S. PLANES DE LA LAGUNA	S	10214U	0201	\N	\N	G
49	1	2	14	SIBASI SANTA ANA	1	2	15	22	U	2	01	U	3	U.de S.  NATIVIDAD	S	10215U	0201	\N	\N	G
50	1	2	13	SIBASI SANTA ANA	1	2	17	22	D	2	01	D	6	CASA DE SALUD EL PINALON	S	10217D	0201	\N	\N	G
51	1	2	13	SIBASI SANTA ANA	1	2	19	22	D	2	02	D	6	CASA DE SALUD LOMAS DE SAN MARCELINO	S	10219D	0201	\N	\N	G
52	1	2	16	SIBASI SANTA ANA	1	2	20	14	D	2	03	D	6	CASA DE SALUD PILETAS (COATEPEQUE)	S	10220D	0203	\N	\N	G
637	2	17	63	\N	\N	\N	\N	185	\N	11	\N	D	\N	CASA DE SALUD MAJAGUE	\N	\N	\N	\N	\N	G
53	1	2	17	SIBASI SANTA ANA	1	2	22	13	U	2	06	U	3	U.de S. LA PARADA ALDEA BOLAÑOS	S	10222U	0206	\N	\N	G
54	1	2	16	SIBASI SANTA ANA	1	2	23	14	U	2	03	U	3	U.de S. SAN JACINTO(COATEPEQUE)	S	10223U	0203	\N	\N	G
55	1	2	17	SIBASI SANTA ANA	1	2	25	24	U	2	10	U	3	U.de S. SANTIAGO DE LA FRONTERA	S	10225U	0210	\N	\N	G
56	1	2	17	SIBASI SANTA ANA	1	2	26	20	U	2	13	U	3	U.de S. SAN ANTONIO PAJONAL	S	10226U	0213	\N	\N	G
57	1	2	16	SIBASI SANTA ANA	1	2	27	14	U	2	03	U	3	U.de S. EL TINTERAL	S	10227U	0203	\N	\N	G
58	1	2	15	SIBASI SANTA ANA	1	2	28	25	U	2	04	U	3	U.de S. SAN MIGUEL TEXISTEPEQUE	S	10228U	0204	\N	\N	G
59	1	2	17	SIBASI SANTA ANA	1	2	30	15	U	2	05	U	3	U.de S. SABANETAS EL PASTE	S	10230U	0205	\N	\N	G
60	1	2	17	SIBASI SANTA ANA	1	2	21	13	D	2	06	D	6	CASA DE SALUD SAN VICENTE(CAND.LA FRONT	S	10221D	0203	\N	\N	G
61	1	2	16	SIBASI SANTA ANA	1	2	22	16	D	2	02	D	6	CASA DE SALUD SAN J.LAS FLORES,EL CONGO	S	10222D	0102	\N	\N	G
62	1	2	13	SIBASI SANTA ANA	1	2	3	13	N	2	01	N	7	CRN SAN MIGUEL	S	10203N	0201	\N	\N	G
63	1	2	13	SIBASI METAPAN	1	2	2	19	H	2	09	H	1	HOSPITAL NACIONAL METAPAN	S	10202H	0209	14.3248	-89.443299999999994	G
64	1	2	13	SIBASI METAPAN	1	2	10	19	D	2	09	D	6	CASA DE SALUD MONTENEGRO	S	10210D	0209	\N	\N	G
65	1	2	13	SIBASI METAPAN	1	2	12	23	U	2	12	U	3	U.de S. SANTA ROSA GUACHIPILIN	S	10212U	0212	\N	\N	G
66	1	2	13	SIBASI METAPAN	1	2	18	19	U	2	09	U	3	U.de S. SAN JUAN LAS MINAS (METAPAN)	S	10218U	0209	\N	\N	G
67	1	2	13	SIBASI METAPAN	1	2	19	18	U	2	11	U	3	U.de S. MASAHUAT (SANTA ANA)	S	10219U	0211	\N	\N	G
68	1	2	13	SIBASI METAPAN	1	2	20	19	U	2	09	U	3	U.de S. SAN JERONIMO (METAPAN)	S	10220U	0209	\N	\N	G
69	1	2	13	SIBASI METAPAN	1	2	21	19	U	2	09	U	3	U.de S. BELEN GUIJATH (METAPAN)	S	10221U	0209	\N	\N	G
70	1	2	13	SIBASI METAPAN	1	2	24	19	U	2	09	U	3	U.de S. SAN JOSE INGENIO(METAPAN)	S	10224U	0209	\N	\N	G
71	1	2	13	SIBASI CHALCHUAPA	1	2	2	15	N	2	05	N	7	CRN CRISTOBAL, LA MAGDALENA	S	10202N	0205	\N	\N	G
72	1	2	13	SIBASI CHALCHUAPA	1	2	3	15	H	2	05	H	1	HOSPITAL NACIONAL CHALCHUAPA	S	10203H	0205	\N	\N	G
73	1	2	13	SIBASI CHALCHUAPA	1	2	16	17	U	2	08	U	3	U.de S. EL PORVENIR	S	10216U	0208	\N	\N	G
74	1	2	13	SIBASI CHALCHUAPA	1	2	17	21	U	2	07	U	3	U.de S. SAN SEBASTIAN SALITRILLO	S	10217U	0207	\N	\N	G
75	1	2	13	SIBASI CHALCHUAPA	1	2	29	15	U	2	05	U	3	U.de S. EL COCO	S	10229U	0205	\N	\N	G
76	1	2	13	SIBASI CHALCHUAPA	1	2	31	15	U	2	05	U	3	U.de S. CHALCHUAPA	S	10231U	0205	\N	\N	G
77	1	5	19	SIBASI SONSONATE	1	3	1	31	D	3	08	D	6	CASA DE SALUD PIEDRAS PACHAS	S	10301D	0308	\N	\N	G
78	1	5	137	SIBASI SONSONATE	1	3	1	40	H	3	01	H	1	HOSPITAL DR.JORGE MAZZINI VILLACORTA SONSON.	S	10301H	0301	13.7226	-89.729399999999998	G
79	1	5	19	SIBASI SONSONATE	1	3	1	31	U	3	08	U	3	U.de S. IZALCO	S	10301U	0308	\N	\N	G
80	1	5	19	SIBASI SONSONATE	1	3	2	31	D	3	08	D	6	CASA DE SALUD CANTON CUYAGUALO (IZALCO)	S	10302D	0308	\N	\N	G
81	1	5	19	SIBASI SONSONATE	1	3	2	31	N	3	08	N	7	CRN LAS LAJAS	S	10302N	0308	\N	\N	G
82	1	5	18	SIBASI SONSONATE	1	3	2	33	U	3	02	U	3	U.de S. NAHUIZALCO	S	10302U	0302	\N	\N	G
83	1	5	19	SIBASI SONSONATE	1	3	3	31	D	3	08	D	6	CASA DE SALUD CANTON TALCOMUNCA	S	10303D	0308	\N	\N	G
84	1	5	19	SIBASI SONSONATE	1	3	3	37	N	3	10	N	7	CRN LOS LAGARTOS	S	10303N	0310	\N	\N	G
85	1	5	19	SIBASI SONSONATE	1	3	3	27	U	3	09	U	3	U.de S. ARMENIA	S	10303U	0309	\N	\N	G
86	1	5	19	SIBASI SONSONATE	1	3	4	29	D	3	12	D	6	CASA DE SALUD CANTON SAN LUCAS,CUISNA	S	10304D	0312	\N	\N	G
87	1	5	18	SIBASI SONSONATE	1	3	4	32	N	3	14	N	7	CRN SAN JUAN DE DIOS	S	10304N	0314	\N	\N	G
88	1	5	19	SIBASI SONSONATE	1	3	4	37	U	3	10	U	3	U.de S. SAN JULIAN	S	10304U	0310	\N	\N	G
89	1	5	18	SIBASI SONSONATE	1	3	5	32	D	3	14	D	6	CASA DE SALUD CTON.SN JUAN DE DIOS JUAY	S	10305D	0314	\N	\N	G
90	1	5	20	SIBASI SONSONATE	1	3	5	26	U	3	07	U	3	U.de S.  ACAJUTLA	S	10305U	0307	\N	\N	G
91	1	5	18	SIBASI SONSONATE	1	3	6	32	U	3	14	U	3	U.de S. DR.FRANCISCO MAGAÑA H.JUAYUA	S	10306U	0314	\N	\N	G
92	1	5	20	SIBASI SONSONATE	1	3	7	41	U	3	05	U	3	U.de S. DR.LEONARDO A.LOPEZ V(SONZACATE)	S	10307U	0305	\N	\N	G
93	1	5	20	SIBASI SONSONATE	1	3	8	26	U	3	07	U	3	U.de S. METALIO (ACAJUTLA)	S	10308U	0307	\N	\N	G
94	1	5	18	SIBASI SONSONATE	1	3	9	32	U	3	14	U	3	U.de S. LA MAJADA (JUAYUA)	S	10309U	0314	\N	\N	G
95	1	5	20	SIBASI SONSONATE	1	3	10	34	U	3	04	U	3	U.de S. NAHULINGO	S	10310U	0304	\N	\N	G
96	1	5	18	SIBASI SONSONATE	1	3	11	38	U	3	15	U	3	U.de S. SANTA CATARINA MASAHUAT	S	10311U	0315	\N	\N	G
97	1	5	20	SIBASI SONSONATE	1	3	12	39	U	3	03	U	3	U.de S. SANTO DOMINGO DE GUZMAN	S	10312U	0303	\N	\N	G
98	1	5	19	SIBASI SONSONATE	1	3	13	30	U	3	11	U	3	U.de S. SANTA ISABEL ISHUATAN	S	10313U	0311	\N	\N	G
99	1	5	20	SIBASI SONSONATE	1	3	14	40	U	3	11	U	3	U.de S. SALINAS DE AYACACHAPA	S	10314U	0301	\N	\N	G
100	1	5	19	SIBASI SONSONATE	1	3	15	28	U	3	13	U	3	U.de S. CALUCO	S	10315U	0313	\N	\N	G
101	1	5	19	SIBASI SONSONATE	1	3	16	29	U	3	12	U	3	U.de S. CUISNAHUAT	S	10316U	0312	\N	\N	G
102	1	5	20	SIBASI SONSONATE	1	3	17	36	U	3	06	U	3	U.de S. SAN ANTONIO DEL MONTE	S	10317U	0306	\N	\N	G
103	1	5	18	SIBASI SONSONATE	1	3	18	35	U	3	16	U	3	U.de S. SALCOATITAN	S	10318U	0316	\N	\N	G
104	1	5	18	SIBASI SONSONATE	1	3	19	33	U	3	02	U	3	U.de S. LOS ARENALES (NAHUIZAL)	S	10319U	0302	\N	\N	G
638	2	17	63	\N	\N	\N	\N	204	\N	12	\N	D	\N	CASA DE SALUD GUADALUPE	\N	\N	\N	\N	\N	G
105	5	6	70	SIBASI CHALATENANGO	2	4	1	47	D	4	06	D	6	CASA DE SALUD LLANO GRANDE	S	20401D	0406	\N	\N	G
106	5	6	119	SIBASI CHALATENANGO	2	4	1	48	H	4	01	H	1	HOSPITAL DR. LUIS E.VAZQUEZ CHALATENANGO	S	20401H	0401	\N	\N	G
107	5	6	70	SIBASI CHALATENANGO	2	4	1	51	N	4	28	N	7	CRN SANTA BARBARA	S	20401N	0428	\N	\N	G
108	5	6	71	SIBASI CHALATENANGO	2	4	2	46	D	4	32	D	6	CASA DE SALUD GUACHIPILIN	S	20402D	0432	\N	\N	G
109	5	6	70	SIBASI CHALATENANGO	2	4	2	51	N	4	28	N	7	CRN LOS CRUCES	S	20402N	0428	\N	\N	G
110	5	6	73	SIBASI CHALATENANGO	2	4	2	69	U	4	05	U	3	U.de S. SAN JOSE LAS FLORES	S	20402U	0405	\N	\N	G
111	5	6	74	SIBASI CHALATENANGO	2	4	3	65	D	4	29	D	6	CASA DE SALUD TEOSINTE	S	20403D	0429	\N	\N	G
112	5	6	70	SIBASI CHALATENANGO	2	4	3	48	U	4	01	U	3	U.de S. EL DORADO (CHALATENANGO)	S	20403U	0401	\N	\N	G
113	5	6	74	SIBASI CHALATENANGO	2	4	4	72	N	4	30	N	7	CRN LOS DERAS	S	20404N	0430	\N	\N	G
114	5	6	74	SIBASI CHALATENANGO	2	4	4	49	U	4	26	U	3	U.de S. DULCE NOMBRE DE MARIA	S	20404U	0426	\N	\N	G
115	5	6	72	SIBASI CHALATENANGO	2	4	5	56	U	4	07	U	3	U.de S. NOMBRE DE JESUS	S	20405U	0407	\N	\N	G
116	5	6	70	SIBASI CHALATENANGO	2	4	6	47	N	4	06	N	7	CRN LAS FLORES	S	20406N	0406	\N	\N	G
117	5	6	74	SIBASI CHALATENANGO	2	4	9	73	N	4	31	N	7	CRN EL CHUPADERO	S	20409N	0431	\N	\N	G
118	5	6	70	SIBASI CHALATENANGO	2	4	9	51	U	4	28	U	3	U.de S. EL PARAISO	S	20409U	0428	\N	\N	G
119	5	6	70	SIBASI CHALATENANGO	2	4	10	51	N	4	01	N	7	CRN ROBLE 2	S	20410N	0401	\N	\N	G
120	5	6	73	SIBASI CHALATENANGO	2	4	10	43	U	4	02	U	3	U.de S. ARCATAO	S	20410U	0402	\N	\N	G
121	5	6	70	SIBASI CHALATENANGO	2	4	11	55	U	4	11	U	3	U.de S. LAS VUELTAS	S	20411U	0411	\N	\N	G
122	5	6	71	SIBASI CHALATENANGO	2	4	12	52	U	4	33	U	3	U.de S. LA LAGUNA	S	20412U	0433	\N	\N	G
123	5	6	74	SIBASI CHALATENANGO	2	4	15	64	U	4	29	U	3	U.de S. SAN FRANCISCO MORAZAN	S	20415U	0429	\N	\N	G
124	5	6	71	SIBASI CHALATENANGO	2	4	16	46	U	4	32	U	3	U.de S. COMALAPA	S	20416U	0432	\N	\N	G
125	5	6	71	SIBASI CHALATENANGO	2	4	17	59	U	4	18	U	3	U.de S. OJOS DE AGUA	S	20417U	0418	\N	\N	G
126	5	6	75	SIBASI CHALATENANGO	2	4	18	70	U	4	13	U	3	U.de S. SAN LUIS DEL CARMEN	S	20418U	0413	\N	\N	G
127	5	6	70	SIBASI CHALATENANGO	2	4	19	62	U	4	08	U	3	U.de S. SAN ANTONIO LOS RANCHOS	S	20419U	0408	\N	\N	G
128	5	6	75	SIBASI CHALATENANGO	2	4	20	60	U	4	12	U	3	U.de S. POTONICO	S	20420U	0412	\N	\N	G
129	5	6	75	SIBASI CHALATENANGO	2	4	21	44	U	4	14	U	3	U.de S. AZACUALPA	S	20421U	0414	\N	\N	G
130	5	6	74	SIBASI CHALATENANGO	2	4	22	63	U	4	27	U	3	U.de S. SAN FERNANDO (CHALATEN)	S	20422U	0427	\N	\N	G
131	5	6	75	SIBASI CHALATENANGO	2	4	23	64	U	4	17	U	3	U.de S. SAN FRANCISCO LEMPA	S	20423U	0417	\N	\N	G
132	5	6	73	SIBASI CHALATENANGO	2	4	24	58	U	4	04	U	3	U.de S. NUEVA TRINIDAD	S	20424U	0404	\N	\N	G
133	5	6	74	SIBASI CHALATENANGO	2	4	25	72	U	4	30	U	3	U.de S. SAN RAFAEL	S	20425U	0430	\N	\N	G
134	5	6	70	SIBASI CHALATENANGO	2	4	26	47	U	4	06	U	3	U.de S. CONCEPCION QUEZALTEPEQUE	S	20426U	0406	\N	\N	G
135	5	6	71	SIBASI CHALATENANGO	2	4	27	50	U	4	09	U	3	U.de S. EL CARRIZAL	S	20427U	0409	\N	\N	G
136	5	6	74	SIBASI CHALATENANGO	2	4	28	73	U	4	31	U	3	U.de S. SANTA RITA	S	20428U	0431	\N	\N	G
137	5	6	72	SIBASI CHALATENANGO	2	4	29	61	U	4	10	U	3	U.de S. SAN ANTONIO DE LA CRUZ	S	20429U	0410	\N	\N	G
138	5	6	70	SIBASI CHALATENANGO	2	4	30	71	U	4	16	U	3	U.de S. SAN MIGUEL DE MERCEDES	S	20430U	0416	\N	\N	G
139	5	6	72	SIBASI CHALATENANGO	2	4	31	68	U	4	15	U	3	U.de S. SAN JOSE CANCASQUE	S	20431U	0415	\N	\N	G
140	5	6	72	SIBASI CHALATENANGO	2	4	35	67	U	4	03	U	3	U.de S. SAN ISIDRO LABRADOR	S	20435U	0403	\N	\N	G
141	5	6	71	SIBASI CHALATENANGO	2	4	36	50	U	4	09	U	3	U.de S. VAINILLAS	S	20436U	0409	\N	\N	G
142	5	6	119	SIBASI CHALATENANGO	2	4	11	73	D	4	32	D	6	CASA DE SALUD CANDELARIA (COMALAPA)	S	20411D	0432	\N	\N	G
143	5	6	119	SIBASI NUEVA CONCEPCION	2	4	1	53	U	4	22	U	3	U.de S. LA PALMA	S	20401U	0422	\N	\N	G
144	5	6	119	SIBASI NUEVA CONCEPCION	2	4	2	57	H	4	20	H	1	HOSPITAL NACIONAL DE NUEVA CONCEPCION	S	20402H	0420	\N	\N	G
145	5	6	119	SIBASI NUEVA CONCEPCION	2	4	3	60	N	4	19	N	7	CRN AGUAJE ESCONDIDO	S	20403N	0419	\N	\N	G
146	5	6	119	SIBASI NUEVA CONCEPCION	2	4	4	54	D	4	23	D	6	CASA DE SALUD EL TIGRE	S	20404D	0423	\N	\N	G
147	5	6	119	SIBASI NUEVA CONCEPCION	2	4	5	54	D	4	23	D	6	CASA DE SALUD EL PEPETO	S	20405D	0423	\N	\N	G
148	5	6	119	SIBASI NUEVA CONCEPCION	2	4	6	42	D	4	25	D	6	CASA DE SALUD EL EMCUMBRADO	S	20406D	0425	\N	\N	G
149	5	6	119	SIBASI NUEVA CONCEPCION	2	4	6	42	U	4	25	U	3	U.de S. AGUA CALIENTE	S	20406U	0425	\N	\N	G
150	5	6	119	SIBASI NUEVA CONCEPCION	2	4	7	42	D	4	25	D	6	CASA DE SALUD CERRO GRANDE	S	20407D	0425	\N	\N	G
151	5	6	119	SIBASI NUEVA CONCEPCION	2	4	7	63	N	4	22	N	7	CRN SAN ANTONIO	S	20407N	0422	\N	\N	G
152	5	6	119	SIBASI NUEVA CONCEPCION	2	4	7	74	U	4	19	U	3	U.de S. TEJUTLA	S	20407U	0419	\N	\N	G
153	5	6	119	SIBASI NUEVA CONCEPCION	2	4	8	42	D	4	25	D	6	CASA DE SALUD OBRAJUELO	S	20408D	0425	\N	\N	G
154	5	6	119	SIBASI NUEVA CONCEPCION	2	4	8	57	N	4	20	N	7	CRN LA CRUZ	S	20408N	0420	\N	\N	G
155	5	6	119	SIBASI NUEVA CONCEPCION	2	4	8	54	U	4	23	U	3	U.de S. LA REINA	S	20408U	0423	\N	\N	G
156	5	6	119	SIBASI NUEVA CONCEPCION	2	4	9	53	D	4	22	D	6	CASA DE SALUD LOS PLANES	S	20409D	0422	\N	\N	G
157	5	6	119	SIBASI NUEVA CONCEPCION	2	4	10	57	D	4	20	D	6	CASA DE SALUD SUNAPA	S	20410D	0420	\N	\N	G
639	2	20	36	\N	\N	\N	\N	220	\N	13	\N	O	\N	ONG AMS  CACAOPERA	\N	\N	\N	\N	\N	G
158	5	6	119	SIBASI NUEVA CONCEPCION	2	4	13	45	U	4	21	U	3	U.de S. CITALA	S	20413U	0421	\N	\N	G
159	5	6	119	SIBASI NUEVA CONCEPCION	2	4	14	66	U	4	24	U	3	U.de S. SAN IGNACIO	S	20414U	0424	\N	\N	G
160	5	6	119	SIBASI NUEVA CONCEPCION	2	4	32	57	U	4	20	U	3	U.de S. POTRERO SULA	S	20432U	0420	\N	\N	G
161	5	6	119	SIBASI NUEVA CONCEPCION	2	4	33	57	U	4	20	U	3	U.de S. ARRACAOS	S	20433U	0420	\N	\N	G
162	5	6	119	SIBASI NUEVA CONCEPCION	2	4	34	66	U	4	24	U	3	U.de S. LAS PILAS	S	20434U	0424	\N	\N	G
163	5	8	126	SIBASI LA LIBERTAD	2	5	1	85	H	5	01	H	1	HOSPITAL SAN RAFAEL SANTA TECLA	S	20501H	0501	13.6714	-89.278599999999997	G
164	5	8	24	SIBASI LA LIBERTAD	2	5	1	79	N	5	11	N	7	CRN SHUTIA	S	20501N	0511	\N	\N	G
165	5	8	24	SIBASI LA LIBERTAD	2	5	1	83	U	5	03	U	3	U.de S. PUERTO LA LIBERTAD	S	20501U	0503	\N	\N	G
166	5	8	24	SIBASI LA LIBERTAD	2	5	2	83	N	5	03	N	7	CRN CANGREJERA (SAN ARTURO NIZA)	S	20502N	0503	\N	\N	G
167	5	8	22	SIBASI LA LIBERTAD	2	5	2	81	U	5	02	U	3	U.de S. DR.FCO.LIMA (JAYAQUE)	S	20502U	0502	\N	\N	G
168	5	8	23	SIBASI LA LIBERTAD	2	5	3	85	D	5	01	D	6	CASA DE SALUD LAS GRANADILLAS(SANTA TEC	S	20503D	0501	\N	\N	G
169	5	8	24	SIBASI LA LIBERTAD	2	5	3	83	N	5	03	N	7	CRN MELARA	S	20503N	0503	\N	\N	G
170	5	8	22	SIBASI LA LIBERTAD	2	5	3	76	U	5	22	U	3	U.de S. CIUDAD ARCE	S	20503U	0522	\N	\N	G
171	5	8	23	SIBASI LA LIBERTAD	2	5	4	85	D	5	01	D	6	CASA DE SALUD EL PROGRESO	S	20504D	0501	\N	\N	G
172	5	8	21	SIBASI LA LIBERTAD	2	5	4	96	N	5	22	N	7	CRN EL CONACASTE	S	20504N	0522	\N	\N	G
173	5	8	21	SIBASI LA LIBERTAD	2	5	4	86	U	5	18	U	3	U.de S. QUEZALTEPEQUE	S	20504U	0518	\N	\N	G
174	5	8	21	SIBASI LA LIBERTAD	2	5	5	89	N	5	20	N	7	CRN SITIO GRANDE	S	20505N	0520	\N	\N	G
175	5	8	21	SIBASI LA LIBERTAD	2	5	5	89	U	5	20	U	3	U.de S. SAN JUAN OPICO	S	20505U	0520	\N	\N	G
176	5	8	21	SIBASI LA LIBERTAD	2	5	6	91	U	5	19	U	3	U.de S. SAN PABLO TACACHICO	S	20506U	0519	\N	\N	G
177	5	8	22	SIBASI LA LIBERTAD	2	5	7	77	U	5	08	U	3	U.de S. LOURDES (COLON)	S	20507U	0508	\N	\N	G
178	5	8	21	SIBASI LA LIBERTAD	2	5	8	89	U	5	20	U	3	U.de S. SITIO DEL NIÑO	S	20508U	0520	\N	\N	G
179	5	8	23	SIBASI LA LIBERTAD	2	5	9	85	U	5	01	U	3	U.de S. DR. ALBERTO AGUILAR RIVAS	S	20509U	0501	\N	\N	G
180	5	8	23	SIBASI LA LIBERTAD	2	5	10	78	U	5	04	U	3	U.de S. COMASAGUA	S	20510U	0504	\N	\N	G
181	5	8	23	SIBASI LA LIBERTAD	2	5	11	96	D	5	15	D	6	CASA DE SALUD LA ESMERALDITA	S	20511D	0515	\N	\N	G
182	5	8	21	SIBASI LA LIBERTAD	2	5	11	90	U	5	21	U	3	U.de S. SAN MATIAS	S	20511U	0521	\N	\N	G
183	5	8	22	SIBASI LA LIBERTAD	2	5	12	95	U	5	07	U	3	U.de S. TEPECOYO	S	20512U	0507	\N	\N	G
184	5	8	23	SIBASI LA LIBERTAD	2	5	13	85	D	5	01	D	6	CASA DE SALUD ALVAREZ	S	20513D	0501	\N	\N	G
185	5	8	23	SIBASI LA LIBERTAD	2	5	13	80	U	5	06	U	3	U.de S. HUIZUCAR	S	20513U	0506	\N	\N	G
187	5	8	23	SIBASI LA LIBERTAD	2	5	15	88	U	5	09	U	3	U.de S. SAN JOSE VILLANUEVA	S	20515U	0509	\N	\N	G
188	5	8	23	SIBASI LA LIBERTAD	2	5	16	96	U	5	15	U	3	U.de S. ZARAGOZA	S	20516U	0515	\N	\N	G
189	5	8	24	SIBASI LA LIBERTAD	2	5	17	94	U	5	05	U	3	U.de S. MIZATA	S	20517U	0505	\N	\N	G
190	5	8	24	SIBASI LA LIBERTAD	2	5	18	79	U	5	11	U	3	U.de S. CHILTIUPAN	S	20518U	0511	\N	\N	G
191	5	8	23	SIBASI LA LIBERTAD	2	5	19	85	U	5	01	U	3	U.de S. DR.CARLOS DIAZ DEL PINAL	S	20519U	0501	\N	\N	G
192	5	8	24	SIBASI LA LIBERTAD	2	5	20	92	U	5	10	U	3	U.de S. TAMANIQUE	S	20520U	0510	\N	\N	G
193	5	8	22	SIBASI LA LIBERTAD	2	5	21	87	U	5	17	U	3	U.de S. SACACOYO	S	20521U	0517	\N	\N	G
194	5	8	24	SIBASI LA LIBERTAD	2	5	22	82	U	5	16	U	3	U.de S. JICALAPA	S	20522U	0516	\N	\N	G
195	5	8	22	SIBASI LA LIBERTAD	2	5	23	93	U	5	14	U	3	U.de S. TALNIQUE	S	20523U	0514	\N	\N	G
196	5	8	23	SIBASI LA LIBERTAD	2	5	24	75	U	5	12	U	3	U.de S. ANTIGUO CUSCATLAN	S	20524U	0512	\N	\N	G
197	5	8	23	SIBASI LA LIBERTAD	2	5	25	84	U	5	13	U	3	U.de S. NUEVO CUSCATLAN	S	20525U	0513	\N	\N	G
198	5	8	24	SIBASI LA LIBERTAD	2	5	26	79	U	5	11	U	3	U.de S. ING. ORLANDO RECINOS	S	20526U	0511	\N	\N	G
199	5	8	22	SIBASI LA LIBERTAD	2	5	28	93	U	5	14	U	3	U.de S. SAN JOSE LOS SITIOS	S	20528U	0514	\N	\N	G
200	5	8	22	SIBASI LA LIBERTAD	2	5	27	77	U	5	08	U	3	U.de S. DR.MANUEL GALLADRO COLON	S	20527U	0508	\N	\N	G
201	5	8	21	SIBASI LA LIBERTAD	2	5	16	89	D	5	20	D	6	CASA DE SALUD LAS GRANADILLAS(S.DEL NIÑ	S	20516D	0520	\N	\N	G
202	5	8	21	SIBASI LA LIBERTAD	2	5	17	75	D	5	01	D	6	CASA DE SALUD MELARA (SANTA TECLA)	S	20517D	0501	\N	\N	G
203	5	8	22	SIBASI LA LIBERTAD	2	5	18	87	D	5	01	D	6	CASA DE SALUD VILLA TZU-CHI I	S	20518D	0501	\N	\N	G
204	4	9	110	SIBASI COJUTEPEQUE	3	7	1	125	D	7	02	D	6	CASA DE SALUD CANTON EL ESPINO	S	30701D	0702	\N	\N	G
205	4	9	110	SIBASI COJUTEPEQUE	3	7	1	125	U	7	02	U	3	U.de S. SAN PEDRO PERULAPAN	S	30701U	0702	\N	\N	G
206	4	9	110	SIBASI COJUTEPEQUE	3	7	2	125	D	7	02	D	6	CASA DE SALUD CANTON EL CARMEN (SPPERU)	S	30702D	0702	\N	\N	G
207	4	9	122	SIBASI COJUTEPEQUE	3	7	2	117	H	7	01	H	1	HOSPITAL NAC.NUESTRA SEÑORA DE FATIMA,	S	30702H	0701	\N	\N	G
208	4	9	110	SIBASI COJUTEPEQUE	3	7	3	125	D	7	02	D	6	CASA DE SALUD CANTON TECOLUCO	S	30703D	0702	\N	\N	G
209	4	9	107	SIBASI COJUTEPEQUE	3	7	3	126	U	7	04	U	3	U.de S. SAN RAFAEL CEDROS	S	30703U	0704	\N	\N	G
210	4	9	110	SIBASI COJUTEPEQUE	3	7	4	129	U	7	09	U	3	U.de S. SANTA CRUZ MICHAPA	S	30704U	0709	\N	\N	G
211	4	9	108	SIBASI COJUTEPEQUE	3	7	5	131	D	7	03	D	6	CASA DE SALUD CANTON CORRAL VIEJO	S	30705D	0703	\N	\N	G
212	4	9	108	SIBASI COJUTEPEQUE	3	7	5	131	U	7	03	U	3	U.de S. TENANCINGO	S	30705U	0703	\N	\N	G
213	4	9	107	SIBASI COJUTEPEQUE	3	7	6	118	D	7	07	D	6	CASA DE SALUD CANTON SAN ANTONIO	S	30706D	0707	\N	\N	G
214	4	9	108	SIBASI COJUTEPEQUE	3	7	6	128	U	7	13	U	3	U.de S. SANTA CRUZ ANALQUITO	S	30706U	0713	\N	\N	G
215	4	9	107	SIBASI SUCHITOTO	3	7	7	124	D	7	15	D	6	CASA DE SALUD CANTON PIEDRA LABRADA	S	30707D	0715	\N	\N	G
216	4	9	108	SIBASI COJUTEPEQUE	3	7	7	116	U	7	05	U	3	U.de S. CANDELARIA CUSCATLAN	S	30707U	0705	\N	\N	G
217	4	9	107	SIBASI COJUTEPEQUE	3	7	8	126	D	7	04	D	6	CASA DE SALUD CANTON SOLEDAD, SRCEDROS	S	30708D	0704	\N	\N	G
218	4	9	107	SIBASI COJUTEPEQUE	3	7	8	119	U	7	12	U	3	U.de S. ROSARIO CUSCATLAN	S	30708U	0712	\N	\N	G
219	4	9	107	SIBASI COJUTEPEQUE	3	7	9	120	U	7	06	U	3	U.de S. MONTE SAN JUAN	S	30709U	0706	\N	\N	G
220	4	9	108	SIBASI COJUTEPEQUE	3	7	11	123	U	7	08	U	3	U.de S. SAN CRISTOBAL	S	30711U	0708	\N	\N	G
221	4	9	108	SIBASI COJUTEPEQUE	3	7	12	127	U	7	11	U	3	U.de S. SAN RAMON	S	30712U	0711	\N	\N	G
222	4	9	107	SIBASI COJUTEPEQUE	3	7	13	118	U	7	07	U	3	U.de S. EL CARMEN CUSCATLAN	S	30713U	0707	\N	\N	G
223	4	9	108	SIBASI COJUTEPEQUE	3	8	17	139	U	8	07	U	3	U.de S. SAN EMIGDIO	S	30817U	0807	\N	\N	G
224	4	9	108	SIBASI COJUTEPEQUE	3	8	26	137	U	8	08	U	3	U.de S. PARAISO DE OSORIO	S	30826U	0808	\N	\N	G
225	4	9	107	SIBASI COJUTEPEQUE	3	7	9	117	D	7	01	D	6	CASA DE SALUD CANTON COPINOL	S	30709D	0701	\N	\N	G
226	4	9	107	SIBASI COJUTEPEQUE	3	7	10	117	D	7	01	D	6	CASA DE SALUD CANTON CANDELARIA	S	30710D	0701	\N	\N	G
227	4	9	107	SIBASI COJUTEPEQUE	3	7	11	120	D	7	06	D	6	CASA DE SALUD CANTON SOLEDAD,MONT S JUAN	S	30711D	0706	\N	\N	G
228	4	10	127	SIBASI LA PAZ	3	8	1	152	H	8	01	H	1	HOSPITAL SANTA TERESA ZACATECOLUCA	S	30801H	0801	13.5174	-88.868099999999998	G
229	4	10	27	SIBASI LA PAZ	3	8	1	144	N	8	21	N	7	CRN LAS MONJAS	S	30801N	0821	\N	\N	G
230	4	10	25	SIBASI LA PAZ	3	8	1	147	U	8	05	U	3	U.de S. SAN PEDRO NONUALCO	S	30801U	0805	\N	\N	G
231	4	10	27	SIBASI LA PAZ	3	8	2	144	D	8	16	D	6	CASA DE SALUD AMATECAMPO	S	30802D	0816	\N	\N	G
232	4	10	25	SIBASI LA PAZ	3	8	2	150	N	8	02	N	7	CRN EL TIHUILOCOYO	S	30802N	0802	\N	\N	G
233	4	10	26	SIBASI LA PAZ	3	8	2	146	U	8	17	U	3	U.de S. SAN PEDRO MAZAHUAT	S	30802U	0817	\N	\N	G
234	4	10	28	SIBASI LA PAZ	3	8	3	153	D	8	22	D	6	CASA DE SALUD GUADALUPE LA ZORRA	S	30803D	0822	\N	\N	G
235	4	10	25	SIBASI LA PAZ	3	8	3	150	N	8	02	N	7	CRN HOJA DE SAL	S	30803N	0802	\N	\N	G
236	4	10	25	SIBASI LA PAZ	3	8	3	150	U	8	02	U	3	U.de S. SANTIAGO NONUALCO	S	30803U	0802	\N	\N	G
237	4	10	28	SIBASI LA PAZ	3	8	4	153	D	8	22	D	6	CASA DE SALUD LA CALZADA	S	30804D	0822	\N	\N	G
238	4	10	28	SIBASI LA PAZ	3	8	4	150	N	8	22	N	7	CRN EL PORFIADO	S	30804N	0822	\N	\N	G
239	4	10	28	SIBASI LA PAZ	3	8	4	153	U	8	22	U	3	U.de S. SAN LUIS LA HERRADURA	S	30804U	0822	\N	\N	G
240	4	10	27	SIBASI LA PAZ	3	8	5	146	D	8	16	D	6	CASA DE SALUD ASTORIA	S	30805D	0816	\N	\N	G
241	4	10	27	SIBASI LA PAZ	3	8	5	146	N	8	16	N	7	CRN VILLA PALESTINA	S	30805N	0816	\N	\N	G
242	4	10	27	SIBASI LA PAZ	3	8	5	144	U	8	16	U	3	U.de S. SAN LUIS TALPA	S	30805U	0816	\N	\N	G
243	4	10	26	SIBASI LA PAZ	3	8	6	146	D	8	17	D	6	CASA DE SALUD BARAHONA	S	30806D	0817	\N	\N	G
244	4	10	26	SIBASI LA PAZ	3	8	6	146	N	8	17	N	7	CRN EL ACHIOTAL	S	30806N	0817	\N	\N	G
245	4	10	27	SIBASI LA PAZ	3	8	6	136	U	8	11	U	3	U.de S. OLOCUILTA	S	30806U	0811	\N	\N	G
246	4	10	27	SIBASI LA PAZ	3	8	7	136	D	8	11	D	6	CASA DE SALUD LA ESPERANZA (OLOCUILTA)	S	30807D	0811	\N	\N	G
247	4	10	26	SIBASI LA PAZ	3	8	7	146	N	8	17	N	7	CRN EL PORVENIR	S	30807N	0817	\N	\N	G
248	4	10	26	SIBASI LA PAZ	3	8	7	133	U	8	21	U	3	U.de S. ROSARIO LA PAZ	S	30807U	0821	\N	\N	G
249	4	10	27	SIBASI LA PAZ	3	8	8	136	D	8	11	D	6	CASA DE SALUD SAN SEBASTIAN	S	30808D	0811	\N	\N	G
250	4	10	26	SIBASI LA PAZ	3	8	8	133	N	8	16	N	7	CRN EL PEDREGAL	S	30808N	0816	\N	\N	G
251	4	10	25	SIBASI LA PAZ	3	8	8	141	U	8	03	U	3	U.de S. SAN JUAN NONUALCO	S	30808U	0803	\N	\N	G
252	4	10	26	SIBASI LA PAZ	3	8	9	146	N	8	17	N	7	CRN SAN MARCOS JIBOA	S	30809N	0817	\N	\N	G
253	4	10	25	SIBASI LA PAZ	3	8	9	149	U	8	06	U	3	U.de S. SANTA MARIA OSTUMA	S	30809U	0806	\N	\N	G
254	4	10	28	SIBASI LA PAZ	3	8	10	153	N	8	22	N	7	CRN GUADALUPE LA ZORRA	S	30810N	0822	\N	\N	G
255	4	10	26	SIBASI LA PAZ	3	8	10	145	U	8	18	U	3	U.de S. SAN MIGUEL TEPEZONTES	S	30810U	0818	\N	\N	G
256	4	10	25	SIBASI LA PAZ	3	8	11	148	U	8	04	U	3	U.de S. SAN RAFAEL OBRAJUELO	S	30811U	0804	\N	\N	G
257	4	10	27	SIBASI LA PAZ	3	8	12	142	U	8	12	U	3	U.de S. SAN JUAN TALPA	S	30812U	0812	\N	\N	G
258	4	10	26	SIBASI LA PAZ	3	8	13	143	U	8	20	U	3	U.de S. SAN JUAN TEPEZONTES	S	30813U	0820	\N	\N	G
259	4	10	27	SIBASI LA PAZ	3	8	14	140	U	8	14	U	3	U.de S. SAN FRANCISCO CHINAMECA	S	30814U	0814	\N	\N	G
260	4	13	29	SIBASI SAN VICENTE	3	8	15	134	U	8	09	U	3	U.de S. JERUSALEN	S	30815U	0809	\N	\N	G
261	4	10	27	SIBASI LA PAZ	3	8	16	136	U	8	11	U	3	U.de S. SANTA LUCIA ORCOYO	S	30816U	0811	\N	\N	G
262	4	10	27	SIBASI LA PAZ	3	8	18	132	U	8	13	U	3	U.de S. CUYULTITAN	S	30818U	0813	\N	\N	G
263	4	10	28	SIBASI LA PAZ	3	8	19	146	U	8	17	U	3	U.de S. LAS ISLETAS	S	30819U	0817	\N	\N	G
264	4	10	26	SIBASI LA PAZ	3	8	20	146	U	8	17	U	3	U.de S. EL ACHIOTAL (SAN PEDRO MAZAGUAT)	S	30820U	0817	\N	\N	G
265	4	10	25	SIBASI LA PAZ	3	8	21	150	U	8	02	U	3	U.de S. SAN JOSE LA PAZ ARRIBA	S	30821U	0802	\N	\N	G
266	4	10	28	SIBASI LA PAZ	3	8	22	153	U	8	22	U	3	U.de S. EL ZAPOTE(LA HERRADURA)	S	30822U	0822	\N	\N	G
267	4	10	26	SIBASI LA PAZ	3	8	23	138	U	8	19	U	3	U.de S. SAN ANTONIO MASAHUATH	S	30823U	0819	\N	\N	G
268	4	10	27	SIBASI LA PAZ	3	8	24	144	U	8	16	U	3	U.de S. EL PIMENTAL (SN.L.TALPA)	S	30824U	0816	\N	\N	G
269	4	10	27	SIBASI LA PAZ	3	8	25	151	U	8	15	U	3	U.de S. TAPALHUACA	S	30825U	0815	\N	\N	G
270	4	10	25	SIBASI LA PAZ	3	8	27	152	U	8	01	U	3	U.de S. DR.CARLOS ALBERTO GALEANO	S	30827U	0801	\N	\N	G
271	4	10	25	SIBASI LA PAZ	3	8	9	152	D	8	01	D\n	6	CASA DE SALUD EL PICHICHE (ZACATECOLUCA	S	30809D	0801	\N	\N	G
272	4	10	25	SIBASI LA PAZ	3	8	10	152	D	8	01	D	6	CASA DE SALUD AZACUALPA	S	30810D	0801	\N	\N	G
273	4	13	29	SIBASI SAN VICENTE	3	8	28	135	U	8	10	U	3	U.de S. MERCEDES LA CEIBA	S	30828U	0810	\N	\N	G
274	4	10	25	SIBASI LA PAZ	3	8	11	152	D	8	01	D	6	CASA DE SALUD SAN FAUSTINO	S	30811D	0801	\N	\N	G
275	4	10	27	SIBASI LA PAZ	3	8	12	142	D	8	16	C	6	CLINICA OFICINA DE SANEAM.INTERNACIONAL	S	30812D	0816	\N	\N	G
276	4	12	4	SIBASI SENSUNTEPEQUE	3	9	1	159	H	9	01	H	1	HOSPITAL NACIONAL  SENSUNTEPEQUE	S	30901H	0901	\N	\N	G
277	4	12	4	SIBASI SENSUNTEPEQUE	3	9	2	158	U	9	04	U	3	U.de S. SAN ISIDRO (CABAÑAS)	S	30902U	0904	\N	\N	G
278	4	12	4	SIBASI SENSUNTEPEQUE	3	9	3	158	N	9	04	N	7	CRN  IZCATAL	S	30903N	0904	\N	\N	G
279	4	12	4	SIBASI SENSUNTEPEQUE	3	9	3	161	U	9	02	U	3	U.de S. VICTORIA	S	30903U	0902	\N	\N	G
280	4	12	4	SIBASI SENSUNTEPEQUE	3	9	4	158	N	9	04	N	7	CRN HACIENDA VIEJA	S	30904N	0904	\N	\N	G
281	4	12	4	SIBASI SENSUNTEPEQUE	3	9	5	158	N	9	04	N	7	CRN PUERTONA	S	30905N	0904	\N	\N	G
282	4	12	4	SIBASI SENSUNTEPEQUE	3	9	6	159	D	9	01	D	6	CASA DE SALUD COPINOLAPA	S	30906D	0901	\N	\N	G
283	4	12	4	SIBASI SENSUNTEPEQUE	3	9	6	158	N	9	04	N	7	CRN JOBITOS	S	30906N	0904	\N	\N	G
284	4	12	4	SIBASI SENSUNTEPEQUE	3	9	7	159	D	9	01	D	6	CASA DE SALUD SAN MARCOS	S	30907D	0901	\N	\N	G
285	4	12	4	SIBASI SENSUNTEPEQUE	3	9	7	162	U	9	03	U	3	U.de S. DOLORES	S	30907U	0903	\N	\N	G
286	4	12	4	SIBASI SENSUNTEPEQUE	3	9	8	159	D	9	01	D	6	CASA DE SALUD SAN GREGORIO	S	30908D	0901	\N	\N	G
287	4	12	4	SIBASI SENSUNTEPEQUE	3	9	9	159	D	9	01	D	6	CASA DE SALUD CUYANTEPEQUE	S	30909D	0901	\N	\N	G
288	4	12	4	SIBASI SENSUNTEPEQUE	3	9	10	161	D	9	02	D	6	CASA DE SALUD SAN PEDRO	S	30910D	0902	\N	\N	G
289	4	12	4	SIBASI SENSUNTEPEQUE	3	9	10	159	N	9	01	N	7	CRN SANTA CRUZ LA JUNTA	S	30910N	0901	\N	\N	G
290	4	12	4	SIBASI SENSUNTEPEQUE	3	9	10	155	U	9	05	U	3	U.de S. GUACOTECTI	S	30910U	0905	\N	\N	G
291	4	12	4	SIBASI SENSUNTEPEQUE	3	9	11	161	D	9	02	D	6	CASA DE SALUD PARATAO	S	30911D	0902	\N	\N	G
292	4	12	4	SIBASI SENSUNTEPEQUE	3	9	12	162	D	9	03	D	6	CASA DE SALUD SAN CARLOS	S	30912D	0903	\N	\N	G
293	4	12	4	SIBASI SENSUNTEPEQUE	3	9	13	159	U	9	01	U	3	U.de S. SENSUNTEPEQUE	S	30913U	0901	\N	\N	G
294	4	12	4	SIBASI SENSUNTEPEQUE	3	9	14	161	U	9	02	U	3	U.de S. SANTA MARTA	S	30914U	0902	\N	\N	G
295	4	12	4	SIBASI SENSUNTEPEQUE	4	12	21	209	U	12	18	U	3	U.de S. NUEVO EDEN DE SAN JUAN	S	41221U	1218	\N	\N	G
296	4	12	6	SIBASI ILOBASCO	3	9	1	156	D	9	06	D	6	CASA DE SALUD SAN FRANCISCO IRAHETA	S	30901D	0906	\N	\N	G
297	4	12	4	SIBASI ILOBASCO	3	9	1	159	N	9	06	N	7	CRN ORATORIO CENTRO	S	30901N	0906	\N	\N	G
298	4	12	6	SIBASI ILOBASCO	3	9	2	156	D	9	06	D	6	CASA DE SALUD POTRERO	S	30902D	0906	\N	\N	G
299	4	12	123	SIBASI ILOBASCO	3	9	2	156	H	9	06	H	1	HOSPITAL DR.JOSE L.SACA (ILOBASCO)	S	30902H	0906	\N	\N	G
300	4	12	6	SIBASI ILOBASCO	3	9	3	156	D	9	06	D	6	CASA DE SALUD HUERTAS	S	30903D	0906	\N	\N	G
301	4	12	6	SIBASI ILOBASCO	3	9	4	157	D	9	08	D	6	CASA DE SALUD SAN SEBAST.CERRON GRANDE	S	30904D	0908	\N	\N	G
302	4	12	5	SIBASI ILOBASCO	3	9	4	162	U	9	09	U	3	U.de S. CINQUERA	S	30904U	0909	\N	\N	G
303	4	12	6	SIBASI ILOBASCO	3	9	5	159	D	9	01	D	6	CASA DE SALUD SAN NICOLAS	S	30905D	0901	\N	\N	G
304	4	12	5	SIBASI ILOBASCO	3	9	5	160	U	9	07	U	3	U.de S. TEJUTEPEQUE	S	30905U	0907	\N	\N	G
305	4	12	6	SIBASI ILOBASCO	3	9	6	161	U	9	08	U	3	U.de S. JUTIAPA	S	30906U	0908	\N	\N	G
306	4	12	4	SIBASI ILOBASCO	3	9	7	154	N	9	01	N	7	CRN SAN NICOLAS	S	30907N	0901	\N	\N	G
307	4	12	4	SIBASI ILOBASCO	3	9	8	154	N	9	01	N	7	CRN CAMPAMENTO 2 CANTON SAN NICOLAS	S	30908N	0901	\N	\N	G
308	4	12	4	SIBASI ILOBASCO	3	9	8	159	U	9	06	U	3	U.de S. SANTA LUCIA (ILOBASCO)	S	30908U	0906	\N	\N	G
309	4	12	6	SIBASI ILOBASCO	3	9	9	161	U	9	08	U	3	U.de S. CAROLINA (JUTIAPA )	S	30909U	0908	\N	\N	G
310	4	12	4	SIBASI ILOBASCO	3	9	11	159	U	9	06	U	3	U.de S. SAN FCO.DEL MONTE	S	30911U	0906	\N	\N	G
311	4	12	4	SIBASI ILOBASCO	3	9	12	156	U	9	06	U	3	U.de S. ILOBASCO	S	30912U	0906	\N	\N	G
312	4	12	5	SIBASI ILOBASCO	3	9	13	160	D	9	07	D	6	CASA DE SALUD EL ZAPOTE (TEJUTEPEQUE)	S	30913D	0907	\N	\N	G
313	4	12	6	SIBASI ILOBASCO	3	9	14	156	D	9	06	D	6	CASA DE SALUD SAN JOSE (ILOBASCO)	S	30914D	0906	\N	\N	G
314	4	13	134	SIBASI SAN VICENTE	3	10	1	172	H	10	01	H	1	HOSPITAL SANTA GERTRUDIS SAN VICENTE	S	31001H	1001	\N	\N	G
315	4	13	29	SIBASI SAN VICENTE	3	10	1	163	N	10	01	N	7	CRN FENADESAL	S	31001N	1001	\N	\N	G
316	4	13	31	SIBASI SAN VICENTE	3	10	1	171	U	10	08	U	3	U.de S. SAN SEBASTIAN	S	31001U	1008	\N	\N	G
317	4	13	29	SIBASI SAN VICENTE	3	10	2	165	N	10	07	N	7	CRN SAN CAYETANO ISTEPEQUE	S	31002N	1007	\N	\N	G
318	4	13	29	SIBASI SAN VICENTE	3	10	2	164	U	10	03	U	3	U.de S. GUADALUPE	S	31002U	1003	\N	\N	G
640	2	20	37	\N	\N	\N	\N	223	\N	13	\N	O	\N	ONG AMS DELICIAS DE CONCEPCION	\N	\N	\N	\N	\N	G
319	4	13	32	SIBASI SAN VICENTE	3	10	3	173	U	10	06	U	3	U.de S. TECOLUCA	S	31003U	1006	\N	\N	G
320	4	13	29	SIBASI SAN VICENTE	3	10	1	172	D	10	01	D	6	CASA DE SALUD AGUA CALIENTE	S	31001D	1001	\N	\N	G
321	4	13	30	SIBASI SAN VICENTE	3	10	4	163	U	10	02	U	3	U.de S. APASTEPEQUE	S	31004U	1002	\N	\N	G
322	4	13	29	SIBASI SAN VICENTE	3	10	2	172	D	10	01	D	6	CASA DE SALUD DOS QUEBRADAS	S	31002D	1001	\N	\N	G
323	4	13	29	SIBASI SAN VICENTE	3	10	5	175	U	10	04	U	3	U.de S. VERAPAZ	S	31005U	1004	\N	\N	G
324	4	13	31	SIBASI SAN VICENTE	3	10	6	167	U	10	11	U	3	U.de S. SANTO DOMINGO	S	31006U	1011	\N	\N	G
325	4	13	29	SIBASI SAN VICENTE	3	10	7	174	U	10	05	U	3	U.de S. TEPETITAN	S	31007U	1005	\N	\N	G
326	4	13	29	SIBASI SAN VICENTE	3	10	8	172	U	10	01	U	3	U.de S. PERIFERICA SAN VICENTE	S	31008U	1001	\N	\N	G
327	4	13	30	SIBASI SAN VICENTE	3	10	9	169	U	10	13	U	3	U.de S. SAN ILDEFONSO	S	31009U	1013	\N	\N	G
328	4	13	30	SIBASI SAN VICENTE	3	10	10	168	U	10	09	U	3	U.de S. SAN ESTEBAN CATARINA	S	31010U	1009	\N	\N	G
329	4	13	32	SIBASI SAN VICENTE	3	10	11	173	U	10	06	U	3	U.de S. SAN CARLOS LEMPA	S	31011U	1006	\N	\N	G
330	4	13	30	SIBASI SAN VICENTE	3	10	12	166	U	10	12	U	3	U.de S. SANTA CLARA	S	31012U	1012	\N	\N	G
331	4	13	31	SIBASI SAN VICENTE	3	10	13	170	U	10	10	U	3	U.de S. SAN LORENZO(SN.VICENTE)	S	31013U	1010	\N	\N	G
332	4	13	29	SIBASI SAN VICENTE	3	10	14	165	U	10	07	U	3	U.de S. SAN CAYETANO ISTEPEQUE	S	31014U	1007	\N	\N	G
333	4	13	32	SIBASI SAN VICENTE	3	10	15	173	U	10	06	U	3	U.de S. SAN NICOLAS LEMPA	S	31015U	1006	\N	\N	G
334	2	14	138	SIBASI USULUTAN	4	11	1	198	H	11	01	H	1	HOSPITAL SAN PEDRO USULUTAN	S	41101H	1101	\N	\N	G
335	2	14	79	SIBASI USULUTAN	4	11	1	179	N	11	08	N	7	CRN HACIENDA NUEVA	S	41101N	1108	\N	\N	G
336	2	14	79	SIBASI USULUTAN	4	11	2	185	D	11	05	D	6	CASA DE SALUD CANTON SAMURIA	S	41102D	1105	\N	\N	G
337	2	14	79	SIBASI USULUTAN	4	11	2	179	N	11	08	N	7	CRN MONTEFRESCO	S	41102N	1108	\N	\N	G
338	2	14	79	SIBASI USULUTAN	4	11	3	185	D	11	05	D	6	CASA DE SALUD CANTON EL JUTAL	S	41103D	1105	\N	\N	G
339	2	14	79	SIBASI USULUTAN	4	11	7	193	U	11	02	U	3	U.de S. SANTA ELENA	S	41107U	1102	\N	\N	G
340	2	14	79	SIBASI USULUTAN	4	11	8	185	U	11	05	U	3	U.de S. JUCUARAN	S	41108U	1105	\N	\N	G
341	2	14	79	SIBASI USULUTAN	4	11	9	188	U	11	07	U	3	U.de S. OZATLAN	S	41109U	1107	\N	\N	G
342	2	14	79	SIBASI USULUTAN	4	11	10	198	D	11	01	D	6	CASA DE SALUD CANTON LA PEÑA (USULUTAN)	S	41110D	1101	\N	\N	G
343	2	14	80	SIBASI USULUTAN	4	11	10	179	U	11	08	U	3	U.de S. CONCEPCION BATRES	S	41110U	1108	\N	\N	G
344	2	14	79	SIBASI USULUTAN	4	11	14	195	U	11	09	U	3	U.de S. SANTA MARIA	S	41114U	1109	\N	\N	G
345	2	14	79	SIBASI USULUTAN	4	11	15	198	U	11	01	U	3	U.de S. EL MOLINO	S	41115U	1101	\N	\N	G
346	2	14	79	SIBASI USULUTAN	4	11	26	181	U	11	06	U	3	U.de S. EREGUAYQUIN	S	41126U	1106	\N	\N	G
347	2	14	79	SIBASI USULUTAN	4	11	27	198	U	11	01	U	3	U.de S. PUERTO PARADA	S	41127U	1101	\N	\N	G
348	2	14	79	SIBASI USULUTAN	4	11	28	185	U	11	05	U	3	U.de S. EL ESPINO	S	41128U	1105	\N	\N	G
349	2	14	79	SIBASI USULUTAN	4	11	29	192	U	11	04	U	3	U.de S. SAN DIONISIO	S	41129U	1104	\N	\N	G
350	2	14	79	SIBASI USULUTAN	4	11	34	198	U	11	01	U	3	U.de S. LA CRUZ	S	41434U	1101	\N	\N	G
351	2	14	80	SIBASI USULUTAN	4	12	4	216	U	12	11	U	3	U.de S. SAN RAFAEL ORIENTE	S	41204U	1211	\N	\N	G
352	2	14	80	SIBASI USULUTAN	4	12	5	205	U	12	12	U	3	U.de S. EL TRANSITO	S	41205U	1212	\N	\N	G
353	2	14	80	SIBASI USULUTAN	4	12	19	213	U	12	14	U	3	U.de S. SAN JORGE	S	41219U	1214	\N	\N	G
354	2	14	80	SIBASI USULUTAN	4	12	28	205	U	12	12	U	3	U.de S. PRIMAVERA	S	41228U	1212	\N	\N	G
355	2	14	80	SIBASI SANTIAGO DE MARIA	4	11	1	177	U	11	20	U	3	U.de S. BERLIN	S	41101U	1120	\N	\N	G
356	2	14	79	SIBASI SANTIAGO DE MARIA	4	11	2	196	H	11	16	H	1	HOSPITAL SANTIAGO DE MARIA	S	41102H	1116	\N	\N	G
357	2	14	80	SIBASI SANTIAGO DE MARIA	4	11	4	182	D	11	12	D	6	CASA DE SALUD CTN.LA CRUZ (ESTANZUELA)	S	41104D	1112	\N	\N	G
358	2	14	79	SIBASI SANTIAGO DE MARIA	4	11	4	182	U	11	12	U	3	U.de S. ESTANZUELAS	S	41104U	1112	\N	\N	G
359	2	14	80	SIBASI SANTIAGO DE MARIA	4	11	5	187	D	11	15	D	6	CASA DE SALUD CANTON AZACUALPIA JOCOMONT	S	41105D	1115	\N	\N	G
360	2	14	79	SIBASI SANTIAGO DE MARIA	4	11	6	197	D	11	18	D	6	CASA DE SALUD CANTON CHAPETONES	S	41106D	1118	\N	\N	G
361	2	14	79	SIBASI SANTIAGO DE MARIA	4	11	7	187	D	11	15	D	6	CASA DE SALUD CTON.SAN JOSE (NVA.GRANAD	S	41107D	1115	\N	\N	G
362	2	14	79	SIBASI SANTIAGO DE MARIA	4	11	8	187	D	11	15	D	6	CASA DE SALUD CTON.PALOMILLA DE GUALCHO	S	41108D	1115	\N	\N	G
363	2	14	79	SIBASI SANTIAGO DE MARIA	4	11	9	187	D	11	15	D	6	CASA DE SALUD CTON.AZACUALPIA D GUALCHO	S	41109D	1115	\N	\N	G
364	2	14	79	SIBASI SANTIAGO DE MARIA	4	11	12	176	U	11	17	U	3	U.de S. ALEGRIA	S	41112U	1117	\N	\N	G
365	2	14	79	SIBASI SANTIAGO DE MARIA	4	11	13	186	U	11	22	U	3	U.de S. MERCEDES UMAÑA	S	41113U	1122	\N	\N	G
366	2	14	80	SIBASI SANTIAGO DE MARIA	4	11	18	178	U	11	19	U	3	U.de S. CALIFORNIA	S	41118U	1119	\N	\N	G
367	2	14	79	SIBASI SANTIAGO DE MARIA	4	11	19	187	U	11	15	U	3	U.de S. NUEVA GRANADA	S	41119U	1115	\N	\N	G
368	2	14	79	SIBASI SANTIAGO DE MARIA	4	11	20	197	U	11	18	U	3	U.de S. TECAPAN	S	41120U	1118	\N	\N	G
369	2	14	79	SIBASI SANTIAGO DE MARIA	4	11	22	180	U	11	13	U	3	U.de S. EL TRIUNFO	S	41122U	1113	\N	\N	G
370	2	14	79	SIBASI SANTIAGO DE MARIA	4	11	23	196	U	11	16	U	3	U.de S. EL CERRITO	S	41123U	1116	\N	\N	G
371	2	14	80	SIBASI JIQUILISCO	4	11	1	183	D	11	03	D	6	CASA DE SALUD LOS ESPERANZA (JIQUILISC)	S	41101D	1103	\N	\N	G
641	2	17	63	\N	\N	\N	\N	239	\N	13	\N	O	\N	ONG AMS SAN SIMON CIUDAD BARRIOS	\N	\N	\N	\N	\N	G
372	2	14	80	SIBASI JIQUILISCO	4	11	3	183	H	11	03	H	1	HOSPITAL JIQUILISCO	S	41103H	1103	\N	\N	G
373	2	14	80	SIBASI JIQUILISCO	4	11	3	189	N	11	10	N	7	CRN ISLA MADRE SAL	S	41103N	1110	\N	\N	G
374	2	14	79	SIBASI JIQUILISCO	4	11	5	183	U	11	03	U	3	U.de S. TIERRA BLANCA (JIQUILISCO)	S	41105U	1103	\N	\N	G
375	2	14	79	SIBASI JIQUILISCO	4	11	6	189	U	11	10	U	3	U.de S. PUERTO EL TRIUNFO	S	41106U	1110	\N	\N	G
376	2	14	79	SIBASI JIQUILISCO	4	11	11	190	U	11	21	U	3	U.de S. SAN AGUSTIN	S	41111U	1121	\N	\N	G
377	2	14	79	SIBASI JIQUILISCO	4	11	17	194	U	11	23	U	3	U.de S. SAN FRANCISCO JAVIER	S	41117U	1123	\N	\N	G
378	2	14	79	SIBASI JIQUILISCO	4	11	21	183	U	11	03	U	3	U.de S. ISLA DE MENDEZ	S	41121U	1103	\N	\N	G
379	2	14	79	SIBASI JIQUILISCO	4	11	24	183	U	11	03	U	3	U.de S. EL QUEBRADO	S	41124U	1103	\N	\N	G
380	2	14	79	SIBASI JIQUILISCO	4	11	25	189	U	11	10	U	3	U.de S. CORRAL DE MULAS	S	41125U	1110	\N	\N	G
381	2	14	79	SIBASI JIQUILISCO	4	11	30	183	U	11	03	U	3	U.de S. LA CANOA	S	41130U	1103	\N	\N	G
382	2	14	79	SIBASI JIQUILISCO	4	11	31	183	U	11	03	U	3	U.de S. SALINAS DE SISIGUAYO	S	41131U	1103	\N	\N	G
383	2	14	79	SIBASI JIQUILISCO	4	11	32	183	U	11	03	U	3	U.de S. NUEVO AMANECER	S	41132U	1103	\N	\N	G
384	2	14	80	SIBASI JIQUILISCO	4	11	11	178	D	11	03	D	6	CASA DE SALUD SAN HILARIO	S	41111D	1103	\N	\N	G
385	2	17	133	SIBASI SAN MIGUEL	4	12	1	215	H	12	01	H	1	HOSPITAL SAN JUAN DE DIOS SAN MIGUEL	S	41201H	1201	13.473800000000001	-88.191000000000003	G
386	2	17	89	SIBASI SAN MIGUEL	4	12	1	215	N	12	01	N	7	CRN MAYUCAQUIN	S	41201N	1201	\N	\N	G
387	2	17	64	SIBASI SAN MIGUEL	4	12	3	215	D	12	01	D	6	CASA DE SALUD LOS RANCHOS	S	41203D	1201	\N	\N	G
388	2	17	88	SIBASI SAN MIGUEL	4	12	3	217	U	12	15	U	3	U.de S. SESORI	S	41203U	1215	\N	\N	G
389	2	17	89	SIBASI SAN MIGUEL	4	12	4	215	D	12	01	D	6	CASA DE SALUD SANTA FIDELIA	S	41204D	1201	\N	\N	G
390	2	17	89	SIBASI SAN MIGUEL	4	12	5	215	D	12	01	D	6	CASA DE SALUD CASA DE LA MISERICORDIA	S	41205D	1201	\N	\N	G
391	2	17	89	SIBASI SAN MIGUEL	4	12	6	215	D	12	01	D	6	CASA DE SALUD ASILO SAN ANTONIO	S	41206D	1201	\N	\N	G
392	2	17	89	SIBASI SAN MIGUEL	4	12	8	215	D	12	01	D	6	CASA DE SALUD LOS CARRETOS	S	41208D	1201	\N	\N	G
393	2	17	64	SIBASI SAN MIGUEL	4	12	8	215	U	12	01	U	3	U.de S. DR.ROBERTO A.CARIAS (LA PRESITA)	S	41208U	1201	\N	\N	G
394	2	17	89	SIBASI SAN MIGUEL	4	12	9	203	D	12	09	D	6	CASA DE SALUD CHAMBALA	S	41209D	1209	\N	\N	G
395	2	17	63	SIBASI SAN MIGUEL	4	12	9	204	U	12	06	U	3	U.de S. CHIRILAGUA	S	41209U	1206	\N	\N	G
396	2	17	90	SIBASI SAN MIGUEL	4	12	10	215	U	12	01	U	3	U.de S. MILAGRO DE LA PAZ	S	41210U	1201	\N	\N	G
397	2	17	89	SIBASI SAN MIGUEL	4	12	11	203	U	12	09	U	3	U.de S. LAS PLACITAS	S	41211U	1209	\N	\N	G
398	2	17	88	SIBASI SAN MIGUEL	4	12	12	202	U	12	05	U	3	U.de S. CHAPELTIQUE	S	41212U	1205	\N	\N	G
399	2	17	87	SIBASI SAN MIGUEL	4	12	14	215	U	12	01	U	3	U.de S. EL ZAMORAN	S	41214U	1201	\N	\N	G
400	2	17	88	SIBASI SAN MIGUEL	4	12	15	217	D	12	15	D	6	CASA DE SALUD EL TABLON	S	41215D	1215	\N	\N	G
401	2	17	87	SIBASI SAN MIGUEL	4	12	15	215	U	12	01	U	3	U.de S. SAN CARLOS (SAN MIGUEL)	S	41215U	1201	\N	\N	G
402	2	17	63	SIBASI SAN MIGUEL	4	12	16	204	D	12	06	D	6	CASA DE SALUD CHILANGUERA	S	41216D	1206	\N	\N	G
403	2	17	64	SIBASI SAN MIGUEL	4	12	16	215	U	12	01	U	3	U.de S. SAN ANTONIO SILVA	S	41216U	1201	\N	\N	G
404	2	17	89	SIBASI SAN MIGUEL	4	12	17	207	U	12	03	U	3	U.de S. EL PLATANAR	S	41217U	1203	\N	\N	G
405	2	17	89	SIBASI SAN MIGUEL	4	12	22	218	U	12	04	U	3	U.de S. ULUAZAPA	S	41222U	1204	\N	\N	G
406	2	17	87	SIBASI SAN MIGUEL	4	12	24	201	U	12	08	U	3	U.de S. COMACARAN	S	41224U	1208	\N	\N	G
407	2	17	63	SIBASI SAN MIGUEL	4	12	25	204	U	12	06	U	3	U.de S. EL CUCO	S	41225U	1206	\N	\N	G
408	2	17	63	SIBASI SAN MIGUEL	4	12	26	204	U	12	06	U	3	U.de S. SAN PEDRO CHIRILAGUA	S	41226U	1206	\N	\N	G
409	2	17	89	SIBASI SAN MIGUEL	4	12	27	210	U	12	07	U	3	U.de S. QUELEPA	S	41227U	1207	\N	\N	G
410	2	17	64	SIBASI SAN MIGUEL	4	12	29	215	U	12	01	U	3	U.de S. EL TECOMATAL	S	41229U	1201	\N	\N	G
411	2	17	89	SIBASI SAN MIGUEL	4	12	30	215	U	12	01	U	3	U.de S. EL NIÑO	S	41230U	1201	\N	\N	G
412	2	17	63	SIBASI SAN MIGUEL	4	12	31	204	U	12	06	U	3	U.de S. TIERRA BLANCA (CHIRILAGUA)	S	41231U	1206	\N	\N	G
413	2	17	89	SIBASI SAN MIGUEL	4	12	32	203	U	12	09	U	3	U.de S. EL JOCOTE DULCE	S	41232U	1209	\N	\N	G
414	2	17	64	SIBASI SAN MIGUEL	4	12	33	215	U	12	01	U	3	U.de S. MARTIN ZALDIVAR COL.CARRILLO	S	41233U	1201	\N	\N	G
415	2	17	89	SIBASI SAN MIGUEL	4	12	34	207	U	12	03	U	3	U.de S. TONGOLONA	S	41234U	1203	\N	\N	G
416	2	17	89	SIBASI SAN MIGUEL	4	12	35	215	U	12	01	U	3	U.de S. MIRAFLORES	S	41235U	1201	\N	\N	G
417	2	17	87	SIBASI SAN MIGUEL	4	14	8	261	U	14	03	U	3	U.de S. YUCUAIQUIN	S	41408U	1403	\N	\N	G
418	2	17	89	SIBASI SAN MIGUEL	4	14	20	260	U	14	04	U	3	U.de S. YAYANTIQUE	S	41420U	1404	\N	\N	G
419	2	17	87	SIBASI SAN MIGUEL	4	12	17	215	D	12	01	D	6	CASA DE SALUD SAN ANTONIO CHAVEZ	S	41217D	1201	\N	\N	G
420	2	17	87	SIBASI SAN MIGUEL	4	12	18	215	D	12	01	D	6	CASA DE SALUD CONCEPCION COROZAL	S	41218D	1201	\N	\N	G
421	2	17	87	SIBASI SAN MIGUEL	4	14	12	261	D	14	03	D	6	CASA DE SALUD LOS HATILLOS (YUCUAIQUIN)	S	41412D	1403	\N	\N	G
422	2	17	89	SIBASI SAN MIGUEL	4	12	37	215	U	12	01	U	3	U.de S. SAN MIGUEL	S	41237U	1201	\N	\N	G
423	2	17	63	SIBASI CIUDAD BARRIOS	4	12	2	200	H	12	02	H	1	HOSPITAL MONSEÑOR OSCAR ARNULFO ROM.C.B.	S	41202H	1202	\N	\N	G
424	2	17	63	SIBASI CIUDAD BARRIOS	4	12	7	212	U	12	19	U	3	U.de S. SAN GERARDO	S	41207U	1219	\N	\N	G
425	2	17	63	SIBASI CIUDAD BARRIOS	4	12	11	212	D	12	19	D	6	CASA DE SALUD LA LAGUNA SAN GERARDO	S	41211D	1219	\N	\N	G
426	2	17	63	SIBASI CIUDAD BARRIOS	4	12	12	212	D	12	19	D	6	CASA DE SALUD SAN JERONIMO (SAN GERARDO	S	41212D	1219	\N	\N	G
427	2	17	63	SIBASI CIUDAD BARRIOS	4	12	18	214	U	12	16	U	3	U.de S. SAN LUIS DE LA REINA	S	41218U	1216	\N	\N	G
428	2	17	63	SIBASI CIUDAD BARRIOS	4	12	20	199	U	12	17	U	3	U.de S. CAROLINA	S	41220U	1217	\N	\N	G
429	2	17	63	SIBASI CIUDAD BARRIOS	4	12	23	211	U	12	20	U	3	U.de S. SAN ANTONIO DEL NORTE	S	41223U	1220	\N	\N	G
430	2	17	63	SIBASI CIUDAD BARRIOS	4	12	19	199	D	12	17	D	6	CASA DE SALUD LA CEIBITA (CAROLINA)	S	41219D	1217	\N	\N	G
431	2	17	63	SIBASI NUEVA GUADALUPE	4	11	2	184	U	11	11	U	3	U.de S. JUCUAPA	S	41102U	1111	\N	\N	G
432	2	17	63	SIBASI NUEVA GUADALUPE	4	11	16	191	U	11	14	U	3	U.de S. LAS CHARCAS (SN.BUENA.)	S	41116U	1114	\N	\N	G
433	2	17	63	SIBASI NUEVA GUADALUPE	4	11	33	191	U	11	14	U	3	U.de S. SAN BUENA VENTURA	S	41133U	1114	\N	\N	G
434	2	17	63	SIBASI NUEVA GUADALUPE	4	12	1	203	U	12	09	U	3	U.de S. CHINAMECA	S	41201U	1209	\N	\N	G
435	2	17	63	SIBASI NUEVA GUADALUPE	4	12	3	208	H	12	10	H	1	HOSPITAL NUEVA GUADALUPE	S	41203H	1210	13.5374	-88.348799999999997	G
436	2	17	63	SIBASI NUEVA GUADALUPE	4	12	6	207	U	12	03	U	3	U.de S. MONCAGUA	S	41206U	1203	\N	\N	G
437	2	17	63	SIBASI NUEVA GUADALUPE	4	12	10	203	D	12	09	D	6	CASA DE SALUD SAN PEDRO ARENALES	S	41210D	1209	\N	\N	G
438	2	17	63	SIBASI NUEVA GUADALUPE	4	12	13	203	D	12	09	D	6	CASA DE SALUD SAN ANTONIO (CHINAMECA)	S	41213D	1209	\N	\N	G
439	2	17	63	SIBASI NUEVA GUADALUPE	4	12	13	206	U	12	13	U	3	U.de S. LOLOTIQUE	S	41213U	1213	\N	\N	G
440	2	17	63	SIBASI NUEVA GUADALUPE	4	12	14	203	D	12	09	D	6	CASA DE SALUD CRUZ SEGUNDA (CHINAMECA)	S	41214D	1209	\N	\N	G
441	2	17	63	SIBASI NUEVA GUADALUPE	4	12	36	203	U	12	09	U	3	U.de S. LAS MARIAS	S	41236U	1209	\N	\N	G
442	2	20	33	SIBASI MORAZAN	4	13	1	240	D	13	22	D	6	CASA DE SALUD EL BARRIAL	S	41301D	1322	\N	\N	G
443	2	20	130	SIBASI MORAZAN	4	13	1	237	H	13	01	H	1	HOSPITAL NACIONAL SAN FRANCISCO GOTERA	S	41301H	1301	\N	\N	G
444	2	20	42	SIBASI MORAZAN	4	13	1	230	U	13	02	U	3	U.de S. JOCORO	S	41301U	1302	\N	\N	G
445	2	20	34	SIBASI MORAZAN	4	13	2	229	D	13	19	D	6	CASA DE SALUD QUEBRACHOS (JOCOAI)	S	41302D	1322	\N	\N	G
446	2	20	45	SIBASI MORAZAN	4	13	2	233	U	13	11	U	3	U.de S. OSICALA	S	41302U	1311	\N	\N	G
447	2	20	39	SIBASI MORAZAN	4	13	3	243	D	13	07	D	6	CASA DE SALUD CIMIENTOS (YAMABAL)	S	41303D	1307	\N	\N	G
448	2	20	41	SIBASI MORAZAN	4	13	3	224	U	13	10	U	3	U.de S. EL DIVISADERO	S	41303U	1310	\N	\N	G
449	2	20	43	SIBASI MORAZAN	4	13	4	241	D	13	06	D	6	CASA DE SALUD EL PEÑON  (SOCIEDAD)	S	41304D	1306	\N	\N	G
450	2	20	44	SIBASI MORAZAN	4	13	4	221	U	13	18	U	3	U.de S. CORINTO	S	41304U	1318	\N	\N	G
451	2	17	63	SIBASI CIUDAD BARRIOS	4	13	5	239	D	13	17	D	6	CASA DE SALUD EL CARRIZAL, (SAN SIMON)	S	41305D	1317	\N	\N	G
452	2	20	33	SIBASI MORAZAN	4	13	5	234	U	13	24	U	3	U.de S. PERQUIN	S	41305U	1324	\N	\N	G
453	2	20	38	SIBASI MORAZAN	4	13	6	222	D	13	05	D	6	CASA DE SALUD LA JOYA  MATAZANO(CHILANG	S	41306D	1305	\N	\N	G
454	2	20	36	SIBASI MORAZAN	4	13	6	220	U	13	13	U	3	U.de S. CACAOPERA	S	41306U	1313	\N	\N	G
455	2	20	47	SIBASI MORAZAN	4	13	7	232	U	13	22	U	3	U.de S. SAN LUIS (MEANGUERA)	S	41307U	1322	\N	\N	G
456	2	20	43	SIBASI MORAZAN	4	13	8	241	U	13	06	U	3	U.de S. SOCIEDAD	S	41308U	1306	\N	\N	G
457	2	20	39	SIBASI MORAZAN	4	13	9	227	U	13	04	U	3	U.de S. GUATAJIAGUA	S	41309U	1304	\N	\N	G
458	2	20	34	SIBASI MORAZAN	4	13	10	229	U	13	19	U	3	U.de S. JOCOITIQUE	S	41310U	1319	\N	\N	G
459	2	20	35	SIBASI MORAZAN	4	13	11	242	U	13	26	U	3	U.de S. TOROLA	S	41311U	1326	\N	\N	G
460	2	20	47	SIBASI MORAZAN	4	13	12	232	U	13	22	U	3	U.de S. MEANGUERA	S	41312U	1322	\N	\N	G
461	2	20	35	SIBASI MORAZAN	4	13	13	236	U	13	25	U	3	U.de S. SAN FERNANDO (MORAZAN)	S	41313U	1325	\N	\N	G
462	2	20	36	SIBASI MORAZAN	4	13	14	228	U	13	21	U	3	U.de S. JOATECA	S	41314U	1321	\N	\N	G
463	2	20	46	SIBASI MORAZAN	4	13	15	239	U	13	17	U	3	U.de S. SAN SIMON	S	41315U	1317	\N	\N	G
464	2	20	37	SIBASI MORAZAN	4	13	16	223	U	13	15	U	3	U.de S. DELICIAS DE CONCEPCION	S	41316U	1315	\N	\N	G
465	2	20	38	SIBASI MORAZAN	4	13	17	222	U	13	05	U	3	U.de S. CHILANGA	S	41317U	1305	\N	\N	G
466	2	20	39	SIBASI MORAZAN	4	13	18	240	U	13	08	U	3	U.de S. SENSEMBRA (YAMABAL)	S	41318U	1308	\N	\N	G
467	2	20	46	SIBASI MORAZAN	4	13	19	238	U	13	12	U	3	U.de S. SAN ISIDRO (MORAZAN)	S	41319U	1312	\N	\N	G
468	2	20	41	SIBASI MORAZAN	4	13	20	235	U	13	03	U	3	U.de S. SAN CARLOS (MORAZAN)	S	41320U	1303	\N	\N	G
469	2	20	34	SIBASI MORAZAN	4	13	21	225	U	13	20	U	3	U.de S. VILLA EL ROSARIO	S	41321U	1320	\N	\N	G
470	2	20	45	SIBASI MORAZAN	4	13	22	226	U	13	16	U	3	U.de S. GUALOCOCTI	S	41322U	1316	\N	\N	G
471	2	20	37	SIBASI MORAZAN	4	13	23	244	U	13	14	U	3	U.de S. YOLOAIQUIN	S	41323U	1314	\N	\N	G
472	2	20	38	SIBASI MORAZAN	4	13	24	231	U	13	09	U	3	U.de S. LOLOTIQUILLO	S	41324U	1309	\N	\N	G
473	2	20	33	SIBASI MORAZAN	4	13	25	219	U	13	23	U	3	U.de S. ARAMBALA	S	41325U	1323	\N	\N	G
474	2	20	39	SIBASI MORAZAN	4	13	7	227	D	13	04	D	6	CASA DE SALUD SAN BARTOLO (GUATAJIAGUA)	S	41307D	1304	\N	\N	G
475	2	20	43	SIBASI MORAZAN	4	13	8	241	D	13	06	D	6	CASA DE SALUD LA JOYA (SOCIEDAD)	S	41308D	1306	\N	\N	G
476	2	20	44	SIBASI MORAZAN	4	13	9	221	D	13	18	D	6	CASA DE SALUD HONDABLE (CORINTO)	S	41309D	1318	\N	\N	G
477	2	20	38	SIBASI MORAZAN	4	13	10	222	D	13	05	D	6	CASA DE SALUD CHAPARRAL (CHILANGA)	S	41310D	1305	\N	\N	G
478	2	20	36	SIBASI MORAZAN	4	13	11	220	D	13	13	D	6	CASA DE SALUD CALAVERA  (CACAOPERA)	S	41311D	1313	\N	\N	G
479	2	20	33	SIBASI MORAZAN	4	13	12	234	D	13	24	D	6	CASA DE SALUD RANCHO QUEMADO (PERQUIN)	S	41312D	1324	\N	\N	G
480	2	20	45	SIBASI MORAZAN	4	13	13	233	D	13	11	D	6	CASA DE SALUD AGUA ZARCA (OSICALA)	S	41313D	1311	\N	\N	G
481	2	21	128	SIBASI LA UNION	4	14	1	252	H	14	01	H	1	HOSPITAL NACIONAL LA UNION	S	41401H	1401	13.337199999999999	-87.839600000000004	G
482	2	21	3	SIBASI LA UNION	4	14	1	252	U	14	01	U	3	U.de S. ENF.ZOILA E.TURCIOS DE JIMENEZ	S	41401U	1401	\N	\N	G
483	2	21	96	SIBASI LA UNION	4	14	2	248	D	14	07	D	6	CASA DE SALUD LAS TUNAS	S	41402D	1407	\N	\N	G
484	2	21	95	SIBASI LA UNION	4	14	3	248	D	14	07	D	6	CASA DE SALUD EL CACAO	S	41403D	1407	\N	\N	G
485	2	21	7	SIBASI LA UNION	4	14	3	257	U	14	02	U	3	U.de S. SAN ALEJO	S	41403U	1402	\N	\N	G
486	2	21	96	SIBASI LA UNION	4	14	4	252	D	14	01	D	6	CASA DE SALUD EL COYOLITO (LA UNION)	S	41404D	1401	\N	\N	G
487	2	21	96	SIBASI LA UNION	4	14	5	251	U	14	08	U	3	U.de S. INTIPUCA	S	41405U	1408	\N	\N	G
488	2	21	95	SIBASI LA UNION	4	14	9	257	D	14	02	D	6	CASA DE SALUD AGUA FRIA (SAN ALEJO)	S	41409D	1402	\N	\N	G
489	2	21	95	SIBASI LA UNION	4	14	9	248	U	14	07	U	3	U.de S. CONCHAGUA	S	41409U	1407	\N	\N	G
490	2	21	7	SIBASI LA UNION	4	14	10	257	D	14	02	D	6	CASA DE SALUD SAN JERONIMO (SAN ALEJO)	S	41410D	1402	\N	\N	G
491	2	21	77	SIBASI LA UNION	4	14	10	262	U	14	10	U	3	U.de S. MEANGUERA DEL GOLFO	S	41410U	1410	\N	\N	G
492	2	21	96	SIBASI LA UNION	4	14	13	248	U	14	07	U	3	U.de S. EL TAMARINDO	S	41413U	1407	\N	\N	G
493	2	21	7	SIBASI LA UNION	4	14	15	249	U	14	06	U	3	U.de S. OLOMEGA (EL CARMEN)	S	41415U	1406	\N	\N	G
494	2	21	3	SIBASI LA UNION	4	14	17	252	U	14	01	U	3	U.de S. ISLA ZACATILLO	S	41417U	1401	\N	\N	G
495	2	21	77	SIBASI LA UNION	4	14	18	262	U	14	10	U	3	U.de S. ISLA CONCHAGUITA (MEANG.D/GOLFO)	S	41418U	1410	\N	\N	G
496	2	21	7	SIBASI LA UNION	4	14	21	249	U	14	06	U	3	U.de S. EL CARMEN LA UNION	S	41421U	1406	\N	\N	G
497	2	21	96	SIBASI LA UNION	4	14	23	252	U	14	01	U	3	U.de S. AGUA CALIENTE(LA UNION)	S	41423U	1401	\N	\N	G
498	2	21	95	SIBASI LA UNION	4	14	24	257	U	14	02	U	3	U.de S. HATO NUEVO (SN. ALEJO)	S	41424U	1402	\N	\N	G
499	2	21	96	SIBASI LA UNION	4	14	25	248	U	14	07	U	3	U.de S. LLANO LOS PATOS	S	41425U	1407	\N	\N	G
500	2	21	3	SIBASI LA UNION	4	14	26	252	U	14	01	U	3	U.de S. AGUA ESCONDIDA	S	41426U	1401	\N	\N	G
501	2	21	95	SIBASI LA UNION	4	14	27	257	U	14	02	U	3	U.de S. BOBADILLA (SAN ALEJO)	S	41427U	1402	\N	\N	G
502	2	21	95	SIBASI LA UNION	4	14	29	248	U	14	07	U	3	U.de S. EL HUISQUIL (CONCHAGUA)	S	41429U	1407	\N	\N	G
503	2	21	3	SIBASI LA UNION	4	14	30	248	U	14	07	U	3	U.de S. EL FARO (CONCHAGUA)	S	41430U	1407	\N	\N	G
504	2	21	7	SIBASI LA UNION	4	14	31	249	U	14	06	U	3	U.de S. EL PICHE	S	41431U	1406	\N	\N	G
505	2	21	3	SIBASI LA UNION	4	14	32	252	U	14	01	U	3	U.de S. LOS LEONES-SN.CARLOS BORROMEO	S	41432U	1401	\N	\N	G
506	2	21	95	SIBASI LA UNION	4	14	2	248	N	14	07	N	7	CRN EL CIPRES	S	41402N	1407	\N	\N	G
507	2	21	3	SIBASI SANTA ROSA	4	14	1	255	D	14	12	D	6	CASA DE SALUD BARRANCONES/PIEDRAS BLAN	S	41401D	1412	\N	\N	G
508	2	21	3	SIBASI SANTA ROSA	4	14	1	253	N	14	18	N	7	CRN EL DERRUMBADO	S	41401N	1418	\N	\N	G
509	2	21	3	SIBASI SANTA ROSA	4	14	2	259	H	14	11	H	1	HOSPITAL NACIONAL SANTA ROSA DE LIMA	S	41402H	1411	13.619400000000001	-87.898899999999998	G
510	2	21	3	SIBASI SANTA ROSA	4	14	2	254	U	14	15	U	3	U.de S. ANA Ma.ALFARO SANCHEZ NVA.ESPART	S	41402U	1415	\N	\N	G
511	2	21	3	SIBASI SANTA ROSA	4	14	4	255	U	14	12	U	3	U.de S. PASAQUINA	S	41404U	1412	\N	\N	G
512	2	21	3	SIBASI SANTA ROSA	4	14	5	250	D	14	14	D	6	CASA DE SALUD EL RINCON (EL SAUCE)	S	41405D	1414	\N	\N	G
513	2	21	3	SIBASI SANTA ROSA	4	14	6	253	D	14	18	U	6	U, de S. EL GUAJINIQUIL (LISLIQUE)	S	41406D	1418	\N	\N	G
514	2	21	3	SIBASI SANTA ROSA	4	14	6	245	U	14	13	U	3	U.de S. ANAMOROS	S	41406U	1413	\N	\N	G
515	2	21	3	SIBASI SANTA ROSA	4	14	7	224	D	13	06	U	6	U.de S. TROMPINA/EL BEJUCAL	S	41407D	1306	\N	\N	G
516	2	21	3	SIBASI SANTA ROSA	4	14	7	250	U	14	14	U	3	U.de S. EL SAUCE	S	41407U	1414	\N	\N	G
517	2	21	3	SIBASI SANTA ROSA	4	14	8	254	D	14	15	D	6	CASA DE SALUD EL TALPETATE	S	41408D	1415	\N	\N	G
518	2	21	3	SIBASI SANTA ROSA	4	14	11	245	D	14	13	D	6	CASA DE SALUD AGUA BLANCA (ANAMOROS)	S	41411D	1413	\N	\N	G
519	2	21	3	SIBASI SANTA ROSA	4	14	11	247	U	14	16	U	3	U.de S. CONCEPCION DE ORIENTE	S	41411U	1416	\N	\N	G
520	2	21	3	SIBASI SANTA ROSA	4	14	12	253	U	14	18	U	3	U.de S. LISLIQUE	S	41412U	1418	\N	\N	G
521	2	21	3	SIBASI SANTA ROSA	4	14	14	254	U	14	15	U	3	U.de S. MONTECA	S	41414U	1415	\N	\N	G
522	2	21	3	SIBASI SANTA ROSA	4	14	16	246	U	14	05	U	3	U.de S. BOLIVAR	S	41416U	1405	\N	\N	G
523	2	21	3	SIBASI SANTA ROSA	4	14	19	256	U	14	17	U	3	U.de S. POLOROS	S	41419U	1417	\N	\N	G
524	2	21	3	SIBASI SANTA ROSA	4	14	22	258	U	14	09	U	3	U.de S. SAN JOSE DE LA FUENTE	S	41422U	1409	\N	\N	G
525	2	21	3	SIBASI SANTA ROSA	4	14	28	255	U	14	12	U	3	U.de S. SAN FELIPE (PASAQUINA)	S	41428U	1412	\N	\N	G
526	6	23	114	SIBASI NORTE	5	6	1	105	D	6	11	D	6	CASA DE SALUD DOS DE MAYO	S	50601D	0611	\N	\N	G
527	6	23	114	SIBASI NORTE	5	6	1	105	N	6	11	N	7	CRN MAPILAPA (NEJAPA)	S	50601N	0611	\N	\N	G
528	6	23	114	SIBASI NORTE	5	6	2	105	D	6	11	D	6	CASA DE SALUD SAN JERONIMO LOS PLANES	S	50602D	0611	\N	\N	G
529	6	23	113	SIBASI NORTE	5	6	3	114	D	6	07	D	6	CASA DE SALUD MALACOFF	S	50603D	0607	\N	\N	G
530	6	23	113	SIBASI NORTE	5	6	4	114	D	6	07	D	6	CASA DE SALUD EL TRANSITO	S	50604D	0607	\N	\N	G
531	6	23	115	SIBASI NORTE	5	6	5	105	D	6	11	D	6	CASA DE SALUD TUTULTEPEQUE	S	50605D	0611	\N	\N	G
532	6	23	115	SIBASI NORTE	5	6	7	124	D	7	15	D	6	CASA DE SALUD LOS RAMIREZ	S	50607D	0715	\N	\N	G
533	6	23	114	SIBASI NORTE	5	6	8	86	D	5	18	D	6	CASA DE SALUD SAN ANTONIO SEGURA	S	50609D	0518	\N	\N	G
534	6	23	114	SIBASI NORTE	5	6	10	101	D	6	13	D\n	6	CASA DE SALUD SAN ANTONIO GRANDE	S	50611D	0613	\N	\N	G
535	6	23	114	SIBASI NORTE	5	6	11	101	D	6	13	D	6	CASA DE SALUD SAN DIEGO	S	50611D	0613	\N	\N	G
536	6	23	114	SIBASI NORTE	5	6	12	101	D	6	13	D	6	CASA DE SALUD LA JOYA (PAISNAL)	S	50612D	0613	\N	\N	G
537	6	23	114	SIBASI NORTE	5	6	13	101	D	6	13	D	6	CASA DE SALUD LA CABAÑA	S	50614D	0613	\N	\N	G
538	6	23	114	SIBASI NORTE	5	6	14	101	D	6	13	D	6	CASA DE SALUD GARCITAS	S	50614D	0613	\N	\N	G
539	6	23	115	SIBASI NORTE	5	6	14	98	U	6	10	U	3	U.de S. APOPA	S	50614U	0610	\N	\N	G
540	6	23	114	SIBASI NORTE	5	6	15	130	D	7	14	D	6	CASA DE SALUD EL TRAPICHITO	S	50608D	0714	\N	\N	G
541	6	23	114	SIBASI NORTE	5	6	17	105	U	6	11	U	3	U.de S. NEJAPA	S	50617U	0611	\N	\N	G
542	6	23	115	SIBASI NORTE	5	6	18	102	U	6	08	U	3	U.de S. GUAZAPA	S	50618U	0608	\N	\N	G
543	6	23	114	SIBASI NORTE	5	6	19	97	U	6	14	U	3	U.de S. AGUILARES	S	50619U	0614	\N	\N	G
544	6	23	113	SIBASI NORTE	5	6	20	114	U	6	07	U	3	U.de S. TONACATEPEQUE	S	50620U	0607	\N	\N	G
545	6	23	114	SIBASI NORTE	5	6	24	130	D	7	14	D	6	CASA DE SALUD COLIMA	S	50624D	0714	\N	\N	G
546	6	23	114	SIBASI NORTE	5	6	25	101	U	6	13	U	3	U.de S. EL PAISNAL	S	50625U	0613	\N	\N	G
547	6	23	113	SIBASI NORTE	5	6	30	114	U	6	07	U	3	U.de S. DISTRITO ITALIA	S	50630U	0607	\N	\N	G
548	6	23	113	SIBASI NORTE	5	6	31	98	U	6	10	U	3	U.de S. POPOTLAN	S	50631U	0610	\N	\N	G
549	6	23	113	SIBASI NORTE	5	6	32	98	U	6	10	U	3	U.de S. CHINTUC	S	50632U	0610	\N	\N	G
550	6	24	60	SIBASI SUR	5	6	1	110	U	6	01	U	3	U.de S. DR.MAURICIO SOL NERIO SN.JAC.	S	50601U	0601	\N	\N	G
551	6	24	61	SIBASI SUR	5	6	3	106	N	6	16	N	7	CRN EL CEDRO (PANCHIMALCO)	S	50603N	0616	\N	\N	G
552	6	24	116	SIBASI SUR	5	6	5	110	H	6	01	H	1	HOSPITAL DR.JOSE A.SALDAÑA (NEUMOLOGICO)	S	50605H	0601	13.648	-89.194500000000005	G
553	6	24	60	SIBASI SUR	5	6	15	108	U	6	19	U	3	U.de S. DR.ROBERTO CACERES B(SN.MARC)	S	50615U	0619	\N	\N	G
554	6	24	61	SIBASI SUR	5	6	16	112	U	6	15	U	3	U.de S. DR.JOSE E.AVALOS LA GUARDIA	S	50616U	0615	\N	\N	G
555	6	24	116	SIBASI SUR	5	6	17	97	D	6	01	D	6	CASA DE SALUD ALTOS DE JARDINES	S	50617D	0601	\N	\N	G
556	6	24	60	SIBASI SUR	5	6	18	111	D	6	17	D	6	CASA DE SALUD JOYA GRANDE	S	50618D	0617	\N	\N	G
557	6	24	61	SIBASI SUR	5	6	19	106	D	6	16	D	6	CASA DE SALUD PANCHIMALQUITO	S	50619D	0616	\N	\N	G
558	6	24	61	SIBASI SUR	5	6	20	107	D	6	16	D	6	CASA DE SALUD EL AMAYON	S	50620D	0616	\N	\N	G
559	6	24	61	SIBASI SUR	5	6	21	107	D	6	18	D	6	CASA DE SALUD LAS BARROSAS	S	50621D	0618	\N	\N	G
560	6	24	60	SIBASI SUR	5	6	21	111	U	6	17	U	3	U.de S. SANTIAGO TEXACUANGO	S	50621U	0617	\N	\N	G
561	6	24	61	SIBASI SUR	5	6	22	107	D	6	18	D	6	CASA DE SALUD PALO GRANDE	S	50622D	0618	\N	\N	G
562	6	24	61	SIBASI SUR	5	6	23	107	D	6	18	D	6	CASA DE SALUD PLAN DEL MANGO	S	50623D	0618	\N	\N	G
563	6	24	61	SIBASI SUR	5	6	24	106	U	6	16	U	3	U.de S. PANCHIMALCO	S	50624U	0616	\N	\N	G
564	6	24	61	SIBASI SUR	5	6	25	106	D	6	16	D	6	CASA DE SALUD SAN ISIDRO	S	50625D	0616	\N	\N	G
565	6	24	61	SIBASI SUR	5	6	26	107	U	6	18	U	3	U.de S. ROSARIO DE MORA	S	50626U	0618	\N	\N	G
566	6	24	61	SIBASI SUR	5	6	34	106	U	6	16	U	3	U.de S. PLANES DE RENDEROS	S	50634U	0616	\N	\N	G
567	6	24	61	SIBASI SUR	5	6	28	112	D	6	15	D	6	CASA DE SALUD INTERCOMUNAL (SANTO TOMAS	S	50628D	0615	\N	\N	G
568	6	25	58	SIBASI SOYAPANGO	5	6	2	99	T	6	03	D	6	CASA DE SALUD CAMPAMENTO MORAZAN	S	50602T	0603	\N	\N	G
569	6	25	140	SIBASI SOYAPANGO	5	6	4	113	H	6	03	H	1	HOSPITAL DR.JOSE MOLINA MARTINEZ (PSIQUIAT.)	S	50604H	0603	13.713800000000001	-89.137900000000002	G
570	6	25	59	SIBASI SOYAPANGO	5	6	11	113	U	6	03	U	3	U.de S. ZOILA M DE GUADRON SOYAPANGO	S	50611U	0603	\N	\N	G
571	6	25	59	SIBASI SOYAPANGO	5	6	22	113	U	6	03	U	3	U.de S. AMATEPEC	S	50622U	0603	\N	\N	G
572	6	25	58	SIBASI SOYAPANGO	5	6	28	113	U	6	03	U	3	U.de S. UNICENTRO	S	50628U	0603	\N	\N	G
573	6	25	58	SIBASI ILOPANGO	5	6	2	105	N	6	09	N	7	CRN CANTON LAS DELICIAS (SAN MARTIN)	S	50602N	0609	\N	\N	G
574	6	25	58	SIBASI ILOPANGO	5	6	4	105	N	6	09	N	7	CRN VALLE LAS DELICIAS	S	50604N	0609	\N	\N	G
575	6	25	58	SIBASI ILOPANGO	5	6	7	103	H	6	12	H	1	HOSPITAL ENF.ANGELICA VIDAL DE NAJARRO	S	50607H	0612	\N	\N	G
576	6	25	58	SIBASI ILOPANGO	5	6	12	103	U	6	12	U	3	U.de S. SANTA LUCIA (ILOPANGO)	S	50612U	0612	\N	\N	G
577	6	25	58	SIBASI ILOPANGO	5	6	13	109	U	6	09	U	3	U.de S. SAN MARTIN	S	50613U	0609	\N	\N	G
578	6	25	58	SIBASI ILOPANGO	5	6	26	109	D	6	09	D	6	CASA DE SALUD CANTON EL SAUCE	S	50626D	0609	\N	\N	G
579	6	25	58	SIBASI ILOPANGO	5	6	27	122	U	7	10	U	3	U.de S. SAN BARTOLOME PERULAPIA	S	50627U	0710	\N	\N	G
580	6	27	48	SIBASI CENTRO	5	6	1	110	O	6	01	C	8	CLINICA DE EMPLEADOS MSPAS	S	50601O	0601	\N	\N	G
581	6	27	49	SIBASI CENTRO	5	6	1	110	T	6	01	D	6	CASA DE SALUD CORO QUIÑONEZ	S	50601T	0601	\N	\N	G
582	6	27	49	SIBASI CENTRO	5	6	2	110	U	6	01	U	3	U.de S. DR.JUAN R.ALVARENGA.SN.MIGUELITO	S	50602U	0601	\N	\N	G
583	6	27	49	SIBASI CENTRO	5	6	3	110	T	6	01	D	6	CASA DE SALUD FINCA SERPA (S.S.)	S	50603T	0601	\N	\N	G
584	6	27	50	SIBASI CENTRO	5	6	3	110	U	6	01	U	3	U.de S. CONCEPCION	S	50603U	0601	\N	\N	G
585	6	27	49	SIBASI CENTRO	5	6	4	115	T	6	04	D	6	CASA DE SALUD SANTA ROSA ATLACATL (C.D)	S	50604T	0604	\N	\N	G
586	6	27	48	SIBASI CENTRO	5	6	4	110	U	6	01	U	3	U.de S. BARRIOS	S	50604U	0601	\N	\N	G
587	6	27	48	SIBASI CENTRO	5	6	5	110	T	6	01	D	6	CASA DE SALUD LAS PALMAS	S	50605T	0601	\N	\N	G
588	6	27	48	SIBASI CENTRO	5	6	5	110	U	6	01	U	3	U.de S. MONSERRAT	S	50605U	0601	\N	\N	G
589	6	27	118	SIBASI CENTRO	5	6	6	99	H	6	02	H	1	HOSPITAL.DR.JUAN JOSE FERNANDEZ ZACAMIL	S	50606H	0602	13.7279	-89.207599999999999	G
590	6	27	50	SIBASI CENTRO	5	6	6	110	U	6	01	U	3	U.de S. LOURDES (SAN SALVADOR)	S	50606U	0601	\N	\N	G
591	6	27	48	SIBASI CENTRO	5	6	7	97	T	6	01	D	6	CASA DE SALUD PAPINI	N	50607T	0601	\N	\N	G
592	6	27	51	SIBASI CENTRO	5	6	7	99	U	6	06	U	3	U.de S. ZACAMIL	S	50607U	0606	\N	\N	G
593	6	27	48	SIBASI CENTRO	5	6	8	110	T	6	01	D	6	CASA DE SALUD LAS LAJAS	N	50608T	0601	\N	\N	G
594	6	27	52	SIBASI CENTRO	5	6	8	104	U	6	02	U	3	U.de S. DR.HUGO MORAN QUIJADA MEJICANOS	S	50608U	0602	\N	\N	G
595	6	27	48	SIBASI CENTRO	5	6	9	110	T	6	01	D	6	CASA DE SALUD BRISAS DE CANDELARIA	S	50609T	0601	\N	\N	G
596	6	27	52	SIBASI CENTRO	5	6	9	100	U	6	05	U	3	U.de S. CUSCATANCINGO	S	50609U	0605	\N	\N	G
597	6	27	49	SIBASI CENTRO	5	6	10	115	U	6	04	U	3	U.de S. CIUDAD DELGADO	S	50610U	0604	\N	\N	G
598	6	27	49	SIBASI CENTRO	5	6	16	115	D	6	04	D	6	CASA DE SALUD CABAÑAS	S	50616D	0604	\N	\N	G
599	6	27	51	SIBASI CENTRO	5	6	23	110	U	6	01	U	3	U.de S. SAN ANTONIO ABAD	S	50623U	0601	\N	\N	G
600	6	27	48	SIBASI CENTRO	5	6	27	110	D	6	01	D	6	CASA DE SALUD EL CARMEN (SAN SALVADOR)	S	50627D	0601	\N	\N	G
601	6	27	49	SIBASI CENTRO	5	6	29	115	U	6	04	U	3	U.de S. HABITAT CONFIEN	S	50629U	0604	\N	\N	G
602	6	27	49	SIBASI CENTRO	5	6	33	100	U	6	05	U	3	U.de S. VILLA MARIONA	S	50633U	0605	\N	\N	G
603	4	9	107	SIBASI SUCHITOTO	3	7	1	130	H	7	14	H	1	HOSPITAL NACIONAL SUCHITOTO	S	30701H	0714	\N	\N	G
604	4	9	107	SIBASI SUCHITOTO	3	7	2	124	U	7	15	U	3	U.de S. SAN JOSE GUAYABAL	S	30702U	0715	\N	\N	G
605	4	9	107	SIBASI SUCHITOTO	3	7	4	125	D	7	02	D	6	CASA DE SALUD CANTON TECOMATEPEQUE	S	30704D	0702	\N	\N	G
606	4	9	107	SIBASI SUCHITOTO	3	7	10	121	U	7	16	U	3	U.de S. ORATORIO DE CONCEPCION	S	30710U	0716	\N	\N	G
667	4	9	107	\N	\N	\N	\N	118	\N	7	\N	D	\N	CASA DE SALUD CANTON SANTA LUCIA	\N	\N	\N	\N	\N	G
608	2	14	80	SIBASI USULUTAN	4	11	12	205	D	12	12	D	6	CASA DE SALUD MOROPALA	S	41112D	1212	\N	\N	G
609	4	13	29	SIBASI SAN VICENTE	3	10	3	172	D	10	01	D	6	CASA DE SALUD PRIMAVERA (SAN VICENTE)	S	31003D	1001	\N	\N	G
610	6	25	58	SIBASI ILOPANGO	5	6	35	114	U	6	07	U	3	U.de S.  ALTA VISTA	S	50635U	0607	\N	\N	G
611	6	27	49	SIBASI CENTRO	5	6	29	110	D	6	01	D	6	CASA DE SALUD NIÑOS DE LA CALLE 2000	S	50629D	0601	\N	\N	G
612	4	9	107	SIBASI COJUTEPEQUE	3	7	13	118	D	7	07	D	6	CASA DE SALUD CANTON SAN SEBASTIAN	S	30713D	0707	\N	\N	G
613	4	12	4	SIBASI SENSUNTEPEQUE	3	9	15	161	D	9	02	D	6	CASA DE SALUD SAN ANTONIO (VICTORIA)	S	30915D	0902	\N	\N	G
614	4	10	25	SIBASI LA PAZ	3	8	13	152	D	8	01	D	6	CASA DE SALUD ESCUINTLA (ZACATECOLUCA)	S	30813D	0801	\N	\N	G
615	4	9	110	SIBASI COJUTEPEQUE	3	7	14	125	D	7	02	D	6	CASA DE SALUD CANTON MIRAFLORES	S	30714D	0702	\N	\N	G
616	4	12	4	SIBASI ILOBASCO	3	9	16	159	D	9	06	D	6	CASA DE SALUD ISNA	S	30916D	0906	\N	\N	G
617	1	5	19	SIBASI SONSONATE	1	3	6	31	D	3	08	D	6	CASA DE SALUD CHORRO ARRIBA (IZALCO)	S	10306D	0308	\N	\N	G
618	1	5	18	SIBASI SONSONATE	1	3	7	32	D	3	14	D	6	CASA DE SALUD BUENOS AIRES (JUAYUA)	S	10307D	0314	\N	\N	G
619	1	5	20	SIBASI SONSONATE	1	3	8	33	D	3	02	D	6	CASA DE SALUD CUSAMALUCO (NAUHIZALCO)	S	10308D	0302	\N	\N	G
620	1	5	19	SIBASI SONSONATE	1	3	9	27	D	3	09	D	6	CASA DE SALUD TRES CEIBAS  (ARMENIA)	S	10309D	0309	\N	\N	G
621	1	5	18	SIBASI SONSONATE	1	3	10	32	D	3	14	D	6	CASA DE SALUD LOS NARANJOS (JUAYUA)	S	10310D	0314	\N	\N	G
622	1	5	18	SIBASI SONSONATE	1	3	11	38	D	3	15	D	6	CASA DE SALUD EL MATAZANO(STA.CATARIN M	S	10311D	0315	\N	\N	G
623	5	8	21	SIBASI LA LIBERTAD	2	5	26	89	D	5	17	D	6	CASA DE SALUD  VILLA TZU-CHI II	S	20526D	0517	\N	\N	G
624	6	24	60	SIBASI SUR	5	6	30	110	D	6	01	D	6	CASA DE SALUD HOG DEL NIÑO S.V. DE PAUL	S	50630D	0601	\N	\N	G
625	6	24	60	SIBASI SUR	5	6	31	110	D	6	01	D	6	CASA DE SALUD CIPI	S	50631D	0601	\N	\N	G
626	4	13	29	SIBASI SAN VICENTE	3	10	21	172	I	10	01	I	8	UNIDAD DEL ISSS SAN VICENTE	S	31021I	1001	\N	\N	G
627	1	2	13	SIBASI METAPAN	\N	\N	\N	19	\N	2	\N	U	\N	U.de S. METAPAN	\N	\N	\N	\N	\N	G
628	2	21	3	\N	\N	\N	\N	254	\N	14	\N	D	\N	CASA DE SALUD LAS MARIAS	\N	\N	\N	\N	\N	G
629	1	1	1	\N	\N	\N	\N	1	\N	1	\N	U	\N	U.de S. ANEXO HOSPITAL AHUACHAPAN	\N	\N	\N	\N	\N	G
630	2	21	3	\N	\N	\N	\N	253	\N	14	\N	O	\N	ONG  FUSAL LISLIQUE	\N	\N	\N	\N	\N	G
631	2	21	3	\N	\N	\N	\N	252	\N	14	\N	D	\N	CASA DE SALUD EL JICARO	\N	\N	\N	\N	\N	G
632	2	21	3	\N	\N	\N	\N	252	\N	14	\N	D	\N	CASA DE SALUD PUEBLO VIEJO	\N	\N	\N	\N	\N	G
633	5	8	22	\N	\N	\N	\N	77	\N	5	\N	A	\N	CAE LA LIBERTAD	\N	\N	\N	\N	\N	G
634	1	5	20	\N	\N	\N	\N	40	\N	3	\N	U	\N	U.de S. SONSONATE	\N	\N	\N	\N	\N	G
732	1	2	13	\N	\N	\N	\N	18	\N	2	\N	O	\N	ONG ASAPROSAR MASAHUAT	\N	\N	\N	\N	\N	G
730	5	8	24	\N	\N	\N	\N	94	\N	5	\N	U	\N	U.de S. TEOTEPEQUE	\N	\N	\N	\N	\N	G
740	4	12	5	\N	\N	\N	\N	160	\N	9	\N	O	\N	ONG FUSAL TEJUTEPEQUE	\N	\N	\N	\N	\N	G
737	2	17	88	\N	\N	\N	\N	227	\N	13	\N	O	\N	ONG FUSAL GUATAJIAGUA - CHAPELTIQUE	\N	\N	\N	\N	\N	G
743	2	14	79	\N	\N	\N	\N	189	\N	11	\N	U	\N	U.de S. ESPIRITU SANTO	\N	\N	\N	\N	\N	G
738	2	17	63	\N	\N	\N	\N	227	\N	13	\N	O	\N	ONG FUSAL GUATAJIAGUA (C.BARRIOS)	\N	\N	\N	\N	\N	G
739	4	12	6	\N	\N	\N	\N	154	\N	9	\N	O	\N	ONG FUSAL CINQUERA	\N	\N	\N	\N	\N	G
742	4	12	6	\N	\N	\N	\N	157	\N	9	\N	O	\N	ONG FUSAL CAROLINA - JUTIAPA	\N	\N	\N	\N	\N	G
635	4	10	27	\N	\N	\N	\N	136	\N	8	\N	D	\N	CASA DE SALUD MONTELIMAR	\N	\N	\N	\N	\N	G
636	2	17	63	\N	\N	\N	\N	204	\N	12	\N	D	\N	CASA DE SALUD LLANO LAS ROSAS	\N	\N	\N	\N	\N	G
642	2	20	35	\N	\N	\N	\N	242	\N	13	\N	O	\N	ONG CALMA TOROLA	\N	\N	\N	\N	\N	G
643	2	20	35	\N	\N	\N	\N	236	\N	13	\N	O	\N	ONG CALMA SAN FERNANDO (MOR)	\N	\N	\N	\N	\N	G
644	2	20	34	\N	\N	\N	\N	229	\N	13	\N	O	\N	ONG CALMA JOCOAITIQUE	\N	\N	\N	\N	\N	G
645	2	20	39	\N	\N	\N	\N	227	\N	13	\N	O	\N	ONG FUSAL GUATAJIAGUA (MORAZAN)	\N	\N	\N	\N	\N	G
646	2	20	39	\N	\N	\N	\N	240	\N	13	\N	O	\N	ONG FUSAL SENSEMBRA	\N	\N	\N	\N	\N	G
647	2	20	39	\N	\N	\N	\N	243	\N	13	\N	O	\N	ONG FUSAL YAMABAL	\N	\N	\N	\N	\N	G
648	2	20	46	\N	\N	\N	\N	238	\N	13	\N	O	\N	ONG FUSAL SAN ISIDRO	\N	\N	\N	\N	\N	G
649	2	20	45	\N	\N	\N	\N	226	\N	13	\N	O	\N	ONG FUSAL GUALOCOCTI	\N	\N	\N	\N	\N	G
650	2	20	36	\N	\N	\N	\N	228	\N	13	\N	O	\N	ONG FUSAL JOATECA	\N	\N	\N	\N	\N	G
651	2	17	63	\N	\N	\N	\N	260	\N	14	\N	O	\N	ONG FUNDEMUN YAYANTIQUE	\N	\N	\N	\N	\N	G
652	2	17	64	\N	\N	\N	\N	215	\N	12	\N	O	\N	ONG FUSAL SAN ANTONIO SILVA	\N	\N	\N	\N	\N	G
653	2	17	63	\N	\N	\N	\N	211	\N	12	\N	O	\N	ONG FUSAL SAN ANTONIO DEL NORTE	\N	\N	\N	\N	\N	G
654	2	17	63	\N	\N	\N	\N	199	\N	12	\N	O	\N	ONG FUSAL CAROLINA	\N	\N	\N	\N	\N	G
655	2	20	46	\N	\N	\N	\N	239	\N	13	\N	O	\N	ONG AMS SAN SIMON	\N	\N	\N	\N	\N	G
656	5	6	119	\N	\N	\N	\N	45	\N	4	\N	O	\N	ONG FUSAL CITALA	\N	\N	\N	\N	\N	G
657	5	6	119	\N	\N	\N	\N	53	\N	4	\N	O	\N	ONG FUSAL LA PALMA	\N	\N	\N	\N	\N	G
658	5	6	119	\N	\N	\N	\N	66	\N	4	\N	O	\N	ONG FUNDEMUN SAN IGNACIO	\N	\N	\N	\N	\N	G
659	5	6	119	\N	\N	\N	\N	66	\N	4	\N	O	\N	ONG FUNDEMUN LAS PILAS	\N	\N	\N	\N	\N	G
660	5	6	119	\N	\N	\N	\N	54	\N	4	\N	O	\N	ONG FUNDEMUN LA REINA	\N	\N	\N	\N	\N	G
661	1	2	13	\N	\N	\N	\N	19	\N	2	\N	D	\N	CASA DE SALUD LA JOYA (METAPAN)	\N	\N	\N	\N	\N	G
662	1	2	13	\N	\N	\N	\N	19	\N	2	\N	D	\N	CASA DE SALUD SAN MIGUEL INGENIO	\N	\N	\N	\N	\N	G
663	5	6	119	\N	\N	\N	\N	57	\N	4	\N	U	\N	U.de S. NUEVA CONCEPCION	\N	\N	\N	\N	\N	G
736	1	2	15	\N	\N	\N	\N	18	\N	2	\N	O	\N	ONG ASAPROSAR MASHUAT- GUARNECIA	\N	\N	\N	\N	\N	G
664	5	6	70	\N	\N	\N	\N	48	\N	4	\N	U	\N	U.de S. CHALATENANGO	\N	\N	\N	\N	\N	G
741	4	12	6	\N	\N	\N	\N	157	\N	9	\N	O	\N	ONG FUSAL JUTIAPA	\N	\N	\N	\N	\N	G
733	1	2	13	\N	\N	\N	\N	23	\N	2	\N	O	\N	ONG ASAPROSAR SANTA ROSA GUACHIPILIN	\N	\N	\N	\N	\N	G
665	2	21	3	\N	\N	\N	\N	256	\N	14	\N	D	\N	CASA DE SALUD BOQUIN	\N	\N	\N	\N	\N	G
735	1	2	17	\N	\N	\N	\N	24	\N	2	\N	O	\N	ONG ASAPROSAR SANTIAGO LA FRONTERA	\N	\N	\N	\N	\N	G
731	5	6	74	\N	\N	\N	\N	63	\N	4	\N	O	\N	ONG CALMA SAN FERNANDO (CHA)	\N	\N	\N	\N	\N	G
734	2	21	3	\N	\N	\N	\N	258	\N	14	\N	O	\N	ONG FUNDEMUN SAN JOSE LA FUENTE	\N	\N	\N	\N	\N	G
666	1	5	19	\N	\N	\N	\N	37	\N	3	\N	D	\N	CASA DE SALUD CENTRO MATERNO SAN JULIAN	\N	\N	\N	\N	\N	G
668	4	9	110	\N	\N	\N	\N	125	\N	7	\N	D	\N	CASA DE SALUD SAN AGUSTIN	\N	\N	\N	\N	\N	G
669	5	6	73	\N	\N	\N	\N	43	\N	4	\N	O	\N	ONG CIRES  ARCATAO	\N	\N	\N	\N	\N	G
670	5	6	73	\N	\N	\N	\N	58	\N	4	\N	O	\N	ONG CIRES NUEVA TRINIDAD	\N	\N	\N	\N	\N	G
671	5	6	73	\N	\N	\N	\N	69	\N	4	\N	O	\N	ONG CIRES  SAN JOSE LAS FLORES	\N	\N	\N	\N	\N	G
672	1	1	10	\N	\N	\N	\N	11	\N	1	\N	O	\N	OP CALMA TACUBA	\N	\N	\N	\N	\N	G
673	1	1	12	\N	\N	\N	\N	7	\N	1	\N	O	\N	OP CALMA JUJUTLA	\N	\N	\N	\N	\N	G
674	1	1	12	\N	\N	\N	\N	6	\N	1	\N	O	\N	OP CALMA GUAYMANGO	\N	\N	\N	\N	\N	G
675	1	1	10	\N	\N	\N	\N	4	\N	1	\N	O	\N	OP CALMA CONCEPCION DE ATACO	\N	\N	\N	\N	\N	G
676	1	1	12	\N	\N	\N	\N	10	\N	1	\N	O	\N	OP CALMA SAN PEDRO PUXTLA	\N	\N	\N	\N	\N	G
677	1	1	10	\N	\N	\N	\N	1	\N	1	\N	O	\N	OP ASAPROSAR AHUACHAPAN	\N	\N	\N	\N	\N	G
678	1	1	11	\N	\N	\N	\N	12	\N	1	\N	O	\N	OP ASAPROSAR TURIN	\N	\N	\N	\N	\N	G
679	1	1	1	\N	\N	\N	\N	8	\N	1	\N	O	\N	OP CALMA  SAN FRANC. MEN.(HACHADURA)	\N	\N	\N	\N	\N	G
680	1	1	10	\N	\N	\N	\N	1	\N	1	\N	O	\N	OP ASAPROSAR  AHUACH. (LAS CHINAMA	\N	\N	\N	\N	\N	G
681	1	1	11	\N	\N	\N	\N	3	\N	1	\N	O	\N	OP ASAPROSAR  ATIQUIZAYA	\N	\N	\N	\N	\N	G
682	1	1	11	\N	\N	\N	\N	9	\N	1	\N	O	\N	OP ASAPROSAR  SAN LORENZO	\N	\N	\N	\N	\N	G
683	1	1	12	\N	\N	\N	\N	8	\N	1	\N	O	\N	OP SERAPHIN SN.FRCO.MENEND.CARA S	\N	\N	\N	\N	\N	G
684	1	1	11	\N	\N	\N	\N	5	\N	1	\N	O	\N	OP SERAPHIN  EL REFUGIO	\N	\N	\N	\N	\N	G
685	1	1	12	\N	\N	\N	\N	7	\N	1	\N	O	\N	OP SERAPHIN JUJUTLA BARRA DE SANT.	\N	\N	\N	\N	\N	G
686	1	1	12	\N	\N	\N	\N	7	\N	1	\N	O	\N	OP SERAPHIN JUJUTLA GUAYAPA ABAJO	\N	\N	\N	\N	\N	G
687	1	1	11	\N	\N	\N	\N	3	\N	1	\N	O	\N	OP SERAPHIN ATIQUIZAYA	\N	\N	\N	\N	\N	G
688	1	1	12	\N	\N	\N	\N	7	\N	1	\N	O	\N	OP SERAPHIN JUJUTLA	\N	\N	\N	\N	\N	G
689	1	1	1	\N	\N	\N	\N	8	\N	1	\N	O	\N	OP SERAPHIN SN.FRCO.MENENDEZ HACHAD	\N	\N	\N	\N	\N	G
690	1	1	12	\N	\N	\N	\N	7	\N	1	\N	O	\N	OP CALMA JUJUTLA GUAYAPA ABAJO	\N	\N	\N	\N	\N	G
691	1	1	12	\N	\N	\N	\N	7	\N	1	\N	B	\N	OP, CALMA JUJUTLA SN.JOSE EL NARAJ	\N	\N	\N	\N	\N	G
692	1	1	12	\N	\N	\N	\N	7	\N	1	\N	O	\N	OP ASAPROSAR JUJUTLA GUAYAPA ABAJ	\N	\N	\N	\N	\N	G
693	1	1	12	\N	\N	\N	\N	7	\N	1	\N	O	\N	OP ASAPROSAR  JUJUTLA SN.JOSE EL NAR	\N	\N	\N	\N	\N	G
694	1	5	18	\N	\N	\N	\N	33	\N	3	\N	O	\N	OP FUSAL  NAHUIZALCO	\N	\N	\N	\N	\N	G
695	1	5	18	\N	\N	\N	\N	32	\N	3	\N	O	\N	OP FUSAL JUAYUA	\N	\N	\N	\N	\N	G
696	1	5	18	\N	\N	\N	\N	33	\N	3	\N	O	\N	OP SERAPHIN NAHUIZALCO	\N	\N	\N	\N	\N	G
697	1	5	18	\N	\N	\N	\N	32	\N	3	\N	O	\N	OP SERAPHIN JUAYUA	\N	\N	\N	\N	\N	G
698	1	5	20	\N	\N	\N	\N	36	\N	3	\N	O	\N	OP CALMA  SAN ANTONIO DEL MONTE	\N	\N	\N	\N	\N	G
699	1	5	18	\N	\N	\N	\N	33	\N	3	\N	O	\N	OP CALMA NAHUIZALCO	\N	\N	\N	\N	\N	G
700	1	5	20	\N	\N	\N	\N	39	\N	3	\N	O	\N	OP CALMA SANTO DOMINGO DE GUZMAN	\N	\N	\N	\N	\N	G
701	1	5	18	\N	\N	\N	\N	38	\N	3	\N	O	\N	OP CALMA SANTA CATARINA MASAHUAT	\N	\N	\N	\N	\N	G
702	1	5	20	\N	\N	\N	\N	26	\N	3	\N	O	\N	OP ASAPROSAR  ACAJUTLA	\N	\N	\N	\N	\N	G
703	1	5	20	\N	\N	\N	\N	40	\N	3	\N	O	\N	OP SERAPHIN SONSONATE	\N	\N	\N	\N	\N	G
704	1	5	19	\N	\N	\N	\N	31	\N	3	\N	O	\N	OP SERAPHIN  IZALCO	\N	\N	\N	\N	\N	G
705	1	5	20	\N	\N	\N	\N	36	\N	3	\N	O	\N	OP SERAPHIN SAN ANTONIO DEL MONTE	\N	\N	\N	\N	\N	G
706	1	5	20	\N	\N	\N	\N	34	\N	3	\N	O	\N	OP SERAPHIN NAHUILINGO	\N	\N	\N	\N	\N	G
707	1	5	19	\N	\N	\N	\N	31	\N	3	\N	O	\N	OP FUSAL IZALCO	\N	\N	\N	\N	\N	G
708	1	5	20	\N	\N	\N	\N	40	\N	3	\N	O	\N	OP SERAPHIN SONSONATE (SALINAS AYAC	\N	\N	\N	\N	\N	G
709	1	5	19	\N	\N	\N	\N	30	\N	3	\N	O	\N	OP SERAPHIN SANTA ISABEL ISHUATAN	\N	\N	\N	\N	\N	G
710	1	5	19	\N	\N	\N	\N	29	\N	3	\N	O	\N	OP SERAPHIN CUISNAHUAT	\N	\N	\N	\N	\N	G
711	1	5	19	\N	\N	\N	\N	37	\N	3	\N	O	\N	OP SERAPHIN SAN JULIAN	\N	\N	\N	\N	\N	G
712	1	5	19	\N	\N	\N	\N	28	\N	3	\N	O	\N	OP SERAPHIN CALUCO	\N	\N	\N	\N	\N	G
713	1	5	20	\N	\N	\N	\N	40	\N	3	\N	O	\N	OP CALMA SONSONATE	\N	\N	\N	\N	\N	G
714	5	6	74	\N	\N	\N	\N	72	\N	4	\N	O	\N	ONG CALMA  SAN RAFAEL	\N	\N	\N	\N	\N	G
715	5	6	71	\N	\N	\N	\N	66	\N	4	\N	O	\N	ONG CALMA SANTA RITA	\N	\N	\N	\N	\N	G
716	5	6	74	\N	\N	\N	\N	49	\N	4	\N	O	\N	ONG CALMA DULCE NOMBRE DE MARIA	\N	\N	\N	\N	\N	G
717	5	6	74	\N	\N	\N	\N	65	\N	4	\N	O	\N	ONG CALMA SAN FRANCISCO MORAZAN	\N	\N	\N	\N	\N	G
718	5	6	71	\N	\N	\N	\N	59	\N	4	\N	O	\N	ONG FUNDEMUN  OJOS DE AGUA	\N	\N	\N	\N	\N	G
719	5	6	71	\N	\N	\N	\N	55	\N	4	\N	O	\N	ONG FUNDEMUN LAS VUELTAS	\N	\N	\N	\N	\N	G
720	5	6	70	\N	\N	\N	\N	62	\N	4	\N	O	\N	ONG FUNDEMUN SAN ANTONIO LOS RANCH	\N	\N	\N	\N	\N	G
721	5	6	71	\N	\N	\N	\N	52	\N	4	\N	O	\N	ONG FUNDEMUN LA LAGUNA	\N	\N	\N	\N	\N	G
722	5	6	71	\N	\N	\N	\N	46	\N	4	\N	O	\N	ONG FUNDEMUN COMALAPA	\N	\N	\N	\N	\N	G
723	5	6	70	\N	\N	\N	\N	71	\N	4	\N	O	\N	ONG FUNDEMUN SAN MIGUEL DE MERCEDE	\N	\N	\N	\N	\N	G
724	5	6	72	\N	\N	\N	\N	56	\N	4	\N	O	\N	ONG CALMA  NOMBRE DE JESUS	\N	\N	\N	\N	\N	G
725	5	6	72	\N	\N	\N	\N	61	\N	4	\N	O	\N	ONG CALMA SAN ANTONIO LA CRUZ	\N	\N	\N	\N	\N	G
726	5	6	71	\N	\N	\N	\N	50	\N	4	\N	O	\N	ONG FUNDEMUN EL CARRIZAL	\N	\N	\N	\N	\N	G
727	5	6	72	\N	\N	\N	\N	42	\N	4	\N	O	\N	ONG CALMA  SAN ISIDRO LABRADOR	\N	\N	\N	\N	\N	G
728	5	6	75	\N	\N	\N	\N	60	\N	4	\N	O	\N	ONG CALMA POTONICO	\N	\N	\N	\N	\N	G
729	5	6	72	\N	\N	\N	\N	68	\N	4	\N	O	\N	ONG CALMA SAN JOSE CANCASQUE	\N	\N	\N	\N	\N	G
744	4	10	25	\N	\N	\N	\N	150	\N	8	\N	O	\N	ONG CIDECO NUESTRA SEÑORA DE LOURDES	\N	\N	\N	\N	\N	G
745	4	10	25	\N	\N	\N	\N	147	\N	8	\N	C	\N	CLINICA INMACULADA CONCEPCION	\N	\N	\N	\N	\N	G
746	1	2	136	\N	\N	\N	\N	22	\N	2	\N	I	\N	HOSPITAL SANTA ANA (ISSS)	\N	\N	\N	\N	\N	G
747	1	5	142	\N	\N	\N	\N	40	\N	3	\N	I	\N	HOSPITAL SONSONATE (ISSS)	\N	\N	\N	\N	\N	G
748	2	17	133	\N	\N	\N	\N	215	\N	12	\N	I	\N	HOSPITAL SAN MIGUEL (ISSS)	\N	\N	\N	\N	\N	G
749	6	27	118	\N	\N	\N	\N	110	\N	6	\N	I	\N	HOSPITAL MATERNO INFANTIL (ISSS)	\N	\N	\N	\N	\N	G
750	6	24	116	\N	\N	\N	\N	110	\N	6	\N	I	\N	HOSPITAL NEUMOLOGICO (ISSS)	\N	\N	\N	\N	\N	G
751	6	27	118	\N	\N	\N	\N	110	\N	6	\N	I	\N	HOSPITAL MEDICO QUIRURGICO (ISSS)	\N	\N	\N	\N	\N	G
752	6	25	140	\N	\N	\N	\N	113	\N	6	\N	I	\N	HOSPITAL AMATEPEC (ISSS)	\N	\N	\N	\N	\N	G
753	6	27	118	\N	\N	\N	\N	110	\N	6	\N	I	\N	HOSPITAL ROMA (ISSS)	\N	\N	\N	\N	\N	G
754	6	27	118	\N	\N	\N	\N	110	\N	6	\N	I	\N	HOSPITAL ESPECIALIDADES (GENERAL) ISSS	\N	\N	\N	\N	\N	G
755	6	27	118	\N	\N	\N	\N	110	\N	6	\N	I	\N	HOSPITAL ONCOLOGICO (ISSS)	\N	\N	\N	\N	\N	G
756	2	21	3	\N	\N	\N	\N	259	\N	14	\N	U	\N	U.de S. PERIFERICA SANTA ROSA DE LIMA	\N	\N	\N	\N	\N	G
757	5	8	21	\N	\N	\N	\N	85	\N	5	\N	O	\N	ONG INTERVIDA (LA LIBERTAD)	\N	\N	\N	\N	\N	G
758	6	23	113	\N	\N	\N	\N	98	\N	6	\N	A	\N	CAE APOPA	\N	\N	\N	\N	\N	G
759	2	20	33	\N	\N	\N	\N	238	\N	13	\N	O	\N	ONG AMS SAN ISIDRO	\N	\N	\N	\N	\N	G
760	2	20	33	\N	\N	\N	\N	226	\N	13	\N	O	\N	ONG AMS GUALOCOCTI	\N	\N	\N	\N	\N	G
761	2	20	33	\N	\N	\N	\N	222	\N	13	\N	O	\N	ONG AMS CHILANGA	\N	\N	\N	\N	\N	G
762	2	20	33	\N	\N	\N	\N	221	\N	13	\N	O	\N	ONG AMS CORINTO	\N	\N	\N	\N	\N	G
763	2	20	33	\N	\N	\N	\N	231	\N	13	\N	O	\N	ONG AMS LOLOTIQUILLO	\N	\N	\N	\N	\N	G
764	4	12	4	\N	\N	\N	\N	161	\N	9	\N	O	\N	ONG FUSAL SANTA MARTA	\N	\N	\N	\N	\N	G
765	4	12	4	\N	\N	\N	\N	162	\N	9	\N	O	\N	ONG FUSAL DOLORES	\N	\N	\N	\N	\N	G
766	4	12	4	\N	\N	\N	\N	209	\N	12	\N	O	\N	ONG FUSAL NUEVO EDEN	\N	\N	\N	\N	\N	G
767	2	20	33	\N	\N	\N	\N	227	\N	13	\N	O	\N	ONG CALMA GUATAJIAGUA	\N	\N	\N	\N	\N	G
768	2	20	33	\N	\N	\N	\N	240	\N	13	\N	O	\N	ONG CALMA SEMSENBRA	\N	\N	\N	\N	\N	G
769	2	20	33	\N	\N	\N	\N	243	\N	13	\N	O	\N	ONG  CALMA YAMABAL	\N	\N	\N	\N	\N	G
770	2	20	33	\N	\N	\N	\N	219	\N	13	\N	O	\N	ONG CALMA ARAMBALA	\N	\N	\N	\N	\N	G
771	2	20	33	\N	\N	\N	\N	228	\N	13	\N	O	\N	ONG CALMA JOATECA	\N	\N	\N	\N	\N	G
772	2	20	33	\N	\N	\N	\N	225	\N	13	\N	O	\N	ONG CALMA VILLA EL ROSARIO	\N	\N	\N	\N	\N	G
773	2	21	3	\N	\N	\N	\N	253	\N	14	\N	O	\N	ONG FUNDEMUN LISLIQUE	\N	\N	\N	\N	\N	G
774	5	6	73	\N	\N	\N	\N	43	\N	4	\N	O	\N	ONG CALMA ARCATAO	\N	\N	\N	\N	\N	G
775	5	6	73	\N	\N	\N	\N	58	\N	4	\N	O	\N	ONG CALMA NUEVA TRINIDAD	\N	\N	\N	\N	\N	G
776	5	6	73	\N	\N	\N	\N	69	\N	4	\N	O	\N	ONG CALMA SAN JOSE LAS FLORES	\N	\N	\N	\N	\N	G
777	5	6	70	\N	\N	\N	\N	62	\N	4	\N	O	\N	ONG CALMA SAN ANTONIO LOS RANCHOS	\N	\N	\N	\N	\N	G
778	2	17	63	\N	\N	\N	\N	217	\N	12	\N	O	\N	ONG ASAPROSAR SESORI	\N	\N	\N	\N	\N	G
779	2	17	63	\N	\N	\N	\N	200	\N	12	\N	O	\N	ONG ASAPROSAR CIUDAD BARRIOS	\N	\N	\N	\N	\N	G
780	5	6	70	\N	\N	\N	\N	71	\N	4	\N	O	\N	ONG CALMA SAN MIGUEL DE MERCEDES	\N	\N	\N	\N	\N	G
781	5	6	70	\N	\N	\N	\N	55	\N	4	\N	O	\N	ONG CALMA LAS VUELTAS	\N	\N	\N	\N	\N	G
782	5	6	71	\N	\N	\N	\N	59	\N	4	\N	O	\N	ONG  CALMA SAN JOSE OJOS DE AGUA	\N	\N	\N	\N	\N	G
783	5	6	71	\N	\N	\N	\N	50	\N	4	\N	O	\N	ONG CALMA EL CARRIZAL	\N	\N	\N	\N	\N	G
784	5	6	71	\N	\N	\N	\N	52	\N	4	\N	O	\N	ONG CALMA LA LAGUNA	\N	\N	\N	\N	\N	G
785	5	6	71	\N	\N	\N	\N	46	\N	4	\N	O	\N	ONG CALMA COMALAPA	\N	\N	\N	\N	\N	G
786	5	6	71	\N	\N	\N	\N	50	\N	4	\N	O	\N	ONG CALMA VAINILLAS	\N	\N	\N	\N	\N	G
787	2	17	89	\N	\N	\N	\N	260	\N	14	\N	O	\N	ONG FUNDEMUN YAYANTIQUE-SN.ANTONIO SILVA	\N	\N	\N	\N	\N	G
788	2	17	63	\N	\N	\N	\N	212	\N	12	\N	O	\N	ONG FUSAL SAN GERARDO	\N	\N	\N	\N	\N	G
789	2	17	89	\N	\N	\N	\N	239	\N	13	\N	O	\N	ONG FUSA SAN SIMON	\N	\N	\N	\N	\N	G
790	2	17	63	\N	\N	\N	\N	227	\N	13	\N	O	\N	ONG ASAPROSAR GUATAJIAGUA-CIUDAD BARRIOS	\N	\N	\N	\N	\N	G
791	5	6	119	\N	\N	\N	\N	45	\N	4	\N	O	\N	ONG SERAPHIM CITALA	\N	\N	\N	\N	\N	G
792	5	6	119	\N	\N	\N	\N	53	\N	4	\N	O	\N	ONG SERAPHIM LA PALMA	\N	\N	\N	\N	\N	G
793	5	6	119	\N	\N	\N	\N	66	\N	4	\N	O	\N	ONG SERAPHIM SAN IGNACIO	\N	\N	\N	\N	\N	G
794	5	6	119	\N	\N	\N	\N	54	\N	4	\N	O	\N	ONG SERAPHIM LA REINA	\N	\N	\N	\N	\N	G
795	5	6	119	\N	\N	\N	\N	66	\N	4	\N	O	\N	ONG SERAPHIM LAS PILAS	\N	\N	\N	\N	\N	G
796	6	23	114	\N	\N	\N	\N	114	\N	6	\N	Z	\N	CENTRO PENAL DE READAPTACION DE MENORES	\N	\N	\N	\N	\N	G
797	6	27	118	\N	\N	\N	\N	110	\N	6	\N	M	\N	HOSPITAL MILITAR SAN SALVADOR	\N	\N	\N	\N	\N	G
798	4	10	25	\N	\N	\N	\N	152	\N	8	\N	I	\N	CLINICA COMUNAL ZACATECOLUCA (ISSS)	\N	\N	\N	\N	\N	G
799	2	17	63	\N	\N	\N	\N	202	\N	12	\N	O	\N	ONG CALMA GUATAJIAGUA-CHAPELTIQUE	\N	\N	\N	\N	\N	G
800	2	21	3	\N	\N	\N	\N	248	\N	14	\N	D	\N	CASA DE SALUD AMAPALITA (EL FARO)	\N	\N	\N	\N	\N	G
801	2	21	3	\N	\N	\N	\N	254	\N	14	\N	D	\N	CASA DE SALUD UPIRE FOSALUD	\N	\N	\N	\N	\N	G
802	6	25	58	\N	\N	\N	\N	109	\N	6	\N	A	\N	CAE SAN MARTIN	\N	\N	\N	\N	\N	G
803	5	6	119	\N	\N	\N	\N	48	\N	4	\N	I	\N	UNIDAD MEDICA CHALATENANGO (ISSS)	\N	\N	\N	\N	\N	G
804	5	8	126	\N	\N	\N	\N	83	\N	5	\N	I	\N	UNIDAD MEDICA LA LIBERTAD (ISSS)	\N	\N	\N	\N	\N	G
805	5	8	126	\N	\N	\N	\N	86	\N	5	\N	I	\N	UNIDAD MEDICA QUEZALTEPEQUE	\N	\N	\N	\N	\N	G
806	5	8	126	\N	\N	\N	\N	85	\N	5	\N	I	\N	UNIDAD MEDICA SANTA TECLA	\N	\N	\N	\N	\N	G
807	5	8	126	\N	\N	\N	\N	75	\N	5	\N	I	\N	CLINICA COMUNAL ANTIGUO CUSCATLAN	\N	\N	\N	\N	\N	G
808	5	8	126	\N	\N	\N	\N	85	\N	5	\N	I	\N	CLINICA COMUNAL SAN ANTONIO	\N	\N	\N	\N	\N	G
809	5	8	126	\N	\N	\N	\N	85	\N	5	\N	I	\N	CLINICA COMUNAL SANTA MONICA	\N	\N	\N	\N	\N	G
810	5	8	126	\N	\N	\N	\N	75	\N	5	\N	I	\N	CLINICA MEDICA MERLIOT	\N	\N	\N	\N	\N	G
811	5	8	126	\N	\N	\N	\N	77	\N	5	\N	I	\N	CLINICA COMUNAL LOURDES	\N	\N	\N	\N	\N	G
812	5	8	126	\N	\N	\N	\N	89	\N	5	\N	I	\N	CLINICA COMUNAL SITIO DEL NIÑO	\N	\N	\N	\N	\N	G
813	5	8	126	\N	\N	\N	\N	87	\N	5	\N	I	\N	CLINICA COMUNAL ATEOS	\N	\N	\N	\N	\N	G
814	4	12	4	\N	\N	\N	\N	161	\N	9	\N	O	\N	ONG FUSAL VICTORIA	\N	\N	\N	\N	\N	G
815	2	20	39	\N	\N	\N	\N	243	\N	13	\N	U	\N	U.de S. SAN JUAN DE LA CRUZ YAMABAL	\N	\N	\N	\N	\N	G
816	2	20	33	\N	\N	\N	\N	234	\N	13	\N	U	\N	U.de S. RANCHO QUEMADO  FOSALUD	\N	\N	\N	\N	\N	G
817	6	23	113	\N	\N	\N	\N	101	\N	6	\N	C	\N	CLINICA MUNICIPAL DEL PAISNAL	\N	\N	\N	\N	\N	G
818	2	21	3	\N	\N	\N	\N	253	\N	14	\N	O	\N	ONG FUNDEMUN GUAJINIQUIL/LISLIQUE	\N	\N	\N	\N	\N	G
819	2	17	63	\N	\N	\N	\N	200	\N	12	\N	U	\N	U.de S. PERIFERICA CIUDAD BARRIOS	\N	\N	\N	\N	\N	G
820	4	9	107	\N	\N	\N	\N	117	\N	7	\N	U	\N	U.de S. PERIFERICA DE COJUTEPEQUE	\N	\N	\N	\N	\N	G
821	2	20	33	\N	\N	\N	\N	211	\N	12	\N	O	\N	ONG CALMA SAN ATONIO DEL MOSCO-TOROLA	\N	\N	\N	\N	\N	G
822	2	21	3	\N	\N	\N	\N	259	\N	14	\N	D	\N	CASA DE SALUD EL AMATILLO	\N	\N	\N	\N	\N	G
823	2	21	3	\N	\N	\N	\N	252	\N	14	\N	D	\N	CASA DE SALUD LOMA LARGA	\N	\N	\N	\N	\N	G
824	2	17	63	\N	\N	\N	\N	199	\N	12	\N	V	\N	CENTRO DE S,  VILASECA, COL.CDAD. PACIF.	\N	\N	\N	\N	\N	G
825	4	10	25	\N	\N	\N	\N	146	\N	8	\N	V	\N	CLINICA PRIVADA SAN JUDAS TADEO	\N	\N	\N	\N	\N	G
826	1	5	18	\N	\N	\N	\N	41	\N	3	\N	V	\N	HOSPITAL DE DESNUTRICION DE AGAPE	\N	\N	\N	\N	\N	G
827	6	27	48	\N	\N	\N	\N	110	\N	6	\N	U	\N	UNIDAD MOVIL 1 FOSALUD	\N	\N	\N	\N	\N	G
828	6	27	48	\N	\N	\N	\N	110	\N	6	\N	U	\N	UNIDAD MOVIL 2 FOSALUD	\N	\N	\N	\N	\N	G
829	5	8	21	\N	\N	\N	\N	78	\N	5	\N	U	\N	UNIDAD MOVIL 3 FOSALUD	\N	\N	\N	\N	\N	G
830	5	8	21	\N	\N	\N	\N	85	\N	5	\N	U	\N	UNIDAD MOVIL 4 FOSALUD	\N	\N	\N	\N	\N	G
831	6	27	48	\N	\N	\N	\N	110	\N	6	\N	U	\N	UNIDAD MOVIL 5 FOSALUD	\N	\N	\N	\N	\N	G
833	1	2	13	\N	\N	\N	\N	22	\N	2	\N	R	\N	CENTRO REHABILITACION OCCIDENTE	\N	\N	\N	\N	\N	G
834	2	17	63	\N	\N	\N	\N	215	\N	12	\N	R	\N	CENTRO REHABILITACION INTEGRAL ORIENTE	\N	\N	\N	\N	\N	G
835	6	24	116	\N	\N	\N	\N	110	\N	6	\N	R	\N	APARATO LOCOMOTOR	\N	\N	\N	\N	\N	G
836	6	27	48	\N	\N	\N	\N	110	\N	6	\N	R	\N	AUDICION Y LENGUAJE	\N	\N	\N	\N	\N	G
837	6	24	116	\N	\N	\N	\N	110	\N	6	\N	R	\N	ATENCION A ANCIANOS SARA ZALDIVAR	\N	\N	\N	\N	\N	G
838	6	27	48	\N	\N	\N	\N	110	\N	6	\N	R	\N	REHABILITACION DE CIEGOS EUGENIA DUEÑAS	\N	\N	\N	\N	\N	G
839	6	27	48	\N	\N	\N	\N	110	\N	6	\N	R	\N	REHABILITACION INTEGRAL NIÑEZ Y ADOLESCE	\N	\N	\N	\N	\N	G
840	6	27	48	\N	\N	\N	\N	110	\N	6	\N	R	\N	CONSULTA EXTERNA Y GERIATRICA	\N	\N	\N	\N	\N	G
841	4	12	4	\N	\N	\N	\N	156	\N	9	\N	O	\N	ONG ASAPROSAR SAN FRANCISCO DEL MONTE	\N	\N	\N	\N	\N	G
842	4	12	4	\N	\N	\N	\N	156	\N	9	\N	O	\N	ONG ASAPROSAR SANTA LUCIA	\N	\N	\N	\N	\N	G
843	4	12	4	\N	\N	\N	\N	156	\N	9	\N	O	\N	ONG ASAPROSAR ILOBASCO	\N	\N	\N	\N	\N	G
844	6	27	48	\N	\N	\N	\N	110	\N	6	\N	C	\N	INSTITUTO DEL CANCER	\N	\N	\N	\N	\N	G
845	6	27	48	\N	\N	\N	\N	110	\N	6	\N	O	\N	FUDEM	\N	\N	\N	\N	\N	G
846	5	6	119	\N	\N	\N	\N	47	\N	4	\N	O	\N	ONG CALMA CONCEPCION QUEZALTEPEQUE	\N	\N	\N	\N	\N	G
847	1	2	13	\N	\N	\N	\N	17	\N	2	\N	O	\N	ONG ASAPROSAR EL PORVENIR	\N	\N	\N	\N	\N	G
848	5	6	119	\N	\N	\N	\N	42	\N	4	\N	O	\N	ONG SERAPHIM AGUA CALIENTE	\N	\N	\N	\N	\N	G
849	4	10	25	\N	\N	\N	\N	153	\N	8	\N	D	\N	CASA DE SALUD ISLA COLORADA	\N	\N	\N	\N	\N	G
850	4	10	25	\N	\N	\N	\N	153	\N	8	\N	D	\N	CASA DE SALUD ISLA SAN RAFAEL TASAJERA	\N	\N	\N	\N	\N	G
851	4	10	25	\N	\N	\N	\N	153	\N	8	\N	D	\N	CASA DE SALUD EL CHINGO	\N	\N	\N	\N	\N	G
853	1	1	1	\N	\N	\N	\N	2	\N	1	\N	O	\N	ONG LIBRAS DE AMOR APANECA	\N	\N	\N	\N	\N	G
854	1	1	1	\N	\N	\N	\N	4	\N	1	\N	O	\N	ONG LIBRAS DE AMOR ATACO	\N	\N	\N	\N	\N	G
855	1	1	1	\N	\N	\N	\N	6	\N	1	\N	O	\N	ONG LIBRAS DE AMOR GUAYMANGO	\N	\N	\N	\N	\N	G
856	1	2	2	\N	\N	\N	\N	22	\N	2	\N	O	\N	ONG LIBRAS DE AMOR SAN MIGUELITO	\N	\N	\N	\N	\N	G
857	1	2	2	\N	\N	\N	\N	22	\N	2	\N	O	\N	ONG LIBRAS DE AMOR TOMAS PINEDA MARTINEZ	\N	\N	\N	\N	\N	G
858	1	2	2	\N	\N	\N	\N	22	\N	2	\N	O	\N	ONG LIBRAS DE AMOR EL PALMAR	\N	\N	\N	\N	\N	G
859	1	2	2	\N	\N	\N	\N	16	\N	2	\N	O	\N	ONG LIBRAS DE AMOR EL CONGO	\N	\N	\N	\N	\N	G
860	1	2	2	\N	\N	\N	\N	22	\N	2	\N	O	\N	ONG LIBRAS DE AMOR SANTA LUCIA	\N	\N	\N	\N	\N	G
861	1	2	2	\N	\N	\N	\N	22	\N	2	\N	O	\N	ONG LIBRAS DE AMOR PLANES DE LA LAGUNA	\N	\N	\N	\N	\N	G
862	1	5	18	\N	\N	\N	\N	37	\N	3	\N	O	\N	ONG LIBRAS DE AMOR SAN JULIAN (LUIS POMA	\N	\N	\N	\N	\N	G
863	1	2	2	\N	\N	\N	\N	15	\N	2	\N	O	\N	ONG ASPS  CHALCHUAPA	\N	\N	\N	\N	\N	G
864	2	21	3	\N	\N	\N	\N	248	\N	14	\N	D	\N	CASA DE SALUD CONCHAGUA LU EL PILON	\N	\N	\N	\N	\N	G
865	2	21	3	\N	\N	\N	\N	255	\N	14	\N	D	\N	CS PASAQUINA LU "RAUL NAPOLEON CHICAS"	\N	\N	\N	\N	\N	G
867	4	13	29	\N	\N	\N	\N	172	\N	10	\N	U	\N	BMSALVADOREÑA-CUBANA	\N	\N	\N	\N	\N	G
868	6	27	51	\N	\N	\N	\N	99	\N	6	\N	P	\N	UNIDAD MEDICA ISSS ZACAMIL 	\N	\N	\N	\N	\N	G
869	2	14	79	\N	\N	\N	\N	183	\N	11	\N	L	\N	UCSFE  Jiquilisco US Bajo Lempa "Salud Renal"	\N	\N	\N	\N	\N	G
870	5	8	21	\N	\N	\N	\N	77	\N	5	\N	U	\N	U.de S. COLON LL "EL BOTONCILLAL"	\N	\N	\N	\N	\N	G
871	4	10	25	\N	\N	\N	\N	152	\N	8	\N	Z	\N	Centro Penal de Maxima Seguridad	\N	\N	\N	\N	\N	G
872	1	5	18	\N	\N	\N	\N	31	\N	3	\N	D	\N	CS Izalco Sonsonate San Isidro	\N	\N	\N	\N	\N	G
873	2	21	3	\N	\N	\N	\N	252	\N	14	\N	G	\N	OSI La Union LU Puerto de la Union	\N	\N	\N	\N	\N	G
874	2	21	3	\N	\N	\N	\N	252	\N	14	\N	U	\N	U. de S. La Playa	\N	\N	\N	\N	\N	G
876	1	1	1	\N	\N	\N	\N	1	\N	1	\N	G	\N	OSI Francisco Menendez AH Frontera La Hachadura	\N	\N	\N	\N	\N	G
877	1	1	1	\N	\N	\N	\N	1	\N	1	\N	G	\N	OSI Ahuachapan AH Frontera Las Chinamas	\N	\N	\N	\N	\N	G
878	1	2	2	\N	\N	\N	\N	13	\N	2	\N	G	\N	OSI Candelaria de La Frontera SA Frontera San Cristobal	\N	\N	\N	\N	\N	G
879	1	2	2	\N	\N	\N	\N	19	\N	2	\N	G	\N	OSI Metapan SA Frontera Anguiatu	\N	\N	\N	\N	\N	G
880	5	6	119	\N	\N	\N	\N	45	\N	4	\N	G	\N	OSI Citala CH Frontera el Poy	\N	\N	\N	\N	\N	G
881	2	21	3	\N	\N	\N	\N	255	\N	14	\N	G	\N	OSI Pasaquina LU Frontera el Amatillo	\N	\N	\N	\N	\N	G
882	1	5	18	\N	\N	\N	\N	26	\N	3	\N	G	\N	OSI Acajutla SO Puerto	\N	\N	\N	\N	\N	G
883	5	6	119	\N	\N	\N	\N	48	\N	4	\N	L	\N	UCSFE Chalatenango CH Guarjila	\N	\N	\N	\N	\N	G
884	5	6	119	\N	\N	\N	\N	45	\N	4	\N	J	\N	UCSF Citala CH	\N	\N	\N	\N	\N	G
885	5	6	119	\N	\N	\N	\N	45	\N	4	\N	J	\N	UCSF Cítala CH San Ramon	\N	\N	\N	\N	\N	G
886	5	6	119	\N	\N	\N	\N	53	\N	4	\N	L	\N	UCSFE La Palma CH	\N	\N	\N	\N	\N	G
887	5	6	119	\N	\N	\N	\N	53	\N	4	\N	J	\N	UCSF La Palma CH Horcones	\N	\N	\N	\N	\N	G
888	5	6	119	\N	\N	\N	\N	53	\N	4	\N	J	\N	UCSF La Plama CH San José Sacare	\N	\N	\N	\N	\N	G
889	5	6	119	\N	\N	\N	\N	53	\N	4	\N	J	\N	UCSF La Palma CH Granadillas	\N	\N	\N	\N	\N	G
890	5	6	119	\N	\N	\N	\N	66	\N	4	\N	J	\N	UCSF San Ignacio CH	\N	\N	\N	\N	\N	G
891	5	6	119	\N	\N	\N	\N	66	\N	4	\N	J	\N	UCSF San Ignacio CH El Carmen	\N	\N	\N	\N	\N	G
892	5	6	119	\N	\N	\N	\N	66	\N	4	\N	J	\N	UCSF San Ignacio CH Las Pilas	\N	\N	\N	\N	\N	G
893	5	6	119	\N	\N	\N	\N	54	\N	4	\N	J	\N	UCSF La Reina CH	\N	\N	\N	\N	\N	G
894	5	6	119	\N	\N	\N	\N	54	\N	4	\N	J	\N	UCSF La Reina CH El Pepeto	\N	\N	\N	\N	\N	G
895	5	6	119	\N	\N	\N	\N	54	\N	4	\N	J	\N	UCSF La Reina CH El Tigre	\N	\N	\N	\N	\N	G
896	5	6	119	\N	\N	\N	\N	43	\N	4	\N	J	\N	UCSF Arcatao CH	\N	\N	\N	\N	\N	G
897	5	6	119	\N	\N	\N	\N	58	\N	4	\N	J	\N	UCSF Nueva Trinidad CH	\N	\N	\N	\N	\N	G
898	5	6	119	\N	\N	\N	\N	69	\N	4	\N	J	\N	UCSFSan Jose Las Flores CH	\N	\N	\N	\N	\N	G
899	5	6	119	\N	\N	\N	\N	56	\N	4	\N	J	\N	UCSF Nombre de Jesus CH	\N	\N	\N	\N	\N	G
900	5	6	119	\N	\N	\N	\N	56	\N	4	\N	J	\N	UCSF Nombre de Jesus CH Junquillo	\N	\N	\N	\N	\N	G
901	5	6	119	\N	\N	\N	\N	61	\N	4	\N	J	\N	UCSF San Antonio de la Cruz CH	\N	\N	\N	\N	\N	G
902	5	6	119	\N	\N	\N	\N	67	\N	4	\N	J	\N	UCSF San Isidro Labrador CH	\N	\N	\N	\N	\N	G
903	5	6	119	\N	\N	\N	\N	68	\N	4	\N	J	\N	UCSF San José Cancasque CH	\N	\N	\N	\N	\N	G
904	5	6	119	\N	\N	\N	\N	60	\N	4	\N	J	\N	UCSF Potonico CH	\N	\N	\N	\N	\N	G
905	5	6	119	\N	\N	\N	\N	62	\N	4	\N	J	\N	UCSF San Antonio los Ranchos CH	\N	\N	\N	\N	\N	G
906	5	6	119	\N	\N	\N	\N	71	\N	4	\N	J	\N	UCSF San Miguel de Mercedes CH	\N	\N	\N	\N	\N	G
907	5	6	119	\N	\N	\N	\N	55	\N	4	\N	J	\N	UCSF Las Vueltas CH	\N	\N	\N	\N	\N	G
908	5	6	119	\N	\N	\N	\N	59	\N	4	\N	J	\N	UCSF Ojos de Agua CH	\N	\N	\N	\N	\N	G
909	5	6	119	\N	\N	\N	\N	59	\N	4	\N	J	\N	UCSF Ojos de Agua CH El Zapotal	\N	\N	\N	\N	\N	G
910	5	6	119	\N	\N	\N	\N	50	\N	4	\N	J	\N	UCSF El Carrizal CH	\N	\N	\N	\N	\N	G
911	5	6	119	\N	\N	\N	\N	50	\N	4	\N	J	\N	UCSF El Carrizal CH Vanillas	\N	\N	\N	\N	\N	G
912	5	6	119	\N	\N	\N	\N	52	\N	4	\N	J	\N	UCSF La Laguna CH	\N	\N	\N	\N	\N	G
913	5	6	119	\N	\N	\N	\N	52	\N	4	\N	J	\N	UCSF La Laguna CH San Jose	\N	\N	\N	\N	\N	G
914	5	6	119	\N	\N	\N	\N	46	\N	4	\N	J	\N	UCSF Comalapa CH	\N	\N	\N	\N	\N	G
915	5	6	119	\N	\N	\N	\N	46	\N	4	\N	J	\N	UCSF Comalapa CH Guachipilín	\N	\N	\N	\N	\N	G
916	5	6	119	\N	\N	\N	\N	49	\N	4	\N	J	\N	UCSF Dulce Nombre de Maria CH	\N	\N	\N	\N	\N	G
917	5	6	119	\N	\N	\N	\N	49	\N	4	\N	J	\N	UCSF Dulce Nombre de Maria CH Ocotal	\N	\N	\N	\N	\N	G
918	5	6	119	\N	\N	\N	\N	49	\N	4	\N	J	\N	UCSF Dulce Nombre de Maria CH Gutierrez	\N	\N	\N	\N	\N	G
919	5	6	119	\N	\N	\N	\N	72	\N	4	\N	J	\N	UCSF San Rafael CH	\N	\N	\N	\N	\N	G
920	5	6	119	\N	\N	\N	\N	73	\N	4	\N	J	\N	UCSF Santa Rita CH	\N	\N	\N	\N	\N	G
921	5	6	119	\N	\N	\N	\N	72	\N	4	\N	J	\N	UCSF San Rafael CH San Jose Los Sitios	\N	\N	\N	\N	\N	G
922	5	6	119	\N	\N	\N	\N	73	\N	4	\N	J	\N	UCSF Santa Rita CH El Sol	\N	\N	\N	\N	\N	G
923	5	6	119	\N	\N	\N	\N	63	\N	4	\N	J	\N	UCSF San Fernando CH	\N	\N	\N	\N	\N	G
924	5	6	119	\N	\N	\N	\N	47	\N	4	\N	J	\N	UCSF Concepción Quezaltepeque	\N	\N	\N	\N	\N	G
925	5	6	119	\N	\N	\N	\N	47	\N	4	\N	J	\N	UCSF Concepción Quezaltepeque CH Llano Grande	\N	\N	\N	\N	\N	G
926	5	6	119	\N	\N	\N	\N	47	\N	4	\N	J	\N	UCSF Concepción Quezaltepeque CH Monte Redondo	\N	\N	\N	\N	\N	G
927	5	6	119	\N	\N	\N	\N	42	\N	4	\N	J	\N	UCSF Agua Caliente CH	\N	\N	\N	\N	\N	G
928	5	6	119	\N	\N	\N	\N	42	\N	4	\N	J	\N	UCSF Agua Caliente CH El Carmen	\N	\N	\N	\N	\N	G
929	5	6	119	\N	\N	\N	\N	42	\N	4	\N	J	\N	UCSF Agua Caliente CH Cerro Grande	\N	\N	\N	\N	\N	G
930	5	6	119	\N	\N	\N	\N	42	\N	4	\N	J	\N	UCSF Agua Caliente CH Obrajuelo	\N	\N	\N	\N	\N	G
931	5	6	119	\N	\N	\N	\N	70	\N	4	\N	J	\N	UCSF San Luis del Carmen CH	\N	\N	\N	\N	\N	G
932	5	6	119	\N	\N	\N	\N	65	\N	4	\N	J	\N	UCSF San Francisco Morazan CH	\N	\N	\N	\N	\N	G
933	4	12	4	\N	\N	\N	\N	156	\N	9	\N	L	\N	UCSFE Ilobasco CA	\N	\N	\N	\N	\N	G
934	4	12	4	\N	\N	\N	\N	159	\N	9	\N	L	\N	UCSFE Sensuntepeque CA	\N	\N	\N	\N	\N	G
935	4	12	4	\N	\N	\N	\N	209	\N	12	\N	J	\N	UCSF Nuevo Eden de San juan SM	\N	\N	\N	\N	\N	G
936	4	12	4	\N	\N	\N	\N	209	\N	12	\N	J	\N	UCSF Nuevo Eden de San Juan SM San Sebastian	\N	\N	\N	\N	\N	G
937	4	12	4	\N	\N	\N	\N	156	\N	9	\N	J	\N	UCSF Ilobasco CA San Jose	\N	\N	\N	\N	\N	G
938	4	12	4	\N	\N	\N	\N	156	\N	9	\N	J	\N	UCSF Ilobasco CA Agua Zarca	\N	\N	\N	\N	\N	G
939	4	12	4	\N	\N	\N	\N	156	\N	9	\N	J	\N	UCSF Ilobasco CA Cerro Colorado	\N	\N	\N	\N	\N	G
940	4	12	4	\N	\N	\N	\N	156	\N	9	\N	J	\N	UCSF Ilobasco CA San Francisco Iraheta	\N	\N	\N	\N	\N	G
941	4	12	4	\N	\N	\N	\N	156	\N	9	\N	J	\N	UCSF Ilobasco CA Potreros	\N	\N	\N	\N	\N	G
942	4	12	4	\N	\N	\N	\N	156	\N	9	\N	J	\N	UCSF Ilobasco CA Los Llanitos	\N	\N	\N	\N	\N	G
943	4	12	4	\N	\N	\N	\N	156	\N	9	\N	J	\N	UCSF Ilobasco CA Huertas	\N	\N	\N	\N	\N	G
944	4	12	4	\N	\N	\N	\N	156	\N	9	\N	J	\N	UCSF Ilobasco CA Sitio Viejo	\N	\N	\N	\N	\N	G
945	4	12	4	\N	\N	\N	\N	156	\N	9	\N	J	\N	UCSF Ilobasco CA  Maquilishuat Santa Lucia	\N	\N	\N	\N	\N	G
946	4	12	4	\N	\N	\N	\N	156	\N	9	\N	J	\N	UCSF Ilobasco CA Maquilishuat  El Limón	\N	\N	\N	\N	\N	G
947	4	12	4	\N	\N	\N	\N	156	\N	9	\N	J	\N	UCSF Ilobasco CA San Francisco del Monte	\N	\N	\N	\N	\N	G
948	4	12	4	\N	\N	\N	\N	157	\N	9	\N	J	\N	UCSF Jutiapa CA	\N	\N	\N	\N	\N	G
949	4	12	4	\N	\N	\N	\N	154	\N	9	\N	J	\N	UCSF Cinquera CA	\N	\N	\N	\N	\N	G
950	4	12	4	\N	\N	\N	\N	157	\N	9	\N	J	\N	UCSF Jutiapa CA Carolina	\N	\N	\N	\N	\N	G
951	4	12	4	\N	\N	\N	\N	160	\N	9	\N	J	\N	UCSF Tejutepeque CA	\N	\N	\N	\N	\N	G
952	4	12	4	\N	\N	\N	\N	160	\N	9	\N	J	\N	UCSF Tejutepeque CA Concepción	\N	\N	\N	\N	\N	G
953	4	12	4	\N	\N	\N	\N	160	\N	9	\N	J	\N	UCSF Tejutepeque CA El Zapote	\N	\N	\N	\N	\N	G
954	4	12	4	\N	\N	\N	\N	161	\N	9	\N	J	\N	UCSF Victoria CA	\N	\N	\N	\N	\N	G
955	4	12	4	\N	\N	\N	\N	161	\N	9	\N	J	\N	UCSF Victoria CA Azacualpa	\N	\N	\N	\N	\N	G
956	4	12	4	\N	\N	\N	\N	161	\N	9	\N	J	\N	UCSF Victoria CA SanAntonio	\N	\N	\N	\N	\N	G
957	4	12	4	\N	\N	\N	\N	161	\N	9	\N	J	\N	UCSF Victoria CA Santa Marta	\N	\N	\N	\N	\N	G
958	4	12	4	\N	\N	\N	\N	162	\N	9	\N	J	\N	UCSF Dolores CA	\N	\N	\N	\N	\N	G
959	4	12	4	\N	\N	\N	\N	161	\N	9	\N	J	\N	UCSF Victoria CA San Pedro	\N	\N	\N	\N	\N	G
960	4	12	4	\N	\N	\N	\N	162	\N	9	\N	J	\N	UCSF Dolores CA San Carlos	\N	\N	\N	\N	\N	G
961	2	17	63	\N	\N	\N	\N	211	\N	12	\N	J	\N	UCSF San Antonio SM	\N	\N	\N	\N	\N	G
962	2	17	63	\N	\N	\N	\N	199	\N	12	\N	J	\N	UCSF Carolina SM 1	\N	\N	\N	\N	\N	G
963	2	17	63	\N	\N	\N	\N	199	\N	12	\N	J	\N	UCSF Carolina SM La Ceibita	\N	\N	\N	\N	\N	G
964	2	17	63	\N	\N	\N	\N	199	\N	12	\N	J	\N	UCSF Carolina SM Rosa Nacaspilo	\N	\N	\N	\N	\N	G
965	2	17	63	\N	\N	\N	\N	212	\N	12	\N	J	\N	UCSF San Gerardo SM San Jeronimo	\N	\N	\N	\N	\N	G
966	2	17	63	\N	\N	\N	\N	212	\N	12	\N	J	\N	UCSF San Gerardo SM 1	\N	\N	\N	\N	\N	G
967	2	20	33	\N	\N	\N	\N	227	\N	13	\N	J	\N	UCSF Guatajiagua MO 1	\N	\N	\N	\N	\N	G
968	2	20	33	\N	\N	\N	\N	227	\N	13	\N	J	\N	UCSF Guatajiagua MO 2	\N	\N	\N	\N	\N	G
969	2	20	33	\N	\N	\N	\N	227	\N	13	\N	J	\N	UCSF Guatajiagua MO Maiguera	\N	\N	\N	\N	\N	G
970	2	20	33	\N	\N	\N	\N	227	\N	13	\N	J	\N	UCSF Guatajiagua MO San Bartolo	\N	\N	\N	\N	\N	G
971	2	20	33	\N	\N	\N	\N	227	\N	13	\N	J	\N	UCSF Guatajiagua MO Los Abelines	\N	\N	\N	\N	\N	G
972	2	20	33	\N	\N	\N	\N	240	\N	13	\N	J	\N	UCSF Sensembra MO	\N	\N	\N	\N	\N	G
973	2	20	33	\N	\N	\N	\N	243	\N	13	\N	J	\N	UCSF Yamabal MO San Juan de La Cruz	\N	\N	\N	\N	\N	G
974	2	20	33	\N	\N	\N	\N	243	\N	13	\N	J	\N	UCSF Yamabal MO Isletas	\N	\N	\N	\N	\N	G
975	2	20	33	\N	\N	\N	\N	242	\N	13	\N	J	\N	UCSF Torola MO	\N	\N	\N	\N	\N	G
976	2	20	33	\N	\N	\N	\N	236	\N	13	\N	J	\N	UCSF San Fernando MO	\N	\N	\N	\N	\N	G
977	2	20	33	\N	\N	\N	\N	229	\N	13	\N	J	\N	UCSF Jocoaitique MO	\N	\N	\N	\N	\N	G
978	2	20	33	\N	\N	\N	\N	229	\N	13	\N	J	\N	UCSF Jocoaitique MO Quebrachos	\N	\N	\N	\N	\N	G
979	2	20	33	\N	\N	\N	\N	219	\N	13	\N	J	\N	UCSF Arambala MO	\N	\N	\N	\N	\N	G
980	2	20	33	\N	\N	\N	\N	228	\N	13	\N	J	\N	UCSF Joateca MO	\N	\N	\N	\N	\N	G
981	2	20	33	\N	\N	\N	\N	228	\N	13	\N	J	\N	UCSF Joateca MO La Laguna	\N	\N	\N	\N	\N	G
982	2	20	33	\N	\N	\N	\N	225	\N	13	\N	J	\N	UCSF  El Rosario MO	\N	\N	\N	\N	\N	G
983	2	20	33	\N	\N	\N	\N	238	\N	13	\N	J	\N	UCSF San Isidro MO	\N	\N	\N	\N	\N	G
984	2	20	33	\N	\N	\N	\N	239	\N	13	\N	J	\N	UCSF San Simón MO 3	\N	\N	\N	\N	\N	G
985	2	20	33	\N	\N	\N	\N	239	\N	13	\N	J	\N	UCSF San Simón MO Potrero Adentro	\N	\N	\N	\N	\N	G
986	2	17	63	\N	\N	\N	\N	239	\N	13	\N	J	\N	UCSF San Simón MO El Carrizal 1	\N	\N	\N	\N	\N	G
987	2	17	63	\N	\N	\N	\N	239	\N	13	\N	J	\N	UCSF San Simón MO Las Quebradas	\N	\N	\N	\N	\N	G
988	2	20	33	\N	\N	\N	\N	226	\N	13	\N	J	\N	UCSF Gualococti MO	\N	\N	\N	\N	\N	G
989	2	20	33	\N	\N	\N	\N	223	\N	13	\N	J	\N	UCSF Delicias de Concepción MO 1	\N	\N	\N	\N	\N	G
990	2	20	33	\N	\N	\N	\N	223	\N	13	\N	J	\N	UCSF Delicias de Concepción MO El Volcan	\N	\N	\N	\N	\N	G
991	2	20	33	\N	\N	\N	\N	222	\N	13	\N	J	\N	UCSF Chilanga MO 1	\N	\N	\N	\N	\N	G
992	2	20	33	\N	\N	\N	\N	222	\N	13	\N	J	\N	UCSF Chilanga MO Las Crucitas	\N	\N	\N	\N	\N	G
993	2	20	33	\N	\N	\N	\N	222	\N	13	\N	J	\N	UCSF Chilanga MO Piedra Parada	\N	\N	\N	\N	\N	G
994	2	20	33	\N	\N	\N	\N	221	\N	13	\N	J	\N	UCSF Corinto MO 1	\N	\N	\N	\N	\N	G
995	2	20	33	\N	\N	\N	\N	221	\N	13	\N	J	\N	UCSF Corinto MO 2	\N	\N	\N	\N	\N	G
996	2	20	33	\N	\N	\N	\N	221	\N	13	\N	J	\N	UCSF Corinto MO Corralito San Francisco	\N	\N	\N	\N	\N	G
1088	2	14	79	\N	\N	\N	\N	198	\N	11	\N	U	\N	U.de S. Usulutan US	\N	\N	\N	\N	\N	G
997	2	20	33	\N	\N	\N	\N	221	\N	13	\N	J	\N	UCSF Corinto MO San Felipe Los Villatoro	\N	\N	\N	\N	\N	G
998	2	20	33	\N	\N	\N	\N	221	\N	13	\N	J	\N	UCSF Corinto MO La Hermita	\N	\N	\N	\N	\N	G
999	2	20	33	\N	\N	\N	\N	231	\N	13	\N	J	\N	UCSF Lolotiquillo MO	\N	\N	\N	\N	\N	G
1000	2	20	33	\N	\N	\N	\N	231	\N	13	\N	J	\N	UCSF Lolotiquillo MO Gualindo	\N	\N	\N	\N	\N	G
1001	2	20	33	\N	\N	\N	\N	220	\N	13	\N	J	\N	UCSF Cacaopera MO	\N	\N	\N	\N	\N	G
1002	2	20	33	\N	\N	\N	\N	220	\N	13	\N	J	\N	UCSF Cacaopera MO La Estancia	\N	\N	\N	\N	\N	G
1003	2	20	33	\N	\N	\N	\N	220	\N	13	\N	J	\N	UCSF Cacaopera MO Agua Blanca	\N	\N	\N	\N	\N	G
1004	2	20	33	\N	\N	\N	\N	220	\N	13	\N	J	\N	UCSF Cacaopera MO Sunsulaca	\N	\N	\N	\N	\N	G
1005	2	21	3	\N	\N	\N	\N	253	\N	14	\N	J	\N	UCSF Lislique LU	\N	\N	\N	\N	\N	G
1006	2	21	3	\N	\N	\N	\N	253	\N	14	\N	J	\N	UCSF Lislique LU Pilas	\N	\N	\N	\N	\N	G
1007	2	21	3	\N	\N	\N	\N	253	\N	14	\N	J	\N	UCSF Lislique LU El Derrumbado	\N	\N	\N	\N	\N	G
1008	2	21	3	\N	\N	\N	\N	253	\N	14	\N	J	\N	UCSF Lislique LU Higueras	\N	\N	\N	\N	\N	G
1009	2	21	3	\N	\N	\N	\N	253	\N	14	\N	J	\N	UCSF Lislique LU Guajiniquil	\N	\N	\N	\N	\N	G
1010	2	21	3	\N	\N	\N	\N	258	\N	14	\N	J	\N	UCSF San Jose La Fuente LU	\N	\N	\N	\N	\N	G
1011	2	17	63	\N	\N	\N	\N	260	\N	14	\N	J	\N	UCSF Yayantique LU	\N	\N	\N	\N	\N	G
1012	2	17	63	\N	\N	\N	\N	260	\N	14	\N	J	\N	UCSF Yayantique LU El Pastor	\N	\N	\N	\N	\N	G
1013	2	17	63	\N	\N	\N	\N	260	\N	14	\N	J	\N	UCSF Yayantique LU Los Amates	\N	\N	\N	\N	\N	G
1014	2	21	3	\N	\N	\N	\N	254	\N	14	\N	J	\N	UCSF Nueva Esparta LU	\N	\N	\N	\N	\N	G
1015	2	21	3	\N	\N	\N	\N	254	\N	14	\N	J	\N	UCSF Nueva esparta LU Monteca	\N	\N	\N	\N	\N	G
1016	2	21	3	\N	\N	\N	\N	254	\N	14	\N	J	\N	UCSF Nueva Esparta LU Las Marias	\N	\N	\N	\N	\N	G
1017	2	21	3	\N	\N	\N	\N	254	\N	14	\N	J	\N	UCSF Nueva Esparta LU Honduritas	\N	\N	\N	\N	\N	G
1018	2	21	3	\N	\N	\N	\N	256	\N	14	\N	J	\N	UCSF Poloros LU	\N	\N	\N	\N	\N	G
1019	2	21	3	\N	\N	\N	\N	256	\N	14	\N	J	\N	UCSF Poloros LU Boquin	\N	\N	\N	\N	\N	G
1020	2	21	3	\N	\N	\N	\N	256	\N	14	\N	J	\N	UCSF Poloros LU Carpintero	\N	\N	\N	\N	\N	G
1021	2	21	3	\N	\N	\N	\N	256	\N	14	\N	J	\N	UCSF Poloros LU Ocote	\N	\N	\N	\N	\N	G
1022	1	2	2	\N	\N	\N	\N	17	\N	2	\N	J	\N	UCSF El Porvenir SA	\N	\N	\N	\N	\N	G
1023	1	2	2	\N	\N	\N	\N	17	\N	2	\N	J	\N	UCSF El Porvenir SA El Cerrón	\N	\N	\N	\N	\N	G
1024	1	2	2	\N	\N	\N	\N	17	\N	2	\N	J	\N	UCSF El Porvenir SA Amate Blanco	\N	\N	\N	\N	\N	G
1025	1	2	2	\N	\N	\N	\N	17	\N	2	\N	J	\N	UCSF El Porvenir SA San Juan Chiquito	\N	\N	\N	\N	\N	G
1026	1	2	2	\N	\N	\N	\N	18	\N	2	\N	J	\N	UCSF Masahuat SA	\N	\N	\N	\N	\N	G
1027	1	2	2	\N	\N	\N	\N	18	\N	2	\N	J	\N	UCSF Masahuat SA La Joya	\N	\N	\N	\N	\N	G
1028	1	2	2	\N	\N	\N	\N	23	\N	2	\N	J	\N	UCSF Santa Rosa de Guachipilín SA	\N	\N	\N	\N	\N	G
1029	1	2	2	\N	\N	\N	\N	23	\N	2	\N	J	\N	UCSF Santa Rosa Guachipilín SA  El Despoblado	\N	\N	\N	\N	\N	G
1030	1	2	2	\N	\N	\N	\N	24	\N	2	\N	J	\N	UCSF Santiago La Frontera SA	\N	\N	\N	\N	\N	G
1031	1	2	2	\N	\N	\N	\N	24	\N	2	\N	J	\N	UCSF Santiago La Frontera SA Las Piletas	\N	\N	\N	\N	\N	G
1032	1	2	2	\N	\N	\N	\N	24	\N	2	\N	J	\N	UCSF Santiago La Frontera SA Santa Cruz	\N	\N	\N	\N	\N	G
1033	1	2	2	\N	\N	\N	\N	15	\N	2	\N	J	\N	UCSF Chalchuapa SA	\N	\N	\N	\N	\N	G
1034	1	2	2	\N	\N	\N	\N	15	\N	2	\N	J	\N	UCSF Chalchuapa SA Magdalena 1	\N	\N	\N	\N	\N	G
1035	1	2	2	\N	\N	\N	\N	15	\N	2	\N	J	\N	UCSF Chalchuapa SA Magdalena 2	\N	\N	\N	\N	\N	G
1036	1	2	2	\N	\N	\N	\N	15	\N	2	\N	J	\N	UCSF Chalchuapa SA San Sebastian	\N	\N	\N	\N	\N	G
1037	1	2	2	\N	\N	\N	\N	15	\N	2	\N	J	\N	UCSF Chalchuapa SA Galeano	\N	\N	\N	\N	\N	G
1038	1	2	2	\N	\N	\N	\N	15	\N	2	\N	J	\N	UCSF Chalchuapa SA Zacamil	\N	\N	\N	\N	\N	G
1039	1	2	2	\N	\N	\N	\N	15	\N	2	\N	J	\N	UCSF Chalchuapa SA Las Flores	\N	\N	\N	\N	\N	G
1040	1	2	2	\N	\N	\N	\N	15	\N	2	\N	J	\N	UCSF Chalchuapa SA El Paste	\N	\N	\N	\N	\N	G
1041	1	2	2	\N	\N	\N	\N	15	\N	2	\N	J	\N	UCSF Chalchuapa SA El Coco	\N	\N	\N	\N	\N	G
1042	1	2	2	\N	\N	\N	\N	15	\N	2	\N	J	\N	UCSF Chalchuapa SA San José	\N	\N	\N	\N	\N	G
1043	1	2	69	\N	\N	\N	\N	15	\N	2	\N	J	\N	UCSF Chalchuapa SA Las Lomas	\N	\N	\N	\N	\N	G
1044	1	2	69	\N	\N	\N	\N	15	\N	2	\N	J	\N	UCSF Chalchuapa SA Las Lajas	\N	\N	\N	\N	\N	G
1045	1	2	69	\N	\N	\N	\N	15	\N	2	\N	J	\N	UCSF Chalchuapa SA Las Cruces	\N	\N	\N	\N	\N	G
1094	2	17	63	\N	\N	\N	\N	212	\N	12	\N	J	\N	UCSF San Gerardo SM La Laguna	\N	\N	\N	\N	\N	G
1049	1	2	2	\N	\N	\N	\N	15	\N	2	\N	L	\N	UCSFE Chalchuapa SA	\N	\N	\N	\N	\N	G
1050	1	1	1	\N	\N	\N	\N	9	\N	1	\N	J	\N	UCSF San Lorenzo AH Guascota	\N	\N	\N	\N	\N	G
1051	1	1	10	\N	\N	\N	\N	5	\N	1	\N	J	\N	UCSF El Refugio AH El Rosario	\N	\N	\N	\N	\N	G
1052	1	1	1	\N	\N	\N	\N	12	\N	1	\N	J	\N	UCSF Turín AH El Paraiso	\N	\N	\N	\N	\N	G
1099	1	5	18	\N	\N	\N	\N	36	\N	3	\N	O	\N	ONG LIBRAS DE AMOR  SONSONATE SAN ANTONIO DEL MONTE	\N	\N	\N	\N	\N	G
1107	5	8	21	\N	\N	\N	\N	94	\N	5	\N	J	\N	UCSF Teotepeque LL Aguacayo 	\N	\N	\N	\N	\N	G
1108	5	8	21	\N	\N	\N	\N	79	\N	5	\N	J	\N	UCSF Chiltiupán LL	\N	\N	\N	\N	\N	G
1056	1	1	1	\N	\N	\N	\N	3	\N	1	\N	J	\N	UCSF Atiquizaya AH Lomas de Alarcon	\N	\N	\N	\N	\N	G
1105	5	8	21	\N	\N	\N	\N	94	\N	5	\N	J	\N	UCSF Teotepeque LL El Angel	\N	\N	\N	\N	\N	G
1106	5	8	21	\N	\N	\N	\N	94	\N	5	\N	J	\N	UCSF Teotepeque LL Mizata	\N	\N	\N	\N	\N	G
1114	5	8	21	\N	\N	\N	\N	78	\N	5	\N	J	\N	UCSF Comasagua LL Los Conacastes	\N	\N	\N	\N	\N	G
1113	5	8	21	\N	\N	\N	\N	78	\N	5	\N	J	\N	UCSF Comasagua LL La Shila	\N	\N	\N	\N	\N	G
1109	5	8	21	\N	\N	\N	\N	79	\N	5	\N	J	\N	UCSF Chiltiupán LL Termophilas	\N	\N	\N	\N	\N	G
1110	5	8	21	\N	\N	\N	\N	79	\N	5	\N	J	\N	UCSF Chiltiupán LL Taquillo "Ing. Orlando Recinos"	\N	\N	\N	\N	\N	G
1111	5	8	21	\N	\N	\N	\N	82	\N	5	\N	J	\N	UCSF Jicalapa LL La Perla	\N	\N	\N	\N	\N	G
1067	1	1	117	\N	\N	\N	\N	1	\N	1	\N	J	\N	UCSF Ahuachapan AH Un Rancho y un lucero	\N	\N	\N	\N	\N	G
1112	5	8	21	\N	\N	\N	\N	78	\N	5	\N	J	\N	UCSF Comasagua LL	\N	\N	\N	\N	\N	G
1070	5	6	119	\N	\N	\N	\N	49	\N	4	\N	L	\N	UCSFE Dulce Nombre de Maria CH	\N	\N	\N	\N	\N	G
1071	5	6	119	\N	\N	\N	\N	47	\N	4	\N	L	\N	UCSFE Concepción Quezaltepeque CH	\N	\N	\N	\N	\N	G
1098	1	1	1	\N	\N	\N	\N	1	\N	1	\N	O	\N	ONG LIBRAS DE AMOR AHUACHAPAN	\N	\N	\N	\N	\N	G
1073	2	21	3	\N	\N	\N	\N	258	\N	14	\N	J	\N	UCSF San Jose la Fuente LU El Sombrerito	\N	\N	\N	\N	\N	G
1074	2	20	33	\N	\N	\N	\N	234	\N	13	\N	L	\N	UCSFE Perquin MO	\N	\N	\N	\N	\N	G
1075	2	20	33	\N	\N	\N	\N	221	\N	13	\N	L	\N	UCSFE Corinto MO	\N	\N	\N	\N	\N	G
1076	2	20	33	\N	\N	\N	\N	240	\N	13	\N	L	\N	UCSFE Semsembra MO	\N	\N	\N	\N	\N	G
1077	2	20	33	\N	\N	\N	\N	233	\N	13	\N	L	\N	UCSFE Osicala MO	\N	\N	\N	\N	\N	G
1078	2	21	3	\N	\N	\N	\N	245	\N	14	\N	L	\N	UCSFE Anamoros LU	\N	\N	\N	\N	\N	G
1079	2	17	63	\N	\N	\N	\N	199	\N	12	\N	L	\N	UCSFE Carolina SM	\N	\N	\N	\N	\N	G
1080	6	25	58	\N	\N	\N	\N	109	\N	6	\N	J	\N	UCSF San Martín SS Los Letona	\N	\N	\N	\N	\N	G
1081	6	25	58	\N	\N	\N	\N	109	\N	6	\N	J	\N	UCSF San Martín SS La Flor	\N	\N	\N	\N	\N	G
1082	6	24	116	\N	\N	\N	\N	107	\N	6	\N	J	\N	UCSF Rosario de Mora SS Palo Grande	\N	\N	\N	\N	\N	G
1083	6	24	116	\N	\N	\N	\N	106	\N	6	\N	J	\N	UCSF  Panchimalco SS Quezalapa	\N	\N	\N	\N	\N	G
1084	6	24	116	\N	\N	\N	\N	106	\N	6	\N	J	\N	UCSF  Panchimalco SS Amayon	\N	\N	\N	\N	\N	G
1085	6	23	113	\N	\N	\N	\N	101	\N	6	\N	J	\N	UCSF El Paisnal SS San Francisco dos Cerros	\N	\N	\N	\N	\N	G
1086	6	23	113	\N	\N	\N	\N	97	\N	6	\N	J	\N	UCSF Aguilares SS La Florida	\N	\N	\N	\N	\N	G
1087	4	12	4	\N	\N	\N	\N	156	\N	9	\N	J	\N	UCSF Ilobasco CA Hoyos	\N	\N	\N	\N	\N	G
1089	5	6	119	\N	\N	\N	\N	53	\N	4	\N	J	\N	UCSF La Palma CH	\N	\N	\N	\N	\N	G
1090	5	6	119	\N	\N	\N	\N	48	\N	4	\N	J	\N	UCSF Chalatenango CH Guarjila	\N	\N	\N	\N	\N	G
1091	2	20	33	\N	\N	\N	\N	227	\N	13	\N	J	\N	UCSF Guatajiagua MO Pajigua	\N	\N	\N	\N	\N	G
1092	2	20	33	\N	\N	\N	\N	211	\N	12	\N	J	\N	UCSF San Antonio SM San Diego	\N	\N	\N	\N	\N	G
1093	2	20	33	\N	\N	\N	\N	221	\N	13	\N	J	\N	UCSF Corinto MO Corralito Atillo	\N	\N	\N	\N	\N	G
1095	2	17	63	\N	\N	\N	\N	211	\N	12	\N	J	\N	UCSF san antonio SM San Marcos	\N	\N	\N	\N	\N	G
1096	2	21	3	\N	\N	\N	\N	248	\N	14	\N	J	\N	UCSF Conchagua LU Las Tunas	\N	\N	\N	\N	\N	G
1097	2	21	3	\N	\N	\N	\N	248	\N	14	\N	J	\N	UCSF Conchagua LU El Pilón	\N	\N	\N	\N	\N	G
1100	1	5	18	\N	\N	\N	\N	38	\N	3	\N	O	\N	ONG LIBRAS DE AMOR  SONSONATE SANTA CATARINA MASAHUAT	\N	\N	\N	\N	\N	G
1104	5	8	21	\N	\N	\N	\N	94	\N	5	\N	J	\N	UCSF Teotepeque LL	\N	\N	\N	\N	\N	G
1101	6	25	58	\N	\N	\N	\N	103	\N	6	\N	P	\N	UNIDAD MEDICA ISSS  ILOPANGO SS	\N	\N	\N	\N	\N	G
1102	5	6	119	\N	\N	\N	\N	48	\N	4	\N	U	\N	U.de S. Chalatenango CH Guarjila	\N	\N	\N	\N	\N	G
1103	6	27	48	\N	\N	\N	\N	110	\N	6	\N	Q	\N	CONSULTORIO DE ESPECIALIDADES	\N	\N	\N	\N	\N	G
1115	5	8	21	\N	\N	\N	\N	78	\N	5	\N	J	\N	UCSF Comasagua LL El Matazano	\N	\N	\N	\N	\N	G
1116	5	8	21	\N	\N	\N	\N	92	\N	5	\N	J	\N	UCSF Tamanique LL	\N	\N	\N	\N	\N	G
1117	5	8	21	\N	\N	\N	\N	92	\N	5	\N	J	\N	UCSF Tamanique LL Buenos Aires	\N	\N	\N	\N	\N	G
1118	5	8	21	\N	\N	\N	\N	92	\N	5	\N	J	\N	UCSF  Tamanique LL San Alfonso	\N	\N	\N	\N	\N	G
1119	5	8	21	\N	\N	\N	\N	92	\N	5	\N	J	\N	UCSF Tamanique LL El Palmar	\N	\N	\N	\N	\N	G
1120	5	8	21	\N	\N	\N	\N	91	\N	5	\N	J	\N	UCSF San Pablo Tacachico LL	\N	\N	\N	\N	\N	G
1121	5	8	21	\N	\N	\N	\N	91	\N	5	\N	J	\N	UCSF San Pablo Tacachico LL San Isidro	\N	\N	\N	\N	\N	G
1122	5	8	21	\N	\N	\N	\N	91	\N	5	\N	J	\N	UCSF San Pablo Tacachico Ll Atiocoyo	\N	\N	\N	\N	\N	G
1123	5	8	21	\N	\N	\N	\N	91	\N	5	\N	J	\N	UCSF San Pablo Tacachico LL Obraje Nuevo	\N	\N	\N	\N	\N	G
1124	5	8	23	\N	\N	\N	\N	91	\N	5	\N	J	\N	UCSF San Pablo Tacachico LL Valle Mesas	\N	\N	\N	\N	\N	G
1125	5	6	119	\N	\N	\N	\N	44	\N	4	\N	J	\N	UCSF Azacualpa CH	\N	\N	\N	\N	\N	G
1126	5	6	119	\N	\N	\N	\N	44	\N	4	\N	J	\N	UCSF San Francisco Lempa CH	\N	\N	\N	\N	\N	G
1127	4	9	107	\N	\N	\N	\N	119	\N	7	\N	J	\N	UCSF El Rosario CU 	\N	\N	\N	\N	\N	G
1128	4	9	107	\N	\N	\N	\N	137	\N	8	\N	J	\N	UCSF Paraiso de Osorio LP	\N	\N	\N	\N	\N	G
1129	4	9	107	\N	\N	\N	\N	128	\N	7	\N	J	\N	UCSF Santa Cruz Analquito CU	\N	\N	\N	\N	\N	G
1130	4	9	107	\N	\N	\N	\N	139	\N	8	\N	J	\N	UCSF San Emigdio LP	\N	\N	\N	\N	\N	G
1131	4	9	107	\N	\N	\N	\N	123	\N	7	\N	J	\N	UCSF  San Cristobal CU	\N	\N	\N	\N	\N	G
1132	4	9	107	\N	\N	\N	\N	123	\N	7	\N	J	\N	UCSF San Cristobal CU Santa Anita	\N	\N	\N	\N	\N	G
1133	4	9	107	\N	\N	\N	\N	123	\N	7	\N	J	\N	UCSF San Cristobal CU La Virgen	\N	\N	\N	\N	\N	G
1134	4	9	107	\N	\N	\N	\N	120	\N	7	\N	J	\N	UCSF Monte San Juan CU	\N	\N	\N	\N	\N	G
1135	4	9	107	\N	\N	\N	\N	120	\N	7	\N	J	\N	UCSF Monte San Juan CU San Nicolas	\N	\N	\N	\N	\N	G
1136	4	9	107	\N	\N	\N	\N	120	\N	7	\N	J	\N	UCSF Monte San Juan CU Soledad	\N	\N	\N	\N	\N	G
1137	4	9	107	\N	\N	\N	\N	131	\N	7	\N	J	\N	UCSF Tenancingo CU	\N	\N	\N	\N	\N	G
1138	4	9	107	\N	\N	\N	\N	131	\N	7	\N	J	\N	UCSF Tenancingo CU Corral Viejo	\N	\N	\N	\N	\N	G
1139	4	9	107	\N	\N	\N	\N	131	\N	7	\N	J	\N	UCSF Tenancingo CU Rosario Tablon	\N	\N	\N	\N	\N	G
1140	4	9	109	\N	\N	\N	\N	124	\N	7	\N	J	\N	UCSF San Jose Guayabal CU Llano Grande	\N	\N	\N	\N	\N	G
1141	4	9	107	\N	\N	\N	\N	126	\N	7	\N	J	\N	UCSF San Rafael Cedros CU Soledad	\N	\N	\N	\N	\N	G
1142	4	9	107	\N	\N	\N	\N	125	\N	7	\N	J	\N	UCSF San Pedro Perulapan CU La Esperanza	\N	\N	\N	\N	\N	G
1143	4	9	107	\N	\N	\N	\N	125	\N	7	\N	J	\N	UCSF San Pedro Perulapan CU San Francisco	\N	\N	\N	\N	\N	G
1144	4	9	107	\N	\N	\N	\N	118	\N	7	\N	J	\N	UCSF El Carmen CU San Antonio	\N	\N	\N	\N	\N	G
1145	4	9	107	\N	\N	\N	\N	129	\N	7	\N	J	\N	UCSF Santa Cruz Michapa CU Buena Vista	\N	\N	\N	\N	\N	G
1146	4	9	107	\N	\N	\N	\N	130	\N	7	\N	J	\N	UCSF Suchitoto CU San Cristobal	\N	\N	\N	\N	\N	G
1147	4	9	107	\N	\N	\N	\N	130	\N	7	\N	J	\N	UCSF Suchitoto CU Palo Grande	\N	\N	\N	\N	\N	G
1148	4	13	29	\N	\N	\N	\N	163	\N	10	\N	J	\N	UCSF Apastepeque SV	\N	\N	\N	\N	\N	G
1149	4	13	29	\N	\N	\N	\N	163	\N	10	\N	J	\N	UCSF Apastepeque SV Calderas	\N	\N	\N	\N	\N	G
1150	4	13	29	\N	\N	\N	\N	163	\N	10	\N	J	\N	UCSF  Apastepeque SV Las Minas	\N	\N	\N	\N	\N	G
1151	4	13	29	\N	\N	\N	\N	163	\N	10	\N	J	\N	UCSF Apastepeque SV San Felipe	\N	\N	\N	\N	\N	G
1152	4	13	29	\N	\N	\N	\N	163	\N	10	\N	J	\N	UCSF Apastepeque SV San Jacinto	\N	\N	\N	\N	\N	G
1153	4	13	29	\N	\N	\N	\N	163	\N	10	\N	J	\N	UCSF Apastepeque SV San Nicolas	\N	\N	\N	\N	\N	G
1154	4	13	29	\N	\N	\N	\N	163	\N	10	\N	J	\N	UCSF Apastepeque SV San Pedro	\N	\N	\N	\N	\N	G
1155	4	13	29	\N	\N	\N	\N	175	\N	10	\N	J	\N	UCSF Verapaz SV 	\N	\N	\N	\N	\N	G
1156	4	13	29	\N	\N	\N	\N	175	\N	10	\N	J	\N	UCSF Verapaz SV El Carmen	\N	\N	\N	\N	\N	G
1157	4	13	29	\N	\N	\N	\N	175	\N	10	\N	J	\N	UCSF Verapaz SV San Isidro	\N	\N	\N	\N	\N	G
1158	4	13	29	\N	\N	\N	\N	166	\N	10	\N	J	\N	UCSF Santa Clara SV	\N	\N	\N	\N	\N	G
1159	4	13	29	\N	\N	\N	\N	166	\N	10	\N	J	\N	UCSF Santa Clara SV Santa Rosa	\N	\N	\N	\N	\N	G
1160	4	13	29	\N	\N	\N	\N	169	\N	10	\N	J	\N	UCSF San Ildefonso SV	\N	\N	\N	\N	\N	G
1161	4	13	29	\N	\N	\N	\N	169	\N	10	\N	J	\N	UCSF San Ildefonso SV Guachipilín	\N	\N	\N	\N	\N	G
1162	4	13	29	\N	\N	\N	\N	169	\N	10	\N	J	\N	UCSF San Ildefonso SV San Lorenzo	\N	\N	\N	\N	\N	G
1163	4	13	29	\N	\N	\N	\N	168	\N	10	\N	J	\N	UCSF San Esteban Catarina SV	\N	\N	\N	\N	\N	G
1164	4	13	29	\N	\N	\N	\N	168	\N	10	\N	J	\N	UCSF San Esteban Catarina SV San Jacinto la Burrera	\N	\N	\N	\N	\N	G
1165	4	13	29	\N	\N	\N	\N	170	\N	10	\N	J	\N	UCSF San Lorenzo SV	\N	\N	\N	\N	\N	G
1166	4	13	29	\N	\N	\N	\N	170	\N	10	\N	J	\N	UCSF San Lorenzo SV Santa Lucia	\N	\N	\N	\N	\N	G
1167	4	10	25	\N	\N	\N	\N	149	\N	8	\N	J	\N	UCSF Santa Maria Ostuma LP	\N	\N	\N	\N	\N	G
1168	4	10	25	\N	\N	\N	\N	149	\N	8	\N	J	\N	UCSF Santa María Ostuma LP El Carrizal	\N	\N	\N	\N	\N	G
1169	4	10	25	\N	\N	\N	\N	149	\N	8	\N	J	\N	UCSF Santa María Ostuma LP El Chaperno	\N	\N	\N	\N	\N	G
1170	4	10	25	\N	\N	\N	\N	147	\N	8	\N	J	\N	UCSF San Pedro Nonualco LP	\N	\N	\N	\N	\N	G
1171	4	10	25	\N	\N	\N	\N	147	\N	8	\N	J	\N	UCSF San Pedro Nonualco LP San Juan Nuhuistepeque	\N	\N	\N	\N	\N	G
1172	4	10	25	\N	\N	\N	\N	147	\N	8	\N	J	\N	UCSF San Pedro Nonualco LP San Ramón	\N	\N	\N	\N	\N	G
1173	4	10	25	\N	\N	\N	\N	143	\N	8	\N	J	\N	UCSF San Juan TepezontesLP	\N	\N	\N	\N	\N	G
1174	4	10	25	\N	\N	\N	\N	145	\N	8	\N	J	\N	UCSF San Miguel Tepezontes LP	\N	\N	\N	\N	\N	G
1175	4	10	25	\N	\N	\N	\N	145	\N	8	\N	J	\N	UCSF San Miguel Tepezontes LP Soledad Las Flores	\N	\N	\N	\N	\N	G
1176	4	10	25	\N	\N	\N	\N	146	\N	8	\N	J	\N	UCSF San Antonio Masahuat LP	\N	\N	\N	\N	\N	G
1177	4	10	25	\N	\N	\N	\N	138	\N	8	\N	J	\N	UCSF San Antonio Masahuat LP La Loma	\N	\N	\N	\N	\N	G
1178	4	10	25	\N	\N	\N	\N	151	\N	8	\N	J	\N	UCSF Tapalhuaca LP	\N	\N	\N	\N	\N	G
1179	2	17	63	\N	\N	\N	\N	200	\N	12	\N	J	\N	UCSF Ciudad Barrios SM	\N	\N	\N	\N	\N	G
1180	2	17	63	\N	\N	\N	\N	200	\N	12	\N	J	\N	UCSF Ciudad Barrios SM Guanaste	\N	\N	\N	\N	\N	G
1181	2	17	63	\N	\N	\N	\N	200	\N	12	\N	J	\N	UCSF Ciudad Barrios SM El Porvenir	\N	\N	\N	\N	\N	G
1182	2	17	63	\N	\N	\N	\N	199	\N	12	\N	J	\N	UCSF Ciudad Barrios SM San Matias	\N	\N	\N	\N	\N	G
1183	2	17	63	\N	\N	\N	\N	200	\N	12	\N	J	\N	UCSF Ciudad Barrios SM San Cristobal	\N	\N	\N	\N	\N	G
1184	2	17	63	\N	\N	\N	\N	200	\N	12	\N	J	\N	UCSF Ciudad Barrios SM Llano el Angel	\N	\N	\N	\N	\N	G
1185	2	17	63	\N	\N	\N	\N	217	\N	12	\N	J	\N	UCSF Sesori SM El Tablon	\N	\N	\N	\N	\N	G
1186	2	17	63	\N	\N	\N	\N	217	\N	12	\N	J	\N	UCSF Sesori SM San Sebastían	\N	\N	\N	\N	\N	G
1187	2	17	63	\N	\N	\N	\N	217	\N	12	\N	J	\N	UCSF Sesori SM Managuara	\N	\N	\N	\N	\N	G
1188	2	17	63	\N	\N	\N	\N	217	\N	12	\N	J	\N	UCSF Sesori SM	\N	\N	\N	\N	\N	G
1189	2	17	63	\N	\N	\N	\N	202	\N	12	\N	J	\N	UCSF Chapeltique SM El Rodeo	\N	\N	\N	\N	\N	G
1190	2	14	79	\N	\N	\N	\N	187	\N	11	\N	J	\N	UCSF Nueva Granada US	\N	\N	\N	\N	\N	G
1191	2	14	79	\N	\N	\N	\N	187	\N	11	\N	J	\N	UCSF Nueva Granada US Nuevo Gualcho	\N	\N	\N	\N	\N	G
1192	2	14	79	\N	\N	\N	\N	182	\N	11	\N	J	\N	UCSF Estanzuela US	\N	\N	\N	\N	\N	G
1193	2	14	79	\N	\N	\N	\N	182	\N	11	\N	J	\N	UCSF Estanzuelas US Escarbadero	\N	\N	\N	\N	\N	G
1194	2	14	79	\N	\N	\N	\N	182	\N	11	\N	J	\N	UCSF Estanzuelas US la Cruz	\N	\N	\N	\N	\N	G
1195	2	14	79	\N	\N	\N	\N	186	\N	11	\N	J	\N	UCSF Mercedes Umaña US	\N	\N	\N	\N	\N	G
1196	2	14	79	\N	\N	\N	\N	186	\N	11	\N	J	\N	UCSF Mercedes Umaña US La Puerta	\N	\N	\N	\N	\N	G
1197	2	14	79	\N	\N	\N	\N	186	\N	11	\N	J	\N	UCSF Mercedes Umaña US Santa Anita	\N	\N	\N	\N	\N	G
1198	2	14	79	\N	\N	\N	\N	186	\N	11	\N	J	\N	UCSF Mercedes Umaña US Los Horcones	\N	\N	\N	\N	\N	G
1199	2	14	79	\N	\N	\N	\N	177	\N	11	\N	J	\N	UCSF Berlin US 1	\N	\N	\N	\N	\N	G
1200	2	14	79	\N	\N	\N	\N	177	\N	11	\N	J	\N	UCSF Berlin US 2	\N	\N	\N	\N	\N	G
1201	2	14	79	\N	\N	\N	\N	177	\N	11	\N	J	\N	UCSF Berlin US San José	\N	\N	\N	\N	\N	G
1202	2	14	79	\N	\N	\N	\N	177	\N	11	\N	J	\N	UCSF Berlin US Talpetate	\N	\N	\N	\N	\N	G
1203	2	14	79	\N	\N	\N	\N	177	\N	11	\N	J	\N	UCSF Berlin US Virginia	\N	\N	\N	\N	\N	G
1204	2	14	79	\N	\N	\N	\N	177	\N	11	\N	J	\N	UCSF Berlin US San Isidro	\N	\N	\N	\N	\N	G
1205	2	14	79	\N	\N	\N	\N	176	\N	11	\N	J	\N	UCSF Alegria US	\N	\N	\N	\N	\N	G
1206	2	14	79	\N	\N	\N	\N	176	\N	11	\N	J	\N	UCSF Alegría US Las Casitas	\N	\N	\N	\N	\N	G
1207	2	14	79	\N	\N	\N	\N	176	\N	11	\N	J	\N	UCSF Alegria US El Quebracho	\N	\N	\N	\N	\N	G
1208	2	14	79	\N	\N	\N	\N	176	\N	11	\N	J	\N	UCSF Alegría US El Zapotillo	\N	\N	\N	\N	\N	G
1209	2	14	79	\N	\N	\N	\N	197	\N	11	\N	J	\N	UCSF Tecapan US	\N	\N	\N	\N	\N	G
1210	2	14	79	\N	\N	\N	\N	197	\N	11	\N	J	\N	UCSF Tecapan US Gualache	\N	\N	\N	\N	\N	G
1211	2	14	79	\N	\N	\N	\N	197	\N	11	\N	J	\N	UCSF Tecapan US Chapetones	\N	\N	\N	\N	\N	G
1212	2	14	79	\N	\N	\N	\N	188	\N	11	\N	J	\N	UCSF Ozatlan US	\N	\N	\N	\N	\N	G
1213	2	14	79	\N	\N	\N	\N	188	\N	11	\N	J	\N	UCSF Ozatlan US Las Trancas	\N	\N	\N	\N	\N	G
1214	2	14	79	\N	\N	\N	\N	188	\N	11	\N	J	\N	UCSF Ozatlan US La Poza	\N	\N	\N	\N	\N	G
1215	2	14	79	\N	\N	\N	\N	188	\N	11	\N	J	\N	UCSF Ozatlan US La Breña	\N	\N	\N	\N	\N	G
1216	2	14	79	\N	\N	\N	\N	190	\N	11	\N	J	\N	UCSF San Agustín US	\N	\N	\N	\N	\N	G
1217	2	14	79	\N	\N	\N	\N	190	\N	11	\N	J	\N	UCSF San Agustín US El Eucalipto	\N	\N	\N	\N	\N	G
1218	2	14	79	\N	\N	\N	\N	190	\N	11	\N	J	\N	UCSF San Agustín US El Caulotal	\N	\N	\N	\N	\N	G
1219	2	14	79	\N	\N	\N	\N	194	\N	11	\N	J	\N	UCSF San Francisco Javier US	\N	\N	\N	\N	\N	G
1220	2	14	79	\N	\N	\N	\N	194	\N	11	\N	J	\N	UCSF San Francisco Javier US Los Hornos	\N	\N	\N	\N	\N	G
1221	2	14	79	\N	\N	\N	\N	194	\N	11	\N	J	\N	UCSF San Francisco Javier US La Cruz	\N	\N	\N	\N	\N	G
1222	2	14	79	\N	\N	\N	\N	193	\N	11	\N	J	\N	UCSF Santa Elena US	\N	\N	\N	\N	\N	G
1223	2	14	79	\N	\N	\N	\N	193	\N	11	\N	J	\N	UCSF Santa Elena US El Nanzal 1	\N	\N	\N	\N	\N	G
1224	2	14	79	\N	\N	\N	\N	193	\N	11	\N	J	\N	UCSF Santa Elena US El Volcan	\N	\N	\N	\N	\N	G
1225	2	14	79	\N	\N	\N	\N	193	\N	11	\N	J	\N	UCSF Santa Elena US Joya Ancha Arriba	\N	\N	\N	\N	\N	G
1226	2	14	79	\N	\N	\N	\N	193	\N	11	\N	J	\N	UCSF Santa Elena US Amate Norte	\N	\N	\N	\N	\N	G
1227	2	14	79	\N	\N	\N	\N	213	\N	12	\N	J	\N	UCSF San Jorge SM	\N	\N	\N	\N	\N	G
1228	2	14	79	\N	\N	\N	\N	213	\N	12	\N	J	\N	UCSF San Jorge SM San Julian	\N	\N	\N	\N	\N	G
1229	2	14	79	\N	\N	\N	\N	213	\N	12	\N	J	\N	UCSF San Jorge US Joya de Ventura	\N	\N	\N	\N	\N	G
1230	2	14	79	\N	\N	\N	\N	185	\N	11	\N	J	\N	UCSF Jucuaran US	\N	\N	\N	\N	\N	G
1231	2	14	79	\N	\N	\N	\N	185	\N	11	\N	J	\N	UCSF Jucuaran US El Jutal	\N	\N	\N	\N	\N	G
1232	2	14	79	\N	\N	\N	\N	185	\N	11	\N	J	\N	UCSF Jucuaran US El Espino	\N	\N	\N	\N	\N	G
1233	2	14	79	\N	\N	\N	\N	185	\N	11	\N	J	\N	UCSF Jucuaran US El Zapote	\N	\N	\N	\N	\N	G
1234	2	14	79	\N	\N	\N	\N	179	\N	11	\N	J	\N	UCSF Concepción Batres US 	\N	\N	\N	\N	\N	G
1235	2	14	79	\N	\N	\N	\N	179	\N	11	\N	J	\N	UCSF Concepción Batres US San Felipe	\N	\N	\N	\N	\N	G
1236	2	14	79	\N	\N	\N	\N	179	\N	11	\N	J	\N	UCSF Concepción Batres US Hacienda Nueva	\N	\N	\N	\N	\N	G
1237	2	14	79	\N	\N	\N	\N	179	\N	11	\N	J	\N	UCSF Concepción Batres US El Cañal	\N	\N	\N	\N	\N	G
1238	2	14	79	\N	\N	\N	\N	189	\N	11	\N	J	\N	UCSF Puerto el Triunfo US La Palmera	\N	\N	\N	\N	\N	G
1239	2	14	79	\N	\N	\N	\N	181	\N	11	\N	J	\N	UCSF Ereguayquin US Analco	\N	\N	\N	\N	\N	G
1240	1	1	1	\N	\N	\N	\N	6	\N	1	\N	J	\N	UCSF Guaymango AH	\N	\N	\N	\N	\N	G
1241	1	1	1	\N	\N	\N	\N	6	\N	1	\N	J	\N	UCSF Guaymango AH Platanares	\N	\N	\N	\N	\N	G
1242	1	1	1	\N	\N	\N	\N	6	\N	1	\N	J	\N	UCSF Guaymango AH El Escalón	\N	\N	\N	\N	\N	G
1243	1	1	1	\N	\N	\N	\N	6	\N	1	\N	J	\N	UCSF Guaymango AH Morro Grande	\N	\N	\N	\N	\N	G
1244	1	1	1	\N	\N	\N	\N	6	\N	1	\N	J	\N	UCSF Guaymango AH San Martín	\N	\N	\N	\N	\N	G
1245	1	1	11	\N	\N	\N	\N	6	\N	1	\N	J	\N	UCSF Guaymango AH Cauta Arriba	\N	\N	\N	\N	\N	G
1246	1	1	1	\N	\N	\N	\N	7	\N	1	\N	J	\N	UCSF Jujutla AH	\N	\N	\N	\N	\N	G
1247	1	1	1	\N	\N	\N	\N	7	\N	1	\N	J	\N	UCSF Jujutla AH Tihuicha	\N	\N	\N	\N	\N	G
1248	1	1	1	\N	\N	\N	\N	7	\N	1	\N	J	\N	UCSF Jujutla AH Barra de Santiago	\N	\N	\N	\N	\N	G
1249	1	1	1	\N	\N	\N	\N	7	\N	1	\N	J	\N	UCSF Jujutla AH Falla	\N	\N	\N	\N	\N	G
1250	1	1	1	\N	\N	\N	\N	7	\N	1	\N	J	\N	UCSF Jujutla AH Guayapa Abajo	\N	\N	\N	\N	\N	G
1251	1	1	1	\N	\N	\N	\N	7	\N	1	\N	J	\N	UCSF Jujutla AH Santa Rosa Guayapa	\N	\N	\N	\N	\N	G
1252	1	1	1	\N	\N	\N	\N	7	\N	1	\N	J	\N	UCSF Jujutla AH San José El Naranjo	\N	\N	\N	\N	\N	G
1253	1	1	1	\N	\N	\N	\N	7	\N	1	\N	J	\N	UCSF Jujutla AH San Antonio	\N	\N	\N	\N	\N	G
1254	1	1	1	\N	\N	\N	\N	10	\N	1	\N	J	\N	UCSF San Pedro Puxtla AH Los Aguirre	\N	\N	\N	\N	\N	G
1255	1	1	1	\N	\N	\N	\N	10	\N	1	\N	J	\N	UCSF San Pedro Puxtla AH Los Chacón	\N	\N	\N	\N	\N	G
1256	1	1	1	\N	\N	\N	\N	10	\N	1	\N	J	\N	UCSF San Pedro Puxtla AH 	\N	\N	\N	\N	\N	G
1257	1	1	1	\N	\N	\N	\N	11	\N	1	\N	J	\N	UCSF  Tacuba AH	\N	\N	\N	\N	\N	G
1258	1	1	1	\N	\N	\N	\N	11	\N	1	\N	J	\N	UCSF Tacuba AH San Rafael	\N	\N	\N	\N	\N	G
1259	1	1	1	\N	\N	\N	\N	11	\N	1	\N	J	\N	UCSF Tacuba AH Las Palmeras	\N	\N	\N	\N	\N	G
1260	1	1	1	\N	\N	\N	\N	11	\N	1	\N	J	\N	UCSF Tacuba AH Chaguite	\N	\N	\N	\N	\N	G
1261	1	1	1	\N	\N	\N	\N	11	\N	1	\N	J	\N	UCSF Tacuba AH El Jicaro	\N	\N	\N	\N	\N	G
1262	1	1	1	\N	\N	\N	\N	11	\N	1	\N	J	\N	UCSF Tacuba AH El Sincuyo	\N	\N	\N	\N	\N	G
1263	1	1	1	\N	\N	\N	\N	11	\N	1	\N	J	\N	UCSF Tacuba AH La Magdalena	\N	\N	\N	\N	\N	G
1264	1	1	1	\N	\N	\N	\N	11	\N	1	\N	J	\N	UCSF Tacuba AH Pandiadura	\N	\N	\N	\N	\N	G
1265	1	1	1	\N	\N	\N	\N	11	\N	1	\N	J	\N	UCSF Tacuba AH Valle la Puerta	\N	\N	\N	\N	\N	G
1266	1	1	1	\N	\N	\N	\N	11	\N	1	\N	J	\N	UCSF Tacuba AH La Escuela de El Rodeo	\N	\N	\N	\N	\N	G
1267	1	1	10	\N	\N	\N	\N	1	\N	1	\N	J	\N	UCSF Ahuachapan AH Ashapuco	\N	\N	\N	\N	\N	G
1268	1	1	10	\N	\N	\N	\N	1	\N	1	\N	J	\N	UCSF Ahuachapan AH El Barro	\N	\N	\N	\N	\N	G
1269	1	1	10	\N	\N	\N	\N	1	\N	1	\N	J	\N	UCSF Ahuachapan AH Llano la Laguna	\N	\N	\N	\N	\N	G
1270	1	1	1	\N	\N	\N	\N	2	\N	1	\N	J	\N	UCSF Apaneca AH Quezalapa	\N	\N	\N	\N	\N	G
1271	1	5	20	\N	\N	\N	\N	28	\N	3	\N	J	\N	UCSF Caluco SO Plan de Amayo	\N	\N	\N	\N	\N	G
1272	1	5	20	\N	\N	\N	\N	28	\N	3	\N	J	\N	UCSF Caluco SO El Zapote	\N	\N	\N	\N	\N	G
1273	1	5	18	\N	\N	\N	\N	28	\N	3	\N	J	\N	UCSF Caluco SO 	\N	\N	\N	\N	\N	G
1274	1	5	18	\N	\N	\N	\N	29	\N	3	\N	J	\N	UCSF Cuisnahuat SO Agua Shuca	\N	\N	\N	\N	\N	G
1275	1	5	18	\N	\N	\N	\N	29	\N	3	\N	J	\N	UCSF Cuisnahuat SO Coquiama	\N	\N	\N	\N	\N	G
1276	1	5	18	\N	\N	\N	\N	29	\N	3	\N	J	\N	UCSF Cuisnahuat SO San Lucas	\N	\N	\N	\N	\N	G
1277	1	5	18	\N	\N	\N	\N	29	\N	3	\N	J	\N	UCSF Cuisnahuat SO	\N	\N	\N	\N	\N	G
1278	1	5	18	\N	\N	\N	\N	38	\N	3	\N	J	\N	UCSF Santa Catarina Masahuat SO El Guayabo	\N	\N	\N	\N	\N	G
1279	1	5	18	\N	\N	\N	\N	38	\N	3	\N	J	\N	UCSF Santa Catarina Masahuat SO Tres Caminos	\N	\N	\N	\N	\N	G
1280	1	5	18	\N	\N	\N	\N	38	\N	3	\N	J	\N	UCSF Santa Catarina Mashuat SO	\N	\N	\N	\N	\N	G
1281	1	5	18	\N	\N	\N	\N	30	\N	3	\N	J	\N	UCSF Santa Isabel Ishuatan SO	\N	\N	\N	\N	\N	G
1282	1	5	18	\N	\N	\N	\N	30	\N	3	\N	J	\N	UCSF Santa Isabel Ishuatan SO Las Piedras	\N	\N	\N	\N	\N	G
1283	1	5	18	\N	\N	\N	\N	30	\N	3	\N	J	\N	UCSF Santa Isabel Ishuatan SO Acachapa	\N	\N	\N	\N	\N	G
1284	1	5	18	\N	\N	\N	\N	39	\N	3	\N	J	\N	UCSF Santo Domingo de Guzman SO El Carrizal	\N	\N	\N	\N	\N	G
1285	1	5	18	\N	\N	\N	\N	39	\N	3	\N	J	\N	UCSF Santo Domingo de Guzman SO	\N	\N	\N	\N	\N	G
1286	1	2	2	\N	\N	\N	\N	14	\N	2	\N	J	\N	UCSF Coatepeque Sa Piletas	\N	\N	\N	\N	\N	G
1287	1	2	13	\N	\N	\N	\N	14	\N	2	\N	J	\N	UCSF Coatepeque SA Aragua	\N	\N	\N	\N	\N	G
1288	6	25	112	\N	\N	\N	\N	109	\N	6	\N	J	\N	UCSF San Martín SS Santa Gertrudis	\N	\N	\N	\N	\N	G
1289	6	24	61	\N	\N	\N	\N	110	\N	6	\N	J	\N	UCSF San Salvador SS Comunidad Modelo 3	\N	\N	\N	\N	\N	G
1290	6	24	60	\N	\N	\N	\N	110	\N	6	\N	J	\N	UCSF SanSalvador SS San Cristobal	\N	\N	\N	\N	\N	G
1291	5	8	24	\N	\N	\N	\N	83	\N	5	\N	L	\N	UCSFEPuerto La Libertad LL	\N	\N	\N	\N	\N	G
1292	5	8	21	\N	\N	\N	\N	77	\N	5	\N	L	\N	UCSFE Colón LL Ciudad Mujer	\N	\N	\N	\N	\N	G
1293	4	9	110	\N	\N	\N	\N	125	\N	7	\N	L	\N	UCSFE San Pedro perulapan CU	\N	\N	\N	\N	\N	G
1294	4	13	29	\N	\N	\N	\N	175	\N	10	\N	L	\N	UCSFE Verapaz SV	\N	\N	\N	\N	\N	G
1295	4	10	27	\N	\N	\N	\N	136	\N	8	\N	L	\N	UCSFE Olocuilta LP	\N	\N	\N	\N	\N	G
1296	2	17	88	\N	\N	\N	\N	217	\N	12	\N	L	\N	UCSFE Sesori SM	\N	\N	\N	\N	\N	G
1297	2	14	84	\N	\N	\N	\N	177	\N	11	\N	L	\N	UCSFE Berlín US	\N	\N	\N	\N	\N	G
1298	2	14	125	\N	\N	\N	\N	179	\N	11	\N	L	\N	UCSFE Concepción Batres US	\N	\N	\N	\N	\N	G
1299	1	1	10	\N	\N	\N	\N	6	\N	1	\N	L	\N	UCSFE Guaymango AH	\N	\N	\N	\N	\N	G
1300	1	1	11	\N	\N	\N	\N	11	\N	1	\N	L	\N	UCSFE Tacuba AH	\N	\N	\N	\N	\N	G
1301	1	5	19	\N	\N	\N	\N	31	\N	3	\N	L	\N	UCSFE Izalco	\N	\N	\N	\N	\N	G
1302	1	5	18	\N	\N	\N	\N	41	\N	3	\N	L	\N	UCSFE Sonzacate SO	\N	\N	\N	\N	\N	G
1303	6	25	112	\N	\N	\N	\N	109	\N	6	\N	L	\N	UCSFE San Matín SS	\N	\N	\N	\N	\N	G
1304	6	24	60	\N	\N	\N	\N	110	\N	6	\N	L	\N	UCSFE San Salvador SS San Jacinto	\N	\N	\N	\N	\N	G
1	0	29	145	SIBASI CERN ROSALES	5	6	1	110	H	6	01	H	1	HOSPITAL ROSALES SAN SALVADOR	S	50601H	0601	13.7006	-89.205600000000004	G
2	0	29	145	SIBASI CERN BLOOM	5	6	2	110	H	6	01	H	1	HOSPITAL BENJAMIN BLOOM SAN SALVADOR	S	50602H	0601	13.7141	-89.204099999999997	G
3	0	29	145	SIBASI CERN MATERNIDAD	5	6	3	110	H	6	01	H	1	HOSPITAL DR.ARGUELLO ESCOLAN MATERNIDAD	S	50603H	0601	13.700699999999999	-89.204599999999999	G
4	1	1	12	SIBASI AHUACHAPAN	1	1	1	6	D	1	07	D	6	CASA DE SALUD SAN MARTIN (GUAYMANGO)	S	10101D	0107	\N	\N	G
5	1	1	117	SIBASI AHUACHAPAN	1	1	1	1	H	1	01	H	1	HOSPITAL FRANCISCO MENENDEZ AHUACHAPAN	S	10101H	0101	13.928699999999999	-89.846500000000006	G
6	1	1	10	SIBASI AHUACHAPAN	1	1	1	8	N	1	02	N	7	CRN EL ZAPOTE	S	10101N	0102	\N	\N	G
7	1	1	10	SIBASI AHUACHAPAN	1	1	1	1	U	1	01	U	3	U.de S. AHUACHAPAN	S	10101U	0101	\N	\N	G
8	1	1	1	SIBASI AHUACHAPAN	1	1	2	8	D	1	02	D	6	CASA DE SALUD SAN BENITO(SN.FCO.MENEND)	S	10102D	0102	\N	\N	G
9	1	1	10	SIBASI AHUACHAPAN	1	1	2	2	U	1	05	U	3	U.de S. APANECA	S	10102U	0105	\N	\N	G
10	1	1	10	SIBASI AHUACHAPAN	1	1	3	1	D	1	01	D	6	CASA DE SALUD CANTON RIO FRIO	S	10103D	0101	\N	\N	G
11	1	1	11	SIBASI AHUACHAPAN	1	1	3	3	U	1	09	U	3	U.de S. ATIQUIZAYA	S	10103U	0109	\N	\N	G
12	1	1	10	SIBASI AHUACHAPAN	1	1	4	1	D	1	01	D	6	CASA DE SALUD CANTON EL TIGRE (AHUACH.)	S	10104D	0101	\N	\N	G
13	1	1	1	SIBASI AHUACHAPAN	1	1	4	8	U	1	02	U	3	U.de S. CARA SUCIA	S	10104U	0102	\N	\N	G
14	1	1	10	SIBASI AHUACHAPAN	1	1	5	11	D	1	04	D	6	CASA DE SALUD CANTON CHAGUITE (TACUBA)	S	10105D	0104	\N	\N	G
15	1	1	10	SIBASI AHUACHAPAN	1	1	5	4	U	1	03	U	3	U.de S. ATACO	S	10105U	0103	\N	\N	G
16	1	1	10	SIBASI AHUACHAPAN	1	1	6	11	U	1	04	U	3	U.de S. TACUBA	S	10106U	0104	\N	\N	G
17	1	1	1	SIBASI AHUACHAPAN	1	1	7	8	U	1	02	U	3	U.de S. LA HACHADURA	S	10107U	0102	\N	\N	G
18	1	1	12	SIBASI AHUACHAPAN	1	1	8	6	U	1	07	U	3	U.de S. GUAYMANGO	S	10108U	0107	\N	\N	G
19	1	1	12	SIBASI AHUACHAPAN	1	1	9	7	U	1	08	U	3	U.de S. JUJUTLA	S	10109U	0108	\N	\N	G
20	1	1	12	SIBASI AHUACHAPAN	1	1	10	7	U	1	08	U	3	U.de S. SAN JOSE EL NARANJO (JUJUTLA)	S	10110U	0108	\N	\N	G
21	1	1	10	SIBASI AHUACHAPAN	1	1	11	1	U	1	01	U	3	U.de S. LAS CHINAMAS	S	10111U	0101	\N	\N	G
22	1	1	12	SIBASI AHUACHAPAN	1	1	12	7	U	1	08	U	3	U.de S. GUAYAPA ABAJO	S	10112U	0108	\N	\N	G
23	1	1	12	SIBASI AHUACHAPAN	1	1	13	10	U	1	06	U	3	U.de S. SAN PEDRO PUXTLA	S	10113U	0106	\N	\N	G
24	1	1	11	SIBASI AHUACHAPAN	1	1	14	9	U	1	11	U	3	U.de S. SAN LORENZO(AHUACHAPAN)	S	10114U	0111	\N	\N	G
25	1	1	11	SIBASI AHUACHAPAN	1	1	15	12	U	1	10	U	3	U.de S. TURIN	S	10115U	0110	\N	\N	G
26	1	1	11	SIBASI AHUACHAPAN	1	1	16	5	U	1	12	U	3	U.de S. EL REFUGIO	S	10116U	0112	\N	\N	G
27	1	1	1	SIBASI AHUACHAPAN	1	1	17	8	U	1	02	U	3	U.de S. SAN FRANCISCO MENENDEZ	S	10117U	0102	\N	\N	G
28	1	1	12	SIBASI AHUACHAPAN	1	1	18	7	U	1	08	U	3	U.de S. BARRA DE SANTIAGO	S	10118U	0108	\N	\N	G
29	1	1	1	SIBASI AHUACHAPAN	1	1	19	8	U	1	02	U	3	U.de S. EL ZAPOTE (SAN FCO.MENENDEZ)	S	10119U	0102	\N	\N	G
30	1	1	1	SIBASI AHUACHAPAN	1	1	20	8	U	1	02	U	3	U.de S. GARITA PALMERA	S	10120U	0102	\N	\N	G
31	1	1	1	SIBASI AHUACHAPAN	1	1	21	8	U	1	02	U	3	U.de S. ING.JAVIER ESTRADA	S	10121U	0102	\N	\N	G
32	1	2	136	SIBASI SANTA ANA	1	2	1	22	H	2	01	H	1	HOSPITAL SAN JUAN DE DIOS SANTA ANA	S	10201H	0201	13.9916	-89.551199999999994	G
33	1	2	13	SIBASI SANTA ANA	1	2	1	22	N	2	01	N	7	CRN PRIMAVERA (STA.ANA)	S	10201N	0201	\N	\N	G
34	1	2	13	SIBASI SANTA ANA	1	2	1	22	U	2	01	U	3	U.de S. DR.TOMAS PINEDA MARTINEZ	S	10201U	0201	\N	\N	G
35	1	2	13	SIBASI SANTA ANA	1	2	2	22	U	2	01	U	3	U.de S. CASA DEL NIÑO	S	10202U	0201	\N	\N	G
36	1	2	13	SIBASI SANTA ANA	1	2	3	22	U	2	01	U	3	U.de S. EL PALMAR	S	10203U	0201	\N	\N	G
37	1	2	13	SIBASI SANTA ANA	1	2	4	22	U	2	01	U	3	U.de S. SANTA LUCIA (SANTA ANA)	S	10204U	0201	\N	\N	G
38	1	2	14	SIBASI SANTA ANA	1	2	5	22	U	2	01	U	3	U.de S. SAN MIGUELITO	S	10205U	0201	\N	\N	G
39	1	2	14	SIBASI SANTA ANA	1	2	6	22	U	2	01	U	3	U.de S. SAN RAFAEL (SANTA ANA)	S	10206U	0201	\N	\N	G
40	1	2	14	SIBASI SANTA ANA	1	2	7	22	U	2	01	U	3	U.de S. SANTA BARBARA	S	10207U	0201	\N	\N	G
41	1	2	13	SIBASI SANTA ANA	1	2	8	22	D	2	01	D	6	CASA DE SALUD LOS APOYOS	S	10208D	0201	\N	\N	G
42	1	2	16	SIBASI SANTA ANA	1	2	8	14	U	2	03	U	3	U.de S. COATEPEQUE	S	10208U	0203	\N	\N	G
43	1	2	13	SIBASI SANTA ANA	1	2	9	13	D	2	01	D	6	CASA DE SALUD LOS RIVAS	S	10209D	0201	\N	\N	G
44	1	2	15	SIBASI SANTA ANA	1	2	9	25	U	2	04	U	3	U.de S. TEXISTEPEQUE	S	10209U	0204	\N	\N	G
45	1	2	16	SIBASI SANTA ANA	1	2	10	16	U	2	02	U	3	U.de S. EL CONGO	S	10210U	0202	\N	\N	G
46	1	2	17	SIBASI SANTA ANA	1	2	11	13	U	2	06	U	3	U.de S. CANDELARIA DE LA FRONTERA	S	10211U	0206	\N	\N	G
47	1	2	15	SIBASI SANTA ANA	1	2	13	25	U	2	04	U	3	U.de S. GUARNECIA	S	10213U	0204	\N	\N	G
48	1	2	16	SIBASI SANTA ANA	1	2	14	22	U	2	01	U	3	U.de S. PLANES DE LA LAGUNA	S	10214U	0201	\N	\N	G
49	1	2	14	SIBASI SANTA ANA	1	2	15	22	U	2	01	U	3	U.de S.  NATIVIDAD	S	10215U	0201	\N	\N	G
50	1	2	13	SIBASI SANTA ANA	1	2	17	22	D	2	01	D	6	CASA DE SALUD EL PINALON	S	10217D	0201	\N	\N	G
51	1	2	13	SIBASI SANTA ANA	1	2	19	22	D	2	02	D	6	CASA DE SALUD LOMAS DE SAN MARCELINO	S	10219D	0201	\N	\N	G
52	1	2	16	SIBASI SANTA ANA	1	2	20	14	D	2	03	D	6	CASA DE SALUD PILETAS (COATEPEQUE)	S	10220D	0203	\N	\N	G
637	2	17	63	\N	\N	\N	\N	185	\N	11	\N	D	\N	CASA DE SALUD MAJAGUE	\N	\N	\N	\N	\N	G
53	1	2	17	SIBASI SANTA ANA	1	2	22	13	U	2	06	U	3	U.de S. LA PARADA ALDEA BOLAÑOS	S	10222U	0206	\N	\N	G
54	1	2	16	SIBASI SANTA ANA	1	2	23	14	U	2	03	U	3	U.de S. SAN JACINTO(COATEPEQUE)	S	10223U	0203	\N	\N	G
55	1	2	17	SIBASI SANTA ANA	1	2	25	24	U	2	10	U	3	U.de S. SANTIAGO DE LA FRONTERA	S	10225U	0210	\N	\N	G
56	1	2	17	SIBASI SANTA ANA	1	2	26	20	U	2	13	U	3	U.de S. SAN ANTONIO PAJONAL	S	10226U	0213	\N	\N	G
57	1	2	16	SIBASI SANTA ANA	1	2	27	14	U	2	03	U	3	U.de S. EL TINTERAL	S	10227U	0203	\N	\N	G
58	1	2	15	SIBASI SANTA ANA	1	2	28	25	U	2	04	U	3	U.de S. SAN MIGUEL TEXISTEPEQUE	S	10228U	0204	\N	\N	G
59	1	2	17	SIBASI SANTA ANA	1	2	30	15	U	2	05	U	3	U.de S. SABANETAS EL PASTE	S	10230U	0205	\N	\N	G
60	1	2	17	SIBASI SANTA ANA	1	2	21	13	D	2	06	D	6	CASA DE SALUD SAN VICENTE(CAND.LA FRONT	S	10221D	0203	\N	\N	G
61	1	2	16	SIBASI SANTA ANA	1	2	22	16	D	2	02	D	6	CASA DE SALUD SAN J.LAS FLORES,EL CONGO	S	10222D	0102	\N	\N	G
62	1	2	13	SIBASI SANTA ANA	1	2	3	13	N	2	01	N	7	CRN SAN MIGUEL	S	10203N	0201	\N	\N	G
63	1	2	13	SIBASI METAPAN	1	2	2	19	H	2	09	H	1	HOSPITAL NACIONAL METAPAN	S	10202H	0209	14.3248	-89.443299999999994	G
64	1	2	13	SIBASI METAPAN	1	2	10	19	D	2	09	D	6	CASA DE SALUD MONTENEGRO	S	10210D	0209	\N	\N	G
65	1	2	13	SIBASI METAPAN	1	2	12	23	U	2	12	U	3	U.de S. SANTA ROSA GUACHIPILIN	S	10212U	0212	\N	\N	G
66	1	2	13	SIBASI METAPAN	1	2	18	19	U	2	09	U	3	U.de S. SAN JUAN LAS MINAS (METAPAN)	S	10218U	0209	\N	\N	G
67	1	2	13	SIBASI METAPAN	1	2	19	18	U	2	11	U	3	U.de S. MASAHUAT (SANTA ANA)	S	10219U	0211	\N	\N	G
68	1	2	13	SIBASI METAPAN	1	2	20	19	U	2	09	U	3	U.de S. SAN JERONIMO (METAPAN)	S	10220U	0209	\N	\N	G
69	1	2	13	SIBASI METAPAN	1	2	21	19	U	2	09	U	3	U.de S. BELEN GUIJATH (METAPAN)	S	10221U	0209	\N	\N	G
70	1	2	13	SIBASI METAPAN	1	2	24	19	U	2	09	U	3	U.de S. SAN JOSE INGENIO(METAPAN)	S	10224U	0209	\N	\N	G
71	1	2	13	SIBASI CHALCHUAPA	1	2	2	15	N	2	05	N	7	CRN CRISTOBAL, LA MAGDALENA	S	10202N	0205	\N	\N	G
72	1	2	13	SIBASI CHALCHUAPA	1	2	3	15	H	2	05	H	1	HOSPITAL NACIONAL CHALCHUAPA	S	10203H	0205	\N	\N	G
73	1	2	13	SIBASI CHALCHUAPA	1	2	16	17	U	2	08	U	3	U.de S. EL PORVENIR	S	10216U	0208	\N	\N	G
74	1	2	13	SIBASI CHALCHUAPA	1	2	17	21	U	2	07	U	3	U.de S. SAN SEBASTIAN SALITRILLO	S	10217U	0207	\N	\N	G
75	1	2	13	SIBASI CHALCHUAPA	1	2	29	15	U	2	05	U	3	U.de S. EL COCO	S	10229U	0205	\N	\N	G
76	1	2	13	SIBASI CHALCHUAPA	1	2	31	15	U	2	05	U	3	U.de S. CHALCHUAPA	S	10231U	0205	\N	\N	G
77	1	5	19	SIBASI SONSONATE	1	3	1	31	D	3	08	D	6	CASA DE SALUD PIEDRAS PACHAS	S	10301D	0308	\N	\N	G
78	1	5	137	SIBASI SONSONATE	1	3	1	40	H	3	01	H	1	HOSPITAL DR.JORGE MAZZINI VILLACORTA SONSON.	S	10301H	0301	13.7226	-89.729399999999998	G
79	1	5	19	SIBASI SONSONATE	1	3	1	31	U	3	08	U	3	U.de S. IZALCO	S	10301U	0308	\N	\N	G
80	1	5	19	SIBASI SONSONATE	1	3	2	31	D	3	08	D	6	CASA DE SALUD CANTON CUYAGUALO (IZALCO)	S	10302D	0308	\N	\N	G
81	1	5	19	SIBASI SONSONATE	1	3	2	31	N	3	08	N	7	CRN LAS LAJAS	S	10302N	0308	\N	\N	G
82	1	5	18	SIBASI SONSONATE	1	3	2	33	U	3	02	U	3	U.de S. NAHUIZALCO	S	10302U	0302	\N	\N	G
83	1	5	19	SIBASI SONSONATE	1	3	3	31	D	3	08	D	6	CASA DE SALUD CANTON TALCOMUNCA	S	10303D	0308	\N	\N	G
84	1	5	19	SIBASI SONSONATE	1	3	3	37	N	3	10	N	7	CRN LOS LAGARTOS	S	10303N	0310	\N	\N	G
85	1	5	19	SIBASI SONSONATE	1	3	3	27	U	3	09	U	3	U.de S. ARMENIA	S	10303U	0309	\N	\N	G
86	1	5	19	SIBASI SONSONATE	1	3	4	29	D	3	12	D	6	CASA DE SALUD CANTON SAN LUCAS,CUISNA	S	10304D	0312	\N	\N	G
87	1	5	18	SIBASI SONSONATE	1	3	4	32	N	3	14	N	7	CRN SAN JUAN DE DIOS	S	10304N	0314	\N	\N	G
88	1	5	19	SIBASI SONSONATE	1	3	4	37	U	3	10	U	3	U.de S. SAN JULIAN	S	10304U	0310	\N	\N	G
89	1	5	18	SIBASI SONSONATE	1	3	5	32	D	3	14	D	6	CASA DE SALUD CTON.SN JUAN DE DIOS JUAY	S	10305D	0314	\N	\N	G
90	1	5	20	SIBASI SONSONATE	1	3	5	26	U	3	07	U	3	U.de S.  ACAJUTLA	S	10305U	0307	\N	\N	G
91	1	5	18	SIBASI SONSONATE	1	3	6	32	U	3	14	U	3	U.de S. DR.FRANCISCO MAGAÑA H.JUAYUA	S	10306U	0314	\N	\N	G
92	1	5	20	SIBASI SONSONATE	1	3	7	41	U	3	05	U	3	U.de S. DR.LEONARDO A.LOPEZ V(SONZACATE)	S	10307U	0305	\N	\N	G
93	1	5	20	SIBASI SONSONATE	1	3	8	26	U	3	07	U	3	U.de S. METALIO (ACAJUTLA)	S	10308U	0307	\N	\N	G
94	1	5	18	SIBASI SONSONATE	1	3	9	32	U	3	14	U	3	U.de S. LA MAJADA (JUAYUA)	S	10309U	0314	\N	\N	G
95	1	5	20	SIBASI SONSONATE	1	3	10	34	U	3	04	U	3	U.de S. NAHULINGO	S	10310U	0304	\N	\N	G
96	1	5	18	SIBASI SONSONATE	1	3	11	38	U	3	15	U	3	U.de S. SANTA CATARINA MASAHUAT	S	10311U	0315	\N	\N	G
97	1	5	20	SIBASI SONSONATE	1	3	12	39	U	3	03	U	3	U.de S. SANTO DOMINGO DE GUZMAN	S	10312U	0303	\N	\N	G
98	1	5	19	SIBASI SONSONATE	1	3	13	30	U	3	11	U	3	U.de S. SANTA ISABEL ISHUATAN	S	10313U	0311	\N	\N	G
99	1	5	20	SIBASI SONSONATE	1	3	14	40	U	3	11	U	3	U.de S. SALINAS DE AYACACHAPA	S	10314U	0301	\N	\N	G
100	1	5	19	SIBASI SONSONATE	1	3	15	28	U	3	13	U	3	U.de S. CALUCO	S	10315U	0313	\N	\N	G
101	1	5	19	SIBASI SONSONATE	1	3	16	29	U	3	12	U	3	U.de S. CUISNAHUAT	S	10316U	0312	\N	\N	G
102	1	5	20	SIBASI SONSONATE	1	3	17	36	U	3	06	U	3	U.de S. SAN ANTONIO DEL MONTE	S	10317U	0306	\N	\N	G
103	1	5	18	SIBASI SONSONATE	1	3	18	35	U	3	16	U	3	U.de S. SALCOATITAN	S	10318U	0316	\N	\N	G
104	1	5	18	SIBASI SONSONATE	1	3	19	33	U	3	02	U	3	U.de S. LOS ARENALES (NAHUIZAL)	S	10319U	0302	\N	\N	G
638	2	17	63	\N	\N	\N	\N	204	\N	12	\N	D	\N	CASA DE SALUD GUADALUPE	\N	\N	\N	\N	\N	G
105	5	6	70	SIBASI CHALATENANGO	2	4	1	47	D	4	06	D	6	CASA DE SALUD LLANO GRANDE	S	20401D	0406	\N	\N	G
106	5	6	119	SIBASI CHALATENANGO	2	4	1	48	H	4	01	H	1	HOSPITAL DR. LUIS E.VAZQUEZ CHALATENANGO	S	20401H	0401	\N	\N	G
107	5	6	70	SIBASI CHALATENANGO	2	4	1	51	N	4	28	N	7	CRN SANTA BARBARA	S	20401N	0428	\N	\N	G
108	5	6	71	SIBASI CHALATENANGO	2	4	2	46	D	4	32	D	6	CASA DE SALUD GUACHIPILIN	S	20402D	0432	\N	\N	G
109	5	6	70	SIBASI CHALATENANGO	2	4	2	51	N	4	28	N	7	CRN LOS CRUCES	S	20402N	0428	\N	\N	G
110	5	6	73	SIBASI CHALATENANGO	2	4	2	69	U	4	05	U	3	U.de S. SAN JOSE LAS FLORES	S	20402U	0405	\N	\N	G
111	5	6	74	SIBASI CHALATENANGO	2	4	3	65	D	4	29	D	6	CASA DE SALUD TEOSINTE	S	20403D	0429	\N	\N	G
112	5	6	70	SIBASI CHALATENANGO	2	4	3	48	U	4	01	U	3	U.de S. EL DORADO (CHALATENANGO)	S	20403U	0401	\N	\N	G
113	5	6	74	SIBASI CHALATENANGO	2	4	4	72	N	4	30	N	7	CRN LOS DERAS	S	20404N	0430	\N	\N	G
114	5	6	74	SIBASI CHALATENANGO	2	4	4	49	U	4	26	U	3	U.de S. DULCE NOMBRE DE MARIA	S	20404U	0426	\N	\N	G
115	5	6	72	SIBASI CHALATENANGO	2	4	5	56	U	4	07	U	3	U.de S. NOMBRE DE JESUS	S	20405U	0407	\N	\N	G
116	5	6	70	SIBASI CHALATENANGO	2	4	6	47	N	4	06	N	7	CRN LAS FLORES	S	20406N	0406	\N	\N	G
117	5	6	74	SIBASI CHALATENANGO	2	4	9	73	N	4	31	N	7	CRN EL CHUPADERO	S	20409N	0431	\N	\N	G
118	5	6	70	SIBASI CHALATENANGO	2	4	9	51	U	4	28	U	3	U.de S. EL PARAISO	S	20409U	0428	\N	\N	G
119	5	6	70	SIBASI CHALATENANGO	2	4	10	51	N	4	01	N	7	CRN ROBLE 2	S	20410N	0401	\N	\N	G
120	5	6	73	SIBASI CHALATENANGO	2	4	10	43	U	4	02	U	3	U.de S. ARCATAO	S	20410U	0402	\N	\N	G
121	5	6	70	SIBASI CHALATENANGO	2	4	11	55	U	4	11	U	3	U.de S. LAS VUELTAS	S	20411U	0411	\N	\N	G
122	5	6	71	SIBASI CHALATENANGO	2	4	12	52	U	4	33	U	3	U.de S. LA LAGUNA	S	20412U	0433	\N	\N	G
123	5	6	74	SIBASI CHALATENANGO	2	4	15	64	U	4	29	U	3	U.de S. SAN FRANCISCO MORAZAN	S	20415U	0429	\N	\N	G
124	5	6	71	SIBASI CHALATENANGO	2	4	16	46	U	4	32	U	3	U.de S. COMALAPA	S	20416U	0432	\N	\N	G
125	5	6	71	SIBASI CHALATENANGO	2	4	17	59	U	4	18	U	3	U.de S. OJOS DE AGUA	S	20417U	0418	\N	\N	G
126	5	6	75	SIBASI CHALATENANGO	2	4	18	70	U	4	13	U	3	U.de S. SAN LUIS DEL CARMEN	S	20418U	0413	\N	\N	G
127	5	6	70	SIBASI CHALATENANGO	2	4	19	62	U	4	08	U	3	U.de S. SAN ANTONIO LOS RANCHOS	S	20419U	0408	\N	\N	G
128	5	6	75	SIBASI CHALATENANGO	2	4	20	60	U	4	12	U	3	U.de S. POTONICO	S	20420U	0412	\N	\N	G
129	5	6	75	SIBASI CHALATENANGO	2	4	21	44	U	4	14	U	3	U.de S. AZACUALPA	S	20421U	0414	\N	\N	G
130	5	6	74	SIBASI CHALATENANGO	2	4	22	63	U	4	27	U	3	U.de S. SAN FERNANDO (CHALATEN)	S	20422U	0427	\N	\N	G
131	5	6	75	SIBASI CHALATENANGO	2	4	23	64	U	4	17	U	3	U.de S. SAN FRANCISCO LEMPA	S	20423U	0417	\N	\N	G
132	5	6	73	SIBASI CHALATENANGO	2	4	24	58	U	4	04	U	3	U.de S. NUEVA TRINIDAD	S	20424U	0404	\N	\N	G
133	5	6	74	SIBASI CHALATENANGO	2	4	25	72	U	4	30	U	3	U.de S. SAN RAFAEL	S	20425U	0430	\N	\N	G
134	5	6	70	SIBASI CHALATENANGO	2	4	26	47	U	4	06	U	3	U.de S. CONCEPCION QUEZALTEPEQUE	S	20426U	0406	\N	\N	G
135	5	6	71	SIBASI CHALATENANGO	2	4	27	50	U	4	09	U	3	U.de S. EL CARRIZAL	S	20427U	0409	\N	\N	G
136	5	6	74	SIBASI CHALATENANGO	2	4	28	73	U	4	31	U	3	U.de S. SANTA RITA	S	20428U	0431	\N	\N	G
137	5	6	72	SIBASI CHALATENANGO	2	4	29	61	U	4	10	U	3	U.de S. SAN ANTONIO DE LA CRUZ	S	20429U	0410	\N	\N	G
138	5	6	70	SIBASI CHALATENANGO	2	4	30	71	U	4	16	U	3	U.de S. SAN MIGUEL DE MERCEDES	S	20430U	0416	\N	\N	G
139	5	6	72	SIBASI CHALATENANGO	2	4	31	68	U	4	15	U	3	U.de S. SAN JOSE CANCASQUE	S	20431U	0415	\N	\N	G
140	5	6	72	SIBASI CHALATENANGO	2	4	35	67	U	4	03	U	3	U.de S. SAN ISIDRO LABRADOR	S	20435U	0403	\N	\N	G
141	5	6	71	SIBASI CHALATENANGO	2	4	36	50	U	4	09	U	3	U.de S. VAINILLAS	S	20436U	0409	\N	\N	G
142	5	6	119	SIBASI CHALATENANGO	2	4	11	73	D	4	32	D	6	CASA DE SALUD CANDELARIA (COMALAPA)	S	20411D	0432	\N	\N	G
143	5	6	119	SIBASI NUEVA CONCEPCION	2	4	1	53	U	4	22	U	3	U.de S. LA PALMA	S	20401U	0422	\N	\N	G
144	5	6	119	SIBASI NUEVA CONCEPCION	2	4	2	57	H	4	20	H	1	HOSPITAL NACIONAL DE NUEVA CONCEPCION	S	20402H	0420	\N	\N	G
145	5	6	119	SIBASI NUEVA CONCEPCION	2	4	3	60	N	4	19	N	7	CRN AGUAJE ESCONDIDO	S	20403N	0419	\N	\N	G
146	5	6	119	SIBASI NUEVA CONCEPCION	2	4	4	54	D	4	23	D	6	CASA DE SALUD EL TIGRE	S	20404D	0423	\N	\N	G
147	5	6	119	SIBASI NUEVA CONCEPCION	2	4	5	54	D	4	23	D	6	CASA DE SALUD EL PEPETO	S	20405D	0423	\N	\N	G
148	5	6	119	SIBASI NUEVA CONCEPCION	2	4	6	42	D	4	25	D	6	CASA DE SALUD EL EMCUMBRADO	S	20406D	0425	\N	\N	G
149	5	6	119	SIBASI NUEVA CONCEPCION	2	4	6	42	U	4	25	U	3	U.de S. AGUA CALIENTE	S	20406U	0425	\N	\N	G
150	5	6	119	SIBASI NUEVA CONCEPCION	2	4	7	42	D	4	25	D	6	CASA DE SALUD CERRO GRANDE	S	20407D	0425	\N	\N	G
151	5	6	119	SIBASI NUEVA CONCEPCION	2	4	7	63	N	4	22	N	7	CRN SAN ANTONIO	S	20407N	0422	\N	\N	G
152	5	6	119	SIBASI NUEVA CONCEPCION	2	4	7	74	U	4	19	U	3	U.de S. TEJUTLA	S	20407U	0419	\N	\N	G
153	5	6	119	SIBASI NUEVA CONCEPCION	2	4	8	42	D	4	25	D	6	CASA DE SALUD OBRAJUELO	S	20408D	0425	\N	\N	G
154	5	6	119	SIBASI NUEVA CONCEPCION	2	4	8	57	N	4	20	N	7	CRN LA CRUZ	S	20408N	0420	\N	\N	G
155	5	6	119	SIBASI NUEVA CONCEPCION	2	4	8	54	U	4	23	U	3	U.de S. LA REINA	S	20408U	0423	\N	\N	G
156	5	6	119	SIBASI NUEVA CONCEPCION	2	4	9	53	D	4	22	D	6	CASA DE SALUD LOS PLANES	S	20409D	0422	\N	\N	G
157	5	6	119	SIBASI NUEVA CONCEPCION	2	4	10	57	D	4	20	D	6	CASA DE SALUD SUNAPA	S	20410D	0420	\N	\N	G
639	2	20	36	\N	\N	\N	\N	220	\N	13	\N	O	\N	ONG AMS  CACAOPERA	\N	\N	\N	\N	\N	G
158	5	6	119	SIBASI NUEVA CONCEPCION	2	4	13	45	U	4	21	U	3	U.de S. CITALA	S	20413U	0421	\N	\N	G
159	5	6	119	SIBASI NUEVA CONCEPCION	2	4	14	66	U	4	24	U	3	U.de S. SAN IGNACIO	S	20414U	0424	\N	\N	G
160	5	6	119	SIBASI NUEVA CONCEPCION	2	4	32	57	U	4	20	U	3	U.de S. POTRERO SULA	S	20432U	0420	\N	\N	G
161	5	6	119	SIBASI NUEVA CONCEPCION	2	4	33	57	U	4	20	U	3	U.de S. ARRACAOS	S	20433U	0420	\N	\N	G
162	5	6	119	SIBASI NUEVA CONCEPCION	2	4	34	66	U	4	24	U	3	U.de S. LAS PILAS	S	20434U	0424	\N	\N	G
163	5	8	126	SIBASI LA LIBERTAD	2	5	1	85	H	5	01	H	1	HOSPITAL SAN RAFAEL SANTA TECLA	S	20501H	0501	13.6714	-89.278599999999997	G
164	5	8	24	SIBASI LA LIBERTAD	2	5	1	79	N	5	11	N	7	CRN SHUTIA	S	20501N	0511	\N	\N	G
165	5	8	24	SIBASI LA LIBERTAD	2	5	1	83	U	5	03	U	3	U.de S. PUERTO LA LIBERTAD	S	20501U	0503	\N	\N	G
166	5	8	24	SIBASI LA LIBERTAD	2	5	2	83	N	5	03	N	7	CRN CANGREJERA (SAN ARTURO NIZA)	S	20502N	0503	\N	\N	G
167	5	8	22	SIBASI LA LIBERTAD	2	5	2	81	U	5	02	U	3	U.de S. DR.FCO.LIMA (JAYAQUE)	S	20502U	0502	\N	\N	G
168	5	8	23	SIBASI LA LIBERTAD	2	5	3	85	D	5	01	D	6	CASA DE SALUD LAS GRANADILLAS(SANTA TEC	S	20503D	0501	\N	\N	G
169	5	8	24	SIBASI LA LIBERTAD	2	5	3	83	N	5	03	N	7	CRN MELARA	S	20503N	0503	\N	\N	G
170	5	8	22	SIBASI LA LIBERTAD	2	5	3	76	U	5	22	U	3	U.de S. CIUDAD ARCE	S	20503U	0522	\N	\N	G
171	5	8	23	SIBASI LA LIBERTAD	2	5	4	85	D	5	01	D	6	CASA DE SALUD EL PROGRESO	S	20504D	0501	\N	\N	G
172	5	8	21	SIBASI LA LIBERTAD	2	5	4	96	N	5	22	N	7	CRN EL CONACASTE	S	20504N	0522	\N	\N	G
173	5	8	21	SIBASI LA LIBERTAD	2	5	4	86	U	5	18	U	3	U.de S. QUEZALTEPEQUE	S	20504U	0518	\N	\N	G
174	5	8	21	SIBASI LA LIBERTAD	2	5	5	89	N	5	20	N	7	CRN SITIO GRANDE	S	20505N	0520	\N	\N	G
175	5	8	21	SIBASI LA LIBERTAD	2	5	5	89	U	5	20	U	3	U.de S. SAN JUAN OPICO	S	20505U	0520	\N	\N	G
176	5	8	21	SIBASI LA LIBERTAD	2	5	6	91	U	5	19	U	3	U.de S. SAN PABLO TACACHICO	S	20506U	0519	\N	\N	G
177	5	8	22	SIBASI LA LIBERTAD	2	5	7	77	U	5	08	U	3	U.de S. LOURDES (COLON)	S	20507U	0508	\N	\N	G
178	5	8	21	SIBASI LA LIBERTAD	2	5	8	89	U	5	20	U	3	U.de S. SITIO DEL NIÑO	S	20508U	0520	\N	\N	G
179	5	8	23	SIBASI LA LIBERTAD	2	5	9	85	U	5	01	U	3	U.de S. DR. ALBERTO AGUILAR RIVAS	S	20509U	0501	\N	\N	G
180	5	8	23	SIBASI LA LIBERTAD	2	5	10	78	U	5	04	U	3	U.de S. COMASAGUA	S	20510U	0504	\N	\N	G
181	5	8	23	SIBASI LA LIBERTAD	2	5	11	96	D	5	15	D	6	CASA DE SALUD LA ESMERALDITA	S	20511D	0515	\N	\N	G
182	5	8	21	SIBASI LA LIBERTAD	2	5	11	90	U	5	21	U	3	U.de S. SAN MATIAS	S	20511U	0521	\N	\N	G
183	5	8	22	SIBASI LA LIBERTAD	2	5	12	95	U	5	07	U	3	U.de S. TEPECOYO	S	20512U	0507	\N	\N	G
184	5	8	23	SIBASI LA LIBERTAD	2	5	13	85	D	5	01	D	6	CASA DE SALUD ALVAREZ	S	20513D	0501	\N	\N	G
185	5	8	23	SIBASI LA LIBERTAD	2	5	13	80	U	5	06	U	3	U.de S. HUIZUCAR	S	20513U	0506	\N	\N	G
187	5	8	23	SIBASI LA LIBERTAD	2	5	15	88	U	5	09	U	3	U.de S. SAN JOSE VILLANUEVA	S	20515U	0509	\N	\N	G
188	5	8	23	SIBASI LA LIBERTAD	2	5	16	96	U	5	15	U	3	U.de S. ZARAGOZA	S	20516U	0515	\N	\N	G
189	5	8	24	SIBASI LA LIBERTAD	2	5	17	94	U	5	05	U	3	U.de S. MIZATA	S	20517U	0505	\N	\N	G
190	5	8	24	SIBASI LA LIBERTAD	2	5	18	79	U	5	11	U	3	U.de S. CHILTIUPAN	S	20518U	0511	\N	\N	G
191	5	8	23	SIBASI LA LIBERTAD	2	5	19	85	U	5	01	U	3	U.de S. DR.CARLOS DIAZ DEL PINAL	S	20519U	0501	\N	\N	G
192	5	8	24	SIBASI LA LIBERTAD	2	5	20	92	U	5	10	U	3	U.de S. TAMANIQUE	S	20520U	0510	\N	\N	G
193	5	8	22	SIBASI LA LIBERTAD	2	5	21	87	U	5	17	U	3	U.de S. SACACOYO	S	20521U	0517	\N	\N	G
194	5	8	24	SIBASI LA LIBERTAD	2	5	22	82	U	5	16	U	3	U.de S. JICALAPA	S	20522U	0516	\N	\N	G
195	5	8	22	SIBASI LA LIBERTAD	2	5	23	93	U	5	14	U	3	U.de S. TALNIQUE	S	20523U	0514	\N	\N	G
196	5	8	23	SIBASI LA LIBERTAD	2	5	24	75	U	5	12	U	3	U.de S. ANTIGUO CUSCATLAN	S	20524U	0512	\N	\N	G
197	5	8	23	SIBASI LA LIBERTAD	2	5	25	84	U	5	13	U	3	U.de S. NUEVO CUSCATLAN	S	20525U	0513	\N	\N	G
198	5	8	24	SIBASI LA LIBERTAD	2	5	26	79	U	5	11	U	3	U.de S. ING. ORLANDO RECINOS	S	20526U	0511	\N	\N	G
199	5	8	22	SIBASI LA LIBERTAD	2	5	28	93	U	5	14	U	3	U.de S. SAN JOSE LOS SITIOS	S	20528U	0514	\N	\N	G
200	5	8	22	SIBASI LA LIBERTAD	2	5	27	77	U	5	08	U	3	U.de S. DR.MANUEL GALLADRO COLON	S	20527U	0508	\N	\N	G
201	5	8	21	SIBASI LA LIBERTAD	2	5	16	89	D	5	20	D	6	CASA DE SALUD LAS GRANADILLAS(S.DEL NIÑ	S	20516D	0520	\N	\N	G
202	5	8	21	SIBASI LA LIBERTAD	2	5	17	75	D	5	01	D	6	CASA DE SALUD MELARA (SANTA TECLA)	S	20517D	0501	\N	\N	G
203	5	8	22	SIBASI LA LIBERTAD	2	5	18	87	D	5	01	D	6	CASA DE SALUD VILLA TZU-CHI I	S	20518D	0501	\N	\N	G
204	4	9	110	SIBASI COJUTEPEQUE	3	7	1	125	D	7	02	D	6	CASA DE SALUD CANTON EL ESPINO	S	30701D	0702	\N	\N	G
205	4	9	110	SIBASI COJUTEPEQUE	3	7	1	125	U	7	02	U	3	U.de S. SAN PEDRO PERULAPAN	S	30701U	0702	\N	\N	G
206	4	9	110	SIBASI COJUTEPEQUE	3	7	2	125	D	7	02	D	6	CASA DE SALUD CANTON EL CARMEN (SPPERU)	S	30702D	0702	\N	\N	G
207	4	9	122	SIBASI COJUTEPEQUE	3	7	2	117	H	7	01	H	1	HOSPITAL NAC.NUESTRA SEÑORA DE FATIMA,	S	30702H	0701	\N	\N	G
208	4	9	110	SIBASI COJUTEPEQUE	3	7	3	125	D	7	02	D	6	CASA DE SALUD CANTON TECOLUCO	S	30703D	0702	\N	\N	G
209	4	9	107	SIBASI COJUTEPEQUE	3	7	3	126	U	7	04	U	3	U.de S. SAN RAFAEL CEDROS	S	30703U	0704	\N	\N	G
210	4	9	110	SIBASI COJUTEPEQUE	3	7	4	129	U	7	09	U	3	U.de S. SANTA CRUZ MICHAPA	S	30704U	0709	\N	\N	G
211	4	9	108	SIBASI COJUTEPEQUE	3	7	5	131	D	7	03	D	6	CASA DE SALUD CANTON CORRAL VIEJO	S	30705D	0703	\N	\N	G
212	4	9	108	SIBASI COJUTEPEQUE	3	7	5	131	U	7	03	U	3	U.de S. TENANCINGO	S	30705U	0703	\N	\N	G
213	4	9	107	SIBASI COJUTEPEQUE	3	7	6	118	D	7	07	D	6	CASA DE SALUD CANTON SAN ANTONIO	S	30706D	0707	\N	\N	G
214	4	9	108	SIBASI COJUTEPEQUE	3	7	6	128	U	7	13	U	3	U.de S. SANTA CRUZ ANALQUITO	S	30706U	0713	\N	\N	G
215	4	9	107	SIBASI SUCHITOTO	3	7	7	124	D	7	15	D	6	CASA DE SALUD CANTON PIEDRA LABRADA	S	30707D	0715	\N	\N	G
216	4	9	108	SIBASI COJUTEPEQUE	3	7	7	116	U	7	05	U	3	U.de S. CANDELARIA CUSCATLAN	S	30707U	0705	\N	\N	G
217	4	9	107	SIBASI COJUTEPEQUE	3	7	8	126	D	7	04	D	6	CASA DE SALUD CANTON SOLEDAD, SRCEDROS	S	30708D	0704	\N	\N	G
218	4	9	107	SIBASI COJUTEPEQUE	3	7	8	119	U	7	12	U	3	U.de S. ROSARIO CUSCATLAN	S	30708U	0712	\N	\N	G
219	4	9	107	SIBASI COJUTEPEQUE	3	7	9	120	U	7	06	U	3	U.de S. MONTE SAN JUAN	S	30709U	0706	\N	\N	G
220	4	9	108	SIBASI COJUTEPEQUE	3	7	11	123	U	7	08	U	3	U.de S. SAN CRISTOBAL	S	30711U	0708	\N	\N	G
221	4	9	108	SIBASI COJUTEPEQUE	3	7	12	127	U	7	11	U	3	U.de S. SAN RAMON	S	30712U	0711	\N	\N	G
222	4	9	107	SIBASI COJUTEPEQUE	3	7	13	118	U	7	07	U	3	U.de S. EL CARMEN CUSCATLAN	S	30713U	0707	\N	\N	G
223	4	9	108	SIBASI COJUTEPEQUE	3	8	17	139	U	8	07	U	3	U.de S. SAN EMIGDIO	S	30817U	0807	\N	\N	G
224	4	9	108	SIBASI COJUTEPEQUE	3	8	26	137	U	8	08	U	3	U.de S. PARAISO DE OSORIO	S	30826U	0808	\N	\N	G
225	4	9	107	SIBASI COJUTEPEQUE	3	7	9	117	D	7	01	D	6	CASA DE SALUD CANTON COPINOL	S	30709D	0701	\N	\N	G
226	4	9	107	SIBASI COJUTEPEQUE	3	7	10	117	D	7	01	D	6	CASA DE SALUD CANTON CANDELARIA	S	30710D	0701	\N	\N	G
227	4	9	107	SIBASI COJUTEPEQUE	3	7	11	120	D	7	06	D	6	CASA DE SALUD CANTON SOLEDAD,MONT S JUAN	S	30711D	0706	\N	\N	G
228	4	10	127	SIBASI LA PAZ	3	8	1	152	H	8	01	H	1	HOSPITAL SANTA TERESA ZACATECOLUCA	S	30801H	0801	13.5174	-88.868099999999998	G
229	4	10	27	SIBASI LA PAZ	3	8	1	144	N	8	21	N	7	CRN LAS MONJAS	S	30801N	0821	\N	\N	G
230	4	10	25	SIBASI LA PAZ	3	8	1	147	U	8	05	U	3	U.de S. SAN PEDRO NONUALCO	S	30801U	0805	\N	\N	G
231	4	10	27	SIBASI LA PAZ	3	8	2	144	D	8	16	D	6	CASA DE SALUD AMATECAMPO	S	30802D	0816	\N	\N	G
232	4	10	25	SIBASI LA PAZ	3	8	2	150	N	8	02	N	7	CRN EL TIHUILOCOYO	S	30802N	0802	\N	\N	G
233	4	10	26	SIBASI LA PAZ	3	8	2	146	U	8	17	U	3	U.de S. SAN PEDRO MAZAHUAT	S	30802U	0817	\N	\N	G
234	4	10	28	SIBASI LA PAZ	3	8	3	153	D	8	22	D	6	CASA DE SALUD GUADALUPE LA ZORRA	S	30803D	0822	\N	\N	G
235	4	10	25	SIBASI LA PAZ	3	8	3	150	N	8	02	N	7	CRN HOJA DE SAL	S	30803N	0802	\N	\N	G
236	4	10	25	SIBASI LA PAZ	3	8	3	150	U	8	02	U	3	U.de S. SANTIAGO NONUALCO	S	30803U	0802	\N	\N	G
237	4	10	28	SIBASI LA PAZ	3	8	4	153	D	8	22	D	6	CASA DE SALUD LA CALZADA	S	30804D	0822	\N	\N	G
238	4	10	28	SIBASI LA PAZ	3	8	4	150	N	8	22	N	7	CRN EL PORFIADO	S	30804N	0822	\N	\N	G
239	4	10	28	SIBASI LA PAZ	3	8	4	153	U	8	22	U	3	U.de S. SAN LUIS LA HERRADURA	S	30804U	0822	\N	\N	G
240	4	10	27	SIBASI LA PAZ	3	8	5	146	D	8	16	D	6	CASA DE SALUD ASTORIA	S	30805D	0816	\N	\N	G
241	4	10	27	SIBASI LA PAZ	3	8	5	146	N	8	16	N	7	CRN VILLA PALESTINA	S	30805N	0816	\N	\N	G
242	4	10	27	SIBASI LA PAZ	3	8	5	144	U	8	16	U	3	U.de S. SAN LUIS TALPA	S	30805U	0816	\N	\N	G
243	4	10	26	SIBASI LA PAZ	3	8	6	146	D	8	17	D	6	CASA DE SALUD BARAHONA	S	30806D	0817	\N	\N	G
244	4	10	26	SIBASI LA PAZ	3	8	6	146	N	8	17	N	7	CRN EL ACHIOTAL	S	30806N	0817	\N	\N	G
245	4	10	27	SIBASI LA PAZ	3	8	6	136	U	8	11	U	3	U.de S. OLOCUILTA	S	30806U	0811	\N	\N	G
246	4	10	27	SIBASI LA PAZ	3	8	7	136	D	8	11	D	6	CASA DE SALUD LA ESPERANZA (OLOCUILTA)	S	30807D	0811	\N	\N	G
247	4	10	26	SIBASI LA PAZ	3	8	7	146	N	8	17	N	7	CRN EL PORVENIR	S	30807N	0817	\N	\N	G
248	4	10	26	SIBASI LA PAZ	3	8	7	133	U	8	21	U	3	U.de S. ROSARIO LA PAZ	S	30807U	0821	\N	\N	G
249	4	10	27	SIBASI LA PAZ	3	8	8	136	D	8	11	D	6	CASA DE SALUD SAN SEBASTIAN	S	30808D	0811	\N	\N	G
250	4	10	26	SIBASI LA PAZ	3	8	8	133	N	8	16	N	7	CRN EL PEDREGAL	S	30808N	0816	\N	\N	G
251	4	10	25	SIBASI LA PAZ	3	8	8	141	U	8	03	U	3	U.de S. SAN JUAN NONUALCO	S	30808U	0803	\N	\N	G
252	4	10	26	SIBASI LA PAZ	3	8	9	146	N	8	17	N	7	CRN SAN MARCOS JIBOA	S	30809N	0817	\N	\N	G
253	4	10	25	SIBASI LA PAZ	3	8	9	149	U	8	06	U	3	U.de S. SANTA MARIA OSTUMA	S	30809U	0806	\N	\N	G
254	4	10	28	SIBASI LA PAZ	3	8	10	153	N	8	22	N	7	CRN GUADALUPE LA ZORRA	S	30810N	0822	\N	\N	G
255	4	10	26	SIBASI LA PAZ	3	8	10	145	U	8	18	U	3	U.de S. SAN MIGUEL TEPEZONTES	S	30810U	0818	\N	\N	G
256	4	10	25	SIBASI LA PAZ	3	8	11	148	U	8	04	U	3	U.de S. SAN RAFAEL OBRAJUELO	S	30811U	0804	\N	\N	G
257	4	10	27	SIBASI LA PAZ	3	8	12	142	U	8	12	U	3	U.de S. SAN JUAN TALPA	S	30812U	0812	\N	\N	G
258	4	10	26	SIBASI LA PAZ	3	8	13	143	U	8	20	U	3	U.de S. SAN JUAN TEPEZONTES	S	30813U	0820	\N	\N	G
259	4	10	27	SIBASI LA PAZ	3	8	14	140	U	8	14	U	3	U.de S. SAN FRANCISCO CHINAMECA	S	30814U	0814	\N	\N	G
260	4	13	29	SIBASI SAN VICENTE	3	8	15	134	U	8	09	U	3	U.de S. JERUSALEN	S	30815U	0809	\N	\N	G
261	4	10	27	SIBASI LA PAZ	3	8	16	136	U	8	11	U	3	U.de S. SANTA LUCIA ORCOYO	S	30816U	0811	\N	\N	G
262	4	10	27	SIBASI LA PAZ	3	8	18	132	U	8	13	U	3	U.de S. CUYULTITAN	S	30818U	0813	\N	\N	G
263	4	10	28	SIBASI LA PAZ	3	8	19	146	U	8	17	U	3	U.de S. LAS ISLETAS	S	30819U	0817	\N	\N	G
264	4	10	26	SIBASI LA PAZ	3	8	20	146	U	8	17	U	3	U.de S. EL ACHIOTAL (SAN PEDRO MAZAGUAT)	S	30820U	0817	\N	\N	G
265	4	10	25	SIBASI LA PAZ	3	8	21	150	U	8	02	U	3	U.de S. SAN JOSE LA PAZ ARRIBA	S	30821U	0802	\N	\N	G
266	4	10	28	SIBASI LA PAZ	3	8	22	153	U	8	22	U	3	U.de S. EL ZAPOTE(LA HERRADURA)	S	30822U	0822	\N	\N	G
267	4	10	26	SIBASI LA PAZ	3	8	23	138	U	8	19	U	3	U.de S. SAN ANTONIO MASAHUATH	S	30823U	0819	\N	\N	G
268	4	10	27	SIBASI LA PAZ	3	8	24	144	U	8	16	U	3	U.de S. EL PIMENTAL (SN.L.TALPA)	S	30824U	0816	\N	\N	G
269	4	10	27	SIBASI LA PAZ	3	8	25	151	U	8	15	U	3	U.de S. TAPALHUACA	S	30825U	0815	\N	\N	G
270	4	10	25	SIBASI LA PAZ	3	8	27	152	U	8	01	U	3	U.de S. DR.CARLOS ALBERTO GALEANO	S	30827U	0801	\N	\N	G
271	4	10	25	SIBASI LA PAZ	3	8	9	152	D	8	01	D\n	6	CASA DE SALUD EL PICHICHE (ZACATECOLUCA	S	30809D	0801	\N	\N	G
272	4	10	25	SIBASI LA PAZ	3	8	10	152	D	8	01	D	6	CASA DE SALUD AZACUALPA	S	30810D	0801	\N	\N	G
273	4	13	29	SIBASI SAN VICENTE	3	8	28	135	U	8	10	U	3	U.de S. MERCEDES LA CEIBA	S	30828U	0810	\N	\N	G
274	4	10	25	SIBASI LA PAZ	3	8	11	152	D	8	01	D	6	CASA DE SALUD SAN FAUSTINO	S	30811D	0801	\N	\N	G
275	4	10	27	SIBASI LA PAZ	3	8	12	142	D	8	16	C	6	CLINICA OFICINA DE SANEAM.INTERNACIONAL	S	30812D	0816	\N	\N	G
276	4	12	4	SIBASI SENSUNTEPEQUE	3	9	1	159	H	9	01	H	1	HOSPITAL NACIONAL  SENSUNTEPEQUE	S	30901H	0901	\N	\N	G
277	4	12	4	SIBASI SENSUNTEPEQUE	3	9	2	158	U	9	04	U	3	U.de S. SAN ISIDRO (CABAÑAS)	S	30902U	0904	\N	\N	G
278	4	12	4	SIBASI SENSUNTEPEQUE	3	9	3	158	N	9	04	N	7	CRN  IZCATAL	S	30903N	0904	\N	\N	G
279	4	12	4	SIBASI SENSUNTEPEQUE	3	9	3	161	U	9	02	U	3	U.de S. VICTORIA	S	30903U	0902	\N	\N	G
280	4	12	4	SIBASI SENSUNTEPEQUE	3	9	4	158	N	9	04	N	7	CRN HACIENDA VIEJA	S	30904N	0904	\N	\N	G
281	4	12	4	SIBASI SENSUNTEPEQUE	3	9	5	158	N	9	04	N	7	CRN PUERTONA	S	30905N	0904	\N	\N	G
282	4	12	4	SIBASI SENSUNTEPEQUE	3	9	6	159	D	9	01	D	6	CASA DE SALUD COPINOLAPA	S	30906D	0901	\N	\N	G
283	4	12	4	SIBASI SENSUNTEPEQUE	3	9	6	158	N	9	04	N	7	CRN JOBITOS	S	30906N	0904	\N	\N	G
284	4	12	4	SIBASI SENSUNTEPEQUE	3	9	7	159	D	9	01	D	6	CASA DE SALUD SAN MARCOS	S	30907D	0901	\N	\N	G
285	4	12	4	SIBASI SENSUNTEPEQUE	3	9	7	162	U	9	03	U	3	U.de S. DOLORES	S	30907U	0903	\N	\N	G
286	4	12	4	SIBASI SENSUNTEPEQUE	3	9	8	159	D	9	01	D	6	CASA DE SALUD SAN GREGORIO	S	30908D	0901	\N	\N	G
287	4	12	4	SIBASI SENSUNTEPEQUE	3	9	9	159	D	9	01	D	6	CASA DE SALUD CUYANTEPEQUE	S	30909D	0901	\N	\N	G
288	4	12	4	SIBASI SENSUNTEPEQUE	3	9	10	161	D	9	02	D	6	CASA DE SALUD SAN PEDRO	S	30910D	0902	\N	\N	G
289	4	12	4	SIBASI SENSUNTEPEQUE	3	9	10	159	N	9	01	N	7	CRN SANTA CRUZ LA JUNTA	S	30910N	0901	\N	\N	G
290	4	12	4	SIBASI SENSUNTEPEQUE	3	9	10	155	U	9	05	U	3	U.de S. GUACOTECTI	S	30910U	0905	\N	\N	G
291	4	12	4	SIBASI SENSUNTEPEQUE	3	9	11	161	D	9	02	D	6	CASA DE SALUD PARATAO	S	30911D	0902	\N	\N	G
292	4	12	4	SIBASI SENSUNTEPEQUE	3	9	12	162	D	9	03	D	6	CASA DE SALUD SAN CARLOS	S	30912D	0903	\N	\N	G
293	4	12	4	SIBASI SENSUNTEPEQUE	3	9	13	159	U	9	01	U	3	U.de S. SENSUNTEPEQUE	S	30913U	0901	\N	\N	G
294	4	12	4	SIBASI SENSUNTEPEQUE	3	9	14	161	U	9	02	U	3	U.de S. SANTA MARTA	S	30914U	0902	\N	\N	G
295	4	12	4	SIBASI SENSUNTEPEQUE	4	12	21	209	U	12	18	U	3	U.de S. NUEVO EDEN DE SAN JUAN	S	41221U	1218	\N	\N	G
296	4	12	6	SIBASI ILOBASCO	3	9	1	156	D	9	06	D	6	CASA DE SALUD SAN FRANCISCO IRAHETA	S	30901D	0906	\N	\N	G
688	1	1	12	\N	\N	\N	\N	7	\N	1	\N	O	\N	OP SERAPHIN JUJUTLA	\N	\N	\N	\N	\N	G
297	4	12	4	SIBASI ILOBASCO	3	9	1	159	N	9	06	N	7	CRN ORATORIO CENTRO	S	30901N	0906	\N	\N	G
298	4	12	6	SIBASI ILOBASCO	3	9	2	156	D	9	06	D	6	CASA DE SALUD POTRERO	S	30902D	0906	\N	\N	G
299	4	12	123	SIBASI ILOBASCO	3	9	2	156	H	9	06	H	1	HOSPITAL DR.JOSE L.SACA (ILOBASCO)	S	30902H	0906	\N	\N	G
300	4	12	6	SIBASI ILOBASCO	3	9	3	156	D	9	06	D	6	CASA DE SALUD HUERTAS	S	30903D	0906	\N	\N	G
301	4	12	6	SIBASI ILOBASCO	3	9	4	157	D	9	08	D	6	CASA DE SALUD SAN SEBAST.CERRON GRANDE	S	30904D	0908	\N	\N	G
302	4	12	5	SIBASI ILOBASCO	3	9	4	162	U	9	09	U	3	U.de S. CINQUERA	S	30904U	0909	\N	\N	G
303	4	12	6	SIBASI ILOBASCO	3	9	5	159	D	9	01	D	6	CASA DE SALUD SAN NICOLAS	S	30905D	0901	\N	\N	G
304	4	12	5	SIBASI ILOBASCO	3	9	5	160	U	9	07	U	3	U.de S. TEJUTEPEQUE	S	30905U	0907	\N	\N	G
305	4	12	6	SIBASI ILOBASCO	3	9	6	161	U	9	08	U	3	U.de S. JUTIAPA	S	30906U	0908	\N	\N	G
306	4	12	4	SIBASI ILOBASCO	3	9	7	154	N	9	01	N	7	CRN SAN NICOLAS	S	30907N	0901	\N	\N	G
307	4	12	4	SIBASI ILOBASCO	3	9	8	154	N	9	01	N	7	CRN CAMPAMENTO 2 CANTON SAN NICOLAS	S	30908N	0901	\N	\N	G
308	4	12	4	SIBASI ILOBASCO	3	9	8	159	U	9	06	U	3	U.de S. SANTA LUCIA (ILOBASCO)	S	30908U	0906	\N	\N	G
309	4	12	6	SIBASI ILOBASCO	3	9	9	161	U	9	08	U	3	U.de S. CAROLINA (JUTIAPA )	S	30909U	0908	\N	\N	G
310	4	12	4	SIBASI ILOBASCO	3	9	11	159	U	9	06	U	3	U.de S. SAN FCO.DEL MONTE	S	30911U	0906	\N	\N	G
311	4	12	4	SIBASI ILOBASCO	3	9	12	156	U	9	06	U	3	U.de S. ILOBASCO	S	30912U	0906	\N	\N	G
312	4	12	5	SIBASI ILOBASCO	3	9	13	160	D	9	07	D	6	CASA DE SALUD EL ZAPOTE (TEJUTEPEQUE)	S	30913D	0907	\N	\N	G
313	4	12	6	SIBASI ILOBASCO	3	9	14	156	D	9	06	D	6	CASA DE SALUD SAN JOSE (ILOBASCO)	S	30914D	0906	\N	\N	G
314	4	13	134	SIBASI SAN VICENTE	3	10	1	172	H	10	01	H	1	HOSPITAL SANTA GERTRUDIS SAN VICENTE	S	31001H	1001	\N	\N	G
315	4	13	29	SIBASI SAN VICENTE	3	10	1	163	N	10	01	N	7	CRN FENADESAL	S	31001N	1001	\N	\N	G
316	4	13	31	SIBASI SAN VICENTE	3	10	1	171	U	10	08	U	3	U.de S. SAN SEBASTIAN	S	31001U	1008	\N	\N	G
317	4	13	29	SIBASI SAN VICENTE	3	10	2	165	N	10	07	N	7	CRN SAN CAYETANO ISTEPEQUE	S	31002N	1007	\N	\N	G
318	4	13	29	SIBASI SAN VICENTE	3	10	2	164	U	10	03	U	3	U.de S. GUADALUPE	S	31002U	1003	\N	\N	G
640	2	20	37	\N	\N	\N	\N	223	\N	13	\N	O	\N	ONG AMS DELICIAS DE CONCEPCION	\N	\N	\N	\N	\N	G
319	4	13	32	SIBASI SAN VICENTE	3	10	3	173	U	10	06	U	3	U.de S. TECOLUCA	S	31003U	1006	\N	\N	G
320	4	13	29	SIBASI SAN VICENTE	3	10	1	172	D	10	01	D	6	CASA DE SALUD AGUA CALIENTE	S	31001D	1001	\N	\N	G
321	4	13	30	SIBASI SAN VICENTE	3	10	4	163	U	10	02	U	3	U.de S. APASTEPEQUE	S	31004U	1002	\N	\N	G
322	4	13	29	SIBASI SAN VICENTE	3	10	2	172	D	10	01	D	6	CASA DE SALUD DOS QUEBRADAS	S	31002D	1001	\N	\N	G
323	4	13	29	SIBASI SAN VICENTE	3	10	5	175	U	10	04	U	3	U.de S. VERAPAZ	S	31005U	1004	\N	\N	G
324	4	13	31	SIBASI SAN VICENTE	3	10	6	167	U	10	11	U	3	U.de S. SANTO DOMINGO	S	31006U	1011	\N	\N	G
325	4	13	29	SIBASI SAN VICENTE	3	10	7	174	U	10	05	U	3	U.de S. TEPETITAN	S	31007U	1005	\N	\N	G
326	4	13	29	SIBASI SAN VICENTE	3	10	8	172	U	10	01	U	3	U.de S. PERIFERICA SAN VICENTE	S	31008U	1001	\N	\N	G
327	4	13	30	SIBASI SAN VICENTE	3	10	9	169	U	10	13	U	3	U.de S. SAN ILDEFONSO	S	31009U	1013	\N	\N	G
328	4	13	30	SIBASI SAN VICENTE	3	10	10	168	U	10	09	U	3	U.de S. SAN ESTEBAN CATARINA	S	31010U	1009	\N	\N	G
329	4	13	32	SIBASI SAN VICENTE	3	10	11	173	U	10	06	U	3	U.de S. SAN CARLOS LEMPA	S	31011U	1006	\N	\N	G
330	4	13	30	SIBASI SAN VICENTE	3	10	12	166	U	10	12	U	3	U.de S. SANTA CLARA	S	31012U	1012	\N	\N	G
331	4	13	31	SIBASI SAN VICENTE	3	10	13	170	U	10	10	U	3	U.de S. SAN LORENZO(SN.VICENTE)	S	31013U	1010	\N	\N	G
332	4	13	29	SIBASI SAN VICENTE	3	10	14	165	U	10	07	U	3	U.de S. SAN CAYETANO ISTEPEQUE	S	31014U	1007	\N	\N	G
333	4	13	32	SIBASI SAN VICENTE	3	10	15	173	U	10	06	U	3	U.de S. SAN NICOLAS LEMPA	S	31015U	1006	\N	\N	G
334	2	14	138	SIBASI USULUTAN	4	11	1	198	H	11	01	H	1	HOSPITAL SAN PEDRO USULUTAN	S	41101H	1101	\N	\N	G
335	2	14	79	SIBASI USULUTAN	4	11	1	179	N	11	08	N	7	CRN HACIENDA NUEVA	S	41101N	1108	\N	\N	G
336	2	14	79	SIBASI USULUTAN	4	11	2	185	D	11	05	D	6	CASA DE SALUD CANTON SAMURIA	S	41102D	1105	\N	\N	G
337	2	14	79	SIBASI USULUTAN	4	11	2	179	N	11	08	N	7	CRN MONTEFRESCO	S	41102N	1108	\N	\N	G
338	2	14	79	SIBASI USULUTAN	4	11	3	185	D	11	05	D	6	CASA DE SALUD CANTON EL JUTAL	S	41103D	1105	\N	\N	G
339	2	14	79	SIBASI USULUTAN	4	11	7	193	U	11	02	U	3	U.de S. SANTA ELENA	S	41107U	1102	\N	\N	G
340	2	14	79	SIBASI USULUTAN	4	11	8	185	U	11	05	U	3	U.de S. JUCUARAN	S	41108U	1105	\N	\N	G
341	2	14	79	SIBASI USULUTAN	4	11	9	188	U	11	07	U	3	U.de S. OZATLAN	S	41109U	1107	\N	\N	G
342	2	14	79	SIBASI USULUTAN	4	11	10	198	D	11	01	D	6	CASA DE SALUD CANTON LA PEÑA (USULUTAN)	S	41110D	1101	\N	\N	G
343	2	14	80	SIBASI USULUTAN	4	11	10	179	U	11	08	U	3	U.de S. CONCEPCION BATRES	S	41110U	1108	\N	\N	G
344	2	14	79	SIBASI USULUTAN	4	11	14	195	U	11	09	U	3	U.de S. SANTA MARIA	S	41114U	1109	\N	\N	G
345	2	14	79	SIBASI USULUTAN	4	11	15	198	U	11	01	U	3	U.de S. EL MOLINO	S	41115U	1101	\N	\N	G
346	2	14	79	SIBASI USULUTAN	4	11	26	181	U	11	06	U	3	U.de S. EREGUAYQUIN	S	41126U	1106	\N	\N	G
347	2	14	79	SIBASI USULUTAN	4	11	27	198	U	11	01	U	3	U.de S. PUERTO PARADA	S	41127U	1101	\N	\N	G
348	2	14	79	SIBASI USULUTAN	4	11	28	185	U	11	05	U	3	U.de S. EL ESPINO	S	41128U	1105	\N	\N	G
349	2	14	79	SIBASI USULUTAN	4	11	29	192	U	11	04	U	3	U.de S. SAN DIONISIO	S	41129U	1104	\N	\N	G
350	2	14	79	SIBASI USULUTAN	4	11	34	198	U	11	01	U	3	U.de S. LA CRUZ	S	41434U	1101	\N	\N	G
351	2	14	80	SIBASI USULUTAN	4	12	4	216	U	12	11	U	3	U.de S. SAN RAFAEL ORIENTE	S	41204U	1211	\N	\N	G
352	2	14	80	SIBASI USULUTAN	4	12	5	205	U	12	12	U	3	U.de S. EL TRANSITO	S	41205U	1212	\N	\N	G
353	2	14	80	SIBASI USULUTAN	4	12	19	213	U	12	14	U	3	U.de S. SAN JORGE	S	41219U	1214	\N	\N	G
354	2	14	80	SIBASI USULUTAN	4	12	28	205	U	12	12	U	3	U.de S. PRIMAVERA	S	41228U	1212	\N	\N	G
355	2	14	80	SIBASI SANTIAGO DE MARIA	4	11	1	177	U	11	20	U	3	U.de S. BERLIN	S	41101U	1120	\N	\N	G
356	2	14	79	SIBASI SANTIAGO DE MARIA	4	11	2	196	H	11	16	H	1	HOSPITAL SANTIAGO DE MARIA	S	41102H	1116	\N	\N	G
357	2	14	80	SIBASI SANTIAGO DE MARIA	4	11	4	182	D	11	12	D	6	CASA DE SALUD CTN.LA CRUZ (ESTANZUELA)	S	41104D	1112	\N	\N	G
358	2	14	79	SIBASI SANTIAGO DE MARIA	4	11	4	182	U	11	12	U	3	U.de S. ESTANZUELAS	S	41104U	1112	\N	\N	G
359	2	14	80	SIBASI SANTIAGO DE MARIA	4	11	5	187	D	11	15	D	6	CASA DE SALUD CANTON AZACUALPIA JOCOMONT	S	41105D	1115	\N	\N	G
360	2	14	79	SIBASI SANTIAGO DE MARIA	4	11	6	197	D	11	18	D	6	CASA DE SALUD CANTON CHAPETONES	S	41106D	1118	\N	\N	G
361	2	14	79	SIBASI SANTIAGO DE MARIA	4	11	7	187	D	11	15	D	6	CASA DE SALUD CTON.SAN JOSE (NVA.GRANAD	S	41107D	1115	\N	\N	G
362	2	14	79	SIBASI SANTIAGO DE MARIA	4	11	8	187	D	11	15	D	6	CASA DE SALUD CTON.PALOMILLA DE GUALCHO	S	41108D	1115	\N	\N	G
363	2	14	79	SIBASI SANTIAGO DE MARIA	4	11	9	187	D	11	15	D	6	CASA DE SALUD CTON.AZACUALPIA D GUALCHO	S	41109D	1115	\N	\N	G
364	2	14	79	SIBASI SANTIAGO DE MARIA	4	11	12	176	U	11	17	U	3	U.de S. ALEGRIA	S	41112U	1117	\N	\N	G
365	2	14	79	SIBASI SANTIAGO DE MARIA	4	11	13	186	U	11	22	U	3	U.de S. MERCEDES UMAÑA	S	41113U	1122	\N	\N	G
366	2	14	80	SIBASI SANTIAGO DE MARIA	4	11	18	178	U	11	19	U	3	U.de S. CALIFORNIA	S	41118U	1119	\N	\N	G
367	2	14	79	SIBASI SANTIAGO DE MARIA	4	11	19	187	U	11	15	U	3	U.de S. NUEVA GRANADA	S	41119U	1115	\N	\N	G
368	2	14	79	SIBASI SANTIAGO DE MARIA	4	11	20	197	U	11	18	U	3	U.de S. TECAPAN	S	41120U	1118	\N	\N	G
369	2	14	79	SIBASI SANTIAGO DE MARIA	4	11	22	180	U	11	13	U	3	U.de S. EL TRIUNFO	S	41122U	1113	\N	\N	G
370	2	14	79	SIBASI SANTIAGO DE MARIA	4	11	23	196	U	11	16	U	3	U.de S. EL CERRITO	S	41123U	1116	\N	\N	G
371	2	14	80	SIBASI JIQUILISCO	4	11	1	183	D	11	03	D	6	CASA DE SALUD LOS ESPERANZA (JIQUILISC)	S	41101D	1103	\N	\N	G
641	2	17	63	\N	\N	\N	\N	239	\N	13	\N	O	\N	ONG AMS SAN SIMON CIUDAD BARRIOS	\N	\N	\N	\N	\N	G
372	2	14	80	SIBASI JIQUILISCO	4	11	3	183	H	11	03	H	1	HOSPITAL JIQUILISCO	S	41103H	1103	\N	\N	G
373	2	14	80	SIBASI JIQUILISCO	4	11	3	189	N	11	10	N	7	CRN ISLA MADRE SAL	S	41103N	1110	\N	\N	G
374	2	14	79	SIBASI JIQUILISCO	4	11	5	183	U	11	03	U	3	U.de S. TIERRA BLANCA (JIQUILISCO)	S	41105U	1103	\N	\N	G
375	2	14	79	SIBASI JIQUILISCO	4	11	6	189	U	11	10	U	3	U.de S. PUERTO EL TRIUNFO	S	41106U	1110	\N	\N	G
376	2	14	79	SIBASI JIQUILISCO	4	11	11	190	U	11	21	U	3	U.de S. SAN AGUSTIN	S	41111U	1121	\N	\N	G
377	2	14	79	SIBASI JIQUILISCO	4	11	17	194	U	11	23	U	3	U.de S. SAN FRANCISCO JAVIER	S	41117U	1123	\N	\N	G
378	2	14	79	SIBASI JIQUILISCO	4	11	21	183	U	11	03	U	3	U.de S. ISLA DE MENDEZ	S	41121U	1103	\N	\N	G
379	2	14	79	SIBASI JIQUILISCO	4	11	24	183	U	11	03	U	3	U.de S. EL QUEBRADO	S	41124U	1103	\N	\N	G
380	2	14	79	SIBASI JIQUILISCO	4	11	25	189	U	11	10	U	3	U.de S. CORRAL DE MULAS	S	41125U	1110	\N	\N	G
381	2	14	79	SIBASI JIQUILISCO	4	11	30	183	U	11	03	U	3	U.de S. LA CANOA	S	41130U	1103	\N	\N	G
382	2	14	79	SIBASI JIQUILISCO	4	11	31	183	U	11	03	U	3	U.de S. SALINAS DE SISIGUAYO	S	41131U	1103	\N	\N	G
383	2	14	79	SIBASI JIQUILISCO	4	11	32	183	U	11	03	U	3	U.de S. NUEVO AMANECER	S	41132U	1103	\N	\N	G
384	2	14	80	SIBASI JIQUILISCO	4	11	11	178	D	11	03	D	6	CASA DE SALUD SAN HILARIO	S	41111D	1103	\N	\N	G
385	2	17	133	SIBASI SAN MIGUEL	4	12	1	215	H	12	01	H	1	HOSPITAL SAN JUAN DE DIOS SAN MIGUEL	S	41201H	1201	13.473800000000001	-88.191000000000003	G
386	2	17	89	SIBASI SAN MIGUEL	4	12	1	215	N	12	01	N	7	CRN MAYUCAQUIN	S	41201N	1201	\N	\N	G
387	2	17	64	SIBASI SAN MIGUEL	4	12	3	215	D	12	01	D	6	CASA DE SALUD LOS RANCHOS	S	41203D	1201	\N	\N	G
388	2	17	88	SIBASI SAN MIGUEL	4	12	3	217	U	12	15	U	3	U.de S. SESORI	S	41203U	1215	\N	\N	G
389	2	17	89	SIBASI SAN MIGUEL	4	12	4	215	D	12	01	D	6	CASA DE SALUD SANTA FIDELIA	S	41204D	1201	\N	\N	G
390	2	17	89	SIBASI SAN MIGUEL	4	12	5	215	D	12	01	D	6	CASA DE SALUD CASA DE LA MISERICORDIA	S	41205D	1201	\N	\N	G
391	2	17	89	SIBASI SAN MIGUEL	4	12	6	215	D	12	01	D	6	CASA DE SALUD ASILO SAN ANTONIO	S	41206D	1201	\N	\N	G
392	2	17	89	SIBASI SAN MIGUEL	4	12	8	215	D	12	01	D	6	CASA DE SALUD LOS CARRETOS	S	41208D	1201	\N	\N	G
393	2	17	64	SIBASI SAN MIGUEL	4	12	8	215	U	12	01	U	3	U.de S. DR.ROBERTO A.CARIAS (LA PRESITA)	S	41208U	1201	\N	\N	G
394	2	17	89	SIBASI SAN MIGUEL	4	12	9	203	D	12	09	D	6	CASA DE SALUD CHAMBALA	S	41209D	1209	\N	\N	G
395	2	17	63	SIBASI SAN MIGUEL	4	12	9	204	U	12	06	U	3	U.de S. CHIRILAGUA	S	41209U	1206	\N	\N	G
396	2	17	90	SIBASI SAN MIGUEL	4	12	10	215	U	12	01	U	3	U.de S. MILAGRO DE LA PAZ	S	41210U	1201	\N	\N	G
397	2	17	89	SIBASI SAN MIGUEL	4	12	11	203	U	12	09	U	3	U.de S. LAS PLACITAS	S	41211U	1209	\N	\N	G
398	2	17	88	SIBASI SAN MIGUEL	4	12	12	202	U	12	05	U	3	U.de S. CHAPELTIQUE	S	41212U	1205	\N	\N	G
399	2	17	87	SIBASI SAN MIGUEL	4	12	14	215	U	12	01	U	3	U.de S. EL ZAMORAN	S	41214U	1201	\N	\N	G
400	2	17	88	SIBASI SAN MIGUEL	4	12	15	217	D	12	15	D	6	CASA DE SALUD EL TABLON	S	41215D	1215	\N	\N	G
401	2	17	87	SIBASI SAN MIGUEL	4	12	15	215	U	12	01	U	3	U.de S. SAN CARLOS (SAN MIGUEL)	S	41215U	1201	\N	\N	G
402	2	17	63	SIBASI SAN MIGUEL	4	12	16	204	D	12	06	D	6	CASA DE SALUD CHILANGUERA	S	41216D	1206	\N	\N	G
403	2	17	64	SIBASI SAN MIGUEL	4	12	16	215	U	12	01	U	3	U.de S. SAN ANTONIO SILVA	S	41216U	1201	\N	\N	G
404	2	17	89	SIBASI SAN MIGUEL	4	12	17	207	U	12	03	U	3	U.de S. EL PLATANAR	S	41217U	1203	\N	\N	G
405	2	17	89	SIBASI SAN MIGUEL	4	12	22	218	U	12	04	U	3	U.de S. ULUAZAPA	S	41222U	1204	\N	\N	G
406	2	17	87	SIBASI SAN MIGUEL	4	12	24	201	U	12	08	U	3	U.de S. COMACARAN	S	41224U	1208	\N	\N	G
407	2	17	63	SIBASI SAN MIGUEL	4	12	25	204	U	12	06	U	3	U.de S. EL CUCO	S	41225U	1206	\N	\N	G
408	2	17	63	SIBASI SAN MIGUEL	4	12	26	204	U	12	06	U	3	U.de S. SAN PEDRO CHIRILAGUA	S	41226U	1206	\N	\N	G
409	2	17	89	SIBASI SAN MIGUEL	4	12	27	210	U	12	07	U	3	U.de S. QUELEPA	S	41227U	1207	\N	\N	G
410	2	17	64	SIBASI SAN MIGUEL	4	12	29	215	U	12	01	U	3	U.de S. EL TECOMATAL	S	41229U	1201	\N	\N	G
411	2	17	89	SIBASI SAN MIGUEL	4	12	30	215	U	12	01	U	3	U.de S. EL NIÑO	S	41230U	1201	\N	\N	G
412	2	17	63	SIBASI SAN MIGUEL	4	12	31	204	U	12	06	U	3	U.de S. TIERRA BLANCA (CHIRILAGUA)	S	41231U	1206	\N	\N	G
413	2	17	89	SIBASI SAN MIGUEL	4	12	32	203	U	12	09	U	3	U.de S. EL JOCOTE DULCE	S	41232U	1209	\N	\N	G
414	2	17	64	SIBASI SAN MIGUEL	4	12	33	215	U	12	01	U	3	U.de S. MARTIN ZALDIVAR COL.CARRILLO	S	41233U	1201	\N	\N	G
415	2	17	89	SIBASI SAN MIGUEL	4	12	34	207	U	12	03	U	3	U.de S. TONGOLONA	S	41234U	1203	\N	\N	G
416	2	17	89	SIBASI SAN MIGUEL	4	12	35	215	U	12	01	U	3	U.de S. MIRAFLORES	S	41235U	1201	\N	\N	G
417	2	17	87	SIBASI SAN MIGUEL	4	14	8	261	U	14	03	U	3	U.de S. YUCUAIQUIN	S	41408U	1403	\N	\N	G
418	2	17	89	SIBASI SAN MIGUEL	4	14	20	260	U	14	04	U	3	U.de S. YAYANTIQUE	S	41420U	1404	\N	\N	G
419	2	17	87	SIBASI SAN MIGUEL	4	12	17	215	D	12	01	D	6	CASA DE SALUD SAN ANTONIO CHAVEZ	S	41217D	1201	\N	\N	G
420	2	17	87	SIBASI SAN MIGUEL	4	12	18	215	D	12	01	D	6	CASA DE SALUD CONCEPCION COROZAL	S	41218D	1201	\N	\N	G
421	2	17	87	SIBASI SAN MIGUEL	4	14	12	261	D	14	03	D	6	CASA DE SALUD LOS HATILLOS (YUCUAIQUIN)	S	41412D	1403	\N	\N	G
422	2	17	89	SIBASI SAN MIGUEL	4	12	37	215	U	12	01	U	3	U.de S. SAN MIGUEL	S	41237U	1201	\N	\N	G
423	2	17	63	SIBASI CIUDAD BARRIOS	4	12	2	200	H	12	02	H	1	HOSPITAL MONSEÑOR OSCAR ARNULFO ROM.C.B.	S	41202H	1202	\N	\N	G
424	2	17	63	SIBASI CIUDAD BARRIOS	4	12	7	212	U	12	19	U	3	U.de S. SAN GERARDO	S	41207U	1219	\N	\N	G
425	2	17	63	SIBASI CIUDAD BARRIOS	4	12	11	212	D	12	19	D	6	CASA DE SALUD LA LAGUNA SAN GERARDO	S	41211D	1219	\N	\N	G
426	2	17	63	SIBASI CIUDAD BARRIOS	4	12	12	212	D	12	19	D	6	CASA DE SALUD SAN JERONIMO (SAN GERARDO	S	41212D	1219	\N	\N	G
427	2	17	63	SIBASI CIUDAD BARRIOS	4	12	18	214	U	12	16	U	3	U.de S. SAN LUIS DE LA REINA	S	41218U	1216	\N	\N	G
428	2	17	63	SIBASI CIUDAD BARRIOS	4	12	20	199	U	12	17	U	3	U.de S. CAROLINA	S	41220U	1217	\N	\N	G
429	2	17	63	SIBASI CIUDAD BARRIOS	4	12	23	211	U	12	20	U	3	U.de S. SAN ANTONIO DEL NORTE	S	41223U	1220	\N	\N	G
430	2	17	63	SIBASI CIUDAD BARRIOS	4	12	19	199	D	12	17	D	6	CASA DE SALUD LA CEIBITA (CAROLINA)	S	41219D	1217	\N	\N	G
431	2	17	63	SIBASI NUEVA GUADALUPE	4	11	2	184	U	11	11	U	3	U.de S. JUCUAPA	S	41102U	1111	\N	\N	G
432	2	17	63	SIBASI NUEVA GUADALUPE	4	11	16	191	U	11	14	U	3	U.de S. LAS CHARCAS (SN.BUENA.)	S	41116U	1114	\N	\N	G
433	2	17	63	SIBASI NUEVA GUADALUPE	4	11	33	191	U	11	14	U	3	U.de S. SAN BUENA VENTURA	S	41133U	1114	\N	\N	G
434	2	17	63	SIBASI NUEVA GUADALUPE	4	12	1	203	U	12	09	U	3	U.de S. CHINAMECA	S	41201U	1209	\N	\N	G
435	2	17	63	SIBASI NUEVA GUADALUPE	4	12	3	208	H	12	10	H	1	HOSPITAL NUEVA GUADALUPE	S	41203H	1210	13.5374	-88.348799999999997	G
436	2	17	63	SIBASI NUEVA GUADALUPE	4	12	6	207	U	12	03	U	3	U.de S. MONCAGUA	S	41206U	1203	\N	\N	G
437	2	17	63	SIBASI NUEVA GUADALUPE	4	12	10	203	D	12	09	D	6	CASA DE SALUD SAN PEDRO ARENALES	S	41210D	1209	\N	\N	G
438	2	17	63	SIBASI NUEVA GUADALUPE	4	12	13	203	D	12	09	D	6	CASA DE SALUD SAN ANTONIO (CHINAMECA)	S	41213D	1209	\N	\N	G
439	2	17	63	SIBASI NUEVA GUADALUPE	4	12	13	206	U	12	13	U	3	U.de S. LOLOTIQUE	S	41213U	1213	\N	\N	G
440	2	17	63	SIBASI NUEVA GUADALUPE	4	12	14	203	D	12	09	D	6	CASA DE SALUD CRUZ SEGUNDA (CHINAMECA)	S	41214D	1209	\N	\N	G
441	2	17	63	SIBASI NUEVA GUADALUPE	4	12	36	203	U	12	09	U	3	U.de S. LAS MARIAS	S	41236U	1209	\N	\N	G
442	2	20	33	SIBASI MORAZAN	4	13	1	240	D	13	22	D	6	CASA DE SALUD EL BARRIAL	S	41301D	1322	\N	\N	G
443	2	20	130	SIBASI MORAZAN	4	13	1	237	H	13	01	H	1	HOSPITAL NACIONAL SAN FRANCISCO GOTERA	S	41301H	1301	\N	\N	G
444	2	20	42	SIBASI MORAZAN	4	13	1	230	U	13	02	U	3	U.de S. JOCORO	S	41301U	1302	\N	\N	G
445	2	20	34	SIBASI MORAZAN	4	13	2	229	D	13	19	D	6	CASA DE SALUD QUEBRACHOS (JOCOAI)	S	41302D	1322	\N	\N	G
446	2	20	45	SIBASI MORAZAN	4	13	2	233	U	13	11	U	3	U.de S. OSICALA	S	41302U	1311	\N	\N	G
447	2	20	39	SIBASI MORAZAN	4	13	3	243	D	13	07	D	6	CASA DE SALUD CIMIENTOS (YAMABAL)	S	41303D	1307	\N	\N	G
448	2	20	41	SIBASI MORAZAN	4	13	3	224	U	13	10	U	3	U.de S. EL DIVISADERO	S	41303U	1310	\N	\N	G
449	2	20	43	SIBASI MORAZAN	4	13	4	241	D	13	06	D	6	CASA DE SALUD EL PEÑON  (SOCIEDAD)	S	41304D	1306	\N	\N	G
450	2	20	44	SIBASI MORAZAN	4	13	4	221	U	13	18	U	3	U.de S. CORINTO	S	41304U	1318	\N	\N	G
451	2	17	63	SIBASI CIUDAD BARRIOS	4	13	5	239	D	13	17	D	6	CASA DE SALUD EL CARRIZAL, (SAN SIMON)	S	41305D	1317	\N	\N	G
452	2	20	33	SIBASI MORAZAN	4	13	5	234	U	13	24	U	3	U.de S. PERQUIN	S	41305U	1324	\N	\N	G
453	2	20	38	SIBASI MORAZAN	4	13	6	222	D	13	05	D	6	CASA DE SALUD LA JOYA  MATAZANO(CHILANG	S	41306D	1305	\N	\N	G
454	2	20	36	SIBASI MORAZAN	4	13	6	220	U	13	13	U	3	U.de S. CACAOPERA	S	41306U	1313	\N	\N	G
689	1	1	1	\N	\N	\N	\N	8	\N	1	\N	O	\N	OP SERAPHIN SN.FRCO.MENENDEZ HACHAD	\N	\N	\N	\N	\N	G
455	2	20	47	SIBASI MORAZAN	4	13	7	232	U	13	22	U	3	U.de S. SAN LUIS (MEANGUERA)	S	41307U	1322	\N	\N	G
456	2	20	43	SIBASI MORAZAN	4	13	8	241	U	13	06	U	3	U.de S. SOCIEDAD	S	41308U	1306	\N	\N	G
457	2	20	39	SIBASI MORAZAN	4	13	9	227	U	13	04	U	3	U.de S. GUATAJIAGUA	S	41309U	1304	\N	\N	G
458	2	20	34	SIBASI MORAZAN	4	13	10	229	U	13	19	U	3	U.de S. JOCOITIQUE	S	41310U	1319	\N	\N	G
459	2	20	35	SIBASI MORAZAN	4	13	11	242	U	13	26	U	3	U.de S. TOROLA	S	41311U	1326	\N	\N	G
460	2	20	47	SIBASI MORAZAN	4	13	12	232	U	13	22	U	3	U.de S. MEANGUERA	S	41312U	1322	\N	\N	G
461	2	20	35	SIBASI MORAZAN	4	13	13	236	U	13	25	U	3	U.de S. SAN FERNANDO (MORAZAN)	S	41313U	1325	\N	\N	G
462	2	20	36	SIBASI MORAZAN	4	13	14	228	U	13	21	U	3	U.de S. JOATECA	S	41314U	1321	\N	\N	G
463	2	20	46	SIBASI MORAZAN	4	13	15	239	U	13	17	U	3	U.de S. SAN SIMON	S	41315U	1317	\N	\N	G
464	2	20	37	SIBASI MORAZAN	4	13	16	223	U	13	15	U	3	U.de S. DELICIAS DE CONCEPCION	S	41316U	1315	\N	\N	G
465	2	20	38	SIBASI MORAZAN	4	13	17	222	U	13	05	U	3	U.de S. CHILANGA	S	41317U	1305	\N	\N	G
466	2	20	39	SIBASI MORAZAN	4	13	18	240	U	13	08	U	3	U.de S. SENSEMBRA (YAMABAL)	S	41318U	1308	\N	\N	G
467	2	20	46	SIBASI MORAZAN	4	13	19	238	U	13	12	U	3	U.de S. SAN ISIDRO (MORAZAN)	S	41319U	1312	\N	\N	G
468	2	20	41	SIBASI MORAZAN	4	13	20	235	U	13	03	U	3	U.de S. SAN CARLOS (MORAZAN)	S	41320U	1303	\N	\N	G
469	2	20	34	SIBASI MORAZAN	4	13	21	225	U	13	20	U	3	U.de S. VILLA EL ROSARIO	S	41321U	1320	\N	\N	G
470	2	20	45	SIBASI MORAZAN	4	13	22	226	U	13	16	U	3	U.de S. GUALOCOCTI	S	41322U	1316	\N	\N	G
471	2	20	37	SIBASI MORAZAN	4	13	23	244	U	13	14	U	3	U.de S. YOLOAIQUIN	S	41323U	1314	\N	\N	G
472	2	20	38	SIBASI MORAZAN	4	13	24	231	U	13	09	U	3	U.de S. LOLOTIQUILLO	S	41324U	1309	\N	\N	G
473	2	20	33	SIBASI MORAZAN	4	13	25	219	U	13	23	U	3	U.de S. ARAMBALA	S	41325U	1323	\N	\N	G
474	2	20	39	SIBASI MORAZAN	4	13	7	227	D	13	04	D	6	CASA DE SALUD SAN BARTOLO (GUATAJIAGUA)	S	41307D	1304	\N	\N	G
475	2	20	43	SIBASI MORAZAN	4	13	8	241	D	13	06	D	6	CASA DE SALUD LA JOYA (SOCIEDAD)	S	41308D	1306	\N	\N	G
476	2	20	44	SIBASI MORAZAN	4	13	9	221	D	13	18	D	6	CASA DE SALUD HONDABLE (CORINTO)	S	41309D	1318	\N	\N	G
477	2	20	38	SIBASI MORAZAN	4	13	10	222	D	13	05	D	6	CASA DE SALUD CHAPARRAL (CHILANGA)	S	41310D	1305	\N	\N	G
478	2	20	36	SIBASI MORAZAN	4	13	11	220	D	13	13	D	6	CASA DE SALUD CALAVERA  (CACAOPERA)	S	41311D	1313	\N	\N	G
479	2	20	33	SIBASI MORAZAN	4	13	12	234	D	13	24	D	6	CASA DE SALUD RANCHO QUEMADO (PERQUIN)	S	41312D	1324	\N	\N	G
480	2	20	45	SIBASI MORAZAN	4	13	13	233	D	13	11	D	6	CASA DE SALUD AGUA ZARCA (OSICALA)	S	41313D	1311	\N	\N	G
481	2	21	128	SIBASI LA UNION	4	14	1	252	H	14	01	H	1	HOSPITAL NACIONAL LA UNION	S	41401H	1401	13.337199999999999	-87.839600000000004	G
482	2	21	3	SIBASI LA UNION	4	14	1	252	U	14	01	U	3	U.de S. ENF.ZOILA E.TURCIOS DE JIMENEZ	S	41401U	1401	\N	\N	G
483	2	21	96	SIBASI LA UNION	4	14	2	248	D	14	07	D	6	CASA DE SALUD LAS TUNAS	S	41402D	1407	\N	\N	G
484	2	21	95	SIBASI LA UNION	4	14	3	248	D	14	07	D	6	CASA DE SALUD EL CACAO	S	41403D	1407	\N	\N	G
485	2	21	7	SIBASI LA UNION	4	14	3	257	U	14	02	U	3	U.de S. SAN ALEJO	S	41403U	1402	\N	\N	G
486	2	21	96	SIBASI LA UNION	4	14	4	252	D	14	01	D	6	CASA DE SALUD EL COYOLITO (LA UNION)	S	41404D	1401	\N	\N	G
487	2	21	96	SIBASI LA UNION	4	14	5	251	U	14	08	U	3	U.de S. INTIPUCA	S	41405U	1408	\N	\N	G
488	2	21	95	SIBASI LA UNION	4	14	9	257	D	14	02	D	6	CASA DE SALUD AGUA FRIA (SAN ALEJO)	S	41409D	1402	\N	\N	G
489	2	21	95	SIBASI LA UNION	4	14	9	248	U	14	07	U	3	U.de S. CONCHAGUA	S	41409U	1407	\N	\N	G
490	2	21	7	SIBASI LA UNION	4	14	10	257	D	14	02	D	6	CASA DE SALUD SAN JERONIMO (SAN ALEJO)	S	41410D	1402	\N	\N	G
491	2	21	77	SIBASI LA UNION	4	14	10	262	U	14	10	U	3	U.de S. MEANGUERA DEL GOLFO	S	41410U	1410	\N	\N	G
492	2	21	96	SIBASI LA UNION	4	14	13	248	U	14	07	U	3	U.de S. EL TAMARINDO	S	41413U	1407	\N	\N	G
493	2	21	7	SIBASI LA UNION	4	14	15	249	U	14	06	U	3	U.de S. OLOMEGA (EL CARMEN)	S	41415U	1406	\N	\N	G
494	2	21	3	SIBASI LA UNION	4	14	17	252	U	14	01	U	3	U.de S. ISLA ZACATILLO	S	41417U	1401	\N	\N	G
495	2	21	77	SIBASI LA UNION	4	14	18	262	U	14	10	U	3	U.de S. ISLA CONCHAGUITA (MEANG.D/GOLFO)	S	41418U	1410	\N	\N	G
496	2	21	7	SIBASI LA UNION	4	14	21	249	U	14	06	U	3	U.de S. EL CARMEN LA UNION	S	41421U	1406	\N	\N	G
497	2	21	96	SIBASI LA UNION	4	14	23	252	U	14	01	U	3	U.de S. AGUA CALIENTE(LA UNION)	S	41423U	1401	\N	\N	G
498	2	21	95	SIBASI LA UNION	4	14	24	257	U	14	02	U	3	U.de S. HATO NUEVO (SN. ALEJO)	S	41424U	1402	\N	\N	G
499	2	21	96	SIBASI LA UNION	4	14	25	248	U	14	07	U	3	U.de S. LLANO LOS PATOS	S	41425U	1407	\N	\N	G
500	2	21	3	SIBASI LA UNION	4	14	26	252	U	14	01	U	3	U.de S. AGUA ESCONDIDA	S	41426U	1401	\N	\N	G
501	2	21	95	SIBASI LA UNION	4	14	27	257	U	14	02	U	3	U.de S. BOBADILLA (SAN ALEJO)	S	41427U	1402	\N	\N	G
502	2	21	95	SIBASI LA UNION	4	14	29	248	U	14	07	U	3	U.de S. EL HUISQUIL (CONCHAGUA)	S	41429U	1407	\N	\N	G
503	2	21	3	SIBASI LA UNION	4	14	30	248	U	14	07	U	3	U.de S. EL FARO (CONCHAGUA)	S	41430U	1407	\N	\N	G
504	2	21	7	SIBASI LA UNION	4	14	31	249	U	14	06	U	3	U.de S. EL PICHE	S	41431U	1406	\N	\N	G
505	2	21	3	SIBASI LA UNION	4	14	32	252	U	14	01	U	3	U.de S. LOS LEONES-SN.CARLOS BORROMEO	S	41432U	1401	\N	\N	G
506	2	21	95	SIBASI LA UNION	4	14	2	248	N	14	07	N	7	CRN EL CIPRES	S	41402N	1407	\N	\N	G
507	2	21	3	SIBASI SANTA ROSA	4	14	1	255	D	14	12	D	6	CASA DE SALUD BARRANCONES/PIEDRAS BLAN	S	41401D	1412	\N	\N	G
508	2	21	3	SIBASI SANTA ROSA	4	14	1	253	N	14	18	N	7	CRN EL DERRUMBADO	S	41401N	1418	\N	\N	G
509	2	21	3	SIBASI SANTA ROSA	4	14	2	259	H	14	11	H	1	HOSPITAL NACIONAL SANTA ROSA DE LIMA	S	41402H	1411	13.619400000000001	-87.898899999999998	G
510	2	21	3	SIBASI SANTA ROSA	4	14	2	254	U	14	15	U	3	U.de S. ANA Ma.ALFARO SANCHEZ NVA.ESPART	S	41402U	1415	\N	\N	G
511	2	21	3	SIBASI SANTA ROSA	4	14	4	255	U	14	12	U	3	U.de S. PASAQUINA	S	41404U	1412	\N	\N	G
512	2	21	3	SIBASI SANTA ROSA	4	14	5	250	D	14	14	D	6	CASA DE SALUD EL RINCON (EL SAUCE)	S	41405D	1414	\N	\N	G
513	2	21	3	SIBASI SANTA ROSA	4	14	6	253	D	14	18	U	6	U, de S. EL GUAJINIQUIL (LISLIQUE)	S	41406D	1418	\N	\N	G
514	2	21	3	SIBASI SANTA ROSA	4	14	6	245	U	14	13	U	3	U.de S. ANAMOROS	S	41406U	1413	\N	\N	G
515	2	21	3	SIBASI SANTA ROSA	4	14	7	224	D	13	06	U	6	U.de S. TROMPINA/EL BEJUCAL	S	41407D	1306	\N	\N	G
516	2	21	3	SIBASI SANTA ROSA	4	14	7	250	U	14	14	U	3	U.de S. EL SAUCE	S	41407U	1414	\N	\N	G
517	2	21	3	SIBASI SANTA ROSA	4	14	8	254	D	14	15	D	6	CASA DE SALUD EL TALPETATE	S	41408D	1415	\N	\N	G
518	2	21	3	SIBASI SANTA ROSA	4	14	11	245	D	14	13	D	6	CASA DE SALUD AGUA BLANCA (ANAMOROS)	S	41411D	1413	\N	\N	G
519	2	21	3	SIBASI SANTA ROSA	4	14	11	247	U	14	16	U	3	U.de S. CONCEPCION DE ORIENTE	S	41411U	1416	\N	\N	G
520	2	21	3	SIBASI SANTA ROSA	4	14	12	253	U	14	18	U	3	U.de S. LISLIQUE	S	41412U	1418	\N	\N	G
521	2	21	3	SIBASI SANTA ROSA	4	14	14	254	U	14	15	U	3	U.de S. MONTECA	S	41414U	1415	\N	\N	G
522	2	21	3	SIBASI SANTA ROSA	4	14	16	246	U	14	05	U	3	U.de S. BOLIVAR	S	41416U	1405	\N	\N	G
523	2	21	3	SIBASI SANTA ROSA	4	14	19	256	U	14	17	U	3	U.de S. POLOROS	S	41419U	1417	\N	\N	G
524	2	21	3	SIBASI SANTA ROSA	4	14	22	258	U	14	09	U	3	U.de S. SAN JOSE DE LA FUENTE	S	41422U	1409	\N	\N	G
525	2	21	3	SIBASI SANTA ROSA	4	14	28	255	U	14	12	U	3	U.de S. SAN FELIPE (PASAQUINA)	S	41428U	1412	\N	\N	G
526	6	23	114	SIBASI NORTE	5	6	1	105	D	6	11	D	6	CASA DE SALUD DOS DE MAYO	S	50601D	0611	\N	\N	G
527	6	23	114	SIBASI NORTE	5	6	1	105	N	6	11	N	7	CRN MAPILAPA (NEJAPA)	S	50601N	0611	\N	\N	G
528	6	23	114	SIBASI NORTE	5	6	2	105	D	6	11	D	6	CASA DE SALUD SAN JERONIMO LOS PLANES	S	50602D	0611	\N	\N	G
529	6	23	113	SIBASI NORTE	5	6	3	114	D	6	07	D	6	CASA DE SALUD MALACOFF	S	50603D	0607	\N	\N	G
530	6	23	113	SIBASI NORTE	5	6	4	114	D	6	07	D	6	CASA DE SALUD EL TRANSITO	S	50604D	0607	\N	\N	G
531	6	23	115	SIBASI NORTE	5	6	5	105	D	6	11	D	6	CASA DE SALUD TUTULTEPEQUE	S	50605D	0611	\N	\N	G
532	6	23	115	SIBASI NORTE	5	6	7	124	D	7	15	D	6	CASA DE SALUD LOS RAMIREZ	S	50607D	0715	\N	\N	G
533	6	23	114	SIBASI NORTE	5	6	8	86	D	5	18	D	6	CASA DE SALUD SAN ANTONIO SEGURA	S	50609D	0518	\N	\N	G
534	6	23	114	SIBASI NORTE	5	6	10	101	D	6	13	D\n	6	CASA DE SALUD SAN ANTONIO GRANDE	S	50611D	0613	\N	\N	G
535	6	23	114	SIBASI NORTE	5	6	11	101	D	6	13	D	6	CASA DE SALUD SAN DIEGO	S	50611D	0613	\N	\N	G
536	6	23	114	SIBASI NORTE	5	6	12	101	D	6	13	D	6	CASA DE SALUD LA JOYA (PAISNAL)	S	50612D	0613	\N	\N	G
537	6	23	114	SIBASI NORTE	5	6	13	101	D	6	13	D	6	CASA DE SALUD LA CABAÑA	S	50614D	0613	\N	\N	G
538	6	23	114	SIBASI NORTE	5	6	14	101	D	6	13	D	6	CASA DE SALUD GARCITAS	S	50614D	0613	\N	\N	G
539	6	23	115	SIBASI NORTE	5	6	14	98	U	6	10	U	3	U.de S. APOPA	S	50614U	0610	\N	\N	G
540	6	23	114	SIBASI NORTE	5	6	15	130	D	7	14	D	6	CASA DE SALUD EL TRAPICHITO	S	50608D	0714	\N	\N	G
541	6	23	114	SIBASI NORTE	5	6	17	105	U	6	11	U	3	U.de S. NEJAPA	S	50617U	0611	\N	\N	G
542	6	23	115	SIBASI NORTE	5	6	18	102	U	6	08	U	3	U.de S. GUAZAPA	S	50618U	0608	\N	\N	G
543	6	23	114	SIBASI NORTE	5	6	19	97	U	6	14	U	3	U.de S. AGUILARES	S	50619U	0614	\N	\N	G
544	6	23	113	SIBASI NORTE	5	6	20	114	U	6	07	U	3	U.de S. TONACATEPEQUE	S	50620U	0607	\N	\N	G
545	6	23	114	SIBASI NORTE	5	6	24	130	D	7	14	D	6	CASA DE SALUD COLIMA	S	50624D	0714	\N	\N	G
546	6	23	114	SIBASI NORTE	5	6	25	101	U	6	13	U	3	U.de S. EL PAISNAL	S	50625U	0613	\N	\N	G
547	6	23	113	SIBASI NORTE	5	6	30	114	U	6	07	U	3	U.de S. DISTRITO ITALIA	S	50630U	0607	\N	\N	G
548	6	23	113	SIBASI NORTE	5	6	31	98	U	6	10	U	3	U.de S. POPOTLAN	S	50631U	0610	\N	\N	G
549	6	23	113	SIBASI NORTE	5	6	32	98	U	6	10	U	3	U.de S. CHINTUC	S	50632U	0610	\N	\N	G
550	6	24	60	SIBASI SUR	5	6	1	110	U	6	01	U	3	U.de S. DR.MAURICIO SOL NERIO SN.JAC.	S	50601U	0601	\N	\N	G
551	6	24	61	SIBASI SUR	5	6	3	106	N	6	16	N	7	CRN EL CEDRO (PANCHIMALCO)	S	50603N	0616	\N	\N	G
552	6	24	116	SIBASI SUR	5	6	5	110	H	6	01	H	1	HOSPITAL DR.JOSE A.SALDAÑA (NEUMOLOGICO)	S	50605H	0601	13.648	-89.194500000000005	G
553	6	24	60	SIBASI SUR	5	6	15	108	U	6	19	U	3	U.de S. DR.ROBERTO CACERES B(SN.MARC)	S	50615U	0619	\N	\N	G
554	6	24	61	SIBASI SUR	5	6	16	112	U	6	15	U	3	U.de S. DR.JOSE E.AVALOS LA GUARDIA	S	50616U	0615	\N	\N	G
555	6	24	116	SIBASI SUR	5	6	17	97	D	6	01	D	6	CASA DE SALUD ALTOS DE JARDINES	S	50617D	0601	\N	\N	G
556	6	24	60	SIBASI SUR	5	6	18	111	D	6	17	D	6	CASA DE SALUD JOYA GRANDE	S	50618D	0617	\N	\N	G
557	6	24	61	SIBASI SUR	5	6	19	106	D	6	16	D	6	CASA DE SALUD PANCHIMALQUITO	S	50619D	0616	\N	\N	G
558	6	24	61	SIBASI SUR	5	6	20	107	D	6	16	D	6	CASA DE SALUD EL AMAYON	S	50620D	0616	\N	\N	G
559	6	24	61	SIBASI SUR	5	6	21	107	D	6	18	D	6	CASA DE SALUD LAS BARROSAS	S	50621D	0618	\N	\N	G
560	6	24	60	SIBASI SUR	5	6	21	111	U	6	17	U	3	U.de S. SANTIAGO TEXACUANGO	S	50621U	0617	\N	\N	G
561	6	24	61	SIBASI SUR	5	6	22	107	D	6	18	D	6	CASA DE SALUD PALO GRANDE	S	50622D	0618	\N	\N	G
562	6	24	61	SIBASI SUR	5	6	23	107	D	6	18	D	6	CASA DE SALUD PLAN DEL MANGO	S	50623D	0618	\N	\N	G
563	6	24	61	SIBASI SUR	5	6	24	106	U	6	16	U	3	U.de S. PANCHIMALCO	S	50624U	0616	\N	\N	G
564	6	24	61	SIBASI SUR	5	6	25	106	D	6	16	D	6	CASA DE SALUD SAN ISIDRO	S	50625D	0616	\N	\N	G
565	6	24	61	SIBASI SUR	5	6	26	107	U	6	18	U	3	U.de S. ROSARIO DE MORA	S	50626U	0618	\N	\N	G
566	6	24	61	SIBASI SUR	5	6	34	106	U	6	16	U	3	U.de S. PLANES DE RENDEROS	S	50634U	0616	\N	\N	G
567	6	24	61	SIBASI SUR	5	6	28	112	D	6	15	D	6	CASA DE SALUD INTERCOMUNAL (SANTO TOMAS	S	50628D	0615	\N	\N	G
568	6	25	58	SIBASI SOYAPANGO	5	6	2	99	T	6	03	D	6	CASA DE SALUD CAMPAMENTO MORAZAN	S	50602T	0603	\N	\N	G
569	6	25	140	SIBASI SOYAPANGO	5	6	4	113	H	6	03	H	1	HOSPITAL DR.JOSE MOLINA MARTINEZ (PSIQUIAT.)	S	50604H	0603	13.713800000000001	-89.137900000000002	G
570	6	25	59	SIBASI SOYAPANGO	5	6	11	113	U	6	03	U	3	U.de S. ZOILA M DE GUADRON SOYAPANGO	S	50611U	0603	\N	\N	G
571	6	25	59	SIBASI SOYAPANGO	5	6	22	113	U	6	03	U	3	U.de S. AMATEPEC	S	50622U	0603	\N	\N	G
572	6	25	58	SIBASI SOYAPANGO	5	6	28	113	U	6	03	U	3	U.de S. UNICENTRO	S	50628U	0603	\N	\N	G
573	6	25	58	SIBASI ILOPANGO	5	6	2	105	N	6	09	N	7	CRN CANTON LAS DELICIAS (SAN MARTIN)	S	50602N	0609	\N	\N	G
574	6	25	58	SIBASI ILOPANGO	5	6	4	105	N	6	09	N	7	CRN VALLE LAS DELICIAS	S	50604N	0609	\N	\N	G
575	6	25	58	SIBASI ILOPANGO	5	6	7	103	H	6	12	H	1	HOSPITAL ENF.ANGELICA VIDAL DE NAJARRO	S	50607H	0612	\N	\N	G
576	6	25	58	SIBASI ILOPANGO	5	6	12	103	U	6	12	U	3	U.de S. SANTA LUCIA (ILOPANGO)	S	50612U	0612	\N	\N	G
577	6	25	58	SIBASI ILOPANGO	5	6	13	109	U	6	09	U	3	U.de S. SAN MARTIN	S	50613U	0609	\N	\N	G
578	6	25	58	SIBASI ILOPANGO	5	6	26	109	D	6	09	D	6	CASA DE SALUD CANTON EL SAUCE	S	50626D	0609	\N	\N	G
579	6	25	58	SIBASI ILOPANGO	5	6	27	122	U	7	10	U	3	U.de S. SAN BARTOLOME PERULAPIA	S	50627U	0710	\N	\N	G
580	6	27	48	SIBASI CENTRO	5	6	1	110	O	6	01	C	8	CLINICA DE EMPLEADOS MSPAS	S	50601O	0601	\N	\N	G
581	6	27	49	SIBASI CENTRO	5	6	1	110	T	6	01	D	6	CASA DE SALUD CORO QUIÑONEZ	S	50601T	0601	\N	\N	G
582	6	27	49	SIBASI CENTRO	5	6	2	110	U	6	01	U	3	U.de S. DR.JUAN R.ALVARENGA.SN.MIGUELITO	S	50602U	0601	\N	\N	G
583	6	27	49	SIBASI CENTRO	5	6	3	110	T	6	01	D	6	CASA DE SALUD FINCA SERPA (S.S.)	S	50603T	0601	\N	\N	G
584	6	27	50	SIBASI CENTRO	5	6	3	110	U	6	01	U	3	U.de S. CONCEPCION	S	50603U	0601	\N	\N	G
585	6	27	49	SIBASI CENTRO	5	6	4	115	T	6	04	D	6	CASA DE SALUD SANTA ROSA ATLACATL (C.D)	S	50604T	0604	\N	\N	G
586	6	27	48	SIBASI CENTRO	5	6	4	110	U	6	01	U	3	U.de S. BARRIOS	S	50604U	0601	\N	\N	G
587	6	27	48	SIBASI CENTRO	5	6	5	110	T	6	01	D	6	CASA DE SALUD LAS PALMAS	S	50605T	0601	\N	\N	G
588	6	27	48	SIBASI CENTRO	5	6	5	110	U	6	01	U	3	U.de S. MONSERRAT	S	50605U	0601	\N	\N	G
589	6	27	118	SIBASI CENTRO	5	6	6	99	H	6	02	H	1	HOSPITAL.DR.JUAN JOSE FERNANDEZ ZACAMIL	S	50606H	0602	13.7279	-89.207599999999999	G
590	6	27	50	SIBASI CENTRO	5	6	6	110	U	6	01	U	3	U.de S. LOURDES (SAN SALVADOR)	S	50606U	0601	\N	\N	G
591	6	27	48	SIBASI CENTRO	5	6	7	97	T	6	01	D	6	CASA DE SALUD PAPINI	N	50607T	0601	\N	\N	G
592	6	27	51	SIBASI CENTRO	5	6	7	99	U	6	06	U	3	U.de S. ZACAMIL	S	50607U	0606	\N	\N	G
593	6	27	48	SIBASI CENTRO	5	6	8	110	T	6	01	D	6	CASA DE SALUD LAS LAJAS	N	50608T	0601	\N	\N	G
594	6	27	52	SIBASI CENTRO	5	6	8	104	U	6	02	U	3	U.de S. DR.HUGO MORAN QUIJADA MEJICANOS	S	50608U	0602	\N	\N	G
595	6	27	48	SIBASI CENTRO	5	6	9	110	T	6	01	D	6	CASA DE SALUD BRISAS DE CANDELARIA	S	50609T	0601	\N	\N	G
596	6	27	52	SIBASI CENTRO	5	6	9	100	U	6	05	U	3	U.de S. CUSCATANCINGO	S	50609U	0605	\N	\N	G
597	6	27	49	SIBASI CENTRO	5	6	10	115	U	6	04	U	3	U.de S. CIUDAD DELGADO	S	50610U	0604	\N	\N	G
598	6	27	49	SIBASI CENTRO	5	6	16	115	D	6	04	D	6	CASA DE SALUD CABAÑAS	S	50616D	0604	\N	\N	G
599	6	27	51	SIBASI CENTRO	5	6	23	110	U	6	01	U	3	U.de S. SAN ANTONIO ABAD	S	50623U	0601	\N	\N	G
600	6	27	48	SIBASI CENTRO	5	6	27	110	D	6	01	D	6	CASA DE SALUD EL CARMEN (SAN SALVADOR)	S	50627D	0601	\N	\N	G
601	6	27	49	SIBASI CENTRO	5	6	29	115	U	6	04	U	3	U.de S. HABITAT CONFIEN	S	50629U	0604	\N	\N	G
602	6	27	49	SIBASI CENTRO	5	6	33	100	U	6	05	U	3	U.de S. VILLA MARIONA	S	50633U	0605	\N	\N	G
603	4	9	107	SIBASI SUCHITOTO	3	7	1	130	H	7	14	H	1	HOSPITAL NACIONAL SUCHITOTO	S	30701H	0714	\N	\N	G
604	4	9	107	SIBASI SUCHITOTO	3	7	2	124	U	7	15	U	3	U.de S. SAN JOSE GUAYABAL	S	30702U	0715	\N	\N	G
605	4	9	107	SIBASI SUCHITOTO	3	7	4	125	D	7	02	D	6	CASA DE SALUD CANTON TECOMATEPEQUE	S	30704D	0702	\N	\N	G
606	4	9	107	SIBASI SUCHITOTO	3	7	10	121	U	7	16	U	3	U.de S. ORATORIO DE CONCEPCION	S	30710U	0716	\N	\N	G
667	4	9	107	\N	\N	\N	\N	118	\N	7	\N	D	\N	CASA DE SALUD CANTON SANTA LUCIA	\N	\N	\N	\N	\N	G
608	2	14	80	SIBASI USULUTAN	4	11	12	205	D	12	12	D	6	CASA DE SALUD MOROPALA	S	41112D	1212	\N	\N	G
609	4	13	29	SIBASI SAN VICENTE	3	10	3	172	D	10	01	D	6	CASA DE SALUD PRIMAVERA (SAN VICENTE)	S	31003D	1001	\N	\N	G
610	6	25	58	SIBASI ILOPANGO	5	6	35	114	U	6	07	U	3	U.de S.  ALTA VISTA	S	50635U	0607	\N	\N	G
611	6	27	49	SIBASI CENTRO	5	6	29	110	D	6	01	D	6	CASA DE SALUD NIÑOS DE LA CALLE 2000	S	50629D	0601	\N	\N	G
612	4	9	107	SIBASI COJUTEPEQUE	3	7	13	118	D	7	07	D	6	CASA DE SALUD CANTON SAN SEBASTIAN	S	30713D	0707	\N	\N	G
613	4	12	4	SIBASI SENSUNTEPEQUE	3	9	15	161	D	9	02	D	6	CASA DE SALUD SAN ANTONIO (VICTORIA)	S	30915D	0902	\N	\N	G
614	4	10	25	SIBASI LA PAZ	3	8	13	152	D	8	01	D	6	CASA DE SALUD ESCUINTLA (ZACATECOLUCA)	S	30813D	0801	\N	\N	G
615	4	9	110	SIBASI COJUTEPEQUE	3	7	14	125	D	7	02	D	6	CASA DE SALUD CANTON MIRAFLORES	S	30714D	0702	\N	\N	G
616	4	12	4	SIBASI ILOBASCO	3	9	16	159	D	9	06	D	6	CASA DE SALUD ISNA	S	30916D	0906	\N	\N	G
617	1	5	19	SIBASI SONSONATE	1	3	6	31	D	3	08	D	6	CASA DE SALUD CHORRO ARRIBA (IZALCO)	S	10306D	0308	\N	\N	G
618	1	5	18	SIBASI SONSONATE	1	3	7	32	D	3	14	D	6	CASA DE SALUD BUENOS AIRES (JUAYUA)	S	10307D	0314	\N	\N	G
619	1	5	20	SIBASI SONSONATE	1	3	8	33	D	3	02	D	6	CASA DE SALUD CUSAMALUCO (NAUHIZALCO)	S	10308D	0302	\N	\N	G
620	1	5	19	SIBASI SONSONATE	1	3	9	27	D	3	09	D	6	CASA DE SALUD TRES CEIBAS  (ARMENIA)	S	10309D	0309	\N	\N	G
621	1	5	18	SIBASI SONSONATE	1	3	10	32	D	3	14	D	6	CASA DE SALUD LOS NARANJOS (JUAYUA)	S	10310D	0314	\N	\N	G
622	1	5	18	SIBASI SONSONATE	1	3	11	38	D	3	15	D	6	CASA DE SALUD EL MATAZANO(STA.CATARIN M	S	10311D	0315	\N	\N	G
623	5	8	21	SIBASI LA LIBERTAD	2	5	26	89	D	5	17	D	6	CASA DE SALUD  VILLA TZU-CHI II	S	20526D	0517	\N	\N	G
624	6	24	60	SIBASI SUR	5	6	30	110	D	6	01	D	6	CASA DE SALUD HOG DEL NIÑO S.V. DE PAUL	S	50630D	0601	\N	\N	G
625	6	24	60	SIBASI SUR	5	6	31	110	D	6	01	D	6	CASA DE SALUD CIPI	S	50631D	0601	\N	\N	G
626	4	13	29	SIBASI SAN VICENTE	3	10	21	172	I	10	01	I	8	UNIDAD DEL ISSS SAN VICENTE	S	31021I	1001	\N	\N	G
627	1	2	13	SIBASI METAPAN	\N	\N	\N	19	\N	2	\N	U	\N	U.de S. METAPAN	\N	\N	\N	\N	\N	G
628	2	21	3	\N	\N	\N	\N	254	\N	14	\N	D	\N	CASA DE SALUD LAS MARIAS	\N	\N	\N	\N	\N	G
629	1	1	1	\N	\N	\N	\N	1	\N	1	\N	U	\N	U.de S. ANEXO HOSPITAL AHUACHAPAN	\N	\N	\N	\N	\N	G
630	2	21	3	\N	\N	\N	\N	253	\N	14	\N	O	\N	ONG  FUSAL LISLIQUE	\N	\N	\N	\N	\N	G
631	2	21	3	\N	\N	\N	\N	252	\N	14	\N	D	\N	CASA DE SALUD EL JICARO	\N	\N	\N	\N	\N	G
632	2	21	3	\N	\N	\N	\N	252	\N	14	\N	D	\N	CASA DE SALUD PUEBLO VIEJO	\N	\N	\N	\N	\N	G
633	5	8	22	\N	\N	\N	\N	77	\N	5	\N	A	\N	CAE LA LIBERTAD	\N	\N	\N	\N	\N	G
634	1	5	20	\N	\N	\N	\N	40	\N	3	\N	U	\N	U.de S. SONSONATE	\N	\N	\N	\N	\N	G
732	1	2	13	\N	\N	\N	\N	18	\N	2	\N	O	\N	ONG ASAPROSAR MASAHUAT	\N	\N	\N	\N	\N	G
730	5	8	24	\N	\N	\N	\N	94	\N	5	\N	U	\N	U.de S. TEOTEPEQUE	\N	\N	\N	\N	\N	G
740	4	12	5	\N	\N	\N	\N	160	\N	9	\N	O	\N	ONG FUSAL TEJUTEPEQUE	\N	\N	\N	\N	\N	G
737	2	17	88	\N	\N	\N	\N	227	\N	13	\N	O	\N	ONG FUSAL GUATAJIAGUA - CHAPELTIQUE	\N	\N	\N	\N	\N	G
743	2	14	79	\N	\N	\N	\N	189	\N	11	\N	U	\N	U.de S. ESPIRITU SANTO	\N	\N	\N	\N	\N	G
738	2	17	63	\N	\N	\N	\N	227	\N	13	\N	O	\N	ONG FUSAL GUATAJIAGUA (C.BARRIOS)	\N	\N	\N	\N	\N	G
739	4	12	6	\N	\N	\N	\N	154	\N	9	\N	O	\N	ONG FUSAL CINQUERA	\N	\N	\N	\N	\N	G
742	4	12	6	\N	\N	\N	\N	157	\N	9	\N	O	\N	ONG FUSAL CAROLINA - JUTIAPA	\N	\N	\N	\N	\N	G
635	4	10	27	\N	\N	\N	\N	136	\N	8	\N	D	\N	CASA DE SALUD MONTELIMAR	\N	\N	\N	\N	\N	G
636	2	17	63	\N	\N	\N	\N	204	\N	12	\N	D	\N	CASA DE SALUD LLANO LAS ROSAS	\N	\N	\N	\N	\N	G
642	2	20	35	\N	\N	\N	\N	242	\N	13	\N	O	\N	ONG CALMA TOROLA	\N	\N	\N	\N	\N	G
643	2	20	35	\N	\N	\N	\N	236	\N	13	\N	O	\N	ONG CALMA SAN FERNANDO (MOR)	\N	\N	\N	\N	\N	G
644	2	20	34	\N	\N	\N	\N	229	\N	13	\N	O	\N	ONG CALMA JOCOAITIQUE	\N	\N	\N	\N	\N	G
645	2	20	39	\N	\N	\N	\N	227	\N	13	\N	O	\N	ONG FUSAL GUATAJIAGUA (MORAZAN)	\N	\N	\N	\N	\N	G
646	2	20	39	\N	\N	\N	\N	240	\N	13	\N	O	\N	ONG FUSAL SENSEMBRA	\N	\N	\N	\N	\N	G
647	2	20	39	\N	\N	\N	\N	243	\N	13	\N	O	\N	ONG FUSAL YAMABAL	\N	\N	\N	\N	\N	G
648	2	20	46	\N	\N	\N	\N	238	\N	13	\N	O	\N	ONG FUSAL SAN ISIDRO	\N	\N	\N	\N	\N	G
649	2	20	45	\N	\N	\N	\N	226	\N	13	\N	O	\N	ONG FUSAL GUALOCOCTI	\N	\N	\N	\N	\N	G
650	2	20	36	\N	\N	\N	\N	228	\N	13	\N	O	\N	ONG FUSAL JOATECA	\N	\N	\N	\N	\N	G
651	2	17	63	\N	\N	\N	\N	260	\N	14	\N	O	\N	ONG FUNDEMUN YAYANTIQUE	\N	\N	\N	\N	\N	G
652	2	17	64	\N	\N	\N	\N	215	\N	12	\N	O	\N	ONG FUSAL SAN ANTONIO SILVA	\N	\N	\N	\N	\N	G
653	2	17	63	\N	\N	\N	\N	211	\N	12	\N	O	\N	ONG FUSAL SAN ANTONIO DEL NORTE	\N	\N	\N	\N	\N	G
654	2	17	63	\N	\N	\N	\N	199	\N	12	\N	O	\N	ONG FUSAL CAROLINA	\N	\N	\N	\N	\N	G
655	2	20	46	\N	\N	\N	\N	239	\N	13	\N	O	\N	ONG AMS SAN SIMON	\N	\N	\N	\N	\N	G
656	5	6	119	\N	\N	\N	\N	45	\N	4	\N	O	\N	ONG FUSAL CITALA	\N	\N	\N	\N	\N	G
657	5	6	119	\N	\N	\N	\N	53	\N	4	\N	O	\N	ONG FUSAL LA PALMA	\N	\N	\N	\N	\N	G
658	5	6	119	\N	\N	\N	\N	66	\N	4	\N	O	\N	ONG FUNDEMUN SAN IGNACIO	\N	\N	\N	\N	\N	G
659	5	6	119	\N	\N	\N	\N	66	\N	4	\N	O	\N	ONG FUNDEMUN LAS PILAS	\N	\N	\N	\N	\N	G
660	5	6	119	\N	\N	\N	\N	54	\N	4	\N	O	\N	ONG FUNDEMUN LA REINA	\N	\N	\N	\N	\N	G
661	1	2	13	\N	\N	\N	\N	19	\N	2	\N	D	\N	CASA DE SALUD LA JOYA (METAPAN)	\N	\N	\N	\N	\N	G
662	1	2	13	\N	\N	\N	\N	19	\N	2	\N	D	\N	CASA DE SALUD SAN MIGUEL INGENIO	\N	\N	\N	\N	\N	G
663	5	6	119	\N	\N	\N	\N	57	\N	4	\N	U	\N	U.de S. NUEVA CONCEPCION	\N	\N	\N	\N	\N	G
736	1	2	15	\N	\N	\N	\N	18	\N	2	\N	O	\N	ONG ASAPROSAR MASHUAT- GUARNECIA	\N	\N	\N	\N	\N	G
664	5	6	70	\N	\N	\N	\N	48	\N	4	\N	U	\N	U.de S. CHALATENANGO	\N	\N	\N	\N	\N	G
741	4	12	6	\N	\N	\N	\N	157	\N	9	\N	O	\N	ONG FUSAL JUTIAPA	\N	\N	\N	\N	\N	G
733	1	2	13	\N	\N	\N	\N	23	\N	2	\N	O	\N	ONG ASAPROSAR SANTA ROSA GUACHIPILIN	\N	\N	\N	\N	\N	G
665	2	21	3	\N	\N	\N	\N	256	\N	14	\N	D	\N	CASA DE SALUD BOQUIN	\N	\N	\N	\N	\N	G
735	1	2	17	\N	\N	\N	\N	24	\N	2	\N	O	\N	ONG ASAPROSAR SANTIAGO LA FRONTERA	\N	\N	\N	\N	\N	G
731	5	6	74	\N	\N	\N	\N	63	\N	4	\N	O	\N	ONG CALMA SAN FERNANDO (CHA)	\N	\N	\N	\N	\N	G
734	2	21	3	\N	\N	\N	\N	258	\N	14	\N	O	\N	ONG FUNDEMUN SAN JOSE LA FUENTE	\N	\N	\N	\N	\N	G
666	1	5	19	\N	\N	\N	\N	37	\N	3	\N	D	\N	CASA DE SALUD CENTRO MATERNO SAN JULIAN	\N	\N	\N	\N	\N	G
668	4	9	110	\N	\N	\N	\N	125	\N	7	\N	D	\N	CASA DE SALUD SAN AGUSTIN	\N	\N	\N	\N	\N	G
669	5	6	73	\N	\N	\N	\N	43	\N	4	\N	O	\N	ONG CIRES  ARCATAO	\N	\N	\N	\N	\N	G
670	5	6	73	\N	\N	\N	\N	58	\N	4	\N	O	\N	ONG CIRES NUEVA TRINIDAD	\N	\N	\N	\N	\N	G
671	5	6	73	\N	\N	\N	\N	69	\N	4	\N	O	\N	ONG CIRES  SAN JOSE LAS FLORES	\N	\N	\N	\N	\N	G
672	1	1	10	\N	\N	\N	\N	11	\N	1	\N	O	\N	OP CALMA TACUBA	\N	\N	\N	\N	\N	G
673	1	1	12	\N	\N	\N	\N	7	\N	1	\N	O	\N	OP CALMA JUJUTLA	\N	\N	\N	\N	\N	G
674	1	1	12	\N	\N	\N	\N	6	\N	1	\N	O	\N	OP CALMA GUAYMANGO	\N	\N	\N	\N	\N	G
675	1	1	10	\N	\N	\N	\N	4	\N	1	\N	O	\N	OP CALMA CONCEPCION DE ATACO	\N	\N	\N	\N	\N	G
676	1	1	12	\N	\N	\N	\N	10	\N	1	\N	O	\N	OP CALMA SAN PEDRO PUXTLA	\N	\N	\N	\N	\N	G
677	1	1	10	\N	\N	\N	\N	1	\N	1	\N	O	\N	OP ASAPROSAR AHUACHAPAN	\N	\N	\N	\N	\N	G
678	1	1	11	\N	\N	\N	\N	12	\N	1	\N	O	\N	OP ASAPROSAR TURIN	\N	\N	\N	\N	\N	G
679	1	1	1	\N	\N	\N	\N	8	\N	1	\N	O	\N	OP CALMA  SAN FRANC. MEN.(HACHADURA)	\N	\N	\N	\N	\N	G
680	1	1	10	\N	\N	\N	\N	1	\N	1	\N	O	\N	OP ASAPROSAR  AHUACH. (LAS CHINAMA	\N	\N	\N	\N	\N	G
681	1	1	11	\N	\N	\N	\N	3	\N	1	\N	O	\N	OP ASAPROSAR  ATIQUIZAYA	\N	\N	\N	\N	\N	G
682	1	1	11	\N	\N	\N	\N	9	\N	1	\N	O	\N	OP ASAPROSAR  SAN LORENZO	\N	\N	\N	\N	\N	G
683	1	1	12	\N	\N	\N	\N	8	\N	1	\N	O	\N	OP SERAPHIN SN.FRCO.MENEND.CARA S	\N	\N	\N	\N	\N	G
684	1	1	11	\N	\N	\N	\N	5	\N	1	\N	O	\N	OP SERAPHIN  EL REFUGIO	\N	\N	\N	\N	\N	G
685	1	1	12	\N	\N	\N	\N	7	\N	1	\N	O	\N	OP SERAPHIN JUJUTLA BARRA DE SANT.	\N	\N	\N	\N	\N	G
686	1	1	12	\N	\N	\N	\N	7	\N	1	\N	O	\N	OP SERAPHIN JUJUTLA GUAYAPA ABAJO	\N	\N	\N	\N	\N	G
687	1	1	11	\N	\N	\N	\N	3	\N	1	\N	O	\N	OP SERAPHIN ATIQUIZAYA	\N	\N	\N	\N	\N	G
690	1	1	12	\N	\N	\N	\N	7	\N	1	\N	O	\N	OP CALMA JUJUTLA GUAYAPA ABAJO	\N	\N	\N	\N	\N	G
691	1	1	12	\N	\N	\N	\N	7	\N	1	\N	B	\N	OP, CALMA JUJUTLA SN.JOSE EL NARAJ	\N	\N	\N	\N	\N	G
692	1	1	12	\N	\N	\N	\N	7	\N	1	\N	O	\N	OP ASAPROSAR JUJUTLA GUAYAPA ABAJ	\N	\N	\N	\N	\N	G
693	1	1	12	\N	\N	\N	\N	7	\N	1	\N	O	\N	OP ASAPROSAR  JUJUTLA SN.JOSE EL NAR	\N	\N	\N	\N	\N	G
694	1	5	18	\N	\N	\N	\N	33	\N	3	\N	O	\N	OP FUSAL  NAHUIZALCO	\N	\N	\N	\N	\N	G
695	1	5	18	\N	\N	\N	\N	32	\N	3	\N	O	\N	OP FUSAL JUAYUA	\N	\N	\N	\N	\N	G
696	1	5	18	\N	\N	\N	\N	33	\N	3	\N	O	\N	OP SERAPHIN NAHUIZALCO	\N	\N	\N	\N	\N	G
697	1	5	18	\N	\N	\N	\N	32	\N	3	\N	O	\N	OP SERAPHIN JUAYUA	\N	\N	\N	\N	\N	G
698	1	5	20	\N	\N	\N	\N	36	\N	3	\N	O	\N	OP CALMA  SAN ANTONIO DEL MONTE	\N	\N	\N	\N	\N	G
699	1	5	18	\N	\N	\N	\N	33	\N	3	\N	O	\N	OP CALMA NAHUIZALCO	\N	\N	\N	\N	\N	G
700	1	5	20	\N	\N	\N	\N	39	\N	3	\N	O	\N	OP CALMA SANTO DOMINGO DE GUZMAN	\N	\N	\N	\N	\N	G
701	1	5	18	\N	\N	\N	\N	38	\N	3	\N	O	\N	OP CALMA SANTA CATARINA MASAHUAT	\N	\N	\N	\N	\N	G
702	1	5	20	\N	\N	\N	\N	26	\N	3	\N	O	\N	OP ASAPROSAR  ACAJUTLA	\N	\N	\N	\N	\N	G
703	1	5	20	\N	\N	\N	\N	40	\N	3	\N	O	\N	OP SERAPHIN SONSONATE	\N	\N	\N	\N	\N	G
704	1	5	19	\N	\N	\N	\N	31	\N	3	\N	O	\N	OP SERAPHIN  IZALCO	\N	\N	\N	\N	\N	G
705	1	5	20	\N	\N	\N	\N	36	\N	3	\N	O	\N	OP SERAPHIN SAN ANTONIO DEL MONTE	\N	\N	\N	\N	\N	G
706	1	5	20	\N	\N	\N	\N	34	\N	3	\N	O	\N	OP SERAPHIN NAHUILINGO	\N	\N	\N	\N	\N	G
707	1	5	19	\N	\N	\N	\N	31	\N	3	\N	O	\N	OP FUSAL IZALCO	\N	\N	\N	\N	\N	G
708	1	5	20	\N	\N	\N	\N	40	\N	3	\N	O	\N	OP SERAPHIN SONSONATE (SALINAS AYAC	\N	\N	\N	\N	\N	G
709	1	5	19	\N	\N	\N	\N	30	\N	3	\N	O	\N	OP SERAPHIN SANTA ISABEL ISHUATAN	\N	\N	\N	\N	\N	G
710	1	5	19	\N	\N	\N	\N	29	\N	3	\N	O	\N	OP SERAPHIN CUISNAHUAT	\N	\N	\N	\N	\N	G
711	1	5	19	\N	\N	\N	\N	37	\N	3	\N	O	\N	OP SERAPHIN SAN JULIAN	\N	\N	\N	\N	\N	G
712	1	5	19	\N	\N	\N	\N	28	\N	3	\N	O	\N	OP SERAPHIN CALUCO	\N	\N	\N	\N	\N	G
713	1	5	20	\N	\N	\N	\N	40	\N	3	\N	O	\N	OP CALMA SONSONATE	\N	\N	\N	\N	\N	G
714	5	6	74	\N	\N	\N	\N	72	\N	4	\N	O	\N	ONG CALMA  SAN RAFAEL	\N	\N	\N	\N	\N	G
715	5	6	71	\N	\N	\N	\N	66	\N	4	\N	O	\N	ONG CALMA SANTA RITA	\N	\N	\N	\N	\N	G
716	5	6	74	\N	\N	\N	\N	49	\N	4	\N	O	\N	ONG CALMA DULCE NOMBRE DE MARIA	\N	\N	\N	\N	\N	G
717	5	6	74	\N	\N	\N	\N	65	\N	4	\N	O	\N	ONG CALMA SAN FRANCISCO MORAZAN	\N	\N	\N	\N	\N	G
718	5	6	71	\N	\N	\N	\N	59	\N	4	\N	O	\N	ONG FUNDEMUN  OJOS DE AGUA	\N	\N	\N	\N	\N	G
719	5	6	71	\N	\N	\N	\N	55	\N	4	\N	O	\N	ONG FUNDEMUN LAS VUELTAS	\N	\N	\N	\N	\N	G
720	5	6	70	\N	\N	\N	\N	62	\N	4	\N	O	\N	ONG FUNDEMUN SAN ANTONIO LOS RANCH	\N	\N	\N	\N	\N	G
721	5	6	71	\N	\N	\N	\N	52	\N	4	\N	O	\N	ONG FUNDEMUN LA LAGUNA	\N	\N	\N	\N	\N	G
722	5	6	71	\N	\N	\N	\N	46	\N	4	\N	O	\N	ONG FUNDEMUN COMALAPA	\N	\N	\N	\N	\N	G
723	5	6	70	\N	\N	\N	\N	71	\N	4	\N	O	\N	ONG FUNDEMUN SAN MIGUEL DE MERCEDE	\N	\N	\N	\N	\N	G
724	5	6	72	\N	\N	\N	\N	56	\N	4	\N	O	\N	ONG CALMA  NOMBRE DE JESUS	\N	\N	\N	\N	\N	G
725	5	6	72	\N	\N	\N	\N	61	\N	4	\N	O	\N	ONG CALMA SAN ANTONIO LA CRUZ	\N	\N	\N	\N	\N	G
726	5	6	71	\N	\N	\N	\N	50	\N	4	\N	O	\N	ONG FUNDEMUN EL CARRIZAL	\N	\N	\N	\N	\N	G
727	5	6	72	\N	\N	\N	\N	42	\N	4	\N	O	\N	ONG CALMA  SAN ISIDRO LABRADOR	\N	\N	\N	\N	\N	G
728	5	6	75	\N	\N	\N	\N	60	\N	4	\N	O	\N	ONG CALMA POTONICO	\N	\N	\N	\N	\N	G
729	5	6	72	\N	\N	\N	\N	68	\N	4	\N	O	\N	ONG CALMA SAN JOSE CANCASQUE	\N	\N	\N	\N	\N	G
744	4	10	25	\N	\N	\N	\N	150	\N	8	\N	O	\N	ONG CIDECO NUESTRA SEÑORA DE LOURDES	\N	\N	\N	\N	\N	G
745	4	10	25	\N	\N	\N	\N	147	\N	8	\N	C	\N	CLINICA INMACULADA CONCEPCION	\N	\N	\N	\N	\N	G
746	1	2	136	\N	\N	\N	\N	22	\N	2	\N	I	\N	HOSPITAL SANTA ANA (ISSS)	\N	\N	\N	\N	\N	G
747	1	5	142	\N	\N	\N	\N	40	\N	3	\N	I	\N	HOSPITAL SONSONATE (ISSS)	\N	\N	\N	\N	\N	G
748	2	17	133	\N	\N	\N	\N	215	\N	12	\N	I	\N	HOSPITAL SAN MIGUEL (ISSS)	\N	\N	\N	\N	\N	G
749	6	27	118	\N	\N	\N	\N	110	\N	6	\N	I	\N	HOSPITAL MATERNO INFANTIL (ISSS)	\N	\N	\N	\N	\N	G
750	6	24	116	\N	\N	\N	\N	110	\N	6	\N	I	\N	HOSPITAL NEUMOLOGICO (ISSS)	\N	\N	\N	\N	\N	G
751	6	27	118	\N	\N	\N	\N	110	\N	6	\N	I	\N	HOSPITAL MEDICO QUIRURGICO (ISSS)	\N	\N	\N	\N	\N	G
752	6	25	140	\N	\N	\N	\N	113	\N	6	\N	I	\N	HOSPITAL AMATEPEC (ISSS)	\N	\N	\N	\N	\N	G
753	6	27	118	\N	\N	\N	\N	110	\N	6	\N	I	\N	HOSPITAL ROMA (ISSS)	\N	\N	\N	\N	\N	G
754	6	27	118	\N	\N	\N	\N	110	\N	6	\N	I	\N	HOSPITAL ESPECIALIDADES (GENERAL) ISSS	\N	\N	\N	\N	\N	G
755	6	27	118	\N	\N	\N	\N	110	\N	6	\N	I	\N	HOSPITAL ONCOLOGICO (ISSS)	\N	\N	\N	\N	\N	G
756	2	21	3	\N	\N	\N	\N	259	\N	14	\N	U	\N	U.de S. PERIFERICA SANTA ROSA DE LIMA	\N	\N	\N	\N	\N	G
757	5	8	21	\N	\N	\N	\N	85	\N	5	\N	O	\N	ONG INTERVIDA (LA LIBERTAD)	\N	\N	\N	\N	\N	G
758	6	23	113	\N	\N	\N	\N	98	\N	6	\N	A	\N	CAE APOPA	\N	\N	\N	\N	\N	G
759	2	20	33	\N	\N	\N	\N	238	\N	13	\N	O	\N	ONG AMS SAN ISIDRO	\N	\N	\N	\N	\N	G
760	2	20	33	\N	\N	\N	\N	226	\N	13	\N	O	\N	ONG AMS GUALOCOCTI	\N	\N	\N	\N	\N	G
761	2	20	33	\N	\N	\N	\N	222	\N	13	\N	O	\N	ONG AMS CHILANGA	\N	\N	\N	\N	\N	G
762	2	20	33	\N	\N	\N	\N	221	\N	13	\N	O	\N	ONG AMS CORINTO	\N	\N	\N	\N	\N	G
763	2	20	33	\N	\N	\N	\N	231	\N	13	\N	O	\N	ONG AMS LOLOTIQUILLO	\N	\N	\N	\N	\N	G
764	4	12	4	\N	\N	\N	\N	161	\N	9	\N	O	\N	ONG FUSAL SANTA MARTA	\N	\N	\N	\N	\N	G
765	4	12	4	\N	\N	\N	\N	162	\N	9	\N	O	\N	ONG FUSAL DOLORES	\N	\N	\N	\N	\N	G
766	4	12	4	\N	\N	\N	\N	209	\N	12	\N	O	\N	ONG FUSAL NUEVO EDEN	\N	\N	\N	\N	\N	G
767	2	20	33	\N	\N	\N	\N	227	\N	13	\N	O	\N	ONG CALMA GUATAJIAGUA	\N	\N	\N	\N	\N	G
768	2	20	33	\N	\N	\N	\N	240	\N	13	\N	O	\N	ONG CALMA SEMSENBRA	\N	\N	\N	\N	\N	G
769	2	20	33	\N	\N	\N	\N	243	\N	13	\N	O	\N	ONG  CALMA YAMABAL	\N	\N	\N	\N	\N	G
770	2	20	33	\N	\N	\N	\N	219	\N	13	\N	O	\N	ONG CALMA ARAMBALA	\N	\N	\N	\N	\N	G
771	2	20	33	\N	\N	\N	\N	228	\N	13	\N	O	\N	ONG CALMA JOATECA	\N	\N	\N	\N	\N	G
772	2	20	33	\N	\N	\N	\N	225	\N	13	\N	O	\N	ONG CALMA VILLA EL ROSARIO	\N	\N	\N	\N	\N	G
773	2	21	3	\N	\N	\N	\N	253	\N	14	\N	O	\N	ONG FUNDEMUN LISLIQUE	\N	\N	\N	\N	\N	G
774	5	6	73	\N	\N	\N	\N	43	\N	4	\N	O	\N	ONG CALMA ARCATAO	\N	\N	\N	\N	\N	G
775	5	6	73	\N	\N	\N	\N	58	\N	4	\N	O	\N	ONG CALMA NUEVA TRINIDAD	\N	\N	\N	\N	\N	G
776	5	6	73	\N	\N	\N	\N	69	\N	4	\N	O	\N	ONG CALMA SAN JOSE LAS FLORES	\N	\N	\N	\N	\N	G
777	5	6	70	\N	\N	\N	\N	62	\N	4	\N	O	\N	ONG CALMA SAN ANTONIO LOS RANCHOS	\N	\N	\N	\N	\N	G
778	2	17	63	\N	\N	\N	\N	217	\N	12	\N	O	\N	ONG ASAPROSAR SESORI	\N	\N	\N	\N	\N	G
779	2	17	63	\N	\N	\N	\N	200	\N	12	\N	O	\N	ONG ASAPROSAR CIUDAD BARRIOS	\N	\N	\N	\N	\N	G
780	5	6	70	\N	\N	\N	\N	71	\N	4	\N	O	\N	ONG CALMA SAN MIGUEL DE MERCEDES	\N	\N	\N	\N	\N	G
781	5	6	70	\N	\N	\N	\N	55	\N	4	\N	O	\N	ONG CALMA LAS VUELTAS	\N	\N	\N	\N	\N	G
782	5	6	71	\N	\N	\N	\N	59	\N	4	\N	O	\N	ONG  CALMA SAN JOSE OJOS DE AGUA	\N	\N	\N	\N	\N	G
783	5	6	71	\N	\N	\N	\N	50	\N	4	\N	O	\N	ONG CALMA EL CARRIZAL	\N	\N	\N	\N	\N	G
784	5	6	71	\N	\N	\N	\N	52	\N	4	\N	O	\N	ONG CALMA LA LAGUNA	\N	\N	\N	\N	\N	G
785	5	6	71	\N	\N	\N	\N	46	\N	4	\N	O	\N	ONG CALMA COMALAPA	\N	\N	\N	\N	\N	G
786	5	6	71	\N	\N	\N	\N	50	\N	4	\N	O	\N	ONG CALMA VAINILLAS	\N	\N	\N	\N	\N	G
787	2	17	89	\N	\N	\N	\N	260	\N	14	\N	O	\N	ONG FUNDEMUN YAYANTIQUE-SN.ANTONIO SILVA	\N	\N	\N	\N	\N	G
788	2	17	63	\N	\N	\N	\N	212	\N	12	\N	O	\N	ONG FUSAL SAN GERARDO	\N	\N	\N	\N	\N	G
789	2	17	89	\N	\N	\N	\N	239	\N	13	\N	O	\N	ONG FUSA SAN SIMON	\N	\N	\N	\N	\N	G
790	2	17	63	\N	\N	\N	\N	227	\N	13	\N	O	\N	ONG ASAPROSAR GUATAJIAGUA-CIUDAD BARRIOS	\N	\N	\N	\N	\N	G
791	5	6	119	\N	\N	\N	\N	45	\N	4	\N	O	\N	ONG SERAPHIM CITALA	\N	\N	\N	\N	\N	G
792	5	6	119	\N	\N	\N	\N	53	\N	4	\N	O	\N	ONG SERAPHIM LA PALMA	\N	\N	\N	\N	\N	G
793	5	6	119	\N	\N	\N	\N	66	\N	4	\N	O	\N	ONG SERAPHIM SAN IGNACIO	\N	\N	\N	\N	\N	G
794	5	6	119	\N	\N	\N	\N	54	\N	4	\N	O	\N	ONG SERAPHIM LA REINA	\N	\N	\N	\N	\N	G
795	5	6	119	\N	\N	\N	\N	66	\N	4	\N	O	\N	ONG SERAPHIM LAS PILAS	\N	\N	\N	\N	\N	G
796	6	23	114	\N	\N	\N	\N	114	\N	6	\N	Z	\N	CENTRO PENAL DE READAPTACION DE MENORES	\N	\N	\N	\N	\N	G
797	6	27	118	\N	\N	\N	\N	110	\N	6	\N	M	\N	HOSPITAL MILITAR SAN SALVADOR	\N	\N	\N	\N	\N	G
798	4	10	25	\N	\N	\N	\N	152	\N	8	\N	I	\N	CLINICA COMUNAL ZACATECOLUCA (ISSS)	\N	\N	\N	\N	\N	G
799	2	17	63	\N	\N	\N	\N	202	\N	12	\N	O	\N	ONG CALMA GUATAJIAGUA-CHAPELTIQUE	\N	\N	\N	\N	\N	G
800	2	21	3	\N	\N	\N	\N	248	\N	14	\N	D	\N	CASA DE SALUD AMAPALITA (EL FARO)	\N	\N	\N	\N	\N	G
801	2	21	3	\N	\N	\N	\N	254	\N	14	\N	D	\N	CASA DE SALUD UPIRE FOSALUD	\N	\N	\N	\N	\N	G
802	6	25	58	\N	\N	\N	\N	109	\N	6	\N	A	\N	CAE SAN MARTIN	\N	\N	\N	\N	\N	G
803	5	6	119	\N	\N	\N	\N	48	\N	4	\N	I	\N	UNIDAD MEDICA CHALATENANGO (ISSS)	\N	\N	\N	\N	\N	G
804	5	8	126	\N	\N	\N	\N	83	\N	5	\N	I	\N	UNIDAD MEDICA LA LIBERTAD (ISSS)	\N	\N	\N	\N	\N	G
805	5	8	126	\N	\N	\N	\N	86	\N	5	\N	I	\N	UNIDAD MEDICA QUEZALTEPEQUE	\N	\N	\N	\N	\N	G
806	5	8	126	\N	\N	\N	\N	85	\N	5	\N	I	\N	UNIDAD MEDICA SANTA TECLA	\N	\N	\N	\N	\N	G
807	5	8	126	\N	\N	\N	\N	75	\N	5	\N	I	\N	CLINICA COMUNAL ANTIGUO CUSCATLAN	\N	\N	\N	\N	\N	G
808	5	8	126	\N	\N	\N	\N	85	\N	5	\N	I	\N	CLINICA COMUNAL SAN ANTONIO	\N	\N	\N	\N	\N	G
809	5	8	126	\N	\N	\N	\N	85	\N	5	\N	I	\N	CLINICA COMUNAL SANTA MONICA	\N	\N	\N	\N	\N	G
810	5	8	126	\N	\N	\N	\N	75	\N	5	\N	I	\N	CLINICA MEDICA MERLIOT	\N	\N	\N	\N	\N	G
811	5	8	126	\N	\N	\N	\N	77	\N	5	\N	I	\N	CLINICA COMUNAL LOURDES	\N	\N	\N	\N	\N	G
812	5	8	126	\N	\N	\N	\N	89	\N	5	\N	I	\N	CLINICA COMUNAL SITIO DEL NIÑO	\N	\N	\N	\N	\N	G
813	5	8	126	\N	\N	\N	\N	87	\N	5	\N	I	\N	CLINICA COMUNAL ATEOS	\N	\N	\N	\N	\N	G
814	4	12	4	\N	\N	\N	\N	161	\N	9	\N	O	\N	ONG FUSAL VICTORIA	\N	\N	\N	\N	\N	G
815	2	20	39	\N	\N	\N	\N	243	\N	13	\N	U	\N	U.de S. SAN JUAN DE LA CRUZ YAMABAL	\N	\N	\N	\N	\N	G
816	2	20	33	\N	\N	\N	\N	234	\N	13	\N	U	\N	U.de S. RANCHO QUEMADO  FOSALUD	\N	\N	\N	\N	\N	G
817	6	23	113	\N	\N	\N	\N	101	\N	6	\N	C	\N	CLINICA MUNICIPAL DEL PAISNAL	\N	\N	\N	\N	\N	G
818	2	21	3	\N	\N	\N	\N	253	\N	14	\N	O	\N	ONG FUNDEMUN GUAJINIQUIL/LISLIQUE	\N	\N	\N	\N	\N	G
819	2	17	63	\N	\N	\N	\N	200	\N	12	\N	U	\N	U.de S. PERIFERICA CIUDAD BARRIOS	\N	\N	\N	\N	\N	G
820	4	9	107	\N	\N	\N	\N	117	\N	7	\N	U	\N	U.de S. PERIFERICA DE COJUTEPEQUE	\N	\N	\N	\N	\N	G
821	2	20	33	\N	\N	\N	\N	211	\N	12	\N	O	\N	ONG CALMA SAN ATONIO DEL MOSCO-TOROLA	\N	\N	\N	\N	\N	G
822	2	21	3	\N	\N	\N	\N	259	\N	14	\N	D	\N	CASA DE SALUD EL AMATILLO	\N	\N	\N	\N	\N	G
823	2	21	3	\N	\N	\N	\N	252	\N	14	\N	D	\N	CASA DE SALUD LOMA LARGA	\N	\N	\N	\N	\N	G
824	2	17	63	\N	\N	\N	\N	199	\N	12	\N	V	\N	CENTRO DE S,  VILASECA, COL.CDAD. PACIF.	\N	\N	\N	\N	\N	G
825	4	10	25	\N	\N	\N	\N	146	\N	8	\N	V	\N	CLINICA PRIVADA SAN JUDAS TADEO	\N	\N	\N	\N	\N	G
826	1	5	18	\N	\N	\N	\N	41	\N	3	\N	V	\N	HOSPITAL DE DESNUTRICION DE AGAPE	\N	\N	\N	\N	\N	G
827	6	27	48	\N	\N	\N	\N	110	\N	6	\N	U	\N	UNIDAD MOVIL 1 FOSALUD	\N	\N	\N	\N	\N	G
828	6	27	48	\N	\N	\N	\N	110	\N	6	\N	U	\N	UNIDAD MOVIL 2 FOSALUD	\N	\N	\N	\N	\N	G
829	5	8	21	\N	\N	\N	\N	78	\N	5	\N	U	\N	UNIDAD MOVIL 3 FOSALUD	\N	\N	\N	\N	\N	G
830	5	8	21	\N	\N	\N	\N	85	\N	5	\N	U	\N	UNIDAD MOVIL 4 FOSALUD	\N	\N	\N	\N	\N	G
831	6	27	48	\N	\N	\N	\N	110	\N	6	\N	U	\N	UNIDAD MOVIL 5 FOSALUD	\N	\N	\N	\N	\N	G
833	1	2	13	\N	\N	\N	\N	22	\N	2	\N	R	\N	CENTRO REHABILITACION OCCIDENTE	\N	\N	\N	\N	\N	G
834	2	17	63	\N	\N	\N	\N	215	\N	12	\N	R	\N	CENTRO REHABILITACION INTEGRAL ORIENTE	\N	\N	\N	\N	\N	G
835	6	24	116	\N	\N	\N	\N	110	\N	6	\N	R	\N	APARATO LOCOMOTOR	\N	\N	\N	\N	\N	G
836	6	27	48	\N	\N	\N	\N	110	\N	6	\N	R	\N	AUDICION Y LENGUAJE	\N	\N	\N	\N	\N	G
837	6	24	116	\N	\N	\N	\N	110	\N	6	\N	R	\N	ATENCION A ANCIANOS SARA ZALDIVAR	\N	\N	\N	\N	\N	G
838	6	27	48	\N	\N	\N	\N	110	\N	6	\N	R	\N	REHABILITACION DE CIEGOS EUGENIA DUEÑAS	\N	\N	\N	\N	\N	G
839	6	27	48	\N	\N	\N	\N	110	\N	6	\N	R	\N	REHABILITACION INTEGRAL NIÑEZ Y ADOLESCE	\N	\N	\N	\N	\N	G
840	6	27	48	\N	\N	\N	\N	110	\N	6	\N	R	\N	CONSULTA EXTERNA Y GERIATRICA	\N	\N	\N	\N	\N	G
841	4	12	4	\N	\N	\N	\N	156	\N	9	\N	O	\N	ONG ASAPROSAR SAN FRANCISCO DEL MONTE	\N	\N	\N	\N	\N	G
842	4	12	4	\N	\N	\N	\N	156	\N	9	\N	O	\N	ONG ASAPROSAR SANTA LUCIA	\N	\N	\N	\N	\N	G
843	4	12	4	\N	\N	\N	\N	156	\N	9	\N	O	\N	ONG ASAPROSAR ILOBASCO	\N	\N	\N	\N	\N	G
844	6	27	48	\N	\N	\N	\N	110	\N	6	\N	C	\N	INSTITUTO DEL CANCER	\N	\N	\N	\N	\N	G
845	6	27	48	\N	\N	\N	\N	110	\N	6	\N	O	\N	FUDEM	\N	\N	\N	\N	\N	G
846	5	6	119	\N	\N	\N	\N	47	\N	4	\N	O	\N	ONG CALMA CONCEPCION QUEZALTEPEQUE	\N	\N	\N	\N	\N	G
847	1	2	13	\N	\N	\N	\N	17	\N	2	\N	O	\N	ONG ASAPROSAR EL PORVENIR	\N	\N	\N	\N	\N	G
848	5	6	119	\N	\N	\N	\N	42	\N	4	\N	O	\N	ONG SERAPHIM AGUA CALIENTE	\N	\N	\N	\N	\N	G
849	4	10	25	\N	\N	\N	\N	153	\N	8	\N	D	\N	CASA DE SALUD ISLA COLORADA	\N	\N	\N	\N	\N	G
850	4	10	25	\N	\N	\N	\N	153	\N	8	\N	D	\N	CASA DE SALUD ISLA SAN RAFAEL TASAJERA	\N	\N	\N	\N	\N	G
851	4	10	25	\N	\N	\N	\N	153	\N	8	\N	D	\N	CASA DE SALUD EL CHINGO	\N	\N	\N	\N	\N	G
853	1	1	1	\N	\N	\N	\N	2	\N	1	\N	O	\N	ONG LIBRAS DE AMOR APANECA	\N	\N	\N	\N	\N	G
854	1	1	1	\N	\N	\N	\N	4	\N	1	\N	O	\N	ONG LIBRAS DE AMOR ATACO	\N	\N	\N	\N	\N	G
855	1	1	1	\N	\N	\N	\N	6	\N	1	\N	O	\N	ONG LIBRAS DE AMOR GUAYMANGO	\N	\N	\N	\N	\N	G
856	1	2	2	\N	\N	\N	\N	22	\N	2	\N	O	\N	ONG LIBRAS DE AMOR SAN MIGUELITO	\N	\N	\N	\N	\N	G
857	1	2	2	\N	\N	\N	\N	22	\N	2	\N	O	\N	ONG LIBRAS DE AMOR TOMAS PINEDA MARTINEZ	\N	\N	\N	\N	\N	G
858	1	2	2	\N	\N	\N	\N	22	\N	2	\N	O	\N	ONG LIBRAS DE AMOR EL PALMAR	\N	\N	\N	\N	\N	G
859	1	2	2	\N	\N	\N	\N	16	\N	2	\N	O	\N	ONG LIBRAS DE AMOR EL CONGO	\N	\N	\N	\N	\N	G
860	1	2	2	\N	\N	\N	\N	22	\N	2	\N	O	\N	ONG LIBRAS DE AMOR SANTA LUCIA	\N	\N	\N	\N	\N	G
861	1	2	2	\N	\N	\N	\N	22	\N	2	\N	O	\N	ONG LIBRAS DE AMOR PLANES DE LA LAGUNA	\N	\N	\N	\N	\N	G
862	1	5	18	\N	\N	\N	\N	37	\N	3	\N	O	\N	ONG LIBRAS DE AMOR SAN JULIAN (LUIS POMA	\N	\N	\N	\N	\N	G
863	1	2	2	\N	\N	\N	\N	15	\N	2	\N	O	\N	ONG ASPS  CHALCHUAPA	\N	\N	\N	\N	\N	G
864	2	21	3	\N	\N	\N	\N	248	\N	14	\N	D	\N	CASA DE SALUD CONCHAGUA LU EL PILON	\N	\N	\N	\N	\N	G
865	2	21	3	\N	\N	\N	\N	255	\N	14	\N	D	\N	CS PASAQUINA LU "RAUL NAPOLEON CHICAS"	\N	\N	\N	\N	\N	G
867	4	13	29	\N	\N	\N	\N	172	\N	10	\N	U	\N	BMSALVADOREÑA-CUBANA	\N	\N	\N	\N	\N	G
868	6	27	51	\N	\N	\N	\N	99	\N	6	\N	P	\N	UNIDAD MEDICA ISSS ZACAMIL 	\N	\N	\N	\N	\N	G
869	2	14	79	\N	\N	\N	\N	183	\N	11	\N	L	\N	UCSFE  Jiquilisco US Bajo Lempa "Salud Renal"	\N	\N	\N	\N	\N	G
870	5	8	21	\N	\N	\N	\N	77	\N	5	\N	U	\N	U.de S. COLON LL "EL BOTONCILLAL"	\N	\N	\N	\N	\N	G
871	4	10	25	\N	\N	\N	\N	152	\N	8	\N	Z	\N	Centro Penal de Maxima Seguridad	\N	\N	\N	\N	\N	G
872	1	5	18	\N	\N	\N	\N	31	\N	3	\N	D	\N	CS Izalco Sonsonate San Isidro	\N	\N	\N	\N	\N	G
873	2	21	3	\N	\N	\N	\N	252	\N	14	\N	G	\N	OSI La Union LU Puerto de la Union	\N	\N	\N	\N	\N	G
874	2	21	3	\N	\N	\N	\N	252	\N	14	\N	U	\N	U. de S. La Playa	\N	\N	\N	\N	\N	G
876	1	1	1	\N	\N	\N	\N	1	\N	1	\N	G	\N	OSI Francisco Menendez AH Frontera La Hachadura	\N	\N	\N	\N	\N	G
877	1	1	1	\N	\N	\N	\N	1	\N	1	\N	G	\N	OSI Ahuachapan AH Frontera Las Chinamas	\N	\N	\N	\N	\N	G
963	2	17	63	\N	\N	\N	\N	199	\N	12	\N	J	\N	UCSF Carolina SM La Ceibita	\N	\N	\N	\N	\N	G
878	1	2	2	\N	\N	\N	\N	13	\N	2	\N	G	\N	OSI Candelaria de La Frontera SA Frontera San Cristobal	\N	\N	\N	\N	\N	G
879	1	2	2	\N	\N	\N	\N	19	\N	2	\N	G	\N	OSI Metapan SA Frontera Anguiatu	\N	\N	\N	\N	\N	G
880	5	6	119	\N	\N	\N	\N	45	\N	4	\N	G	\N	OSI Citala CH Frontera el Poy	\N	\N	\N	\N	\N	G
881	2	21	3	\N	\N	\N	\N	255	\N	14	\N	G	\N	OSI Pasaquina LU Frontera el Amatillo	\N	\N	\N	\N	\N	G
882	1	5	18	\N	\N	\N	\N	26	\N	3	\N	G	\N	OSI Acajutla SO Puerto	\N	\N	\N	\N	\N	G
883	5	6	119	\N	\N	\N	\N	48	\N	4	\N	L	\N	UCSFE Chalatenango CH Guarjila	\N	\N	\N	\N	\N	G
884	5	6	119	\N	\N	\N	\N	45	\N	4	\N	J	\N	UCSF Citala CH	\N	\N	\N	\N	\N	G
885	5	6	119	\N	\N	\N	\N	45	\N	4	\N	J	\N	UCSF Cítala CH San Ramon	\N	\N	\N	\N	\N	G
886	5	6	119	\N	\N	\N	\N	53	\N	4	\N	L	\N	UCSFE La Palma CH	\N	\N	\N	\N	\N	G
887	5	6	119	\N	\N	\N	\N	53	\N	4	\N	J	\N	UCSF La Palma CH Horcones	\N	\N	\N	\N	\N	G
888	5	6	119	\N	\N	\N	\N	53	\N	4	\N	J	\N	UCSF La Plama CH San José Sacare	\N	\N	\N	\N	\N	G
889	5	6	119	\N	\N	\N	\N	53	\N	4	\N	J	\N	UCSF La Palma CH Granadillas	\N	\N	\N	\N	\N	G
890	5	6	119	\N	\N	\N	\N	66	\N	4	\N	J	\N	UCSF San Ignacio CH	\N	\N	\N	\N	\N	G
891	5	6	119	\N	\N	\N	\N	66	\N	4	\N	J	\N	UCSF San Ignacio CH El Carmen	\N	\N	\N	\N	\N	G
892	5	6	119	\N	\N	\N	\N	66	\N	4	\N	J	\N	UCSF San Ignacio CH Las Pilas	\N	\N	\N	\N	\N	G
893	5	6	119	\N	\N	\N	\N	54	\N	4	\N	J	\N	UCSF La Reina CH	\N	\N	\N	\N	\N	G
894	5	6	119	\N	\N	\N	\N	54	\N	4	\N	J	\N	UCSF La Reina CH El Pepeto	\N	\N	\N	\N	\N	G
895	5	6	119	\N	\N	\N	\N	54	\N	4	\N	J	\N	UCSF La Reina CH El Tigre	\N	\N	\N	\N	\N	G
896	5	6	119	\N	\N	\N	\N	43	\N	4	\N	J	\N	UCSF Arcatao CH	\N	\N	\N	\N	\N	G
897	5	6	119	\N	\N	\N	\N	58	\N	4	\N	J	\N	UCSF Nueva Trinidad CH	\N	\N	\N	\N	\N	G
898	5	6	119	\N	\N	\N	\N	69	\N	4	\N	J	\N	UCSFSan Jose Las Flores CH	\N	\N	\N	\N	\N	G
899	5	6	119	\N	\N	\N	\N	56	\N	4	\N	J	\N	UCSF Nombre de Jesus CH	\N	\N	\N	\N	\N	G
900	5	6	119	\N	\N	\N	\N	56	\N	4	\N	J	\N	UCSF Nombre de Jesus CH Junquillo	\N	\N	\N	\N	\N	G
901	5	6	119	\N	\N	\N	\N	61	\N	4	\N	J	\N	UCSF San Antonio de la Cruz CH	\N	\N	\N	\N	\N	G
902	5	6	119	\N	\N	\N	\N	67	\N	4	\N	J	\N	UCSF San Isidro Labrador CH	\N	\N	\N	\N	\N	G
903	5	6	119	\N	\N	\N	\N	68	\N	4	\N	J	\N	UCSF San José Cancasque CH	\N	\N	\N	\N	\N	G
904	5	6	119	\N	\N	\N	\N	60	\N	4	\N	J	\N	UCSF Potonico CH	\N	\N	\N	\N	\N	G
905	5	6	119	\N	\N	\N	\N	62	\N	4	\N	J	\N	UCSF San Antonio los Ranchos CH	\N	\N	\N	\N	\N	G
906	5	6	119	\N	\N	\N	\N	71	\N	4	\N	J	\N	UCSF San Miguel de Mercedes CH	\N	\N	\N	\N	\N	G
907	5	6	119	\N	\N	\N	\N	55	\N	4	\N	J	\N	UCSF Las Vueltas CH	\N	\N	\N	\N	\N	G
908	5	6	119	\N	\N	\N	\N	59	\N	4	\N	J	\N	UCSF Ojos de Agua CH	\N	\N	\N	\N	\N	G
909	5	6	119	\N	\N	\N	\N	59	\N	4	\N	J	\N	UCSF Ojos de Agua CH El Zapotal	\N	\N	\N	\N	\N	G
910	5	6	119	\N	\N	\N	\N	50	\N	4	\N	J	\N	UCSF El Carrizal CH	\N	\N	\N	\N	\N	G
911	5	6	119	\N	\N	\N	\N	50	\N	4	\N	J	\N	UCSF El Carrizal CH Vanillas	\N	\N	\N	\N	\N	G
912	5	6	119	\N	\N	\N	\N	52	\N	4	\N	J	\N	UCSF La Laguna CH	\N	\N	\N	\N	\N	G
913	5	6	119	\N	\N	\N	\N	52	\N	4	\N	J	\N	UCSF La Laguna CH San Jose	\N	\N	\N	\N	\N	G
914	5	6	119	\N	\N	\N	\N	46	\N	4	\N	J	\N	UCSF Comalapa CH	\N	\N	\N	\N	\N	G
915	5	6	119	\N	\N	\N	\N	46	\N	4	\N	J	\N	UCSF Comalapa CH Guachipilín	\N	\N	\N	\N	\N	G
916	5	6	119	\N	\N	\N	\N	49	\N	4	\N	J	\N	UCSF Dulce Nombre de Maria CH	\N	\N	\N	\N	\N	G
917	5	6	119	\N	\N	\N	\N	49	\N	4	\N	J	\N	UCSF Dulce Nombre de Maria CH Ocotal	\N	\N	\N	\N	\N	G
918	5	6	119	\N	\N	\N	\N	49	\N	4	\N	J	\N	UCSF Dulce Nombre de Maria CH Gutierrez	\N	\N	\N	\N	\N	G
919	5	6	119	\N	\N	\N	\N	72	\N	4	\N	J	\N	UCSF San Rafael CH	\N	\N	\N	\N	\N	G
920	5	6	119	\N	\N	\N	\N	73	\N	4	\N	J	\N	UCSF Santa Rita CH	\N	\N	\N	\N	\N	G
921	5	6	119	\N	\N	\N	\N	72	\N	4	\N	J	\N	UCSF San Rafael CH San Jose Los Sitios	\N	\N	\N	\N	\N	G
922	5	6	119	\N	\N	\N	\N	73	\N	4	\N	J	\N	UCSF Santa Rita CH El Sol	\N	\N	\N	\N	\N	G
923	5	6	119	\N	\N	\N	\N	63	\N	4	\N	J	\N	UCSF San Fernando CH	\N	\N	\N	\N	\N	G
924	5	6	119	\N	\N	\N	\N	47	\N	4	\N	J	\N	UCSF Concepción Quezaltepeque	\N	\N	\N	\N	\N	G
925	5	6	119	\N	\N	\N	\N	47	\N	4	\N	J	\N	UCSF Concepción Quezaltepeque CH Llano Grande	\N	\N	\N	\N	\N	G
926	5	6	119	\N	\N	\N	\N	47	\N	4	\N	J	\N	UCSF Concepción Quezaltepeque CH Monte Redondo	\N	\N	\N	\N	\N	G
927	5	6	119	\N	\N	\N	\N	42	\N	4	\N	J	\N	UCSF Agua Caliente CH	\N	\N	\N	\N	\N	G
928	5	6	119	\N	\N	\N	\N	42	\N	4	\N	J	\N	UCSF Agua Caliente CH El Carmen	\N	\N	\N	\N	\N	G
929	5	6	119	\N	\N	\N	\N	42	\N	4	\N	J	\N	UCSF Agua Caliente CH Cerro Grande	\N	\N	\N	\N	\N	G
930	5	6	119	\N	\N	\N	\N	42	\N	4	\N	J	\N	UCSF Agua Caliente CH Obrajuelo	\N	\N	\N	\N	\N	G
931	5	6	119	\N	\N	\N	\N	70	\N	4	\N	J	\N	UCSF San Luis del Carmen CH	\N	\N	\N	\N	\N	G
932	5	6	119	\N	\N	\N	\N	65	\N	4	\N	J	\N	UCSF San Francisco Morazan CH	\N	\N	\N	\N	\N	G
933	4	12	4	\N	\N	\N	\N	156	\N	9	\N	L	\N	UCSFE Ilobasco CA	\N	\N	\N	\N	\N	G
934	4	12	4	\N	\N	\N	\N	159	\N	9	\N	L	\N	UCSFE Sensuntepeque CA	\N	\N	\N	\N	\N	G
935	4	12	4	\N	\N	\N	\N	209	\N	12	\N	J	\N	UCSF Nuevo Eden de San juan SM	\N	\N	\N	\N	\N	G
936	4	12	4	\N	\N	\N	\N	209	\N	12	\N	J	\N	UCSF Nuevo Eden de San Juan SM San Sebastian	\N	\N	\N	\N	\N	G
937	4	12	4	\N	\N	\N	\N	156	\N	9	\N	J	\N	UCSF Ilobasco CA San Jose	\N	\N	\N	\N	\N	G
938	4	12	4	\N	\N	\N	\N	156	\N	9	\N	J	\N	UCSF Ilobasco CA Agua Zarca	\N	\N	\N	\N	\N	G
939	4	12	4	\N	\N	\N	\N	156	\N	9	\N	J	\N	UCSF Ilobasco CA Cerro Colorado	\N	\N	\N	\N	\N	G
940	4	12	4	\N	\N	\N	\N	156	\N	9	\N	J	\N	UCSF Ilobasco CA San Francisco Iraheta	\N	\N	\N	\N	\N	G
941	4	12	4	\N	\N	\N	\N	156	\N	9	\N	J	\N	UCSF Ilobasco CA Potreros	\N	\N	\N	\N	\N	G
942	4	12	4	\N	\N	\N	\N	156	\N	9	\N	J	\N	UCSF Ilobasco CA Los Llanitos	\N	\N	\N	\N	\N	G
943	4	12	4	\N	\N	\N	\N	156	\N	9	\N	J	\N	UCSF Ilobasco CA Huertas	\N	\N	\N	\N	\N	G
944	4	12	4	\N	\N	\N	\N	156	\N	9	\N	J	\N	UCSF Ilobasco CA Sitio Viejo	\N	\N	\N	\N	\N	G
945	4	12	4	\N	\N	\N	\N	156	\N	9	\N	J	\N	UCSF Ilobasco CA  Maquilishuat Santa Lucia	\N	\N	\N	\N	\N	G
946	4	12	4	\N	\N	\N	\N	156	\N	9	\N	J	\N	UCSF Ilobasco CA Maquilishuat  El Limón	\N	\N	\N	\N	\N	G
947	4	12	4	\N	\N	\N	\N	156	\N	9	\N	J	\N	UCSF Ilobasco CA San Francisco del Monte	\N	\N	\N	\N	\N	G
948	4	12	4	\N	\N	\N	\N	157	\N	9	\N	J	\N	UCSF Jutiapa CA	\N	\N	\N	\N	\N	G
949	4	12	4	\N	\N	\N	\N	154	\N	9	\N	J	\N	UCSF Cinquera CA	\N	\N	\N	\N	\N	G
950	4	12	4	\N	\N	\N	\N	157	\N	9	\N	J	\N	UCSF Jutiapa CA Carolina	\N	\N	\N	\N	\N	G
951	4	12	4	\N	\N	\N	\N	160	\N	9	\N	J	\N	UCSF Tejutepeque CA	\N	\N	\N	\N	\N	G
952	4	12	4	\N	\N	\N	\N	160	\N	9	\N	J	\N	UCSF Tejutepeque CA Concepción	\N	\N	\N	\N	\N	G
953	4	12	4	\N	\N	\N	\N	160	\N	9	\N	J	\N	UCSF Tejutepeque CA El Zapote	\N	\N	\N	\N	\N	G
954	4	12	4	\N	\N	\N	\N	161	\N	9	\N	J	\N	UCSF Victoria CA	\N	\N	\N	\N	\N	G
955	4	12	4	\N	\N	\N	\N	161	\N	9	\N	J	\N	UCSF Victoria CA Azacualpa	\N	\N	\N	\N	\N	G
956	4	12	4	\N	\N	\N	\N	161	\N	9	\N	J	\N	UCSF Victoria CA SanAntonio	\N	\N	\N	\N	\N	G
957	4	12	4	\N	\N	\N	\N	161	\N	9	\N	J	\N	UCSF Victoria CA Santa Marta	\N	\N	\N	\N	\N	G
958	4	12	4	\N	\N	\N	\N	162	\N	9	\N	J	\N	UCSF Dolores CA	\N	\N	\N	\N	\N	G
959	4	12	4	\N	\N	\N	\N	161	\N	9	\N	J	\N	UCSF Victoria CA San Pedro	\N	\N	\N	\N	\N	G
960	4	12	4	\N	\N	\N	\N	162	\N	9	\N	J	\N	UCSF Dolores CA San Carlos	\N	\N	\N	\N	\N	G
961	2	17	63	\N	\N	\N	\N	211	\N	12	\N	J	\N	UCSF San Antonio SM	\N	\N	\N	\N	\N	G
962	2	17	63	\N	\N	\N	\N	199	\N	12	\N	J	\N	UCSF Carolina SM 1	\N	\N	\N	\N	\N	G
964	2	17	63	\N	\N	\N	\N	199	\N	12	\N	J	\N	UCSF Carolina SM Rosa Nacaspilo	\N	\N	\N	\N	\N	G
965	2	17	63	\N	\N	\N	\N	212	\N	12	\N	J	\N	UCSF San Gerardo SM San Jeronimo	\N	\N	\N	\N	\N	G
966	2	17	63	\N	\N	\N	\N	212	\N	12	\N	J	\N	UCSF San Gerardo SM 1	\N	\N	\N	\N	\N	G
967	2	20	33	\N	\N	\N	\N	227	\N	13	\N	J	\N	UCSF Guatajiagua MO 1	\N	\N	\N	\N	\N	G
968	2	20	33	\N	\N	\N	\N	227	\N	13	\N	J	\N	UCSF Guatajiagua MO 2	\N	\N	\N	\N	\N	G
969	2	20	33	\N	\N	\N	\N	227	\N	13	\N	J	\N	UCSF Guatajiagua MO Maiguera	\N	\N	\N	\N	\N	G
970	2	20	33	\N	\N	\N	\N	227	\N	13	\N	J	\N	UCSF Guatajiagua MO San Bartolo	\N	\N	\N	\N	\N	G
971	2	20	33	\N	\N	\N	\N	227	\N	13	\N	J	\N	UCSF Guatajiagua MO Los Abelines	\N	\N	\N	\N	\N	G
972	2	20	33	\N	\N	\N	\N	240	\N	13	\N	J	\N	UCSF Sensembra MO	\N	\N	\N	\N	\N	G
973	2	20	33	\N	\N	\N	\N	243	\N	13	\N	J	\N	UCSF Yamabal MO San Juan de La Cruz	\N	\N	\N	\N	\N	G
974	2	20	33	\N	\N	\N	\N	243	\N	13	\N	J	\N	UCSF Yamabal MO Isletas	\N	\N	\N	\N	\N	G
975	2	20	33	\N	\N	\N	\N	242	\N	13	\N	J	\N	UCSF Torola MO	\N	\N	\N	\N	\N	G
976	2	20	33	\N	\N	\N	\N	236	\N	13	\N	J	\N	UCSF San Fernando MO	\N	\N	\N	\N	\N	G
977	2	20	33	\N	\N	\N	\N	229	\N	13	\N	J	\N	UCSF Jocoaitique MO	\N	\N	\N	\N	\N	G
978	2	20	33	\N	\N	\N	\N	229	\N	13	\N	J	\N	UCSF Jocoaitique MO Quebrachos	\N	\N	\N	\N	\N	G
979	2	20	33	\N	\N	\N	\N	219	\N	13	\N	J	\N	UCSF Arambala MO	\N	\N	\N	\N	\N	G
980	2	20	33	\N	\N	\N	\N	228	\N	13	\N	J	\N	UCSF Joateca MO	\N	\N	\N	\N	\N	G
981	2	20	33	\N	\N	\N	\N	228	\N	13	\N	J	\N	UCSF Joateca MO La Laguna	\N	\N	\N	\N	\N	G
982	2	20	33	\N	\N	\N	\N	225	\N	13	\N	J	\N	UCSF  El Rosario MO	\N	\N	\N	\N	\N	G
983	2	20	33	\N	\N	\N	\N	238	\N	13	\N	J	\N	UCSF San Isidro MO	\N	\N	\N	\N	\N	G
984	2	20	33	\N	\N	\N	\N	239	\N	13	\N	J	\N	UCSF San Simón MO 3	\N	\N	\N	\N	\N	G
985	2	20	33	\N	\N	\N	\N	239	\N	13	\N	J	\N	UCSF San Simón MO Potrero Adentro	\N	\N	\N	\N	\N	G
986	2	17	63	\N	\N	\N	\N	239	\N	13	\N	J	\N	UCSF San Simón MO El Carrizal 1	\N	\N	\N	\N	\N	G
987	2	17	63	\N	\N	\N	\N	239	\N	13	\N	J	\N	UCSF San Simón MO Las Quebradas	\N	\N	\N	\N	\N	G
988	2	20	33	\N	\N	\N	\N	226	\N	13	\N	J	\N	UCSF Gualococti MO	\N	\N	\N	\N	\N	G
989	2	20	33	\N	\N	\N	\N	223	\N	13	\N	J	\N	UCSF Delicias de Concepción MO 1	\N	\N	\N	\N	\N	G
990	2	20	33	\N	\N	\N	\N	223	\N	13	\N	J	\N	UCSF Delicias de Concepción MO El Volcan	\N	\N	\N	\N	\N	G
991	2	20	33	\N	\N	\N	\N	222	\N	13	\N	J	\N	UCSF Chilanga MO 1	\N	\N	\N	\N	\N	G
992	2	20	33	\N	\N	\N	\N	222	\N	13	\N	J	\N	UCSF Chilanga MO Las Crucitas	\N	\N	\N	\N	\N	G
993	2	20	33	\N	\N	\N	\N	222	\N	13	\N	J	\N	UCSF Chilanga MO Piedra Parada	\N	\N	\N	\N	\N	G
994	2	20	33	\N	\N	\N	\N	221	\N	13	\N	J	\N	UCSF Corinto MO 1	\N	\N	\N	\N	\N	G
995	2	20	33	\N	\N	\N	\N	221	\N	13	\N	J	\N	UCSF Corinto MO 2	\N	\N	\N	\N	\N	G
996	2	20	33	\N	\N	\N	\N	221	\N	13	\N	J	\N	UCSF Corinto MO Corralito San Francisco	\N	\N	\N	\N	\N	G
1088	2	14	79	\N	\N	\N	\N	198	\N	11	\N	U	\N	U.de S. Usulutan US	\N	\N	\N	\N	\N	G
997	2	20	33	\N	\N	\N	\N	221	\N	13	\N	J	\N	UCSF Corinto MO San Felipe Los Villatoro	\N	\N	\N	\N	\N	G
998	2	20	33	\N	\N	\N	\N	221	\N	13	\N	J	\N	UCSF Corinto MO La Hermita	\N	\N	\N	\N	\N	G
999	2	20	33	\N	\N	\N	\N	231	\N	13	\N	J	\N	UCSF Lolotiquillo MO	\N	\N	\N	\N	\N	G
1000	2	20	33	\N	\N	\N	\N	231	\N	13	\N	J	\N	UCSF Lolotiquillo MO Gualindo	\N	\N	\N	\N	\N	G
1001	2	20	33	\N	\N	\N	\N	220	\N	13	\N	J	\N	UCSF Cacaopera MO	\N	\N	\N	\N	\N	G
1002	2	20	33	\N	\N	\N	\N	220	\N	13	\N	J	\N	UCSF Cacaopera MO La Estancia	\N	\N	\N	\N	\N	G
1003	2	20	33	\N	\N	\N	\N	220	\N	13	\N	J	\N	UCSF Cacaopera MO Agua Blanca	\N	\N	\N	\N	\N	G
1004	2	20	33	\N	\N	\N	\N	220	\N	13	\N	J	\N	UCSF Cacaopera MO Sunsulaca	\N	\N	\N	\N	\N	G
1005	2	21	3	\N	\N	\N	\N	253	\N	14	\N	J	\N	UCSF Lislique LU	\N	\N	\N	\N	\N	G
1006	2	21	3	\N	\N	\N	\N	253	\N	14	\N	J	\N	UCSF Lislique LU Pilas	\N	\N	\N	\N	\N	G
1007	2	21	3	\N	\N	\N	\N	253	\N	14	\N	J	\N	UCSF Lislique LU El Derrumbado	\N	\N	\N	\N	\N	G
1008	2	21	3	\N	\N	\N	\N	253	\N	14	\N	J	\N	UCSF Lislique LU Higueras	\N	\N	\N	\N	\N	G
1009	2	21	3	\N	\N	\N	\N	253	\N	14	\N	J	\N	UCSF Lislique LU Guajiniquil	\N	\N	\N	\N	\N	G
1010	2	21	3	\N	\N	\N	\N	258	\N	14	\N	J	\N	UCSF San Jose La Fuente LU	\N	\N	\N	\N	\N	G
1011	2	17	63	\N	\N	\N	\N	260	\N	14	\N	J	\N	UCSF Yayantique LU	\N	\N	\N	\N	\N	G
1012	2	17	63	\N	\N	\N	\N	260	\N	14	\N	J	\N	UCSF Yayantique LU El Pastor	\N	\N	\N	\N	\N	G
1013	2	17	63	\N	\N	\N	\N	260	\N	14	\N	J	\N	UCSF Yayantique LU Los Amates	\N	\N	\N	\N	\N	G
1014	2	21	3	\N	\N	\N	\N	254	\N	14	\N	J	\N	UCSF Nueva Esparta LU	\N	\N	\N	\N	\N	G
1015	2	21	3	\N	\N	\N	\N	254	\N	14	\N	J	\N	UCSF Nueva esparta LU Monteca	\N	\N	\N	\N	\N	G
1016	2	21	3	\N	\N	\N	\N	254	\N	14	\N	J	\N	UCSF Nueva Esparta LU Las Marias	\N	\N	\N	\N	\N	G
1017	2	21	3	\N	\N	\N	\N	254	\N	14	\N	J	\N	UCSF Nueva Esparta LU Honduritas	\N	\N	\N	\N	\N	G
1018	2	21	3	\N	\N	\N	\N	256	\N	14	\N	J	\N	UCSF Poloros LU	\N	\N	\N	\N	\N	G
1019	2	21	3	\N	\N	\N	\N	256	\N	14	\N	J	\N	UCSF Poloros LU Boquin	\N	\N	\N	\N	\N	G
1020	2	21	3	\N	\N	\N	\N	256	\N	14	\N	J	\N	UCSF Poloros LU Carpintero	\N	\N	\N	\N	\N	G
1021	2	21	3	\N	\N	\N	\N	256	\N	14	\N	J	\N	UCSF Poloros LU Ocote	\N	\N	\N	\N	\N	G
1022	1	2	2	\N	\N	\N	\N	17	\N	2	\N	J	\N	UCSF El Porvenir SA	\N	\N	\N	\N	\N	G
1023	1	2	2	\N	\N	\N	\N	17	\N	2	\N	J	\N	UCSF El Porvenir SA El Cerrón	\N	\N	\N	\N	\N	G
1024	1	2	2	\N	\N	\N	\N	17	\N	2	\N	J	\N	UCSF El Porvenir SA Amate Blanco	\N	\N	\N	\N	\N	G
1025	1	2	2	\N	\N	\N	\N	17	\N	2	\N	J	\N	UCSF El Porvenir SA San Juan Chiquito	\N	\N	\N	\N	\N	G
1026	1	2	2	\N	\N	\N	\N	18	\N	2	\N	J	\N	UCSF Masahuat SA	\N	\N	\N	\N	\N	G
1027	1	2	2	\N	\N	\N	\N	18	\N	2	\N	J	\N	UCSF Masahuat SA La Joya	\N	\N	\N	\N	\N	G
1028	1	2	2	\N	\N	\N	\N	23	\N	2	\N	J	\N	UCSF Santa Rosa de Guachipilín SA	\N	\N	\N	\N	\N	G
1029	1	2	2	\N	\N	\N	\N	23	\N	2	\N	J	\N	UCSF Santa Rosa Guachipilín SA  El Despoblado	\N	\N	\N	\N	\N	G
1030	1	2	2	\N	\N	\N	\N	24	\N	2	\N	J	\N	UCSF Santiago La Frontera SA	\N	\N	\N	\N	\N	G
1031	1	2	2	\N	\N	\N	\N	24	\N	2	\N	J	\N	UCSF Santiago La Frontera SA Las Piletas	\N	\N	\N	\N	\N	G
1032	1	2	2	\N	\N	\N	\N	24	\N	2	\N	J	\N	UCSF Santiago La Frontera SA Santa Cruz	\N	\N	\N	\N	\N	G
1033	1	2	2	\N	\N	\N	\N	15	\N	2	\N	J	\N	UCSF Chalchuapa SA	\N	\N	\N	\N	\N	G
1034	1	2	2	\N	\N	\N	\N	15	\N	2	\N	J	\N	UCSF Chalchuapa SA Magdalena 1	\N	\N	\N	\N	\N	G
1035	1	2	2	\N	\N	\N	\N	15	\N	2	\N	J	\N	UCSF Chalchuapa SA Magdalena 2	\N	\N	\N	\N	\N	G
1036	1	2	2	\N	\N	\N	\N	15	\N	2	\N	J	\N	UCSF Chalchuapa SA San Sebastian	\N	\N	\N	\N	\N	G
1037	1	2	2	\N	\N	\N	\N	15	\N	2	\N	J	\N	UCSF Chalchuapa SA Galeano	\N	\N	\N	\N	\N	G
1038	1	2	2	\N	\N	\N	\N	15	\N	2	\N	J	\N	UCSF Chalchuapa SA Zacamil	\N	\N	\N	\N	\N	G
1039	1	2	2	\N	\N	\N	\N	15	\N	2	\N	J	\N	UCSF Chalchuapa SA Las Flores	\N	\N	\N	\N	\N	G
1040	1	2	2	\N	\N	\N	\N	15	\N	2	\N	J	\N	UCSF Chalchuapa SA El Paste	\N	\N	\N	\N	\N	G
1041	1	2	2	\N	\N	\N	\N	15	\N	2	\N	J	\N	UCSF Chalchuapa SA El Coco	\N	\N	\N	\N	\N	G
1042	1	2	2	\N	\N	\N	\N	15	\N	2	\N	J	\N	UCSF Chalchuapa SA San José	\N	\N	\N	\N	\N	G
1043	1	2	69	\N	\N	\N	\N	15	\N	2	\N	J	\N	UCSF Chalchuapa SA Las Lomas	\N	\N	\N	\N	\N	G
1044	1	2	69	\N	\N	\N	\N	15	\N	2	\N	J	\N	UCSF Chalchuapa SA Las Lajas	\N	\N	\N	\N	\N	G
1045	1	2	69	\N	\N	\N	\N	15	\N	2	\N	J	\N	UCSF Chalchuapa SA Las Cruces	\N	\N	\N	\N	\N	G
1094	2	17	63	\N	\N	\N	\N	212	\N	12	\N	J	\N	UCSF San Gerardo SM La Laguna	\N	\N	\N	\N	\N	G
1049	1	2	2	\N	\N	\N	\N	15	\N	2	\N	L	\N	UCSFE Chalchuapa SA	\N	\N	\N	\N	\N	G
1050	1	1	1	\N	\N	\N	\N	9	\N	1	\N	J	\N	UCSF San Lorenzo AH Guascota	\N	\N	\N	\N	\N	G
1051	1	1	10	\N	\N	\N	\N	5	\N	1	\N	J	\N	UCSF El Refugio AH El Rosario	\N	\N	\N	\N	\N	G
1052	1	1	1	\N	\N	\N	\N	12	\N	1	\N	J	\N	UCSF Turín AH El Paraiso	\N	\N	\N	\N	\N	G
1099	1	5	18	\N	\N	\N	\N	36	\N	3	\N	O	\N	ONG LIBRAS DE AMOR  SONSONATE SAN ANTONIO DEL MONTE	\N	\N	\N	\N	\N	G
1107	5	8	21	\N	\N	\N	\N	94	\N	5	\N	J	\N	UCSF Teotepeque LL Aguacayo 	\N	\N	\N	\N	\N	G
1108	5	8	21	\N	\N	\N	\N	79	\N	5	\N	J	\N	UCSF Chiltiupán LL	\N	\N	\N	\N	\N	G
1056	1	1	1	\N	\N	\N	\N	3	\N	1	\N	J	\N	UCSF Atiquizaya AH Lomas de Alarcon	\N	\N	\N	\N	\N	G
1105	5	8	21	\N	\N	\N	\N	94	\N	5	\N	J	\N	UCSF Teotepeque LL El Angel	\N	\N	\N	\N	\N	G
1106	5	8	21	\N	\N	\N	\N	94	\N	5	\N	J	\N	UCSF Teotepeque LL Mizata	\N	\N	\N	\N	\N	G
1114	5	8	21	\N	\N	\N	\N	78	\N	5	\N	J	\N	UCSF Comasagua LL Los Conacastes	\N	\N	\N	\N	\N	G
1113	5	8	21	\N	\N	\N	\N	78	\N	5	\N	J	\N	UCSF Comasagua LL La Shila	\N	\N	\N	\N	\N	G
1109	5	8	21	\N	\N	\N	\N	79	\N	5	\N	J	\N	UCSF Chiltiupán LL Termophilas	\N	\N	\N	\N	\N	G
1110	5	8	21	\N	\N	\N	\N	79	\N	5	\N	J	\N	UCSF Chiltiupán LL Taquillo "Ing. Orlando Recinos"	\N	\N	\N	\N	\N	G
1111	5	8	21	\N	\N	\N	\N	82	\N	5	\N	J	\N	UCSF Jicalapa LL La Perla	\N	\N	\N	\N	\N	G
1067	1	1	117	\N	\N	\N	\N	1	\N	1	\N	J	\N	UCSF Ahuachapan AH Un Rancho y un lucero	\N	\N	\N	\N	\N	G
1112	5	8	21	\N	\N	\N	\N	78	\N	5	\N	J	\N	UCSF Comasagua LL	\N	\N	\N	\N	\N	G
1070	5	6	119	\N	\N	\N	\N	49	\N	4	\N	L	\N	UCSFE Dulce Nombre de Maria CH	\N	\N	\N	\N	\N	G
1071	5	6	119	\N	\N	\N	\N	47	\N	4	\N	L	\N	UCSFE Concepción Quezaltepeque CH	\N	\N	\N	\N	\N	G
1098	1	1	1	\N	\N	\N	\N	1	\N	1	\N	O	\N	ONG LIBRAS DE AMOR AHUACHAPAN	\N	\N	\N	\N	\N	G
1073	2	21	3	\N	\N	\N	\N	258	\N	14	\N	J	\N	UCSF San Jose la Fuente LU El Sombrerito	\N	\N	\N	\N	\N	G
1074	2	20	33	\N	\N	\N	\N	234	\N	13	\N	L	\N	UCSFE Perquin MO	\N	\N	\N	\N	\N	G
1075	2	20	33	\N	\N	\N	\N	221	\N	13	\N	L	\N	UCSFE Corinto MO	\N	\N	\N	\N	\N	G
1076	2	20	33	\N	\N	\N	\N	240	\N	13	\N	L	\N	UCSFE Semsembra MO	\N	\N	\N	\N	\N	G
1077	2	20	33	\N	\N	\N	\N	233	\N	13	\N	L	\N	UCSFE Osicala MO	\N	\N	\N	\N	\N	G
1078	2	21	3	\N	\N	\N	\N	245	\N	14	\N	L	\N	UCSFE Anamoros LU	\N	\N	\N	\N	\N	G
1079	2	17	63	\N	\N	\N	\N	199	\N	12	\N	L	\N	UCSFE Carolina SM	\N	\N	\N	\N	\N	G
1080	6	25	58	\N	\N	\N	\N	109	\N	6	\N	J	\N	UCSF San Martín SS Los Letona	\N	\N	\N	\N	\N	G
1081	6	25	58	\N	\N	\N	\N	109	\N	6	\N	J	\N	UCSF San Martín SS La Flor	\N	\N	\N	\N	\N	G
1082	6	24	116	\N	\N	\N	\N	107	\N	6	\N	J	\N	UCSF Rosario de Mora SS Palo Grande	\N	\N	\N	\N	\N	G
1083	6	24	116	\N	\N	\N	\N	106	\N	6	\N	J	\N	UCSF  Panchimalco SS Quezalapa	\N	\N	\N	\N	\N	G
1084	6	24	116	\N	\N	\N	\N	106	\N	6	\N	J	\N	UCSF  Panchimalco SS Amayon	\N	\N	\N	\N	\N	G
1085	6	23	113	\N	\N	\N	\N	101	\N	6	\N	J	\N	UCSF El Paisnal SS San Francisco dos Cerros	\N	\N	\N	\N	\N	G
1086	6	23	113	\N	\N	\N	\N	97	\N	6	\N	J	\N	UCSF Aguilares SS La Florida	\N	\N	\N	\N	\N	G
1087	4	12	4	\N	\N	\N	\N	156	\N	9	\N	J	\N	UCSF Ilobasco CA Hoyos	\N	\N	\N	\N	\N	G
1089	5	6	119	\N	\N	\N	\N	53	\N	4	\N	J	\N	UCSF La Palma CH	\N	\N	\N	\N	\N	G
1090	5	6	119	\N	\N	\N	\N	48	\N	4	\N	J	\N	UCSF Chalatenango CH Guarjila	\N	\N	\N	\N	\N	G
1091	2	20	33	\N	\N	\N	\N	227	\N	13	\N	J	\N	UCSF Guatajiagua MO Pajigua	\N	\N	\N	\N	\N	G
1092	2	20	33	\N	\N	\N	\N	211	\N	12	\N	J	\N	UCSF San Antonio SM San Diego	\N	\N	\N	\N	\N	G
1093	2	20	33	\N	\N	\N	\N	221	\N	13	\N	J	\N	UCSF Corinto MO Corralito Atillo	\N	\N	\N	\N	\N	G
1095	2	17	63	\N	\N	\N	\N	211	\N	12	\N	J	\N	UCSF san antonio SM San Marcos	\N	\N	\N	\N	\N	G
1096	2	21	3	\N	\N	\N	\N	248	\N	14	\N	J	\N	UCSF Conchagua LU Las Tunas	\N	\N	\N	\N	\N	G
1097	2	21	3	\N	\N	\N	\N	248	\N	14	\N	J	\N	UCSF Conchagua LU El Pilón	\N	\N	\N	\N	\N	G
1100	1	5	18	\N	\N	\N	\N	38	\N	3	\N	O	\N	ONG LIBRAS DE AMOR  SONSONATE SANTA CATARINA MASAHUAT	\N	\N	\N	\N	\N	G
1104	5	8	21	\N	\N	\N	\N	94	\N	5	\N	J	\N	UCSF Teotepeque LL	\N	\N	\N	\N	\N	G
1101	6	25	58	\N	\N	\N	\N	103	\N	6	\N	P	\N	UNIDAD MEDICA ISSS  ILOPANGO SS	\N	\N	\N	\N	\N	G
1102	5	6	119	\N	\N	\N	\N	48	\N	4	\N	U	\N	U.de S. Chalatenango CH Guarjila	\N	\N	\N	\N	\N	G
1103	6	27	48	\N	\N	\N	\N	110	\N	6	\N	Q	\N	CONSULTORIO DE ESPECIALIDADES	\N	\N	\N	\N	\N	G
1115	5	8	21	\N	\N	\N	\N	78	\N	5	\N	J	\N	UCSF Comasagua LL El Matazano	\N	\N	\N	\N	\N	G
1116	5	8	21	\N	\N	\N	\N	92	\N	5	\N	J	\N	UCSF Tamanique LL	\N	\N	\N	\N	\N	G
1117	5	8	21	\N	\N	\N	\N	92	\N	5	\N	J	\N	UCSF Tamanique LL Buenos Aires	\N	\N	\N	\N	\N	G
1118	5	8	21	\N	\N	\N	\N	92	\N	5	\N	J	\N	UCSF  Tamanique LL San Alfonso	\N	\N	\N	\N	\N	G
1119	5	8	21	\N	\N	\N	\N	92	\N	5	\N	J	\N	UCSF Tamanique LL El Palmar	\N	\N	\N	\N	\N	G
1120	5	8	21	\N	\N	\N	\N	91	\N	5	\N	J	\N	UCSF San Pablo Tacachico LL	\N	\N	\N	\N	\N	G
1121	5	8	21	\N	\N	\N	\N	91	\N	5	\N	J	\N	UCSF San Pablo Tacachico LL San Isidro	\N	\N	\N	\N	\N	G
1122	5	8	21	\N	\N	\N	\N	91	\N	5	\N	J	\N	UCSF San Pablo Tacachico Ll Atiocoyo	\N	\N	\N	\N	\N	G
1123	5	8	21	\N	\N	\N	\N	91	\N	5	\N	J	\N	UCSF San Pablo Tacachico LL Obraje Nuevo	\N	\N	\N	\N	\N	G
1124	5	8	23	\N	\N	\N	\N	91	\N	5	\N	J	\N	UCSF San Pablo Tacachico LL Valle Mesas	\N	\N	\N	\N	\N	G
1125	5	6	119	\N	\N	\N	\N	44	\N	4	\N	J	\N	UCSF Azacualpa CH	\N	\N	\N	\N	\N	G
1126	5	6	119	\N	\N	\N	\N	44	\N	4	\N	J	\N	UCSF San Francisco Lempa CH	\N	\N	\N	\N	\N	G
1127	4	9	107	\N	\N	\N	\N	119	\N	7	\N	J	\N	UCSF El Rosario CU 	\N	\N	\N	\N	\N	G
1128	4	9	107	\N	\N	\N	\N	137	\N	8	\N	J	\N	UCSF Paraiso de Osorio LP	\N	\N	\N	\N	\N	G
1129	4	9	107	\N	\N	\N	\N	128	\N	7	\N	J	\N	UCSF Santa Cruz Analquito CU	\N	\N	\N	\N	\N	G
1130	4	9	107	\N	\N	\N	\N	139	\N	8	\N	J	\N	UCSF San Emigdio LP	\N	\N	\N	\N	\N	G
1131	4	9	107	\N	\N	\N	\N	123	\N	7	\N	J	\N	UCSF  San Cristobal CU	\N	\N	\N	\N	\N	G
1132	4	9	107	\N	\N	\N	\N	123	\N	7	\N	J	\N	UCSF San Cristobal CU Santa Anita	\N	\N	\N	\N	\N	G
1133	4	9	107	\N	\N	\N	\N	123	\N	7	\N	J	\N	UCSF San Cristobal CU La Virgen	\N	\N	\N	\N	\N	G
1134	4	9	107	\N	\N	\N	\N	120	\N	7	\N	J	\N	UCSF Monte San Juan CU	\N	\N	\N	\N	\N	G
1135	4	9	107	\N	\N	\N	\N	120	\N	7	\N	J	\N	UCSF Monte San Juan CU San Nicolas	\N	\N	\N	\N	\N	G
1136	4	9	107	\N	\N	\N	\N	120	\N	7	\N	J	\N	UCSF Monte San Juan CU Soledad	\N	\N	\N	\N	\N	G
1137	4	9	107	\N	\N	\N	\N	131	\N	7	\N	J	\N	UCSF Tenancingo CU	\N	\N	\N	\N	\N	G
1138	4	9	107	\N	\N	\N	\N	131	\N	7	\N	J	\N	UCSF Tenancingo CU Corral Viejo	\N	\N	\N	\N	\N	G
1139	4	9	107	\N	\N	\N	\N	131	\N	7	\N	J	\N	UCSF Tenancingo CU Rosario Tablon	\N	\N	\N	\N	\N	G
1140	4	9	109	\N	\N	\N	\N	124	\N	7	\N	J	\N	UCSF San Jose Guayabal CU Llano Grande	\N	\N	\N	\N	\N	G
1141	4	9	107	\N	\N	\N	\N	126	\N	7	\N	J	\N	UCSF San Rafael Cedros CU Soledad	\N	\N	\N	\N	\N	G
1142	4	9	107	\N	\N	\N	\N	125	\N	7	\N	J	\N	UCSF San Pedro Perulapan CU La Esperanza	\N	\N	\N	\N	\N	G
1143	4	9	107	\N	\N	\N	\N	125	\N	7	\N	J	\N	UCSF San Pedro Perulapan CU San Francisco	\N	\N	\N	\N	\N	G
1144	4	9	107	\N	\N	\N	\N	118	\N	7	\N	J	\N	UCSF El Carmen CU San Antonio	\N	\N	\N	\N	\N	G
1145	4	9	107	\N	\N	\N	\N	129	\N	7	\N	J	\N	UCSF Santa Cruz Michapa CU Buena Vista	\N	\N	\N	\N	\N	G
1146	4	9	107	\N	\N	\N	\N	130	\N	7	\N	J	\N	UCSF Suchitoto CU San Cristobal	\N	\N	\N	\N	\N	G
1147	4	9	107	\N	\N	\N	\N	130	\N	7	\N	J	\N	UCSF Suchitoto CU Palo Grande	\N	\N	\N	\N	\N	G
1148	4	13	29	\N	\N	\N	\N	163	\N	10	\N	J	\N	UCSF Apastepeque SV	\N	\N	\N	\N	\N	G
1149	4	13	29	\N	\N	\N	\N	163	\N	10	\N	J	\N	UCSF Apastepeque SV Calderas	\N	\N	\N	\N	\N	G
1150	4	13	29	\N	\N	\N	\N	163	\N	10	\N	J	\N	UCSF  Apastepeque SV Las Minas	\N	\N	\N	\N	\N	G
1151	4	13	29	\N	\N	\N	\N	163	\N	10	\N	J	\N	UCSF Apastepeque SV San Felipe	\N	\N	\N	\N	\N	G
1152	4	13	29	\N	\N	\N	\N	163	\N	10	\N	J	\N	UCSF Apastepeque SV San Jacinto	\N	\N	\N	\N	\N	G
1153	4	13	29	\N	\N	\N	\N	163	\N	10	\N	J	\N	UCSF Apastepeque SV San Nicolas	\N	\N	\N	\N	\N	G
1154	4	13	29	\N	\N	\N	\N	163	\N	10	\N	J	\N	UCSF Apastepeque SV San Pedro	\N	\N	\N	\N	\N	G
1155	4	13	29	\N	\N	\N	\N	175	\N	10	\N	J	\N	UCSF Verapaz SV 	\N	\N	\N	\N	\N	G
1156	4	13	29	\N	\N	\N	\N	175	\N	10	\N	J	\N	UCSF Verapaz SV El Carmen	\N	\N	\N	\N	\N	G
1157	4	13	29	\N	\N	\N	\N	175	\N	10	\N	J	\N	UCSF Verapaz SV San Isidro	\N	\N	\N	\N	\N	G
1158	4	13	29	\N	\N	\N	\N	166	\N	10	\N	J	\N	UCSF Santa Clara SV	\N	\N	\N	\N	\N	G
1159	4	13	29	\N	\N	\N	\N	166	\N	10	\N	J	\N	UCSF Santa Clara SV Santa Rosa	\N	\N	\N	\N	\N	G
1160	4	13	29	\N	\N	\N	\N	169	\N	10	\N	J	\N	UCSF San Ildefonso SV	\N	\N	\N	\N	\N	G
1161	4	13	29	\N	\N	\N	\N	169	\N	10	\N	J	\N	UCSF San Ildefonso SV Guachipilín	\N	\N	\N	\N	\N	G
1162	4	13	29	\N	\N	\N	\N	169	\N	10	\N	J	\N	UCSF San Ildefonso SV San Lorenzo	\N	\N	\N	\N	\N	G
1163	4	13	29	\N	\N	\N	\N	168	\N	10	\N	J	\N	UCSF San Esteban Catarina SV	\N	\N	\N	\N	\N	G
1164	4	13	29	\N	\N	\N	\N	168	\N	10	\N	J	\N	UCSF San Esteban Catarina SV San Jacinto la Burrera	\N	\N	\N	\N	\N	G
1165	4	13	29	\N	\N	\N	\N	170	\N	10	\N	J	\N	UCSF San Lorenzo SV	\N	\N	\N	\N	\N	G
1166	4	13	29	\N	\N	\N	\N	170	\N	10	\N	J	\N	UCSF San Lorenzo SV Santa Lucia	\N	\N	\N	\N	\N	G
1167	4	10	25	\N	\N	\N	\N	149	\N	8	\N	J	\N	UCSF Santa Maria Ostuma LP	\N	\N	\N	\N	\N	G
1168	4	10	25	\N	\N	\N	\N	149	\N	8	\N	J	\N	UCSF Santa María Ostuma LP El Carrizal	\N	\N	\N	\N	\N	G
1169	4	10	25	\N	\N	\N	\N	149	\N	8	\N	J	\N	UCSF Santa María Ostuma LP El Chaperno	\N	\N	\N	\N	\N	G
1170	4	10	25	\N	\N	\N	\N	147	\N	8	\N	J	\N	UCSF San Pedro Nonualco LP	\N	\N	\N	\N	\N	G
1171	4	10	25	\N	\N	\N	\N	147	\N	8	\N	J	\N	UCSF San Pedro Nonualco LP San Juan Nuhuistepeque	\N	\N	\N	\N	\N	G
1172	4	10	25	\N	\N	\N	\N	147	\N	8	\N	J	\N	UCSF San Pedro Nonualco LP San Ramón	\N	\N	\N	\N	\N	G
1173	4	10	25	\N	\N	\N	\N	143	\N	8	\N	J	\N	UCSF San Juan TepezontesLP	\N	\N	\N	\N	\N	G
1174	4	10	25	\N	\N	\N	\N	145	\N	8	\N	J	\N	UCSF San Miguel Tepezontes LP	\N	\N	\N	\N	\N	G
1175	4	10	25	\N	\N	\N	\N	145	\N	8	\N	J	\N	UCSF San Miguel Tepezontes LP Soledad Las Flores	\N	\N	\N	\N	\N	G
1176	4	10	25	\N	\N	\N	\N	146	\N	8	\N	J	\N	UCSF San Antonio Masahuat LP	\N	\N	\N	\N	\N	G
1177	4	10	25	\N	\N	\N	\N	138	\N	8	\N	J	\N	UCSF San Antonio Masahuat LP La Loma	\N	\N	\N	\N	\N	G
1178	4	10	25	\N	\N	\N	\N	151	\N	8	\N	J	\N	UCSF Tapalhuaca LP	\N	\N	\N	\N	\N	G
1179	2	17	63	\N	\N	\N	\N	200	\N	12	\N	J	\N	UCSF Ciudad Barrios SM	\N	\N	\N	\N	\N	G
1180	2	17	63	\N	\N	\N	\N	200	\N	12	\N	J	\N	UCSF Ciudad Barrios SM Guanaste	\N	\N	\N	\N	\N	G
1181	2	17	63	\N	\N	\N	\N	200	\N	12	\N	J	\N	UCSF Ciudad Barrios SM El Porvenir	\N	\N	\N	\N	\N	G
1182	2	17	63	\N	\N	\N	\N	199	\N	12	\N	J	\N	UCSF Ciudad Barrios SM San Matias	\N	\N	\N	\N	\N	G
1183	2	17	63	\N	\N	\N	\N	200	\N	12	\N	J	\N	UCSF Ciudad Barrios SM San Cristobal	\N	\N	\N	\N	\N	G
1184	2	17	63	\N	\N	\N	\N	200	\N	12	\N	J	\N	UCSF Ciudad Barrios SM Llano el Angel	\N	\N	\N	\N	\N	G
1185	2	17	63	\N	\N	\N	\N	217	\N	12	\N	J	\N	UCSF Sesori SM El Tablon	\N	\N	\N	\N	\N	G
1186	2	17	63	\N	\N	\N	\N	217	\N	12	\N	J	\N	UCSF Sesori SM San Sebastían	\N	\N	\N	\N	\N	G
1187	2	17	63	\N	\N	\N	\N	217	\N	12	\N	J	\N	UCSF Sesori SM Managuara	\N	\N	\N	\N	\N	G
1188	2	17	63	\N	\N	\N	\N	217	\N	12	\N	J	\N	UCSF Sesori SM	\N	\N	\N	\N	\N	G
1189	2	17	63	\N	\N	\N	\N	202	\N	12	\N	J	\N	UCSF Chapeltique SM El Rodeo	\N	\N	\N	\N	\N	G
1190	2	14	79	\N	\N	\N	\N	187	\N	11	\N	J	\N	UCSF Nueva Granada US	\N	\N	\N	\N	\N	G
1191	2	14	79	\N	\N	\N	\N	187	\N	11	\N	J	\N	UCSF Nueva Granada US Nuevo Gualcho	\N	\N	\N	\N	\N	G
1192	2	14	79	\N	\N	\N	\N	182	\N	11	\N	J	\N	UCSF Estanzuela US	\N	\N	\N	\N	\N	G
1193	2	14	79	\N	\N	\N	\N	182	\N	11	\N	J	\N	UCSF Estanzuelas US Escarbadero	\N	\N	\N	\N	\N	G
1194	2	14	79	\N	\N	\N	\N	182	\N	11	\N	J	\N	UCSF Estanzuelas US la Cruz	\N	\N	\N	\N	\N	G
1195	2	14	79	\N	\N	\N	\N	186	\N	11	\N	J	\N	UCSF Mercedes Umaña US	\N	\N	\N	\N	\N	G
1196	2	14	79	\N	\N	\N	\N	186	\N	11	\N	J	\N	UCSF Mercedes Umaña US La Puerta	\N	\N	\N	\N	\N	G
1197	2	14	79	\N	\N	\N	\N	186	\N	11	\N	J	\N	UCSF Mercedes Umaña US Santa Anita	\N	\N	\N	\N	\N	G
1198	2	14	79	\N	\N	\N	\N	186	\N	11	\N	J	\N	UCSF Mercedes Umaña US Los Horcones	\N	\N	\N	\N	\N	G
1199	2	14	79	\N	\N	\N	\N	177	\N	11	\N	J	\N	UCSF Berlin US 1	\N	\N	\N	\N	\N	G
1200	2	14	79	\N	\N	\N	\N	177	\N	11	\N	J	\N	UCSF Berlin US 2	\N	\N	\N	\N	\N	G
1201	2	14	79	\N	\N	\N	\N	177	\N	11	\N	J	\N	UCSF Berlin US San José	\N	\N	\N	\N	\N	G
1202	2	14	79	\N	\N	\N	\N	177	\N	11	\N	J	\N	UCSF Berlin US Talpetate	\N	\N	\N	\N	\N	G
1203	2	14	79	\N	\N	\N	\N	177	\N	11	\N	J	\N	UCSF Berlin US Virginia	\N	\N	\N	\N	\N	G
1204	2	14	79	\N	\N	\N	\N	177	\N	11	\N	J	\N	UCSF Berlin US San Isidro	\N	\N	\N	\N	\N	G
1205	2	14	79	\N	\N	\N	\N	176	\N	11	\N	J	\N	UCSF Alegria US	\N	\N	\N	\N	\N	G
1206	2	14	79	\N	\N	\N	\N	176	\N	11	\N	J	\N	UCSF Alegría US Las Casitas	\N	\N	\N	\N	\N	G
1207	2	14	79	\N	\N	\N	\N	176	\N	11	\N	J	\N	UCSF Alegria US El Quebracho	\N	\N	\N	\N	\N	G
1208	2	14	79	\N	\N	\N	\N	176	\N	11	\N	J	\N	UCSF Alegría US El Zapotillo	\N	\N	\N	\N	\N	G
1209	2	14	79	\N	\N	\N	\N	197	\N	11	\N	J	\N	UCSF Tecapan US	\N	\N	\N	\N	\N	G
1210	2	14	79	\N	\N	\N	\N	197	\N	11	\N	J	\N	UCSF Tecapan US Gualache	\N	\N	\N	\N	\N	G
1211	2	14	79	\N	\N	\N	\N	197	\N	11	\N	J	\N	UCSF Tecapan US Chapetones	\N	\N	\N	\N	\N	G
1212	2	14	79	\N	\N	\N	\N	188	\N	11	\N	J	\N	UCSF Ozatlan US	\N	\N	\N	\N	\N	G
1213	2	14	79	\N	\N	\N	\N	188	\N	11	\N	J	\N	UCSF Ozatlan US Las Trancas	\N	\N	\N	\N	\N	G
1214	2	14	79	\N	\N	\N	\N	188	\N	11	\N	J	\N	UCSF Ozatlan US La Poza	\N	\N	\N	\N	\N	G
1215	2	14	79	\N	\N	\N	\N	188	\N	11	\N	J	\N	UCSF Ozatlan US La Breña	\N	\N	\N	\N	\N	G
1216	2	14	79	\N	\N	\N	\N	190	\N	11	\N	J	\N	UCSF San Agustín US	\N	\N	\N	\N	\N	G
1217	2	14	79	\N	\N	\N	\N	190	\N	11	\N	J	\N	UCSF San Agustín US El Eucalipto	\N	\N	\N	\N	\N	G
1218	2	14	79	\N	\N	\N	\N	190	\N	11	\N	J	\N	UCSF San Agustín US El Caulotal	\N	\N	\N	\N	\N	G
1219	2	14	79	\N	\N	\N	\N	194	\N	11	\N	J	\N	UCSF San Francisco Javier US	\N	\N	\N	\N	\N	G
1220	2	14	79	\N	\N	\N	\N	194	\N	11	\N	J	\N	UCSF San Francisco Javier US Los Hornos	\N	\N	\N	\N	\N	G
1221	2	14	79	\N	\N	\N	\N	194	\N	11	\N	J	\N	UCSF San Francisco Javier US La Cruz	\N	\N	\N	\N	\N	G
1222	2	14	79	\N	\N	\N	\N	193	\N	11	\N	J	\N	UCSF Santa Elena US	\N	\N	\N	\N	\N	G
1223	2	14	79	\N	\N	\N	\N	193	\N	11	\N	J	\N	UCSF Santa Elena US El Nanzal 1	\N	\N	\N	\N	\N	G
1224	2	14	79	\N	\N	\N	\N	193	\N	11	\N	J	\N	UCSF Santa Elena US El Volcan	\N	\N	\N	\N	\N	G
1225	2	14	79	\N	\N	\N	\N	193	\N	11	\N	J	\N	UCSF Santa Elena US Joya Ancha Arriba	\N	\N	\N	\N	\N	G
1226	2	14	79	\N	\N	\N	\N	193	\N	11	\N	J	\N	UCSF Santa Elena US Amate Norte	\N	\N	\N	\N	\N	G
1227	2	14	79	\N	\N	\N	\N	213	\N	12	\N	J	\N	UCSF San Jorge SM	\N	\N	\N	\N	\N	G
1228	2	14	79	\N	\N	\N	\N	213	\N	12	\N	J	\N	UCSF San Jorge SM San Julian	\N	\N	\N	\N	\N	G
1229	2	14	79	\N	\N	\N	\N	213	\N	12	\N	J	\N	UCSF San Jorge US Joya de Ventura	\N	\N	\N	\N	\N	G
1230	2	14	79	\N	\N	\N	\N	185	\N	11	\N	J	\N	UCSF Jucuaran US	\N	\N	\N	\N	\N	G
1231	2	14	79	\N	\N	\N	\N	185	\N	11	\N	J	\N	UCSF Jucuaran US El Jutal	\N	\N	\N	\N	\N	G
1232	2	14	79	\N	\N	\N	\N	185	\N	11	\N	J	\N	UCSF Jucuaran US El Espino	\N	\N	\N	\N	\N	G
1233	2	14	79	\N	\N	\N	\N	185	\N	11	\N	J	\N	UCSF Jucuaran US El Zapote	\N	\N	\N	\N	\N	G
1234	2	14	79	\N	\N	\N	\N	179	\N	11	\N	J	\N	UCSF Concepción Batres US 	\N	\N	\N	\N	\N	G
1235	2	14	79	\N	\N	\N	\N	179	\N	11	\N	J	\N	UCSF Concepción Batres US San Felipe	\N	\N	\N	\N	\N	G
1236	2	14	79	\N	\N	\N	\N	179	\N	11	\N	J	\N	UCSF Concepción Batres US Hacienda Nueva	\N	\N	\N	\N	\N	G
1237	2	14	79	\N	\N	\N	\N	179	\N	11	\N	J	\N	UCSF Concepción Batres US El Cañal	\N	\N	\N	\N	\N	G
1238	2	14	79	\N	\N	\N	\N	189	\N	11	\N	J	\N	UCSF Puerto el Triunfo US La Palmera	\N	\N	\N	\N	\N	G
1239	2	14	79	\N	\N	\N	\N	181	\N	11	\N	J	\N	UCSF Ereguayquin US Analco	\N	\N	\N	\N	\N	G
1240	1	1	1	\N	\N	\N	\N	6	\N	1	\N	J	\N	UCSF Guaymango AH	\N	\N	\N	\N	\N	G
1241	1	1	1	\N	\N	\N	\N	6	\N	1	\N	J	\N	UCSF Guaymango AH Platanares	\N	\N	\N	\N	\N	G
1242	1	1	1	\N	\N	\N	\N	6	\N	1	\N	J	\N	UCSF Guaymango AH El Escalón	\N	\N	\N	\N	\N	G
1243	1	1	1	\N	\N	\N	\N	6	\N	1	\N	J	\N	UCSF Guaymango AH Morro Grande	\N	\N	\N	\N	\N	G
1244	1	1	1	\N	\N	\N	\N	6	\N	1	\N	J	\N	UCSF Guaymango AH San Martín	\N	\N	\N	\N	\N	G
1245	1	1	11	\N	\N	\N	\N	6	\N	1	\N	J	\N	UCSF Guaymango AH Cauta Arriba	\N	\N	\N	\N	\N	G
1246	1	1	1	\N	\N	\N	\N	7	\N	1	\N	J	\N	UCSF Jujutla AH	\N	\N	\N	\N	\N	G
1247	1	1	1	\N	\N	\N	\N	7	\N	1	\N	J	\N	UCSF Jujutla AH Tihuicha	\N	\N	\N	\N	\N	G
1248	1	1	1	\N	\N	\N	\N	7	\N	1	\N	J	\N	UCSF Jujutla AH Barra de Santiago	\N	\N	\N	\N	\N	G
1249	1	1	1	\N	\N	\N	\N	7	\N	1	\N	J	\N	UCSF Jujutla AH Falla	\N	\N	\N	\N	\N	G
1250	1	1	1	\N	\N	\N	\N	7	\N	1	\N	J	\N	UCSF Jujutla AH Guayapa Abajo	\N	\N	\N	\N	\N	G
1251	1	1	1	\N	\N	\N	\N	7	\N	1	\N	J	\N	UCSF Jujutla AH Santa Rosa Guayapa	\N	\N	\N	\N	\N	G
1252	1	1	1	\N	\N	\N	\N	7	\N	1	\N	J	\N	UCSF Jujutla AH San José El Naranjo	\N	\N	\N	\N	\N	G
1253	1	1	1	\N	\N	\N	\N	7	\N	1	\N	J	\N	UCSF Jujutla AH San Antonio	\N	\N	\N	\N	\N	G
1254	1	1	1	\N	\N	\N	\N	10	\N	1	\N	J	\N	UCSF San Pedro Puxtla AH Los Aguirre	\N	\N	\N	\N	\N	G
1255	1	1	1	\N	\N	\N	\N	10	\N	1	\N	J	\N	UCSF San Pedro Puxtla AH Los Chacón	\N	\N	\N	\N	\N	G
1256	1	1	1	\N	\N	\N	\N	10	\N	1	\N	J	\N	UCSF San Pedro Puxtla AH 	\N	\N	\N	\N	\N	G
1257	1	1	1	\N	\N	\N	\N	11	\N	1	\N	J	\N	UCSF  Tacuba AH	\N	\N	\N	\N	\N	G
1258	1	1	1	\N	\N	\N	\N	11	\N	1	\N	J	\N	UCSF Tacuba AH San Rafael	\N	\N	\N	\N	\N	G
1259	1	1	1	\N	\N	\N	\N	11	\N	1	\N	J	\N	UCSF Tacuba AH Las Palmeras	\N	\N	\N	\N	\N	G
1260	1	1	1	\N	\N	\N	\N	11	\N	1	\N	J	\N	UCSF Tacuba AH Chaguite	\N	\N	\N	\N	\N	G
1261	1	1	1	\N	\N	\N	\N	11	\N	1	\N	J	\N	UCSF Tacuba AH El Jicaro	\N	\N	\N	\N	\N	G
1262	1	1	1	\N	\N	\N	\N	11	\N	1	\N	J	\N	UCSF Tacuba AH El Sincuyo	\N	\N	\N	\N	\N	G
1263	1	1	1	\N	\N	\N	\N	11	\N	1	\N	J	\N	UCSF Tacuba AH La Magdalena	\N	\N	\N	\N	\N	G
1264	1	1	1	\N	\N	\N	\N	11	\N	1	\N	J	\N	UCSF Tacuba AH Pandiadura	\N	\N	\N	\N	\N	G
1265	1	1	1	\N	\N	\N	\N	11	\N	1	\N	J	\N	UCSF Tacuba AH Valle la Puerta	\N	\N	\N	\N	\N	G
1266	1	1	1	\N	\N	\N	\N	11	\N	1	\N	J	\N	UCSF Tacuba AH La Escuela de El Rodeo	\N	\N	\N	\N	\N	G
1267	1	1	10	\N	\N	\N	\N	1	\N	1	\N	J	\N	UCSF Ahuachapan AH Ashapuco	\N	\N	\N	\N	\N	G
1268	1	1	10	\N	\N	\N	\N	1	\N	1	\N	J	\N	UCSF Ahuachapan AH El Barro	\N	\N	\N	\N	\N	G
1269	1	1	10	\N	\N	\N	\N	1	\N	1	\N	J	\N	UCSF Ahuachapan AH Llano la Laguna	\N	\N	\N	\N	\N	G
1270	1	1	1	\N	\N	\N	\N	2	\N	1	\N	J	\N	UCSF Apaneca AH Quezalapa	\N	\N	\N	\N	\N	G
1271	1	5	20	\N	\N	\N	\N	28	\N	3	\N	J	\N	UCSF Caluco SO Plan de Amayo	\N	\N	\N	\N	\N	G
1272	1	5	20	\N	\N	\N	\N	28	\N	3	\N	J	\N	UCSF Caluco SO El Zapote	\N	\N	\N	\N	\N	G
1273	1	5	18	\N	\N	\N	\N	28	\N	3	\N	J	\N	UCSF Caluco SO 	\N	\N	\N	\N	\N	G
1274	1	5	18	\N	\N	\N	\N	29	\N	3	\N	J	\N	UCSF Cuisnahuat SO Agua Shuca	\N	\N	\N	\N	\N	G
1275	1	5	18	\N	\N	\N	\N	29	\N	3	\N	J	\N	UCSF Cuisnahuat SO Coquiama	\N	\N	\N	\N	\N	G
1276	1	5	18	\N	\N	\N	\N	29	\N	3	\N	J	\N	UCSF Cuisnahuat SO San Lucas	\N	\N	\N	\N	\N	G
1277	1	5	18	\N	\N	\N	\N	29	\N	3	\N	J	\N	UCSF Cuisnahuat SO	\N	\N	\N	\N	\N	G
1278	1	5	18	\N	\N	\N	\N	38	\N	3	\N	J	\N	UCSF Santa Catarina Masahuat SO El Guayabo	\N	\N	\N	\N	\N	G
1279	1	5	18	\N	\N	\N	\N	38	\N	3	\N	J	\N	UCSF Santa Catarina Masahuat SO Tres Caminos	\N	\N	\N	\N	\N	G
1280	1	5	18	\N	\N	\N	\N	38	\N	3	\N	J	\N	UCSF Santa Catarina Mashuat SO	\N	\N	\N	\N	\N	G
1281	1	5	18	\N	\N	\N	\N	30	\N	3	\N	J	\N	UCSF Santa Isabel Ishuatan SO	\N	\N	\N	\N	\N	G
1282	1	5	18	\N	\N	\N	\N	30	\N	3	\N	J	\N	UCSF Santa Isabel Ishuatan SO Las Piedras	\N	\N	\N	\N	\N	G
1283	1	5	18	\N	\N	\N	\N	30	\N	3	\N	J	\N	UCSF Santa Isabel Ishuatan SO Acachapa	\N	\N	\N	\N	\N	G
1284	1	5	18	\N	\N	\N	\N	39	\N	3	\N	J	\N	UCSF Santo Domingo de Guzman SO El Carrizal	\N	\N	\N	\N	\N	G
1285	1	5	18	\N	\N	\N	\N	39	\N	3	\N	J	\N	UCSF Santo Domingo de Guzman SO	\N	\N	\N	\N	\N	G
1286	1	2	2	\N	\N	\N	\N	14	\N	2	\N	J	\N	UCSF Coatepeque Sa Piletas	\N	\N	\N	\N	\N	G
1287	1	2	13	\N	\N	\N	\N	14	\N	2	\N	J	\N	UCSF Coatepeque SA Aragua	\N	\N	\N	\N	\N	G
1288	6	25	112	\N	\N	\N	\N	109	\N	6	\N	J	\N	UCSF San Martín SS Santa Gertrudis	\N	\N	\N	\N	\N	G
1289	6	24	61	\N	\N	\N	\N	110	\N	6	\N	J	\N	UCSF San Salvador SS Comunidad Modelo 3	\N	\N	\N	\N	\N	G
1290	6	24	60	\N	\N	\N	\N	110	\N	6	\N	J	\N	UCSF SanSalvador SS San Cristobal	\N	\N	\N	\N	\N	G
1291	5	8	24	\N	\N	\N	\N	83	\N	5	\N	L	\N	UCSFEPuerto La Libertad LL	\N	\N	\N	\N	\N	G
1292	5	8	21	\N	\N	\N	\N	77	\N	5	\N	L	\N	UCSFE Colón LL Ciudad Mujer	\N	\N	\N	\N	\N	G
1293	4	9	110	\N	\N	\N	\N	125	\N	7	\N	L	\N	UCSFE San Pedro perulapan CU	\N	\N	\N	\N	\N	G
1294	4	13	29	\N	\N	\N	\N	175	\N	10	\N	L	\N	UCSFE Verapaz SV	\N	\N	\N	\N	\N	G
1295	4	10	27	\N	\N	\N	\N	136	\N	8	\N	L	\N	UCSFE Olocuilta LP	\N	\N	\N	\N	\N	G
1296	2	17	88	\N	\N	\N	\N	217	\N	12	\N	L	\N	UCSFE Sesori SM	\N	\N	\N	\N	\N	G
1297	2	14	84	\N	\N	\N	\N	177	\N	11	\N	L	\N	UCSFE Berlín US	\N	\N	\N	\N	\N	G
1298	2	14	125	\N	\N	\N	\N	179	\N	11	\N	L	\N	UCSFE Concepción Batres US	\N	\N	\N	\N	\N	G
1299	1	1	10	\N	\N	\N	\N	6	\N	1	\N	L	\N	UCSFE Guaymango AH	\N	\N	\N	\N	\N	G
1300	1	1	11	\N	\N	\N	\N	11	\N	1	\N	L	\N	UCSFE Tacuba AH	\N	\N	\N	\N	\N	G
1301	1	5	19	\N	\N	\N	\N	31	\N	3	\N	L	\N	UCSFE Izalco	\N	\N	\N	\N	\N	G
1302	1	5	18	\N	\N	\N	\N	41	\N	3	\N	L	\N	UCSFE Sonzacate SO	\N	\N	\N	\N	\N	G
1303	6	25	112	\N	\N	\N	\N	109	\N	6	\N	L	\N	UCSFE San Matín SS	\N	\N	\N	\N	\N	G
1304	6	24	60	\N	\N	\N	\N	110	\N	6	\N	L	\N	UCSFE San Salvador SS San Jacinto	\N	\N	\N	\N	\N	G
\.


--
-- Data for Name: cat_establecimiento_2012; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY cat_establecimiento_2012 (id_establecimiento, etz, sib, subred, nomsibasi, reg, dep, mun, idmun, tip, udep, umun, idtipoestablecimiento, tipo, descripcion, funchona, establec, codloc, lat, lng, tipoexpediente) FROM stdin;
1	0	29	145	SIBASI CERN ROSALES	5	6	1	110	H	6	01	H	1	Hospital Nacional San Salvador SS Rosales	S	50601H	0601	13.700587000000001	-89.205582000000007	G
2	0	29	145	SIBASI CERN BLOOM	5	6	2	110	H	6	01	H	1	Hospital Nacional San Salvador SS Benjamin Bloom	S	50602H	0601	13.714059000000001	-89.204063000000005	G
3	0	29	145	SIBASI CERN MATERNIDAD	5	6	3	110	H	6	01	H	1	Hospital Nacional San Salvador SS Maternidad Dr. Arguello Escolan 	S	50603H	0601	13.700659999999999	-89.204575000000006	G
4	1	1	12	SIBASI AHUACHAPAN	1	1	1	6	D	1	07	D	6	Casa de Salud Guaymando AH San Martín	S	10101D	0107	\N	\N	G
5	1	1	117	SIBASI AHUACHAPAN	1	1	1	1	H	1	01	H	1	Hospital Nacional Ahuachapán AH Francisco Menéndez	S	10101H	0101	13.928666	-89.846480999999997	G
6	1	1	10	SIBASI AHUACHAPAN	1	1	1	8	N	1	02	N	7	CRN EL ZAPOTE	S	10101N	0102	\N	\N	G
7	1	1	10	SIBASI AHUACHAPAN	1	1	1	1	U	1	01	U	3	UDS Ahuachapán AH	S	10101U	0101	\N	\N	G
8	1	1	1	SIBASI AHUACHAPAN	1	1	2	8	D	1	02	D	6	Casa de Salud San Francisco Menéndez AH San Benito	S	10102D	0102	\N	\N	G
9	1	1	10	SIBASI AHUACHAPAN	1	1	2	2	U	1	05	U	3	UDS Apaneca AH	S	10102U	0105	\N	\N	G
10	1	1	10	SIBASI AHUACHAPAN	1	1	3	1	D	1	01	D	6	Casa de Salud Ahuachapán AH Cantón Rio Frio	S	10103D	0101	\N	\N	G
11	1	1	11	SIBASI AHUACHAPAN	1	1	3	3	U	1	09	U	3	UDS ATIQUIZAYA	S	10103U	0109	\N	\N	G
12	1	1	10	SIBASI AHUACHAPAN	1	1	4	1	D	1	01	D	6	Casa de Salud Ahuachuapan AH Cantón El Tigre	S	10104D	0101	\N	\N	G
13	1	1	1	SIBASI AHUACHAPAN	1	1	4	8	U	1	02	U	3	UDS CARA SUCIA	S	10104U	0102	\N	\N	G
14	1	1	10	SIBASI AHUACHAPAN	1	1	5	11	D	1	04	D	6	Casa de Salud Tacuba AH Cantón Chaguite	S	10105D	0104	\N	\N	G
15	1	1	10	SIBASI AHUACHAPAN	1	1	5	4	U	1	03	U	3	UDS ATACO	S	10105U	0103	\N	\N	G
16	1	1	10	SIBASI AHUACHAPAN	1	1	6	11	U	1	04	U	3	UDS TACUBA	S	10106U	0104	\N	\N	G
17	1	1	1	SIBASI AHUACHAPAN	1	1	7	8	U	1	02	U	3	UDS LA HACHADURA	S	10107U	0102	\N	\N	G
18	1	1	12	SIBASI AHUACHAPAN	1	1	8	6	U	1	07	U	3	UDS GUAYMANGO	S	10108U	0107	\N	\N	G
19	1	1	12	SIBASI AHUACHAPAN	1	1	9	7	U	1	08	U	3	UDS JUJUTLA	S	10109U	0108	\N	\N	G
20	1	1	12	SIBASI AHUACHAPAN	1	1	10	7	U	1	08	U	3	UDS SAN JOSE EL NARANJO (JUJUTLA)	S	10110U	0108	\N	\N	G
21	1	1	10	SIBASI AHUACHAPAN	1	1	11	1	U	1	01	U	3	UDS Ahuachapán AH Las Chinamas	S	10111U	0101	\N	\N	G
22	1	1	12	SIBASI AHUACHAPAN	1	1	12	7	U	1	08	U	3	UDS GUAYAPA ABAJO	S	10112U	0108	\N	\N	G
23	1	1	12	SIBASI AHUACHAPAN	1	1	13	10	U	1	06	U	3	UDS SAN PEDRO PUXTLA	S	10113U	0106	\N	\N	G
24	1	1	11	SIBASI AHUACHAPAN	1	1	14	9	U	1	11	U	3	UDS SAN LORENZO (AHUACHAPAN)	S	10114U	0111	\N	\N	G
25	1	1	11	SIBASI AHUACHAPAN	1	1	15	12	U	1	10	U	3	UDS TURIN	S	10115U	0110	\N	\N	G
26	1	1	11	SIBASI AHUACHAPAN	1	1	16	5	U	1	12	U	3	UDS EL REFUGIO	S	10116U	0112	\N	\N	G
27	1	1	1	SIBASI AHUACHAPAN	1	1	17	8	U	1	02	U	3	UDS SAN FRANCISCO MENENDEZ	S	10117U	0102	\N	\N	G
28	1	1	12	SIBASI AHUACHAPAN	1	1	18	7	U	1	08	U	3	UDS BARRA DE SANTIAGO	S	10118U	0108	\N	\N	G
29	1	1	1	SIBASI AHUACHAPAN	1	1	19	8	U	1	02	U	3	UDS EL ZAPOTE (SAN FCO.MENENDEZ)	S	10119U	0102	\N	\N	G
30	1	1	1	SIBASI AHUACHAPAN	1	1	20	8	U	1	02	U	3	UDS GARITA PALMERA	S	10120U	0102	\N	\N	G
31	1	1	1	SIBASI AHUACHAPAN	1	1	21	8	U	1	02	U	3	UDS ING.JAVIER ESTRADA	S	10121U	0102	\N	\N	G
32	1	2	136	SIBASI SANTA ANA	1	2	1	22	H	2	01	H	1	Hospital Nacional Santa Ana SA San Juan de Dios	S	10201H	0201	13.991572	-89.551192999999998	G
33	1	2	13	SIBASI SANTA ANA	1	2	1	22	N	2	01	N	7	CRN PRIMAVERA (STA.ANA)	S	10201N	0201	\N	\N	G
34	1	2	13	SIBASI SANTA ANA	1	2	1	22	U	2	01	U	3	UDS DR.TOMAS PINEDA MARTINEZ	S	10201U	0201	\N	\N	G
35	1	2	13	SIBASI SANTA ANA	1	2	2	22	U	2	01	U	3	UDS CASA DEL NIÑO	S	10202U	0201	\N	\N	G
36	1	2	13	SIBASI SANTA ANA	1	2	3	22	U	2	01	U	3	UDS EL PALMAR	S	10203U	0201	\N	\N	G
37	1	2	13	SIBASI SANTA ANA	1	2	4	22	U	2	01	U	3	UDS SANTA LUCIA (SANTA ANA)	S	10204U	0201	\N	\N	G
38	1	2	14	SIBASI SANTA ANA	1	2	5	22	U	2	01	U	3	UDS SAN MIGUELITO STA.ANA	S	10205U	0201	\N	\N	G
39	1	2	14	SIBASI SANTA ANA	1	2	6	22	U	2	01	U	3	UDS SAN RAFAEL (SANTA ANA)	S	10206U	0201	\N	\N	G
40	1	2	14	SIBASI SANTA ANA	1	2	7	22	U	2	01	U	3	UDS SANTA BARBARA	S	10207U	0201	\N	\N	G
41	1	2	13	SIBASI SANTA ANA	1	2	8	22	D	2	01	D	6	Casa de Salud Santa Ana SA Los Apoyos	S	10208D	0201	\N	\N	G
42	1	2	16	SIBASI SANTA ANA	1	2	8	14	U	2	03	U	3	UDS COATEPEQUE	S	10208U	0203	\N	\N	G
43	1	2	13	SIBASI SANTA ANA	1	2	9	13	D	2	01	D	6	Casa de Salud Cande. de la Frontera SA Los Rivas	S	10209D	0201	\N	\N	G
44	1	2	15	SIBASI SANTA ANA	1	2	9	25	U	2	04	U	3	UDS TEXISTEPEQUE	S	10209U	0204	\N	\N	G
45	1	2	16	SIBASI SANTA ANA	1	2	10	16	U	2	02	U	3	UDS EL CONGO	S	10210U	0202	\N	\N	G
46	1	2	17	SIBASI SANTA ANA	1	2	11	13	U	2	06	U	3	UDS CANDELARIA DE LA FRONTERA	S	10211U	0206	\N	\N	G
47	1	2	15	SIBASI SANTA ANA	1	2	13	25	U	2	04	U	3	UDS GUARNECIA	S	10213U	0204	\N	\N	G
48	1	2	16	SIBASI SANTA ANA	1	2	14	22	U	2	01	U	3	UDS PLANES DE LA LAGUNA	S	10214U	0201	\N	\N	G
49	1	2	14	SIBASI SANTA ANA	1	2	15	22	U	2	01	U	3	UDS NATIVIDAD	S	10215U	0201	\N	\N	G
50	1	2	13	SIBASI SANTA ANA	1	2	17	22	D	2	01	D	6	Casa de Salud Santa Ana SA El Pinalón	S	10217D	0201	\N	\N	G
51	1	2	13	SIBASI SANTA ANA	1	2	19	22	D	2	02	D	6	Casa de Salud Santa Ana SA Lomas de San Marcelino	S	10219D	0201	\N	\N	G
52	1	2	16	SIBASI SANTA ANA	1	2	20	14	D	2	03	D	6	Casa de Salud Coatepeque SA Piletas	S	10220D	0203	\N	\N	G
53	1	2	17	SIBASI SANTA ANA	1	2	22	13	U	2	06	U	3	UDS LA PARADA ALDEA BOLAÑOS	S	10222U	0206	\N	\N	G
54	1	2	16	SIBASI SANTA ANA	1	2	23	14	U	2	03	U	3	UDS SAN JACINTO(COATEPEQUE)	S	10223U	0203	\N	\N	G
55	1	2	17	SIBASI SANTA ANA	1	2	25	24	U	2	10	U	3	UDS SANTIAGO DE LA FRONTERA	S	10225U	0210	\N	\N	G
56	1	2	17	SIBASI SANTA ANA	1	2	26	20	U	2	13	U	3	UDS SAN ANTONIO PAJONAL	S	10226U	0213	\N	\N	G
57	1	2	16	SIBASI SANTA ANA	1	2	27	14	U	2	03	U	3	UDS EL TINTERAL	S	10227U	0203	\N	\N	G
58	1	2	15	SIBASI SANTA ANA	1	2	28	25	U	2	04	U	3	UDS SAN MIGUEL TEXISTEPEQUE	S	10228U	0204	\N	\N	G
59	1	2	17	SIBASI SANTA ANA	1	2	30	15	U	2	05	U	3	UDS SABANETAS EL PASTE	S	10230U	0205	\N	\N	G
60	1	2	17	SIBASI SANTA ANA	1	2	21	13	D	2	06	D	6	Casa de Salud Cande. de la Frontera SA San Vicente	S	10221D	0203	\N	\N	G
61	1	2	16	SIBASI SANTA ANA	1	2	22	16	D	2	02	D	6	Casa de Salud El Congo SA San José Las Flores	S	10222D	0102	\N	\N	G
62	1	2	13	SIBASI SANTA ANA	1	2	3	13	N	2	01	N	7	CRN SAN MIGUEL	S	10203N	0201	\N	\N	G
63	1	2	13	SIBASI METAPAN	1	2	2	19	H	2	09	H	1	Hospital Nacional Metapán SA 	S	10202H	0209	14.324776999999999	-89.443282999999994	G
64	1	2	13	SIBASI METAPAN	1	2	10	19	D	2	09	D	6	Casa de Salud Metapán SA Montenegro	S	10210D	0209	\N	\N	G
65	1	2	13	SIBASI METAPAN	1	2	12	23	U	2	12	U	3	UDS SANTA ROSA GUACHIPILIN	S	10212U	0212	\N	\N	G
66	1	2	13	SIBASI METAPAN	1	2	18	19	U	2	09	U	3	UDS SAN JUAN LAS MINAS (METAPAN)	S	10218U	0209	\N	\N	G
67	1	2	13	SIBASI METAPAN	1	2	19	18	U	2	11	U	3	UDS MASAHUAT (SANTA ANA)	S	10219U	0211	\N	\N	G
68	1	2	13	SIBASI METAPAN	1	2	20	19	U	2	09	U	3	UDS SAN JERONIMO (METAPAN)	S	10220U	0209	\N	\N	G
69	1	2	13	SIBASI METAPAN	1	2	21	19	U	2	09	U	3	UDS BELEN GUIJATH (METAPAN)	S	10221U	0209	\N	\N	G
70	1	2	13	SIBASI METAPAN	1	2	24	19	U	2	09	U	3	UDS SAN JOSE INGENIO(METAPAN)	S	10224U	0209	\N	\N	G
71	1	2	13	SIBASI CHALCHUAPA	1	2	2	15	N	2	05	N	7	CRN CRISTOBAL LA MAGDALENA	S	10202N	0205	\N	\N	G
72	1	2	13	SIBASI CHALCHUAPA	1	2	3	15	H	2	05	H	1	Hospital Nacional Chalchuapa SA 	S	10203H	0205	\N	\N	G
73	1	2	13	SIBASI CHALCHUAPA	1	2	16	17	U	2	08	U	3	UDS EL PORVENIR	S	10216U	0208	\N	\N	G
74	1	2	13	SIBASI CHALCHUAPA	1	2	17	21	U	2	07	U	3	UDS SAN SEBASTIAN SALITRILLO	S	10217U	0207	\N	\N	G
75	1	2	13	SIBASI CHALCHUAPA	1	2	29	15	U	2	05	U	3	UDS EL COCO	S	10229U	0205	\N	\N	G
76	1	2	13	SIBASI CHALCHUAPA	1	2	31	15	U	2	05	U	3	UDS CHALCHUAPA	S	10231U	0205	\N	\N	G
77	1	5	19	SIBASI SONSONATE	1	3	1	31	D	3	08	D	6	Casa de Salud Izalco SO Piedras Pachas	S	10301D	0308	\N	\N	G
78	1	5	137	SIBASI SONSONATE	1	3	1	40	H	3	01	H	1	Hospital Nacional Sonsonate SO Dr. Jorge Mazzini Villacorta	S	10301H	0301	13.722579	-89.729393000000002	G
79	1	5	19	SIBASI SONSONATE	1	3	1	31	U	3	08	U	3	UDS IZALCO	S	10301U	0308	\N	\N	G
80	1	5	19	SIBASI SONSONATE	1	3	2	31	D	3	08	D	6	Casa de Salud Izalco SO Cuyagualo	S	10302D	0308	\N	\N	G
81	1	5	19	SIBASI SONSONATE	1	3	2	31	N	3	08	N	7	CRN LAS LAJAS	S	10302N	0308	\N	\N	G
82	1	5	18	SIBASI SONSONATE	1	3	2	33	U	3	02	U	3	UDS NAHUIZALCO	S	10302U	0302	\N	\N	G
83	1	5	19	SIBASI SONSONATE	1	3	3	31	D	3	08	D	6	Casa de Salud Izalco SO Cantón Talcomunca	S	10303D	0308	\N	\N	G
84	1	5	19	SIBASI SONSONATE	1	3	3	37	N	3	10	N	7	CRN LOS LAGARTOS	S	10303N	0310	\N	\N	G
85	1	5	19	SIBASI SONSONATE	1	3	3	27	U	3	09	U	3	UDS ARMENIA	S	10303U	0309	\N	\N	G
86	1	5	19	SIBASI SONSONATE	1	3	4	29	D	3	12	D	6	Casa de Salud Cuisnahuat SO Cantón San Lucas	S	10304D	0312	\N	\N	G
87	1	5	18	SIBASI SONSONATE	1	3	4	32	N	3	14	N	7	CRN SAN JUAN DE DIOS	S	10304N	0314	\N	\N	G
88	1	5	19	SIBASI SONSONATE	1	3	4	37	U	3	10	U	3	UDS SAN JULIAN	S	10304U	0310	\N	\N	G
89	1	5	18	SIBASI SONSONATE	1	3	5	32	D	3	14	D	6	Casa de Salud Juayua SO Cantón San Juan de Dios	S	10305D	0314	\N	\N	G
90	1	5	20	SIBASI SONSONATE	1	3	5	26	U	3	07	U	3	UDS Acajutla SO	S	10305U	0307	\N	\N	G
91	1	5	18	SIBASI SONSONATE	1	3	6	32	U	3	14	U	3	UDS DR.FRANCISCO MAGAÑA H.JUAYUA	S	10306U	0314	\N	\N	G
92	1	5	20	SIBASI SONSONATE	1	3	7	41	U	3	05	U	3	UDS DR.LEONARDO A.LOPEZ V(SONZACATE)	S	10307U	0305	\N	\N	G
93	1	5	20	SIBASI SONSONATE	1	3	8	26	U	3	07	U	3	UDS METALIO (ACAJUTLA)	S	10308U	0307	\N	\N	G
94	1	5	18	SIBASI SONSONATE	1	3	9	32	U	3	14	U	3	UDS LA MAJADA (JUAYUA)	S	10309U	0314	\N	\N	G
95	1	5	20	SIBASI SONSONATE	1	3	10	34	U	3	04	U	3	UDS NAHULINGO	S	10310U	0304	\N	\N	G
96	1	5	18	SIBASI SONSONATE	1	3	11	38	U	3	15	U	3	UDS SANTA CATARINA MASAHUAT	S	10311U	0315	\N	\N	G
97	1	5	20	SIBASI SONSONATE	1	3	12	39	U	3	03	U	3	UDS SANTO DOMINGO DE GUZMAN	S	10312U	0303	\N	\N	G
98	1	5	19	SIBASI SONSONATE	1	3	13	30	U	3	11	U	3	UDS SANTA ISABEL ISHUATAN	S	10313U	0311	\N	\N	G
99	1	5	20	SIBASI SONSONATE	1	3	14	40	U	3	11	U	3	UDS SALINAS DE AYACACHAPA	S	10314U	0301	\N	\N	G
100	1	5	19	SIBASI SONSONATE	1	3	15	28	U	3	13	U	3	UDS CALUCO	S	10315U	0313	\N	\N	G
101	1	5	19	SIBASI SONSONATE	1	3	16	29	U	3	12	U	3	UDS CUISNAHUAT	S	10316U	0312	\N	\N	G
102	1	5	20	SIBASI SONSONATE	1	3	17	36	U	3	06	U	3	UDS SAN ANTONIO DEL MONTE	S	10317U	0306	\N	\N	G
103	1	5	18	SIBASI SONSONATE	1	3	18	35	U	3	16	U	3	UDS SALCOATITAN	S	10318U	0316	\N	\N	G
104	1	5	18	SIBASI SONSONATE	1	3	19	33	U	3	02	U	3	UDS LOS ARENALES (NAHUIZAL)	S	10319U	0302	\N	\N	G
158	5	6	119	SIBASI NUEVA CONCEPCION	2	4	13	45	U	4	21	U	3	UDS CITALA	S	20413U	0421	\N	\N	G
105	5	6	70	SIBASI CHALATENANGO	2	4	1	47	D	4	06	D	6	Casa de Salud Concep.Quezaltepeque CH Llano Grande	S	20401D	0406	\N	\N	G
106	5	6	119	SIBASI CHALATENANGO	2	4	1	48	H	4	01	H	1	Hospital Nacional Chalatenango CH  Dr. Luis Edmundo Vásquez	S	20401H	0401	\N	\N	G
107	5	6	70	SIBASI CHALATENANGO	2	4	1	51	N	4	28	N	7	CRN SANTA BARBARA	S	20401N	0428	\N	\N	G
108	5	6	71	SIBASI CHALATENANGO	2	4	2	46	D	4	32	D	6	Casa de Salud Comalapa CH Guachipilin	S	20402D	0432	\N	\N	G
109	5	6	70	SIBASI CHALATENANGO	2	4	2	51	N	4	28	N	7	CRN LOS CRUCES	S	20402N	0428	\N	\N	G
110	5	6	73	SIBASI CHALATENANGO	2	4	2	69	U	4	05	U	3	UDS SAN JOSE LAS FLORES	S	20402U	0405	\N	\N	G
111	5	6	74	SIBASI CHALATENANGO	2	4	3	65	D	4	29	D	6	Casa de Salud San Francisco Morazán CH Teosinte	S	20403D	0429	\N	\N	G
112	5	6	70	SIBASI CHALATENANGO	2	4	3	48	U	4	01	U	3	UDS EL DORADO (CHALATENANGO)	S	20403U	0401	\N	\N	G
113	5	6	74	SIBASI CHALATENANGO	2	4	4	72	N	4	30	N	7	CRN LOS DERAS	S	20404N	0430	\N	\N	G
114	5	6	74	SIBASI CHALATENANGO	2	4	4	49	U	4	26	U	3	UDS DULCE NOMBRE DE MARIA	S	20404U	0426	\N	\N	G
115	5	6	72	SIBASI CHALATENANGO	2	4	5	56	U	4	07	U	3	UDS NOMBRE DE JESUS	S	20405U	0407	\N	\N	G
116	5	6	70	SIBASI CHALATENANGO	2	4	6	47	N	4	06	N	7	CRN LAS FLORES	S	20406N	0406	\N	\N	G
117	5	6	74	SIBASI CHALATENANGO	2	4	9	73	N	4	31	N	7	CRN EL CHUPADERO	S	20409N	0431	\N	\N	G
118	5	6	70	SIBASI CHALATENANGO	2	4	9	51	U	4	28	U	3	UDS EL PARAISO	S	20409U	0428	\N	\N	G
119	5	6	70	SIBASI CHALATENANGO	2	4	10	51	N	4	01	N	7	CRN ROBLE 2	S	20410N	0401	\N	\N	G
120	5	6	73	SIBASI CHALATENANGO	2	4	10	43	U	4	02	U	3	UDS ARCATAO	S	20410U	0402	\N	\N	G
121	5	6	70	SIBASI CHALATENANGO	2	4	11	55	U	4	11	U	3	UDS LAS VUELTAS	S	20411U	0411	\N	\N	G
122	5	6	71	SIBASI CHALATENANGO	2	4	12	52	U	4	33	U	3	UDS LA LAGUNA	S	20412U	0433	\N	\N	G
123	5	6	74	SIBASI CHALATENANGO	2	4	15	64	U	4	29	U	3	UDS SAN FRANCISCO MORAZAN	S	20415U	0429	\N	\N	G
124	5	6	71	SIBASI CHALATENANGO	2	4	16	46	U	4	32	U	3	UDS COMALAPA	S	20416U	0432	\N	\N	G
125	5	6	71	SIBASI CHALATENANGO	2	4	17	59	U	4	18	U	3	UDS OJOS DE AGUA	S	20417U	0418	\N	\N	G
126	5	6	75	SIBASI CHALATENANGO	2	4	18	70	U	4	13	U	3	UDS SAN LUIS DEL CARMEN	S	20418U	0413	\N	\N	G
127	5	6	70	SIBASI CHALATENANGO	2	4	19	62	U	4	08	U	3	UDS SAN ANTONIO LOS RANCHOS	S	20419U	0408	\N	\N	G
128	5	6	75	SIBASI CHALATENANGO	2	4	20	60	U	4	12	U	3	UDS POTONICO	S	20420U	0412	\N	\N	G
129	5	6	75	SIBASI CHALATENANGO	2	4	21	44	U	4	14	U	3	UDS AZACUALPA	S	20421U	0414	\N	\N	G
130	5	6	74	SIBASI CHALATENANGO	2	4	22	63	U	4	27	U	3	UDS SAN FERNANDO (CHALATEN)	S	20422U	0427	\N	\N	G
131	5	6	75	SIBASI CHALATENANGO	2	4	23	64	U	4	17	U	3	UDS SAN FRANCISCO LEMPA	S	20423U	0417	\N	\N	G
132	5	6	73	SIBASI CHALATENANGO	2	4	24	58	U	4	04	U	3	UDS NUEVA TRINIDAD	S	20424U	0404	\N	\N	G
133	5	6	74	SIBASI CHALATENANGO	2	4	25	72	U	4	30	U	3	UDS SAN RAFAEL	S	20425U	0430	\N	\N	G
134	5	6	70	SIBASI CHALATENANGO	2	4	26	47	U	4	06	U	3	UDS CONCEPCION QUEZALTEPEQUE	S	20426U	0406	\N	\N	G
135	5	6	71	SIBASI CHALATENANGO	2	4	27	50	U	4	09	U	3	UDS EL CARRIZAL	S	20427U	0409	\N	\N	G
136	5	6	74	SIBASI CHALATENANGO	2	4	28	73	U	4	31	U	3	UDS SANTA RITA	S	20428U	0431	\N	\N	G
137	5	6	72	SIBASI CHALATENANGO	2	4	29	61	U	4	10	U	3	UDS SAN ANTONIO DE LA CRUZ	S	20429U	0410	\N	\N	G
138	5	6	70	SIBASI CHALATENANGO	2	4	30	71	U	4	16	U	3	UDS SAN MIGUEL DE MERCEDES	S	20430U	0416	\N	\N	G
139	5	6	72	SIBASI CHALATENANGO	2	4	31	68	U	4	15	U	3	UDS SAN JOSE CANCASQUE	S	20431U	0415	\N	\N	G
140	5	6	72	SIBASI CHALATENANGO	2	4	35	67	U	4	03	U	3	UDS SAN ISIDRO LABRADOR	S	20435U	0403	\N	\N	G
141	5	6	71	SIBASI CHALATENANGO	2	4	36	50	U	4	09	U	3	UDS VAINILLAS	S	20436U	0409	\N	\N	G
142	5	6	119	SIBASI CHALATENANGO	2	4	11	73	D	4	32	D	6	Casa de Salud Santa Rita CH Candelaria	S	20411D	0432	\N	\N	G
143	5	6	119	SIBASI NUEVA CONCEPCION	2	4	1	53	U	4	22	U	3	UDS LA PALMA	S	20401U	0422	\N	\N	G
144	5	6	119	SIBASI NUEVA CONCEPCION	2	4	2	57	H	4	20	H	1	Hospital Nacional Nueva Concepción CH 	S	20402H	0420	\N	\N	G
145	5	6	119	SIBASI NUEVA CONCEPCION	2	4	3	60	N	4	19	N	7	CRN AGUAJE ESCONDIDO	S	20403N	0419	\N	\N	G
146	5	6	119	SIBASI NUEVA CONCEPCION	2	4	4	54	D	4	23	D	6	Casa de Salud La Reina CH El Tigre	S	20404D	0423	\N	\N	G
147	5	6	119	SIBASI NUEVA CONCEPCION	2	4	5	54	D	4	23	D	6	Casa de Salud La Reina CH El Pepeto	S	20405D	0423	\N	\N	G
148	5	6	119	SIBASI NUEVA CONCEPCION	2	4	6	42	D	4	25	D	6	Casa de Salud Agua Caliente CH El Encumbrado	S	20406D	0425	\N	\N	G
149	5	6	119	SIBASI NUEVA CONCEPCION	2	4	6	42	U	4	25	U	3	UDS Agua Caliente CH	S	20406U	0425	\N	\N	G
150	5	6	119	SIBASI NUEVA CONCEPCION	2	4	7	42	D	4	25	D	6	Casa de Salud Agua Caliente CH Cerro Grande	S	20407D	0425	\N	\N	G
151	5	6	119	SIBASI NUEVA CONCEPCION	2	4	7	63	N	4	22	N	7	CRN SAN ANTONIO	S	20407N	0422	\N	\N	G
152	5	6	119	SIBASI NUEVA CONCEPCION	2	4	7	74	U	4	19	U	3	UDS TEJUTLA	S	20407U	0419	\N	\N	G
153	5	6	119	SIBASI NUEVA CONCEPCION	2	4	8	42	D	4	25	D	6	Casa de Salud Agua Caliente CH Obrajuelo	S	20408D	0425	\N	\N	G
154	5	6	119	SIBASI NUEVA CONCEPCION	2	4	8	57	N	4	20	N	7	CRN LA CRUZ	S	20408N	0420	\N	\N	G
155	5	6	119	SIBASI NUEVA CONCEPCION	2	4	8	54	U	4	23	U	3	UDS LA REINA	S	20408U	0423	\N	\N	G
156	5	6	119	SIBASI NUEVA CONCEPCION	2	4	9	53	D	4	22	D	6	Casa de Salud La Palma CH Los Planes	S	20409D	0422	\N	\N	G
157	5	6	119	SIBASI NUEVA CONCEPCION	2	4	10	57	D	4	20	D	6	Casa de Salud Nueva Concepción CH Sunapa	S	20410D	0420	\N	\N	G
159	5	6	119	SIBASI NUEVA CONCEPCION	2	4	14	66	U	4	24	U	3	UDS SAN IGNACIO	S	20414U	0424	\N	\N	G
160	5	6	119	SIBASI NUEVA CONCEPCION	2	4	32	57	U	4	20	U	3	UDS POTRERO SULA	S	20432U	0420	\N	\N	G
161	5	6	119	SIBASI NUEVA CONCEPCION	2	4	33	57	U	4	20	U	3	UDS ARRACAOS	S	20433U	0420	\N	\N	G
162	5	6	119	SIBASI NUEVA CONCEPCION	2	4	34	66	U	4	24	U	3	UDS LAS PILAS	S	20434U	0424	\N	\N	G
163	5	8	126	SIBASI LA LIBERTAD	2	5	1	85	H	5	01	H	1	Hospital Nacional Santa Tecla LL  San Rafael	S	20501H	0501	13.671393999999999	-89.278603000000004	G
164	5	8	24	SIBASI LA LIBERTAD	2	5	1	79	N	5	11	N	7	CRN SHUTIA	S	20501N	0511	\N	\N	G
165	5	8	24	SIBASI LA LIBERTAD	2	5	1	83	U	5	03	U	3	UDS PUERTO LA LIBERTAD	S	20501U	0503	\N	\N	G
166	5	8	24	SIBASI LA LIBERTAD	2	5	2	83	N	5	03	N	7	CRN CANGREJERA (SAN ARTURO NIZA)	S	20502N	0503	\N	\N	G
167	5	8	22	SIBASI LA LIBERTAD	2	5	2	81	U	5	02	U	3	UDS DR.FCO.LIMA (JAYAQUE)	S	20502U	0502	\N	\N	G
168	5	8	23	SIBASI LA LIBERTAD	2	5	3	85	D	5	01	D	6	Casa de Salud Santa Tecla LL  Las Granadillas	S	20503D	0501	\N	\N	G
169	5	8	24	SIBASI LA LIBERTAD	2	5	3	83	N	5	03	N	7	CRN MELARA	S	20503N	0503	\N	\N	G
170	5	8	22	SIBASI LA LIBERTAD	2	5	3	76	U	5	22	U	3	UDS CIUDAD ARCE	S	20503U	0522	\N	\N	G
171	5	8	23	SIBASI LA LIBERTAD	2	5	4	85	D	5	01	D	6	Casa de Salud Santa Tecla LL El Progreso	S	20504D	0501	\N	\N	G
172	5	8	21	SIBASI LA LIBERTAD	2	5	4	96	N	5	22	N	7	CRN EL CONACASTE	S	20504N	0522	\N	\N	G
173	5	8	21	SIBASI LA LIBERTAD	2	5	4	86	U	5	18	U	3	UDS QUEZALTEPEQUE	S	20504U	0518	\N	\N	G
174	5	8	21	SIBASI LA LIBERTAD	2	5	5	89	N	5	20	N	7	CRN SITIO GRANDE	S	20505N	0520	\N	\N	G
175	5	8	21	SIBASI LA LIBERTAD	2	5	5	89	U	5	20	U	3	UDS SAN JUAN OPICO	S	20505U	0520	\N	\N	G
176	5	8	21	SIBASI LA LIBERTAD	2	5	6	91	U	5	19	U	3	UDS SAN PABLO TACACHICO	S	20506U	0519	\N	\N	G
177	5	8	22	SIBASI LA LIBERTAD	2	5	7	77	U	5	08	U	3	UDS LOURDES (COLON)	S	20507U	0508	\N	\N	G
178	5	8	21	SIBASI LA LIBERTAD	2	5	8	89	U	5	20	U	3	UDS SITIO DEL NIÑO	S	20508U	0520	\N	\N	G
179	5	8	23	SIBASI LA LIBERTAD	2	5	9	85	U	5	01	U	3	UDS DR. ALBERTO AGUILAR RIVAS	S	20509U	0501	\N	\N	G
180	5	8	23	SIBASI LA LIBERTAD	2	5	10	78	U	5	04	U	3	UDS COMASAGUA	S	20510U	0504	\N	\N	G
181	5	8	23	SIBASI LA LIBERTAD	2	5	11	96	D	5	15	D	6	Casa de Salud Zaragoza LL La Esmeraldita	S	20511D	0515	\N	\N	G
182	5	8	21	SIBASI LA LIBERTAD	2	5	11	90	U	5	21	U	3	UDS SAN MATIAS	S	20511U	0521	\N	\N	G
183	5	8	22	SIBASI LA LIBERTAD	2	5	12	95	U	5	07	U	3	UDS TEPECOYO	S	20512U	0507	\N	\N	G
184	5	8	23	SIBASI LA LIBERTAD	2	5	13	85	D	5	01	D	6	Casa de Salud Santa Tecla LL Alvarez	S	20513D	0501	\N	\N	G
185	5	8	23	SIBASI LA LIBERTAD	2	5	13	80	U	5	06	U	3	UDS HUIZUCAR	S	20513U	0506	\N	\N	G
187	5	8	23	SIBASI LA LIBERTAD	2	5	15	88	U	5	09	U	3	UDS SAN JOSE VILLANUEVA	S	20515U	0509	\N	\N	G
188	5	8	23	SIBASI LA LIBERTAD	2	5	16	96	U	5	15	U	3	UDS Zaragoza LL	S	20516U	0515	\N	\N	G
189	5	8	24	SIBASI LA LIBERTAD	2	5	17	94	U	5	05	U	3	UDS MIZATA	S	20517U	0505	\N	\N	G
190	5	8	24	SIBASI LA LIBERTAD	2	5	18	79	U	5	11	U	3	UDS CHILTIUPAN	S	20518U	0511	\N	\N	G
191	5	8	23	SIBASI LA LIBERTAD	2	5	19	85	U	5	01	U	3	UDS DR.CARLOS DIAZ DEL PINAL	S	20519U	0501	\N	\N	G
192	5	8	24	SIBASI LA LIBERTAD	2	5	20	92	U	5	10	U	3	UDS TAMANIQUE	S	20520U	0510	\N	\N	G
193	5	8	22	SIBASI LA LIBERTAD	2	5	21	87	U	5	17	U	3	UDS SACACOYO	S	20521U	0517	\N	\N	G
194	5	8	24	SIBASI LA LIBERTAD	2	5	22	82	U	5	16	U	3	UDS JICALAPA	S	20522U	0516	\N	\N	G
195	5	8	22	SIBASI LA LIBERTAD	2	5	23	93	U	5	14	U	3	UDS TALNIQUE	S	20523U	0514	\N	\N	G
196	5	8	23	SIBASI LA LIBERTAD	2	5	24	75	U	5	12	U	3	UDS ANTIGUO CUSCATLAN	S	20524U	0512	\N	\N	G
197	5	8	23	SIBASI LA LIBERTAD	2	5	25	84	U	5	13	U	3	UDS NUEVO CUSCATLAN	S	20525U	0513	\N	\N	G
198	5	8	24	SIBASI LA LIBERTAD	2	5	26	79	U	5	11	U	3	UDS ING. ORLANDO RECINOS	S	20526U	0511	\N	\N	G
199	5	8	22	SIBASI LA LIBERTAD	2	5	28	93	U	5	14	U	3	UDS SAN JOSE LOS SITIOS	S	20528U	0514	\N	\N	G
200	5	8	22	SIBASI LA LIBERTAD	2	5	27	77	U	5	08	U	3	UDS DR.MANUEL GALLADRO COLON	S	20527U	0508	\N	\N	G
201	5	8	21	SIBASI LA LIBERTAD	2	5	16	89	D	5	20	D	6	Casa de Salud San Juan Opico LL Las Granadillas	S	20516D	0520	\N	\N	G
202	5	8	21	SIBASI LA LIBERTAD	2	5	17	75	D	5	01	D	6	Casa de Salud Antig.Cuscatlán LL Melara	S	20517D	0501	\N	\N	G
203	5	8	22	SIBASI LA LIBERTAD	2	5	18	87	D	5	01	D	6	Casa de Salud Sacacoyo LL Villa Tzu-Chi I	S	20518D	0501	\N	\N	G
204	4	9	110	SIBASI COJUTEPEQUE	3	7	1	125	D	7	02	D	6	Casa de Salud San Pedro Perulapán CU Cantón El Espino	S	30701D	0702	\N	\N	G
205	4	9	110	SIBASI COJUTEPEQUE	3	7	1	125	U	7	02	U	3	UDS SAN PEDRO PERULAPAN	S	30701U	0702	\N	\N	G
206	4	9	110	SIBASI COJUTEPEQUE	3	7	2	125	D	7	02	D	6	Casa de Salud San Pedro Perulapán CU Cantón El Carmen	S	30702D	0702	\N	\N	G
207	4	9	122	SIBASI COJUTEPEQUE	3	7	2	117	H	7	01	H	1	Hospital Nacional Cojutepeque CU  Nuestra Sra. de Fátima	S	30702H	0701	\N	\N	G
208	4	9	110	SIBASI COJUTEPEQUE	3	7	3	125	D	7	02	D	6	Casa de Salud San Pedro Perulapán CU Cantón Tecoluco	S	30703D	0702	\N	\N	G
209	4	9	107	SIBASI COJUTEPEQUE	3	7	3	126	U	7	04	U	3	UDS SAN RAFAEL CEDROS	S	30703U	0704	\N	\N	G
210	4	9	110	SIBASI COJUTEPEQUE	3	7	4	129	U	7	09	U	3	UDS SANTA CRUZ MICHAPA	S	30704U	0709	\N	\N	G
211	4	9	108	SIBASI COJUTEPEQUE	3	7	5	131	D	7	03	D	6	Casa de Salud Tenancingo Cu Cantón Corral Viejo	S	30705D	0703	\N	\N	G
212	4	9	108	SIBASI COJUTEPEQUE	3	7	5	131	U	7	03	U	3	UDS TENANCINGO	S	30705U	0703	\N	\N	G
213	4	9	107	SIBASI COJUTEPEQUE	3	7	6	118	D	7	07	D	6	Casa de Salud El Carmen CU Cantón San Antonio	S	30706D	0707	\N	\N	G
214	4	9	108	SIBASI COJUTEPEQUE	3	7	6	128	U	7	13	U	3	UDS SANTA CRUZ ANALQUITO	S	30706U	0713	\N	\N	G
215	4	9	107	SIBASI SUCHITOTO	3	7	7	124	D	7	15	D	6	Casa de Salud San José Guayabal CU Cantón Piedra Labrada	S	30707D	0715	\N	\N	G
216	4	9	108	SIBASI COJUTEPEQUE	3	7	7	116	U	7	05	U	3	UDS CANDELARIA CUSCATLAN	S	30707U	0705	\N	\N	G
217	4	9	107	SIBASI COJUTEPEQUE	3	7	8	126	D	7	04	D	6	Casa de Salud San Rafael Cedros CU Cantón Soledad	S	30708D	0704	\N	\N	G
218	4	9	107	SIBASI COJUTEPEQUE	3	7	8	119	U	7	12	U	3	UDS ROSARIO CUSCATLAN	S	30708U	0712	\N	\N	G
219	4	9	107	SIBASI COJUTEPEQUE	3	7	9	120	U	7	06	U	3	UDS MONTE SAN JUAN	S	30709U	0706	\N	\N	G
220	4	9	108	SIBASI COJUTEPEQUE	3	7	11	123	U	7	08	U	3	UDS SAN CRISTOBAL	S	30711U	0708	\N	\N	G
221	4	9	108	SIBASI COJUTEPEQUE	3	7	12	127	U	7	11	U	3	UDS SAN RAMON	S	30712U	0711	\N	\N	G
222	4	9	107	SIBASI COJUTEPEQUE	3	7	13	118	U	7	07	U	3	UDS EL CARMEN CUSCATLAN	S	30713U	0707	\N	\N	G
223	4	9	108	SIBASI COJUTEPEQUE	3	8	17	139	U	8	07	U	3	UDS SAN EMIGDIO	S	30817U	0807	\N	\N	G
224	4	9	108	SIBASI COJUTEPEQUE	3	8	26	137	U	8	08	U	3	UDS PARAISO DE OSORIO	S	30826U	0808	\N	\N	G
225	4	9	107	SIBASI COJUTEPEQUE	3	7	9	117	D	7	01	D	6	Casa de Salud Cojutepeque CU Copinol	S	30709D	0701	\N	\N	G
226	4	9	107	SIBASI COJUTEPEQUE	3	7	10	117	D	7	01	D	6	Casa de Salud Cojutepeque CU Cantón Candelaria	S	30710D	0701	\N	\N	G
227	4	9	107	SIBASI COJUTEPEQUE	3	7	11	120	D	7	06	D	6	Casa de Salud Monte San Juan CU Cantón Soledad	S	30711D	0706	\N	\N	G
228	4	10	127	SIBASI LA PAZ	3	8	1	152	H	8	01	H	1	Hospital Nacional Zacatecoluca LP  Santa Teresa	S	30801H	0801	13.51741	-88.868149000000003	G
229	4	10	27	SIBASI LA PAZ	3	8	1	144	N	8	21	N	7	CRN LAS MONJAS	S	30801N	0821	\N	\N	G
230	4	10	25	SIBASI LA PAZ	3	8	1	147	U	8	05	U	3	UDS SAN PEDRO NONUALCO	S	30801U	0805	\N	\N	G
231	4	10	27	SIBASI LA PAZ	3	8	2	144	D	8	16	D	6	Casa de Salud San Luis Talpa LP Amatecampo	S	30802D	0816	\N	\N	G
232	4	10	25	SIBASI LA PAZ	3	8	2	150	N	8	02	N	7	CRN EL TIHUILOCOYO	S	30802N	0802	\N	\N	G
233	4	10	26	SIBASI LA PAZ	3	8	2	146	U	8	17	U	3	UDS SAN PEDRO MASAHUAT	S	30802U	0817	\N	\N	G
234	4	10	28	SIBASI LA PAZ	3	8	3	153	D	8	22	D	6	Casa de Salud San Luis la Herradura LP Guadalupe la Zorra	S	30803D	0822	\N	\N	G
235	4	10	25	SIBASI LA PAZ	3	8	3	150	N	8	02	N	7	CRN HOJA DE SAL	S	30803N	0802	\N	\N	G
236	4	10	25	SIBASI LA PAZ	3	8	3	150	U	8	02	U	3	UDS SANTIAGO NONUALCO	S	30803U	0802	\N	\N	G
237	4	10	28	SIBASI LA PAZ	3	8	4	153	D	8	22	D	6	Casa de Salud San Luis la Herradura LP La Calzada	S	30804D	0822	\N	\N	G
238	4	10	28	SIBASI LA PAZ	3	8	4	150	N	8	22	N	7	CRN EL PORFIADO	S	30804N	0822	\N	\N	G
239	4	10	28	SIBASI LA PAZ	3	8	4	153	U	8	22	U	3	UDS SAN LUIS LA HERRADURA	S	30804U	0822	\N	\N	G
240	4	10	27	SIBASI LA PAZ	3	8	5	146	D	8	16	D	6	Casa de Salud San Pedro Masahuat LP Astoria	S	30805D	0816	\N	\N	G
241	4	10	27	SIBASI LA PAZ	3	8	5	146	N	8	16	N	7	CRN VILLA PALESTINA	S	30805N	0816	\N	\N	G
242	4	10	27	SIBASI LA PAZ	3	8	5	144	U	8	16	U	3	UDS SAN LUIS TALPA	S	30805U	0816	\N	\N	G
243	4	10	26	SIBASI LA PAZ	3	8	6	146	D	8	17	D	6	Casa de Salud San Pedro Masahuat LP Barahona	S	30806D	0817	\N	\N	G
244	4	10	26	SIBASI LA PAZ	3	8	6	146	N	8	17	N	7	CRN EL ACHIOTAL	S	30806N	0817	\N	\N	G
245	4	10	27	SIBASI LA PAZ	3	8	6	136	U	8	11	U	3	UDS OLOCUILTA	S	30806U	0811	\N	\N	G
246	4	10	27	SIBASI LA PAZ	3	8	7	136	D	8	11	D	6	Casa de Salud Olocuilta LP La Esperanza	S	30807D	0811	\N	\N	G
247	4	10	26	SIBASI LA PAZ	3	8	7	146	N	8	17	N	7	CRN EL PORVENIR	S	30807N	0817	\N	\N	G
248	4	10	26	SIBASI LA PAZ	3	8	7	133	U	8	21	U	3	UDS ROSARIO DE LA PAZ	S	30807U	0821	\N	\N	G
249	4	10	27	SIBASI LA PAZ	3	8	8	136	D	8	11	D	6	Casa de Salud Olocuilta LP San Sebastian	S	30808D	0811	\N	\N	G
250	4	10	26	SIBASI LA PAZ	3	8	8	133	N	8	16	N	7	CRN EL PEDREGAL	S	30808N	0816	\N	\N	G
251	4	10	25	SIBASI LA PAZ	3	8	8	141	U	8	03	U	3	UDS SAN JUAN NONUALCO	S	30808U	0803	\N	\N	G
252	4	10	26	SIBASI LA PAZ	3	8	9	146	N	8	17	N	7	CRN SAN MARCOS JIBOA	S	30809N	0817	\N	\N	G
253	4	10	25	SIBASI LA PAZ	3	8	9	149	U	8	06	U	3	UDS SANTA MARÍA OSTUMA	S	30809U	0806	\N	\N	G
254	4	10	28	SIBASI LA PAZ	3	8	10	153	N	8	22	N	7	CRN GUADALUPE LA ZORRA	S	30810N	0822	\N	\N	G
255	4	10	26	SIBASI LA PAZ	3	8	10	145	U	8	18	U	3	UDS SAN MIGUEL TEPEZONTES	S	30810U	0818	\N	\N	G
256	4	10	25	SIBASI LA PAZ	3	8	11	148	U	8	04	U	3	UDS SAN RAFAEL OBRAJUELO	S	30811U	0804	\N	\N	G
257	4	10	27	SIBASI LA PAZ	3	8	12	142	U	8	12	U	3	UDS SAN JUAN TALPA	S	30812U	0812	\N	\N	G
258	4	10	26	SIBASI LA PAZ	3	8	13	143	U	8	20	U	3	UDS SAN JUAN TEPEZONTES	S	30813U	0820	\N	\N	G
259	4	10	27	SIBASI LA PAZ	3	8	14	140	U	8	14	U	3	UDS SAN FRANCISCO CHINAMECA	S	30814U	0814	\N	\N	G
260	4	13	29	SIBASI SAN VICENTE	3	8	15	134	U	8	09	U	3	UDS JERUSALEN	S	30815U	0809	\N	\N	G
261	4	10	27	SIBASI LA PAZ	3	8	16	136	U	8	11	U	3	UDS SANTA LUCÍA ORCOYO	S	30816U	0811	\N	\N	G
262	4	10	27	SIBASI LA PAZ	3	8	18	132	U	8	13	U	3	UDS CUYULTITAN	S	30818U	0813	\N	\N	G
263	4	10	28	SIBASI LA PAZ	3	8	19	146	U	8	17	U	3	UDS LAS ISLETAS	S	30819U	0817	\N	\N	G
264	4	10	26	SIBASI LA PAZ	3	8	20	146	U	8	17	U	3	UDS SAN PEDRO MASAHUAT EL ACHIOTAL 	S	30820U	0817	\N	\N	G
265	4	10	25	SIBASI LA PAZ	3	8	21	150	U	8	02	U	3	UDS SAN JOSÉ LA PAZ ARRRIBA	S	30821U	0802	\N	\N	G
266	4	10	28	SIBASI LA PAZ	3	8	22	153	U	8	22	U	3	UDS LA HERRADURA EL ZAPOTE	S	30822U	0822	\N	\N	G
267	4	10	26	SIBASI LA PAZ	3	8	23	138	U	8	19	U	3	UDS SAN ANTONIO MASAHUAT	S	30823U	0819	\N	\N	G
268	4	10	27	SIBASI LA PAZ	3	8	24	144	U	8	16	U	3	UDS SAN LUIS TALPA EL PIMENTAL	S	30824U	0816	\N	\N	G
269	4	10	27	SIBASI LA PAZ	3	8	25	151	U	8	15	U	3	UDS TAPALCHUACA	S	30825U	0815	\N	\N	G
270	4	10	25	SIBASI LA PAZ	3	8	27	152	U	8	01	U	3	UDS DR. CARLOS ALBERTO GALEANO	S	30827U	0801	\N	\N	G
271	4	10	25	SIBASI LA PAZ	3	8	9	152	D	8	01	D	6	Casa de Salud Zacatecoluca LP El Piche	S	30809D	0801	\N	\N	G
272	4	10	25	SIBASI LA PAZ	3	8	10	152	D	8	01	D	6	Casa de Salud Zacatecoluca LP Azacualpa	S	30810D	0801	\N	\N	G
273	4	13	29	SIBASI SAN VICENTE	3	8	28	135	U	8	10	U	3	UDS MERCEDESLA CEIBA	S	30828U	0810	\N	\N	G
274	4	10	25	SIBASI LA PAZ	3	8	11	152	D	8	01	D	6	Casa de Salud Zacatecoluca LP San Faustino	S	30811D	0801	\N	\N	G
275	4	10	27	SIBASI LA PAZ	3	8	12	142	D	8	16	G	6	OSI San Juan Talpa LP Aeropuerto Internacional	S	30812D	0816	\N	\N	G
276	4	12	4	SIBASI SENSUNTEPEQUE	3	9	1	159	H	9	01	H	1	Hospital Nacional Sensuntepeque CA 	S	30901H	0901	\N	\N	G
277	4	12	4	SIBASI SENSUNTEPEQUE	3	9	2	158	U	9	04	U	3	UDS SAN ISIDRO (CABAÑAS)	S	30902U	0904	\N	\N	G
278	4	12	4	SIBASI SENSUNTEPEQUE	3	9	3	158	N	9	04	N	7	CRN IZCATAL	S	30903N	0904	\N	\N	G
279	4	12	4	SIBASI SENSUNTEPEQUE	3	9	3	161	U	9	02	U	3	UDS VICTORIA	S	30903U	0902	\N	\N	G
280	4	12	4	SIBASI SENSUNTEPEQUE	3	9	4	158	N	9	04	N	7	CRN HACIENDA VIEJA	S	30904N	0904	\N	\N	G
281	4	12	4	SIBASI SENSUNTEPEQUE	3	9	5	158	N	9	04	N	7	CRN PUERTONA	S	30905N	0904	\N	\N	G
282	4	12	4	SIBASI SENSUNTEPEQUE	3	9	6	159	D	9	01	D	6	Casa de Salud Sensuntepeque CA Copinolapa	S	30906D	0901	\N	\N	G
283	4	12	4	SIBASI SENSUNTEPEQUE	3	9	6	158	N	9	04	N	7	CRN JOBITOS	S	30906N	0904	\N	\N	G
284	4	12	4	SIBASI SENSUNTEPEQUE	3	9	7	159	D	9	01	D	6	Casa de Salud Sensuntepeque CA San Marcos	S	30907D	0901	\N	\N	G
285	4	12	4	SIBASI SENSUNTEPEQUE	3	9	7	162	U	9	03	U	3	UDS DOLORES	S	30907U	0903	\N	\N	G
286	4	12	4	SIBASI SENSUNTEPEQUE	3	9	8	159	D	9	01	D	6	Casa de Salud Sensuntepeque CA San Gregorio	S	30908D	0901	\N	\N	G
287	4	12	4	SIBASI SENSUNTEPEQUE	3	9	9	159	D	9	01	D	6	Casa de Salud Sensuntepeque CA Cuyantepeque	S	30909D	0901	\N	\N	G
288	4	12	4	SIBASI SENSUNTEPEQUE	3	9	10	161	D	9	02	D	6	Casa de Salud Victoria CA San Pedro	S	30910D	0902	\N	\N	G
289	4	12	4	SIBASI SENSUNTEPEQUE	3	9	10	159	N	9	01	N	7	CRN SANTA CRUZ LA JUNTA	S	30910N	0901	\N	\N	G
290	4	12	4	SIBASI SENSUNTEPEQUE	3	9	10	155	U	9	05	U	3	UDS GUACOTECTI	S	30910U	0905	\N	\N	G
291	4	12	4	SIBASI SENSUNTEPEQUE	3	9	11	161	D	9	02	D	6	Casa de Salud Victoria CA Aparatao	S	30911D	0902	\N	\N	G
292	4	12	4	SIBASI SENSUNTEPEQUE	3	9	12	162	D	9	03	D	6	Casa de Salud Dolores CA San Carlos	S	30912D	0903	\N	\N	G
293	4	12	4	SIBASI SENSUNTEPEQUE	3	9	13	159	U	9	01	U	3	UDS SENSUNTEPEQUE	S	30913U	0901	\N	\N	G
294	4	12	4	SIBASI SENSUNTEPEQUE	3	9	14	161	U	9	02	U	3	UDS SANTA MARTA	S	30914U	0902	\N	\N	G
295	4	12	4	SIBASI SENSUNTEPEQUE	4	12	21	209	U	12	18	U	3	UDS NUEVO EDEN DE SAN JUAN	S	41221U	1218	\N	\N	G
296	4	12	6	SIBASI ILOBASCO	3	9	1	156	D	9	06	D	6	Casa de Salud Ilobasco CA San Francisco Iraheta	S	30901D	0906	\N	\N	G
297	4	12	4	SIBASI ILOBASCO	3	9	1	159	N	9	06	N	7	CRN ORATORIO CENTRO	S	30901N	0906	\N	\N	G
298	4	12	6	SIBASI ILOBASCO	3	9	2	156	D	9	06	D	6	Casa de Salud Ilobasco CA Potrero	S	30902D	0906	\N	\N	G
299	4	12	123	SIBASI ILOBASCO	3	9	2	156	H	9	06	H	1	Hospital Nacional Ilobasco CA  Dr. José L. Saca	S	30902H	0906	\N	\N	G
300	4	12	6	SIBASI ILOBASCO	3	9	3	156	D	9	06	D	6	Casa de Salud Ilobasco CA Huertas	S	30903D	0906	\N	\N	G
301	4	12	6	SIBASI ILOBASCO	3	9	4	157	D	9	08	D	6	Casa de Salud Jutiapa CA San Sebastian Cerron Grande	S	30904D	0908	\N	\N	G
302	4	12	5	SIBASI ILOBASCO	3	9	4	162	U	9	09	U	3	UDS CINQUERA	S	30904U	0909	\N	\N	G
303	4	12	6	SIBASI ILOBASCO	3	9	5	159	D	9	01	D	6	Casa de Salud Sensuntepeque CA San Nicolas	S	30905D	0901	\N	\N	G
304	4	12	5	SIBASI ILOBASCO	3	9	5	160	U	9	07	U	3	UDS TEJUTEPEQUE	S	30905U	0907	\N	\N	G
305	4	12	6	SIBASI ILOBASCO	3	9	6	161	U	9	08	U	3	UDS JUTIAPA	S	30906U	0908	\N	\N	G
306	4	12	4	SIBASI ILOBASCO	3	9	7	154	N	9	01	N	7	CRN SAN NICOLAS	S	30907N	0901	\N	\N	G
307	4	12	4	SIBASI ILOBASCO	3	9	8	154	N	9	01	N	7	CRN CAMPAMENTO 2 CANTON SAN NICOLAS	S	30908N	0901	\N	\N	G
308	4	12	4	SIBASI ILOBASCO	3	9	8	159	U	9	06	U	3	UDS SANTA LUCIA (ILOBASCO)	S	30908U	0906	\N	\N	G
309	4	12	6	SIBASI ILOBASCO	3	9	9	161	U	9	08	U	3	UDS CAROLINA (JUTIAPA )	S	30909U	0908	\N	\N	G
310	4	12	4	SIBASI ILOBASCO	3	9	11	159	U	9	06	U	3	UDS SAN FCO.DEL MONTE	S	30911U	0906	\N	\N	G
311	4	12	4	SIBASI ILOBASCO	3	9	12	156	U	9	06	U	3	UDS ILOBASCO	S	30912U	0906	\N	\N	G
312	4	12	5	SIBASI ILOBASCO	3	9	13	160	D	9	07	D	6	Casa de Salud Tejutepeque CA El Zapote	S	30913D	0907	\N	\N	G
313	4	12	6	SIBASI ILOBASCO	3	9	14	156	D	9	06	D	6	Casa de Salud Ilobasco CA San José	S	30914D	0906	\N	\N	G
314	4	13	134	SIBASI SAN VICENTE	3	10	1	172	H	10	01	H	1	Hospital Nacional San Vicente SV   Santa Gertrudis	S	31001H	1001	\N	\N	G
315	4	13	29	SIBASI SAN VICENTE	3	10	1	163	N	10	01	N	7	CRN FENADESAL	S	31001N	1001	\N	\N	G
316	4	13	31	SIBASI SAN VICENTE	3	10	1	171	U	10	08	U	3	UDS SAN SEBASTIAN	S	31001U	1008	\N	\N	G
317	4	13	29	SIBASI SAN VICENTE	3	10	2	165	N	10	07	N	7	CRN SAN CAYETANO ISTEPEQUE	S	31002N	1007	\N	\N	G
318	4	13	29	SIBASI SAN VICENTE	3	10	2	164	U	10	03	U	3	UDS GUADALUPE	S	31002U	1003	\N	\N	G
319	4	13	32	SIBASI SAN VICENTE	3	10	3	173	U	10	06	U	3	UDS TECOLUCA	S	31003U	1006	\N	\N	G
320	4	13	29	SIBASI SAN VICENTE	3	10	1	172	D	10	01	D	6	Casa de Salud San Vicente SV Agua Caliente	S	31001D	1001	\N	\N	G
321	4	13	30	SIBASI SAN VICENTE	3	10	4	163	U	10	02	U	3	UDS APASTEPEQUE	S	31004U	1002	\N	\N	G
322	4	13	29	SIBASI SAN VICENTE	3	10	2	172	D	10	01	D	6	Casa de Salud San Vicente SV Dos Quebradas	S	31002D	1001	\N	\N	G
323	4	13	29	SIBASI SAN VICENTE	3	10	5	175	U	10	04	U	3	UDS VERAPAZ	S	31005U	1004	\N	\N	G
324	4	13	31	SIBASI SAN VICENTE	3	10	6	167	U	10	11	U	3	UDS SANTO DOMINGO	S	31006U	1011	\N	\N	G
325	4	13	29	SIBASI SAN VICENTE	3	10	7	174	U	10	05	U	3	UDS TEPETITAN	S	31007U	1005	\N	\N	G
326	4	13	29	SIBASI SAN VICENTE	3	10	8	172	U	10	01	U	3	UDS PERIFERICA SAN VICENTE	S	31008U	1001	\N	\N	G
327	4	13	30	SIBASI SAN VICENTE	3	10	9	169	U	10	13	U	3	UDS SAN ILDEFONSO	S	31009U	1013	\N	\N	G
328	4	13	30	SIBASI SAN VICENTE	3	10	10	168	U	10	09	U	3	UDS SAN ESTEBAN CATARINA	S	31010U	1009	\N	\N	G
329	4	13	32	SIBASI SAN VICENTE	3	10	11	173	U	10	06	U	3	UDS SAN CARLOS LEMPA	S	31011U	1006	\N	\N	G
330	4	13	30	SIBASI SAN VICENTE	3	10	12	166	U	10	12	U	3	UDS SANTA CLARA	S	31012U	1012	\N	\N	G
331	4	13	31	SIBASI SAN VICENTE	3	10	13	170	U	10	10	U	3	UDS SAN LORENZO(SN.VICENTE)	S	31013U	1010	\N	\N	G
332	4	13	29	SIBASI SAN VICENTE	3	10	14	165	U	10	07	U	3	UDS SAN CAYETANO ISTEPEQUE	S	31014U	1007	\N	\N	G
333	4	13	32	SIBASI SAN VICENTE	3	10	15	173	U	10	06	U	3	UDS SAN NICOLAS LEMPA	S	31015U	1006	\N	\N	G
334	2	14	138	SIBASI USULUTAN	4	11	1	198	H	11	01	H	1	Hospital Nacional Usulután US  San Pedro	S	41101H	1101	\N	\N	G
335	2	14	79	SIBASI USULUTAN	4	11	1	179	N	11	08	N	7	CRN HACIENDA NUEVA	S	41101N	1108	\N	\N	G
336	2	14	79	SIBASI USULUTAN	4	11	2	185	D	11	05	D	6	Casa de Salud Jucuarán US Cantón Samuria	S	41102D	1105	\N	\N	G
337	2	14	79	SIBASI USULUTAN	4	11	2	179	N	11	08	N	7	CRN MONTEFRESCO	S	41102N	1108	\N	\N	G
338	2	14	79	SIBASI USULUTAN	4	11	3	185	D	11	05	D	6	Casa de Salud Jucuarán US Cantón El Jutal	S	41103D	1105	\N	\N	G
339	2	14	79	SIBASI USULUTAN	4	11	7	193	U	11	02	U	3	UDS SANTA ELENA	S	41107U	1102	\N	\N	G
340	2	14	79	SIBASI USULUTAN	4	11	8	185	U	11	05	U	3	UDS JUCUARAN	S	41108U	1105	\N	\N	G
341	2	14	79	SIBASI USULUTAN	4	11	9	188	U	11	07	U	3	UDS OZATLAN	S	41109U	1107	\N	\N	G
342	2	14	79	SIBASI USULUTAN	4	11	10	198	D	11	01	D	6	Casas de Salud Usulután US Cantón La Peña	S	41110D	1101	\N	\N	G
343	2	14	80	SIBASI USULUTAN	4	11	10	179	U	11	08	U	3	UDS CONCEPCION BATRES	S	41110U	1108	\N	\N	G
344	2	14	79	SIBASI USULUTAN	4	11	14	195	U	11	09	U	3	UDS SANTA MARIA	S	41114U	1109	\N	\N	G
345	2	14	79	SIBASI USULUTAN	4	11	15	198	U	11	01	U	3	UDS EL MOLINO	S	41115U	1101	\N	\N	G
346	2	14	79	SIBASI USULUTAN	4	11	26	181	U	11	06	U	3	UDS EREGUAYQUIN	S	41126U	1106	\N	\N	G
347	2	14	79	SIBASI USULUTAN	4	11	27	198	U	11	01	U	3	UDS PUERTO PARADA	S	41127U	1101	\N	\N	G
348	2	14	79	SIBASI USULUTAN	4	11	28	185	U	11	05	U	3	UDS EL ESPINO	S	41128U	1105	\N	\N	G
349	2	14	79	SIBASI USULUTAN	4	11	29	192	U	11	04	U	3	UDS SAN DIONISIO	S	41129U	1104	\N	\N	G
350	2	14	79	SIBASI USULUTAN	4	11	34	198	U	11	01	U	3	UDS LA CRUZ	S	41434U	1101	\N	\N	G
351	2	14	80	SIBASI USULUTAN	4	12	4	216	U	12	11	U	3	UDS SAN RAFAEL ORIENTE	S	41204U	1211	\N	\N	G
352	2	14	80	SIBASI USULUTAN	4	12	5	205	U	12	12	U	3	UDS EL TRANSITO	S	41205U	1212	\N	\N	G
353	2	14	80	SIBASI USULUTAN	4	12	19	213	U	12	14	U	3	UDS SAN JORGE	S	41219U	1214	\N	\N	G
354	2	14	80	SIBASI USULUTAN	4	12	28	205	U	12	12	U	3	UDS PRIMAVERA	S	41228U	1212	\N	\N	G
355	2	14	80	SIBASI SANTIAGO DE MARIA	4	11	1	177	U	11	20	U	3	UDS BERLIN	S	41101U	1120	\N	\N	G
356	2	14	79	SIBASI SANTIAGO DE MARIA	4	11	2	196	H	11	16	H	1	Hospital Nacional Santiago de María US 	S	41102H	1116	\N	\N	G
357	2	14	80	SIBASI SANTIAGO DE MARIA	4	11	4	182	D	11	12	D	6	Casa de Salud Estanzuelas US Cantón La Cruz	S	41104D	1112	\N	\N	G
358	2	14	79	SIBASI SANTIAGO DE MARIA	4	11	4	182	U	11	12	U	3	UDS ESTANZUELAS	S	41104U	1112	\N	\N	G
359	2	14	80	SIBASI SANTIAGO DE MARIA	4	11	5	187	D	11	15	D	6	Casa de Salud Nueva Granada US Azacualpía Jocomontique	S	41105D	1115	\N	\N	G
360	2	14	79	SIBASI SANTIAGO DE MARIA	4	11	6	197	D	11	18	D	6	Casa de Salud Tecapan US Cantón Chapetones	S	41106D	1118	\N	\N	G
361	2	14	79	SIBASI SANTIAGO DE MARIA	4	11	7	187	D	11	15	D	6	Casa de Salud Nueva Granada US Cantón San José	S	41107D	1115	\N	\N	G
362	2	14	79	SIBASI SANTIAGO DE MARIA	4	11	8	187	D	11	15	D	6	Casa de Salud Nueva Granada US Cantón Palomía de Gualcho	S	41108D	1115	\N	\N	G
363	2	14	79	SIBASI SANTIAGO DE MARIA	4	11	9	187	D	11	15	D	6	Casa de Salud Nueva Granada US Cantón Azacualía de Gualcho	S	41109D	1115	\N	\N	G
364	2	14	79	SIBASI SANTIAGO DE MARIA	4	11	12	176	U	11	17	U	3	UDS Alegria US	S	41112U	1117	\N	\N	G
365	2	14	79	SIBASI SANTIAGO DE MARIA	4	11	13	186	U	11	22	U	3	UDS MERCEDES UMAÑA	S	41113U	1122	\N	\N	G
366	2	14	80	SIBASI SANTIAGO DE MARIA	4	11	18	178	U	11	19	U	3	UDS CALIFORNIA	S	41118U	1119	\N	\N	G
367	2	14	79	SIBASI SANTIAGO DE MARIA	4	11	19	187	U	11	15	U	3	UDS NUEVA GRANADA	S	41119U	1115	\N	\N	G
368	2	14	79	SIBASI SANTIAGO DE MARIA	4	11	20	197	U	11	18	U	3	UDS TECAPAN	S	41120U	1118	\N	\N	G
369	2	14	79	SIBASI SANTIAGO DE MARIA	4	11	22	180	U	11	13	U	3	UDS EL TRIUNFO	S	41122U	1113	\N	\N	G
370	2	14	79	SIBASI SANTIAGO DE MARIA	4	11	23	196	U	11	16	U	3	UDS EL CERRITO	S	41123U	1116	\N	\N	G
371	2	14	80	SIBASI JIQUILISCO	4	11	1	183	D	11	03	D	6	Casa de Salud Jiquilisco US Los Esperanza	S	41101D	1103	\N	\N	G
372	2	14	80	SIBASI JIQUILISCO	4	11	3	183	H	11	03	H	1	Hospital Nacional Jiquilisco US 	S	41103H	1103	\N	\N	G
373	2	14	80	SIBASI JIQUILISCO	4	11	3	189	N	11	10	N	7	CRN ISLA MADRE SAL	S	41103N	1110	\N	\N	G
374	2	14	79	SIBASI JIQUILISCO	4	11	5	183	U	11	03	U	3	UDS TIERRA BLANCA (JIQUILISCO)	S	41105U	1103	\N	\N	G
375	2	14	79	SIBASI JIQUILISCO	4	11	6	189	U	11	10	U	3	UDS PUERTO EL TRIUNFO	S	41106U	1110	\N	\N	G
376	2	14	79	SIBASI JIQUILISCO	4	11	11	190	U	11	21	U	3	UDS SAN AGUSTIN	S	41111U	1121	\N	\N	G
377	2	14	79	SIBASI JIQUILISCO	4	11	17	194	U	11	23	U	3	UDS SAN FRANCISCO JAVIER	S	41117U	1123	\N	\N	G
378	2	14	79	SIBASI JIQUILISCO	4	11	21	183	U	11	03	U	3	UDS ISLA DE MENDEZ	S	41121U	1103	\N	\N	G
379	2	14	79	SIBASI JIQUILISCO	4	11	24	183	U	11	03	U	3	UDS EL QUEBRADO	S	41124U	1103	\N	\N	G
380	2	14	79	SIBASI JIQUILISCO	4	11	25	189	U	11	10	U	3	UDS CORRAL DE MULAS	S	41125U	1110	\N	\N	G
381	2	14	79	SIBASI JIQUILISCO	4	11	30	183	U	11	03	U	3	UDS LA CANOA	S	41130U	1103	\N	\N	G
382	2	14	79	SIBASI JIQUILISCO	4	11	31	183	U	11	03	U	3	UDS SALINAS DE SISIGUAYO	S	41131U	1103	\N	\N	G
383	2	14	79	SIBASI JIQUILISCO	4	11	32	183	U	11	03	U	3	UDS NUEVO AMANECER	S	41132U	1103	\N	\N	G
384	2	14	80	SIBASI JIQUILISCO	4	11	11	178	D	11	03	D	6	Casa de Salud California US San Hilario	S	41111D	1103	\N	\N	G
385	2	17	133	SIBASI SAN MIGUEL	4	12	1	215	H	12	01	H	1	Hospital Nacional San Miguel  SM San Juan de Dios	S	41201H	1201	13.47377	-88.190971000000005	G
386	2	17	89	SIBASI SAN MIGUEL	4	12	1	215	N	12	01	N	7	CRN MAYUCAQUIN	S	41201N	1201	\N	\N	G
387	2	17	64	SIBASI SAN MIGUEL	4	12	3	215	D	12	01	D	6	Casa de Salud San Miguel SM Los Ranchos	S	41203D	1201	\N	\N	G
388	2	17	88	SIBASI SAN MIGUEL	4	12	3	217	U	12	15	U	3	UDS SESORI	S	41203U	1215	\N	\N	G
389	2	17	89	SIBASI SAN MIGUEL	4	12	4	215	D	12	01	D	6	Casa de Salud San Miguel SM Santa Fidelia	S	41204D	1201	\N	\N	G
390	2	17	89	SIBASI SAN MIGUEL	4	12	5	215	D	12	01	D	6	Casa de Salud San Miguel SM Casa de la Misericordia	S	41205D	1201	\N	\N	G
391	2	17	89	SIBASI SAN MIGUEL	4	12	6	215	D	12	01	D	6	Casa de Salud San Miguel SM Asilo San Antonio	S	41206D	1201	\N	\N	G
392	2	17	89	SIBASI SAN MIGUEL	4	12	8	215	D	12	01	D	6	Casa de Salud San Miguel SM Los Carretos	S	41208D	1201	\N	\N	G
393	2	17	64	SIBASI SAN MIGUEL	4	12	8	215	U	12	01	U	3	UDS DR.ROBERTO A.CARIAS (LA PRESITA)	S	41208U	1201	\N	\N	G
394	2	17	89	SIBASI SAN MIGUEL	4	12	9	203	D	12	09	D	6	Casa de Salud Chinameca SM Chambala	S	41209D	1209	\N	\N	G
395	2	17	63	SIBASI SAN MIGUEL	4	12	9	204	U	12	06	U	3	UDS CHIRILAGUA	S	41209U	1206	\N	\N	G
396	2	17	90	SIBASI SAN MIGUEL	4	12	10	215	U	12	01	U	3	UDS MILAGRO DE LA PAZ	S	41210U	1201	\N	\N	G
397	2	17	89	SIBASI SAN MIGUEL	4	12	11	203	U	12	09	U	3	UDS LAS PLACITAS	S	41211U	1209	\N	\N	G
398	2	17	88	SIBASI SAN MIGUEL	4	12	12	202	U	12	05	U	3	UDS CHAPELTIQUE	S	41212U	1205	\N	\N	G
399	2	17	87	SIBASI SAN MIGUEL	4	12	14	215	U	12	01	U	3	UDS EL ZAMORAN	S	41214U	1201	\N	\N	G
400	2	17	88	SIBASI SAN MIGUEL	4	12	15	217	D	12	15	D	6	Casa de Salud Sesori SM El Tablón	S	41215D	1215	\N	\N	G
401	2	17	87	SIBASI SAN MIGUEL	4	12	15	215	U	12	01	U	3	UDS SAN CARLOS (SAN MIGUEL)	S	41215U	1201	\N	\N	G
402	2	17	63	SIBASI SAN MIGUEL	4	12	16	204	D	12	06	D	6	Casa de Salud Chilrilagua SM	S	41216D	1206	\N	\N	G
403	2	17	64	SIBASI SAN MIGUEL	4	12	16	215	U	12	01	U	3	UDS SAN ANTONIO SILVA	S	41216U	1201	\N	\N	G
404	2	17	89	SIBASI SAN MIGUEL	4	12	17	207	U	12	03	U	3	UDS EL PLATANAR	S	41217U	1203	\N	\N	G
405	2	17	89	SIBASI SAN MIGUEL	4	12	22	218	U	12	04	U	3	UDS ULUAZAPA	S	41222U	1204	\N	\N	G
406	2	17	87	SIBASI SAN MIGUEL	4	12	24	201	U	12	08	U	3	UDS COMACARAN	S	41224U	1208	\N	\N	G
407	2	17	63	SIBASI SAN MIGUEL	4	12	25	204	U	12	06	U	3	UDS EL CUCO	S	41225U	1206	\N	\N	G
408	2	17	63	SIBASI SAN MIGUEL	4	12	26	204	U	12	06	U	3	UDS SAN PEDRO CHIRILAGUA	S	41226U	1206	\N	\N	G
409	2	17	89	SIBASI SAN MIGUEL	4	12	27	210	U	12	07	U	3	UDS QUELEPA	S	41227U	1207	\N	\N	G
410	2	17	64	SIBASI SAN MIGUEL	4	12	29	215	U	12	01	U	3	UDS EL TECOMATAL	S	41229U	1201	\N	\N	G
411	2	17	89	SIBASI SAN MIGUEL	4	12	30	215	U	12	01	U	3	UDS EL NIÑO	S	41230U	1201	\N	\N	G
412	2	17	63	SIBASI SAN MIGUEL	4	12	31	204	U	12	06	U	3	UDS TIERRA BLANCA (CHIRILAGUA)	S	41231U	1206	\N	\N	G
413	2	17	89	SIBASI SAN MIGUEL	4	12	32	203	U	12	09	U	3	UDS EL JOCOTE DULCE	S	41232U	1209	\N	\N	G
414	2	17	64	SIBASI SAN MIGUEL	4	12	33	215	U	12	01	U	3	UDS MARTIN ZALDIVAR COL.CARRILLO	S	41233U	1201	\N	\N	G
415	2	17	89	SIBASI SAN MIGUEL	4	12	34	207	U	12	03	U	3	UDS TONGOLONA	S	41234U	1203	\N	\N	G
416	2	17	89	SIBASI SAN MIGUEL	4	12	35	215	U	12	01	U	3	UDS MIRAFLORES	S	41235U	1201	\N	\N	G
417	2	17	87	SIBASI SAN MIGUEL	4	14	8	261	U	14	03	U	3	UDS YUCUAIQUIN	S	41408U	1403	\N	\N	G
418	2	17	89	SIBASI SAN MIGUEL	4	14	20	260	U	14	04	U	3	UDS YAYANTIQUE	S	41420U	1404	\N	\N	G
419	2	17	87	SIBASI SAN MIGUEL	4	12	17	215	D	12	01	D	6	Casa de Salud San Miguel SM San Antonio Chávez	S	41217D	1201	\N	\N	G
420	2	17	87	SIBASI SAN MIGUEL	4	12	18	215	D	12	01	D	6	Casa de Salud San Miguel SM Concepción Corozal	S	41218D	1201	\N	\N	G
421	2	17	87	SIBASI SAN MIGUEL	4	14	12	261	D	14	03	D	6	Casa de Salud Yucuiaiquín LU Los Hatillos	S	41412D	1403	\N	\N	G
422	2	17	89	SIBASI SAN MIGUEL	4	12	37	215	U	12	01	U	3	UDS SAN MIGUEL	S	41237U	1201	\N	\N	G
423	2	17	63	SIBASI CIUDAD BARRIOS	4	12	2	200	H	12	02	H	1	Hospital Nacional Ciudad Barrios SM  Mons. Oscar Arnulfo Romero	S	41202H	1202	\N	\N	G
424	2	17	63	SIBASI CIUDAD BARRIOS	4	12	7	212	U	12	19	U	3	UDS SAN GERARDO	S	41207U	1219	\N	\N	G
425	2	17	63	SIBASI CIUDAD BARRIOS	4	12	11	212	D	12	19	D	6	Casa de Salud San Gerardo SM La Laguna San Gerardo	S	41211D	1219	\N	\N	G
426	2	17	63	SIBASI CIUDAD BARRIOS	4	12	12	212	D	12	19	D	6	Casa de Salud San Gerardo SM San Jerónimo	S	41212D	1219	\N	\N	G
427	2	17	63	SIBASI CIUDAD BARRIOS	4	12	18	214	U	12	16	U	3	UDS SAN LUIS DE LA REINA	S	41218U	1216	\N	\N	G
428	2	17	63	SIBASI CIUDAD BARRIOS	4	12	20	199	U	12	17	U	3	UDS CAROLINA	S	41220U	1217	\N	\N	G
429	2	17	63	SIBASI CIUDAD BARRIOS	4	12	23	211	U	12	20	U	3	UDS SAN ANTONIO DEL NORTE	S	41223U	1220	\N	\N	G
430	2	17	63	SIBASI CIUDAD BARRIOS	4	12	19	199	D	12	17	D	6	Casa de Salud Carolina SM La Ceibita	S	41219D	1217	\N	\N	G
431	2	17	63	SIBASI NUEVA GUADALUPE	4	11	2	184	U	11	11	U	3	UDS JUCUAPA	S	41102U	1111	\N	\N	G
432	2	17	63	SIBASI NUEVA GUADALUPE	4	11	16	191	U	11	14	U	3	UDS LAS CHARCAS (SN.BUENA.)	S	41116U	1114	\N	\N	G
433	2	17	63	SIBASI NUEVA GUADALUPE	4	11	33	191	U	11	14	U	3	UDS SAN BUENA VENTURA	S	41133U	1114	\N	\N	G
434	2	17	63	SIBASI NUEVA GUADALUPE	4	12	1	203	U	12	09	U	3	UDS CHINAMECA	S	41201U	1209	\N	\N	G
435	2	17	63	SIBASI NUEVA GUADALUPE	4	12	3	208	H	12	10	H	1	Hospital Nacional Nueva Guadalupe SM 	S	41203H	1210	13.537361000000001	-88.348763000000005	G
436	2	17	63	SIBASI NUEVA GUADALUPE	4	12	6	207	U	12	03	U	3	UDS MONCAGUA	S	41206U	1203	\N	\N	G
437	2	17	63	SIBASI NUEVA GUADALUPE	4	12	10	203	D	12	09	D	6	Casa de Salud Chinameca SM San Pedro Arenales	S	41210D	1209	\N	\N	G
438	2	17	63	SIBASI NUEVA GUADALUPE	4	12	13	203	D	12	09	D	6	Casa de Salud Chinameca SM San Antonio	S	41213D	1209	\N	\N	G
439	2	17	63	SIBASI NUEVA GUADALUPE	4	12	13	206	U	12	13	U	3	UDS LOLOTIQUE	S	41213U	1213	\N	\N	G
440	2	17	63	SIBASI NUEVA GUADALUPE	4	12	14	203	D	12	09	D	6	Casa de Salud Chinameca SM Cruz Segunda	S	41214D	1209	\N	\N	G
441	2	17	63	SIBASI NUEVA GUADALUPE	4	12	36	203	U	12	09	U	3	UDS LAS MARIAS	S	41236U	1209	\N	\N	G
442	2	20	33	SIBASI MORAZAN	4	13	1	240	D	13	22	D	6	Casa de Salud Sensembra MO El Barrial	S	41301D	1322	\N	\N	G
443	2	20	130	SIBASI MORAZAN	4	13	1	237	H	13	01	H	1	Hospital Nacional San Francisco Gotera MO 	S	41301H	1301	\N	\N	G
444	2	20	42	SIBASI MORAZAN	4	13	1	230	U	13	02	U	3	UDS JOCORO	S	41301U	1302	\N	\N	G
445	2	20	34	SIBASI MORAZAN	4	13	2	229	D	13	19	D	6	Casa de Salud Jocoaitique MO Quebrachos	S	41302D	1322	\N	\N	G
446	2	20	45	SIBASI MORAZAN	4	13	2	233	U	13	11	U	3	UDS OSICALA	S	41302U	1311	\N	\N	G
447	2	20	39	SIBASI MORAZAN	4	13	3	243	D	13	07	D	6	Casa de Salud Yamabal MO Cimientos	S	41303D	1307	\N	\N	G
448	2	20	41	SIBASI MORAZAN	4	13	3	224	U	13	10	U	3	UDS EL DIVISADERO	S	41303U	1310	\N	\N	G
449	2	20	43	SIBASI MORAZAN	4	13	4	241	D	13	06	D	6	Casa de Salud Sociedad MO El Peñon	S	41304D	1306	\N	\N	G
450	2	20	44	SIBASI MORAZAN	4	13	4	221	U	13	18	U	3	UDS CORINTO	S	41304U	1318	\N	\N	G
451	2	17	63	SIBASI CIUDAD BARRIOS	4	13	5	239	D	13	17	D	6	Casa de Salud San Simón MO El Carrizal	S	41305D	1317	\N	\N	G
452	2	20	33	SIBASI MORAZAN	4	13	5	234	U	13	24	U	3	UDS PERQUIN	S	41305U	1324	\N	\N	G
453	2	20	38	SIBASI MORAZAN	4	13	6	222	D	13	05	D	6	Casa de Salud Chilanga MO La Joya Matazano	S	41306D	1305	\N	\N	G
454	2	20	36	SIBASI MORAZAN	4	13	6	220	U	13	13	U	3	UDS CACAOPERA	S	41306U	1313	\N	\N	G
455	2	20	47	SIBASI MORAZAN	4	13	7	232	U	13	22	U	3	UDS SAN LUIS (MEANGUERA)	S	41307U	1322	\N	\N	G
456	2	20	43	SIBASI MORAZAN	4	13	8	241	U	13	06	U	3	UDS SOCIEDAD	S	41308U	1306	\N	\N	G
457	2	20	39	SIBASI MORAZAN	4	13	9	227	U	13	04	U	3	UDS GUATAJIAGUA	S	41309U	1304	\N	\N	G
458	2	20	34	SIBASI MORAZAN	4	13	10	229	U	13	19	U	3	UDS JOCOITIQUE	S	41310U	1319	\N	\N	G
459	2	20	35	SIBASI MORAZAN	4	13	11	242	U	13	26	U	3	UDS TOROLA	S	41311U	1326	\N	\N	G
460	2	20	47	SIBASI MORAZAN	4	13	12	232	U	13	22	U	3	UDS MEANGUERA	S	41312U	1322	\N	\N	G
461	2	20	35	SIBASI MORAZAN	4	13	13	236	U	13	25	U	3	UDS SAN FERNANDO (MORAZAN)	S	41313U	1325	\N	\N	G
462	2	20	36	SIBASI MORAZAN	4	13	14	228	U	13	21	U	3	UDS JOATECA	S	41314U	1321	\N	\N	G
463	2	20	46	SIBASI MORAZAN	4	13	15	239	U	13	17	U	3	UDS SAN SIMON	S	41315U	1317	\N	\N	G
464	2	20	37	SIBASI MORAZAN	4	13	16	223	U	13	15	U	3	UDS DELICIAS DE CONCEPCION	S	41316U	1315	\N	\N	G
465	2	20	38	SIBASI MORAZAN	4	13	17	222	U	13	05	U	3	UDS CHILANGA	S	41317U	1305	\N	\N	G
466	2	20	39	SIBASI MORAZAN	4	13	18	240	U	13	08	U	3	UDS SENSEMBRA (YAMABAL)	S	41318U	1308	\N	\N	G
467	2	20	46	SIBASI MORAZAN	4	13	19	238	U	13	12	U	3	UDS SAN ISIDRO (MORAZAN)	S	41319U	1312	\N	\N	G
468	2	20	41	SIBASI MORAZAN	4	13	20	235	U	13	03	U	3	UDS SAN CARLOS (MORAZAN)	S	41320U	1303	\N	\N	G
469	2	20	34	SIBASI MORAZAN	4	13	21	225	U	13	20	U	3	UDS VILLA EL ROSARIO	S	41321U	1320	\N	\N	G
470	2	20	45	SIBASI MORAZAN	4	13	22	226	U	13	16	U	3	UDS GUALOCOCTI	S	41322U	1316	\N	\N	G
471	2	20	37	SIBASI MORAZAN	4	13	23	244	U	13	14	U	3	UDS YOLOAIQUIN	S	41323U	1314	\N	\N	G
472	2	20	38	SIBASI MORAZAN	4	13	24	231	U	13	09	U	3	UDS LOLOTIQUILLO	S	41324U	1309	\N	\N	G
473	2	20	33	SIBASI MORAZAN	4	13	25	219	U	13	23	U	3	UDS ARAMBALA	S	41325U	1323	\N	\N	G
474	2	20	39	SIBASI MORAZAN	4	13	7	227	D	13	04	D	6	Casa de Salud Guatajiagua MO San Bartolo	S	41307D	1304	\N	\N	G
475	2	20	43	SIBASI MORAZAN	4	13	8	241	D	13	06	D	6	Casa de Salud Sociedad MO La Joya	S	41308D	1306	\N	\N	G
476	2	20	44	SIBASI MORAZAN	4	13	9	221	D	13	18	D	6	Casa de Salud Corinto MO Hondable	S	41309D	1318	\N	\N	G
477	2	20	38	SIBASI MORAZAN	4	13	10	222	D	13	05	D	6	Casa de Salud Chilanga MO Chaparral	S	41310D	1305	\N	\N	G
478	2	20	36	SIBASI MORAZAN	4	13	11	220	D	13	13	D	6	Casa de Salud Cacaopera MO Calavera	S	41311D	1313	\N	\N	G
479	2	20	33	SIBASI MORAZAN	4	13	12	234	D	13	24	D	6	Casa de Salud Perquin MO Rancho Quemado	S	41312D	1324	\N	\N	G
480	2	20	45	SIBASI MORAZAN	4	13	13	233	D	13	11	D	6	Casa de Salud Osicala MO Agua Zarca	S	41313D	1311	\N	\N	G
481	2	21	128	SIBASI LA UNION	4	14	1	252	H	14	01	H	1	Hospital Nacional La Unión LU 	S	41401H	1401	13.337156	-87.83963	G
482	2	21	3	SIBASI LA UNION	4	14	1	252	U	14	01	U	3	UDS ENF.ZOILA E.TURCIOS DE JIMENEZ	S	41401U	1401	\N	\N	G
483	2	21	96	SIBASI LA UNION	4	14	2	248	D	14	07	D	6	Casa de Salud Conchagua LU Las Tunas	S	41402D	1407	\N	\N	G
484	2	21	95	SIBASI LA UNION	4	14	3	248	D	14	07	D	6	Casa de Salud Conchagua LU El Cacao	S	41403D	1407	\N	\N	G
485	2	21	7	SIBASI LA UNION	4	14	3	257	U	14	02	U	3	UDS SAN ALEJO	S	41403U	1402	\N	\N	G
486	2	21	96	SIBASI LA UNION	4	14	4	252	D	14	01	D	6	Casa de Salud La Unión LU El Coyolito	S	41404D	1401	\N	\N	G
487	2	21	96	SIBASI LA UNION	4	14	5	251	U	14	08	U	3	UDS INTIPUCA	S	41405U	1408	\N	\N	G
488	2	21	95	SIBASI LA UNION	4	14	9	257	D	14	02	D	6	Casa de Salud San Alejo LU Agua Fria	S	41409D	1402	\N	\N	G
489	2	21	95	SIBASI LA UNION	4	14	9	248	U	14	07	U	3	UDS CONCHAGUA	S	41409U	1407	\N	\N	G
490	2	21	7	SIBASI LA UNION	4	14	10	257	D	14	02	D	6	Casa de Salud San Alejo LU San Jerónimo	S	41410D	1402	\N	\N	G
491	2	21	77	SIBASI LA UNION	4	14	10	262	U	14	10	U	3	UDS MEANGUERA DEL GOLFO	S	41410U	1410	\N	\N	G
492	2	21	96	SIBASI LA UNION	4	14	13	248	U	14	07	U	3	UDS EL TAMARINDO	S	41413U	1407	\N	\N	G
493	2	21	7	SIBASI LA UNION	4	14	15	249	U	14	06	U	3	UDS OLOMEGA (EL CARMEN)	S	41415U	1406	\N	\N	G
494	2	21	3	SIBASI LA UNION	4	14	17	252	U	14	01	U	3	UDS ISLA ZACATILLO	S	41417U	1401	\N	\N	G
495	2	21	77	SIBASI LA UNION	4	14	18	262	U	14	10	U	3	UDS ISLA CONCHAGUITA (MEANG.D/GOLFO)	S	41418U	1410	\N	\N	G
496	2	21	7	SIBASI LA UNION	4	14	21	249	U	14	06	U	3	UDS EL CARMEN LA UNION	S	41421U	1406	\N	\N	G
497	2	21	96	SIBASI LA UNION	4	14	23	252	U	14	01	U	3	UDS La Unión LU Agua Caliente	S	41423U	1401	\N	\N	G
498	2	21	95	SIBASI LA UNION	4	14	24	257	U	14	02	U	3	UDS HATO NUEVO (SN. ALEJO)	S	41424U	1402	\N	\N	G
499	2	21	96	SIBASI LA UNION	4	14	25	248	U	14	07	U	3	UDS LLANO LOS PATOS	S	41425U	1407	\N	\N	G
500	2	21	3	SIBASI LA UNION	4	14	26	252	U	14	01	U	3	UDS La Unión LU Agua Escondida	S	41426U	1401	\N	\N	G
501	2	21	95	SIBASI LA UNION	4	14	27	257	U	14	02	U	3	UDS BOBADILLA (SAN ALEJO)	S	41427U	1402	\N	\N	G
502	2	21	95	SIBASI LA UNION	4	14	29	248	U	14	07	U	3	UDS EL HUISQUIL (CONCHAGUA)	S	41429U	1407	\N	\N	G
503	2	21	3	SIBASI LA UNION	4	14	30	248	U	14	07	U	3	UDS EL FARO (CONCHAGUA)	S	41430U	1407	\N	\N	G
504	2	21	7	SIBASI LA UNION	4	14	31	249	U	14	06	U	3	UDS EL PICHE	S	41431U	1406	\N	\N	G
505	2	21	3	SIBASI LA UNION	4	14	32	252	U	14	01	U	3	UDS LOS LEONES-SN.CARLOS BORROMEO	S	41432U	1401	\N	\N	G
506	2	21	95	SIBASI LA UNION	4	14	2	248	N	14	07	N	7	CRN EL CIPRES	S	41402N	1407	\N	\N	G
507	2	21	3	SIBASI SANTA ROSA	4	14	1	255	D	14	12	D	6	Casa de Salud Pasaquina LU Barrancones/Piedras Blancas	S	41401D	1412	\N	\N	G
508	2	21	3	SIBASI SANTA ROSA	4	14	1	253	N	14	18	N	7	CRN EL DERRUMBADO	S	41401N	1418	\N	\N	G
509	2	21	3	SIBASI SANTA ROSA	4	14	2	259	H	14	11	H	1	Hospital Nacional Santa Rosa de Lima LU 	S	41402H	1411	13.619363999999999	-87.898949000000002	G
510	2	21	3	SIBASI SANTA ROSA	4	14	2	254	U	14	15	U	3	UDS Nueva Esparta LU Ana María Alfaro Sánchez	S	41402U	1415	\N	\N	G
511	2	21	3	SIBASI SANTA ROSA	4	14	4	255	U	14	12	U	3	UDS PASAQUINA	S	41404U	1412	\N	\N	G
512	2	21	3	SIBASI SANTA ROSA	4	14	5	250	D	14	14	D	6	Casa de Salud El Sauce LU El Rincón	S	41405D	1414	\N	\N	G
513	2	21	3	SIBASI SANTA ROSA	4	14	6	253	D	14	18	U	6	UDS EL GUAJINIQUIL (LISLIQUE)	S	41406D	1418	\N	\N	G
514	2	21	3	SIBASI SANTA ROSA	4	14	6	245	U	14	13	U	3	UDS ANAMOROS	S	41406U	1413	\N	\N	G
515	2	21	3	SIBASI SANTA ROSA	4	14	7	224	D	13	06	U	6	UDS TROMPINA/EL BEJUCAL	S	41407D	1306	\N	\N	G
516	2	21	3	SIBASI SANTA ROSA	4	14	7	250	U	14	14	U	3	UDS EL SAUCE	S	41407U	1414	\N	\N	G
517	2	21	3	SIBASI SANTA ROSA	4	14	8	254	D	14	15	D	6	Casa de Salud Nueva Esparta LU El Talpetate	S	41408D	1415	\N	\N	G
518	2	21	3	SIBASI SANTA ROSA	4	14	11	245	D	14	13	D	6	Casa de Salud Anamoros LU Agua Blanca	S	41411D	1413	\N	\N	G
519	2	21	3	SIBASI SANTA ROSA	4	14	11	247	U	14	16	U	3	UDS CONCEPCION DE ORIENTE	S	41411U	1416	\N	\N	G
520	2	21	3	SIBASI SANTA ROSA	4	14	12	253	U	14	18	U	3	UDS LISLIQUE	S	41412U	1418	\N	\N	G
521	2	21	3	SIBASI SANTA ROSA	4	14	14	254	U	14	15	U	3	UDS MONTECA	S	41414U	1415	\N	\N	G
522	2	21	3	SIBASI SANTA ROSA	4	14	16	246	U	14	05	U	3	UDS BOLIVAR	S	41416U	1405	\N	\N	G
523	2	21	3	SIBASI SANTA ROSA	4	14	19	256	U	14	17	U	3	UDS POLOROS	S	41419U	1417	\N	\N	G
524	2	21	3	SIBASI SANTA ROSA	4	14	22	258	U	14	09	U	3	UDS SAN JOSE DE LA FUENTE	S	41422U	1409	\N	\N	G
525	2	21	3	SIBASI SANTA ROSA	4	14	28	255	U	14	12	U	3	UDS SAN FELIPE (PASAQUINA)	S	41428U	1412	\N	\N	G
526	6	23	114	SIBASI NORTE	5	6	1	105	D	6	11	D	6	Casa de Salud Nejapa SS Dos de Mayo	S	50601D	0611	\N	\N	G
527	6	23	114	SIBASI NORTE	5	6	1	105	N	6	11	N	7	CRN Nepaja SS Mapilapa	S	50601N	0611	\N	\N	G
528	6	23	114	SIBASI NORTE	5	6	2	105	D	6	11	D	6	Casa de Salud Nejapa SS San Jerónimo Los Planes	S	50602D	0611	\N	\N	G
529	6	23	113	SIBASI NORTE	5	6	3	114	D	6	07	D	6	Casa de Salud Tonacatepeque SS Malacoff	S	50603D	0607	\N	\N	G
530	6	23	113	SIBASI NORTE	5	6	4	114	D	6	07	D	6	Casa de Salud Tonacatepeque SS El Tránsito	S	50604D	0607	\N	\N	G
531	6	23	115	SIBASI NORTE	5	6	5	105	D	6	11	D	6	Casa de Salud Nejapa SSTutultepeque	S	50605D	0611	\N	\N	G
532	6	23	115	SIBASI NORTE	5	6	7	124	D	7	15	D	6	Casa de Salud San José Guayabal CU Los Ramírez	S	50607D	0715	\N	\N	G
533	6	23	114	SIBASI NORTE	5	6	8	86	D	5	18	D	6	Casa de Salud Quezalteoeque LL San Antonio Segura	S	50609D	0518	\N	\N	G
534	6	23	114	SIBASI NORTE	5	6	10	101	D	6	13	D	6	Casa de Salud El Paisnal SS San Antonio Grande	S	50611D	0613	\N	\N	G
535	6	23	114	SIBASI NORTE	5	6	11	101	D	6	13	D	6	Casa de Salud El Paisnal SS San Diego	S	50611D	0613	\N	\N	G
536	6	23	114	SIBASI NORTE	5	6	12	101	D	6	13	D	6	Casa de Salud El Paisnal SS La Joya	S	50612D	0613	\N	\N	G
537	6	23	114	SIBASI NORTE	5	6	13	101	D	6	13	D	6	Casa de Salud El Paisnal SS La Cabaña	S	50614D	0613	\N	\N	G
538	6	23	114	SIBASI NORTE	5	6	14	101	D	6	13	D	6	Casa de Salud El Paisnal SS Garcitas	S	50614D	0613	\N	\N	G
539	6	23	115	SIBASI NORTE	5	6	14	98	U	6	10	U	3	UDS Apopa SS	S	50614U	0610	\N	\N	G
540	6	23	114	SIBASI NORTE	5	6	15	130	D	7	14	D	6	Casa de Salud Suchitoto CU El Tripachito	S	50608D	0714	\N	\N	G
541	6	23	114	SIBASI NORTE	5	6	17	105	U	6	11	U	3	UDS Nejapa SS	S	50617U	0611	\N	\N	G
542	6	23	115	SIBASI NORTE	5	6	18	102	U	6	08	U	3	UDS Guazapa SS	S	50618U	0608	\N	\N	G
543	6	23	114	SIBASI NORTE	5	6	19	97	U	6	14	U	3	UDS Aguilares SS	S	50619U	0614	\N	\N	G
544	6	23	113	SIBASI NORTE	5	6	20	114	U	6	07	U	3	UDS Tonacatepeque SS	S	50620U	0607	\N	\N	G
545	6	23	114	SIBASI NORTE	5	6	24	130	D	7	14	D	6	Casa de Salud Suchitoto CU Colima	S	50624D	0714	\N	\N	G
546	6	23	114	SIBASI NORTE	5	6	25	101	U	6	13	U	3	UDS El Paisnal SS	S	50625U	0613	\N	\N	G
547	6	23	113	SIBASI NORTE	5	6	30	114	U	6	07	U	3	UDS Tonacatepeque SS Distrito Italia	S	50630U	0607	\N	\N	G
548	6	23	113	SIBASI NORTE	5	6	31	98	U	6	10	U	3	UDS Apopa SS Popotlán	S	50631U	0610	\N	\N	G
549	6	23	113	SIBASI NORTE	5	6	32	98	U	6	10	U	3	UDS Apopa SS Chintuc	S	50632U	0610	\N	\N	G
550	6	24	60	SIBASI SUR	5	6	1	110	U	6	01	U	3	UDS San Salvador SS San Jacinto Dr. Mauricio Sol Nerio	S	50601U	0601	\N	\N	G
551	6	24	61	SIBASI SUR	5	6	3	106	N	6	16	N	7	CRN Panchimalco SS El Cedro	S	50603N	0616	\N	\N	G
552	6	24	116	SIBASI SUR	5	6	5	106	H	6	01	H	1	Hospital Nacional San Salvador SS Neumológico Dr. José A. Saldaña	S	50605H	0601	13.647994000000001	-89.194550000000007	G
553	6	24	60	SIBASI SUR	5	6	15	108	U	6	19	U	3	UDS San Marcos SS Dr. Roberto Cáceres B.	S	50615U	0619	\N	\N	G
554	6	24	61	SIBASI SUR	5	6	16	112	U	6	15	U	3	UDS SantoTomas SS Dr. José E. Avalos la Guardia	S	50616U	0615	\N	\N	G
555	6	24	116	SIBASI SUR	5	6	17	97	D	6	01	D	6	Casa de Salud Aguilares SS Altos de Jardines	S	50617D	0601	\N	\N	G
556	6	24	60	SIBASI SUR	5	6	18	111	D	6	17	D	6	Casa de Salud SantiagoTexacuangos SS Joya Grande	S	50618D	0617	\N	\N	G
557	6	24	61	SIBASI SUR	5	6	19	106	D	6	16	D	6	Casa de Salud Panchimalco SS Panchimalquito	S	50619D	0616	\N	\N	G
558	6	24	61	SIBASI SUR	5	6	20	107	D	6	16	D	6	Casa de Salud Rosario de Mora SS El Amayon	S	50620D	0616	\N	\N	G
559	6	24	61	SIBASI SUR	5	6	21	107	D	6	18	D	6	Casa de Salud Rosario de Mora SS Las Barrosas	S	50621D	0618	\N	\N	G
560	6	24	60	SIBASI SUR	5	6	21	111	U	6	17	U	3	UDS Santiago Texacuangos SS	S	50621U	0617	\N	\N	G
561	6	24	61	SIBASI SUR	5	6	22	107	D	6	18	D	6	Casa de Salud Rosario de Mora SS Palo Grande	S	50622D	0618	\N	\N	G
562	6	24	61	SIBASI SUR	5	6	23	107	D	6	18	D	6	Casa de Salud Rosario de Mora SS Plan del Mango	S	50623D	0618	\N	\N	G
563	6	24	61	SIBASI SUR	5	6	24	106	U	6	16	U	3	UDS Panchimalco SS	S	50624U	0616	\N	\N	G
564	6	24	61	SIBASI SUR	5	6	25	106	D	6	16	D	6	Casa de Salud Panchimalco SS San Isidro	S	50625D	0616	\N	\N	G
565	6	24	61	SIBASI SUR	5	6	26	107	U	6	18	U	3	UDS Rosario de Mora SS	S	50626U	0618	\N	\N	G
566	6	24	61	SIBASI SUR	5	6	34	106	U	6	16	U	3	UDS Panchimaco SS Planes de Renderos	S	50634U	0616	\N	\N	G
567	6	24	61	SIBASI SUR	5	6	28	112	D	6	15	D	6	Casa de Salud SantoTomas SS Intercomunal	S	50628D	0615	\N	\N	G
568	6	25	58	SIBASI SOYAPANGO	5	6	2	99	T	6	03	D	6	Casa de Salud Ayutuctepeque SS Campamento Morazán	S	50602T	0603	\N	\N	G
569	6	25	140	SIBASI SOYAPANGO	5	6	4	113	H	6	03	H	1	Hospital Nacional Soyapango SS  Dr. José Molina Martínez	S	50604H	0603	13.713767000000001	-89.137855999999999	G
570	6	25	59	SIBASI SOYAPANGO	5	6	11	113	U	6	03	U	3	UDS Soyapango SS  Enf. Zoila M. de Guadrón	S	50611U	0603	\N	\N	G
571	6	25	59	SIBASI SOYAPANGO	5	6	22	113	U	6	03	U	3	UDS Soyapango SS Amatepec	S	50622U	0603	\N	\N	G
572	6	25	58	SIBASI SOYAPANGO	5	6	28	113	U	6	03	U	3	UDS Soyapango SS Unicentro	S	50628U	0603	\N	\N	G
573	6	25	58	SIBASI ILOPANGO	5	6	2	105	N	6	09	N	7	CRN Nejapa SS Cantón las Delicias	S	50602N	0609	\N	\N	G
574	6	25	58	SIBASI ILOPANGO	5	6	4	105	N	6	09	N	7	CRN Nejapa SS Valle Las Delicias	S	50604N	0609	\N	\N	G
575	6	25	58	SIBASI ILOPANGO	5	6	7	103	H	6	12	H	1	Hospital Nacional Ilopango SS  Enf. Angélica Vidal de Najarro	S	50607H	0612	\N	\N	G
576	6	25	58	SIBASI ILOPANGO	5	6	12	103	U	6	12	U	3	UDS Ilopango SS Santa Lucía	S	50612U	0612	\N	\N	G
577	6	25	58	SIBASI ILOPANGO	5	6	13	109	U	6	09	U	3	UDS San Martín SS	S	50613U	0609	\N	\N	G
578	6	25	58	SIBASI ILOPANGO	5	6	26	109	D	6	09	D	6	Casa de Salud San Martín SS Cantón El Sauce	S	50626D	0609	\N	\N	G
579	6	25	58	SIBASI ILOPANGO	5	6	27	122	U	7	10	U	3	UDS SAN BARTOLOME PERULAPIA	S	50627U	0710	\N	\N	G
580	6	27	48	SIBASI CENTRO	5	6	1	110	O	6	01	C	8	Clinica de Empleados San Salvador SS MINSAL	S	50601O	0601	\N	\N	G
681	1	1	11	NULL	\N	\N	\N	3	NULL	1	NULL	O	\N	OP ASAPROSAR ATIQUIZAYA	NULL	NULL	NULL	\N	\N	G
581	6	27	49	SIBASI CENTRO	5	6	1	110	T	6	01	D	6	Casa de Salud San Salvador SS Coro Quiñonez	S	50601T	0601	\N	\N	G
582	6	27	49	SIBASI CENTRO	5	6	2	110	U	6	01	U	3	UDS San Salvador SS San Miguelito  Dr. Juan R. Alvarenga	S	50602U	0601	\N	\N	G
583	6	27	49	SIBASI CENTRO	5	6	3	110	T	6	01	D	6	Casa de Salud San Salvador SS Finca Serpas	S	50603T	0601	\N	\N	G
584	6	27	50	SIBASI CENTRO	5	6	3	110	U	6	01	U	3	UDS San Salvador SS Concepción	S	50603U	0601	\N	\N	G
585	6	27	49	SIBASI CENTRO	5	6	4	115	T	6	04	D	6	Casa de Salud Ciudad Delgado SS Santa Rosa Atlacatl	S	50604T	0604	\N	\N	G
586	6	27	48	SIBASI CENTRO	5	6	4	110	U	6	01	U	3	UDS San Salvador SS Barrios	S	50604U	0601	\N	\N	G
587	6	27	48	SIBASI CENTRO	5	6	5	110	T	6	01	D	6	Casa de Salud San Salvador SS Las Palmas	S	50605T	0601	\N	\N	G
588	6	27	48	SIBASI CENTRO	5	6	5	110	U	6	01	U	3	UDS San Salvador SS Monserrat	S	50605U	0601	\N	\N	G
589	6	27	118	SIBASI CENTRO	5	6	6	104	H	6	02	H	1	Hospital Nacional Mejicanos SS  (Zacamil) Dr. Juan José Fernández	S	50606H	0602	13.727942000000001	-89.207633999999999	G
590	6	27	50	SIBASI CENTRO	5	6	6	110	U	6	01	U	3	UDS San Salvador SS Loudes	S	50606U	0601	\N	\N	G
591	6	27	48	SIBASI CENTRO	5	6	7	97	T	6	01	D	6	Casa de Salud Aguilares SS Papini	N	50607T	0601	\N	\N	G
592	6	27	51	SIBASI CENTRO	5	6	7	104	U	6	06	U	3	UDS Zacamil SS	S	50607U	0606	\N	\N	G
593	6	27	48	SIBASI CENTRO	5	6	8	110	T	6	01	D	6	Casa de Salud San Salvador SS Las Lajas	N	50608T	0601	\N	\N	G
594	6	27	52	SIBASI CENTRO	5	6	8	104	U	6	02	U	3	UDS Mejicanos SS Dr. Hugo Morán Quijada	S	50608U	0602	\N	\N	G
595	6	27	48	SIBASI CENTRO	5	6	9	110	T	6	01	D	6	Casa de Salud San Salvador SS Brisas de Candelaria	S	50609T	0601	\N	\N	G
596	6	27	52	SIBASI CENTRO	5	6	9	100	U	6	05	U	3	UDS Cuscatancingo SS	S	50609U	0605	\N	\N	G
597	6	27	49	SIBASI CENTRO	5	6	10	115	U	6	04	U	3	UDS Ciudad Delgado SS	S	50610U	0604	\N	\N	G
598	6	27	49	SIBASI CENTRO	5	6	16	115	D	6	04	D	6	Casa de Salud Ciudad Delgado SS Cabañas	S	50616D	0604	\N	\N	G
599	6	27	51	SIBASI CENTRO	5	6	23	110	U	6	01	U	3	UDS San Salvador SS San Antonio Abad	S	50623U	0601	\N	\N	G
600	6	27	48	SIBASI CENTRO	5	6	27	110	D	6	01	D	6	Casa de Salud San Salvador SS El Carmen	S	50627D	0601	\N	\N	G
601	6	27	49	SIBASI CENTRO	5	6	29	115	U	6	04	U	3	UDS Ciudad Delgado SS Hábitat Confien	S	50629U	0604	\N	\N	G
602	6	27	49	SIBASI CENTRO	5	6	33	100	U	6	05	U	3	UDS Cuscatancingo SS Villa Mariona	S	50633U	0605	\N	\N	G
603	4	9	107	SIBASI SUCHITOTO	3	7	1	130	H	7	14	H	1	Hospital Nacional Suchitoto CU 	S	30701H	0714	\N	\N	G
604	4	9	107	SIBASI SUCHITOTO	3	7	2	124	U	7	15	U	3	UDS SAN JOSE GUAYABAL	S	30702U	0715	\N	\N	G
605	4	9	107	SIBASI SUCHITOTO	3	7	4	125	D	7	02	D	6	Casa de Salud San Pedro Perulapán CU Cantón Tecomatepeque	S	30704D	0702	\N	\N	G
606	4	9	107	SIBASI SUCHITOTO	3	7	10	121	U	7	16	U	3	UDS ORATORIO DE CONCEPCION	S	30710U	0716	\N	\N	G
667	4	9	107	NULL	\N	\N	\N	118	NULL	7	NULL	D	\N	Casas de Salud El Carmén CU Cantón Santa Lucía	NULL	NULL	NULL	\N	\N	G
608	2	14	80	SIBASI USULUTAN	4	11	12	205	D	12	12	D	6	Casa de Salud El Tránsito US Moropala	S	41112D	1212	\N	\N	G
609	4	13	29	SIBASI SAN VICENTE	3	10	3	172	D	10	01	D	6	Casa de Salud San Vicente SV Primavera	S	31003D	1001	\N	\N	G
610	6	25	58	SIBASI ILOPANGO	5	6	35	114	U	6	07	U	3	UDS Tonacatepeque SS Alta Vista	S	50635U	0607	\N	\N	G
611	6	27	49	SIBASI CENTRO	5	6	29	110	D	6	01	D	6	Casa de Salud San Salvador SS Niños de la Calle 2000	S	50629D	0601	\N	\N	G
612	4	9	107	SIBASI COJUTEPEQUE	3	7	13	118	D	7	07	D	6	Casa de Salud El Carmen CU Cantón San Sebastián	S	30713D	0707	\N	\N	G
613	4	12	4	SIBASI SENSUNTEPEQUE	3	9	15	161	D	9	02	D	6	Casa de Salud Victoria CA San Antonio	S	30915D	0902	\N	\N	G
614	4	10	25	SIBASI LA PAZ	3	8	13	152	D	8	01	D	6	Casa de Salud Zacatecoluca LP Escuintla	S	30813D	0801	\N	\N	G
615	4	9	110	SIBASI COJUTEPEQUE	3	7	14	125	D	7	02	D	6	Casa de Salud San Pedro Perulapán CU Cantón Miraflores	S	30714D	0702	\N	\N	G
616	4	12	4	SIBASI ILOBASCO	3	9	16	156	D	9	06	S	6	Clinica ISNA Ilobasco CA	S	30916D	0906	\N	\N	G
617	1	5	19	SIBASI SONSONATE	1	3	6	31	D	3	08	D	6	Casa de Salud Izalco SO Chorro Arriba	S	10306D	0308	\N	\N	G
618	1	5	18	SIBASI SONSONATE	1	3	7	32	D	3	14	D	6	Casa de Salud Juayua SO Buenos Aires	S	10307D	0314	\N	\N	G
619	1	5	20	SIBASI SONSONATE	1	3	8	33	D	3	02	D	6	Casa de Salud Nahuizalco SO Cusamaluco	S	10308D	0302	\N	\N	G
620	1	5	19	SIBASI SONSONATE	1	3	9	27	D	3	09	D	6	Casa de Salud Armenia SO Tres Ceibas	S	10309D	0309	\N	\N	G
621	1	5	18	SIBASI SONSONATE	1	3	10	32	D	3	14	D	6	Casa de Salud Juayua SO Los Naranjos	S	10310D	0314	\N	\N	G
622	1	5	18	SIBASI SONSONATE	1	3	11	38	D	3	15	D	6	Casa de Salud Santa Catarina Masahuat SO El Matazano	S	10311D	0315	\N	\N	G
623	5	8	21	SIBASI LA LIBERTAD	2	5	26	89	D	5	17	D	6	Casa de Salud San Juan Opico LL Villa Tzu-Chi I	S	20526D	0517	\N	\N	G
624	6	24	60	SIBASI SUR	5	6	30	110	D	6	01	D	6	Casa de Salud San Salvador SS Hogar del Niño San Vicente de Paul	S	50630D	0601	\N	\N	G
625	6	24	60	SIBASI SUR	5	6	31	110	D	6	01	D	6	Casa de Salud San Salvador SS Cipi	S	50631D	0601	\N	\N	G
626	4	13	29	SIBASI SAN VICENTE	3	10	21	172	I	10	01	P	8	Unidad Medica ISSS San Vicente SV	S	31021I	1001	\N	\N	G
627	1	2	13	SIBASI METAPAN	\N	\N	\N	19	NULL	2	NULL	U	\N	UDS METAPAN	NULL	NULL	NULL	\N	\N	G
628	2	21	3	NULL	\N	\N	\N	254	NULL	14	NULL	D	\N	Casa de Salud Nueva Esparta LU Las Marías	NULL	NULL	NULL	\N	\N	G
630	2	21	3	NULL	\N	\N	\N	253	NULL	14	NULL	O	\N	ONG FUSAL LISLIQUE	NULL	NULL	NULL	\N	\N	G
631	2	21	3	NULL	\N	\N	\N	252	NULL	14	NULL	D	\N	Casa de Salud La Unión LU El Jícaro	NULL	NULL	NULL	\N	\N	G
632	2	21	3	NULL	\N	\N	\N	252	NULL	14	NULL	D	\N	Casa de Salud La Unión LU Pueblo Viejo	NULL	NULL	NULL	\N	\N	G
633	5	8	22	NULL	\N	\N	\N	77	NULL	5	NULL	A	\N	CAE La Libertad LL	NULL	NULL	NULL	\N	\N	G
634	1	5	20	NULL	\N	\N	\N	40	NULL	3	NULL	U	\N	UDS SONSONATE	NULL	NULL	NULL	\N	\N	G
732	1	2	13	NULL	\N	\N	\N	18	NULL	2	NULL	O	\N	ONG ASAPROSAR MASAHUAT	NULL	NULL	NULL	\N	\N	G
730	5	8	24	NULL	\N	\N	\N	94	NULL	5	NULL	U	\N	UDS TEOTEPEQUE	NULL	NULL	NULL	\N	\N	G
740	4	12	5	NULL	\N	\N	\N	160	NULL	9	NULL	O	\N	ONG FUSAL TEJUTEPEQUE	NULL	NULL	NULL	\N	\N	G
737	2	17	88	NULL	\N	\N	\N	227	NULL	13	NULL	O	\N	ONG FUSAL GUATAJIAGUA - CHAPELTIQUE	NULL	NULL	NULL	\N	\N	G
743	2	14	79	NULL	\N	\N	\N	189	NULL	11	NULL	U	\N	UDS ESPIRITU SANTO	NULL	NULL	NULL	\N	\N	G
738	2	17	63	NULL	\N	\N	\N	227	NULL	13	NULL	O	\N	ONG FUSAL GUATAJIAGUA (C.BARRIOS)	NULL	NULL	NULL	\N	\N	G
739	4	12	6	NULL	\N	\N	\N	154	NULL	9	NULL	O	\N	ONG FUSAL CINQUERA	NULL	NULL	NULL	\N	\N	G
742	4	12	6	NULL	\N	\N	\N	157	NULL	9	NULL	O	\N	ONG FUSAL CAROLINA - JUTIAPA	NULL	NULL	NULL	\N	\N	G
635	4	10	27	NULL	\N	\N	\N	136	NULL	8	NULL	D	\N	Casa de Salud Olocuilta LP Montilimar	NULL	NULL	NULL	\N	\N	G
636	2	17	63	NULL	\N	\N	\N	204	NULL	12	NULL	D	\N	Casa de Salud Chirilagua SM Llano Las Rosas	NULL	NULL	NULL	\N	\N	G
637	2	17	63	NULL	\N	\N	\N	185	NULL	11	NULL	D	\N	Casa de Salud Jucuarán US Majague	NULL	NULL	NULL	\N	\N	G
638	2	17	63	NULL	\N	\N	\N	204	NULL	12	NULL	D	\N	Casa de Salud Chirilagua SM Guadalupe	NULL	NULL	NULL	\N	\N	G
639	2	20	36	NULL	\N	\N	\N	220	NULL	13	NULL	O	\N	ONG AMS CACAOPERA	NULL	NULL	NULL	\N	\N	G
640	2	20	37	NULL	\N	\N	\N	223	NULL	13	NULL	O	\N	ONG AMS DELICIAS DE CONCEPCION	NULL	NULL	NULL	\N	\N	G
641	2	17	63	NULL	\N	\N	\N	239	NULL	13	NULL	O	\N	ONG AMS SAN SIMON CIUDAD BARRIOS	NULL	NULL	NULL	\N	\N	G
642	2	20	35	NULL	\N	\N	\N	242	NULL	13	NULL	O	\N	ONG CALMA TOROLA	NULL	NULL	NULL	\N	\N	G
643	2	20	35	NULL	\N	\N	\N	236	NULL	13	NULL	O	\N	ONG CALMA SAN FERNANDO (MOR)	NULL	NULL	NULL	\N	\N	G
644	2	20	34	NULL	\N	\N	\N	229	NULL	13	NULL	O	\N	ONG CALMA JOCOAITIQUE	NULL	NULL	NULL	\N	\N	G
645	2	20	39	NULL	\N	\N	\N	227	NULL	13	NULL	O	\N	ONG FUSAL GUATAJIAGUA (MORAZAN)	NULL	NULL	NULL	\N	\N	G
646	2	20	39	NULL	\N	\N	\N	240	NULL	13	NULL	O	\N	ONG FUSAL SENSEMBRA	NULL	NULL	NULL	\N	\N	G
647	2	20	39	NULL	\N	\N	\N	243	NULL	13	NULL	O	\N	ONG FUSAL YAMABAL	NULL	NULL	NULL	\N	\N	G
648	2	20	46	NULL	\N	\N	\N	238	NULL	13	NULL	O	\N	ONG FUSAL SAN ISIDRO	NULL	NULL	NULL	\N	\N	G
649	2	20	45	NULL	\N	\N	\N	226	NULL	13	NULL	O	\N	ONG FUSAL GUALOCOCTI	NULL	NULL	NULL	\N	\N	G
650	2	20	36	NULL	\N	\N	\N	228	NULL	13	NULL	O	\N	ONG FUSAL JOATECA	NULL	NULL	NULL	\N	\N	G
651	2	17	63	NULL	\N	\N	\N	260	NULL	14	NULL	O	\N	ONG FUNDEMUN YAYANTIQUE	NULL	NULL	NULL	\N	\N	G
652	2	17	64	NULL	\N	\N	\N	215	NULL	12	NULL	O	\N	ONG FUSAL SAN ANTONIO SILVA	NULL	NULL	NULL	\N	\N	G
653	2	17	63	NULL	\N	\N	\N	211	NULL	12	NULL	O	\N	ONG FUSAL SAN ANTONIO DEL NORTE	NULL	NULL	NULL	\N	\N	G
654	2	17	63	NULL	\N	\N	\N	199	NULL	12	NULL	O	\N	ONG FUSAL CAROLINA	NULL	NULL	NULL	\N	\N	G
655	2	20	46	NULL	\N	\N	\N	239	NULL	13	NULL	O	\N	ONG AMS SAN SIMON	NULL	NULL	NULL	\N	\N	G
656	5	6	119	NULL	\N	\N	\N	45	NULL	4	NULL	O	\N	ONG FUSAL CITALA	NULL	NULL	NULL	\N	\N	G
657	5	6	119	NULL	\N	\N	\N	53	NULL	4	NULL	O	\N	ONG FUSAL LA PALMA	NULL	NULL	NULL	\N	\N	G
658	5	6	119	NULL	\N	\N	\N	66	NULL	4	NULL	O	\N	ONG FUNDEMUN SAN IGNACIO	NULL	NULL	NULL	\N	\N	G
659	5	6	119	NULL	\N	\N	\N	66	NULL	4	NULL	O	\N	ONG FUNDEMUN LAS PILAS	NULL	NULL	NULL	\N	\N	G
660	5	6	119	NULL	\N	\N	\N	54	NULL	4	NULL	O	\N	ONG FUNDEMUN LA REINA	NULL	NULL	NULL	\N	\N	G
661	1	2	13	NULL	\N	\N	\N	19	NULL	2	NULL	D	\N	Casa de Salud Metapán SA La Joya	NULL	NULL	NULL	\N	\N	G
662	1	2	13	NULL	\N	\N	\N	19	NULL	2	NULL	D	\N	Casa de Salud Metapán SA San Miguel Ingenio	NULL	NULL	NULL	\N	\N	G
663	5	6	119	NULL	\N	\N	\N	57	NULL	4	NULL	U	\N	UDS NUEVA CONCEPCION	NULL	NULL	NULL	\N	\N	G
736	1	2	15	NULL	\N	\N	\N	18	NULL	2	NULL	O	\N	ONG ASAPROSAR MASHUAT- GUARNECIA	NULL	NULL	NULL	\N	\N	G
664	5	6	70	NULL	\N	\N	\N	48	NULL	4	NULL	U	\N	UDS CHALATENANGO	NULL	NULL	NULL	\N	\N	G
741	4	12	6	NULL	\N	\N	\N	157	NULL	9	NULL	O	\N	ONG FUSAL JUTIAPA	NULL	NULL	NULL	\N	\N	G
733	1	2	13	NULL	\N	\N	\N	23	NULL	2	NULL	O	\N	ONG ASAPROSAR SANTA ROSA GUACHIPILIN	NULL	NULL	NULL	\N	\N	G
665	2	21	3	NULL	\N	\N	\N	256	NULL	14	NULL	D	\N	Casa de Salud Poloros LU Boquín	NULL	NULL	NULL	\N	\N	G
735	1	2	17	NULL	\N	\N	\N	24	NULL	2	NULL	O	\N	ONG ASAPROSAR SANTIAGO LA FRONTERA	NULL	NULL	NULL	\N	\N	G
731	5	6	74	NULL	\N	\N	\N	63	NULL	4	NULL	O	\N	ONG CALMA SAN FERNANDO (CHA)	NULL	NULL	NULL	\N	\N	G
734	2	21	3	NULL	\N	\N	\N	258	NULL	14	NULL	O	\N	ONG FUNDEMUN SAN JOSE LA FUENTE	NULL	NULL	NULL	\N	\N	G
666	1	5	19	NULL	\N	\N	\N	37	NULL	3	NULL	D	\N	Casa de Salud San Julián SO Centro Materno San Julián	NULL	NULL	NULL	\N	\N	G
668	4	9	110	NULL	\N	\N	\N	125	NULL	7	NULL	D	\N	Casa de Salud San Pedro Perulapán CU San Agustín	NULL	NULL	NULL	\N	\N	G
669	5	6	73	NULL	\N	\N	\N	43	NULL	4	NULL	O	\N	ONG CIRES ARCATAO	NULL	NULL	NULL	\N	\N	G
670	5	6	73	NULL	\N	\N	\N	58	NULL	4	NULL	O	\N	ONG CIRES NUEVA TRINIDAD	NULL	NULL	NULL	\N	\N	G
671	5	6	73	NULL	\N	\N	\N	69	NULL	4	NULL	O	\N	ONG CIRES SAN JOSE LAS FLORES	NULL	NULL	NULL	\N	\N	G
672	1	1	10	NULL	\N	\N	\N	11	NULL	1	NULL	O	\N	OP CALMA TACUBA	NULL	NULL	NULL	\N	\N	G
673	1	1	12	NULL	\N	\N	\N	7	NULL	1	NULL	O	\N	OP CALMA JUJUTLA	NULL	NULL	NULL	\N	\N	G
674	1	1	12	NULL	\N	\N	\N	6	NULL	1	NULL	O	\N	OP CALMA GUAYMANGO	NULL	NULL	NULL	\N	\N	G
675	1	1	10	NULL	\N	\N	\N	4	NULL	1	NULL	O	\N	OP CALMA CONCEPCION DE ATACO	NULL	NULL	NULL	\N	\N	G
676	1	1	12	NULL	\N	\N	\N	10	NULL	1	NULL	O	\N	OP CALMA SAN PEDRO PUXTLA	NULL	NULL	NULL	\N	\N	G
677	1	1	10	NULL	\N	\N	\N	1	NULL	1	NULL	O	\N	OP ASAPROSAR AHUACHAPAN	NULL	NULL	NULL	\N	\N	G
678	1	1	11	NULL	\N	\N	\N	12	NULL	1	NULL	O	\N	OP ASAPROSAR TURIN	NULL	NULL	NULL	\N	\N	G
679	1	1	1	NULL	\N	\N	\N	8	NULL	1	NULL	O	\N	OP CALMA SAN FRANC. MEN.(HACHADURA)	NULL	NULL	NULL	\N	\N	G
680	1	1	10	NULL	\N	\N	\N	1	NULL	1	NULL	O	\N	OP ASAPROSAR AH LAS CHINAMA	NULL	NULL	NULL	\N	\N	G
682	1	1	11	NULL	\N	\N	\N	9	NULL	1	NULL	O	\N	OP ASAPROSAR SAN LORENZO	NULL	NULL	NULL	\N	\N	G
683	1	1	12	NULL	\N	\N	\N	8	NULL	1	NULL	O	\N	OP SERAPHIN SN.FRCO.MENEND.CARA S	NULL	NULL	NULL	\N	\N	G
684	1	1	11	NULL	\N	\N	\N	5	NULL	1	NULL	O	\N	OP SERAPHIN EL REFUGIO	NULL	NULL	NULL	\N	\N	G
685	1	1	12	NULL	\N	\N	\N	7	NULL	1	NULL	O	\N	OP SERAPHIN JUJUTLA BARRA DE SANT.	NULL	NULL	NULL	\N	\N	G
686	1	1	12	NULL	\N	\N	\N	7	NULL	1	NULL	O	\N	OP SERAPHIN JUJUTLA GUAYAPA ABAJO	NULL	NULL	NULL	\N	\N	G
687	1	1	11	NULL	\N	\N	\N	3	NULL	1	NULL	O	\N	OP SERAPHIN ATIQUIZAYA	NULL	NULL	NULL	\N	\N	G
688	1	1	12	NULL	\N	\N	\N	7	NULL	1	NULL	O	\N	OP SERAPHIN JUJUTLA	NULL	NULL	NULL	\N	\N	G
689	1	1	1	NULL	\N	\N	\N	8	NULL	1	NULL	O	\N	OP SERAPHIN SN.FRCO.MENENDEZ HACHAD	NULL	NULL	NULL	\N	\N	G
690	1	1	12	NULL	\N	\N	\N	7	NULL	1	NULL	O	\N	OP CALMA JUJUTLA GUAYAPA ABAJO	NULL	NULL	NULL	\N	\N	G
691	1	1	12	NULL	\N	\N	\N	7	NULL	1	NULL	O	\N	OP CALMA JUJUTLA SN.JOSE EL NARAJ	NULL	NULL	NULL	\N	\N	G
692	1	1	12	NULL	\N	\N	\N	7	NULL	1	NULL	O	\N	OP ASAPROSAR JUJUTLA GUAYAPA ABAJ	NULL	NULL	NULL	\N	\N	G
693	1	1	12	NULL	\N	\N	\N	7	NULL	1	NULL	O	\N	OP ASAPROSAR JUJUTLA SN. JOSE EL NAR	NULL	NULL	NULL	\N	\N	G
694	1	5	18	NULL	\N	\N	\N	33	NULL	3	NULL	O	\N	OP FUSAL NAHUIZALCO	NULL	NULL	NULL	\N	\N	G
695	1	5	18	NULL	\N	\N	\N	32	NULL	3	NULL	O	\N	OP FUSAL JUAYUA	NULL	NULL	NULL	\N	\N	G
696	1	5	18	NULL	\N	\N	\N	33	NULL	3	NULL	O	\N	OP SERAPHIN NAHUIZALCO	NULL	NULL	NULL	\N	\N	G
697	1	5	18	NULL	\N	\N	\N	32	NULL	3	NULL	O	\N	OP SERAPHIN JUAYUA	NULL	NULL	NULL	\N	\N	G
698	1	5	20	NULL	\N	\N	\N	36	NULL	3	NULL	O	\N	OP CALMA SAN ANTONIO DEL MONTE	NULL	NULL	NULL	\N	\N	G
699	1	5	18	NULL	\N	\N	\N	33	NULL	3	NULL	O	\N	OP CALMA NAHUIZALCO	NULL	NULL	NULL	\N	\N	G
700	1	5	20	NULL	\N	\N	\N	39	NULL	3	NULL	O	\N	OP CALMA SANTO DOMINGO DE GUZMAN	NULL	NULL	NULL	\N	\N	G
701	1	5	18	NULL	\N	\N	\N	38	NULL	3	NULL	O	\N	OP CALMA SANTA CATARINA MASAHUAT	NULL	NULL	NULL	\N	\N	G
702	1	5	20	NULL	\N	\N	\N	26	NULL	3	NULL	O	\N	OP ASAPROSAR ACAJUTLA	NULL	NULL	NULL	\N	\N	G
703	1	5	20	NULL	\N	\N	\N	40	NULL	3	NULL	O	\N	OP SERAPHIN SONSONATE	NULL	NULL	NULL	\N	\N	G
704	1	5	19	NULL	\N	\N	\N	31	NULL	3	NULL	O	\N	OP SERAPHIN IZALCO	NULL	NULL	NULL	\N	\N	G
705	1	5	20	NULL	\N	\N	\N	36	NULL	3	NULL	O	\N	OP SERAPHIN SAN ANTONIO DEL MONTE	NULL	NULL	NULL	\N	\N	G
706	1	5	20	NULL	\N	\N	\N	34	NULL	3	NULL	O	\N	OP SERAPHIN NAHUILINGO	NULL	NULL	NULL	\N	\N	G
707	1	5	19	NULL	\N	\N	\N	31	NULL	3	NULL	O	\N	OP FUSAL IZALCO	NULL	NULL	NULL	\N	\N	G
708	1	5	20	NULL	\N	\N	\N	40	NULL	3	NULL	O	\N	OP SERAPHIN SONSONATE (SALINAS AYAC	NULL	NULL	NULL	\N	\N	G
709	1	5	19	NULL	\N	\N	\N	30	NULL	3	NULL	O	\N	OP SERAPHIN SANTA ISABEL ISHUATAN	NULL	NULL	NULL	\N	\N	G
710	1	5	19	NULL	\N	\N	\N	29	NULL	3	NULL	O	\N	OP SERAPHIN CUISNAHUAT	NULL	NULL	NULL	\N	\N	G
711	1	5	19	NULL	\N	\N	\N	37	NULL	3	NULL	O	\N	OP SERAPHIN SAN JULIAN	NULL	NULL	NULL	\N	\N	G
712	1	5	19	NULL	\N	\N	\N	28	NULL	3	NULL	O	\N	OP SERAPHIN CALUCO	NULL	NULL	NULL	\N	\N	G
713	1	5	20	NULL	\N	\N	\N	40	NULL	3	NULL	O	\N	OP CALMA SONSONATE	NULL	NULL	NULL	\N	\N	G
714	5	6	74	NULL	\N	\N	\N	72	NULL	4	NULL	O	\N	ONG CALMA SAN RAFAEL	NULL	NULL	NULL	\N	\N	G
715	5	6	71	NULL	\N	\N	\N	66	NULL	4	NULL	O	\N	ONG CALMA SANTA RITA	NULL	NULL	NULL	\N	\N	G
716	5	6	74	NULL	\N	\N	\N	49	NULL	4	NULL	O	\N	ONG CALMA DULCE NOMBRE DE MARIA	NULL	NULL	NULL	\N	\N	G
717	5	6	74	NULL	\N	\N	\N	65	NULL	4	NULL	O	\N	ONG CALMA SAN FRANCISCO MORAZAN	NULL	NULL	NULL	\N	\N	G
718	5	6	71	NULL	\N	\N	\N	59	NULL	4	NULL	O	\N	ONG FUNDEMUN OJOS DE AGUA	NULL	NULL	NULL	\N	\N	G
719	5	6	71	NULL	\N	\N	\N	55	NULL	4	NULL	O	\N	ONG FUNDEMUN LAS VUELTAS	NULL	NULL	NULL	\N	\N	G
720	5	6	70	NULL	\N	\N	\N	62	NULL	4	NULL	O	\N	ONG FUNDEMUN SAN ANTONIO LOS RANCH	NULL	NULL	NULL	\N	\N	G
721	5	6	71	NULL	\N	\N	\N	52	NULL	4	NULL	O	\N	ONG FUNDEMUN LA LAGUNA	NULL	NULL	NULL	\N	\N	G
722	5	6	71	NULL	\N	\N	\N	46	NULL	4	NULL	O	\N	ONG FUNDEMUN COMALAPA	NULL	NULL	NULL	\N	\N	G
723	5	6	70	NULL	\N	\N	\N	71	NULL	4	NULL	O	\N	ONG FUNDEMUN SAN MIGUEL DE MERCEDE	NULL	NULL	NULL	\N	\N	G
724	5	6	72	NULL	\N	\N	\N	56	NULL	4	NULL	O	\N	ONG CALMA NOMBRE DE JESUS	NULL	NULL	NULL	\N	\N	G
725	5	6	72	NULL	\N	\N	\N	61	NULL	4	NULL	O	\N	ONG CALMA SAN ANTONIO LA CRUZ	NULL	NULL	NULL	\N	\N	G
726	5	6	71	NULL	\N	\N	\N	50	NULL	4	NULL	O	\N	ONG FUNDEMUN EL CARRIZAL	NULL	NULL	NULL	\N	\N	G
727	5	6	72	NULL	\N	\N	\N	42	NULL	4	NULL	O	\N	ONG CALMA SAN ISIDRO LABRADOR	NULL	NULL	NULL	\N	\N	G
728	5	6	75	NULL	\N	\N	\N	60	NULL	4	NULL	O	\N	ONG CALMA POTONICO	NULL	NULL	NULL	\N	\N	G
729	5	6	72	NULL	\N	\N	\N	68	NULL	4	NULL	O	\N	ONG CALMA SAN JOSE CANCASQUE	NULL	NULL	NULL	\N	\N	G
744	4	10	25	NULL	\N	\N	\N	150	NULL	8	NULL	O	\N	ONG CIDECO NUESTRA SEÑORA DE LOURDES	NULL	NULL	NULL	\N	\N	G
745	4	10	25	NULL	\N	\N	\N	147	NULL	8	NULL	V	\N	Clinica Privada San Pedro Nonualco LP Inmaculada Concepción	NULL	NULL	NULL	\N	\N	G
746	1	2	136	NULL	\N	\N	\N	22	NULL	2	NULL	I	\N	Hospital Regional ISSS Santa Ana SA	NULL	NULL	NULL	\N	\N	G
747	1	5	142	NULL	\N	\N	\N	40	NULL	3	NULL	I	\N	Hospital Regional ISSS Sonsonate SO	NULL	NULL	NULL	\N	\N	G
748	2	17	133	NULL	\N	\N	\N	215	NULL	12	NULL	I	\N	Hospital Regional ISSS San Miguel SM	NULL	NULL	NULL	\N	\N	G
749	6	27	118	NULL	\N	\N	\N	110	NULL	6	NULL	I	\N	Hospital ISSS  San Salvador SS 1º de Mayo	NULL	NULL	NULL	\N	\N	G
750	6	24	116	NULL	\N	\N	\N	110	NULL	6	NULL	I	\N	Hospital Policlinico ISSS San Salvador SS Planes de Renderos	NULL	NULL	NULL	\N	\N	G
751	6	27	118	NULL	\N	\N	\N	110	NULL	6	NULL	I	\N	Hospital ISSS San Salvador SS Médico Quirúrgico y Oncología	NULL	NULL	NULL	\N	\N	G
752	6	25	140	NULL	\N	\N	\N	113	NULL	6	NULL	I	\N	Hospital ISSS  Soyapango SS	NULL	NULL	NULL	\N	\N	G
753	6	27	118	NULL	\N	\N	\N	110	NULL	6	NULL	I	\N	Hospital Policlinico ISSS San Salvador SS Roma	NULL	NULL	NULL	\N	\N	G
754	6	27	118	NULL	\N	\N	\N	110	NULL	6	NULL	I	\N	Hospital ISSS San Salvador SS General	NULL	NULL	NULL	\N	\N	G
755	6	27	118	NULL	\N	\N	\N	110	NULL	6	NULL	I	\N	Hospital ISSS San Salvador SS Oncológico	NULL	NULL	NULL	\N	\N	G
756	2	21	3	NULL	\N	\N	\N	259	NULL	14	NULL	U	\N	UDS PERIFERICA SANTA ROSA DE LIMA	NULL	NULL	NULL	\N	\N	G
757	5	8	21	NULL	\N	\N	\N	85	NULL	5	NULL	O	\N	ONG INTERVIDA (LA LIBERTAD)	NULL	NULL	NULL	\N	\N	G
758	6	23	113	NULL	\N	\N	\N	98	NULL	6	NULL	A	\N	CAE Apopa SS	NULL	NULL	NULL	\N	\N	G
759	2	20	33	NULL	\N	\N	\N	238	NULL	13	NULL	O	\N	ONG AMS SAN ISIDRO	NULL	NULL	NULL	\N	\N	G
760	2	20	33	NULL	\N	\N	\N	226	NULL	13	NULL	O	\N	ONG AMS GUALOCOCTI	NULL	NULL	NULL	\N	\N	G
761	2	20	33	NULL	\N	\N	\N	222	NULL	13	NULL	O	\N	ONG AMS CHILANGA	NULL	NULL	NULL	\N	\N	G
762	2	20	33	NULL	\N	\N	\N	221	NULL	13	NULL	O	\N	ONG AMS CORINTO	NULL	NULL	NULL	\N	\N	G
763	2	20	33	NULL	\N	\N	\N	231	NULL	13	NULL	O	\N	ONG AMS LOLOTIQUILLO	NULL	NULL	NULL	\N	\N	G
764	4	12	4	NULL	\N	\N	\N	161	NULL	9	NULL	O	\N	ONG FUSAL SANTA MARTA	NULL	NULL	NULL	\N	\N	G
765	4	12	4	NULL	\N	\N	\N	162	NULL	9	NULL	O	\N	ONG FUSAL DOLORES	NULL	NULL	NULL	\N	\N	G
766	4	12	4	NULL	\N	\N	\N	209	NULL	12	NULL	O	\N	ONG FUSAL NUEVO EDEN	NULL	NULL	NULL	\N	\N	G
767	2	20	33	NULL	\N	\N	\N	227	NULL	13	NULL	O	\N	ONG CALMA GUATAJIAGUA	NULL	NULL	NULL	\N	\N	G
768	2	20	33	NULL	\N	\N	\N	240	NULL	13	NULL	O	\N	ONG CALMA SEMSENBRA	NULL	NULL	NULL	\N	\N	G
769	2	20	33	NULL	\N	\N	\N	243	NULL	13	NULL	O	\N	ONG CALMA YAMABAL	NULL	NULL	NULL	\N	\N	G
770	2	20	33	NULL	\N	\N	\N	219	NULL	13	NULL	O	\N	ONG CALMA ARAMBALA	NULL	NULL	NULL	\N	\N	G
771	2	20	33	NULL	\N	\N	\N	228	NULL	13	NULL	O	\N	ONG CALMA JOATECA	NULL	NULL	NULL	\N	\N	G
772	2	20	33	NULL	\N	\N	\N	225	NULL	13	NULL	O	\N	ONG CALMA VILLA EL ROSARIO	NULL	NULL	NULL	\N	\N	G
773	2	21	3	NULL	\N	\N	\N	253	NULL	14	NULL	O	\N	ONG FUNDEMUN LISLIQUE	NULL	NULL	NULL	\N	\N	G
774	5	6	73	NULL	\N	\N	\N	43	NULL	4	NULL	O	\N	ONG CALMA ARCATAO	NULL	NULL	NULL	\N	\N	G
775	5	6	73	NULL	\N	\N	\N	58	NULL	4	NULL	O	\N	ONG CALMA NUEVA TRINIDAD	NULL	NULL	NULL	\N	\N	G
776	5	6	73	NULL	\N	\N	\N	69	NULL	4	NULL	O	\N	ONG CALMA SAN JOSE LAS FLORES	NULL	NULL	NULL	\N	\N	G
777	5	6	70	NULL	\N	\N	\N	62	NULL	4	NULL	O	\N	ONG CALMA SAN ANTONIO LOS RANCHOS	NULL	NULL	NULL	\N	\N	G
778	2	17	63	NULL	\N	\N	\N	217	NULL	12	NULL	O	\N	ONG ASAPROSAR SESORI	NULL	NULL	NULL	\N	\N	G
779	2	17	63	NULL	\N	\N	\N	200	NULL	12	NULL	O	\N	ONG ASAPROSAR CIUDAD BARRIOS	NULL	NULL	NULL	\N	\N	G
780	5	6	70	NULL	\N	\N	\N	71	NULL	4	NULL	O	\N	ONG CALMA SAN MIGUEL DE MERCEDES	NULL	NULL	NULL	\N	\N	G
781	5	6	70	NULL	\N	\N	\N	55	NULL	4	NULL	O	\N	ONG CALMA LAS VUELTAS	NULL	NULL	NULL	\N	\N	G
782	5	6	71	NULL	\N	\N	\N	59	NULL	4	NULL	O	\N	ONG CALMA SAN JOSE OJOS DE AGUA	NULL	NULL	NULL	\N	\N	G
783	5	6	71	NULL	\N	\N	\N	50	NULL	4	NULL	O	\N	ONG CALMA EL CARRIZAL	NULL	NULL	NULL	\N	\N	G
784	5	6	71	NULL	\N	\N	\N	52	NULL	4	NULL	O	\N	ONG CALMA LA LAGUNA	NULL	NULL	NULL	\N	\N	G
785	5	6	71	NULL	\N	\N	\N	46	NULL	4	NULL	O	\N	ONG CALMA COMALAPA	NULL	NULL	NULL	\N	\N	G
786	5	6	71	NULL	\N	\N	\N	50	NULL	4	NULL	O	\N	ONG CALMA VAINILLAS	NULL	NULL	NULL	\N	\N	G
787	2	17	89	NULL	\N	\N	\N	260	NULL	14	NULL	O	\N	ONG FUNDEMUN YAYANTIQUE-SN.ANTONIO SILVA	NULL	NULL	NULL	\N	\N	G
788	2	17	63	NULL	\N	\N	\N	212	NULL	12	NULL	O	\N	ONG FUSAL SAN GERARDO	NULL	NULL	NULL	\N	\N	G
789	2	17	89	NULL	\N	\N	\N	239	NULL	13	NULL	O	\N	ONG FUSA SAN SIMON	NULL	NULL	NULL	\N	\N	G
790	2	17	63	NULL	\N	\N	\N	227	NULL	13	NULL	O	\N	ONG ASAPROSAR GUATAJIAGUA-CIUDAD BARRIOS	NULL	NULL	NULL	\N	\N	G
791	5	6	119	NULL	\N	\N	\N	45	NULL	4	NULL	O	\N	ONG SERAPHIM CITALA	NULL	NULL	NULL	\N	\N	G
792	5	6	119	NULL	\N	\N	\N	53	NULL	4	NULL	O	\N	ONG SERAPHIM LA PALMA	NULL	NULL	NULL	\N	\N	G
793	5	6	119	NULL	\N	\N	\N	66	NULL	4	NULL	O	\N	ONG SERAPHIM SAN IGNACIO	NULL	NULL	NULL	\N	\N	G
794	5	6	119	NULL	\N	\N	\N	54	NULL	4	NULL	O	\N	ONG SERAPHIM LA REINA	NULL	NULL	NULL	\N	\N	G
795	5	6	119	NULL	\N	\N	\N	66	NULL	4	NULL	O	\N	ONG SERAPHIM LAS PILAS	NULL	NULL	NULL	\N	\N	G
796	6	23	114	NULL	\N	\N	\N	114	NULL	6	NULL	Z	\N	Centro Penal Apopa SS Readactación de Menores	NULL	NULL	NULL	\N	\N	G
797	6	27	118	NULL	\N	\N	\N	110	NULL	6	NULL	M	\N	Hospital Militar San Salvador SS	NULL	NULL	NULL	\N	\N	G
798	4	10	25	NULL	\N	\N	\N	152	NULL	8	NULL	P	\N	Unidad Medica ISSS Zacatecoluca LP	NULL	NULL	NULL	\N	\N	G
799	2	17	63	NULL	\N	\N	\N	202	NULL	12	NULL	O	\N	ONG CALMA GUATAJIAGUA-CHAPELTIQUE	NULL	NULL	NULL	\N	\N	G
800	2	21	3	NULL	\N	\N	\N	252	NULL	14	NULL	D	\N	Casa de Salud La Unión LU Amapalita(El Faro)	NULL	NULL	NULL	\N	\N	G
801	2	21	3	NULL	\N	\N	\N	254	NULL	14	NULL	D	\N	Casa de Salud Nueva Esparta LU Upire	NULL	NULL	NULL	\N	\N	G
802	6	25	58	NULL	\N	\N	\N	109	NULL	6	NULL	A	\N	CAE San Martin SS	NULL	NULL	NULL	\N	\N	G
803	5	6	119	NULL	\N	\N	\N	48	NULL	4	NULL	P	\N	Unidad Medica ISSS Chalatenango CH	NULL	NULL	NULL	\N	\N	G
804	5	8	126	NULL	\N	\N	\N	83	NULL	5	NULL	P	\N	Unidad Medica ISSS La Libertad LL	NULL	NULL	NULL	\N	\N	G
805	5	8	126	NULL	\N	\N	\N	86	NULL	5	NULL	P	\N	Unidad Medica ISSS Quezaltepeque LL	NULL	NULL	NULL	\N	\N	G
806	5	8	126	NULL	\N	\N	\N	85	NULL	5	NULL	P	\N	Unidad Medica ISSS Santa Tecla LL	NULL	NULL	NULL	\N	\N	G
807	5	8	126	NULL	\N	\N	\N	75	NULL	5	NULL	K	\N	Clinica Comunal ISSS Santa Tecla LL Antiguo Cuscatlán	NULL	NULL	NULL	\N	\N	G
808	5	8	126	NULL	\N	\N	\N	85	NULL	5	NULL	K	\N	Clinica Comunal ISSS  Santa Tecla LL San Antonio	NULL	NULL	NULL	\N	\N	G
809	5	8	126	NULL	\N	\N	\N	85	NULL	5	NULL	K	\N	Clinica Comunal ISSS Santa Tecla LL Santa Mónica	NULL	NULL	NULL	\N	\N	G
810	5	8	126	NULL	\N	\N	\N	75	NULL	5	NULL	K	\N	Clinica Comunal ISSS Santa Tecla LL Merliot	NULL	NULL	NULL	\N	\N	G
811	5	8	126	NULL	\N	\N	\N	77	NULL	5	NULL	K	\N	Clinica Comunal ISSS Santa Tecla LL Lourdes	NULL	NULL	NULL	\N	\N	G
812	5	8	126	NULL	\N	\N	\N	89	NULL	5	NULL	K	\N	Clinica Comunal ISSS San Juan Opico LL Sitio El Niño	NULL	NULL	NULL	\N	\N	G
813	5	8	126	NULL	\N	\N	\N	87	NULL	5	NULL	P	\N	Unidad Medica ISSS Sacacoyo LL Ateos 	NULL	NULL	NULL	\N	\N	G
814	4	12	4	NULL	\N	\N	\N	161	NULL	9	NULL	O	\N	ONG FUSAL Victoria CA 	NULL	NULL	NULL	\N	\N	G
815	2	20	39	NULL	\N	\N	\N	243	NULL	13	NULL	U	\N	UDS SAN JUAN DE LA CRUZ YAMABAL	NULL	NULL	NULL	\N	\N	G
816	2	20	33	NULL	\N	\N	\N	234	NULL	13	NULL	U	\N	UDS RANCHO QUEMADO FOSALUD	NULL	NULL	NULL	\N	\N	G
817	6	23	113	NULL	\N	\N	\N	101	NULL	6	NULL	V	\N	Clinica Privada El Paisnal SS Municipal	NULL	NULL	NULL	\N	\N	G
818	2	21	3	NULL	\N	\N	\N	253	NULL	14	NULL	O	\N	ONG FUNDEMUN GUAJINIQUIL/LISLIQUE	NULL	NULL	NULL	\N	\N	G
819	2	17	63	NULL	\N	\N	\N	200	NULL	12	NULL	U	\N	UDS PERIFERICA CIUDAD BARRIOS	NULL	NULL	NULL	\N	\N	G
820	4	9	107	NULL	\N	\N	\N	117	NULL	7	NULL	U	\N	UDS PERIFERICA DE COJUTEPEQUE	NULL	NULL	NULL	\N	\N	G
821	2	20	33	NULL	\N	\N	\N	211	NULL	12	NULL	O	\N	ONG CALMA SAN ATONIO DEL MOSCO-TOROLA	NULL	NULL	NULL	\N	\N	G
822	2	21	3	NULL	\N	\N	\N	255	NULL	14	NULL	D	\N	Casa de Salud Pasaquina LU El Amatillo	NULL	NULL	NULL	\N	\N	G
823	2	21	3	NULL	\N	\N	\N	252	NULL	14	NULL	D	\N	Casa de Salud La Unión LU Loma Larga	NULL	NULL	NULL	\N	\N	G
824	2	17	63	NULL	\N	\N	\N	199	NULL	12	NULL	V	\N	Clinica Privada San Miguel SM Centro de Salud Villaseca Col.Cdad.Pacífico	NULL	NULL	NULL	\N	\N	G
825	4	10	25	NULL	\N	\N	\N	146	NULL	8	NULL	V	\N	Clinica Privada San Pedro Masahuat LP San Judas Tadeo	NULL	NULL	NULL	\N	\N	G
826	1	5	18	NULL	\N	\N	\N	41	NULL	3	NULL	W	\N	Hospital Privado Sonzacate SO Desnutrición de AGAPE	NULL	NULL	NULL	\N	\N	G
827	2	17	63	NULL	\N	\N	\N	199	NULL	12	NULL	U	\N	UNIDAD MOVIL 1 FOSALUD	NULL	NULL	NULL	\N	\N	G
828	1	5	18	NULL	\N	\N	\N	40	NULL	3	NULL	U	\N	UNIDAD MOVIL 2 FOSALUD	NULL	NULL	NULL	\N	\N	G
829	4	13	29	NULL	\N	\N	\N	172	NULL	10	NULL	U	\N	UNIDAD MOVIL 3 FOSALUD	NULL	NULL	NULL	\N	\N	G
830	5	6	119	NULL	\N	\N	\N	48	NULL	4	NULL	U	\N	UNIDAD MOVIL 4 FOSALUD	NULL	NULL	NULL	\N	\N	G
831	1	2	2	NULL	\N	\N	\N	22	NULL	2	NULL	U	\N	UNIDAD MOVIL 5 FOSALUD	NULL	NULL	NULL	\N	\N	G
833	1	2	13	NULL	\N	\N	\N	22	NULL	2	NULL	R	\N	Centro ISRI Santa Ana SA Rehabilitación Integral de Occidente	NULL	NULL	NULL	\N	\N	G
834	2	17	63	NULL	\N	\N	\N	215	NULL	12	NULL	R	\N	Centro ISRI San Miguel SM Rehabilitación Integral de Oriente	NULL	NULL	NULL	\N	\N	G
835	6	24	116	NULL	\N	\N	\N	110	NULL	6	NULL	R	\N	Centro ISRI San Salvador SS Aparato Locomotor	NULL	NULL	NULL	\N	\N	G
836	6	27	48	NULL	\N	\N	\N	110	NULL	6	NULL	R	\N	Centro ISRI San Salvador SS Audición y Lenguaje	NULL	NULL	NULL	\N	\N	G
837	6	24	116	NULL	\N	\N	\N	110	NULL	6	NULL	R	\N	Centro ISRI San Salvador SS Asilo Sara Zaldivar	NULL	NULL	NULL	\N	\N	G
838	6	27	48	NULL	\N	\N	\N	110	NULL	6	NULL	R	\N	Centro ISRI San Salvador SS de Ciegos Eugenia de Dueñas	NULL	NULL	NULL	\N	\N	G
839	6	27	48	NULL	\N	\N	\N	110	NULL	6	NULL	R	\N	Centro ISRI San Salvador SS Integral de la Niñez y Adolescencia	NULL	NULL	NULL	\N	\N	G
840	6	27	48	NULL	\N	\N	\N	110	NULL	6	NULL	R	\N	Centro ISRI San Salvador SS Consulta Externa y Geriatria	NULL	NULL	NULL	\N	\N	G
841	4	12	4	NULL	\N	\N	\N	156	NULL	9	NULL	O	\N	ONG ASAPROSAR SAN FRANCISCO DEL MONTE	NULL	NULL	NULL	\N	\N	G
842	4	12	4	NULL	\N	\N	\N	156	NULL	9	NULL	O	\N	ONG ASAPROSAR SANTA LUCIA	NULL	NULL	NULL	\N	\N	G
843	4	12	4	NULL	\N	\N	\N	156	NULL	9	NULL	O	\N	ONG ASAPROSAR ILOBASCO	NULL	NULL	NULL	\N	\N	G
844	6	27	48	NULL	\N	\N	\N	110	NULL	6	NULL	V	\N	Clinica Privada Instituto del Cancer San Salvador SS	NULL	NULL	NULL	\N	\N	G
845	6	27	48	NULL	\N	\N	\N	110	NULL	6	NULL	O	\N	ONG FUDEM San Salvador SS	NULL	NULL	NULL	\N	\N	G
846	5	6	119	NULL	\N	\N	\N	47	NULL	4	NULL	O	\N	ONG CALMA CONCEPCION QUEZALTEPEQUE	NULL	NULL	NULL	\N	\N	G
847	1	2	13	NULL	\N	\N	\N	17	NULL	2	NULL	O	\N	ONG ASAPROSAR EL PORVENIR	NULL	NULL	NULL	\N	\N	G
848	5	6	119	NULL	\N	\N	\N	42	NULL	4	NULL	O	\N	ONG SERAPHIM AGUA CALIENTE	NULL	NULL	NULL	\N	\N	G
849	4	10	25	NULL	\N	\N	\N	153	NULL	8	NULL	D	\N	Casa de Salud San Luis la Herradura LP Isla Colorada	NULL	NULL	NULL	\N	\N	G
850	4	10	25	NULL	\N	\N	\N	153	NULL	8	NULL	D	\N	Casa de Salud San Luis la Herradura LP San Rafael Tasajera	NULL	NULL	NULL	\N	\N	G
851	4	10	25	NULL	\N	\N	\N	153	NULL	8	NULL	D	\N	Casa de Salud San Luis la Herradura LP El Chingo	NULL	NULL	NULL	\N	\N	G
853	1	1	1	NULL	\N	\N	\N	2	NULL	1	NULL	O	\N	ONG LIBRAS DE AMOR APANECA	NULL	NULL	NULL	\N	\N	G
854	1	1	1	NULL	\N	\N	\N	4	NULL	1	NULL	O	\N	ONG LIBRAS DE AMOR ATACO	NULL	NULL	NULL	\N	\N	G
855	1	1	1	NULL	\N	\N	\N	6	NULL	1	NULL	O	\N	ONG LIBRAS DE AMOR GUAYMANGO	NULL	NULL	NULL	\N	\N	G
856	1	2	2	NULL	\N	\N	\N	22	NULL	2	NULL	O	\N	ONG LIBRAS DE AMOR SAN MIGUELITO	NULL	NULL	NULL	\N	\N	G
857	1	2	2	NULL	\N	\N	\N	22	NULL	2	NULL	O	\N	ONG LIBRAS DE AMOR TOMAS PINEDA MARTINEZ	NULL	NULL	NULL	\N	\N	G
858	1	2	2	NULL	\N	\N	\N	22	NULL	2	NULL	O	\N	ONG LIBRAS DE AMOR EL PALMAR	NULL	NULL	NULL	\N	\N	G
859	1	2	2	NULL	\N	\N	\N	16	NULL	2	NULL	O	\N	ONG LIBRAS DE AMOR EL CONGO	NULL	NULL	NULL	\N	\N	G
860	1	2	2	NULL	\N	\N	\N	22	NULL	2	NULL	O	\N	ONG LIBRAS DE AMOR SANTA LUCIA	NULL	NULL	NULL	\N	\N	G
861	1	2	2	NULL	\N	\N	\N	22	NULL	2	NULL	O	\N	ONG LIBRAS DE AMOR PLANES DE LA LAGUNA	NULL	NULL	NULL	\N	\N	G
862	1	5	18	NULL	\N	\N	\N	37	NULL	3	NULL	O	\N	ONG LIBRAS DE AMOR SAN JULIAN (LUIS POMA	NULL	NULL	NULL	\N	\N	G
863	1	2	2	NULL	\N	\N	\N	15	NULL	2	NULL	O	\N	ONG ASPS CHALCHUAPA	NULL	NULL	NULL	\N	\N	G
864	2	21	3	NULL	\N	\N	\N	248	NULL	14	NULL	D	\N	Casa de Salud Conchagua LU El Pilón	NULL	NULL	NULL	\N	\N	G
865	2	21	3	NULL	\N	\N	\N	255	NULL	14	NULL	D	\N	Casa de Salud Pasaquina LU Raul Napoleon Chicas	NULL	NULL	NULL	\N	\N	G
867	4	13	29	NULL	\N	\N	\N	172	NULL	10	NULL	U	\N	Brigada Médica Cubana-Salvadoreña	NULL	NULL	NULL	\N	\N	G
868	6	27	51	NULL	\N	\N	\N	104	NULL	6	NULL	P	\N	Unidad Medica ISSS Mejicanos (Zacamil) SS	NULL	NULL	NULL	\N	\N	G
869	2	14	79	NULL	\N	\N	\N	183	NULL	11	NULL	L	\N	UCSFE Jiquilisco US Bajo Lempa Salud Renal	NULL	NULL	NULL	\N	\N	G
870	5	8	22	NULL	\N	\N	\N	77	NULL	5	NULL	U	\N	UDS COLON LL EL BOTONCILLAL	NULL	NULL	NULL	\N	\N	G
871	4	10	25	NULL	\N	\N	\N	152	NULL	8	NULL	Z	\N	Centro Penal Zacatecoluca LP Maxima Seguridad	NULL	NULL	NULL	\N	\N	G
872	1	5	18	NULL	\N	\N	\N	31	NULL	3	NULL	D	\N	Casa de Salud Izalco Sonsonate San Isidro	NULL	NULL	NULL	\N	\N	G
873	2	21	3	NULL	\N	\N	\N	252	NULL	14	NULL	G	\N	OSI La Union LU Puerto de la Union	NULL	NULL	NULL	\N	\N	G
874	2	21	3	NULL	\N	\N	\N	252	NULL	14	NULL	U	\N	UDS LA PLAYA	NULL	NULL	NULL	\N	\N	G
876	1	1	1	NULL	\N	\N	\N	1	NULL	1	NULL	G	\N	OSI Francisco Menendez AH Frontera La Hachadura	NULL	NULL	NULL	\N	\N	G
877	1	1	1	NULL	\N	\N	\N	1	NULL	1	NULL	G	\N	OSI Ahuachapan AH Frontera Las Chinamas	NULL	NULL	NULL	\N	\N	G
878	1	2	2	NULL	\N	\N	\N	13	NULL	2	NULL	G	\N	OSI Candelaria de La Frontera SA Frontera San Cristobal	NULL	NULL	NULL	\N	\N	G
879	1	2	2	NULL	\N	\N	\N	19	NULL	2	NULL	G	\N	OSI Metapan SA Frontera Anguiatu	NULL	NULL	NULL	\N	\N	G
880	5	6	119	NULL	\N	\N	\N	45	NULL	4	NULL	G	\N	OSI Citala CH Frontera el Poy	NULL	NULL	NULL	\N	\N	G
881	2	21	3	NULL	\N	\N	\N	255	NULL	14	NULL	G	\N	OSI Pasaquina LU Frontera el Amatillo	NULL	NULL	NULL	\N	\N	G
882	1	5	18	NULL	\N	\N	\N	26	NULL	3	NULL	G	\N	OSI Acajutla SO Puerto	NULL	NULL	NULL	\N	\N	G
883	5	6	119	NULL	\N	\N	\N	48	NULL	4	NULL	L	\N	UCSFE Chalatenango CH Guarjila	NULL	NULL	NULL	\N	\N	G
884	5	6	119	NULL	\N	\N	\N	45	NULL	4	NULL	J	\N	UCSF Citala CH	NULL	NULL	NULL	\N	\N	G
885	5	6	119	NULL	\N	\N	\N	45	NULL	4	NULL	J	\N	UCSF Cítala CH San Ramon	NULL	NULL	NULL	\N	\N	G
886	5	6	119	NULL	\N	\N	\N	53	NULL	4	NULL	L	\N	UCSFE La Palma CH	NULL	NULL	NULL	\N	\N	G
887	5	6	119	NULL	\N	\N	\N	53	NULL	4	NULL	J	\N	UCSF La Palma CH Los Horcones	NULL	NULL	NULL	\N	\N	G
888	5	6	119	NULL	\N	\N	\N	53	NULL	4	NULL	J	\N	UCSF La Plama CH San José Sacare	NULL	NULL	NULL	\N	\N	G
889	5	6	119	NULL	\N	\N	\N	53	NULL	4	NULL	J	\N	UCSF La Palma CH Las Granadillas	NULL	NULL	NULL	\N	\N	G
890	5	6	119	NULL	\N	\N	\N	66	NULL	4	NULL	J	\N	UCSF San Ignacio CH	NULL	NULL	NULL	\N	\N	G
891	5	6	119	NULL	\N	\N	\N	66	NULL	4	NULL	J	\N	UCSF San Ignacio CH El Carmen	NULL	NULL	NULL	\N	\N	G
892	5	6	119	NULL	\N	\N	\N	66	NULL	4	NULL	J	\N	UCSF San Ignacio CH Las Pilas	NULL	NULL	NULL	\N	\N	G
893	5	6	119	NULL	\N	\N	\N	54	NULL	4	NULL	J	\N	UCSF La Reina CH	NULL	NULL	NULL	\N	\N	G
894	5	6	119	NULL	\N	\N	\N	54	NULL	4	NULL	J	\N	UCSF La Reina CH El Pepeto	NULL	NULL	NULL	\N	\N	G
895	5	6	119	NULL	\N	\N	\N	54	NULL	4	NULL	J	\N	UCSF La Reina CH El Tigre	NULL	NULL	NULL	\N	\N	G
896	5	6	119	NULL	\N	\N	\N	43	NULL	4	NULL	J	\N	UCSF Arcatao CH	NULL	NULL	NULL	\N	\N	G
897	5	6	119	NULL	\N	\N	\N	58	NULL	4	NULL	J	\N	UCSF Nueva Trinidad CH	NULL	NULL	NULL	\N	\N	G
898	5	6	119	NULL	\N	\N	\N	69	NULL	4	NULL	J	\N	UCSF Las Flores CH	NULL	NULL	NULL	\N	\N	G
899	5	6	119	NULL	\N	\N	\N	56	NULL	4	NULL	J	\N	UCSF Nombre de Jesus CH	NULL	NULL	NULL	\N	\N	G
900	5	6	119	NULL	\N	\N	\N	56	NULL	4	NULL	J	\N	UCSF Nombre de Jesus CH Junquillo	NULL	NULL	NULL	\N	\N	G
901	5	6	119	NULL	\N	\N	\N	61	NULL	4	NULL	J	\N	UCSF San Antonio de la Cruz CH	NULL	NULL	NULL	\N	\N	G
902	5	6	119	NULL	\N	\N	\N	67	NULL	4	NULL	J	\N	UCSF San Isidro Labrador CH	NULL	NULL	NULL	\N	\N	G
903	5	6	119	NULL	\N	\N	\N	68	NULL	4	NULL	J	\N	UCSF Cancasque CH	NULL	NULL	NULL	\N	\N	G
904	5	6	119	NULL	\N	\N	\N	60	NULL	4	NULL	J	\N	UCSF Potonico CH	NULL	NULL	NULL	\N	\N	G
905	5	6	119	NULL	\N	\N	\N	62	NULL	4	NULL	J	\N	UCSF San Antonio los Ranchos CH	NULL	NULL	NULL	\N	\N	G
906	5	6	119	NULL	\N	\N	\N	71	NULL	4	NULL	J	\N	UCSF San Miguel de Mercedes CH	NULL	NULL	NULL	\N	\N	G
907	5	6	119	NULL	\N	\N	\N	55	NULL	4	NULL	J	\N	UCSF Las Vueltas CH	NULL	NULL	NULL	\N	\N	G
908	5	6	119	NULL	\N	\N	\N	59	NULL	4	NULL	J	\N	UCSF Ojos de Agua CH	NULL	NULL	NULL	\N	\N	G
909	5	6	119	NULL	\N	\N	\N	59	NULL	4	NULL	J	\N	UCSF Ojos de Agua CH El Zapotal	NULL	NULL	NULL	\N	\N	G
910	5	6	119	NULL	\N	\N	\N	50	NULL	4	NULL	J	\N	UCSF El Carrizal CH	NULL	NULL	NULL	\N	\N	G
911	5	6	119	NULL	\N	\N	\N	50	NULL	4	NULL	J	\N	UCSF El Carrizal CH Vanillas	NULL	NULL	NULL	\N	\N	G
912	5	6	119	NULL	\N	\N	\N	52	NULL	4	NULL	J	\N	UCSF La Laguna CH-Urbano	NULL	NULL	NULL	\N	\N	G
913	5	6	119	NULL	\N	\N	\N	52	NULL	4	NULL	J	\N	UCSF La Laguna CH San Jose	NULL	NULL	NULL	\N	\N	G
914	5	6	119	NULL	\N	\N	\N	46	NULL	4	NULL	J	\N	UCSF Comalapa CH	NULL	NULL	NULL	\N	\N	G
915	5	6	119	NULL	\N	\N	\N	46	NULL	4	NULL	J	\N	UCSF Comalapa CH Guachipilín	NULL	NULL	NULL	\N	\N	G
916	5	6	119	NULL	\N	\N	\N	49	NULL	4	NULL	J	\N	UCSF Dulce Nombre de Maria CH	NULL	NULL	NULL	\N	\N	G
917	5	6	119	NULL	\N	\N	\N	49	NULL	4	NULL	J	\N	UCSF Dulce Nombre de Maria CH El Ocotal	NULL	NULL	NULL	\N	\N	G
918	5	6	119	NULL	\N	\N	\N	49	NULL	4	NULL	J	\N	UCSF Dulce Nombre de Maria CH Gutierrez	NULL	NULL	NULL	\N	\N	G
919	5	6	119	NULL	\N	\N	\N	72	NULL	4	NULL	J	\N	UCSF San Rafael CH	NULL	NULL	NULL	\N	\N	G
920	5	6	119	NULL	\N	\N	\N	73	NULL	4	NULL	J	\N	UCSF Santa Rita CH	NULL	NULL	NULL	\N	\N	G
921	5	6	119	NULL	\N	\N	\N	72	NULL	4	NULL	J	\N	UCSF San Rafael CH San Jose Los Sitios	NULL	NULL	NULL	\N	\N	G
922	5	6	119	NULL	\N	\N	\N	73	NULL	4	NULL	J	\N	UCSF Santa Rita CH El Sol	NULL	NULL	NULL	\N	\N	G
923	5	6	119	NULL	\N	\N	\N	63	NULL	4	NULL	J	\N	UCSF San Fernando CH	NULL	NULL	NULL	\N	\N	G
924	5	6	119	NULL	\N	\N	\N	47	NULL	4	NULL	J	\N	UCSF Concepción Quezaltepeque	NULL	NULL	NULL	\N	\N	G
925	5	6	119	NULL	\N	\N	\N	47	NULL	4	NULL	J	\N	UCSF Concepción Quezaltepeque CH Llano Grande	NULL	NULL	NULL	\N	\N	G
926	5	6	119	NULL	\N	\N	\N	47	NULL	4	NULL	J	\N	UCSF Concepción Quezaltepeque CH Monte Redondo	NULL	NULL	NULL	\N	\N	G
927	5	6	119	NULL	\N	\N	\N	42	NULL	4	NULL	J	\N	UCSF Agua Caliente CH	NULL	NULL	NULL	\N	\N	G
928	5	6	119	NULL	\N	\N	\N	42	NULL	4	NULL	J	\N	UCSF Agua Caliente CH El Carmen	NULL	NULL	NULL	\N	\N	G
929	5	6	119	NULL	\N	\N	\N	42	NULL	4	NULL	J	\N	UCSF Agua Caliente CH Cerro Grande	NULL	NULL	NULL	\N	\N	G
930	5	6	119	NULL	\N	\N	\N	42	NULL	4	NULL	J	\N	UCSF Agua Caliente CH Obrajuelo	NULL	NULL	NULL	\N	\N	G
931	5	6	119	NULL	\N	\N	\N	70	NULL	4	NULL	J	\N	UCSF San Luis del Carmen CH	NULL	NULL	NULL	\N	\N	G
932	5	6	119	NULL	\N	\N	\N	65	NULL	4	NULL	J	\N	UCSF San Francisco Morazan CH	NULL	NULL	NULL	\N	\N	G
933	4	12	4	NULL	\N	\N	\N	156	NULL	9	NULL	L	\N	UCSFE Ilobasco CA	NULL	NULL	NULL	\N	\N	G
934	4	12	4	NULL	\N	\N	\N	159	NULL	9	NULL	L	\N	UCSFE Sensuntepeque CA	NULL	NULL	NULL	\N	\N	G
935	4	12	4	NULL	\N	\N	\N	209	NULL	12	NULL	J	\N	UCSF Nuevo Eden de San juan SM	NULL	NULL	NULL	\N	\N	G
936	4	12	4	NULL	\N	\N	\N	209	NULL	12	NULL	J	\N	UCSF Nuevo Eden de San Juan SM San Sebastian	NULL	NULL	NULL	\N	\N	G
937	4	12	4	NULL	\N	\N	\N	156	NULL	9	NULL	J	\N	UCSF Ilobasco CA San Jose	NULL	NULL	NULL	\N	\N	G
938	4	12	4	NULL	\N	\N	\N	156	NULL	9	NULL	J	\N	UCSF Ilobasco CA Agua Zarca	NULL	NULL	NULL	\N	\N	G
939	4	12	4	NULL	\N	\N	\N	156	NULL	9	NULL	J	\N	UCSF Ilobasco CA Cerro Colorado	NULL	NULL	NULL	\N	\N	G
940	4	12	4	NULL	\N	\N	\N	156	NULL	9	NULL	J	\N	UCSF Ilobasco CA San Francisco Iraheta	NULL	NULL	NULL	\N	\N	G
941	4	12	4	NULL	\N	\N	\N	156	NULL	9	NULL	J	\N	UCSF Ilobasco CA Potreros	NULL	NULL	NULL	\N	\N	G
942	4	12	4	NULL	\N	\N	\N	156	NULL	9	NULL	J	\N	UCSF Ilobasco CA Los Llanitos	NULL	NULL	NULL	\N	\N	G
943	4	12	4	NULL	\N	\N	\N	156	NULL	9	NULL	J	\N	UCSF Ilobasco CA Huertas	NULL	NULL	NULL	\N	\N	G
944	4	12	4	NULL	\N	\N	\N	156	NULL	9	NULL	J	\N	UCSF Ilobasco CA Sitio Viejo	NULL	NULL	NULL	\N	\N	G
945	4	12	4	NULL	\N	\N	\N	156	NULL	9	NULL	J	\N	UCSF Ilobasco CA Maquilishuat Santa Lucia	NULL	NULL	NULL	\N	\N	G
946	4	12	4	NULL	\N	\N	\N	156	NULL	9	NULL	J	\N	UCSF Ilobasco CA Maquilishuat El Limón	NULL	NULL	NULL	\N	\N	G
947	4	12	4	NULL	\N	\N	\N	156	NULL	9	NULL	J	\N	UCSF Ilobasco CA San Francisco del Monte	NULL	NULL	NULL	\N	\N	G
948	4	12	4	NULL	\N	\N	\N	157	NULL	9	NULL	J	\N	UCSF Jutiapa CA	NULL	NULL	NULL	\N	\N	G
949	4	12	4	NULL	\N	\N	\N	154	NULL	9	NULL	J	\N	UCSF Cinquera CA	NULL	NULL	NULL	\N	\N	G
950	4	12	4	NULL	\N	\N	\N	157	NULL	9	NULL	J	\N	UCSF Jutiapa CA Carolina	NULL	NULL	NULL	\N	\N	G
951	4	12	4	NULL	\N	\N	\N	160	NULL	9	NULL	J	\N	UCSF Tejutepeque CA	NULL	NULL	NULL	\N	\N	G
952	4	12	4	NULL	\N	\N	\N	160	NULL	9	NULL	J	\N	UCSF Tejutepeque CA Concepción	NULL	NULL	NULL	\N	\N	G
953	4	12	4	NULL	\N	\N	\N	160	NULL	9	NULL	J	\N	UCSF Tejutepeque CA El Zapote	NULL	NULL	NULL	\N	\N	G
954	4	12	4	NULL	\N	\N	\N	161	NULL	9	NULL	J	\N	UCSF Victoria CA	NULL	NULL	NULL	\N	\N	G
955	4	12	4	NULL	\N	\N	\N	161	NULL	9	NULL	J	\N	UCSF Victoria CA Azacualpa	NULL	NULL	NULL	\N	\N	G
956	4	12	4	NULL	\N	\N	\N	161	NULL	9	NULL	J	\N	UCSF Victoria CA SanAntonio	NULL	NULL	NULL	\N	\N	G
957	4	12	4	NULL	\N	\N	\N	161	NULL	9	NULL	J	\N	UCSF Victoria CA Santa Marta	NULL	NULL	NULL	\N	\N	G
958	4	12	4	NULL	\N	\N	\N	162	NULL	9	NULL	J	\N	UCSF Dolores CA	NULL	NULL	NULL	\N	\N	G
959	4	12	4	NULL	\N	\N	\N	161	NULL	9	NULL	J	\N	UCSF Victoria CA San Pedro	NULL	NULL	NULL	\N	\N	G
960	4	12	4	NULL	\N	\N	\N	162	NULL	9	NULL	J	\N	UCSF Dolores CA San Carlos	NULL	NULL	NULL	\N	\N	G
961	2	17	63	NULL	\N	\N	\N	211	NULL	12	NULL	J	\N	UCSF San Antonio SM	NULL	NULL	NULL	\N	\N	G
962	2	17	63	NULL	\N	\N	\N	199	NULL	12	NULL	J	\N	UCSF Carolina SM 1	NULL	NULL	NULL	\N	\N	G
963	2	17	63	NULL	\N	\N	\N	199	NULL	12	NULL	J	\N	UCSF Carolina SM La Ceibita	NULL	NULL	NULL	\N	\N	G
964	2	17	63	NULL	\N	\N	\N	199	NULL	12	NULL	J	\N	UCSF Carolina SM Rosa Nacaspilo	NULL	NULL	NULL	\N	\N	G
965	2	17	63	NULL	\N	\N	\N	212	NULL	12	NULL	J	\N	UCSF San Gerardo SM San Jeronimo	NULL	NULL	NULL	\N	\N	G
966	2	17	63	NULL	\N	\N	\N	212	NULL	12	NULL	J	\N	UCSF San Gerardo SM 1	NULL	NULL	NULL	\N	\N	G
967	2	20	33	NULL	\N	\N	\N	227	NULL	13	NULL	J	\N	UCSF Guatajiagua MO 1	NULL	NULL	NULL	\N	\N	G
968	2	20	33	NULL	\N	\N	\N	227	NULL	13	NULL	J	\N	UCSF Guatajiagua MO 2	NULL	NULL	NULL	\N	\N	G
969	2	20	33	NULL	\N	\N	\N	227	NULL	13	NULL	J	\N	UCSF Guatajiagua MO Maiguera	NULL	NULL	NULL	\N	\N	G
970	2	20	33	NULL	\N	\N	\N	227	NULL	13	NULL	J	\N	UCSF Guatajiagua MO San Bartolo	NULL	NULL	NULL	\N	\N	G
971	2	20	33	NULL	\N	\N	\N	227	NULL	13	NULL	J	\N	UCSF Guatajiagua MO Los Abelines	NULL	NULL	NULL	\N	\N	G
972	2	20	33	NULL	\N	\N	\N	240	NULL	13	NULL	J	\N	UCSF Sensembra MO	NULL	NULL	NULL	\N	\N	G
973	2	20	33	NULL	\N	\N	\N	243	NULL	13	NULL	J	\N	UCSF Yamabal MO San Juan de La Cruz	NULL	NULL	NULL	\N	\N	G
974	2	20	33	NULL	\N	\N	\N	243	NULL	13	NULL	J	\N	UCSF Yamabal MO Isletas	NULL	NULL	NULL	\N	\N	G
975	2	20	33	NULL	\N	\N	\N	242	NULL	13	NULL	J	\N	UCSF Torola MO	NULL	NULL	NULL	\N	\N	G
976	2	20	33	NULL	\N	\N	\N	236	NULL	13	NULL	J	\N	UCSF San Fernando MO	NULL	NULL	NULL	\N	\N	G
977	2	20	33	NULL	\N	\N	\N	229	NULL	13	NULL	J	\N	UCSF Jocoaitique MO	NULL	NULL	NULL	\N	\N	G
978	2	20	33	NULL	\N	\N	\N	229	NULL	13	NULL	J	\N	UCSF Jocoaitique MO Quebrachos	NULL	NULL	NULL	\N	\N	G
979	2	20	33	NULL	\N	\N	\N	219	NULL	13	NULL	J	\N	UCSF Arambala MO	NULL	NULL	NULL	\N	\N	G
980	2	20	33	NULL	\N	\N	\N	228	NULL	13	NULL	J	\N	UCSF Joateca MO	NULL	NULL	NULL	\N	\N	G
981	2	20	33	NULL	\N	\N	\N	228	NULL	13	NULL	J	\N	UCSF Joateca MO La Laguna	NULL	NULL	NULL	\N	\N	G
982	2	20	33	NULL	\N	\N	\N	225	NULL	13	NULL	J	\N	UCSF El Rosario MO	NULL	NULL	NULL	\N	\N	G
983	2	20	33	NULL	\N	\N	\N	238	NULL	13	NULL	J	\N	UCSF San Isidro MO	NULL	NULL	NULL	\N	\N	G
984	2	20	33	NULL	\N	\N	\N	239	NULL	13	NULL	J	\N	UCSF San Simón MO 3	NULL	NULL	NULL	\N	\N	G
985	2	20	33	NULL	\N	\N	\N	239	NULL	13	NULL	J	\N	UCSF San Simón MO Potrero Adentro	NULL	NULL	NULL	\N	\N	G
986	2	17	63	NULL	\N	\N	\N	239	NULL	13	NULL	J	\N	UCSF San Simón MO El Carrizal 1	NULL	NULL	NULL	\N	\N	G
987	2	17	63	NULL	\N	\N	\N	239	NULL	13	NULL	J	\N	UCSF San Simón MO Las Quebradas	NULL	NULL	NULL	\N	\N	G
988	2	20	33	NULL	\N	\N	\N	226	NULL	13	NULL	J	\N	UCSF Gualococti MO	NULL	NULL	NULL	\N	\N	G
989	2	20	33	NULL	\N	\N	\N	223	NULL	13	NULL	J	\N	UCSF Delicias de Concepción MO 1	NULL	NULL	NULL	\N	\N	G
990	2	20	33	NULL	\N	\N	\N	223	NULL	13	NULL	J	\N	UCSF Delicias de Concepción MO El Volcan	NULL	NULL	NULL	\N	\N	G
991	2	20	33	NULL	\N	\N	\N	222	NULL	13	NULL	J	\N	UCSF Chilanga MO 1	NULL	NULL	NULL	\N	\N	G
992	2	20	33	NULL	\N	\N	\N	222	NULL	13	NULL	J	\N	UCSF Chilanga MO Las Crucitas	NULL	NULL	NULL	\N	\N	G
993	2	20	33	NULL	\N	\N	\N	222	NULL	13	NULL	J	\N	UCSF Chilanga MO Piedra Parada	NULL	NULL	NULL	\N	\N	G
994	2	20	33	NULL	\N	\N	\N	221	NULL	13	NULL	J	\N	UCSF Corinto MO 1	NULL	NULL	NULL	\N	\N	G
995	2	20	33	NULL	\N	\N	\N	221	NULL	13	NULL	J	\N	UCSF Corinto MO 2	NULL	NULL	NULL	\N	\N	G
996	2	20	33	NULL	\N	\N	\N	221	NULL	13	NULL	J	\N	UCSF Corinto MO Corralito San Francisco	NULL	NULL	NULL	\N	\N	G
997	2	20	33	NULL	\N	\N	\N	221	NULL	13	NULL	J	\N	UCSF Corinto MO San Felipe Los Villatoro	NULL	NULL	NULL	\N	\N	G
998	2	20	33	NULL	\N	\N	\N	221	NULL	13	NULL	J	\N	UCSF Corinto MO La Hermita	NULL	NULL	NULL	\N	\N	G
999	2	20	33	NULL	\N	\N	\N	231	NULL	13	NULL	J	\N	UCSF Lolotiquillo MO	NULL	NULL	NULL	\N	\N	G
1000	2	20	33	NULL	\N	\N	\N	231	NULL	13	NULL	J	\N	UCSF Lolotiquillo MO Gualindo	NULL	NULL	NULL	\N	\N	G
1001	2	20	33	NULL	\N	\N	\N	220	NULL	13	NULL	J	\N	UCSF Cacaopera MO	NULL	NULL	NULL	\N	\N	G
1002	2	20	33	NULL	\N	\N	\N	220	NULL	13	NULL	J	\N	UCSF Cacaopera MO La Estancia	NULL	NULL	NULL	\N	\N	G
1003	2	20	33	NULL	\N	\N	\N	220	NULL	13	NULL	J	\N	UCSF Cacaopera MO Agua Blanca	NULL	NULL	NULL	\N	\N	G
1004	2	20	33	NULL	\N	\N	\N	220	NULL	13	NULL	J	\N	UCSF Cacaopera MO Sunsulaca	NULL	NULL	NULL	\N	\N	G
1005	2	21	3	NULL	\N	\N	\N	253	NULL	14	NULL	J	\N	UCSF Lislique LU (U)	NULL	NULL	NULL	\N	\N	G
1006	2	21	3	NULL	\N	\N	\N	253	NULL	14	NULL	J	\N	UCSF Lislique LU Pilas	NULL	NULL	NULL	\N	\N	G
1007	2	21	3	NULL	\N	\N	\N	253	NULL	14	NULL	J	\N	UCSF Lislique LU El Derrumbado	NULL	NULL	NULL	\N	\N	G
1008	2	21	3	NULL	\N	\N	\N	253	NULL	14	NULL	J	\N	UCSF Lislique LU Higueras	NULL	NULL	NULL	\N	\N	G
1009	2	21	3	NULL	\N	\N	\N	253	NULL	14	NULL	J	\N	UCSF Lislique LU Guajiniquil	NULL	NULL	NULL	\N	\N	G
1010	2	21	3	NULL	\N	\N	\N	258	NULL	14	NULL	J	\N	UCSF San Jose La Fuente LU(U)	NULL	NULL	NULL	\N	\N	G
1011	2	17	63	NULL	\N	\N	\N	260	NULL	14	NULL	J	\N	UCSF Yayantique LU	NULL	NULL	NULL	\N	\N	G
1012	2	17	63	NULL	\N	\N	\N	260	NULL	14	NULL	J	\N	UCSF Yayantique LU El Pastor	NULL	NULL	NULL	\N	\N	G
1013	2	17	63	NULL	\N	\N	\N	260	NULL	14	NULL	J	\N	UCSF Yayantique LU Los Amates	NULL	NULL	NULL	\N	\N	G
1014	2	21	3	NULL	\N	\N	\N	254	NULL	14	NULL	J	\N	UCSF Nueva Esparta LU (U)	NULL	NULL	NULL	\N	\N	G
1015	2	21	3	NULL	\N	\N	\N	254	NULL	14	NULL	J	\N	UCSF Nueva esparta LU Monteca	NULL	NULL	NULL	\N	\N	G
1016	2	21	3	NULL	\N	\N	\N	254	NULL	14	NULL	J	\N	UCSF Nueva Esparta LU Las Marias	NULL	NULL	NULL	\N	\N	G
1017	2	21	3	NULL	\N	\N	\N	254	NULL	14	NULL	J	\N	UCSF Nueva Esparta LU Honduritas	NULL	NULL	NULL	\N	\N	G
1018	2	21	3	NULL	\N	\N	\N	256	NULL	14	NULL	J	\N	UCSF Poloros LU (U)	NULL	NULL	NULL	\N	\N	G
1019	2	21	3	NULL	\N	\N	\N	256	NULL	14	NULL	J	\N	UCSF Poloros LU Boquin	NULL	NULL	NULL	\N	\N	G
1020	2	21	3	NULL	\N	\N	\N	256	NULL	14	NULL	J	\N	UCSF Poloros LU Carpintero	NULL	NULL	NULL	\N	\N	G
1021	2	21	3	NULL	\N	\N	\N	256	NULL	14	NULL	J	\N	UCSF Poloros LU Ocote	NULL	NULL	NULL	\N	\N	G
1022	1	2	2	NULL	\N	\N	\N	17	NULL	2	NULL	J	\N	UCSF El Porvenir SA	NULL	NULL	NULL	\N	\N	G
1023	1	2	2	NULL	\N	\N	\N	17	NULL	2	NULL	J	\N	UCSF El Porvenir SA El Cerrón	NULL	NULL	NULL	\N	\N	G
1024	1	2	2	NULL	\N	\N	\N	17	NULL	2	NULL	J	\N	UCSF El Porvenir SA Amate Blanco	NULL	NULL	NULL	\N	\N	G
1025	1	2	2	NULL	\N	\N	\N	17	NULL	2	NULL	J	\N	UCSF El Porvenir SA San Juan Chiquito	NULL	NULL	NULL	\N	\N	G
1026	1	2	2	NULL	\N	\N	\N	18	NULL	2	NULL	J	\N	UCSF Masahuat SA	NULL	NULL	NULL	\N	\N	G
1027	1	2	2	NULL	\N	\N	\N	18	NULL	2	NULL	J	\N	UCSF Masahuat SA La Joya	NULL	NULL	NULL	\N	\N	G
1028	1	2	2	NULL	\N	\N	\N	23	NULL	2	NULL	J	\N	UCSF Santa Rosa de Guachipilín SA	NULL	NULL	NULL	\N	\N	G
1029	1	2	2	NULL	\N	\N	\N	23	NULL	2	NULL	J	\N	UCSF Santa Rosa Guachipilín SA El Despoblado	NULL	NULL	NULL	\N	\N	G
1030	1	2	2	NULL	\N	\N	\N	24	NULL	2	NULL	J	\N	UCSF Santiago La Frontera SA	NULL	NULL	NULL	\N	\N	G
1031	1	2	2	NULL	\N	\N	\N	24	NULL	2	NULL	J	\N	UCSF Santiago La Frontera SA Las Piletas	NULL	NULL	NULL	\N	\N	G
1032	1	2	2	NULL	\N	\N	\N	24	NULL	2	NULL	J	\N	UCSF Santiago La Frontera SA Santa Cruz	NULL	NULL	NULL	\N	\N	G
1033	1	2	2	NULL	\N	\N	\N	15	NULL	2	NULL	J	\N	UCSF Chalchuapa SA	NULL	NULL	NULL	\N	\N	G
1034	1	2	2	NULL	\N	\N	\N	15	NULL	2	NULL	J	\N	UCSF Chalchuapa SA Magdalena 1	NULL	NULL	NULL	\N	\N	G
1035	1	2	2	NULL	\N	\N	\N	15	NULL	2	NULL	J	\N	UCSF Chalchuapa SA Magdalena 2	NULL	NULL	NULL	\N	\N	G
1036	1	2	2	NULL	\N	\N	\N	15	NULL	2	NULL	J	\N	UCSF Chalchuapa SA San Sebastian	NULL	NULL	NULL	\N	\N	G
1037	1	2	2	NULL	\N	\N	\N	15	NULL	2	NULL	J	\N	UCSF Chalchuapa SA Galeano	NULL	NULL	NULL	\N	\N	G
1038	1	2	2	NULL	\N	\N	\N	15	NULL	2	NULL	J	\N	UCSF Chalchuapa SA Zacamil	NULL	NULL	NULL	\N	\N	G
1039	1	2	2	NULL	\N	\N	\N	15	NULL	2	NULL	J	\N	UCSF Chalchuapa SA Las Flores	NULL	NULL	NULL	\N	\N	G
1040	1	2	2	NULL	\N	\N	\N	15	NULL	2	NULL	J	\N	UCSF Chalchuapa SA El Paste	NULL	NULL	NULL	\N	\N	G
1041	1	2	2	NULL	\N	\N	\N	15	NULL	2	NULL	J	\N	UCSF Chalchuapa SA El Coco	NULL	NULL	NULL	\N	\N	G
1042	1	2	2	NULL	\N	\N	\N	15	NULL	2	NULL	J	\N	UCSF Chalchuapa SA San José	NULL	NULL	NULL	\N	\N	G
1043	1	2	69	NULL	\N	\N	\N	15	NULL	2	NULL	J	\N	UCSF Chalchuapa SA Las Lomas	NULL	NULL	NULL	\N	\N	G
1044	1	2	69	NULL	\N	\N	\N	15	NULL	2	NULL	J	\N	UCSF Chalchuapa SA Las Lajas	NULL	NULL	NULL	\N	\N	G
1045	1	2	69	NULL	\N	\N	\N	15	NULL	2	NULL	J	\N	UCSF Chalchuapa SA Las Cruces	NULL	NULL	NULL	\N	\N	G
1094	2	17	63	NULL	\N	\N	\N	212	NULL	12	NULL	J	\N	UCSF San Gerardo SM La Laguna	NULL	NULL	NULL	\N	\N	G
1049	1	2	2	NULL	\N	\N	\N	15	NULL	2	NULL	L	\N	UCSFE Chalchuapa SA	NULL	NULL	NULL	\N	\N	G
1050	1	1	1	NULL	\N	\N	\N	9	NULL	1	NULL	J	\N	UCSF San Lorenzo AH Guascota	NULL	NULL	NULL	\N	\N	G
1051	1	1	10	NULL	\N	\N	\N	5	NULL	1	NULL	J	\N	UCSF El Refugio AH El Rosario	NULL	NULL	NULL	\N	\N	G
1052	1	1	1	NULL	\N	\N	\N	12	NULL	1	NULL	J	\N	UCSF Turín AH El Paraiso	NULL	NULL	NULL	\N	\N	G
1099	1	5	18	NULL	\N	\N	\N	36	NULL	3	NULL	O	\N	ONG LIBRAS DE AMOR SONSONATE SAN ANTONIO DEL MONTE	NULL	NULL	NULL	\N	\N	G
1107	5	8	21	NULL	\N	\N	\N	94	NULL	5	NULL	J	\N	UCSF Teotepeque LL Aguacayo 	NULL	NULL	NULL	\N	\N	G
1108	5	8	21	NULL	\N	\N	\N	79	NULL	5	NULL	J	\N	UCSF Chiltiupán LL	NULL	NULL	NULL	\N	\N	G
1056	1	1	1	NULL	\N	\N	\N	3	NULL	1	NULL	J	\N	UCSF Atiquizaya AH Lomas de Alarcon	NULL	NULL	NULL	\N	\N	G
1105	5	8	21	NULL	\N	\N	\N	94	NULL	5	NULL	J	\N	UCSF Teotepeque LL El Angel	NULL	NULL	NULL	\N	\N	G
1106	5	8	21	NULL	\N	\N	\N	94	NULL	5	NULL	J	\N	UCSF Teotepeque LL Mizata	NULL	NULL	NULL	\N	\N	G
1114	5	8	21	NULL	\N	\N	\N	78	NULL	5	NULL	J	\N	UCSF Comasagua LL El Conacaste	NULL	NULL	NULL	\N	\N	G
1113	5	8	21	NULL	\N	\N	\N	78	NULL	5	NULL	J	\N	UCSF Comasagua LL La Shila	NULL	NULL	NULL	\N	\N	G
1109	5	8	21	NULL	\N	\N	\N	79	NULL	5	NULL	J	\N	UCSF Chiltiupán LL Las Termopilas	NULL	NULL	NULL	\N	\N	G
1110	5	8	21	NULL	\N	\N	\N	79	NULL	5	NULL	J	\N	UCSF Chiltiupán LL Taquillo Ing. Orlando Recinos	NULL	NULL	NULL	\N	\N	G
1111	5	8	21	NULL	\N	\N	\N	82	NULL	5	NULL	J	\N	UCSF Jicalapa LL La Perla	NULL	NULL	NULL	\N	\N	G
1067	1	1	117	NULL	\N	\N	\N	1	NULL	1	NULL	J	\N	UCSF Ahuachapan AH Un Rancho y un lucero	NULL	NULL	NULL	\N	\N	G
1112	5	8	21	NULL	\N	\N	\N	78	NULL	5	NULL	J	\N	UCSF Comasagua LL	NULL	NULL	NULL	\N	\N	G
1070	5	6	119	NULL	\N	\N	\N	49	NULL	4	NULL	L	\N	UCSFE Dulce Nombre de Maria CH	NULL	NULL	NULL	\N	\N	G
1071	5	6	119	NULL	\N	\N	\N	47	NULL	4	NULL	L	\N	UCSFE Concepción Quezaltepeque CH	NULL	NULL	NULL	\N	\N	G
1098	1	1	1	NULL	\N	\N	\N	1	NULL	1	NULL	O	\N	ONG LIBRAS DE AMOR AHUACHAPAN	NULL	NULL	NULL	\N	\N	G
1073	2	21	3	NULL	\N	\N	\N	258	NULL	14	NULL	J	\N	UCSF San Jose la Fuente LU El Sombrerito	NULL	NULL	NULL	\N	\N	G
1074	2	20	33	NULL	\N	\N	\N	234	NULL	13	NULL	L	\N	UCSFE Perquin MO	NULL	NULL	NULL	\N	\N	G
1075	2	20	33	NULL	\N	\N	\N	221	NULL	13	NULL	L	\N	UCSFE Corinto MO	NULL	NULL	NULL	\N	\N	G
1076	2	20	33	NULL	\N	\N	\N	240	NULL	13	NULL	L	\N	UCSFE Semsembra MO	NULL	NULL	NULL	\N	\N	G
1077	2	20	33	NULL	\N	\N	\N	233	NULL	13	NULL	L	\N	UCSFE Osicala MO	NULL	NULL	NULL	\N	\N	G
1078	2	21	3	NULL	\N	\N	\N	245	NULL	14	NULL	L	\N	UCSFE Anamoros LU	NULL	NULL	NULL	\N	\N	G
1079	2	17	63	NULL	\N	\N	\N	199	NULL	12	NULL	L	\N	UCSFE Carolina SM	NULL	NULL	NULL	\N	\N	G
1080	6	25	58	NULL	\N	\N	\N	109	NULL	6	NULL	J	\N	UCSF San Martin SS Los Letona	NULL	NULL	NULL	\N	\N	G
1081	6	25	58	NULL	\N	\N	\N	109	NULL	6	NULL	J	\N	UCSF San Martin SS La Flor	NULL	NULL	NULL	\N	\N	G
1082	6	24	116	NULL	\N	\N	\N	107	NULL	6	NULL	J	\N	UCSF Rosario de Mora SS Palo Grande	NULL	NULL	NULL	\N	\N	G
1083	6	24	116	NULL	\N	\N	\N	106	NULL	6	NULL	J	\N	UCSF Panchimalco SS Quezalapa	NULL	NULL	NULL	\N	\N	G
1084	6	24	116	NULL	\N	\N	\N	106	NULL	6	NULL	J	\N	UCSF Panchimalco SS Amayon	NULL	NULL	NULL	\N	\N	G
1085	6	23	113	NULL	\N	\N	\N	101	NULL	6	NULL	J	\N	UCSF El Paisnal SS San Francisco dos Cerros	NULL	NULL	NULL	\N	\N	G
1086	6	23	113	NULL	\N	\N	\N	97	NULL	6	NULL	J	\N	UCSF Aguilares SS La Florida	NULL	NULL	NULL	\N	\N	G
1087	4	12	4	NULL	\N	\N	\N	156	NULL	9	NULL	J	\N	UCSF Ilobasco CA Hoyos	NULL	NULL	NULL	\N	\N	G
1088	2	14	79	NULL	\N	\N	\N	198	NULL	11	NULL	U	\N	UDS USULUTAN US	NULL	NULL	NULL	\N	\N	G
1089	5	6	119	NULL	\N	\N	\N	53	NULL	4	NULL	J	\N	UCSF La Palma CH	NULL	NULL	NULL	\N	\N	G
1090	5	6	119	NULL	\N	\N	\N	48	NULL	4	NULL	J	\N	UCSF Chalatenango CH Guarjila	NULL	NULL	NULL	\N	\N	G
1091	2	20	33	NULL	\N	\N	\N	227	NULL	13	NULL	J	\N	UCSF Guatajiagua MO Pajigua	NULL	NULL	NULL	\N	\N	G
1092	2	20	33	NULL	\N	\N	\N	211	NULL	12	NULL	J	\N	UCSF San Antonio SM San Diego	NULL	NULL	NULL	\N	\N	G
1093	2	20	33	NULL	\N	\N	\N	221	NULL	13	NULL	J	\N	UCSF Corinto MO Corralito Atillo	NULL	NULL	NULL	\N	\N	G
1095	2	17	63	NULL	\N	\N	\N	211	NULL	12	NULL	J	\N	UCSF San Antonio SM San Marcos	NULL	NULL	NULL	\N	\N	G
1096	2	21	3	NULL	\N	\N	\N	248	NULL	14	NULL	J	\N	UCSF Conchagua LU Las Tunas	NULL	NULL	NULL	\N	\N	G
1097	2	21	3	NULL	\N	\N	\N	248	NULL	14	NULL	J	\N	UCSF Conchagua LU El Pilón	NULL	NULL	NULL	\N	\N	G
1100	1	5	18	NULL	\N	\N	\N	38	NULL	3	NULL	O	\N	ONG LIBRAS DE AMOR SONSONATE SANTA CATARINA MASAHUAT	NULL	NULL	NULL	\N	\N	G
1104	5	8	21	NULL	\N	\N	\N	94	NULL	5	NULL	J	\N	UCSF Teotepeque LL	NULL	NULL	NULL	\N	\N	G
1101	6	25	58	NULL	\N	\N	\N	103	NULL	6	NULL	P	\N	Unidad Medica ISSS Ilopango SS	NULL	NULL	NULL	\N	\N	G
1102	5	6	119	NULL	\N	\N	\N	48	NULL	4	NULL	U	\N	UDS CHALATENANGO CH GUARJILA	NULL	NULL	NULL	\N	\N	G
1385	6	27	49	NULL	\N	\N	\N	110	NULL	6	NULL	J	\N	UCSF San Salvador SS La Fosa	NULL	NULL	NULL	\N	\N	G
1103	6	27	48	NULL	\N	\N	\N	110	NULL	6	NULL	Q	\N	Consultorio ISSS San Salvador SS Especialidades	NULL	NULL	NULL	\N	\N	G
1115	5	8	21	NULL	\N	\N	\N	78	NULL	5	NULL	J	\N	UCSF Comasagua LL El Matazano	NULL	NULL	NULL	\N	\N	G
1116	5	8	21	NULL	\N	\N	\N	92	NULL	5	NULL	J	\N	UCSF Tamanique LL	NULL	NULL	NULL	\N	\N	G
1117	5	8	21	NULL	\N	\N	\N	92	NULL	5	NULL	J	\N	UCSF Tamanique LL Buenos Aires	NULL	NULL	NULL	\N	\N	G
1118	5	8	21	NULL	\N	\N	\N	92	NULL	5	NULL	J	\N	UCSF Tamanique LL San Alfonso	NULL	NULL	NULL	\N	\N	G
1119	5	8	21	NULL	\N	\N	\N	92	NULL	5	NULL	J	\N	UCSF Tamanique LL El Palmar	NULL	NULL	NULL	\N	\N	G
1120	5	8	21	NULL	\N	\N	\N	91	NULL	5	NULL	J	\N	UCSF San Pablo Tacachico LL	NULL	NULL	NULL	\N	\N	G
1121	5	8	21	NULL	\N	\N	\N	91	NULL	5	NULL	J	\N	UCSF San Pablo Tacachico LL San Isidro	NULL	NULL	NULL	\N	\N	G
1122	5	8	21	NULL	\N	\N	\N	91	NULL	5	NULL	J	\N	UCSF San Pablo Tacachico LL Atiocoyo	NULL	NULL	NULL	\N	\N	G
1123	5	8	21	NULL	\N	\N	\N	91	NULL	5	NULL	J	\N	UCSF San Pablo Tacachico LL Obraje Nuevo	NULL	NULL	NULL	\N	\N	G
1124	5	8	23	NULL	\N	\N	\N	91	NULL	5	NULL	J	\N	UCSF San Pablo Tacachico LL Valle Mesas	NULL	NULL	NULL	\N	\N	G
1125	5	6	119	NULL	\N	\N	\N	44	NULL	4	NULL	J	\N	UCSF Azacualpa CH	NULL	NULL	NULL	\N	\N	G
1126	5	6	119	NULL	\N	\N	\N	44	NULL	4	NULL	J	\N	UCSF San Francisco Lempa CH	NULL	NULL	NULL	\N	\N	G
1127	4	9	107	NULL	\N	\N	\N	119	NULL	7	NULL	J	\N	UCSF El Rosario CU 	NULL	NULL	NULL	\N	\N	G
1128	4	9	107	NULL	\N	\N	\N	137	NULL	8	NULL	J	\N	UCSF Paraiso de Osorio LP	NULL	NULL	NULL	\N	\N	G
1129	4	9	107	NULL	\N	\N	\N	128	NULL	7	NULL	J	\N	UCSF Santa Cruz Analquito CU	NULL	NULL	NULL	\N	\N	G
1130	4	9	107	NULL	\N	\N	\N	139	NULL	8	NULL	J	\N	UCSF San Emigdio LP	NULL	NULL	NULL	\N	\N	G
1131	4	9	107	NULL	\N	\N	\N	123	NULL	7	NULL	J	\N	UCSF San Cristobal CU	NULL	NULL	NULL	\N	\N	G
1132	4	9	107	NULL	\N	\N	\N	123	NULL	7	NULL	J	\N	UCSF San Cristobal CU Santa Anita	NULL	NULL	NULL	\N	\N	G
1133	4	9	107	NULL	\N	\N	\N	123	NULL	7	NULL	J	\N	UCSF San Cristobal CU La Virgen	NULL	NULL	NULL	\N	\N	G
1134	4	9	107	NULL	\N	\N	\N	120	NULL	7	NULL	J	\N	UCSF Monte San Juan CU	NULL	NULL	NULL	\N	\N	G
1135	4	9	107	NULL	\N	\N	\N	120	NULL	7	NULL	J	\N	UCSF Monte San Juan CU San Nicolas	NULL	NULL	NULL	\N	\N	G
1136	4	9	107	NULL	\N	\N	\N	120	NULL	7	NULL	J	\N	UCSF Monte San Juan CU Soledad	NULL	NULL	NULL	\N	\N	G
1137	4	9	107	NULL	\N	\N	\N	131	NULL	7	NULL	J	\N	UCSF Tenancingo CU	NULL	NULL	NULL	\N	\N	G
1138	4	9	107	NULL	\N	\N	\N	131	NULL	7	NULL	J	\N	UCSF Tenancingo CU Corral Viejo	NULL	NULL	NULL	\N	\N	G
1139	4	9	107	NULL	\N	\N	\N	131	NULL	7	NULL	J	\N	UCSF Tenancingo CU Rosario Tablon	NULL	NULL	NULL	\N	\N	G
1140	4	9	109	NULL	\N	\N	\N	124	NULL	7	NULL	J	\N	UCSF San Jose Guayabal CU Llano Grande	NULL	NULL	NULL	\N	\N	G
1141	4	9	107	NULL	\N	\N	\N	126	NULL	7	NULL	J	\N	UCSF San Rafael Cedros CU Soledad	NULL	NULL	NULL	\N	\N	G
1142	4	9	107	NULL	\N	\N	\N	125	NULL	7	NULL	J	\N	UCSF San Pedro Perulapan CU La Esperanza	NULL	NULL	NULL	\N	\N	G
1143	4	9	107	NULL	\N	\N	\N	125	NULL	7	NULL	J	\N	UCSF San Pedro Perulapan CU San Francisco	NULL	NULL	NULL	\N	\N	G
1144	4	9	107	NULL	\N	\N	\N	118	NULL	7	NULL	J	\N	UCSF El Carmen CU San Antonio	NULL	NULL	NULL	\N	\N	G
1145	4	9	107	NULL	\N	\N	\N	129	NULL	7	NULL	J	\N	UCSF Santa Cruz Michapa CU Buena Vista	NULL	NULL	NULL	\N	\N	G
1376	4	9	107	NULL	\N	\N	\N	130	NULL	7	NULL	J	\N	UCSF Suchitoto CU Laura Lopez	NULL	NULL	NULL	\N	\N	G
1147	4	9	107	NULL	\N	\N	\N	130	NULL	7	NULL	J	\N	UCSF Suchitoto CU Palo Grande	NULL	NULL	NULL	\N	\N	G
1148	4	13	29	NULL	\N	\N	\N	163	NULL	10	NULL	J	\N	UCSF Apastepeque SV	NULL	NULL	NULL	\N	\N	G
1149	4	13	29	NULL	\N	\N	\N	163	NULL	10	NULL	J	\N	UCSF Apastepeque SV Calderas	NULL	NULL	NULL	\N	\N	G
1150	4	13	29	NULL	\N	\N	\N	163	NULL	10	NULL	J	\N	UCSF Apastepeque SV Las Minas	NULL	NULL	NULL	\N	\N	G
1151	4	13	29	NULL	\N	\N	\N	163	NULL	10	NULL	J	\N	UCSF Apastepeque SV San Felipe	NULL	NULL	NULL	\N	\N	G
1152	4	13	29	NULL	\N	\N	\N	163	NULL	10	NULL	J	\N	UCSF Apastepeque SV San Jacinto	NULL	NULL	NULL	\N	\N	G
1153	4	13	29	NULL	\N	\N	\N	163	NULL	10	NULL	J	\N	UCSF Apastepeque SV San Nicolas	NULL	NULL	NULL	\N	\N	G
1154	4	13	29	NULL	\N	\N	\N	163	NULL	10	NULL	J	\N	UCSF Apastepeque SV San Pedro	NULL	NULL	NULL	\N	\N	G
1155	4	13	29	NULL	\N	\N	\N	175	NULL	10	NULL	J	\N	UCSF Verapaz SV -Urbano	NULL	NULL	NULL	\N	\N	G
1156	4	13	29	NULL	\N	\N	\N	175	NULL	10	NULL	J	\N	UCSF Verapaz SV El Carmen	NULL	NULL	NULL	\N	\N	G
1157	4	13	29	NULL	\N	\N	\N	175	NULL	10	NULL	J	\N	UCSF Verapaz SV San Isidro	NULL	NULL	NULL	\N	\N	G
1158	4	13	29	NULL	\N	\N	\N	166	NULL	10	NULL	J	\N	UCSF Santa Clara SV	NULL	NULL	NULL	\N	\N	G
1159	4	13	29	NULL	\N	\N	\N	166	NULL	10	NULL	J	\N	UCSF Santa Clara SV Santa Rosa	NULL	NULL	NULL	\N	\N	G
1160	4	13	29	NULL	\N	\N	\N	169	NULL	10	NULL	J	\N	UCSF San Ildefonso SV	NULL	NULL	NULL	\N	\N	G
1161	4	13	29	NULL	\N	\N	\N	169	NULL	10	NULL	J	\N	UCSF San Ildefonso SV Guachipilín	NULL	NULL	NULL	\N	\N	G
1162	4	13	29	NULL	\N	\N	\N	169	NULL	10	NULL	J	\N	UCSF San Ildefonso SV San Lorenzo	NULL	NULL	NULL	\N	\N	G
1163	4	13	29	NULL	\N	\N	\N	168	NULL	10	NULL	J	\N	UCSF San Esteban Catarina SV	NULL	NULL	NULL	\N	\N	G
1164	4	13	29	NULL	\N	\N	\N	168	NULL	10	NULL	J	\N	UCSF San Esteban Catarina SV San Jacinto la Burrera	NULL	NULL	NULL	\N	\N	G
1165	4	13	29	NULL	\N	\N	\N	170	NULL	10	NULL	J	\N	UCSF San Lorenzo SV	NULL	NULL	NULL	\N	\N	G
1166	4	13	29	NULL	\N	\N	\N	170	NULL	10	NULL	J	\N	UCSF San Lorenzo SV Santa Lucia	NULL	NULL	NULL	\N	\N	G
1167	4	10	25	NULL	\N	\N	\N	149	NULL	8	NULL	J	\N	UCSF Santa Maria Ostuma LP	NULL	NULL	NULL	\N	\N	G
1168	4	10	25	NULL	\N	\N	\N	149	NULL	8	NULL	J	\N	UCSF Santa María Ostuma LP El Carrizal	NULL	NULL	NULL	\N	\N	G
1169	4	10	25	NULL	\N	\N	\N	149	NULL	8	NULL	J	\N	UCSF Santa María Ostuma LP El Chaperno	NULL	NULL	NULL	\N	\N	G
1170	4	10	25	NULL	\N	\N	\N	147	NULL	8	NULL	J	\N	UCSF San Pedro Nonualco LP	NULL	NULL	NULL	\N	\N	G
1171	4	10	25	NULL	\N	\N	\N	147	NULL	8	NULL	J	\N	UCSF San Pedro Nonualco LP San Juan Nuhuistepeque	NULL	NULL	NULL	\N	\N	G
1172	4	10	25	NULL	\N	\N	\N	147	NULL	8	NULL	J	\N	UCSF San Pedro Nonualco LP San Ramón	NULL	NULL	NULL	\N	\N	G
1173	4	10	25	NULL	\N	\N	\N	143	NULL	8	NULL	J	\N	UCSF San Juan Tepezontes LP	NULL	NULL	NULL	\N	\N	G
1174	4	10	25	NULL	\N	\N	\N	145	NULL	8	NULL	J	\N	UCSF San Miguel Tepezontes LP	NULL	NULL	NULL	\N	\N	G
1175	4	10	25	NULL	\N	\N	\N	145	NULL	8	NULL	J	\N	UCSF San Miguel Tepezontes LP Soledad Las Flores	NULL	NULL	NULL	\N	\N	G
1176	4	10	25	NULL	\N	\N	\N	138	NULL	8	NULL	J	\N	UCSF San Antonio Masahuat LP	NULL	NULL	NULL	\N	\N	G
1177	4	10	25	NULL	\N	\N	\N	138	NULL	8	NULL	J	\N	UCSF San Antonio Masahuat LP La Loma	NULL	NULL	NULL	\N	\N	G
1178	4	10	25	NULL	\N	\N	\N	151	NULL	8	NULL	J	\N	UCSF Tapalhuaca LP	NULL	NULL	NULL	\N	\N	G
1179	2	17	63	NULL	\N	\N	\N	200	NULL	12	NULL	J	\N	UCSF Ciudad Barrios SM	NULL	NULL	NULL	\N	\N	G
1180	2	17	63	NULL	\N	\N	\N	200	NULL	12	NULL	J	\N	UCSF Ciudad Barrios SM Guanaste	NULL	NULL	NULL	\N	\N	G
1181	2	17	63	NULL	\N	\N	\N	200	NULL	12	NULL	J	\N	UCSF Ciudad Barrios SM El Porvenir	NULL	NULL	NULL	\N	\N	G
1182	2	17	63	NULL	\N	\N	\N	199	NULL	12	NULL	J	\N	UCSF Ciudad Barrios SM San Matias	NULL	NULL	NULL	\N	\N	G
1183	2	17	63	NULL	\N	\N	\N	200	NULL	12	NULL	J	\N	UCSF Ciudad Barrios SM San Cristobal	NULL	NULL	NULL	\N	\N	G
1184	2	17	63	NULL	\N	\N	\N	200	NULL	12	NULL	J	\N	UCSF Ciudad Barrios SM Llano el Angel	NULL	NULL	NULL	\N	\N	G
1185	2	17	63	NULL	\N	\N	\N	217	NULL	12	NULL	J	\N	UCSF Sesori SM El Tablon	NULL	NULL	NULL	\N	\N	G
1186	2	17	63	NULL	\N	\N	\N	217	NULL	12	NULL	J	\N	UCSF Sesori SM San Sebastían	NULL	NULL	NULL	\N	\N	G
1187	2	17	63	NULL	\N	\N	\N	217	NULL	12	NULL	J	\N	UCSF Sesori SM Managuara	NULL	NULL	NULL	\N	\N	G
1188	2	17	63	NULL	\N	\N	\N	217	NULL	12	NULL	J	\N	UCSF Sesori SM	NULL	NULL	NULL	\N	\N	G
1189	2	17	63	NULL	\N	\N	\N	202	NULL	12	NULL	J	\N	UCSF Chapeltique SM La Trinidad (El Rodeo)	NULL	NULL	NULL	\N	\N	G
1190	2	14	79	NULL	\N	\N	\N	187	NULL	11	NULL	J	\N	UCSF Nueva Granada US-Urbano	NULL	NULL	NULL	\N	\N	G
1191	2	14	79	NULL	\N	\N	\N	187	NULL	11	NULL	J	\N	UCSF Nueva Granada US Nuevo Gualcho	NULL	NULL	NULL	\N	\N	G
1192	2	14	79	NULL	\N	\N	\N	182	NULL	11	NULL	J	\N	UCSF Estanzuelas US-Urbano	NULL	NULL	NULL	\N	\N	G
1193	2	14	79	NULL	\N	\N	\N	182	NULL	11	NULL	J	\N	UCSF Estanzuelas US Escarbadero	NULL	NULL	NULL	\N	\N	G
1194	2	14	79	NULL	\N	\N	\N	182	NULL	11	NULL	J	\N	UCSF Estanzuelas US la Cruz	NULL	NULL	NULL	\N	\N	G
1195	2	14	79	NULL	\N	\N	\N	186	NULL	11	NULL	J	\N	UCSF Mercedes Umaña US-Urbano	NULL	NULL	NULL	\N	\N	G
1196	2	14	79	NULL	\N	\N	\N	186	NULL	11	NULL	J	\N	UCSF Mercedes Umaña US La Puerta	NULL	NULL	NULL	\N	\N	G
1197	2	14	79	NULL	\N	\N	\N	186	NULL	11	NULL	J	\N	UCSF Mercedes Umaña US Santa Anita	NULL	NULL	NULL	\N	\N	G
1198	2	14	79	NULL	\N	\N	\N	186	NULL	11	NULL	J	\N	UCSF Mercedes Umaña US Los Horcones	NULL	NULL	NULL	\N	\N	G
1199	2	14	79	NULL	\N	\N	\N	177	NULL	11	NULL	J	\N	UCSF Berlin US- Urbano 1	NULL	NULL	NULL	\N	\N	G
1200	2	14	79	NULL	\N	\N	\N	177	NULL	11	NULL	J	\N	UCSF Berlin US -Urbano 2	NULL	NULL	NULL	\N	\N	G
1201	2	14	79	NULL	\N	\N	\N	177	NULL	11	NULL	J	\N	UCSF Berlin US San José	NULL	NULL	NULL	\N	\N	G
1202	2	14	79	NULL	\N	\N	\N	177	NULL	11	NULL	J	\N	UCSF Berlin US Talpetate	NULL	NULL	NULL	\N	\N	G
1203	2	14	79	NULL	\N	\N	\N	177	NULL	11	NULL	J	\N	UCSF Berlin US Virginia	NULL	NULL	NULL	\N	\N	G
1204	2	14	79	NULL	\N	\N	\N	177	NULL	11	NULL	J	\N	UCSF Berlin US San Isidro	NULL	NULL	NULL	\N	\N	G
1205	2	14	79	NULL	\N	\N	\N	176	NULL	11	NULL	J	\N	UCSF Alegria US- Urbano	NULL	NULL	NULL	\N	\N	G
1206	2	14	79	NULL	\N	\N	\N	176	NULL	11	NULL	J	\N	UCSF Alegría US Las Casitas	NULL	NULL	NULL	\N	\N	G
1207	2	14	79	NULL	\N	\N	\N	176	NULL	11	NULL	J	\N	UCSF Alegria US El Quebracho	NULL	NULL	NULL	\N	\N	G
1208	2	14	79	NULL	\N	\N	\N	176	NULL	11	NULL	J	\N	UCSF Alegría US El Zapotillo	NULL	NULL	NULL	\N	\N	G
1209	2	14	79	NULL	\N	\N	\N	197	NULL	11	NULL	J	\N	UCSF Tecapan US-Urbano	NULL	NULL	NULL	\N	\N	G
1210	2	14	79	NULL	\N	\N	\N	197	NULL	11	NULL	J	\N	UCSF Tecapan US Gualache	NULL	NULL	NULL	\N	\N	G
1211	2	14	79	NULL	\N	\N	\N	197	NULL	11	NULL	J	\N	UCSF Tecapan US Chapetones	NULL	NULL	NULL	\N	\N	G
1212	2	14	79	NULL	\N	\N	\N	188	NULL	11	NULL	J	\N	UCSF Ozatlan US-Urbano	NULL	NULL	NULL	\N	\N	G
1213	2	14	79	NULL	\N	\N	\N	188	NULL	11	NULL	J	\N	UCSF Ozatlan US Las Trancas	NULL	NULL	NULL	\N	\N	G
1214	2	14	79	NULL	\N	\N	\N	188	NULL	11	NULL	J	\N	UCSF Ozatlan US La Poza	NULL	NULL	NULL	\N	\N	G
1215	2	14	79	NULL	\N	\N	\N	188	NULL	11	NULL	J	\N	UCSF Ozatlan US La Breña	NULL	NULL	NULL	\N	\N	G
1216	2	14	79	NULL	\N	\N	\N	190	NULL	11	NULL	J	\N	UCSF San Agustín US-Urbano	NULL	NULL	NULL	\N	\N	G
1217	2	14	79	NULL	\N	\N	\N	190	NULL	11	NULL	J	\N	UCSF San Agustín US El Eucalipto	NULL	NULL	NULL	\N	\N	G
1218	2	14	79	NULL	\N	\N	\N	190	NULL	11	NULL	J	\N	UCSF San Agustín US El Caulotal	NULL	NULL	NULL	\N	\N	G
1219	2	14	79	NULL	\N	\N	\N	194	NULL	11	NULL	J	\N	UCSF San Francisco Javier US-Urbano	NULL	NULL	NULL	\N	\N	G
1220	2	14	79	NULL	\N	\N	\N	194	NULL	11	NULL	J	\N	UCSF San Francisco Javier US Los Hornos	NULL	NULL	NULL	\N	\N	G
1221	2	14	79	NULL	\N	\N	\N	194	NULL	11	NULL	J	\N	UCSF San Francisco Javier US La Cruz	NULL	NULL	NULL	\N	\N	G
1222	2	14	79	NULL	\N	\N	\N	193	NULL	11	NULL	J	\N	UCSF Santa Elena US-Urbano	NULL	NULL	NULL	\N	\N	G
1223	2	14	79	NULL	\N	\N	\N	193	NULL	11	NULL	J	\N	UCSF Santa Elena US El Nanzal 1	NULL	NULL	NULL	\N	\N	G
1224	2	14	79	NULL	\N	\N	\N	193	NULL	11	NULL	J	\N	UCSF Santa Elena US El Volcan	NULL	NULL	NULL	\N	\N	G
1225	2	14	79	NULL	\N	\N	\N	193	NULL	11	NULL	J	\N	UCSF Santa Elena US Joya Ancha Arriba	NULL	NULL	NULL	\N	\N	G
1226	2	14	79	NULL	\N	\N	\N	193	NULL	11	NULL	J	\N	UCSF Santa Elena US Amate Norte	NULL	NULL	NULL	\N	\N	G
1227	2	14	79	NULL	\N	\N	\N	213	NULL	12	NULL	J	\N	UCSF San Jorge SM-Urbano	NULL	NULL	NULL	\N	\N	G
1228	2	14	79	NULL	\N	\N	\N	213	NULL	12	NULL	J	\N	UCSF San Jorge SM San Julian	NULL	NULL	NULL	\N	\N	G
1229	2	14	79	NULL	\N	\N	\N	213	NULL	12	NULL	J	\N	UCSF San Jorge US Joya de Ventura	NULL	NULL	NULL	\N	\N	G
1230	2	14	79	NULL	\N	\N	\N	185	NULL	11	NULL	J	\N	UCSF Jucuaran US-Urbano	NULL	NULL	NULL	\N	\N	G
1231	2	14	79	NULL	\N	\N	\N	185	NULL	11	NULL	J	\N	UCSF Jucuaran US El Jutal	NULL	NULL	NULL	\N	\N	G
1232	2	14	79	NULL	\N	\N	\N	185	NULL	11	NULL	J	\N	UCSF Jucuaran US El Espino	NULL	NULL	NULL	\N	\N	G
1233	2	14	79	NULL	\N	\N	\N	185	NULL	11	NULL	J	\N	UCSF Jucuaran US El Zapote	NULL	NULL	NULL	\N	\N	G
1234	2	14	79	NULL	\N	\N	\N	179	NULL	11	NULL	J	\N	UCSF Concepción Batres US -Urbano	NULL	NULL	NULL	\N	\N	G
1235	2	14	79	NULL	\N	\N	\N	179	NULL	11	NULL	J	\N	UCSF Concepción Batres US San Felipe	NULL	NULL	NULL	\N	\N	G
1236	2	14	79	NULL	\N	\N	\N	179	NULL	11	NULL	J	\N	UCSF Concepción Batres US Hacienda Nueva	NULL	NULL	NULL	\N	\N	G
1237	2	14	79	NULL	\N	\N	\N	179	NULL	11	NULL	J	\N	UCSF Concepción Batres US El Cañal	NULL	NULL	NULL	\N	\N	G
1238	2	14	79	NULL	\N	\N	\N	189	NULL	11	NULL	J	\N	UCSF Puerto el Triunfo US La Palmera	NULL	NULL	NULL	\N	\N	G
1239	2	14	79	NULL	\N	\N	\N	181	NULL	11	NULL	J	\N	UCSF Ereguayquin US Analco	NULL	NULL	NULL	\N	\N	G
1240	1	1	1	NULL	\N	\N	\N	6	NULL	1	NULL	J	\N	UCSF Guaymango AH-Urbano	NULL	NULL	NULL	\N	\N	G
1241	1	1	1	NULL	\N	\N	\N	6	NULL	1	NULL	J	\N	UCSF Guaymango AH Platanares	NULL	NULL	NULL	\N	\N	G
1242	1	1	1	NULL	\N	\N	\N	6	NULL	1	NULL	J	\N	UCSF Guaymango AH El Escalón	NULL	NULL	NULL	\N	\N	G
1243	1	1	1	NULL	\N	\N	\N	6	NULL	1	NULL	J	\N	UCSF Guaymango AH Morro Grande	NULL	NULL	NULL	\N	\N	G
1244	1	1	1	NULL	\N	\N	\N	6	NULL	1	NULL	J	\N	UCSF Guaymango AH San Martín	NULL	NULL	NULL	\N	\N	G
1245	1	1	11	NULL	\N	\N	\N	6	NULL	1	NULL	J	\N	UCSF Guaymango AH Cauta Arriba	NULL	NULL	NULL	\N	\N	G
1246	1	1	1	NULL	\N	\N	\N	7	NULL	1	NULL	J	\N	UCSF Jujutla AH-Urbano	NULL	NULL	NULL	\N	\N	G
1247	1	1	1	NULL	\N	\N	\N	7	NULL	1	NULL	J	\N	UCSF Jujutla AH Tihuicha	NULL	NULL	NULL	\N	\N	G
1248	1	1	1	NULL	\N	\N	\N	7	NULL	1	NULL	J	\N	UCSF Jujutla AH Barra de Santiago	NULL	NULL	NULL	\N	\N	G
1249	1	1	1	NULL	\N	\N	\N	7	NULL	1	NULL	J	\N	UCSF Jujutla AH Falla	NULL	NULL	NULL	\N	\N	G
1250	1	1	1	NULL	\N	\N	\N	7	NULL	1	NULL	J	\N	UCSF Jujutla AH Guayapa Abajo	NULL	NULL	NULL	\N	\N	G
1251	1	1	1	NULL	\N	\N	\N	7	NULL	1	NULL	J	\N	UCSF Jujutla AH Santa Rosa Guayapa	NULL	NULL	NULL	\N	\N	G
1252	1	1	1	NULL	\N	\N	\N	7	NULL	1	NULL	J	\N	UCSF Jujutla AH San José El Naranjo	NULL	NULL	NULL	\N	\N	G
1253	1	1	1	NULL	\N	\N	\N	7	NULL	1	NULL	J	\N	UCSF Jujutla AH San Antonio	NULL	NULL	NULL	\N	\N	G
1254	1	1	1	NULL	\N	\N	\N	10	NULL	1	NULL	J	\N	UCSF San Pedro Puxtla AH Los Aguirre	NULL	NULL	NULL	\N	\N	G
1255	1	1	1	NULL	\N	\N	\N	10	NULL	1	NULL	J	\N	UCSF San Pedro Puxtla AH Los Chacón	NULL	NULL	NULL	\N	\N	G
1256	1	1	1	NULL	\N	\N	\N	10	NULL	1	NULL	J	\N	UCSF San Pedro Puxtla AH 	NULL	NULL	NULL	\N	\N	G
1257	1	1	1	NULL	\N	\N	\N	11	NULL	1	NULL	J	\N	UCSF Tacuba AH-Urbano	NULL	NULL	NULL	\N	\N	G
1258	1	1	1	NULL	\N	\N	\N	11	NULL	1	NULL	J	\N	UCSF Tacuba AH San Rafael	NULL	NULL	NULL	\N	\N	G
1259	1	1	1	NULL	\N	\N	\N	11	NULL	1	NULL	J	\N	UCSF Tacuba AH Las Palmeras	NULL	NULL	NULL	\N	\N	G
1260	1	1	1	NULL	\N	\N	\N	11	NULL	1	NULL	J	\N	UCSF Tacuba AH Chaguite	NULL	NULL	NULL	\N	\N	G
1261	1	1	1	NULL	\N	\N	\N	11	NULL	1	NULL	J	\N	UCSF Tacuba AH El Jicaro	NULL	NULL	NULL	\N	\N	G
1262	1	1	1	NULL	\N	\N	\N	11	NULL	1	NULL	J	\N	UCSF Tacuba AH El Sincuyo	NULL	NULL	NULL	\N	\N	G
1263	1	1	1	NULL	\N	\N	\N	11	NULL	1	NULL	J	\N	UCSF Tacuba AH La Magdalena	NULL	NULL	NULL	\N	\N	G
1264	1	1	1	NULL	\N	\N	\N	11	NULL	1	NULL	J	\N	UCSF Tacuba AH Pandiadura	NULL	NULL	NULL	\N	\N	G
1265	1	1	1	NULL	\N	\N	\N	11	NULL	1	NULL	J	\N	UCSF Tacuba AH Valle la Puerta	NULL	NULL	NULL	\N	\N	G
1266	1	1	1	NULL	\N	\N	\N	11	NULL	1	NULL	J	\N	UCSF Tacuba AH La Escuela de El Rodeo	NULL	NULL	NULL	\N	\N	G
1267	1	1	10	NULL	\N	\N	\N	1	NULL	1	NULL	J	\N	UCSF Ahuachapan AH Ashapuco	NULL	NULL	NULL	\N	\N	G
1268	1	1	10	NULL	\N	\N	\N	1	NULL	1	NULL	J	\N	UCSF Ahuachapan AH El Barro	NULL	NULL	NULL	\N	\N	G
1269	1	1	10	NULL	\N	\N	\N	1	NULL	1	NULL	J	\N	UCSF Ahuachapan AH Llano la Laguna	NULL	NULL	NULL	\N	\N	G
1270	1	1	1	NULL	\N	\N	\N	2	NULL	1	NULL	J	\N	UCSF Apaneca AH Quezalapa	NULL	NULL	NULL	\N	\N	G
1271	1	5	20	NULL	\N	\N	\N	28	NULL	3	NULL	J	\N	UCSF Caluco SO Plan de Amayo	NULL	NULL	NULL	\N	\N	G
1272	1	5	20	NULL	\N	\N	\N	28	NULL	3	NULL	J	\N	UCSF Caluco SO El Zapote	NULL	NULL	NULL	\N	\N	G
1273	1	5	18	NULL	\N	\N	\N	28	NULL	3	NULL	J	\N	UCSF Caluco SO - Urbano	NULL	NULL	NULL	\N	\N	G
1274	1	5	18	NULL	\N	\N	\N	29	NULL	3	NULL	J	\N	UCSF Cuisnahuat SO Agua Shuca	NULL	NULL	NULL	\N	\N	G
1275	1	5	18	NULL	\N	\N	\N	29	NULL	3	NULL	J	\N	UCSF Cuisnahuat SO Coquiama	NULL	NULL	NULL	\N	\N	G
1276	1	5	18	NULL	\N	\N	\N	29	NULL	3	NULL	J	\N	UCSF Cuisnahuat SO San Lucas	NULL	NULL	NULL	\N	\N	G
1277	1	5	18	NULL	\N	\N	\N	29	NULL	3	NULL	J	\N	UCSF Cuisnahuat SO-Urbano	NULL	NULL	NULL	\N	\N	G
1278	1	5	18	NULL	\N	\N	\N	38	NULL	3	NULL	J	\N	UCSF Santa Catarina Masahuat SO El Guayabo	NULL	NULL	NULL	\N	\N	G
1279	1	5	18	NULL	\N	\N	\N	38	NULL	3	NULL	J	\N	UCSF Santa Catarina Masahuat SO Tres Caminos	NULL	NULL	NULL	\N	\N	G
1280	1	5	18	NULL	\N	\N	\N	38	NULL	3	NULL	J	\N	UCSF Santa Catarina Mashuat SO- Urbano	NULL	NULL	NULL	\N	\N	G
1281	1	5	18	NULL	\N	\N	\N	30	NULL	3	NULL	J	\N	UCSF Santa Isabel Ishuatan SO- Urbano	NULL	NULL	NULL	\N	\N	G
1282	1	5	18	NULL	\N	\N	\N	30	NULL	3	NULL	J	\N	UCSF Santa Isabel Ishuatan SO Las Piedras	NULL	NULL	NULL	\N	\N	G
1283	1	5	18	NULL	\N	\N	\N	30	NULL	3	NULL	J	\N	UCSF Santa Isabel Ishuatan SO Acachapa	NULL	NULL	NULL	\N	\N	G
1284	1	5	18	NULL	\N	\N	\N	39	NULL	3	NULL	J	\N	UCSF Santo Domingo de Guzman SO El Carrizal	NULL	NULL	NULL	\N	\N	G
1285	1	5	18	NULL	\N	\N	\N	39	NULL	3	NULL	J	\N	UCSF Santo Domingo de Guzman SO-Urbano	NULL	NULL	NULL	\N	\N	G
1286	1	2	2	NULL	\N	\N	\N	14	NULL	2	NULL	J	\N	UCSF Coatepeque Las Piletas	NULL	NULL	NULL	\N	\N	G
1287	1	2	13	NULL	\N	\N	\N	14	NULL	2	NULL	J	\N	UCSF Coatepeque SA Conacaste	NULL	NULL	NULL	\N	\N	G
1288	6	25	112	NULL	\N	\N	\N	109	NULL	6	NULL	J	\N	UCSF San Martin SS Santa Gertrudis	NULL	NULL	NULL	\N	\N	G
1289	6	24	61	NULL	\N	\N	\N	110	NULL	6	NULL	J	\N	UCSF San Salvador SS Comunidad Modelo 3	NULL	NULL	NULL	\N	\N	G
1290	6	24	60	NULL	\N	\N	\N	110	NULL	6	NULL	J	\N	UCSF San Salvador SS San Cristobal	NULL	NULL	NULL	\N	\N	G
1291	5	8	24	NULL	\N	\N	\N	83	NULL	5	NULL	L	\N	UCSFE Puerto La Libertad LL	NULL	NULL	NULL	\N	\N	G
1292	5	8	22	NULL	\N	\N	\N	77	NULL	5	NULL	L	\N	UCSFE Colón LL Ciudad Mujer	NULL	NULL	NULL	\N	\N	G
1293	4	9	110	NULL	\N	\N	\N	125	NULL	7	NULL	L	\N	UCSFE San Pedro perulapan CU	NULL	NULL	NULL	\N	\N	G
1294	4	13	29	NULL	\N	\N	\N	175	NULL	10	NULL	L	\N	UCSFE Verapaz SV	NULL	NULL	NULL	\N	\N	G
1295	4	10	27	NULL	\N	\N	\N	136	NULL	8	NULL	L	\N	UCSFE Olocuilta LP	NULL	NULL	NULL	\N	\N	G
1296	2	17	88	NULL	\N	\N	\N	217	NULL	12	NULL	L	\N	UCSFE Sesori SM	NULL	NULL	NULL	\N	\N	G
1297	2	14	84	NULL	\N	\N	\N	177	NULL	11	NULL	L	\N	UCSFE Berlín US	NULL	NULL	NULL	\N	\N	G
1298	2	14	125	NULL	\N	\N	\N	179	NULL	11	NULL	L	\N	UCSFE Concepción Batres US	NULL	NULL	NULL	\N	\N	G
1299	1	1	10	NULL	\N	\N	\N	6	NULL	1	NULL	L	\N	UCSFE Guaymango AH	NULL	NULL	NULL	\N	\N	G
1300	1	1	11	NULL	\N	\N	\N	11	NULL	1	NULL	L	\N	UCSFE Tacuba AH	NULL	NULL	NULL	\N	\N	G
1301	1	5	19	NULL	\N	\N	\N	31	NULL	3	NULL	L	\N	UCSFE Izalco	NULL	NULL	NULL	\N	\N	G
1302	1	5	18	NULL	\N	\N	\N	41	NULL	3	NULL	L	\N	UCSFE Sonzacate SO	NULL	NULL	NULL	\N	\N	G
1303	6	25	112	NULL	\N	\N	\N	109	NULL	6	NULL	L	\N	UCSFE San Martín SS	NULL	NULL	NULL	\N	\N	G
1304	6	24	60	NULL	\N	\N	\N	110	NULL	6	NULL	L	\N	UCSFE San Salvador SS San Jacinto	NULL	NULL	NULL	\N	\N	G
1305	4	9	108	NULL	\N	\N	\N	116	NULL	7	NULL	J	\N	UCSF Candelaria CU (ECOSF parcial)	NULL	NULL	NULL	\N	\N	G
1306	4	9	108	NULL	\N	\N	\N	116	NULL	7	NULL	J	\N	UCSF Candelaria CU El Rosario (ECOSF parcial)	NULL	NULL	NULL	\N	\N	G
1307	4	9	108	NULL	\N	\N	\N	116	NULL	7	NULL	J	\N	UCSF Candlaria CU Concepción (ECOSF parcial)	NULL	NULL	NULL	\N	\N	G
1308	4	9	108	NULL	\N	\N	\N	116	NULL	7	NULL	J	\N	UCSF Candelaria CU Miraflores Arriba (ECOSF parcial)	NULL	NULL	NULL	\N	\N	G
1309	4	9	109	NULL	\N	\N	\N	127	NULL	7	NULL	J	\N	UCSF San Ramon CU (ECOSF parcial)	NULL	NULL	NULL	\N	\N	G
1310	4	9	110	NULL	\N	\N	\N	127	NULL	7	NULL	J	\N	UCSF San Ramón CU Santa Isabel (ECOSF parcial)	NULL	NULL	NULL	\N	\N	G
1311	4	9	109	NULL	\N	\N	\N	124	NULL	7	NULL	J	\N	UCSF San José Guayabal CU (ECOSF parcial)	NULL	NULL	NULL	\N	\N	G
1312	4	9	109	NULL	\N	\N	\N	124	NULL	7	NULL	J	\N	UCSF San José Guayabal CU La Cruz (ECOSF parcial)	NULL	NULL	NULL	\N	\N	G
1313	4	9	109	NULL	\N	\N	\N	124	NULL	7	NULL	J	\N	UCSF San José Guayabal CU Animas (ECOSF parcial)	NULL	NULL	NULL	\N	\N	G
1314	4	9	107	NULL	\N	\N	\N	126	NULL	7	NULL	J	\N	UCSF San Rafael Cedros CU (ECOSF parcial)	NULL	NULL	NULL	\N	\N	G
1315	4	9	107	NULL	\N	\N	\N	126	NULL	7	NULL	J	\N	UCSF San Rafael Cedros CU Cerro Colorado (ECOSF parcial)	NULL	NULL	NULL	\N	\N	G
1316	4	9	107	NULL	\N	\N	\N	126	NULL	7	NULL	J	\N	UCSF San Rafael Cedros CU Jiboa (ECOSF parcial)	NULL	NULL	NULL	\N	\N	G
1317	4	9	107	NULL	\N	\N	\N	126	NULL	7	NULL	J	\N	UCSF San Rafael Cedros CU Palacios (ECOSF parcial)	NULL	NULL	NULL	\N	\N	G
1318	4	9	107	NULL	\N	\N	\N	118	NULL	7	NULL	J	\N	UCSF El Carmen CU (ECOSF parcial)	NULL	NULL	NULL	\N	\N	G
1319	4	9	107	NULL	\N	\N	\N	118	NULL	7	NULL	J	\N	UCSF El Carmen CU San Sebastian (ECOSF parcial)	NULL	NULL	NULL	\N	\N	G
1320	4	9	107	NULL	\N	\N	\N	118	NULL	7	NULL	J	\N	UCSF El Carmen CU Santa Lucía (ECOSF parcial)	NULL	NULL	NULL	\N	\N	G
1321	4	9	107	NULL	\N	\N	\N	118	NULL	7	NULL	J	\N	UCSF El Carmen CU Candelaria (ECOSF parcial)	NULL	NULL	NULL	\N	\N	G
1322	4	9	107	NULL	\N	\N	\N	121	NULL	7	NULL	J	\N	UCSF Oratorio Concepción CU (ECOSF parcial)	NULL	NULL	NULL	\N	\N	G
1323	4	10	25	NULL	\N	\N	\N	152	NULL	8	NULL	J	\N	UCSF Zacatecoluca LP Santa Lucía (ECOSF parcial)	NULL	NULL	NULL	\N	\N	G
1324	4	10	25	NULL	\N	\N	\N	150	NULL	8	NULL	J	\N	UCSF Santiago Nonualco LP San José Abajo (ECOSF parcial)	NULL	NULL	NULL	\N	\N	G
1325	4	10	25	NULL	\N	\N	\N	153	NULL	8	NULL	J	\N	UCSF San Luis la Herradura LP El Zapote (ECOSF parcial)	NULL	NULL	NULL	\N	\N	G
1326	4	10	25	NULL	\N	\N	\N	146	NULL	8	NULL	J	\N	UCSF San Pedro Masahuat LP El Achiotal (ECOSF parcial)	NULL	NULL	NULL	\N	\N	G
1327	4	10	25	NULL	\N	\N	\N	146	NULL	8	NULL	J	\N	UCSF San Pedro Masahuat LP Las Marías (ECOSF parcial)	NULL	NULL	NULL	\N	\N	G
1328	4	10	26	NULL	\N	\N	\N	144	NULL	8	NULL	J	\N	UCSF San Luis Talpa LP El Pimental (ECOSF parcial)	NULL	NULL	NULL	\N	\N	G
1329	4	10	27	NULL	\N	\N	\N	142	NULL	8	NULL	J	\N	UCSF San Juan Talpa LP (ECOSF parcial)	NULL	NULL	NULL	\N	\N	G
1330	4	10	25	NULL	\N	\N	\N	142	NULL	8	NULL	J	\N	UCSF San Juan Talpa LP Veracruz (ECOSF parcial)	NULL	NULL	NULL	\N	\N	G
1331	4	10	25	NULL	\N	\N	\N	133	NULL	8	NULL	J	\N	UCSF Rosario La Paz LP El Nao Amatepe (ECOSF parcial)	NULL	NULL	NULL	\N	\N	G
1332	4	10	25	NULL	\N	\N	\N	132	NULL	8	NULL	J	\N	UCSF Cuyultitan LP (ECOSF parcial)	NULL	NULL	NULL	\N	\N	G
1333	4	10	25	NULL	\N	\N	\N	132	NULL	8	NULL	J	\N	UCSF Cuyultitan LP San Antonio (ECOSF parcial)	NULL	NULL	NULL	\N	\N	G
1334	4	10	27	NULL	\N	\N	\N	136	NULL	8	NULL	J	\N	UCSF Olocuilta LP San Sebastían (ECOSF parcial)	NULL	NULL	NULL	\N	\N	G
1335	4	10	26	NULL	\N	\N	\N	140	NULL	8	NULL	J	\N	UCSF San Francisco Chinameca LP San José La Montaña (ECOSF parcial)	NULL	NULL	NULL	\N	\N	G
1336	4	10	25	NULL	\N	\N	\N	140	NULL	8	NULL	J	\N	UCSF San Francisco Chinameca LP Candelaria (ECOSF parcial)	NULL	NULL	NULL	\N	\N	G
1337	4	10	25	NULL	\N	\N	\N	150	NULL	8	NULL	J	\N	UCSF Santiago Nonualco LP San José La Paz (ECOSF parcial)	NULL	NULL	NULL	\N	\N	G
1338	4	10	25	NULL	\N	\N	\N	140	NULL	8	NULL	J	\N	UCSF San Francisco Chinameca LP	NULL	NULL	NULL	\N	\N	G
1339	4	10	25	NULL	\N	\N	\N	150	NULL	8	NULL	J	\N	UCSF Santiago Nonualco LP San Sebastían Arriba (ECOSF parcial)	NULL	NULL	NULL	\N	\N	G
1340	4	10	25	NULL	\N	\N	\N	144	NULL	8	NULL	J	\N	UCSF San Luis Talpa LP Hacienda Amatepe (ECOSF parcial)	NULL	NULL	NULL	\N	\N	G
1341	4	10	25	NULL	\N	\N	\N	152	NULL	8	NULL	J	\N	UCSF Zacatecoluca LP San Faustino (ECOSF parcial)	NULL	NULL	NULL	\N	\N	G
1342	4	10	25	NULL	\N	\N	\N	152	NULL	8	NULL	J	\N	UCSF Zacatecoluca LP Azacualpa (ECOSF parcial)	NULL	NULL	NULL	\N	\N	G
1343	4	10	25	NULL	\N	\N	\N	136	NULL	8	NULL	J	\N	UCSF Olocuilta LP Santa Lucía Orcoyo (ECOSF parcial)	NULL	NULL	NULL	\N	\N	G
1344	4	10	25	NULL	\N	\N	\N	148	NULL	8	NULL	J	\N	UCSF San Rafael Obrajuelo LP La Palma (ECOSF parcial)	NULL	NULL	NULL	\N	\N	G
1345	4	10	25	NULL	\N	\N	\N	148	NULL	8	NULL	J	\N	UCSF San Rafael Obrajuelo LP San Pedro Martir (ECOSF parcial)	NULL	NULL	NULL	\N	\N	G
1346	4	12	78	NULL	\N	\N	\N	159	NULL	9	NULL	J	\N	UCSF Sensuntepeque CA San Gregoria (ECOSF parcial)	NULL	NULL	NULL	\N	\N	G
1347	4	12	78	NULL	\N	\N	\N	159	NULL	9	NULL	J	\N	UCSF Sensuntepeque CA San Lorenzo (ECOSF parcial)	NULL	NULL	NULL	\N	\N	G
1348	4	12	4	NULL	\N	\N	\N	159	NULL	9	NULL	J	\N	UCSF Sensuntepeque CA Chunte (ECOSF parcial)	NULL	NULL	NULL	\N	\N	G
1349	4	12	78	NULL	\N	\N	\N	159	NULL	9	NULL	J	\N	UCSF Sensuntepeque CA Rio Grande (ECOSF parcial)	NULL	NULL	NULL	\N	\N	G
1350	4	12	78	NULL	\N	\N	\N	159	NULL	9	NULL	J	\N	UCSF Sensuntepeque CA Cuyantepeque (ECOSF parcial)	NULL	NULL	NULL	\N	\N	G
1351	4	12	78	NULL	\N	\N	\N	159	NULL	9	NULL	J	\N	UCSF Sensuntepeque CA Copinolapa (ECOSF parcial)	NULL	NULL	NULL	\N	\N	G
1352	4	12	78	NULL	\N	\N	\N	159	NULL	9	NULL	J	\N	UCSF Sensuntepeque CA San Nicolas (ECOSF parcial)	NULL	NULL	NULL	\N	\N	G
1353	4	12	78	NULL	\N	\N	\N	155	NULL	9	NULL	J	\N	UCSF Guacotecti CA (ECOSF parcial)	NULL	NULL	NULL	\N	\N	G
1354	4	12	4	NULL	\N	\N	\N	155	NULL	9	NULL	J	\N	UCSF Guacotecti CA Agua Zarca (ECOSF parcial)	NULL	NULL	NULL	\N	\N	G
1355	4	12	4	NULL	\N	\N	\N	158	NULL	9	NULL	J	\N	UCSF San Isidro CA (ECOSF parcial)	NULL	NULL	NULL	\N	\N	G
1356	4	12	5	NULL	\N	\N	\N	158	NULL	9	NULL	J	\N	UCSF San Isidro CA Potrero de Batres (ECOSF parcial)	NULL	NULL	NULL	\N	\N	G
1357	4	12	4	NULL	\N	\N	\N	158	NULL	9	NULL	J	\N	UCSF San Isidro CA San Francisco (ECOSF parcial)	NULL	NULL	NULL	\N	\N	G
1358	4	13	29	NULL	\N	\N	\N	165	NULL	10	NULL	J	\N	UCSF San Cayetano Istepeque SV (ECOSF parcial)	NULL	NULL	NULL	\N	\N	G
1359	4	13	29	NULL	\N	\N	\N	165	NULL	10	NULL	J	\N	UCSF San Cayetano Istepeque SV Candelaria (ECOSF parcial)	NULL	NULL	NULL	\N	\N	G
1360	4	13	29	NULL	\N	\N	\N	174	NULL	10	NULL	J	\N	UCSF Tepetitan SV (ECOSF parcial)	NULL	NULL	NULL	\N	\N	G
1361	4	13	30	NULL	\N	\N	\N	134	NULL	8	NULL	J	\N	UCSF Jerusalen LP (ECOSF parcial)	NULL	NULL	NULL	\N	\N	G
1362	4	13	29	NULL	\N	\N	\N	135	NULL	8	NULL	J	\N	UCSF Mercedes la Ceiba LP (ECOSF parcial)	NULL	NULL	NULL	\N	\N	G
1363	4	13	30	NULL	\N	\N	\N	173	NULL	10	NULL	J	\N	UCSF Tecoluca SV San Carlos Lempa (ECOSF parcial)	NULL	NULL	NULL	\N	\N	G
1364	4	13	29	NULL	\N	\N	\N	173	NULL	10	NULL	J	\N	UCSF Tecoluca SV Puerto Nuevo (ECOSF parcial)	NULL	NULL	NULL	\N	\N	G
1365	4	13	29	NULL	\N	\N	\N	173	NULL	10	NULL	J	\N	UCSF Tecoluca SV San Nicolas Lempa (ECOSF parcial)	NULL	NULL	NULL	\N	\N	G
1366	4	13	29	NULL	\N	\N	\N	173	NULL	10	NULL	J	\N	UCSF Tecoluca SV El Carao (ECOSF parcial)	NULL	NULL	NULL	\N	\N	G
1367	4	13	29	NULL	\N	\N	\N	173	NULL	10	NULL	J	\N	UCSF Tecoluca SV Santa Cruz Paraiso (ECOSF parcial)	NULL	NULL	NULL	\N	\N	G
1368	4	13	29	NULL	\N	\N	\N	172	NULL	10	NULL	J	\N	UCSF San Vicente SV Guajoyo (ECOSF parcial)	NULL	NULL	NULL	\N	\N	G
1369	4	13	29	NULL	\N	\N	\N	172	NULL	10	NULL	J	\N	UCSF San Vicente SV El Rebelde (ECOSF parcial)	NULL	NULL	NULL	\N	\N	G
1370	4	13	29	NULL	\N	\N	\N	171	NULL	10	NULL	J	\N	UCSF San Sebastián SV La Esperanza (ECOSF parcial)	NULL	NULL	NULL	\N	\N	G
1390	1	5	20	NULL	\N	\N	\N	40	NULL	3	NULL	J	\N	UCSF Sonsonate SO El Cacao	NULL	NULL	NULL	\N	\N	G
1389	1	5	20	NULL	\N	\N	\N	26	NULL	3	NULL	J	\N	UCSF Acajutla SO Costa Azul	NULL	NULL	NULL	\N	\N	G
1387	6	27	49	NULL	\N	\N	\N	110	NULL	6	NULL	J	\N	UCSF San Salvador SS Los Rosales	NULL	NULL	NULL	\N	\N	G
1388	1	5	20	NULL	\N	\N	\N	26	NULL	3	NULL	J	\N	UCSF Acajutla SO Villa Centenario	NULL	NULL	NULL	\N	\N	G
1434	2	17	89	NULL	\N	\N	\N	215	NULL	12	NULL	J	\N	UCSF San Miguel SM Las Brisas	NULL	NULL	NULL	\N	\N	G
1386	6	27	49	NULL	\N	\N	\N	110	NULL	6	NULL	J	\N	UCSF San Salvador SS Saavedra	NULL	NULL	NULL	\N	\N	G
1372	2	17	121	NULL	\N	\N	\N	215	NULL	12	NULL	M	\N	Hospital Militar San Miguel SM	NULL	NULL	NULL	\N	\N	G
1373	4	10	28	NULL	\N	\N	\N	153	NULL	8	NULL	J	\N	UCSF San Luis la Herradura LP Los Blancos (ECOSF parcial)	NULL	NULL	NULL	\N	\N	G
1374	4	10	28	NULL	\N	\N	\N	142	NULL	8	NULL	J	\N	UCSF San Juan Talpa LP Comalapa (ECOSF parcial)	NULL	NULL	NULL	\N	\N	G
1375	4	12	4	NULL	\N	\N	\N	156	NULL	9	NULL	J	\N	UCSF Ilobasco CA-Urbano	NULL	NULL	NULL	\N	\N	G
1393	1	5	19	NULL	\N	\N	\N	31	NULL	3	NULL	J	\N	UCSF Izalco SO Chorro Arriba	NULL	NULL	NULL	\N	\N	G
1395	1	5	19	NULL	\N	\N	\N	31	NULL	3	NULL	J	\N	UCSF Izalco SO Las Marías	NULL	NULL	NULL	\N	\N	G
1392	1	5	19	NULL	\N	\N	\N	31	NULL	3	NULL	J	\N	UCSF Izalco SO Tunalmiles Centro	NULL	NULL	NULL	\N	\N	G
1391	1	5	20	NULL	\N	\N	\N	40	NULL	3	NULL	J	\N	UCSF Sonsonate SO El Presidio	NULL	NULL	NULL	\N	\N	G
1394	1	5	19	NULL	\N	\N	\N	31	NULL	3	NULL	J	\N	UCSF Izalco SO Las Lajas	NULL	NULL	NULL	\N	\N	G
1377	4	10	26	NULL	\N	\N	\N	146	NULL	8	NULL	J	\N	UCSF San Pedro Masahuat LP Astoria (UCSF parcial)	NULL	NULL	NULL	\N	\N	G
1378	6	25	112	NULL	\N	\N	\N	103	NULL	6	NULL	U	\N	UDS Ilopango SS	NULL	NULL	NULL	\N	\N	G
1379	4	10	28	NULL	\N	\N	\N	144	NULL	8	NULL	J	\N	UCSF San Luis Talpa LP Amatecampo (ECOSF parcial)	NULL	NULL	NULL	\N	\N	G
1380	5	8	126	NULL	\N	\N	\N	75	NULL	5	NULL	X	\N	ONG FUNTER Santa Tecla LL Ciudad Merliot	NULL	NULL	NULL	\N	\N	G
1381	1	5	20	NULL	\N	\N	\N	40	NULL	3	NULL	X	\N	ONG FUNTER Sonsonate SO	NULL	NULL	NULL	\N	\N	G
1382	4	13	29	NULL	\N	\N	\N	172	NULL	10	NULL	X	\N	ONG FUNTER San Vicente SV	NULL	NULL	NULL	\N	\N	G
1383	1	2	2	NULL	\N	\N	\N	21	NULL	2	NULL	J	\N	UCSF San Sebastián Salitrillo SA Santa Rosa	NULL	NULL	NULL	\N	\N	G
1431	2	17	63	NULL	\N	\N	\N	215	NULL	12	NULL	P	\N	Unidad Medica ISSS San Miguel SM	NULL	NULL	NULL	\N	\N	G
1384	4	10	25	NULL	\N	\N	\N	152	NULL	8	NULL	J	\N	UCSF Zacatecoluca LP Escuintla	NULL	NULL	NULL	\N	\N	G
1396	1	5	19	NULL	\N	\N	\N	40	NULL	3	NULL	J	\N	UCSF Izalco SO Cuyagualo	NULL	NULL	NULL	\N	\N	G
1397	1	5	20	NULL	\N	\N	\N	33	NULL	3	NULL	J	\N	UCSF Nahuizalco SO El Carrizal	NULL	NULL	NULL	\N	\N	G
1398	1	5	20	NULL	\N	\N	\N	33	NULL	3	NULL	J	\N	UCSF Nahuizalco SO Tajcuilujlan	NULL	NULL	NULL	\N	\N	G
1399	2	21	3	NULL	\N	\N	\N	252	NULL	14	NULL	P	\N	Unidad Medica ISSS La Unión LU	NULL	NULL	NULL	\N	\N	G
1400	5	6	68	NULL	\N	\N	\N	74	NULL	4	NULL	J	\N	UCSF Tejutla CH 	NULL	NULL	NULL	\N	\N	G
1401	5	6	68	NULL	\N	\N	\N	74	NULL	4	NULL	J	\N	UCSF Tejutla CH Los Hernandez	NULL	NULL	NULL	\N	\N	G
1402	5	6	68	NULL	\N	\N	\N	74	NULL	4	NULL	J	\N	UCSF Tejutla CH Aguaje Escondido	NULL	NULL	NULL	\N	\N	G
1403	5	6	68	NULL	\N	\N	\N	74	NULL	4	NULL	J	\N	UCSF Tejutla CH El Salitre	NULL	NULL	NULL	\N	\N	G
1404	5	6	68	NULL	\N	\N	\N	74	NULL	4	NULL	J	\N	UCSF Tejutla CH El Coyolito	NULL	NULL	NULL	\N	\N	G
1405	5	8	126	NULL	\N	\N	\N	77	NULL	5	NULL	J	\N	UCSF Colón LL 	NULL	NULL	NULL	\N	\N	G
1406	5	8	126	NULL	\N	\N	\N	77	NULL	5	NULL	J	\N	UCSF Colón LL El Pital	NULL	NULL	NULL	\N	\N	G
1407	5	8	126	NULL	\N	\N	\N	86	NULL	5	NULL	J	\N	UCSF Quezaltepeque LL San Jacinto	NULL	NULL	NULL	\N	\N	G
1408	5	8	126	NULL	\N	\N	\N	86	NULL	5	NULL	J	\N	UCSF Quezaltepeque LL Santa Emilia	NULL	NULL	NULL	\N	\N	G
1409	2	20	130	NULL	\N	\N	\N	237	NULL	13	NULL	Z	\N	Centro Penal San Francisco Gotera MO	NULL	NULL	NULL	\N	\N	G
1410	2	20	130	NULL	\N	\N	\N	237	NULL	13	NULL	B	\N	Destacamento Militar San Francisco Gotera MO No. 4	NULL	NULL	NULL	\N	\N	G
1411	4	9	107	NULL	\N	\N	\N	130	NULL	7	NULL	J	\N	UCSF Suchitoto CU	NULL	NULL	NULL	\N	\N	G
1412	6	27	51	NULL	\N	\N	\N	104	NULL	6	NULL	J	\N	UCSF Mejicanos SS Las nubes	NULL	NULL	NULL	\N	\N	G
1413	6	27	52	NULL	\N	\N	\N	104	NULL	6	NULL	J	\N	UCSF Mejicanos SS San Roque	NULL	NULL	NULL	\N	\N	G
1414	6	27	48	NULL	\N	\N	\N	110	NULL	6	NULL	J	\N	UCSF San Salvador SS Las Lajas	NULL	NULL	NULL	\N	\N	G
1415	6	27	118	NULL	\N	\N	\N	110	NULL	6	NULL	J	\N	UCSF San Salvador SS Coro Quiñones	NULL	NULL	NULL	\N	\N	G
1416	6	27	52	NULL	\N	\N	\N	104	NULL	6	NULL	J	\N	UCSF Mejicanos SS Cristo Redentor	NULL	NULL	NULL	\N	\N	G
1417	6	27	50	NULL	\N	\N	\N	110	NULL	6	NULL	J	\N	UCSF San Salvador SS La Naval	NULL	NULL	NULL	\N	\N	G
1418	6	27	52	NULL	\N	\N	\N	110	NULL	6	NULL	J	\N	UCSF San Salvador SS Mano de León	NULL	NULL	NULL	\N	\N	G
1419	6	27	118	NULL	\N	\N	\N	110	NULL	6	NULL	J	\N	UCSF San Salvador SS Las Brisas	NULL	NULL	NULL	\N	\N	G
1420	6	24	60	NULL	\N	\N	\N	106	NULL	6	NULL	J	\N	UCSF Panchimalco SS San Isidro	NULL	NULL	NULL	\N	\N	G
1421	6	24	61	NULL	\N	\N	\N	106	NULL	6	NULL	J	\N	UCSF Panchimalco SS Cnt El Cedro	NULL	NULL	NULL	\N	\N	G
1422	6	24	60	NULL	\N	\N	\N	110	NULL	6	NULL	J	\N	UCSF San Salvador SS Cmnd Miraflores	NULL	NULL	NULL	\N	\N	G
1423	6	24	60	NULL	\N	\N	\N	110	NULL	6	NULL	J	\N	UCSF San Salvador SS Cmnd Las Esmeraldas	NULL	NULL	NULL	\N	\N	G
1424	6	24	60	NULL	\N	\N	\N	108	NULL	6	NULL	J	\N	UCSF San Marcos SS Cmnd Linda Vista	NULL	NULL	NULL	\N	\N	G
1425	6	24	60	NULL	\N	\N	\N	108	NULL	6	NULL	J	\N	UCSF San Marcos SS Cmnd El Transito	NULL	NULL	NULL	\N	\N	G
1426	6	23	115	NULL	\N	\N	\N	105	NULL	6	NULL	J	\N	UCSF Nejapa SS El Llano	NULL	NULL	NULL	\N	\N	G
1427	6	23	115	NULL	\N	\N	\N	101	NULL	6	NULL	J	\N	UCSF El Paisnal SS Cmnd Rutilio Grande	NULL	NULL	NULL	\N	\N	G
1428	6	25	59	NULL	\N	\N	\N	109	NULL	6	NULL	J	\N	UCSF San Martin SS Cmnd Santa Fe	NULL	NULL	NULL	\N	\N	G
1429	6	25	59	NULL	\N	\N	\N	109	NULL	6	NULL	J	\N	UCSF San Martin SS Cnt El Rosario	NULL	NULL	NULL	\N	\N	G
1430	4	9	107	NULL	\N	\N	\N	123	NULL	7	NULL	J	\N	UCSF San Cristobal CU San Antonio	NULL	NULL	NULL	\N	\N	G
1432	2	14	83	NULL	\N	\N	\N	198	NULL	11	NULL	U	\N	UDS Jiquilisco US	NULL	NULL	NULL	\N	\N	G
1433	2	20	40	NULL	\N	\N	\N	237	NULL	13	NULL	U	\N	UDS San Francisco Gotera MO	NULL	NULL	NULL	\N	\N	G
1435	2	17	89	NULL	\N	\N	\N	215	NULL	12	NULL	J	\N	UCSF San Miguel SM Espiritu Santo	NULL	NULL	NULL	\N	\N	G
1436	2	17	89	NULL	\N	\N	\N	215	NULL	12	NULL	J	\N	UCSF San Luis de la Reina SM San Antonio	NULL	NULL	NULL	\N	\N	G
1437	2	17	89	NULL	\N	\N	\N	215	NULL	12	NULL	J	\N	UCSF San Luis de la Reina SM El Ostucal	NULL	NULL	NULL	\N	\N	G
1438	4	10	25	NULL	\N	\N	\N	152	NULL	8	NULL	J	\N	UCSF Zacatecoluca PL Hatos de los Reyes	NULL	NULL	NULL	\N	\N	G
1439	1	5	20	NULL	\N	\N	\N	40	NULL	3	NULL	J	\N	UCSF Sonsonate SO Sensunapán	NULL	NULL	NULL	\N	\N	G
1440	1	1	10	SIBASI AHUACHAPAN	1	1	1	1	U	1	01	J	3	UCSF Ahuachapán AH *	S	10101U	0101	\N	\N	G
1441	1	1	10	SIBASI AHUACHAPAN	1	1	2	2	U	1	05	J	3	UCSF Apaneca AH *	S	10102U	0105	\N	\N	G
1442	1	1	11	SIBASI AHUACHAPAN	1	1	3	3	U	1	09	J	3	UCSF ATIQUIZAYA *	S	10103U	0109	\N	\N	G
1443	1	1	1	SIBASI AHUACHAPAN	1	1	4	8	U	1	02	J	3	UCSF CARA SUCIA *	S	10104U	0102	\N	\N	G
1444	1	1	10	SIBASI AHUACHAPAN	1	1	5	4	U	1	03	J	3	UCSF ATACO *	S	10105U	0103	\N	\N	G
1445	1	1	10	SIBASI AHUACHAPAN	1	1	6	11	U	1	04	J	3	UCSF TACUBA *	S	10106U	0104	\N	\N	G
1446	1	1	1	SIBASI AHUACHAPAN	1	1	7	8	U	1	02	J	3	UCSF LA HACHADURA *	S	10107U	0102	\N	\N	G
1447	1	1	12	SIBASI AHUACHAPAN	1	1	8	6	U	1	07	J	3	UCSF GUAYMANGO *	S	10108U	0107	\N	\N	G
1448	1	1	12	SIBASI AHUACHAPAN	1	1	9	7	U	1	08	J	3	UCSF JUJUTLA *	S	10109U	0108	\N	\N	G
1449	1	1	12	SIBASI AHUACHAPAN	1	1	10	7	U	1	08	J	3	UCSF SAN JOSE EL NARANJO (JUJUTLA) *	S	10110U	0108	\N	\N	G
1450	1	1	10	SIBASI AHUACHAPAN	1	1	11	1	U	1	01	J	3	UCSF Ahuachapán AH Las Chinamas *	S	10111U	0101	\N	\N	G
1451	1	1	12	SIBASI AHUACHAPAN	1	1	12	7	U	1	08	J	3	UCSF GUAYAPA ABAJO *	S	10112U	0108	\N	\N	G
1452	1	1	12	SIBASI AHUACHAPAN	1	1	13	10	U	1	06	J	3	UCSF SAN PEDRO PUXTLA *	S	10113U	0106	\N	\N	G
1453	1	1	11	SIBASI AHUACHAPAN	1	1	14	9	U	1	11	J	3	UCSF SAN LORENZO (AHUACHAPAN) *	S	10114U	0111	\N	\N	G
1454	1	1	11	SIBASI AHUACHAPAN	1	1	15	12	U	1	10	J	3	UCSF TURIN *	S	10115U	0110	\N	\N	G
1455	1	1	11	SIBASI AHUACHAPAN	1	1	16	5	U	1	12	J	3	UCSF EL REFUGIO *	S	10116U	0112	\N	\N	G
1456	1	1	1	SIBASI AHUACHAPAN	1	1	17	8	U	1	02	J	3	UCSF SAN FRANCISCO MENENDEZ *	S	10117U	0102	\N	\N	G
1457	1	1	12	SIBASI AHUACHAPAN	1	1	18	7	U	1	08	J	3	UCSF BARRA DE SANTIAGO *	S	10118U	0108	\N	\N	G
1458	1	1	1	SIBASI AHUACHAPAN	1	1	19	8	U	1	02	J	3	UCSF EL ZAPOTE (SAN FCO.MENENDEZ) *	S	10119U	0102	\N	\N	G
1459	1	1	1	SIBASI AHUACHAPAN	1	1	20	8	U	1	02	J	3	UCSF GARITA PALMERA *	S	10120U	0102	\N	\N	G
1460	1	1	1	SIBASI AHUACHAPAN	1	1	21	8	U	1	02	J	3	UCSF ING.JAVIER ESTRADA *	S	10121U	0102	\N	\N	G
1461	1	2	13	SIBASI SANTA ANA	1	2	1	22	U	2	01	J	3	UCSF DR.TOMAS PINEDA MARTINEZ *	S	10201U	0201	\N	\N	G
1462	1	2	13	SIBASI SANTA ANA	1	2	2	22	U	2	01	J	3	UCSF CASA DEL NIÑO *	S	10202U	0201	\N	\N	G
1463	1	2	13	SIBASI SANTA ANA	1	2	3	22	U	2	01	J	3	UCSF EL PALMAR *	S	10203U	0201	\N	\N	G
1464	1	2	13	SIBASI SANTA ANA	1	2	4	22	U	2	01	J	3	UCSF SANTA LUCIA (SANTA ANA) *	S	10204U	0201	\N	\N	G
1465	1	2	14	SIBASI SANTA ANA	1	2	5	22	U	2	01	J	3	UCSF SAN MIGUELITO STA.ANA *	S	10205U	0201	\N	\N	G
1466	1	2	14	SIBASI SANTA ANA	1	2	6	22	U	2	01	J	3	UCSF SAN RAFAEL (SANTA ANA) *	S	10206U	0201	\N	\N	G
1467	1	2	14	SIBASI SANTA ANA	1	2	7	22	U	2	01	J	3	UCSF SANTA BARBARA *	S	10207U	0201	\N	\N	G
1468	1	2	16	SIBASI SANTA ANA	1	2	8	14	U	2	03	J	3	UCSF COATEPEQUE *	S	10208U	0203	\N	\N	G
1469	1	2	15	SIBASI SANTA ANA	1	2	9	25	U	2	04	J	3	UCSF TEXISTEPEQUE *	S	10209U	0204	\N	\N	G
1470	1	2	16	SIBASI SANTA ANA	1	2	10	16	U	2	02	J	3	UCSF EL CONGO *	S	10210U	0202	\N	\N	G
1471	1	2	17	SIBASI SANTA ANA	1	2	11	13	U	2	06	J	3	UCSF CANDELARIA DE LA FRONTERA *	S	10211U	0206	\N	\N	G
1472	1	2	15	SIBASI SANTA ANA	1	2	13	25	U	2	04	J	3	UCSF GUARNECIA *	S	10213U	0204	\N	\N	G
1473	1	2	16	SIBASI SANTA ANA	1	2	14	22	U	2	01	J	3	UCSF PLANES DE LA LAGUNA *	S	10214U	0201	\N	\N	G
1474	1	2	14	SIBASI SANTA ANA	1	2	15	22	U	2	01	J	3	UCSF NATIVIDAD *	S	10215U	0201	\N	\N	G
1475	1	2	17	SIBASI SANTA ANA	1	2	22	13	U	2	06	J	3	UCSF LA PARADA ALDEA BOLAÑOS *	S	10222U	0206	\N	\N	G
1476	1	2	16	SIBASI SANTA ANA	1	2	23	14	U	2	03	J	3	UCSF SAN JACINTO(COATEPEQUE) *	S	10223U	0203	\N	\N	G
1477	1	2	17	SIBASI SANTA ANA	1	2	25	24	U	2	10	J	3	UCSF SANTIAGO DE LA FRONTERA *	S	10225U	0210	\N	\N	G
1478	1	2	17	SIBASI SANTA ANA	1	2	26	20	U	2	13	J	3	UCSF SAN ANTONIO PAJONAL *	S	10226U	0213	\N	\N	G
1479	1	2	16	SIBASI SANTA ANA	1	2	27	14	U	2	03	J	3	UCSF EL TINTERAL *	S	10227U	0203	\N	\N	G
1480	1	2	15	SIBASI SANTA ANA	1	2	28	25	U	2	04	J	3	UCSF SAN MIGUEL TEXISTEPEQUE *	S	10228U	0204	\N	\N	G
1481	1	2	17	SIBASI SANTA ANA	1	2	30	15	U	2	05	J	3	UCSF SABANETAS EL PASTE *	S	10230U	0205	\N	\N	G
1482	1	2	13	SIBASI METAPAN	1	2	12	23	U	2	12	J	3	UCSF SANTA ROSA GUACHIPILIN *	S	10212U	0212	\N	\N	G
1483	1	2	13	SIBASI METAPAN	1	2	18	19	U	2	09	J	3	UCSF SAN JUAN LAS MINAS (METAPAN) *	S	10218U	0209	\N	\N	G
1484	1	2	13	SIBASI METAPAN	1	2	19	18	U	2	11	J	3	UCSF MASAHUAT (SANTA ANA) *	S	10219U	0211	\N	\N	G
1485	1	2	13	SIBASI METAPAN	1	2	20	19	U	2	09	J	3	UCSF SAN JERONIMO (METAPAN) *	S	10220U	0209	\N	\N	G
1486	1	2	13	SIBASI METAPAN	1	2	21	19	U	2	09	J	3	UCSF BELEN GUIJATH (METAPAN) *	S	10221U	0209	\N	\N	G
1487	1	2	13	SIBASI METAPAN	1	2	24	19	U	2	09	J	3	UCSF SAN JOSE INGENIO(METAPAN) *	S	10224U	0209	\N	\N	G
1488	1	2	13	SIBASI CHALCHUAPA	1	2	16	17	U	2	08	J	3	UCSF EL PORVENIR *	S	10216U	0208	\N	\N	G
1489	1	2	13	SIBASI CHALCHUAPA	1	2	17	21	U	2	07	J	3	UCSF SAN SEBASTIAN SALITRILLO *	S	10217U	0207	\N	\N	G
1490	1	2	13	SIBASI CHALCHUAPA	1	2	29	15	U	2	05	J	3	UCSF EL COCO *	S	10229U	0205	\N	\N	G
1491	1	2	13	SIBASI CHALCHUAPA	1	2	31	15	U	2	05	J	3	UCSF CHALCHUAPA *	S	10231U	0205	\N	\N	G
1492	1	5	19	SIBASI SONSONATE	1	3	1	31	U	3	08	J	3	UCSF IZALCO *	S	10301U	0308	\N	\N	G
1493	1	5	18	SIBASI SONSONATE	1	3	2	33	U	3	02	J	3	UCSF NAHUIZALCO *	S	10302U	0302	\N	\N	G
1494	1	5	19	SIBASI SONSONATE	1	3	3	27	U	3	09	J	3	UCSF ARMENIA *	S	10303U	0309	\N	\N	G
1495	1	5	19	SIBASI SONSONATE	1	3	4	37	U	3	10	J	3	UCSF SAN JULIAN *	S	10304U	0310	\N	\N	G
1496	1	5	20	SIBASI SONSONATE	1	3	5	26	U	3	07	J	3	UCSF Acajutla SO *	S	10305U	0307	\N	\N	G
1497	1	5	18	SIBASI SONSONATE	1	3	6	32	U	3	14	J	3	UCSF DR.FRANCISCO MAGAÑA H.JUAYUA *	S	10306U	0314	\N	\N	G
1498	1	5	20	SIBASI SONSONATE	1	3	7	41	U	3	05	J	3	UCSF DR.LEONARDO A.LOPEZ V(SONZACATE) *	S	10307U	0305	\N	\N	G
1499	1	5	20	SIBASI SONSONATE	1	3	8	26	U	3	07	J	3	UCSF METALIO (ACAJUTLA) *	S	10308U	0307	\N	\N	G
1500	1	5	18	SIBASI SONSONATE	1	3	9	32	U	3	14	J	3	UCSF LA MAJADA (JUAYUA) *	S	10309U	0314	\N	\N	G
1501	1	5	20	SIBASI SONSONATE	1	3	10	34	U	3	04	J	3	UCSF NAHULINGO *	S	10310U	0304	\N	\N	G
1502	1	5	18	SIBASI SONSONATE	1	3	11	38	U	3	15	J	3	UCSF SANTA CATARINA MASAHUAT *	S	10311U	0315	\N	\N	G
1503	1	5	20	SIBASI SONSONATE	1	3	12	39	U	3	03	J	3	UCSF SANTO DOMINGO DE GUZMAN *	S	10312U	0303	\N	\N	G
1504	1	5	19	SIBASI SONSONATE	1	3	13	30	U	3	11	J	3	UCSF SANTA ISABEL ISHUATAN *	S	10313U	0311	\N	\N	G
1505	1	5	20	SIBASI SONSONATE	1	3	14	40	U	3	11	J	3	UCSF SALINAS DE AYACACHAPA *	S	10314U	0301	\N	\N	G
1506	1	5	19	SIBASI SONSONATE	1	3	15	28	U	3	13	J	3	UCSF CALUCO *	S	10315U	0313	\N	\N	G
1507	1	5	19	SIBASI SONSONATE	1	3	16	29	U	3	12	J	3	UCSF CUISNAHUAT *	S	10316U	0312	\N	\N	G
1508	1	5	20	SIBASI SONSONATE	1	3	17	36	U	3	06	J	3	UCSF SAN ANTONIO DEL MONTE *	S	10317U	0306	\N	\N	G
1509	1	5	18	SIBASI SONSONATE	1	3	18	35	U	3	16	J	3	UCSF SALCOATITAN *	S	10318U	0316	\N	\N	G
1510	1	5	18	SIBASI SONSONATE	1	3	19	33	U	3	02	J	3	UCSF LOS ARENALES (NAHUIZAL) *	S	10319U	0302	\N	\N	G
1511	5	6	73	SIBASI CHALATENANGO	2	4	2	69	U	4	05	J	3	UCSF SAN JOSE LAS FLORES *	S	20402U	0405	\N	\N	G
1512	5	6	70	SIBASI CHALATENANGO	2	4	3	48	U	4	01	J	3	UCSF EL DORADO (CHALATENANGO) *	S	20403U	0401	\N	\N	G
1513	5	6	74	SIBASI CHALATENANGO	2	4	4	49	U	4	26	J	3	UCSF DULCE NOMBRE DE MARIA *	S	20404U	0426	\N	\N	G
1514	5	6	72	SIBASI CHALATENANGO	2	4	5	56	U	4	07	J	3	UCSF NOMBRE DE JESUS *	S	20405U	0407	\N	\N	G
1515	5	6	70	SIBASI CHALATENANGO	2	4	9	51	U	4	28	J	3	UCSF EL PARAISO *	S	20409U	0428	\N	\N	G
1516	5	6	73	SIBASI CHALATENANGO	2	4	10	43	U	4	02	J	3	UCSF ARCATAO *	S	20410U	0402	\N	\N	G
1517	5	6	70	SIBASI CHALATENANGO	2	4	11	55	U	4	11	J	3	UCSF LAS VUELTAS *	S	20411U	0411	\N	\N	G
1518	5	6	71	SIBASI CHALATENANGO	2	4	12	52	U	4	33	J	3	UCSF LA LAGUNA *	S	20412U	0433	\N	\N	G
1519	5	6	74	SIBASI CHALATENANGO	2	4	15	64	U	4	29	J	3	UCSF SAN FRANCISCO MORAZAN *	S	20415U	0429	\N	\N	G
1520	5	6	71	SIBASI CHALATENANGO	2	4	16	46	U	4	32	J	3	UCSF COMALAPA *	S	20416U	0432	\N	\N	G
1521	5	6	71	SIBASI CHALATENANGO	2	4	17	59	U	4	18	J	3	UCSF OJOS DE AGUA *	S	20417U	0418	\N	\N	G
1522	5	6	75	SIBASI CHALATENANGO	2	4	18	70	U	4	13	J	3	UCSF SAN LUIS DEL CARMEN *	S	20418U	0413	\N	\N	G
1523	5	6	70	SIBASI CHALATENANGO	2	4	19	62	U	4	08	J	3	UCSF SAN ANTONIO LOS RANCHOS *	S	20419U	0408	\N	\N	G
1524	5	6	75	SIBASI CHALATENANGO	2	4	20	60	U	4	12	J	3	UCSF POTONICO *	S	20420U	0412	\N	\N	G
1525	5	6	75	SIBASI CHALATENANGO	2	4	21	44	U	4	14	J	3	UCSF AZACUALPA *	S	20421U	0414	\N	\N	G
1526	5	6	74	SIBASI CHALATENANGO	2	4	22	63	U	4	27	J	3	UCSF SAN FERNANDO (CHALATEN) *	S	20422U	0427	\N	\N	G
1527	5	6	75	SIBASI CHALATENANGO	2	4	23	64	U	4	17	J	3	UCSF SAN FRANCISCO LEMPA *	S	20423U	0417	\N	\N	G
1528	5	6	73	SIBASI CHALATENANGO	2	4	24	58	U	4	04	J	3	UCSF NUEVA TRINIDAD *	S	20424U	0404	\N	\N	G
1529	5	6	74	SIBASI CHALATENANGO	2	4	25	72	U	4	30	J	3	UCSF SAN RAFAEL *	S	20425U	0430	\N	\N	G
1530	5	6	70	SIBASI CHALATENANGO	2	4	26	47	U	4	06	J	3	UCSF CONCEPCION QUEZALTEPEQUE *	S	20426U	0406	\N	\N	G
1531	5	6	71	SIBASI CHALATENANGO	2	4	27	50	U	4	09	J	3	UCSF EL CARRIZAL *	S	20427U	0409	\N	\N	G
1532	5	6	74	SIBASI CHALATENANGO	2	4	28	73	U	4	31	J	3	UCSF SANTA RITA *	S	20428U	0431	\N	\N	G
1533	5	6	72	SIBASI CHALATENANGO	2	4	29	61	U	4	10	J	3	UCSF SAN ANTONIO DE LA CRUZ *	S	20429U	0410	\N	\N	G
1534	5	6	70	SIBASI CHALATENANGO	2	4	30	71	U	4	16	J	3	UCSF SAN MIGUEL DE MERCEDES *	S	20430U	0416	\N	\N	G
1535	5	6	72	SIBASI CHALATENANGO	2	4	31	68	U	4	15	J	3	UCSF SAN JOSE CANCASQUE *	S	20431U	0415	\N	\N	G
1536	5	6	72	SIBASI CHALATENANGO	2	4	35	67	U	4	03	J	3	UCSF SAN ISIDRO LABRADOR *	S	20435U	0403	\N	\N	G
1537	5	6	71	SIBASI CHALATENANGO	2	4	36	50	U	4	09	J	3	UCSF VAINILLAS *	S	20436U	0409	\N	\N	G
1538	5	6	119	SIBASI NUEVA CONCEPCION	2	4	1	53	U	4	22	J	3	UCSF LA PALMA *	S	20401U	0422	\N	\N	G
1539	5	6	119	SIBASI NUEVA CONCEPCION	2	4	6	42	U	4	25	J	3	UCSF Agua Caliente CH *	S	20406U	0425	\N	\N	G
1540	5	6	119	SIBASI NUEVA CONCEPCION	2	4	7	74	U	4	19	J	3	UCSF TEJUTLA *	S	20407U	0419	\N	\N	G
1541	5	6	119	SIBASI NUEVA CONCEPCION	2	4	8	54	U	4	23	J	3	UCSF LA REINA *	S	20408U	0423	\N	\N	G
1542	5	6	119	SIBASI NUEVA CONCEPCION	2	4	13	45	U	4	21	J	3	UCSF CITALA *	S	20413U	0421	\N	\N	G
1543	5	6	119	SIBASI NUEVA CONCEPCION	2	4	14	66	U	4	24	J	3	UCSF SAN IGNACIO *	S	20414U	0424	\N	\N	G
1544	5	6	119	SIBASI NUEVA CONCEPCION	2	4	32	57	U	4	20	J	3	UCSF POTRERO SULA *	S	20432U	0420	\N	\N	G
1545	5	6	119	SIBASI NUEVA CONCEPCION	2	4	33	57	U	4	20	J	3	UCSF ARRACAOS *	S	20433U	0420	\N	\N	G
1546	5	6	119	SIBASI NUEVA CONCEPCION	2	4	34	66	U	4	24	J	3	UCSF LAS PILAS *	S	20434U	0424	\N	\N	G
1547	5	8	24	SIBASI LA LIBERTAD	2	5	1	83	U	5	03	J	3	UCSF La Libertad LL Puerto *	S	20501U	0503	\N	\N	G
1548	5	8	22	SIBASI LA LIBERTAD	2	5	2	81	U	5	02	J	3	UCSF DR.FCO.LIMA (JAYAQUE) *	S	20502U	0502	\N	\N	G
1549	5	8	22	SIBASI LA LIBERTAD	2	5	3	76	U	5	22	J	3	UCSF CIUDAD ARCE *	S	20503U	0522	\N	\N	G
1550	5	8	21	SIBASI LA LIBERTAD	2	5	4	86	U	5	18	J	3	UCSF QUEZALTEPEQUE *	S	20504U	0518	\N	\N	G
1551	5	8	21	SIBASI LA LIBERTAD	2	5	5	89	U	5	20	J	3	UCSF SAN JUAN OPICO *	S	20505U	0520	\N	\N	G
1552	5	8	21	SIBASI LA LIBERTAD	2	5	6	91	U	5	19	J	3	UCSF SAN PABLO TACACHICO *	S	20506U	0519	\N	\N	G
1553	5	8	22	SIBASI LA LIBERTAD	2	5	7	77	U	5	08	J	3	UCSF LOURDES (COLON) *	S	20507U	0508	\N	\N	G
1554	5	8	21	SIBASI LA LIBERTAD	2	5	8	89	U	5	20	J	3	UCSF SITIO DEL NIÑO *	S	20508U	0520	\N	\N	G
1555	5	8	23	SIBASI LA LIBERTAD	2	5	9	85	U	5	01	J	3	UCSF DR. ALBERTO AGUILAR RIVAS *	S	20509U	0501	\N	\N	G
1556	5	8	23	SIBASI LA LIBERTAD	2	5	10	78	U	5	04	J	3	UCSF COMASAGUA *	S	20510U	0504	\N	\N	G
1557	5	8	21	SIBASI LA LIBERTAD	2	5	11	90	U	5	21	J	3	UCSF SAN MATIAS *	S	20511U	0521	\N	\N	G
1558	5	8	22	SIBASI LA LIBERTAD	2	5	12	95	U	5	07	J	3	UCSF TEPECOYO *	S	20512U	0507	\N	\N	G
1559	5	8	23	SIBASI LA LIBERTAD	2	5	13	80	U	5	06	J	3	UCSF HUIZUCAR *	S	20513U	0506	\N	\N	G
1560	5	8	23	SIBASI LA LIBERTAD	2	5	15	88	U	5	09	J	3	UCSF SAN JOSE VILLANUEVA *	S	20515U	0509	\N	\N	G
1561	5	8	23	SIBASI LA LIBERTAD	2	5	16	96	U	5	15	J	3	UCSF Zaragoza LL *	S	20516U	0515	\N	\N	G
1562	5	8	24	SIBASI LA LIBERTAD	2	5	17	94	U	5	05	J	3	UCSF MIZATA *	S	20517U	0505	\N	\N	G
1563	5	8	24	SIBASI LA LIBERTAD	2	5	18	79	U	5	11	J	3	UCSF CHILTIUPAN *	S	20518U	0511	\N	\N	G
1564	5	8	23	SIBASI LA LIBERTAD	2	5	19	85	U	5	01	J	3	UCSF DR.CARLOS DIAZ DEL PINAL *	S	20519U	0501	\N	\N	G
1565	5	8	24	SIBASI LA LIBERTAD	2	5	20	92	U	5	10	J	3	UCSF TAMANIQUE *	S	20520U	0510	\N	\N	G
1566	5	8	22	SIBASI LA LIBERTAD	2	5	21	87	U	5	17	J	3	UCSF SACACOYO *	S	20521U	0517	\N	\N	G
1567	5	8	24	SIBASI LA LIBERTAD	2	5	22	82	U	5	16	J	3	UCSF JICALAPA *	S	20522U	0516	\N	\N	G
1568	5	8	22	SIBASI LA LIBERTAD	2	5	23	93	U	5	14	J	3	UCSF TALNIQUE *	S	20523U	0514	\N	\N	G
1569	5	8	23	SIBASI LA LIBERTAD	2	5	24	75	U	5	12	J	3	UCSF ANTIGUO CUSCATLAN *	S	20524U	0512	\N	\N	G
1570	5	8	23	SIBASI LA LIBERTAD	2	5	25	84	U	5	13	J	3	UCSF NUEVO CUSCATLAN *	S	20525U	0513	\N	\N	G
1571	5	8	24	SIBASI LA LIBERTAD	2	5	26	79	U	5	11	J	3	UCSF ING. ORLANDO RECINOS *	S	20526U	0511	\N	\N	G
1572	5	8	22	SIBASI LA LIBERTAD	2	5	28	93	U	5	14	J	3	UCSF SAN JOSE LOS SITIOS *	S	20528U	0514	\N	\N	G
1573	5	8	22	SIBASI LA LIBERTAD	2	5	27	77	U	5	08	J	3	UCSF DR.MANUEL GALLADRO COLON *	S	20527U	0508	\N	\N	G
1574	4	9	110	SIBASI COJUTEPEQUE	3	7	1	125	U	7	02	J	3	UCSF SAN PEDRO PERULAPAN *	S	30701U	0702	\N	\N	G
1575	4	9	107	SIBASI COJUTEPEQUE	3	7	3	126	U	7	04	J	3	UCSF SAN RAFAEL CEDROS *	S	30703U	0704	\N	\N	G
1576	4	9	110	SIBASI COJUTEPEQUE	3	7	4	129	U	7	09	J	3	UCSF SANTA CRUZ MICHAPA *	S	30704U	0709	\N	\N	G
1577	4	9	108	SIBASI COJUTEPEQUE	3	7	5	131	U	7	03	J	3	UCSF TENANCINGO *	S	30705U	0703	\N	\N	G
1578	4	9	108	SIBASI COJUTEPEQUE	3	7	6	128	U	7	13	J	3	UCSF SANTA CRUZ ANALQUITO *	S	30706U	0713	\N	\N	G
1579	4	9	108	SIBASI COJUTEPEQUE	3	7	7	116	U	7	05	J	3	UCSF CANDELARIA CUSCATLAN *	S	30707U	0705	\N	\N	G
1580	4	9	107	SIBASI COJUTEPEQUE	3	7	8	119	U	7	12	J	3	UCSF ROSARIO CUSCATLAN *	S	30708U	0712	\N	\N	G
1581	4	9	107	SIBASI COJUTEPEQUE	3	7	9	120	U	7	06	J	3	UCSF MONTE SAN JUAN *	S	30709U	0706	\N	\N	G
1582	4	9	108	SIBASI COJUTEPEQUE	3	7	11	123	U	7	08	J	3	UCSF SAN CRISTOBAL *	S	30711U	0708	\N	\N	G
1583	4	9	108	SIBASI COJUTEPEQUE	3	7	12	127	U	7	11	J	3	UCSF SAN RAMON *	S	30712U	0711	\N	\N	G
1584	4	9	107	SIBASI COJUTEPEQUE	3	7	13	118	U	7	07	J	3	UCSF EL CARMEN CUSCATLAN *	S	30713U	0707	\N	\N	G
1585	4	9	108	SIBASI COJUTEPEQUE	3	8	17	139	U	8	07	J	3	UCSF SAN EMIGDIO *	S	30817U	0807	\N	\N	G
1586	4	9	108	SIBASI COJUTEPEQUE	3	8	26	137	U	8	08	J	3	UCSF PARAISO DE OSORIO *	S	30826U	0808	\N	\N	G
1587	4	10	25	SIBASI LA PAZ	3	8	1	147	U	8	05	J	3	UCSF SAN PEDRO NONUALCO *	S	30801U	0805	\N	\N	G
1588	4	10	26	SIBASI LA PAZ	3	8	2	146	U	8	17	J	3	UCSF SAN PEDRO MASAHUAT *	S	30802U	0817	\N	\N	G
1589	4	10	25	SIBASI LA PAZ	3	8	3	150	U	8	02	J	3	UCSF SANTIAGO NONUALCO *	S	30803U	0802	\N	\N	G
1590	4	10	28	SIBASI LA PAZ	3	8	4	153	U	8	22	J	3	UCSF SAN LUIS LA HERRADURA *	S	30804U	0822	\N	\N	G
1591	4	10	27	SIBASI LA PAZ	3	8	5	144	U	8	16	J	3	UCSF SAN LUIS TALPA *	S	30805U	0816	\N	\N	G
1592	4	10	27	SIBASI LA PAZ	3	8	6	136	U	8	11	J	3	UCSF OLOCUILTA *	S	30806U	0811	\N	\N	G
1593	4	10	26	SIBASI LA PAZ	3	8	7	133	U	8	21	J	3	UCSF ROSARIO DE LA PAZ *	S	30807U	0821	\N	\N	G
1594	4	10	25	SIBASI LA PAZ	3	8	8	141	U	8	03	J	3	UCSF SAN JUAN NONUALCO *	S	30808U	0803	\N	\N	G
1595	4	10	25	SIBASI LA PAZ	3	8	9	149	U	8	06	J	3	UCSF SANTA MARÍA OSTUMA *	S	30809U	0806	\N	\N	G
1596	4	10	26	SIBASI LA PAZ	3	8	10	145	U	8	18	J	3	UCSF SAN MIGUEL TEPEZONTES *	S	30810U	0818	\N	\N	G
1597	4	10	25	SIBASI LA PAZ	3	8	11	148	U	8	04	J	3	UCSF SAN RAFAEL OBRAJUELO *	S	30811U	0804	\N	\N	G
1598	4	10	27	SIBASI LA PAZ	3	8	12	142	U	8	12	J	3	UCSF SAN JUAN TALPA *	S	30812U	0812	\N	\N	G
1599	4	10	26	SIBASI LA PAZ	3	8	13	143	U	8	20	J	3	UCSF SAN JUAN TEPEZONTES *	S	30813U	0820	\N	\N	G
1600	4	10	27	SIBASI LA PAZ	3	8	14	140	U	8	14	J	3	UCSF SAN FRANCISCO CHINAMECA *	S	30814U	0814	\N	\N	G
1601	4	13	29	SIBASI SAN VICENTE	3	8	15	134	U	8	09	J	3	UCSF JERUSALEN *	S	30815U	0809	\N	\N	G
1602	4	10	27	SIBASI LA PAZ	3	8	16	136	U	8	11	J	3	UCSF SANTA LUCÍA ORCOYO *	S	30816U	0811	\N	\N	G
1603	4	10	27	SIBASI LA PAZ	3	8	18	132	U	8	13	J	3	UCSF CUYULTITAN *	S	30818U	0813	\N	\N	G
1604	4	10	28	SIBASI LA PAZ	3	8	19	146	U	8	17	J	3	UCSF LAS ISLETAS *	S	30819U	0817	\N	\N	G
1605	4	10	26	SIBASI LA PAZ	3	8	20	146	U	8	17	J	3	UCSF SAN PEDRO MASAHUAT EL ACHIOTAL  *	S	30820U	0817	\N	\N	G
1606	4	10	25	SIBASI LA PAZ	3	8	21	150	U	8	02	J	3	UCSF SAN JOSÉ LA PAZ ARRRIBA *	S	30821U	0802	\N	\N	G
1607	4	10	28	SIBASI LA PAZ	3	8	22	153	U	8	22	J	3	UCSF LA HERRADURA EL ZAPOTE *	S	30822U	0822	\N	\N	G
1608	4	10	26	SIBASI LA PAZ	3	8	23	138	U	8	19	J	3	UCSF SAN ANTONIO MASAHUAT *	S	30823U	0819	\N	\N	G
1609	4	10	27	SIBASI LA PAZ	3	8	24	144	U	8	16	J	3	UCSF SAN LUIS TALPA EL PIMENTAL *	S	30824U	0816	\N	\N	G
1610	4	10	27	SIBASI LA PAZ	3	8	25	151	U	8	15	J	3	UCSF TAPALCHUACA *	S	30825U	0815	\N	\N	G
1611	4	10	25	SIBASI LA PAZ	3	8	27	152	U	8	01	J	3	UCSF DR. CARLOS ALBERTO GALEANO *	S	30827U	0801	\N	\N	G
1612	4	13	29	SIBASI SAN VICENTE	3	8	28	135	U	8	10	J	3	UCSF MERCEDESLA CEIBA *	S	30828U	0810	\N	\N	G
1613	4	12	4	SIBASI SENSUNTEPEQUE	3	9	2	158	U	9	04	J	3	UCSF SAN ISIDRO (CABAÑAS) *	S	30902U	0904	\N	\N	G
1614	4	12	4	SIBASI SENSUNTEPEQUE	3	9	3	161	U	9	02	J	3	UCSF VICTORIA *	S	30903U	0902	\N	\N	G
1615	4	12	4	SIBASI SENSUNTEPEQUE	3	9	7	162	U	9	03	J	3	UCSF DOLORES *	S	30907U	0903	\N	\N	G
1616	4	12	4	SIBASI SENSUNTEPEQUE	3	9	10	155	U	9	05	J	3	UCSF GUACOTECTI *	S	30910U	0905	\N	\N	G
1617	4	12	4	SIBASI SENSUNTEPEQUE	3	9	13	159	U	9	01	J	3	UCSF SENSUNTEPEQUE *	S	30913U	0901	\N	\N	G
1618	4	12	4	SIBASI SENSUNTEPEQUE	3	9	14	161	U	9	02	J	3	UCSF SANTA MARTA *	S	30914U	0902	\N	\N	G
1619	4	12	4	SIBASI SENSUNTEPEQUE	4	12	21	209	U	12	18	J	3	UCSF NUEVO EDEN DE SAN JUAN *	S	41221U	1218	\N	\N	G
1620	4	12	5	SIBASI ILOBASCO	3	9	4	162	U	9	09	J	3	UCSF CINQUERA *	S	30904U	0909	\N	\N	G
1621	4	12	5	SIBASI ILOBASCO	3	9	5	160	U	9	07	J	3	UCSF TEJUTEPEQUE *	S	30905U	0907	\N	\N	G
1622	4	12	6	SIBASI ILOBASCO	3	9	6	161	U	9	08	J	3	UCSF JUTIAPA *	S	30906U	0908	\N	\N	G
1623	4	12	4	SIBASI ILOBASCO	3	9	8	159	U	9	06	J	3	UCSF SANTA LUCIA (ILOBASCO) *	S	30908U	0906	\N	\N	G
1624	4	12	6	SIBASI ILOBASCO	3	9	9	161	U	9	08	J	3	UCSF CAROLINA (JUTIAPA ) *	S	30909U	0908	\N	\N	G
1625	4	12	4	SIBASI ILOBASCO	3	9	11	159	U	9	06	J	3	UCSF SAN FCO.DEL MONTE *	S	30911U	0906	\N	\N	G
1626	4	12	4	SIBASI ILOBASCO	3	9	12	156	U	9	06	J	3	UCSF ILOBASCO *	S	30912U	0906	\N	\N	G
1627	4	13	31	SIBASI SAN VICENTE	3	10	1	171	U	10	08	J	3	UCSF SAN SEBASTIAN *	S	31001U	1008	\N	\N	G
1628	4	13	29	SIBASI SAN VICENTE	3	10	2	164	U	10	03	J	3	UCSF GUADALUPE *	S	31002U	1003	\N	\N	G
1629	4	13	32	SIBASI SAN VICENTE	3	10	3	173	U	10	06	J	3	UCSF TECOLUCA *	S	31003U	1006	\N	\N	G
1630	4	13	30	SIBASI SAN VICENTE	3	10	4	163	U	10	02	J	3	UCSF APASTEPEQUE *	S	31004U	1002	\N	\N	G
1631	4	13	29	SIBASI SAN VICENTE	3	10	5	175	U	10	04	J	3	UCSF VERAPAZ *	S	31005U	1004	\N	\N	G
1632	4	13	31	SIBASI SAN VICENTE	3	10	6	167	U	10	11	J	3	UCSF SANTO DOMINGO *	S	31006U	1011	\N	\N	G
1633	4	13	29	SIBASI SAN VICENTE	3	10	7	174	U	10	05	J	3	UCSF TEPETITAN *	S	31007U	1005	\N	\N	G
1634	4	13	29	SIBASI SAN VICENTE	3	10	8	172	U	10	01	J	3	UCSF PERIFERICA SAN VICENTE *	S	31008U	1001	\N	\N	G
1635	4	13	30	SIBASI SAN VICENTE	3	10	9	169	U	10	13	J	3	UCSF SAN ILDEFONSO *	S	31009U	1013	\N	\N	G
1636	4	13	30	SIBASI SAN VICENTE	3	10	10	168	U	10	09	J	3	UCSF SAN ESTEBAN CATARINA *	S	31010U	1009	\N	\N	G
1637	4	13	32	SIBASI SAN VICENTE	3	10	11	173	U	10	06	J	3	UCSF SAN CARLOS LEMPA *	S	31011U	1006	\N	\N	G
1638	4	13	30	SIBASI SAN VICENTE	3	10	12	166	U	10	12	J	3	UCSF SANTA CLARA *	S	31012U	1012	\N	\N	G
1639	4	13	31	SIBASI SAN VICENTE	3	10	13	170	U	10	10	J	3	UCSF SAN LORENZO(SN.VICENTE) *	S	31013U	1010	\N	\N	G
1640	4	13	29	SIBASI SAN VICENTE	3	10	14	165	U	10	07	J	3	UCSF SAN CAYETANO ISTEPEQUE *	S	31014U	1007	\N	\N	G
1641	4	13	32	SIBASI SAN VICENTE	3	10	15	173	U	10	06	J	3	UCSF SAN NICOLAS LEMPA *	S	31015U	1006	\N	\N	G
1642	2	14	79	SIBASI USULUTAN	4	11	7	193	U	11	02	J	3	UCSF SANTA ELENA *	S	41107U	1102	\N	\N	G
1643	2	14	79	SIBASI USULUTAN	4	11	8	185	U	11	05	J	3	UCSF JUCUARAN *	S	41108U	1105	\N	\N	G
1644	2	14	79	SIBASI USULUTAN	4	11	9	188	U	11	07	J	3	UCSF OZATLAN *	S	41109U	1107	\N	\N	G
1645	2	14	80	SIBASI USULUTAN	4	11	10	179	U	11	08	J	3	UCSF CONCEPCION BATRES *	S	41110U	1108	\N	\N	G
1646	2	14	79	SIBASI USULUTAN	4	11	14	195	U	11	09	J	3	UCSF SANTA MARIA *	S	41114U	1109	\N	\N	G
1647	2	14	79	SIBASI USULUTAN	4	11	15	198	U	11	01	J	3	UCSF EL MOLINO *	S	41115U	1101	\N	\N	G
1648	2	14	79	SIBASI USULUTAN	4	11	26	181	U	11	06	J	3	UCSF EREGUAYQUIN *	S	41126U	1106	\N	\N	G
1649	2	14	79	SIBASI USULUTAN	4	11	27	198	U	11	01	J	3	UCSF PUERTO PARADA *	S	41127U	1101	\N	\N	G
1650	2	14	79	SIBASI USULUTAN	4	11	28	185	U	11	05	J	3	UCSF EL ESPINO *	S	41128U	1105	\N	\N	G
1651	2	14	79	SIBASI USULUTAN	4	11	29	192	U	11	04	J	3	UCSF SAN DIONISIO *	S	41129U	1104	\N	\N	G
1652	2	14	79	SIBASI USULUTAN	4	11	34	198	U	11	01	J	3	UCSF LA CRUZ *	S	41434U	1101	\N	\N	G
1653	2	14	80	SIBASI USULUTAN	4	12	4	216	U	12	11	J	3	UCSF SAN RAFAEL ORIENTE *	S	41204U	1211	\N	\N	G
1654	2	14	80	SIBASI USULUTAN	4	12	5	205	U	12	12	J	3	UCSF EL TRANSITO *	S	41205U	1212	\N	\N	G
1655	2	14	80	SIBASI USULUTAN	4	12	19	213	U	12	14	J	3	UCSF SAN JORGE *	S	41219U	1214	\N	\N	G
1656	2	14	80	SIBASI USULUTAN	4	12	28	205	U	12	12	J	3	UCSF PRIMAVERA *	S	41228U	1212	\N	\N	G
1657	2	14	80	SIBASI SANTIAGO DE MARIA	4	11	1	177	U	11	20	J	3	UCSF BERLIN *	S	41101U	1120	\N	\N	G
1658	2	14	79	SIBASI SANTIAGO DE MARIA	4	11	4	182	U	11	12	J	3	UCSF ESTANZUELAS *	S	41104U	1112	\N	\N	G
1659	2	14	79	SIBASI SANTIAGO DE MARIA	4	11	12	176	U	11	17	J	3	UCSF Alegria US *	S	41112U	1117	\N	\N	G
1660	2	14	79	SIBASI SANTIAGO DE MARIA	4	11	13	186	U	11	22	J	3	UCSF MERCEDES UMAÑA *	S	41113U	1122	\N	\N	G
1661	2	14	80	SIBASI SANTIAGO DE MARIA	4	11	18	178	U	11	19	J	3	UCSF CALIFORNIA *	S	41118U	1119	\N	\N	G
1662	2	14	79	SIBASI SANTIAGO DE MARIA	4	11	19	187	U	11	15	J	3	UCSF NUEVA GRANADA *	S	41119U	1115	\N	\N	G
1663	2	14	79	SIBASI SANTIAGO DE MARIA	4	11	20	197	U	11	18	J	3	UCSF TECAPAN *	S	41120U	1118	\N	\N	G
1664	2	14	79	SIBASI SANTIAGO DE MARIA	4	11	22	180	U	11	13	J	3	UCSF EL TRIUNFO *	S	41122U	1113	\N	\N	G
1665	2	14	79	SIBASI SANTIAGO DE MARIA	4	11	23	196	U	11	16	J	3	UCSF EL CERRITO *	S	41123U	1116	\N	\N	G
1666	2	14	79	SIBASI JIQUILISCO	4	11	5	183	U	11	03	J	3	UCSF TIERRA BLANCA (JIQUILISCO) *	S	41105U	1103	\N	\N	G
1667	2	14	79	SIBASI JIQUILISCO	4	11	6	189	U	11	10	J	3	UCSF PUERTO EL TRIUNFO *	S	41106U	1110	\N	\N	G
1668	2	14	79	SIBASI JIQUILISCO	4	11	11	190	U	11	21	J	3	UCSF SAN AGUSTIN *	S	41111U	1121	\N	\N	G
1669	2	14	79	SIBASI JIQUILISCO	4	11	17	194	U	11	23	J	3	UCSF SAN FRANCISCO JAVIER *	S	41117U	1123	\N	\N	G
1670	2	14	79	SIBASI JIQUILISCO	4	11	21	183	U	11	03	J	3	UCSF ISLA DE MENDEZ *	S	41121U	1103	\N	\N	G
1671	2	14	79	SIBASI JIQUILISCO	4	11	24	183	U	11	03	J	3	UCSF EL QUEBRADO *	S	41124U	1103	\N	\N	G
1672	2	14	79	SIBASI JIQUILISCO	4	11	25	189	U	11	10	J	3	UCSF CORRAL DE MULAS *	S	41125U	1110	\N	\N	G
1673	2	14	79	SIBASI JIQUILISCO	4	11	30	183	U	11	03	J	3	UCSF LA CANOA *	S	41130U	1103	\N	\N	G
1674	2	14	79	SIBASI JIQUILISCO	4	11	31	183	U	11	03	J	3	UCSF SALINAS DE SISIGUAYO *	S	41131U	1103	\N	\N	G
1675	2	14	79	SIBASI JIQUILISCO	4	11	32	183	U	11	03	J	3	UCSF NUEVO AMANECER *	S	41132U	1103	\N	\N	G
1676	2	17	88	SIBASI SAN MIGUEL	4	12	3	217	U	12	15	J	3	UCSF SESORI *	S	41203U	1215	\N	\N	G
1677	2	17	64	SIBASI SAN MIGUEL	4	12	8	215	U	12	01	J	3	UCSF DR.ROBERTO A.CARIAS (LA PRESITA) *	S	41208U	1201	\N	\N	G
1678	2	17	63	SIBASI SAN MIGUEL	4	12	9	204	U	12	06	J	3	UCSF CHIRILAGUA *	S	41209U	1206	\N	\N	G
1679	2	17	90	SIBASI SAN MIGUEL	4	12	10	215	U	12	01	J	3	UCSF MILAGRO DE LA PAZ *	S	41210U	1201	\N	\N	G
1680	2	17	89	SIBASI SAN MIGUEL	4	12	11	203	U	12	09	J	3	UCSF LAS PLACITAS *	S	41211U	1209	\N	\N	G
1681	2	17	88	SIBASI SAN MIGUEL	4	12	12	202	U	12	05	J	3	UCSF CHAPELTIQUE *	S	41212U	1205	\N	\N	G
1682	2	17	87	SIBASI SAN MIGUEL	4	12	14	215	U	12	01	J	3	UCSF EL ZAMORAN *	S	41214U	1201	\N	\N	G
1683	2	17	87	SIBASI SAN MIGUEL	4	12	15	215	U	12	01	J	3	UCSF SAN CARLOS (SAN MIGUEL) *	S	41215U	1201	\N	\N	G
1684	2	17	64	SIBASI SAN MIGUEL	4	12	16	215	U	12	01	J	3	UCSF SAN ANTONIO SILVA *	S	41216U	1201	\N	\N	G
1685	2	17	89	SIBASI SAN MIGUEL	4	12	17	207	U	12	03	J	3	UCSF EL PLATANAR *	S	41217U	1203	\N	\N	G
1686	2	17	89	SIBASI SAN MIGUEL	4	12	22	218	U	12	04	J	3	UCSF ULUAZAPA *	S	41222U	1204	\N	\N	G
1687	2	17	87	SIBASI SAN MIGUEL	4	12	24	201	U	12	08	J	3	UCSF COMACARAN *	S	41224U	1208	\N	\N	G
1688	2	17	63	SIBASI SAN MIGUEL	4	12	25	204	U	12	06	J	3	UCSF EL CUCO *	S	41225U	1206	\N	\N	G
1689	2	17	63	SIBASI SAN MIGUEL	4	12	26	204	U	12	06	J	3	UCSF SAN PEDRO CHIRILAGUA *	S	41226U	1206	\N	\N	G
1690	2	17	89	SIBASI SAN MIGUEL	4	12	27	210	U	12	07	J	3	UCSF QUELEPA *	S	41227U	1207	\N	\N	G
1691	2	17	64	SIBASI SAN MIGUEL	4	12	29	215	U	12	01	J	3	UCSF EL TECOMATAL *	S	41229U	1201	\N	\N	G
1692	2	17	89	SIBASI SAN MIGUEL	4	12	30	215	U	12	01	J	3	UCSF EL NIÑO *	S	41230U	1201	\N	\N	G
1693	2	17	63	SIBASI SAN MIGUEL	4	12	31	204	U	12	06	J	3	UCSF TIERRA BLANCA (CHIRILAGUA) *	S	41231U	1206	\N	\N	G
1694	2	17	89	SIBASI SAN MIGUEL	4	12	32	203	U	12	09	J	3	UCSF EL JOCOTE DULCE *	S	41232U	1209	\N	\N	G
1695	2	17	64	SIBASI SAN MIGUEL	4	12	33	215	U	12	01	J	3	UCSF MARTIN ZALDIVAR COL.CARRILLO *	S	41233U	1201	\N	\N	G
1696	2	17	89	SIBASI SAN MIGUEL	4	12	34	207	U	12	03	J	3	UCSF TONGOLONA *	S	41234U	1203	\N	\N	G
1697	2	17	89	SIBASI SAN MIGUEL	4	12	35	215	U	12	01	J	3	UCSF MIRAFLORES *	S	41235U	1201	\N	\N	G
1698	2	17	87	SIBASI SAN MIGUEL	4	14	8	261	U	14	03	J	3	UCSF YUCUAIQUIN *	S	41408U	1403	\N	\N	G
1699	2	17	89	SIBASI SAN MIGUEL	4	14	20	260	U	14	04	J	3	UCSF YAYANTIQUE *	S	41420U	1404	\N	\N	G
1700	2	17	89	SIBASI SAN MIGUEL	4	12	37	215	U	12	01	J	3	UCSF SAN MIGUEL *	S	41237U	1201	\N	\N	G
1701	2	17	63	SIBASI CIUDAD BARRIOS	4	12	7	212	U	12	19	J	3	UCSF SAN GERARDO *	S	41207U	1219	\N	\N	G
1702	2	17	63	SIBASI CIUDAD BARRIOS	4	12	18	214	U	12	16	J	3	UCSF SAN LUIS DE LA REINA *	S	41218U	1216	\N	\N	G
1703	2	17	63	SIBASI CIUDAD BARRIOS	4	12	20	199	U	12	17	J	3	UCSF CAROLINA *	S	41220U	1217	\N	\N	G
1704	2	17	63	SIBASI CIUDAD BARRIOS	4	12	23	211	U	12	20	J	3	UCSF SAN ANTONIO DEL NORTE *	S	41223U	1220	\N	\N	G
1705	2	17	63	SIBASI NUEVA GUADALUPE	4	11	2	184	U	11	11	J	3	UCSF JUCUAPA *	S	41102U	1111	\N	\N	G
1706	2	17	63	SIBASI NUEVA GUADALUPE	4	11	16	191	U	11	14	J	3	UCSF LAS CHARCAS (SN.BUENA.) *	S	41116U	1114	\N	\N	G
1707	2	17	63	SIBASI NUEVA GUADALUPE	4	11	33	191	U	11	14	J	3	UCSF SAN BUENA VENTURA *	S	41133U	1114	\N	\N	G
1708	2	17	63	SIBASI NUEVA GUADALUPE	4	12	1	203	U	12	09	J	3	UCSF CHINAMECA *	S	41201U	1209	\N	\N	G
1709	2	17	63	SIBASI NUEVA GUADALUPE	4	12	6	207	U	12	03	J	3	UCSF MONCAGUA *	S	41206U	1203	\N	\N	G
1710	2	17	63	SIBASI NUEVA GUADALUPE	4	12	13	206	U	12	13	J	3	UCSF LOLOTIQUE *	S	41213U	1213	\N	\N	G
1711	2	17	63	SIBASI NUEVA GUADALUPE	4	12	36	203	U	12	09	J	3	UCSF LAS MARIAS *	S	41236U	1209	\N	\N	G
1712	2	20	42	SIBASI MORAZAN	4	13	1	230	U	13	02	J	3	UCSF JOCORO *	S	41301U	1302	\N	\N	G
1713	2	20	45	SIBASI MORAZAN	4	13	2	233	U	13	11	J	3	UCSF OSICALA *	S	41302U	1311	\N	\N	G
1714	2	20	41	SIBASI MORAZAN	4	13	3	224	U	13	10	J	3	UCSF EL DIVISADERO *	S	41303U	1310	\N	\N	G
1715	2	20	44	SIBASI MORAZAN	4	13	4	221	U	13	18	J	3	UCSF CORINTO *	S	41304U	1318	\N	\N	G
1716	2	20	33	SIBASI MORAZAN	4	13	5	234	U	13	24	J	3	UCSF PERQUIN *	S	41305U	1324	\N	\N	G
1717	2	20	36	SIBASI MORAZAN	4	13	6	220	U	13	13	J	3	UCSF CACAOPERA *	S	41306U	1313	\N	\N	G
1718	2	20	47	SIBASI MORAZAN	4	13	7	232	U	13	22	J	3	UCSF SAN LUIS (MEANGUERA) *	S	41307U	1322	\N	\N	G
1719	2	20	43	SIBASI MORAZAN	4	13	8	241	U	13	06	J	3	UCSF SOCIEDAD *	S	41308U	1306	\N	\N	G
1720	2	20	39	SIBASI MORAZAN	4	13	9	227	U	13	04	J	3	UCSF GUATAJIAGUA *	S	41309U	1304	\N	\N	G
1721	2	20	34	SIBASI MORAZAN	4	13	10	229	U	13	19	J	3	UCSF JOCOITIQUE *	S	41310U	1319	\N	\N	G
1722	2	20	35	SIBASI MORAZAN	4	13	11	242	U	13	26	J	3	UCSF TOROLA *	S	41311U	1326	\N	\N	G
1723	2	20	47	SIBASI MORAZAN	4	13	12	232	U	13	22	J	3	UCSF MEANGUERA *	S	41312U	1322	\N	\N	G
1724	2	20	35	SIBASI MORAZAN	4	13	13	236	U	13	25	J	3	UCSF SAN FERNANDO (MORAZAN) *	S	41313U	1325	\N	\N	G
1725	2	20	36	SIBASI MORAZAN	4	13	14	228	U	13	21	J	3	UCSF JOATECA *	S	41314U	1321	\N	\N	G
1726	2	20	46	SIBASI MORAZAN	4	13	15	239	U	13	17	J	3	UCSF SAN SIMON *	S	41315U	1317	\N	\N	G
1727	2	20	37	SIBASI MORAZAN	4	13	16	223	U	13	15	J	3	UCSF DELICIAS DE CONCEPCION *	S	41316U	1315	\N	\N	G
1728	2	20	38	SIBASI MORAZAN	4	13	17	222	U	13	05	J	3	UCSF CHILANGA *	S	41317U	1305	\N	\N	G
1729	2	20	39	SIBASI MORAZAN	4	13	18	240	U	13	08	J	3	UCSF SENSEMBRA (YAMABAL) *	S	41318U	1308	\N	\N	G
1730	2	20	46	SIBASI MORAZAN	4	13	19	238	U	13	12	J	3	UCSF SAN ISIDRO (MORAZAN) *	S	41319U	1312	\N	\N	G
1731	2	20	41	SIBASI MORAZAN	4	13	20	235	U	13	03	J	3	UCSF SAN CARLOS (MORAZAN) *	S	41320U	1303	\N	\N	G
1732	2	20	34	SIBASI MORAZAN	4	13	21	225	U	13	20	J	3	UCSF VILLA EL ROSARIO *	S	41321U	1320	\N	\N	G
1733	2	20	45	SIBASI MORAZAN	4	13	22	226	U	13	16	J	3	UCSF GUALOCOCTI *	S	41322U	1316	\N	\N	G
1734	2	20	37	SIBASI MORAZAN	4	13	23	244	U	13	14	J	3	UCSF YOLOAIQUIN *	S	41323U	1314	\N	\N	G
1735	2	20	38	SIBASI MORAZAN	4	13	24	231	U	13	09	J	3	UCSF LOLOTIQUILLO *	S	41324U	1309	\N	\N	G
1736	2	20	33	SIBASI MORAZAN	4	13	25	219	U	13	23	J	3	UCSF ARAMBALA *	S	41325U	1323	\N	\N	G
1737	2	21	3	SIBASI LA UNION	4	14	1	252	U	14	01	J	3	UCSF ENF.ZOILA E.TURCIOS DE JIMENEZ *	S	41401U	1401	\N	\N	G
1738	2	21	7	SIBASI LA UNION	4	14	3	257	U	14	02	J	3	UCSF SAN ALEJO *	S	41403U	1402	\N	\N	G
1739	2	21	96	SIBASI LA UNION	4	14	5	251	U	14	08	J	3	UCSF INTIPUCA *	S	41405U	1408	\N	\N	G
1740	2	21	95	SIBASI LA UNION	4	14	9	248	U	14	07	J	3	UCSF CONCHAGUA *	S	41409U	1407	\N	\N	G
1741	2	21	77	SIBASI LA UNION	4	14	10	262	U	14	10	J	3	UCSF MEANGUERA DEL GOLFO *	S	41410U	1410	\N	\N	G
1742	2	21	96	SIBASI LA UNION	4	14	13	248	U	14	07	J	3	UCSF EL TAMARINDO *	S	41413U	1407	\N	\N	G
1743	2	21	7	SIBASI LA UNION	4	14	15	249	U	14	06	J	3	UCSF OLOMEGA (EL CARMEN) *	S	41415U	1406	\N	\N	G
1744	2	21	3	SIBASI LA UNION	4	14	17	252	U	14	01	J	3	UCSF ISLA ZACATILLO *	S	41417U	1401	\N	\N	G
1745	2	21	77	SIBASI LA UNION	4	14	18	262	U	14	10	J	3	UCSF ISLA CONCHAGUITA (MEANG.D/GOLFO) *	S	41418U	1410	\N	\N	G
1746	2	21	7	SIBASI LA UNION	4	14	21	249	U	14	06	J	3	UCSF EL CARMEN LA UNION *	S	41421U	1406	\N	\N	G
1747	2	21	96	SIBASI LA UNION	4	14	23	252	U	14	01	J	3	UCSF La Unión LU Agua Caliente *	S	41423U	1401	\N	\N	G
1748	2	21	95	SIBASI LA UNION	4	14	24	257	U	14	02	J	3	UCSF HATO NUEVO (SN. ALEJO) *	S	41424U	1402	\N	\N	G
1749	2	21	96	SIBASI LA UNION	4	14	25	248	U	14	07	J	3	UCSF LLANO LOS PATOS *	S	41425U	1407	\N	\N	G
1750	2	21	3	SIBASI LA UNION	4	14	26	252	U	14	01	J	3	UCSF La Unión LU Agua Escondida *	S	41426U	1401	\N	\N	G
1751	2	21	95	SIBASI LA UNION	4	14	27	257	U	14	02	J	3	UCSF BOBADILLA (SAN ALEJO) *	S	41427U	1402	\N	\N	G
1752	2	21	95	SIBASI LA UNION	4	14	29	248	U	14	07	J	3	UCSF EL HUISQUIL (CONCHAGUA) *	S	41429U	1407	\N	\N	G
1753	2	21	3	SIBASI LA UNION	4	14	30	248	U	14	07	J	3	UCSF EL FARO (CONCHAGUA) *	S	41430U	1407	\N	\N	G
1754	2	21	7	SIBASI LA UNION	4	14	31	249	U	14	06	J	3	UCSF EL PICHE *	S	41431U	1406	\N	\N	G
1755	2	21	3	SIBASI LA UNION	4	14	32	252	U	14	01	J	3	UCSF LOS LEONES-SN.CARLOS BORROMEO *	S	41432U	1401	\N	\N	G
1756	2	21	3	SIBASI SANTA ROSA	4	14	2	254	U	14	15	J	3	UCSF Nueva Esparta LU Ana María Alfaro Sánchez *	S	41402U	1415	\N	\N	G
1757	2	21	3	SIBASI SANTA ROSA	4	14	4	255	U	14	12	J	3	UCSF PASAQUINA *	S	41404U	1412	\N	\N	G
1758	2	21	3	SIBASI SANTA ROSA	4	14	6	253	D	14	18	J	6	UCSF EL GUAJINIQUIL (LISLIQUE) *	S	41406D	1418	\N	\N	G
1759	2	21	3	SIBASI SANTA ROSA	4	14	6	245	U	14	13	J	3	UCSF ANAMOROS *	S	41406U	1413	\N	\N	G
1760	2	21	3	SIBASI SANTA ROSA	4	14	7	224	D	13	06	J	6	UCSF TROMPINA/EL BEJUCAL *	S	41407D	1306	\N	\N	G
1761	2	21	3	SIBASI SANTA ROSA	4	14	7	250	U	14	14	J	3	UCSF EL SAUCE *	S	41407U	1414	\N	\N	G
1762	2	21	3	SIBASI SANTA ROSA	4	14	11	247	U	14	16	J	3	UCSF CONCEPCION DE ORIENTE *	S	41411U	1416	\N	\N	G
1763	2	21	3	SIBASI SANTA ROSA	4	14	12	253	U	14	18	J	3	UCSF LISLIQUE *	S	41412U	1418	\N	\N	G
1764	2	21	3	SIBASI SANTA ROSA	4	14	14	254	U	14	15	J	3	UCSF MONTECA *	S	41414U	1415	\N	\N	G
1765	2	21	3	SIBASI SANTA ROSA	4	14	16	246	U	14	05	J	3	UCSF BOLIVAR *	S	41416U	1405	\N	\N	G
1766	2	21	3	SIBASI SANTA ROSA	4	14	19	256	U	14	17	J	3	UCSF POLOROS *	S	41419U	1417	\N	\N	G
1767	2	21	3	SIBASI SANTA ROSA	4	14	22	258	U	14	09	J	3	UCSF SAN JOSE DE LA FUENTE *	S	41422U	1409	\N	\N	G
1768	2	21	3	SIBASI SANTA ROSA	4	14	28	255	U	14	12	J	3	UCSF SAN FELIPE (PASAQUINA) *	S	41428U	1412	\N	\N	G
1769	6	23	115	SIBASI NORTE	5	6	14	98	U	6	10	J	3	UCSF Apopa SS *	S	50614U	0610	\N	\N	G
1770	6	23	114	SIBASI NORTE	5	6	17	105	U	6	11	J	3	UCSF Nejapa SS *	S	50617U	0611	\N	\N	G
1771	6	23	115	SIBASI NORTE	5	6	18	102	U	6	08	J	3	UCSF Guazapa SS *	S	50618U	0608	\N	\N	G
1772	6	23	114	SIBASI NORTE	5	6	19	97	U	6	14	J	3	UCSF Aguilares SS *	S	50619U	0614	\N	\N	G
1773	6	23	113	SIBASI NORTE	5	6	20	114	U	6	07	J	3	UCSF Tonacatepeque SS *	S	50620U	0607	\N	\N	G
1774	6	23	114	SIBASI NORTE	5	6	25	101	U	6	13	J	3	UCSF El Paisnal SS *	S	50625U	0613	\N	\N	G
1775	6	23	113	SIBASI NORTE	5	6	30	114	U	6	07	J	3	UCSF Tonacatepeque SS Distrito Italia *	S	50630U	0607	\N	\N	G
1776	6	23	113	SIBASI NORTE	5	6	31	98	U	6	10	J	3	UCSF Apopa SS Popotlán *	S	50631U	0610	\N	\N	G
1777	6	23	113	SIBASI NORTE	5	6	32	98	U	6	10	J	3	UCSF Apopa SS Chintuc *	S	50632U	0610	\N	\N	G
1778	6	24	60	SIBASI SUR	5	6	1	110	U	6	01	J	3	UCSF San Salvador SS San Jacinto Dr. Mauricio Sol Nerio *	S	50601U	0601	\N	\N	G
1779	6	24	60	SIBASI SUR	5	6	15	108	U	6	19	J	3	UCSF San Marcos SS Dr. Roberto Cáceres B. *	S	50615U	0619	\N	\N	G
1780	6	24	61	SIBASI SUR	5	6	16	112	U	6	15	J	3	UCSF SantoTomas SS Dr. José E. Avalos la Guardia *	S	50616U	0615	\N	\N	G
1781	6	24	60	SIBASI SUR	5	6	21	111	U	6	17	J	3	UCSF Santiago Texacuangos SS *	S	50621U	0617	\N	\N	G
1782	6	24	61	SIBASI SUR	5	6	24	106	U	6	16	J	3	UCSF Panchimalco SS *	S	50624U	0616	\N	\N	G
1783	6	24	61	SIBASI SUR	5	6	26	107	U	6	18	J	3	UCSF Rosario de Mora SS *	S	50626U	0618	\N	\N	G
1784	6	24	61	SIBASI SUR	5	6	34	106	U	6	16	J	3	UCSF Panchimaco SS Planes de Renderos *	S	50634U	0616	\N	\N	G
1785	6	25	59	SIBASI SOYAPANGO	5	6	11	113	U	6	03	J	3	UCSF Soyapango SS  Enf. Zoila M. de Guadrón *	S	50611U	0603	\N	\N	G
1786	6	25	59	SIBASI SOYAPANGO	5	6	22	113	U	6	03	J	3	UCSF Soyapango SS Amatepec *	S	50622U	0603	\N	\N	G
1787	6	25	58	SIBASI SOYAPANGO	5	6	28	113	U	6	03	J	3	UCSF Soyapango SS Unicentro *	S	50628U	0603	\N	\N	G
1788	6	25	58	SIBASI ILOPANGO	5	6	12	103	U	6	12	J	3	UCSF Ilopango SS Santa Lucía *	S	50612U	0612	\N	\N	G
1789	6	25	58	SIBASI ILOPANGO	5	6	13	109	U	6	09	J	3	UCSF San Martín SS *	S	50613U	0609	\N	\N	G
1790	6	25	58	SIBASI ILOPANGO	5	6	27	122	U	7	10	J	3	UCSF SAN BARTOLOME PERULAPIA *	S	50627U	0710	\N	\N	G
1791	6	27	49	SIBASI CENTRO	5	6	2	110	U	6	01	J	3	UCSF San Salvador SS San Miguelito  Dr. Juan R. Alvarenga *	S	50602U	0601	\N	\N	G
1792	6	27	50	SIBASI CENTRO	5	6	3	110	U	6	01	J	3	UCSF San Salvador SS Concepción *	S	50603U	0601	\N	\N	G
1793	6	27	48	SIBASI CENTRO	5	6	4	110	U	6	01	J	3	UCSF San Salvador SS Barrios *	S	50604U	0601	\N	\N	G
1794	6	27	48	SIBASI CENTRO	5	6	5	110	U	6	01	J	3	UCSF San Salvador SS Monserrat *	S	50605U	0601	\N	\N	G
1795	6	27	50	SIBASI CENTRO	5	6	6	110	U	6	01	J	3	UCSF San Salvador SS Loudes *	S	50606U	0601	\N	\N	G
1796	6	27	51	SIBASI CENTRO	5	6	7	104	U	6	06	J	3	UCSF Zacamil SS *	S	50607U	0606	\N	\N	G
1797	6	27	52	SIBASI CENTRO	5	6	8	104	U	6	02	J	3	UCSF Mejicanos SS Dr. Hugo Morán Quijada *	S	50608U	0602	\N	\N	G
1798	6	27	52	SIBASI CENTRO	5	6	9	100	U	6	05	J	3	UCSF Cuscatancingo SS *	S	50609U	0605	\N	\N	G
1799	6	27	49	SIBASI CENTRO	5	6	10	115	U	6	04	J	3	UCSF Ciudad Delgado SS *	S	50610U	0604	\N	\N	G
1800	6	27	51	SIBASI CENTRO	5	6	23	110	U	6	01	J	3	UCSF San Salvador SS San Antonio Abad *	S	50623U	0601	\N	\N	G
1801	6	27	49	SIBASI CENTRO	5	6	29	115	U	6	04	J	3	UCSF Ciudad Delgado SS Hábitat Confien *	S	50629U	0604	\N	\N	G
1802	6	27	49	SIBASI CENTRO	5	6	33	100	U	6	05	J	3	UCSF Cuscatancingo SS Villa Mariona *	S	50633U	0605	\N	\N	G
1803	4	9	107	SIBASI SUCHITOTO	3	7	2	124	U	7	15	J	3	UCSF SAN JOSE GUAYABAL *	S	30702U	0715	\N	\N	G
1804	4	9	107	SIBASI SUCHITOTO	3	7	10	121	U	7	16	J	3	UCSF ORATORIO DE CONCEPCION *	S	30710U	0716	\N	\N	G
1805	6	25	58	SIBASI ILOPANGO	5	6	35	114	U	6	07	J	3	UCSF Tonacatepeque SS Alta Vista *	S	50635U	0607	\N	\N	G
1806	1	2	13	SIBASI METAPAN	\N	\N	\N	19	NULL	2	NULL	J	\N	UCSF METAPAN *	NULL	NULL	NULL	\N	\N	G
1827	2	20	33	NULL	\N	\N	\N	232	NULL	13	NULL	J	\N	UCSF Meanguera MO El Mozote	NULL	NULL	NULL	\N	\N	G
1808	1	5	20	NULL	\N	\N	\N	40	NULL	3	NULL	J	\N	UCSF SONSONATE *	NULL	NULL	NULL	\N	\N	G
1809	5	8	24	NULL	\N	\N	\N	94	NULL	5	NULL	J	\N	UCSF TEOTEPEQUE *	NULL	NULL	NULL	\N	\N	G
1810	2	14	79	NULL	\N	\N	\N	189	NULL	11	NULL	J	\N	UCSF ESPIRITU SANTO *	NULL	NULL	NULL	\N	\N	G
1811	5	6	119	NULL	\N	\N	\N	57	NULL	4	NULL	J	\N	UCSF NUEVA CONCEPCION *	NULL	NULL	NULL	\N	\N	G
1812	5	6	70	NULL	\N	\N	\N	48	NULL	4	NULL	J	\N	UCSF CHALATENANGO *	NULL	NULL	NULL	\N	\N	G
1813	2	21	3	NULL	\N	\N	\N	259	NULL	14	NULL	J	\N	UCSF PERIFERICA SANTA ROSA DE LIMA *	NULL	NULL	NULL	\N	\N	G
1814	2	20	39	NULL	\N	\N	\N	243	NULL	13	NULL	J	\N	UCSF SAN JUAN DE LA CRUZ YAMABAL *	NULL	NULL	NULL	\N	\N	G
1815	2	20	33	NULL	\N	\N	\N	234	NULL	13	NULL	J	\N	UCSF RANCHO QUEMADO FOSALUD *	NULL	NULL	NULL	\N	\N	G
1816	2	17	63	NULL	\N	\N	\N	200	NULL	12	NULL	J	\N	UCSF PERIFERICA CIUDAD BARRIOS *	NULL	NULL	NULL	\N	\N	G
1817	4	9	107	NULL	\N	\N	\N	117	NULL	7	NULL	J	\N	UCSF PERIFERICA DE COJUTEPEQUE *	NULL	NULL	NULL	\N	\N	G
1818	5	8	22	NULL	\N	\N	\N	77	NULL	5	NULL	J	\N	UCSF COLON LL EL BOTONCILLAL *	NULL	NULL	NULL	\N	\N	G
1819	2	21	3	NULL	\N	\N	\N	252	NULL	14	NULL	J	\N	UCSF LA PLAYA *	NULL	NULL	NULL	\N	\N	G
1820	2	14	79	NULL	\N	\N	\N	198	NULL	11	NULL	J	\N	UCSF USULUTAN US *	NULL	NULL	NULL	\N	\N	G
1821	5	6	119	NULL	\N	\N	\N	48	NULL	4	NULL	J	\N	UCSF CHALATENANGO CH GUARJILA *	NULL	NULL	NULL	\N	\N	G
1822	6	25	112	NULL	\N	\N	\N	103	NULL	6	NULL	J	\N	UCSF Ilopango SS *	NULL	NULL	NULL	\N	\N	G
1823	2	14	83	NULL	\N	\N	\N	198	NULL	11	NULL	J	\N	UCSF Jiquilisco US *	NULL	NULL	NULL	\N	\N	G
1824	2	20	40	NULL	\N	\N	\N	237	NULL	13	NULL	J	\N	UCSF San Francisco Gotera MO *	NULL	NULL	NULL	\N	\N	G
1825	2	14	79	NULL	\N	\N	\N	198	NULL	11	NULL	P	\N	Unidad Medica ISSS Usulutan US	NULL	NULL	NULL	\N	\N	G
1826	2	14	81	NULL	\N	\N	\N	189	NULL	11	NULL	P	\N	Unidad Medica ISSS Usulutan US Puerto El Triunfo	NULL	NULL	NULL	\N	\N	G
1828	2	21	128	NULL	\N	\N	\N	259	NULL	14	NULL	J	\N	UCSF Santa Rosa de Lima LU El Portillo	NULL	NULL	NULL	\N	\N	G
1830	2	17	91	NULL	\N	\N	\N	214	NULL	12	NULL	J	\N	UCSF San Luis de la Reina SM	NULL	NULL	NULL	\N	\N	G
\.


--
-- Data for Name: cat_fuentefinanciamiento; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY cat_fuentefinanciamiento (id_fuentefinanciamiento, descripcion) FROM stdin;
3	GOES
4	PNUD
5	RHESSA
6	FOSALUD
8	UNICEF
12	USAID/FORT.DE LA SALUD
14	DONACIONES
17	APSISA
18	UCP FONDO GLOBAL
19	DR CAFTA 11/2008 10%
20	DR CAFTA 13/2008 10%
21	Supervivencia Infantil
22	EFRAP Pr2207 D-5190308
23	PATRONATOS
24	Programa Nac. ITS/VIH/SIDA
25	Programa Nac. Tuberculosis
26	Programa Nac. Chagas
27	OPS
31	UNFPA
34	FONDO ACT. ESPECIALES
36	OTROS
37	Proyecto SALSA
38	APSISA
41	Proyecto HOPE
42	ASOC.DEMOGRAFICA SAL
43	Luxemburgo
44	FOPROMID
45	AECID
46	ASOCIACION PASMO
47	PRESTAMO- GUATEMALA
49	PEIS
50	PEIS Cobertura
51	CARE International
52	COOPERACION ESPAÑOLA
53	PLAN EL SALVADOR
54	BID
56	FUSAL
57	ORDEN DE MALTA
60	Tesoreria-Hospital
61	HNCH/DRIS
62	PLANIFICACION FAMILIAR
63	UCP(UNIDAD COORD. PROG
64	PRESTAMOS EXTERNOS
65	Fondos Propios Hospital
66	FISDL
67	FONDO CIRCULANTE
68	Italiana HNCH/DRIS
69	Fondo Global RCC
70	INTERVIDA
71	A.I.D.
72	FDO.CHILE
74	SETEFE
75	SEC. NAC.FAMILIA
101	FORTALECIMIENTO DE LA SALUD
102	JICA
103	BASIC HELP
104	CDC
105	AGCI
106	CONASIDA
107	ONUSIDA
108	OIEA
110	APROQUEN
111	Gobierno de Nicaragua
112	FOCARD-APS
113	HMN (Red Métrica de Salud, OMS)
114	Asociación Panamericana de oftalmología
115	INCAP
116	enfants du Monde Universidad de Antioquia
117	SICA/FOCARD-APS
118	Dirección General de los CENDI, México
149	Fondo Mundial
150	Unión Internacional contra la Tuberculosis y Enfermedades Respiratorias
151	Ministerio del Poder Popular para la Cultura de la Rep. Boliviana de Venezuela
152	Fundación Mundial de Diabetes de Dinamarca, OPS/OMS y el Ministerio de Salud de Brasil
154	Universidad de Texas
155	Ministerio de Defensa Nacional
156	Women Delivery
157	FAO
158	ONT
159	Ministerio de Salud de Costa Rica
160	USAID/PASCA
161	USDA
162	Embajada de México
163	Cáritas México
164	ICGES
165	IOCIM
166	Ministerio de Salud de Brasil
167	Comunidad de Software libre Universidad de Costa Rica
168	Gobierno China Taiwan
170	Centro Asociado Centroamericano Cátedra UNESCO
171	Gobierno de Colombia
172	BASIC HEALTH
173	Hospital Winthrop
174	Organizadores del evento
175	ICREETT
176	Fundación San Lázaro
177	DELIVER
179	Agencia Brasileña de Cooperación
180	TEPHINET
181	REDACS
182	FONDO GLOBAL
183	PMA
184	Hospital Sant Joan Déu
185	IILA
186	FLASOG
187	IPAS
188	FECCAP
189	OSALDE
190	REDISAL
191	IANPHI
192	Universidad del Valle de Guatemala
193	Secretaria General Técnica del Ministerio de Sanidad y Política Social Española
194	Acción Social de Colombia
195	Proyecto Centroamericano de Fortificación de Alimentos con Ácido Fólico y otros
196	Universidad Peruana Cayetano Heredia
197	Ronda 7 Fondo Mundial
198	Federación Mundial de Hemofilia
199	Oficina Internacional de Comunidad Colaborativa de Recursos Humanos para la Salud COCORH
200	ISSS
201	CMB
202	Programa Regional REDCA+
203	URC/USAID
204	OPS/Hospital de Medellin, Colombia
205	AECID y ACPP de España
206	CBM
207	M.S.Uruguay
208	Médicos Mundi
209	Escuela Nacional de Enfermeras de Guatemala
210	PASMO
211	UNESCO-Universidad Nacional de Colombia
212	M.S.Brasil
213	Comando Sur de los Estados Unidos
238	CECOLFES
239	CDC/INSP
240	ISGLOBAL
241	CDC-UVG
242	ALAPE
243	Agencia Brasileña de Cooperación ABC
244	Programa Regional de TB
245	Asociación Salvadoreña de Infectología
246	Asociación de Neurocirugía de ES
247	Gobierno de la República de Italia
\.


--
-- Data for Name: cat_genero; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY cat_genero (id_genero, descripcion) FROM stdin;
1	Masculino
2	Femenino
\.


--
-- Data for Name: cat_municipio; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY cat_municipio (id_municipio, descripcion, id_departamento, depto_digestyc, munic_digestyc, abrev_depto, abrev_municipio) FROM stdin;
26	ACAJUTLA SO	3	03	01	SO	ACAJUTLA SO
42	AGUA CALIENTE CH	4	04	01	CH	AGUA CALIENTE CH
97	AGUILARES SS	6	06	01	SS	AGUILARES SS
2	APANECA AH	1	01	02	AH	APANECA AH
98	APOPA SS	6	06	02	SS	APOPA SS
43	ARCATAO CH	4	04	02	CH	ARCATAO CH
27	ARMENIA SO	3	03	02	SO	ARMENIA SO
3	ATIQUIZAYA AH	1	01	03	AH	ATIQUIZAYA AH
44	AZACUALPA CH	4	04	03	CH	AZACUALPA CH
28	CALUCO SO	3	03	03	SO	CALUCO SO
116	CANDELARIA CU	7	07	01	CU	CAND. CU
13	CANDELARIA DE LA FRONTERA SA	2	02	01	SA	CAND.FRONTERA SA
48	CHALATENANGO CH	4	04	07	CH	CHALATENANGO CH
45	CITALA CH	4	04	04	CH	CITALA CH
76	CIUDAD ARCE LL	5	05	02	LL	C.ARCE LL
14	COATEPEQUE SA	2	02	02	SA	COATEPEQUE SA
117	COJUTEPEQUE CU	7	07	02	CU	COJUTEPEQUE CU
77	COLON LL	5	05	03	LL	COLON LL
78	COMASAGUA LL	5	05	04	LL	COMASAGUA LL
4	CONCEPCION DE ATACO AH	1	01	04	AH	CONC.ATACO AH
29	CUISNAHUAT SO	3	03	04	SO	CUISNAHUAT SO
100	CUSCATANCINGO SS	6	06	04	SS	CUSCATANCINGO SS
115	DELGADO SS	6	06	19	SS	DELGADO SS
49	DULCE NOMBRE DE MARIA CH	4	04	08	CH	DULCE NOMBRE DE MARIA CH
118	EL CARMEN CU	7	07	03	CU	CARM.CU
50	EL CARRIZAL CH	4	04	09	CH	CARRIZAL CH
16	EL CONGO SA	2	02	04	SA	CONGO SA
51	EL PARAISO CH	4	04	10	CH	PARAISO CH
17	EL PORVENIR SA	2	02	05	SA	PORVENIR SA
5	EL REFUGIO AH	1	01	05	AH	REFUGIO AH
119	EL ROSARIO CU	7	07	04	CU	ROSAR.CU
102	GUAZAPA SS	6	06	06	SS	GUAZAPA SS
80	HUIZUCAR LL	5	05	06	LL	HUIZUCAR LL
103	ILOPANGO SS	6	06	07	SS	ILOPANGO SS
31	IZALCO SO	3	03	06	SO	IZALCO SO
81	JAYAQUE LL	5	05	07	LL	JAYAQUE LL
32	JUAYUA SO	3	03	07	SO	JUAYUA SO
7	JUJUTLA AH	1	01	07	AH	JUJUTLA AH
52	LA LAGUNA CH	4	04	11	CH	LAGUNA CH
83	LA LIBERTAD LL	5	05	09	LL	LA LIBERTAD LL
53	LA PALMA CH	4	04	12	CH	PALMA CH
69	LAS FLORES CH	4	04	28	CH	FLORES CH
55	LAS VUELTAS CH	4	04	14	CH	VUELTAS CH
18	MASAHUAT SA	2	02	06	SA	MASAHUAT SA
19	METAPAN SA	2	02	07	SA	METAPAN SA
34	NAHUILINGO SO	3	03	09	SO	NAHUILINGO SO
33	NAHUIZALCO SO	3	03	08	SO	NAHUIZALCO SO
105	NEJAPA SS	6	06	09	SS	NEJAPA SS
57	NUEVA CONCEPCION CH	4	04	16	CH	NV.CONCEPCION CH
58	NUEVA TRINIDAD CH	4	04	17	CH	NV.TRINIDAD CH
84	NUEVO CUSCATLAN LL	5	05	10	LL	NV.CUSCATLAN LL
106	PANCHIMALCO SS	6	06	10	SS	PANCHIMALCO SS
60	POTONICO CH	4	04	19	CH	POTONICO CH
86	QUEZALTEPEQUE LL	5	05	12	LL	QUEZALTEPEQUE LL
22	SANTA ANA SA	2	02	10	SA	S.ANA SA
61	SAN ANTONIO DE LA CRUZ CH	4	04	20	CH	S.ANT.CRUZ CH
36	SAN ANTONIO DEL MONTE SO	3	03	11	SO	S.ANT.MONTE SO
62	SAN ANTONIO LOS RANCHOS CH	4	04	21	CH	S.ANT.RANCHOS CH
38	SANTA CATARINA MASAHUAT SO	3	03	13	SO	S.CATARINA MASAHUAT SO
39	SANTO DOMINGO DE GUZMAN SO	3	03	14	SO	S.DOM.GUZMAN SO
63	SAN FERNANDO CH	4	04	22	CH	S.FDO.CH
64	SAN FRANCISCO LEMPA CH	4	04	23	CH	S.FCO.LEMPA CH
65	SAN FRANCISCO MORAZAN CH	4	04	24	CH	S.FCO.MORAZAN CH
66	SAN IGNACIO CH	4	04	25	CH	S.IGNACIO CH
30	SANTA ISABEL ISHUATAN SO	3	03	05	SO	S.ISABEL ISHUATAN SO
68	SAN JOSE CANCASQUE CH	4	04	27	CH	S.JSE.CANCASQUE CH
88	SAN JOSE VILLANUEVA LL	5	05	14	LL	S.JSE.VILLANUEVA LL
89	SAN JUAN OPICO LL	5	05	15	LL	S.JN.OPICO LL
37	SAN JULIAN SO	3	03	12	SO	S.JULIAN SO
9	SAN LORENZO AH	1	01	09	AH	S.LOREN.AH
108	SAN MARCOS SS	6	06	12	SS	S.MARCOS SS
109	SAN MARTIN SS	6	06	13	SS	S.MARTIN SS
90	SAN MATIAS LL	5	05	16	LL	S.MATIAS LL
71	SAN MIGUEL DE MERCEDES CH	4	04	30	CH	S.MIG.DE MERCEDES CH
10	SAN PEDRO PUXTLA AH	1	01	10	AH	S.PED.PUXTLA AH
72	SAN RAFAEL CH	4	04	31	CH	S.RAF.CH
73	SANTA RITA CH	4	04	32	CH	S.RITA CH
23	SANTA ROSA GUACHIPILIN SA	2	02	11	SA	S.ROS.GUACHIPILIN SA
110	SAN SALVADOR SS	6	06	14	SS	S.SALVADOR SS
85	SANTA TECLA LL	5	05	11	LL	S.TECLA LL
112	SANTO TOMAS SS	6	06	16	SS	S.TOMAS SS
87	SACACOYO LL	5	05	13	LL	SACACOYO LL
35	SALCOATITAN SO	3	03	10	SO	SALCOATITAN SO
111	SANTIAGO TEXACUANGOS SS	6	06	15	SS	SGO.TEXACUANGOS SS
40	SONSONATE SO	3	03	15	SO	SONSONATE SO
41	SONZACATE SO	3	03	16	SO	SONZACATE SO
113	SOYAPANGO SS	6	06	17	SS	SOYAPANGO SS
93	TALNIQUE LL	5	05	19	LL	TALNIQUE LL
74	TEJUTLA CH	4	04	33	CH	TEJUTLA CH
94	TEOTEPEQUE LL	5	05	20	LL	TEOTEPEQUE LL
95	TEPECOYO LL	5	05	21	LL	TEPECOYO LL
25	TEXISTEPEQUE SA	2	02	13	SA	TEXISTEPEQUE SA
12	TURIN AH	1	01	12	AH	TURIN AH
96	ZARAGOZA LL	5	05	22	LL	ZARAGOZA LL
79	CHILTIUPAN LL	5	05	05	LL	CHIL_LL
219	ARAMBALA MO	13	13	01	MO	ARAMBALA MO
220	CACAOPERA MO	13	13	02	MO	CACAOPERA MO
178	CALIFORNIA US	11	11	03	US	CALIFORNIA US
199	CAROLINA SM	12	12	01	SM	CAROLINA SM
222	CHILANGA MO	13	13	04	MO	CHILANGA MO
203	CHINAMECA SM	12	12	05	SM	CHINAMECA SM
204	CHIRILAGUA SM	12	12	06	SM	CHIRILAGUA SM
154	CINQUERA CA	9	09	01	CA	CINQUERA CA
201	COMACARAN SM	12	12	03	SM	COMACARAN SM
179	CONCEPCION BATRES US	11	11	04	US	CONC.BATRES US
221	CORINTO MO	13	13	03	MO	CORINTO MO
132	CUYULTITAN LP	8	08	01	LP	CUYULTITAN LP
162	DOLORES CA	9	09	09	CA	DOLORES CA
224	EL DIVISADERO MO	13	13	06	MO	DIVISADERO MO
133	EL ROSARIO LP	8	08	02	LP	ROSAR.LP
225	EL ROSARIO MO	13	13	07	MO	ROSAR.MO
205	EL TRANSITO SM	12	12	07	SM	TRANSITO SM
180	EL TRIUNFO US	11	11	05	US	TRIUNFO US
181	EREGUAYQUIN US	11	11	06	US	EREGUAYQUIN US
155	GUACOTECTI CA	9	09	02	CA	GUACOTECTI CA
164	GUADALUPE SV	10	10	02	SV	GUADALUPE SV
226	GUALOCOCTI MO	13	13	08	MO	GUALOCOCTI MO
227	GUATAJIAGUA MO	13	13	09	MO	GUATAJIAGUA MO
183	JIQUILISCO US	11	11	08	US	JIQUILISCO US
228	JOATECA MO	13	13	10	MO	JOATECA MO
229	JOCOAITIQUE MO	13	13	11	MO	JOCOAITIQUE MO
230	JOCORO MO	13	13	12	MO	JOCORO MO
184	JUCUAPA US	11	11	09	US	JUCUAPA US
157	JUTIAPA CA	9	09	04	CA	JUTIAPA CA
206	LOLOTIQUE SM	12	12	08	SM	LOLOTIQUE SM
231	LOLOTIQUILLO MO	13	13	13	MO	LOLOTIQUILLO MO
232	MEANGUERA MO	13	13	14	MO	MEANGUERA MO
186	MERCEDES UMANA US	11	11	11	US	MER.UMANA US
207	MONCAGUA SM	12	12	09	SM	MONCAGUA SM
187	NUEVA GRANADA US	11	11	12	US	NV.GRANADA US
209	NUEVO EDEN DE SAN JUAN SM	12	12	11	SM	NV.EDEN S.JUAN SM
136	OLOCUILTA LP	8	08	05	LP	OLOCUILTA LP
121	ORATORIO DE CONCEPCION CU	7	07	06	CU	ORAT.CONCEPCION CU
233	OSICALA MO	13	13	15	MO	OSICALA MO
188	OZATLAN US	11	11	13	US	OZATLAN US
234	PERQUIN MO	13	13	16	MO	PERQUIN MO
189	PUERTO EL TRIUNFO US	11	11	14	US	PTO.TRIUNFO US
210	QUELEPA SM	12	12	12	SM	QUELEPA SM
190	SAN AGUSTIN US	11	11	15	US	S.AGUSTIN US
122	SAN BARTOLOME PERULAPIA CU	7	07	07	CU	S.B PERULAPIA CU
191	SAN BUENAVENTURA US	11	11	16	US	S.BUENAVENTURA US
235	SAN CARLOS MO	13	13	17	MO	S.CARLOS MO
166	SANTA CLARA SV	10	10	04	SV	S.CLARA SV
128	SANTA CRUZ ANALQUITO CU	7	07	13	CU	S.CZ.ANALQUITO CU
129	SANTA CRUZ MICHAPA CU	7	07	14	CU	S.CZ.MICHAPA CU
192	SAN DIONISIO US	11	11	17	US	S.DIONISIO US
193	SANTA ELENA US	11	11	18	US	S.ELENA US
139	SAN EMIGDIO LP	8	08	08	LP	S.EMIGDIO LP
236	SAN FERNANDO MO	13	13	18	MO	S.FDO.MO
237	SAN FRANCISCO GOTERA MO	13	13	19	MO	S.FCO.GOTERA MO
194	SAN FRANCISCO JAVIER US	11	11	19	US	S.FCO.JAVIER US
212	SAN GERARDO SM	12	12	14	SM	S.GERARDO SM
158	SAN ISIDRO CA	9	09	05	CA	S.ISID.CA
213	SAN JORGE SM	12	12	15	SM	S.JORGE SM
124	SAN JOSE GUAYABAL CU	7	07	09	CU	S.JSE.GUAYABAL CU
141	SAN JUAN NONUALCO LP	8	08	10	LP	S.JN.NONUALCO LP
143	SAN JUAN TEPEZONTES LP	8	08	12	LP	S.JN.TEPEZONTES LP
170	SAN LORENZO SV	10	10	08	SV	S.LOREN.SV
153	SAN LUIS DE LA HERRADURA LP	8	08	22	LP	S.LS.HERRADURA LP
214	SAN LUIS DE LA REINA SM	12	12	16	SM	S.LS.REINA SM
195	SANTA MARIA US	11	11	20	US	S.MA.US
215	SAN MIGUEL SM	12	12	17	SM	S.MIG.SM
145	SAN MIGUEL TEPEZONTES LP	8	08	14	LP	S.MIG.TEPEZONTES LP
147	SAN PEDRO NONUALCO LP	8	08	16	LP	S.PED.NONUALCO LP
125	SAN PEDRO PERULAPAN CU	7	07	10	CU	S.PED.PERULAPAN CU
126	SAN RAFAEL CEDROS CU	7	07	11	CU	S.RAF.CEDROS CU
148	SAN RAFAEL OBRAJUELO LP	8	08	17	LP	S.RAF.OBRAJUELO LP
127	SAN RAMON CU	7	07	12	CU	S.RAMON CU
171	SAN SEBASTIAN SV	10	10	09	SV	S.SEB.SV
239	SAN SIMON MO	13	13	21	MO	S.SIMON MO
172	SAN VICENTE SV	10	10	10	SV	S.VICENTE SV
196	SANTIAGO DE MARIA US	11	11	21	US	SGO.MARIA US
217	SESORI SM	12	12	19	SM	SESORI SM
130	SUCHITOTO CU	7	07	15	CU	SUCHITOTO CU
151	TAPALHUACA LP	8	08	20	LP	TAPALHUACA LP
197	TECAPAN US	11	11	22	US	TECAPAN US
131	TENANCINGO CU	7	07	16	CU	TENANCINGO CU
174	TEPETITAN SV	10	10	12	SV	TEPETITAN SV
218	ULUAZAPA SM	12	12	20	SM	ULUAZAPA SM
198	USULUTAN US	11	11	23	US	USULUTAN US
175	VERAPAZ SV	10	10	13	SV	VERAPAZ SV
152	ZACATECOLUCA LP	8	08	21	LP	ZACATECOLUCA LP
163	APASTEPEQUE SV	10	10	01	SV	APAT_SV
1	AHUACHAPAN AH	1	01	01	AH	AHUACHAPAN AH
176	ALEGRIA US	11	11	01	US	ALEGRIA US
245	ANAMOROS LU	14	14	01	LU	ANAMOROS LU
75	ANTIGUO CUSCATLAN LL	5	05	01	LL	ANTIGUO CUSCATLAN LL
99	AYUTUXTEPEQUE SS	6	06	03	SS	AYUTUXTEPEQUE SS
177	BERLIN US	11	11	02	US	BERLIN US
246	BOLIVAR LU	14	14	02	LU	BOLIVAR LU
15	CHALCHUAPA SA	2	02	03	SA	CHALCHUAPA SA
202	CHAPELTIQUE SM	12	12	04	SM	CHAPELTIQUE SM
200	CIUDAD BARRIOS SM	12	12	02	SM	C.BARRIOS SM
46	COMALAPA CH	4	04	05	CH	COMALAPA CH
247	CONCEPCION ORIENTE LU	14	14	03	LU	CONC.ORIENTE LU
47	CONCEPCION QUEZALTEPEQUE CH	4	04	06	CH	CONC.QUEZALTEPEQUE CH
248	CONCHAGUA LU	14	14	04	LU	CONCHAGUA LU
266	Costa Rica	18			NULL	Costa Rica
223	DELICIAS DE CONCEPCION MO	13	13	05	MO	DELICIAS DE CONCEPCION MO
249	EL CARMEN LU	14	14	05	LU	CARM.LU
101	EL PAISNAL SS	6	06	05	SS	PAISNAL SS
182	ESTANZUELAS US	11	11	07	US	ESTANZUELAS US
263	Guatemala	15			NULL	Guatemala
6	GUAYMANGO AH	1	01	06	AH	GUAYMANGO AH
264	Honduras	16			NULL	Honduras
251	INTIPUCA LU	14	14	07	LU	INTIPUCA LU
134	JERUSALEN LP	8	08	03	LP	JERUSALEN LP
82	JICALAPA LL	5	05	08	LL	JICALAPA LL
185	JUCUARAN US	11	11	10	US	JUCUARAN US
54	LA REINA CH	4	04	13	CH	REINA CH
252	LA UNION LU	14	14	08	LU	UNION LU
253	LISLIQUE LU	14	14	09	LU	LISLIQUE LU
262	MEANGUERA DEL GOLFO LU	14	14	10	LU	MEANGUERA DEL GOLFO LU
104	MEJICANOS SS	6	06	08	SS	MEJICANOS SS
135	MERCEDES DE LA CEIBA LP	8	08	04	LP	MER.CEIBA LP
265	Nicaragua	17			NULL	Nicaragua
56	NOMBRE DE JESUS CH	4	04	15	CH	NOMBRE DE JESUS CH
254	NUEVA ESPARTA LU	14	14	11	LU	NV.ESPARTA LU
208	NUEVA GUADALUPE SM	12	12	10	SM	NV.GUADALUPE SM
59	OJOS DE AGUA CH	4	04	18	CH	OJOS AGUA CH
268	Otros Paises	20			NULL	Otros Paises
267	Panamá	19			NULL	Panamá
137	PARAISO DE OSORIO LP	8	08	06	LP	PARAI.OSORIO LP
255	PASAQUINA LU	14	14	12	LU	PASAQUINA LU
256	POLOROS LU	14	14	13	LU	POLOROS LU
107	ROSARIO DE MORA SS	6	06	11	SS	ROSAR.MORA SS
257	SAN ALEJO LU	14	14	14	LU	S.ALEJO LU
20	SAN ANTONIO PAJONAL SA	2	02	08	SA	S.ANT.PAJONAL SA
211	SAN ANTONIO SM	12	12	13	SM	S.ANT.SM
165	SAN CAYETANO ISTEPEQUE SV	10	10	03	SV	S.CAYETANO ISTEPEQUE SV
167	SANTO DOMINGO SV	10	10	05	SV	S.DOM.SV
140	SAN FRANCISCO CHINAMECA LP	8	08	09	LP	S.FCO.CHINAMECA LP
8	SAN FRANCISCO MENENDEZ AH	1	01	08	AH	S.FCO.MENENDEZ AH
67	SAN ISIDRO LABRADOR CH	4	04	26	CH	S.ISID.LABRADOR CH
238	SAN ISIDRO MO	13	13	20	MO	S.ISID.MO
258	SAN JOSE LU	14	14	15	LU	S.JSE.LU
142	SAN JUAN TALPA LP	8	08	11	LP	S.JN.TALPA LP
70	SAN LUIS DEL CARMEN CH	4	04	29	CH	S.LS.CARMEN CH
144	SAN LUIS TALPA LP	8	08	13	LP	S.LS.TALPA LP
91	SAN PABLO TACACHICO LL	5	05	17	LL	S.PABLO TACACHICO LL
146	SAN PEDRO MASAHUAT LP	8	08	15	LP	S.PED.MASAHUAT LP
216	SAN RAFAEL ORIENTE SM	12	12	18	SM	S.RAF.ORIENTE SM
259	SANTA ROSA DE LIMA LU	14	14	16	LU	S.ROS.LIMA LU
21	SAN SEBASTIAN SALITRILLO SA	2	02	09	SA	S.SEB.SALITRILLO SA
24	SANTIAGO DE LA FRONTERA SA	2	02	12	SA	SGO.FRONTERA SA
150	SANTIAGO NONUALCO LP	8	08	19	LP	SGO.NONUALCO LP
240	SENSEMBRA MO	13	13	22	MO	SENSEMBRA MO
92	TAMANIQUE LL	5	05	18	LL	TAMANIQUE LL
160	TEJUTEPEQUE CA	9	09	07	CA	TEJUTEPEQUE CA
114	TONACATEPEQUE SS	6	06	18	SS	TONACATEPEQUE SS
242	TOROLA MO	13	13	24	MO	TOROLA MO
161	VICTORIA CA	9	09	08	CA	VICTORIA CA
243	YAMABAL MO	13	13	25	MO	YAMABAL MO
260	YAYANTIQUE LU	14	14	17	LU	YAYANTIQUE LU
244	YOLOAIQUIN MO	13	13	26	MO	YOLOAIQUIN MO
261	YUCUAIQUIN LU	14	14	18	LU	YUCUAIQUIN LU
250	EL SAUCE LU	14	14	06	LU	SAUC_LU
156	ILOBASCO CA	9	09	03	CA	ILOB_CA
120	MONTE SAN JUAN CU	7	07	05	CU	MTSJ_CU
138	SAN ANTONIO MASAHUAT LP	8	08	07	LP	SAMH_LP
123	SAN CRISTOBAL CU	7	07	08	CU	SCRI_CU
168	SAN ESTEBAN CATARINA SV	10	10	06	SV	SECT_SV
169	SAN ILDEFONSO SV	10	10	07	SV	SILD_SV
149	SANTA MARIA OSTUMA LP	8	08	18	LP	SMOS_LP
159	SENSUNTEPEQUE CA	9	09	06	CA	SENQ_CA
241	SOCIEDAD MO	13	13	23	MO	SOCD_MO
11	TACUBA AH	1	01	11	AH	TACB_AH
173	TECOLUCA SV	10	10	11	SV	TECO_SV
\.


--
-- Data for Name: cat_periodo_indicador; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY cat_periodo_indicador (id_periodo_indicador, descripcion) FROM stdin;
1	Anual
2	Semestral
3	Trimestral
4	Bimensual
5	Mensual
6	Quincenal
7	Semanal
\.


--
-- Data for Name: cat_presentacion; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY cat_presentacion (id_presentacion, descripcion) FROM stdin;
1	Barra
2	Linea
3	Circular
\.


--
-- Data for Name: cat_programas; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY cat_programas (id_programa, descripcion) FROM stdin;
1	Programa Nacional de Nutrición
2	Programa Nacional ITS/VIH/SIDA
3	Programa Nacional de Tuberculosis y Enfermades respiratorias
4	Programa de Planificación Familiar
\.


--
-- Data for Name: cat_regiones; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY cat_regiones (id_region, descripcion) FROM stdin;
1	Occidental
2	Oriental
4	Paracentral
3	Central
5	Metropolitana
\.


--
-- Data for Name: cat_regiones_sinab; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY cat_regiones_sinab (id_region_sinab, descripcion) FROM stdin;
1	Occidental
2	Central
3	Paracentral
4	Oriental
5	Metropolitana
\.


--
-- Data for Name: cat_sexo; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY cat_sexo (id_sexo, descripcion, inicial) FROM stdin;
1	Hombre	M
2	Mujer	F
\.


--
-- Data for Name: cat_sibasi; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY cat_sibasi (idsibasi, nomsibasi, id_region) FROM stdin;
1	SIBASI AHUACHAPAN	1
2	SIBASI SANTA ANA	1
5	SIBASI SONSONATE	1
6	SIBASI CHALATENANGO	5
8	SIBASI LA LIBERTAD	5
9	SIBASI CUSCATLAN	4
10	SIBASI LA PAZ	4
12	SIBASI CABAÑAS	4
13	SIBASI SAN VICENTE	4
14	SIBASI USULUTAN	2
17	SIBASI SAN MIGUEL	2
20	SIBASI MORAZAN	2
21	SIBASI LA UNION	2
23	SIBASI NORTE	6
24	SIBASI SUR	6
25	SIBASI ORIENTE	6
27	SIBASI CENTRO	6
29	Hospitales de Referencia Nacional	0
\.


--
-- Data for Name: cat_sibasi_sinab; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY cat_sibasi_sinab (idsibasi_sinab, nomsibasi, id_region) FROM stdin;
1	AHUACHAPAN	1
6	CABAÑAS	3
15	CENTRO	5
4	CHALATENANGO	2
7	CUSCATLAN	3
5	LA LIBERTAD	2
8	LA PAZ	3
11	LA UNION	4
12	MORAZAN	4
19	NORTE	5
20	ORIENTE	5
13	SAN MIGUEL	4
9	SAN VICENTE	3
2	SANTA ANA	1
3	SONSONATE	1
21	SUR	5
14	USULUTAN	4
\.


--
-- Data for Name: cat_uscf_siban; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY cat_uscf_siban (id_establecimiento, descripcion, id_sibasi, tipo, mes_creacion) FROM stdin;
1420	UCSF San Isidro CA Potrero de Batres (ECOSF parcial)                                                                                                  	6	J 	8
1532	UCSF Sen Sebastián SV La Esperanza (ECOSF parcial)                                                                                                    	9	J 	8
1418	UCSF Guacotecti CA Agua Zarca (ECOSF parcial)                                                                                                         	6	J 	8
1545	UCSF San Salvador SS Comunidad Nicaragua 2                                                                                                            	21	J 	8
1575	UCSFE Sesori SM                                                                                                                                       	13	J 	7
1094	USCF Atiquizaya AH El Zapote                                                                                                                          	1	J 	7
1606	UCSF San Marcos SS Cmnd Linda Vista                                                                                                                   	19	J 	3
1110	USCF El Paisnal SS San Francisco dos Cerros                                                                                                           	19	J 	3
1594	UCSF San Salvador SS La Naval                                                                                                                         	15	J 	2
1551	UCSF Quezaltepeque LL Santa Emilia                                                                                                                    	5	J 	2
1111	USCF Aguilares SS La Florida                                                                                                                          	19	J 	2
1550	UCSF Quezaltepeque LL San Jacinto                                                                                                                     	5	J 	2
1601	UCSF San Marcos SS Cmnd El Transito                                                                                                                   	19	J 	1
1598	UCSF Panchimalco SS Cnt El Cedro                                                                                                                      	21	J 	1
1593	UCSF Mejicanos SS Cristo Redentor                                                                                                                     	15	J 	1
1604	UCSF San Martin SS Cmnd Santa Fe                                                                                                                      	20	J 	1
1561	UCSF San Salvador SS  Tutunichapa                                                                                                                     	15	J 	1
1595	UCSF San Salvador SS Mano de León                                                                                                                     	15	J 	1
1603	UCSF El Paisnal SS Cmnd Rutilio Grande                                                                                                                	19	J 	1
1597	UCSF Panchimalco SS San Isidro                                                                                                                        	21	J 	1
1591	UCSF San Salvador SS Las Lajas                                                                                                                        	15	J 	1
1599	UCSF San Sanlvador SS Cmnd Miraflores                                                                                                                 	21	J 	1
1602	UCSF Nejapa SS El Llano                                                                                                                               	19	J 	1
1596	UCSF San Salvador SS Las Brisas                                                                                                                       	15	J 	1
1605	UCSF San Martin SS Cnt El Rosario                                                                                                                     	20	J 	1
1442	UCSF Suchitoto CU San Cristobal                                                                                                                       	7	J 	1
1600	UCSF San Sanlvador SS Cmnd Las Esmeraldas                                                                                                             	21	J 	1
1559	UCSF San Salvador SS La Fosa                                                                                                                          	15	J 	1
1560	UCSF San Salvador SS Saavedra                                                                                                                         	15	J 	1
1314	UCSFE Berlin US                                                                                                                                       	14	L 	1
1549	UCSF Colón LL El Pital                                                                                                                                	5	J 	1
1592	UCSF San Salvador SS Coro Quiñones                                                                                                                    	15	J 	1
1587	UCSF Nahuizalco SO Tajcuilujlan                                                                                                                       	3	J 	1
1347	UCSFE Concepcion Batres US                                                                                                                            	14	L 	1
1553	UCSF Tejutla CH Los Hernandez                                                                                                                         	4	J 	1
1579	UCSF Sonsonate SO El Cacao                                                                                                                            	3	J 	1
1548	UCSF Colón LL                                                                                                                                         	5	J 	1
1554	UCSF Tejutla CH Agua Escondido                                                                                                                        	4	J 	1
1580	UCSF Sonsonate SO El Presidio                                                                                                                         	3	J 	1
1556	UCSF Tejutla CH El Coyolito                                                                                                                           	4	J 	1
1582	UCSF Izalco SO Chorro Arriba                                                                                                                          	3	J 	1
1585	UCSF Izalco SO Cuyagualo                                                                                                                              	3	J 	1
1578	UCSF Acajutla SO Costa Azul                                                                                                                           	3	J 	1
1584	UCSF Izalco SO Las Marías                                                                                                                             	3	J 	1
1581	UCSF Izalco SO Tunalmiles Centro                                                                                                                      	3	J 	1
1564	UCSF San Pedro Masahuat LP Astoria (UCSF parcial)                                                                                                     	8	J 	1
1563	UCSF Zacatecoluca LP Escuintla                                                                                                                        	8	J 	1
1552	UCSF Tejutla CH                                                                                                                                       	4	J 	1
1555	UCSF Tejutla CH El Salitre                                                                                                                            	4	J 	1
1583	UCSF Izalco SO Las Lajas                                                                                                                              	3	J 	1
1569	UCSF Ciudad Barrios SM Llano el Angel                                                                                                                 	13	J 	1
1566	UCSF Ciudad Barrios SM El Porvenir                                                                                                                    	13	J 	1
1586	UCSF Nahuizalco SO El Carrizal                                                                                                                        	3	J 	1
1547	USCF Ciudad Barrios                                                                                                                                   	13	J 	1
1572	UCSF Sesori SM  Managuara                                                                                                                             	13	J 	1
1567	UCSF Ciudad Barrios SM San Matias                                                                                                                     	13	J 	1
1558	UCSF Ilobasco CA                                                                                                                                      	6	J 	1
1568	UCSF Ciudad Barrios SM San Cristobal                                                                                                                  	13	J 	1
1577	UCSF Acajutla SO Villa Centenario                                                                                                                     	3	J 	1
1557	UCSF Ciudad Barrios SM Guanaste                                                                                                                       	13	J 	1
1571	UCSF Sesori SM  San Sebastian                                                                                                                         	13	J 	1
1574	UCSF Chapeltique SM El Rodeo                                                                                                                          	13	J 	1
1531	UCSF San Vicente SV El Rebelde (ECOSF parcial)                                                                                                        	9	J 	1
1576	UCSF San Sebastian Salitrillo SA Santa Rosa                                                                                                           	2	J 	1
1573	UCSF Sesori SM                                                                                                                                        	13	J 	1
1144	UCSF San Pablo Tacachico LL Obraje Nuevo                                                                                                              	5	J 	1
1570	UCSF Sesori SM  El Tablon                                                                                                                             	13	J 	1
1590	UCSF San Jorge US Joya de Ventura                                                                                                                     	14	J 	1
1369	UCSFE Izalco                                                                                                                                          	3	L 	1
1538	UCSF El Paisnal SS San Francisco dos Cerros                                                                                                           	19	J 	1
1143	UCSF San Pablo Tacachico Ll Atiocoyo                                                                                                                  	5	J 	1
1145	UCSF San Pablo Tacachico LL Valle Mesas                                                                                                               	5	J 	1
1589	UCSF San Jorge US San Julian                                                                                                                          	14	J 	1
1443	UCSF Suchitoto CU Palo Grande CU                                                                                                                      	7	J 	1
1128	UCSF Teotepeque LL Aguacayo                                                                                                                           	5	J 	1
1370	UCSFE Sonzacate                                                                                                                                       	3	L 	1
1485	UCSF Cuyultitan LP San Antonio (ECOSF parcial)                                                                                                        	8	J 	1
1508	UCSF Verapaz SV                                                                                                                                       	9	J 	1
1142	UCSF San Pablo Tacachico LL San Isidro                                                                                                                	5	J 	1
1588	UCSF San Jorge US                                                                                                                                     	14	J 	1
1454	UCSF San Rafael Cedros CU Cerro Colorado (ECOSF parcial)                                                                                              	7	J 	1
1494	UCSF Zacatecoluca LP Azacualpa (ECOSF parcial)                                                                                                        	8	J 	1
1477	UCSF San Luis la Herradura LP El Zapote (ECOSF parcial)                                                                                               	8	J 	1
1122	USCF Corinto MO Corralito Atillo                                                                                                                      	12	J 	1
1368	UCSF Santo Domingo de Guzman SO                                                                                                                       	3	J 	1
1488	UCSF San Francisco Chinameca LP Candelaria (ECOSF parcial)                                                                                            	8	J 	1
1053	USCF El Porvenir SA                                                                                                                                   	2	J 	1
1525	UCSF Tecoluca SV San Carlos Lempa (ECOSF parcial)                                                                                                     	9	J 	1
1311	UCSF Mercedes Umaña US La Puerta                                                                                                                      	14	J 	1
1497	UCSF San Rafael Obrajuelo LP San Pedro Martir (ECOSF parcial)                                                                                         	8	J 	1
1451	UCSF San José Guayabal CU La Cruz (ECOSF parcial)                                                                                                     	7	J 	1
1342	UCSF Santa Elena US Amate Norte                                                                                                                       	14	J 	1
1313	UCSF Mercedes Umaña US Los Horcones                                                                                                                   	14	J 	1
1482	UCSF San Juan Talpa LP Veracruz (ECOSF parcial)                                                                                                       	8	J 	1
1427	UCSF San Cristobal CU Santa  Anita                                                                                                                    	7	J 	1
1496	UCSF San Rafael Obrajuelo LP La Palma (ECOSF parcial)                                                                                                 	8	J 	1
1018	USCF San Simón MO Las Quebradas                                                                                                                       	13	J 	1
1141	UCSF San Pablo Tacachico LL                                                                                                                           	5	J 	1
1064	USCF Chalchuapa SA                                                                                                                                    	2	J 	1
1456	UCSF San Rafael Cedros CU Palacios (ECOSF parcial)                                                                                                    	7	J 	1
1356	UCSFCaluco SO                                                                                                                                         	3	J 	1
1364	UCSF Santa Isabel Ishuatan SO                                                                                                                         	3	J 	1
1367	UCSF Santo Domingo de Guzman SO El Carrizal                                                                                                           	3	J 	1
1459	UCSF El Carmen CU Santa Lucía (ECOSF parcial)                                                                                                         	7	J 	1
1530	UCSF San Vicente SV Guajoyo (ECOSF parcial)                                                                                                           	9	J 	1
961	USCF Agua Caliente CH El Carmen                                                                                                                       	4	J 	1
1499	UCSF San Juan Talpa LP Comalapa  (ECOSF parcial)                                                                                                      	8	J 	1
1522	UCSF Tepetitan SV (ECOSF parcial)                                                                                                                     	9	J 	1
1479	UCSF San Pedro Masahuat LP Las Marías (ECOSF parcial)                                                                                                 	8	J 	1
1389	UCSFE Tacuba AH                                                                                                                                       	1	L 	1
1526	UCSF Tecoluca SV Puerto Nuevo (ECOSF parcial)                                                                                                         	9	J 	1
1489	UCSF SanFrancisco Chinameca LP                                                                                                                        	8	J 	1
1363	UCSF Santa Catarina Masahuat SO                                                                                                                       	3	J 	1
1523	UCSF Jerusalen LP (ECOSF parcial)                                                                                                                     	9	J 	1
1480	UCSF San Luis Talpa LP El Pimental (ECOSF parcial)                                                                                                    	8	J 	1
1380	UCSF Jujutla AH Barra de Santiago                                                                                                                     	1	J 	1
1495	UCSF Olocuilta LP Santa Lucía Orcoyo (ECOSF parcial)                                                                                                  	8	J 	1
1492	UCSF San Luis Talpa LP Hacienda Amatepe (ECOSF parcial)                                                                                               	8	J 	1
1354	UCSF Caluco SO Plan de Amayo                                                                                                                          	3	J 	1
1483	UCSF Rosario La Paz LP El Nao Amatepe (ECOSF parcial)                                                                                                 	8	J 	1
1529	UCSF Tecoluca SV Santa Cruz Paraiso (ECOSF parcial)                                                                                                   	9	J 	1
1460	UCSF El Carmen CU Candelaria (ECOSF parcial)                                                                                                          	7	J 	1
1475	UCSF Zacatecoluca LP Santa Lucía (ECOSF parcial)                                                                                                      	8	J 	1
1355	UCSF Caluco SO El Zapote                                                                                                                              	3	J 	1
1455	UCSF San Rafael Cedros CU Jiboa (ECOSF parcial)                                                                                                       	7	J 	1
1524	UCSF Mercedes la Ceiba LP (ECOSF parcial)                                                                                                             	9	J 	1
1487	UCSF San Francisco Chinameca LP San José La Montaña (ECOSF parcial)                                                                                   	8	J 	1
1493	UCSF Zacatecoluca LP San Faustino (ECOSF parcial)                                                                                                     	8	J 	1
1521	UCSF San Cayetano Istepeque SV Candelaria (ECOSF parcial)                                                                                             	9	J 	1
1527	UCSF Tecoluca SV San Nicolas Lempa (ECOSF parcial)                                                                                                    	9	J 	1
1458	UCSF El Carmen CU San Sebastian (ECOSF parcial)                                                                                                       	7	J 	1
1484	UCSF Cuyultitan LP (ECOSF parcial)                                                                                                                    	8	J 	1
1452	UCSF San José Guayabal CU Animas (ECOSF parcial)                                                                                                      	7	J 	1
1498	USCF San Luis la Herradura LP Los Blancos  (ECOSF parcial)                                                                                            	8	J 	1
1306	UCSF Nueva Granada US Nuevo Gualcho                                                                                                                   	14	J 	1
1404	UCSF Coatepeque SA Piletas                                                                                                                            	1	J 	1
1112	USCFE Perquin MO                                                                                                                                      	12	L 	1
1504	UCSF Apastepeque SV San Jacinto                                                                                                                       	9	J 	1
1435	UCSF San Jose Guayabal CU Llano Grande                                                                                                                	7	J 	1
1507	UCSFE Verapaz SV                                                                                                                                      	9	L 	1
1341	UCSF Santa Elena US Joya Ancha Arriba                                                                                                                 	14	J 	1
1464	UCSF Santa María Ostuma LP El Chaperno                                                                                                                	8	J 	1
1447	UCSF Candelaria CU Miraflores Arriba (ECOSF parcial)                                                                                                  	7	J 	1
1478	UCSF San Pedro Masahuat LP El Achiotal (ECOSF parcial)                                                                                                	8	J 	1
1329	UCSF Ozatlan US Las Trancas                                                                                                                           	14	J 	1
1098	USCF El Refugio AH                                                                                                                                    	1	J 	1
1061	USCF Santiago La Frontera SA                                                                                                                          	2	J 	1
1393	UCSF Tacuba AH Chaguite                                                                                                                               	1	J 	1
1026	USCF Corinto MO 2                                                                                                                                     	12	J 	1
1461	UCSF Oratorio Concepción CU (ECOSF parcial)                                                                                                           	7	J 	1
1057	USCF Masahuat SA                                                                                                                                      	2	J 	1
1481	UCSF San Juan Talpa LP (ECOSF parcial)                                                                                                                	8	J 	1
1501	UCSF Apastepeque SV Calderas                                                                                                                          	9	J 	1
1349	UCSF Concepcion Batres US San Felipe                                                                                                                  	14	J 	1
1066	USCF Chalchuapa SA Magdalena 2                                                                                                                        	2	J 	1
1444	UCSF Candelaria CU (ECOSF parcial)                                                                                                                    	7	J 	1
1515	UCSF San Ildefonso SV San Lorenzo                                                                                                                     	9	J 	1
1467	UCSF San Pedro Nonualco LP San Ramón                                                                                                                  	8	J 	1
1312	UCSF Mercedes Umaña US Santa Anita                                                                                                                    	14	J 	1
1337	UCSF San Francisco Javier US La Cruz                                                                                                                  	14	J 	1
1509	UCSF Verapaz SV El Carmen                                                                                                                             	9	J 	1
1540	UCSFE San Martin SS                                                                                                                                   	20	L 	1
1360	UCSF Cuisnahuat SO                                                                                                                                    	3	J 	1
1346	UCSF Jucuaran US El Zapote                                                                                                                            	14	J 	1
1541	UCSF San Martin SS Santa Gertrudis                                                                                                                    	20	J 	1
1069	USCF Chalchuapa SA Zacamil                                                                                                                            	2	J 	1
1074	USCF Chalchuapa SA Las Lomas                                                                                                                          	2	J 	1
1323	UCSF Alegria US El Quebracho                                                                                                                          	14	J 	1
1486	UCSF Olocuilta LP San Sebastían (ECOSF parcial)                                                                                                       	8	J 	1
1340	UCSF Santa Elena US El Volcan                                                                                                                         	14	J 	1
1506	UCSF Apastepeque SV San Pedro                                                                                                                         	9	J 	1
1449	UCSF San Ramón CU Santa Isabel (ECOSF parcial)                                                                                                        	7	J 	1
1503	UCSF Apastepeque SV San Felipe                                                                                                                        	9	J 	1
1071	USCF Chalchuapa SA El Paste                                                                                                                           	2	J 	1
1512	UCSF Santa Clara SV Santa Rosa                                                                                                                        	9	J 	1
1466	UCSF San Pedro Nonualco LP San Juan Nuhuistepeque                                                                                                     	8	J 	1
1520	UCSF San Cayetano Istepeque SV (ECOSF parcial)                                                                                                        	9	J 	1
1065	USCF Chalchuapa SA Magdalena 1                                                                                                                        	2	J 	1
1472	UCSF San Antonio Masahuat LP La Loma                                                                                                                  	8	J 	1
1068	USCF Chalchuapa SA Galeano                                                                                                                            	2	J 	1
1446	UCSF Candlaria CU Concepción (ECOSF parcial)                                                                                                          	7	J 	1
1463	UCSF Santa María Ostuma LP El Carrizal                                                                                                                	8	J 	1
1440	UCSF El Carmen CU San Antonio                                                                                                                         	7	J 	1
1457	UCSF El Carmen CU (ECOSF parcial)                                                                                                                     	7	J 	1
1334	UCSF San Agustín US Caulotal                                                                                                                          	14	J 	1
1353	UCSF Ereguayquin US Analco                                                                                                                            	14	J 	1
1101	USCFE Chalchuapa SA                                                                                                                                   	2	L 	1
1336	UCSF San Francisco Javier US Los Hornos                                                                                                               	14	J 	1
1324	UCSF Alegria US El Zapotillo                                                                                                                          	14	J 	1
1075	USCF Chalchuapa SA Las Lajas                                                                                                                          	2	J 	1
1436	UCSF San Rafael Cedros CU Soledad                                                                                                                     	7	J 	1
938	USCF San Miguel de Mercedes CH                                                                                                                        	4	J 	1
1510	UCSF Verapaz SV San Isidro                                                                                                                            	9	J 	1
1344	UCSF Jucuaran US El Jutal                                                                                                                             	14	J 	1
1502	UCSF Apastepeque SV Las Minas                                                                                                                         	9	J 	1
1012	USCF Joateca MO La Laguna                                                                                                                             	12	J 	1
1350	UCSF Concepcion Batres US Hacienda Nueva                                                                                                              	14	J 	1
1450	UCSF San José Guayabal CU (ECOSF parcial)                                                                                                             	7	J 	1
1490	UCSF Santiago Nonualco LP San José La Paz (ECOSF parcial)                                                                                             	8	J 	1
1072	USCF Chalchuapa SA El Coco                                                                                                                            	2	J 	1
1519	UCSF San Lorenzo SV Santa Lucia                                                                                                                       	9	J 	1
1330	UCSF Ozatlan US La Poza                                                                                                                               	14	J 	1
1542	UCSFE San Salvador SS San Jacinto                                                                                                                     	21	L 	1
1084	USCF Turín AH                                                                                                                                         	1	J 	1
1384	UCSF Jujutla AH San José El Naranjo                                                                                                                   	1	J 	1
1113	USCFE Corinto MO                                                                                                                                      	12	L 	1
1445	UCSF Candelaria CU El Rosario (ECOSF parcial)                                                                                                         	7	J 	1
1067	USCF Chalchuapa SA San Sebastian                                                                                                                      	2	J 	1
1476	UCSF Santiago Nonualco LP San José Abajo (ECOSF parcial)                                                                                              	8	J 	1
1439	UCSF San Pedro Perulapan CU San Francisco                                                                                                             	7	J 	1
1333	UCSF San Agustín US El Eucalipto                                                                                                                      	14	J 	1
1059	USCF Santa Rosa de Guachipilín SA                                                                                                                     	2	J 	1
1056	USCF El Porvenir SA San Juan Chiquito                                                                                                                 	2	J 	1
1351	UCSF Concepcion Batres US El Cañal                                                                                                                    	14	J 	1
1405	UCSF Coatepeque SA Aragua                                                                                                                             	1	J 	1
1491	UCSF Santiago Nonualco LP San Sebastían Arriba (ECOSF parcial)                                                                                        	8	J 	1
1514	UCSF San Ildefonso SV Guachipilín                                                                                                                     	9	J 	1
1308	UCSF Estanzuelas US Escarbadero                                                                                                                       	14	J 	1
1102	USCFE Dulce Nombre de Maria CH                                                                                                                        	4	L 	1
1505	UCSF Apastepeque SV San Nicolas                                                                                                                       	9	J 	1
1348	UCSF Concepcion Batres US                                                                                                                             	14	J 	1
1388	UCSF San Pedro Puxtla AH                                                                                                                              	1	J 	1
1382	UCSF Jujutla AH Guayapa Abajo                                                                                                                         	1	J 	1
1511	UCSF Santa Clara SV                                                                                                                                   	9	J 	1
1339	UCSF Santa Elena US El Nanzal 1                                                                                                                       	14	J 	1
1076	USCF Chalchuapa SA Las Cruces                                                                                                                         	2	J 	1
1331	UCSF Ozatlan US La Breña                                                                                                                              	14	J 	1
1073	USCF Chalchuapa SA San José                                                                                                                           	2	J 	1
1371	UCSFE Guaymango AH                                                                                                                                    	1	L 	1
1322	UCSF Alegria US Las Casitas                                                                                                                           	14	J 	1
1116	USCFE Anamoros LU                                                                                                                                     	11	L 	1
1448	UCSF San Ramon CU (ECOSF parcial)                                                                                                                     	7	J 	1
1070	USCF Chalchuapa SA Las Flores                                                                                                                         	2	J 	1
1517	UCSF San Esteban Catarina SV San Jacinto la burrera                                                                                                   	9	J 	1
1047	USCF Nueva Esparta LU Las Marias                                                                                                                      	11	J 	1
1139	UCSF Tamanique LL San Alfonso                                                                                                                         	5	J 	1
1428	UCSF San Cristobal CU La Virgen                                                                                                                       	7	J 	1
1425	UCSF San Emigdio LP                                                                                                                                   	7	J 	1
1027	USCF Corinto MO Corralito San Francisco                                                                                                               	12	J 	1
1431	UCSF Monte San Juan CU Soledad                                                                                                                        	7	J 	1
1462	UCSF Santa María Ostuma LP                                                                                                                            	8	J 	1
1016	USCF San Simón MO Potrero Adentro                                                                                                                     	12	J 	1
1474	UCSFE Olocuilta LP                                                                                                                                    	8	L 	1
1325	UCSF Tecapan US                                                                                                                                       	14	J 	1
1345	UCSF Jucuaran US El Espino                                                                                                                            	14	J 	1
1359	UCSF Cuisnahuat SO San Lucas                                                                                                                          	3	J 	1
1434	UCSF Tenancingo CU Rosario Tablon                                                                                                                     	7	J 	1
1385	UCSF Jujutla AH San Antonio                                                                                                                           	1	J 	1
1465	UCSF San Pedro Nonualco LP                                                                                                                            	8	J 	1
1121	USCF San Antonio SM San Diego                                                                                                                         	12	J 	1
1310	UCSF Mercedes Umaña US                                                                                                                                	14	J 	1
1078	USCF San Lorenzo AH Guascota                                                                                                                          	1	J 	1
1433	UCSF Tenancingo CU Corral Viejo                                                                                                                       	7	J 	1
1422	UCSF EL Rosario CU                                                                                                                                    	7	J 	1
1327	UCSF Tecapan US Chapetones                                                                                                                            	14	J 	1
1305	UCSF Nueva Granada US                                                                                                                                 	14	J 	1
1513	UCSF San Ildefonso SV                                                                                                                                 	9	J 	1
918	USCFE La Palma CH                                                                                                                                     	4	L 	1
1058	USCF Masahuat SA La Joya                                                                                                                              	2	J 	1
1104	USCF San Jose la Fuente LU El Sombrerito                                                                                                              	11	J 	1
1055	USCF El Porvenir SA Amate Blanco                                                                                                                      	2	J 	1
1316	UCSF Berlin US 2                                                                                                                                      	14	J 	1
1373	UCSF Guaymango AH Platanares                                                                                                                          	1	J 	1
1430	UCSF Monte San Juan CU San Nicolas                                                                                                                    	7	J 	1
1383	UCSF Jujutla AH Santa Rosa Guayapa                                                                                                                    	1	J 	1
1085	USCF La Palma CH                                                                                                                                      	4	J 	1
1054	USCF El Porvenir SA El Cerrón                                                                                                                         	2	J 	1
1469	UCSF San Miguel Tepezontes LP                                                                                                                         	8	J 	1
1400	UCSF Ahuachapan AH Ashapuco                                                                                                                           	1	J 	1
1423	UCSF  Paraiso de Osorio LP                                                                                                                            	7	J 	1
1426	UCSF San Cristobal CU                                                                                                                                 	7	J 	1
1326	UCSF Tecapan US Gualache                                                                                                                              	14	J 	1
1377	UCSF Guaymango AH Cauta Arriba                                                                                                                        	1	J 	1
1543	UCSF San Salvador SS Comunidad Modelo 3                                                                                                               	21	J 	1
1374	UCSF Guaymango AH El Escalon                                                                                                                          	1	J 	1
1357	UCSF Cuisnahuat SO Agua Shuca                                                                                                                         	3	J 	1
1048	USCF Nueva Esparta LU Honduritas                                                                                                                      	11	J 	1
931	USCF Nombre de Jesus CH                                                                                                                               	4	J 	1
1429	UCSF Monte San Juan CU                                                                                                                                	7	J 	1
1424	UCSF Santa Cruz Analquito CU                                                                                                                          	7	J 	1
1131	UCSF Chiltiupán LL Taquillo Ing. Orlando Recinos                                                                                                      	5	J 	1
1140	UCSF Tamanique LL El Palmar                                                                                                                           	5	J 	1
1017	USCF San Simón MO El Carrizal 1                                                                                                                       	13	J 	1
1062	USCF Santiago La Frontera SA Las Piletas                                                                                                              	2	J 	1
1300	UCSF COLON LL CIUDAD MUJER                                                                                                                            	5	J 	1
1500	UCSF Apastepeque SV                                                                                                                                   	9	J 	1
1343	UCSF Jucuaran US                                                                                                                                      	14	J 	1
1437	UCSFE San Pedro Perulapan CU                                                                                                                          	7	L 	1
1358	UCSF Cuisnahuat SO Coquiama                                                                                                                           	3	J 	1
1352	UCSF Puerto El Triunfo US La Palmera                                                                                                                  	14	J 	1
1432	UCSF Tenancingo CU                                                                                                                                    	7	J 	1
1332	UCSF San Agustín US                                                                                                                                   	14	J 	1
1398	UCSF Tacuba AH Valle La Puerta                                                                                                                        	1	J 	1
1375	UCSF Guaymango AH Morro Grande                                                                                                                        	1	J 	1
1063	USCF Santiago La Frontera SA Santa Cruz                                                                                                               	2	J 	1
1309	UCSF Estanzuelas US La Cruz                                                                                                                           	14	J 	1
1441	UCSF Santa Cruz Michapa CU Buena Vista                                                                                                                	7	J 	1
1126	UCSF Teotepeque LL El Angel                                                                                                                           	5	J 	1
1438	UCSF San Pedro Perulapan CU La Esperanza                                                                                                              	7	J 	1
1338	UCSF Santa Elena US                                                                                                                                   	14	J 	1
1146	UCSFE Puerto La Libertad LL                                                                                                                           	5	J 	1
1381	UCSF Jujutla AH Falla                                                                                                                                 	1	J 	1
1516	UCSF San Esteban Catarina SV                                                                                                                          	9	J 	1
1307	UCSF Estanzuelas US                                                                                                                                   	14	J 	1
1301	UCSFE, JIQUILISCO US BAJO LEMPA "SALUD RENAL"                                                                                                         	14	L 	1
1376	UCSF Guaymango AH San Martin                                                                                                                          	1	J 	1
1453	UCSF San Rafael Cedros CU (ECOSF parcial)                                                                                                             	7	J 	1
1378	UCSF Jujutla AH                                                                                                                                       	1	J 	1
1372	UCSF Guaymango AH                                                                                                                                     	1	J 	1
1335	UCSF San Francisco Javier US                                                                                                                          	14	J 	1
1539	UCSF Aguilares SS La Florida                                                                                                                          	19	J 	1
1470	UCSF San Miguel Tepezontes LP Soledad Las Flores                                                                                                      	8	J 	1
1138	UCSF Tamanique LL Buenos Aires                                                                                                                        	5	J 	1
1315	UCSF Berlin US 1                                                                                                                                      	14	J 	1
1392	UCSF Tacuba AH Las Palmeras                                                                                                                           	1	J 	1
1029	USCF Corinto MO La Hermita                                                                                                                            	12	J 	1
1086	USCF Lomas de Alarcon                                                                                                                                 	1	J 	1
1321	UCSF Alegria US                                                                                                                                       	14	J 	1
1129	UCSF Chiltiupán LL                                                                                                                                    	5	J 	1
1415	UCSF Sensuntepeque CA Copinolapa (ECOSF parcial)                                                                                                      	6	J 	1
943	USCF El Carrizal CH Vanillas                                                                                                                          	4	J 	1
937	USCF San Antonio los Ranchos CH                                                                                                                       	4	J 	1
957	USCF Concepción Quezaltepeque                                                                                                                         	4	J 	1
1060	USCF Santa Rosa Guachipilín SA El Despoblado                                                                                                          	2	J 	1
952	USCF San Rafael CH                                                                                                                                    	4	J 	1
969	USCF Ilobasco CA Agua Zarca                                                                                                                           	6	J 	1
975	USCF Ilobasco CA Sitio Viejo                                                                                                                          	6	J 	1
1399	UCSF Tacuba AH La Escuela de El Rodeo                                                                                                                 	1	J 	1
1052	USCF Poloros LU Ocote                                                                                                                                 	11	J 	1
958	USCF Concepción Quezaltepeque CH Llano Grande                                                                                                         	4	J 	1
1021	USCF Delicias de Concepción MO El Volcan                                                                                                              	12	J 	1
977	USCF Ilobasco CA Maquilishuat El Limón                                                                                                                	6	J 	1
1318	UCSF Berlin US Talpetate                                                                                                                              	14	J 	1
1361	UCSF Santa Catarina Masahuat SO El Guayabo                                                                                                            	3	J 	1
1077	USCF Ahuachapan AH Un Rancho y un lucero                                                                                                              	1	J 	1
1401	UCSF Ahuachapan AH El Barro                                                                                                                           	1	J 	1
960	USCF Agua Caliente CH                                                                                                                                 	4	J 	1
1103	USCFE Concepción Quezaltepeque CH                                                                                                                     	4	L 	1
1412	UCSF Sensuntepeque CA Chunte (ECOSF parcial)                                                                                                          	6	J 	1
917	USCF Cítala CH San Ramon                                                                                                                              	4	J 	1
954	USCF Santa Rita CH                                                                                                                                    	4	J 	1
963	USCF Agua Caliente CH Obrajuelo                                                                                                                       	4	J 	1
926	USCF La Reina CH El Pepeto                                                                                                                            	4	J 	1
1132	UCSF Jicalapa LL La Perla                                                                                                                             	5	J 	1
983	USCF Tejutepeque CA Concepción                                                                                                                        	6	J 	1
934	USCF San Isidro Labrador CH                                                                                                                           	4	J 	1
1544	UCSF San Salvador SS San Cristobal                                                                                                                    	21	J 	1
974	USCF Ilobasco CA Huertas                                                                                                                              	6	J 	1
920	USCF La Plama CH San José Sacare                                                                                                                      	4	J 	1
1120	USCF Guatajiagua MO Pajigua                                                                                                                           	12	J 	1
1298	UCSF AZACUALPA                                                                                                                                        	4	J 	1
1125	UCSF Teotepeque LL                                                                                                                                    	5	J 	1
1386	UCSF San Pedro Puxtla AH Los Aguirre                                                                                                                  	1	J 	1
1031	USCF Lolotiquillo MO Gualindo                                                                                                                         	12	J 	1
959	USCF Concepción Quezaltepeque CH Monte Redondo                                                                                                        	4	J 	1
962	USCF Agua Caliente CH Cerro Grande                                                                                                                    	4	J 	1
916	USCF Citala CH                                                                                                                                        	4	J 	1
1051	USCF Poloros LU Carpintero                                                                                                                            	11	J 	1
968	USCF Ilobasco CA San Jose                                                                                                                             	6	J 	1
922	USCF San Ignacio CH                                                                                                                                   	4	J 	1
951	USCF Dulce Nombre de Maria CH Gutierrez                                                                                                               	4	J 	1
945	USCF La Laguna CH San Jose                                                                                                                            	4	J 	1
946	USCF Comalapa CH                                                                                                                                      	4	J 	1
1000	USCF Guatajiagua MO Maiguera                                                                                                                          	12	J 	1
923	USCF San Ignacio CH El Carmen                                                                                                                         	4	J 	1
1395	UCSF Tacuba AH El Sincuyo                                                                                                                             	1	J 	1
1518	UCSF San Lorenzo SV                                                                                                                                   	9	J 	1
1417	UCSF Guacotecti CA (ECOSF parcial)                                                                                                                    	6	J 	1
1317	UCSF Berlin US San José                                                                                                                               	14	J 	1
1366	UCSF Santa Isabel Ishuatan SO Acachapa                                                                                                                	3	J 	1
939	USCF Las Vueltas CH                                                                                                                                   	4	J 	1
1403	UCSF Apaneca AH Quezalapa                                                                                                                             	1	J 	1
965	USCF San Francisco Morazan CH                                                                                                                         	4	J 	1
919	USCF La Palma CH Horcones                                                                                                                             	4	J 	1
1002	USCF Guatajiagua MO Los Abelines                                                                                                                      	12	J 	1
971	USCF Ilobasco CA San Francisco Iraheta                                                                                                                	6	J 	1
1397	UCSF Tacuba AH Pandiadura                                                                                                                             	1	J 	1
1134	UCSF Comasagua LL La Shila                                                                                                                            	5	J 	1
1034	USCF Cacaopera MO Agua Blanca                                                                                                                         	12	J 	1
942	USCF El Carrizal CH                                                                                                                                   	4	J 	1
1137	UCSF Tamanique LL                                                                                                                                     	5	J 	1
1114	USCFE Semsembra MO                                                                                                                                    	12	J 	1
928	USCF Arcatao CH                                                                                                                                       	4	J 	1
999	USCF Guatajiagua MO 2                                                                                                                                 	12	J 	1
1320	UCSF Berlin US San Isidro                                                                                                                             	14	J 	1
1028	USCF Corinto MO San Felipe Los Villatoro                                                                                                              	12	J 	1
1473	UCSF Tapalhuaca LP                                                                                                                                    	8	J 	1
932	USCF Nombre de Jesus CH Junquillo                                                                                                                     	4	J 	1
1124	USCF Conchagua LU El Pilón                                                                                                                            	11	J 	1
1416	UCSF Sensuntepeque CA San Nicolas (ECOSF parcial)                                                                                                     	6	J 	1
1387	UCSF San Pedro Puxtla AH Los Chacon                                                                                                                   	1	J 	1
1127	UCSF Teotepeque LL Mizata                                                                                                                             	5	J 	1
1396	UCSF Tacuba AH La Magdalena                                                                                                                           	1	J 	1
972	USCF Ilobasco CA Potreros                                                                                                                             	6	J 	1
955	USCF Santa Rita CH El Sol                                                                                                                             	4	J 	1
995	USCF Carolina SM Rosa Nacaspilo                                                                                                                       	13	J 	1
949	USCF Dulce Nombre de Maria CH                                                                                                                         	4	J 	1
1081	USCF El Refugio AH El Rosario                                                                                                                         	1	J 	1
1118	USCF Ilobasco CA Hoyos                                                                                                                                	6	J 	1
950	USCF Dulce Nombre de Maria CH Ocotal                                                                                                                  	4	J 	1
935	USCF San José Cancasque CH                                                                                                                            	4	J 	1
973	USCF Ilobasco CA Los Llanitos                                                                                                                         	6	J 	1
1035	USCF Cacaopera MO Sunsulaca                                                                                                                           	12	J 	1
1135	UCSF Comasagua LL Los Conacastes                                                                                                                      	5	J 	1
927	USCF La Reina CH El Tigre                                                                                                                             	4	J 	1
1468	UCSF San Juan Tepezontes LP                                                                                                                           	8	J 	1
1390	UCSF Tacuba AH                                                                                                                                        	1	J 	1
1413	UCSF Sensuntepeque CA Rio Grande (ECOSF parcial)                                                                                                      	6	J 	1
1419	UCSF San Isidro CA (ECOSF parcial)                                                                                                                    	6	J 	1
941	USCF Ojos de Agua CH El Zapotal                                                                                                                       	4	J 	1
929	USCF Nueva Trinidad CH                                                                                                                                	4	J 	1
1391	UCSF Tacuba AH San Rafael                                                                                                                             	1	J 	1
1365	UCSF Santa Isabel Ishuatan SO Las Piedras                                                                                                             	3	J 	1
1414	UCSF Sensuntepeque CA Cuyantepeque (ECOSF parcial)                                                                                                    	6	J 	1
1079	USCF Turín AH El Paraiso                                                                                                                              	1	J 	1
1299	UCSF SAN FRANCISCO LEMPA                                                                                                                              	4	J 	1
956	USCF San Fernando CH                                                                                                                                  	4	J 	1
921	USCF La Palma CH Granadillas                                                                                                                          	4	J 	1
967	USCF Nuevo Eden de San Juan SM San Sebastian                                                                                                          	6	J 	1
984	USCF Tejutepeque CA El Zapote                                                                                                                         	6	J 	1
953	USCF San Rafael CH San Jose Los Sitios                                                                                                                	4	J 	1
964	USCF San Luis del Carmen CH                                                                                                                           	4	J 	1
1402	UCSF Ahuachapan AH Llano la Laguna                                                                                                                    	1	J 	1
1411	UCSF Sensuntepeque CA San Lorenzo (ECOSF parcial)                                                                                                     	6	J 	1
1319	UCSF Berlin US Virginia                                                                                                                               	14	J 	1
1362	UCSF Santa Catarina Masahuat SO Tres caminos                                                                                                          	3	J 	1
1133	UCSF Comasagua LL                                                                                                                                     	5	J 	1
933	USCF San Antonio de la Cruz CH                                                                                                                        	4	J 	1
1082	USCF san antonio SM San Marcos                                                                                                                        	13	J 	1
1033	USCF Cacaopera MO La Estancia                                                                                                                         	12	J 	1
1328	UCSF Ozatlan US                                                                                                                                       	14	J 	1
1471	UCSF San Antonio Masahuat LP                                                                                                                          	8	J 	1
936	USCF Potonico CH                                                                                                                                      	4	J 	1
944	USCF La Laguna CH                                                                                                                                     	4	J 	1
930	USCF San Jose Las Flores CH                                                                                                                           	4	J 	1
1130	UCSF Chiltiupán LL Termophilas                                                                                                                        	5	J 	1
1136	UCSF Comasagua LL El Matazano                                                                                                                         	5	J 	1
1379	UCSF Jujutla AH Tihuicha                                                                                                                              	1	J 	1
924	USCF San Ignacio CH Las Pilas                                                                                                                         	4	J 	1
970	USCF Ilobasco CA Cerro Colorado                                                                                                                       	6	J 	1
947	USCF Comalapa CH Guachipilín                                                                                                                          	4	J 	1
1394	UCSF Tacuba AH El Jicaro                                                                                                                              	1	J 	1
1099	USCFE Ilobasco CA                                                                                                                                     	6	L 	1
993	USCF Carolina SM 1                                                                                                                                    	13	J 	1
976	USCF Ilobasco CA Maquilishuat Santa Lucia                                                                                                             	6	J 	1
987	USCF Victoria CA SanAntonio                                                                                                                           	6	J 	1
1036	USCF Lislique LU                                                                                                                                      	11	J 	1
1030	USCF Lolotiquillo MO                                                                                                                                  	12	J 	1
1039	USCF Lislique LU Higueras                                                                                                                             	11	J 	1
990	USCF Dolores CA                                                                                                                                       	6	J 	1
1010	USCF Arambala MO                                                                                                                                      	12	J 	1
1007	USCF San Fernando MO                                                                                                                                  	12	J 	1
1050	USCF Poloros LU Boquin                                                                                                                                	11	J 	1
1019	USCF Gualococti MO                                                                                                                                    	12	J 	1
1119	USCF Chalatenango CH Guarjila                                                                                                                         	4	J 	1
996	USCF San Gerardo SM San Jeronimo                                                                                                                      	13	J 	1
1013	USCF El Rosario MO Villa el Rosario                                                                                                                   	12	J 	1
978	USCF Ilobasco CA San Francisco del Monte                                                                                                              	6	J 	1
992	USCF San Antonio SM                                                                                                                                   	13	J 	1
1041	USCF San Jose La Fuente LU                                                                                                                            	11	J 	1
1024	USCF Chilanga MO Piedra Parada                                                                                                                        	12	J 	1
1001	USCF Guatajiagua MO San Bartolo                                                                                                                       	12	J 	1
915	UCSFE DE GUARJILA                                                                                                                                     	4	L 	1
1410	UCSF Sensuntepeque CA San Gregoria (ECOSF parcial)                                                                                                    	6	J 	1
1107	USCF Rosario de Mora SS Palo Grande                                                                                                                   	21	J 	1
1032	USCF Cacaopera MO                                                                                                                                     	12	J 	1
1038	USCF Lislique LU El Derrumbado                                                                                                                        	11	J 	1
989	USCF Victoria CA Santa Marta                                                                                                                          	6	J 	1
981	USCF Cinquera CA                                                                                                                                      	6	J 	1
991	USCF Dolores CA San Carlos                                                                                                                            	6	J 	1
979	USCF Jutiapa CA                                                                                                                                       	6	J 	1
985	USCF Victoria CA                                                                                                                                      	6	J 	1
925	USCF La Reina CH                                                                                                                                      	4	J 	1
1042	USCF Yayantique LU                                                                                                                                    	13	J 	1
1011	USCF Joateca MO                                                                                                                                       	12	J 	1
1105	USCF San Martín SS Los Letona                                                                                                                         	20	J 	1
988	USCF Victoria CA San Pedro                                                                                                                            	6	J 	1
982	USCF Tejutepeque CA                                                                                                                                   	6	J 	1
1025	USCF Corinto MO 1                                                                                                                                     	12	J 	1
1109	USCF Panchimalco SS Amayon                                                                                                                            	21	J 	1
1046	USCF Nueva esparta LU Monteca                                                                                                                         	11	J 	1
994	USCF Carolina SM La Ceibita                                                                                                                           	13	J 	1
1023	USCF Chilanga MO Las Crucitas                                                                                                                         	12	J 	1
1022	USCF Chilanga MO 1                                                                                                                                    	12	J 	1
1045	USCF Nueva Esparta LU                                                                                                                                 	11	J 	1
1005	USCF Yamabal MO Isletas                                                                                                                               	12	J 	1
1014	USCF San Isidro MO                                                                                                                                    	12	J 	1
1108	USCF Panchimalco SS Quezalapa                                                                                                                         	21	J 	1
1008	USCF Jocoaitique MO                                                                                                                                   	12	J 	1
1003	USCF Sensembra MO                                                                                                                                     	12	J 	1
966	USCF Nuevo Eden de San juan SM                                                                                                                        	6	J 	1
1049	USCF Poloros LU                                                                                                                                       	11	J 	1
997	USCF San Gerardo SM 2                                                                                                                                 	13	J 	1
940	USCF Ojos de Agua CH                                                                                                                                  	4	J 	1
1083	USCF San Gerardo SM La Laguna                                                                                                                         	13	J 	1
1020	USCF Delicias de Concepción MO 1                                                                                                                      	12	J 	1
1043	USCF Yayantique LU El Pastor                                                                                                                          	13	J 	1
1006	USCF Torola MO                                                                                                                                        	12	J 	1
1009	USCF Jocoaitique MO Quebrachos                                                                                                                        	12	J 	1
1040	USCF Lislique LU Guajiniquil                                                                                                                          	11	J 	1
998	USCF Guatajiagua MO 1                                                                                                                                 	12	J 	1
1004	USCF Yamabal MO San Juan de La Cruz                                                                                                                   	12	J 	1
1015	USCF San Simón MO 3                                                                                                                                   	12	J 	1
986	USCF Victoria CA Azacualpa                                                                                                                            	6	J 	1
1115	USCFE Osicala MO                                                                                                                                      	12	L 	1
1044	USCF Yayantique LU Los Amates                                                                                                                         	13	J 	1
1106	USCF San Martín SS La Flor                                                                                                                            	20	J 	1
1100	USCFE Sensunepeque CA                                                                                                                                 	6	L 	1
1123	USCF Conchagua LU Las Tunas                                                                                                                           	11	J 	1
1037	USCF Lislique LU Pilas                                                                                                                                	11	J 	1
980	USCF Jutiapa CA Carolina                                                                                                                              	6	J 	1
\.


--
-- Data for Name: catalogos; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY catalogos (id_cat, nombre_tabla, nombre_cat, campo_llave, nombre_campo_descripcion, codigo, cat_padre_id) FROM stdin;
1	cat_pais	Paises	id_pais	descripcion	\N	0
9	cat_nivel_establecimiento	Nivel de Establecimientos	id_nivel_establecimiento	descripcion	\N	0
10	cat_genero	Genero	id_genero	descripcion	\N	0
13	cat_tipo_fecha	Tipo de fecha	id_tipo_fecha	descripcion	\N	0
12	cat_estado_civil	Estado Civil	id_estado_civil	descripcion	\N	0
11	cat_tipo_vivienda	Tipo de Vivienda	id_tipo_vivienda	descripcion	\N	0
8	cat_tipo_establecimiento	Tipo de Establecimientos	id_tipo_establecimiento	descripcion	\N	0
14	cat_cargo_funcional	Cargos Funcionales	id_cargofuncional	descripcion		0
16	cat_fuentefinanciamiento	Fuente de Financiamiento	id_fuentefinanciamiento	descripcion		0
17	cat_area	Areas	id_area	descripcion		0
18	cat_municipio	Catalogo de municipio	id_municipio	descripcion		0
19	cat_regiones	Region	id_region	descripcion		0
20	cat_programas	Programa	id_programa	descripcion		0
15	cat_cargo_nominal	Cargo Nominal	id_cargonominal	descripcion		0
2	cat_departamento	Departamentos	id_departamento	descripcion	\N	1
3	cat_municipio	Municipios	id_municipio	descripcion	\N	2
4	cat_barrio	Barrios	id_barrio	descripcion	\N	3
5	cat_colonia	Colonias	id_colonia	descripcion	\N	3
6	cat_canton	Cantones	id_canton	descripcion	\N	3
7	cat_establecimiento	Establecimientos de Salud	id_establecimiento	descripcion	\N	19
\.


--
-- Data for Name: clasificacion_nivel; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY clasificacion_nivel (id_clasificacion_nivel, descripcion, comentario) FROM stdin;
2	Municipio	\N
3	SIBASI	\N
4	Region	\N
5	Nacional	\N
1	ECOS	Ecos
\.


--
-- Data for Name: clasificacion_privacidad; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY clasificacion_privacidad (id_clasificacion_privacidad, descripcion, comentario) FROM stdin;
3	Nivel 3	\N
1	Restringido Tecnicos	\N
\.


--
-- Data for Name: clasificacion_tecnica; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY clasificacion_tecnica (id_clasificacion_tecnica, descripcion, comentario) FROM stdin;
1	Demograficos	
2	Mortalidad	
3	 Morbilidad	
5	Recursos, Servicios y Cobertura	
6	Socioeconomicos	
\.


--
-- Data for Name: clasificacion_uso; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY clasificacion_uso (id_clasificacion_uso, descripcion, comentario) FROM stdin;
1	Sala Situacional	\N
2	Calidad	\N
3	CIGOB	\N
4	BID	\N
5	PPR	\N
\.


--
-- Data for Name: conexion; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY conexion (id_conexion, nombre_conexion, comentario, ip, usuario, clave, nombre_base_datos, id_motor, puerto, instancia) FROM stdin;
\.


--
-- Data for Name: ficha_tecnica; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY ficha_tecnica (id_ficha_tecnica, nombre, tema, concepto, objetivo, uso, definicion_operativa, unidad_medida, formula, id_clasificacion_nivel, id_clasificacion_tecnica, id_clasificacion_privacidad, id_clasificacion_uso, id_responsable_indicador, observacion, confiabilidad, estandar) FROM stdin;
\.


--
-- Data for Name: ficha_tecnica_periodicidad; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY ficha_tecnica_periodicidad (id_ficha_tecnica, id_periodicidad) FROM stdin;
2	1
3	1
4	1
5	1
7	1
8	1
9	1
10	1
11	1
12	1
13	1
14	1
16	1
15	1
17	1
17	3
18	3
19	3
\.


--
-- Data for Name: ficha_tecnica_presentacion; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY ficha_tecnica_presentacion (id_ficha_tecnica, id_presentacion) FROM stdin;
2	1
2	3
2	2
3	1
3	3
3	2
4	1
4	3
4	2
5	1
5	3
5	2
7	1
7	3
7	2
8	1
8	3
8	2
9	1
9	3
9	2
10	1
10	3
10	2
11	1
11	3
11	2
12	1
12	3
12	2
13	1
13	3
13	2
14	1
14	3
14	2
16	1
16	3
16	2
15	1
15	3
15	2
17	1
17	3
17	2
18	2
18	3
18	1
19	1
19	3
19	2
\.


--
-- Data for Name: ficha_tecnica_variable; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY ficha_tecnica_variable (id_ficha_tecnica, id_variable, orden) FROM stdin;
2	2	1
2	4	2
3	3	1
3	4	2
4	5	1
4	4	2
5	6	1
5	5	2
7	7	1
7	5	2
8	9	1
8	8	2
9	11	2
9	10	1
10	12	2
11	12	2
10	13	1
11	14	1
12	16	1
12	15	2
13	12	1
13	17	2
14	18	1
14	19	2
16	21	2
16	22	1
15	21	2
15	20	1
17	23	\N
17	21	\N
17	24	\N
17	25	\N
18	24	\N
18	25	\N
19	27	\N
19	26	\N
\.


--
-- Data for Name: form; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY form (id_form, nombre, menu_publicacion, comentario, nombre_tabla) FROM stdin;
2	Infraestructura de Servicios de Salud	1	Formulario utilizado para ingresar la infraestructura de los servicios de Salud por cada establecimiento del Ministerio	form_2
\.


--
-- Data for Name: form_2; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY form_2 (id_2, id_establecimiento, f2v1, f2v2, f2v3, f2v4, f2v5, f2v6, f2v7, f2v8) FROM stdin;
\.


--
-- Data for Name: form_campos; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY form_campos (id_form, nombre_campo_t, nombre_campo_f, tipo_campo, tamano_campo, orden_campo, id_campo, objetivo, llave, llaveg) FROM stdin;
2	F2V1	Consultorios Medicos	2	4	1	10	Establecer la Cantidad de Consultorios Medicos que tiene el establecimiento	0	0
2	F2V2	Consultorios Odontol	2	4	2	11	Establecer la Cantidad de Consultorios Odontologicos que tiene el establecimiento	0	0
2	F2V3	Sala de Partos	2	4	3	12	Establecer la Cantidad de Salas de Parto que posee el establecimiento	0	0
2	F2V4	Sala de Rayos  X	2	4	4	13	Establecer la Cantidad de Sala de Rayos X que tiene el establecimiento	0	0
2	F2V5	Lab.  Clinico	2	4	5	14	Establecer la Cantidad de Laboratorios Clinicos que tiene el establecimiento	0	0
2	F2V6	Lab. de Citologia	2	4	6	15	Establecer la Cantidad de Laboratorios de Citologia que tiene el establecimiento	0	0
2	F2V7	Clinica Colposcopia	2	4	7	16	Establecer la Cantidad de Clinicas de colposcopia que tiene el establecimiento	0	0
2	F2V8	Sal Ultrasonografia	2	4	8	17	Establecer la Cantidad de Salas de Ultrasonografia que tiene el establecimiento	0	0
2	F2V1	Consultorios Medicos	2	4	1	10	Establecer la Cantidad de Consultorios Medicos que tiene el establecimiento	0	0
2	F2V2	Consultorios Odontol	2	4	2	11	Establecer la Cantidad de Consultorios Odontologicos que tiene el establecimiento	0	0
2	F2V3	Sala de Partos	2	4	3	12	Establecer la Cantidad de Salas de Parto que posee el establecimiento	0	0
2	F2V4	Sala de Rayos  X	2	4	4	13	Establecer la Cantidad de Sala de Rayos X que tiene el establecimiento	0	0
2	F2V5	Lab.  Clinico	2	4	5	14	Establecer la Cantidad de Laboratorios Clinicos que tiene el establecimiento	0	0
2	F2V6	Lab. de Citologia	2	4	6	15	Establecer la Cantidad de Laboratorios de Citologia que tiene el establecimiento	0	0
2	F2V7	Clinica Colposcopia	2	4	7	16	Establecer la Cantidad de Clinicas de colposcopia que tiene el establecimiento	0	0
2	F2V8	Sal Ultrasonografia	2	4	8	17	Establecer la Cantidad de Salas de Ultrasonografia que tiene el establecimiento	0	0
\.


--
-- Data for Name: form_cat; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY form_cat (id_form, id_cat, orden, objetivo, llave, llaveg) FROM stdin;
2	7	0	Es Establecimiento al que se esta capturando la informacion	1	0
2	7	0	Es Establecimiento al que se esta capturando la informacion	1	0
\.


--
-- Data for Name: fuente_dato; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY fuente_dato (id_fuente_dato, nombre, contacto, correo, telefono, cargo) FROM stdin;
3	Direccion de primer Nivel de Atencion a traves de las Regiones de salud y SIBASI	Dra. Maria Argelia Dubon	argeliadubon@yahoo.es	22027212	Directora de Primer Nivel de Atencion
5	SIMMOW	SIMMOW	simmow@mspas.gob.sv	1202-4568	SIMMOW
6	Ministerio de Salud Publica	Ministerio de Salud Publica	minsal@mspas.gob.sv	5402-4536	MINSAL
7	Direccion General de Estadistica y Censos	DIGESTIC	digestic@minec.gob.sv	1234-5678	DIGESTIC
8	SEPS	SEPS	seps@mspas.gob.sv	4655-2545	SEPS
\.


--
-- Data for Name: grupos_etarios; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY grupos_etarios (id_grupo, descripcion, sentencia) FROM stdin;
1	Epidemiologico	SELECT cantidad,\n       CASE WHEN edad <=0 THEN ' Menores de 1 año'\n            WHEN edad between 1 and 4 THEN '01-04 años'\n            WHEN edad between 5 and 9 THEN '05-09 años'\n            WHEN edad between 10 and 14 THEN '10-14 años'\n            WHEN edad between 15 and 19 THEN '15-19 años'\n            WHEN edad between 20 and 24 THEN '20-24 años'\n            WHEN edad between 25 and 29 THEN '25-29 años'\n            WHEN edad between 30 and 34 THEN '30-34 años'\n            WHEN edad between 35 and 39 THEN '35-39 años'\n            WHEN edad between 40 and 44 THEN '40-44 años'\n            WHEN edad between 45 and 49 THEN '45-49 años'\n            WHEN edad between 50 and 54 THEN '50-54 años'\n            WHEN edad between 55 and 59 THEN '55-59 años'\n            WHEN edad between 60 and 64 THEN '60-64 años'\n            WHEN edad between 65 and 69 THEN '65-69 años'\n            WHEN edad between 70 and 74 THEN '70-74 años'\n            WHEN edad between 75 and 89 THEN '75-79 años'\n            WHEN edad between 80 and 84 THEN '80-84 años'\n            WHEN edad >= 85  THEN '85 años y más'\n            ELSE 'other'\n       END as grupo
2	Dos en dos 	SELECT cantidad,\n       CASE WHEN edad <= 0 THEN ' Menores de 1 año'\n\t    WHEN edad between 1 and 2 THEN '01-02 años'\n            WHEN edad between 3 and 4 THEN '03-04 años'\n            WHEN edad between 5 and 6 THEN '05-06 años'\n            WHEN edad between 7 and 8 THEN '07-08 años'\n            WHEN edad between 9 and 10 THEN '09-10 años'\n            WHEN edad between 11 and 12 THEN '11-12 años'\n            WHEN edad between 13 and 14 THEN '13-14 años'\n            WHEN edad between 15 and 16 THEN '15-16 años'\n            WHEN edad between 17 and 18 THEN '17-18 años'\n            WHEN edad between 19 and 20 THEN '19-20 años'\n            WHEN edad between 21 and 22 THEN '21-22 años'\n            WHEN edad between 23 and 24 THEN '23-24 años'\n            WHEN edad between 25 and 26 THEN '25-26 años'\n            WHEN edad between 27 and 28 THEN '27-28 años'\n            WHEN edad between 29 and 30 THEN '29-30 años'\n            WHEN edad between 31 and 32 THEN '31-32 años'\n            WHEN edad between 33 and 34 THEN '33-34 años'\n            WHEN edad between 35 and 36 THEN '35-36 años'\n            WHEN edad between 37 and 38 THEN '37-38 años'\n            WHEN edad between 39 and 40 THEN '39-40 años'\n            WHEN edad between 41 and 42 THEN '41-42 años'\n            WHEN edad between 43 and 44 THEN '43-44 años'\n            WHEN edad between 45 and 46 THEN '45-46 años'\n            WHEN edad between 47 and 48 THEN '47-48 años'\n            WHEN edad between 49 and 50 THEN '49-50 años'\n            WHEN edad between 51 and 52 THEN '51-52 años'\n            WHEN edad between 53 and 54 THEN '53-54 años'\n            WHEN edad between 55 and 56 THEN '55-56 años'\n            WHEN edad between 57 and 58 THEN '57-58 años'\n            WHEN edad between 59 and 60 THEN '59-60 años'\n            WHEN edad between 61 and 62 THEN '61-62 años'\n            WHEN edad between 63 and 64 THEN '63-64 años'\n            WHEN edad between 65 and 66 THEN '65-66 años'\n            WHEN edad between 67 and 68 THEN '67-68 años'\n            WHEN edad between 69 and 70 THEN '69-70 años'\n            WHEN edad between 71 and 72 THEN '71-72 años'\n            WHEN edad between 73 and 74 THEN '73-74 años'\n            WHEN edad between 75 and 76 THEN '75-76 años'\n            WHEN edad between 77 and 78 THEN '77-78 años'\n            WHEN edad between 79 and 80 THEN '79-80 años'\n            WHEN edad between 81 and 82 THEN '81-82 años'\n            WHEN edad between 83 and 84 THEN '83-84 años'\n            WHEN edad between 85 and 86 THEN '85-86 años'\n            WHEN edad between 87 and 88 THEN '87-88 años'\n            WHEN edad between 89 and 90 THEN '89-90 años'\n            WHEN edad between 91 and 92 THEN '91-92 años'\n            WHEN edad between 93 and 94 THEN '93-94 años'\n            WHEN edad between 95 and 96 THEN '95-96 años'\n            WHEN edad between 97 and 98 THEN '97-98 años'\n            WHEN edad >= 99  THEN '99 años a mas'\n          END as grupo
3	Tres en tres 	SELECT cantidad,\n       CASE WHEN edad <= 0 THEN ' Menores de 1 año'\n\t    WHEN edad between 1 and 3 THEN '01-03 años'\n            WHEN edad between 4 and 6 THEN '04-06 años'\n            WHEN edad between 7 and 9 THEN '07-09 años'\n            WHEN edad between 10 and 12 THEN '10-12 años'\n            WHEN edad between 13 and 15 THEN '13-15 años'\n            WHEN edad between 16 and 18 THEN '16-18 años'\n            WHEN edad between 19 and 21 THEN '19-21 años'\n            WHEN edad between 22 and 24 THEN '22-24 años'\n            WHEN edad between 25 and 27 THEN '25-27 años'\n            WHEN edad between 28 and 30 THEN '28-30 años'\n            WHEN edad between 31 and 33 THEN '31-33 años'\n            WHEN edad between 34 and 36 THEN '34-36 años'\n            WHEN edad between 37 and 39 THEN '37-39 años'\n            WHEN edad between 40 and 42 THEN '40-42 años'\n            WHEN edad between 43 and 45 THEN '43-45 años'\n            WHEN edad between 46 and 48 THEN '46-48 años'\n            WHEN edad between 49 and 51 THEN '49-51 años'\n            WHEN edad between 52 and 54 THEN '52-54 años'\n            WHEN edad between 55 and 57 THEN '55-57 años'\n            WHEN edad between 58 and 60 THEN '58-60 años'\n            WHEN edad between 61 and 63 THEN '61-63 años'\n            WHEN edad between 64 and 66 THEN '64-66 años'\n            WHEN edad between 67 and 69 THEN '67-69 años'\n            WHEN edad between 70 and 72 THEN '70-72 años'\n            WHEN edad between 73 and 75 THEN '73-75 años'\n            WHEN edad between 76 and 78 THEN '76-78 años'\n            WHEN edad between 79 and 81 THEN '79-81 años'\n            WHEN edad between 82 and 84 THEN '82-84 años'\n            WHEN edad between 85 and 87 THEN '85-87 años'\n            WHEN edad between 88 and 90 THEN '88-90 años'\n            WHEN edad between 91 and 93 THEN '91-93 años'\n            WHEN edad between 94 and 96 THEN '94-96 años'\n            WHEN edad between 97 and 99 THEN '97-99 años'\n            WHEN edad >= 100 THEN 'mas de 100'\n           END as grupo
5	Cinco en cinco  	SELECT cantidad,\n       CASE WHEN edad <= 0 THEN ' Menores de 1 año'\n\t    WHEN edad between 1 and 5 THEN '01-05 años'\n            WHEN edad between 6 and 10 THEN '06-10 años'\n            WHEN edad between 11 and 15 THEN '11-15 años'\n            WHEN edad between 16 and 20 THEN '16-20 años'\n            WHEN edad between 21 and 25 THEN '21-25 años'\n            WHEN edad between 26 and 30 THEN '26-30 años'\n            WHEN edad between 31 and 35 THEN '31-35 años'\n            WHEN edad between 36 and 40 THEN '36-40 años'\n            WHEN edad between 41 and 45 THEN '41-45 años'\n            WHEN edad between 46 and 50 THEN '46-50 años'\n            WHEN edad between 51 and 55 THEN '51-55 años'\n            WHEN edad between 56 and 60 THEN '56-60 años'\n            WHEN edad between 61 and 65 THEN '61-65 años'\n            WHEN edad between 66 and 70 THEN '66-70 años'\n            WHEN edad between 71 and 75 THEN '71-75 años'\n            WHEN edad between 76 and 80 THEN '76-80 años'\n            WHEN edad between 81 and 85 THEN '81-85 años'\n            WHEN edad between 86 and 90 THEN '86-90 años'\n            WHEN edad between 91 and 95 THEN '91-95 años'\n            WHEN edad between 96 and 100 THEN '96-100 años'\n                WHEN edad >= 101 THEN 'mas de 101'\n           END as grupo
6	Diez en diez  	SELECT cantidad,\n       CASE WHEN edad <= 0 THEN ' Menores de 1 año'\n\t    WHEN edad between 1 and 10 THEN '01-10 años'\n            WHEN edad between 11 and 20 THEN '11-20 años'\n            WHEN edad between 21 and 30 THEN '21-30 años'\n            WHEN edad between 31 and 40 THEN '31-40 años'\n            WHEN edad between 41 and 50 THEN '41-50 años'\n            WHEN edad between 51 and 60 THEN '51-60 años'\n            WHEN edad between 61 and 70 THEN '61-70 años'\n            WHEN edad between 71 and 80 THEN '71-80 años'\n            WHEN edad between 81 and 90 THEN '81-90 años'\n            WHEN edad between 91 and 100 THEN '91-100 años'\n            WHEN edad >= 101 THEN 'mas de 100'\n           END as grupo
4	Cuatro en cuatro  	SELECT cantidad,\n       CASE WHEN edad <= 0 THEN ' Menores de 1 año'\n\t    WHEN edad between 1 and 4 THEN '01-04 años'\n            WHEN edad between 5 and 8 THEN '05-08 años'\n            WHEN edad between 9 and 12 THEN '09-12 años'\n            WHEN edad between 13 and 16 THEN '13-16 años'\n            WHEN edad between 17 and 20 THEN '17-20 años'\n            WHEN edad between 21 and 24 THEN '21-24 años'\n            WHEN edad between 25 and 28 THEN '25-28 años'\n            WHEN edad between 29 and 32 THEN '29-32 años'\n            WHEN edad between 33 and 36 THEN '33-36 años'\n            WHEN edad between 37 and 40 THEN '37-40 años'\n            WHEN edad between 41 and 44 THEN '41-44 años'\n            WHEN edad between 45 and 48 THEN '45-48 años'\n            WHEN edad between 49 and 52 THEN '49-52 años'\n            WHEN edad between 53 and 56 THEN '53-56 años'\n            WHEN edad between 57 and 60 THEN '67-60 años'\n            WHEN edad between 61 and 64 THEN '61-64 años'\n            WHEN edad between 65 and 68 THEN '65-68 años'\n            WHEN edad between 69 and 72 THEN '69-72 años'\n            WHEN edad between 73 and 76 THEN '73-76 años'\n            WHEN edad between 77 and 80 THEN '77-80 años'\n            WHEN edad between 81 and 84 THEN '81-84 años'\n            WHEN edad between 85 and 88 THEN '85-88 años'\n            WHEN edad between 89 and 92 THEN '89-92 años'\n            WHEN edad between 93 and 96 THEN '93-96 años'\n            WHEN edad between 97 and 100 THEN '97-100 años'\n            WHEN edad >= 101 THEN 'mas de 100'\n           END as grupo
\.


--
-- Data for Name: motor_bd; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY motor_bd (id_motor, nombre_motor) FROM stdin;
1	MySQL
2	Postgres
3	SQL Server
\.


--
-- Data for Name: opciones_menu; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY opciones_menu (id_menu, nombre, id_padre, ruta, publicado) FROM stdin;
1	Catalogos	0	/indicadores/conexiones	1
2	Conexiones	0	/indicadores/conexiones	1
4	Formulas de Indicadores	0	/indicadores/formula	1
6	Conexiones a Bases de Datos	2	/indicadores/conexiones/conexion	1
8	Conexiones a Web Service	2	/indicadores/conexiones/webservice	1
9	Responsabel de datos	1	/indicadores/catalogos/responsable_dato	1
10	Fuente de Dato	1	/indicadores/catalogos/fuente_dato	1
12	Variables	4	/indicadores/formula/variable	1
7	Sentensias SQL	2	/indicadores/conexiones/sentencia	1
11	Formularios	3	/indicadores/conexiones/formularios	1
15	prueba dos	13	ninguna	1
14	Opciones de Menu	1	/indicadores/catalogos/opciones_menu	1
22	Ficha Tecnica	4	/indicadores/formula/ficha	1
23	Responsable de Indicador	1	/indicadores/catalogos/responsable_indicador	1
16	Formularios de Usuarios	0	/indicadores/conexiones	1
25	Infraestructura de Servicios de Salud	16	/indicadores/conexiones/form_usuarios/index.php?id=2	1
26	Indicadores	5	/indicadores/paneles/indicadores	1
27	Paneles de indicadores	5	/indicadores/paneles/paneles	1
5	Indicadores	0	/indicadores/	1
28	Poblacion DIGESTIC	5	/indicadores/paneles/poblaciondigestic	1
3	Formularios	0	/indicadores/conexiones	1
29	Roles de Menu	1	/indicadores/catalogos/roles	1
30	Asociar Opciones de Menu a Rol	1	/indicadores/catalogos/roles_opciones/	1
31	Clasificacion Tecnica	1	/indicadores/catalogos/clasificacion_tecnica	1
32	Clasificacion segun Perivacidad	1	/indicadores/catalogos/clasificacion_privacidad	1
33	Clasificacion segun Nivel	1	/indicadores/catalogos/clasificacion_nivel	1
34	Clasificacion segun Uso	1	/indicadores/catalogos/clasificacion_uso	1
\.


--
-- Data for Name: periodos; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY periodos (id_periodo, descripcion, sentencia) FROM stdin;
3	Semestre	 SELECT cantidad, CASE \n\tWHEN mes between  1 and  6 THEN 'Sem 1' \n\tWHEN mes between  7 and 12 THEN 'Sem 2'  \n\tELSE 'other' END as mes 
2	Trimestres	 SELECT cantidad, CASE \n\tWHEN mes between  1 and  3 THEN 'Trim 1' \n\tWHEN mes between  4 and  6 THEN 'Trim 2'  \n\tWHEN mes between  7 and  9 THEN 'Trim 3'  \n\tWHEN mes between 10 and 12 THEN 'Trim 4'  \n\tELSE 'other' END as mes \n
0	Anio	
1	Meses	 SELECT cantidad, CASE \n\tWHEN mes = 1 THEN '01.Ene' \n\tWHEN mes = 2 THEN '02.Feb'  \n\tWHEN mes = 3 THEN '03.Mar'  \n\tWHEN mes = 4 THEN '04.Abr'  \n\tWHEN mes = 5 THEN '05.May'  \n\tWHEN mes = 6 THEN '06.Jun'  \n\tWHEN mes = 7 THEN '07.Jul'  \n\tWHEN mes = 8 THEN '08.Ago'  \n\tWHEN mes = 9 THEN '09.Sep'  \n\tWHEN mes = 10 THEN '10.Oct'  \n\tWHEN mes = 11 THEN '11.Nov'  \n\tWHEN mes = 12 THEN '12.Dic'\n\tELSE 'other' END as mes 
\.


--
-- Data for Name: responsable_dato; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY responsable_dato (id_responsable_dato, nombre, contacto, correo, telefono, cargo) FROM stdin;
3	Direccion de primer Nivel de Atencion a traves de las Regiones de salud y SIBASI	Dra. maria Argelia Dubon	argeliadubon@yahoo.es	22027212	Directora de Priemr Nivel de Atencion
6	SIMMOW	SIMMOW	simmow@mspas.gob.sv	1234-5678	SIMMOW
7	Ministerio de Salud Publica	Ministerio de Salud Publica	minsal@mspas.gob.sv	2158-3579	MINSAL
8	Direccion General de Estadistica y Censos	DIGESTIC	digestic@minec.gob.sv	1234-5678	DIGESTIC
9	SEPS	SEPS	seps@mspas.gob.sv	1234-5678	SEPS
\.


--
-- Data for Name: responsable_indicador; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY responsable_indicador (id_responsable_indicador, nombre, contacto, correo, telefono, cargo) FROM stdin;
3	Direccion de primer Nivel de Atencion a traves de las Regiones de salud y SIBASI	Dra. Maria Argelia Dubon	argeliadubon@yahoo.es	22027212	Directora de Primer Nivel de Atencion
5	Direccion de Planificacion	Direccion de Planificacion	drpla@mspas.gob.sv	1234-5678	Direccion de Planificacion
6	Comite de Indicadores	Comite de Indicadores	minsal@mspas.gob.sv	1231-1231	Comite de Indicadores
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY roles (id_rol, rol, descripcion) FROM stdin;
2	Tecnico Informatico	Debe tener amplios conocimientos de bases de datos y de programacion
3	Tecnico en Estadist e Inf.	Debe tener amplios conocimientos de estadistica y de estructura de informacion
4	Digitador.	Debe tener el suficiente adiestramiento para el llenado de formularios
5	Usuario Registrado	Esta autorizado para ver todos los indicadores publicados
1	Administrador	Tiene todos los privilegios
\.


--
-- Data for Name: roles_opciones; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY roles_opciones (id_rol, id_opcion) FROM stdin;
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
1	14
1	15
1	16
1	22
1	23
1	25
1	26
1	27
1	28
2	1
2	2
2	3
2	6
2	7
2	8
2	9
2	10
2	11
2	14
2	23
2	25
2	16
3	1
3	4
3	5
3	9
3	10
3	12
3	22
3	23
3	26
3	27
3	28
4	16
4	25
5	5
5	26
1	29
1	30
1	31
1	32
1	33
1	34
\.


--
-- Data for Name: sentencia; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY sentencia (id_sentencia, id_conexion, nombre_consulta, sentencia_sql, comentario) FROM stdin;
\.


--
-- Data for Name: series; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY series (id_usuario, id_indicador, temporal, seriex, seriey, tipop, tem, id_serie, texto) FROM stdin;
1	16	1	{F,M}	{1.573913,0.801337}	Linea	116	199	FILTRADO POR:  municipio= AHUACHAPAN AH,  anio= 2011,  edad desde 0 hasta 20 anio , AGRUPADO POR: sexo
1	15	1	{01-04_,05-09_,10-14_,15-19_,20-24_,25-29_,30-34_,35-39_,40-44_,45-49_,50-54_,55-59_,60-64_,65-69_,70-74_,75-79_,85_añ,_Menor}	{0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000}	Linea	115	241	FILTRADO POR:  anio= 2010,  AGRUPADO POR: edad
1	18	1	{01.Ene,02.Feb,03.Mar,04.Abr,05.May,06.Jun}	{82.352941,69.565217,76.923077,65.517241,78.947368,77.777778}	Linea	118	402	FILTRADO POR:  municipio= ILOB_CA,  anio= 2012,  AGRUPADO POR: Meses
1	2	1	{AHUACH,APANEC,ATIQUI,CONC.A,GUAYMA,JUJUTL,REFUGI,S.FCO.,S.LORE,S.PED.,TACB_A,TURIN_}	{104.012036,101.242236,85.786802,0.000000,79.911700,90.824261,0.000000,0.000000,0.000000,0.000000,0.000000,86.486486}	Linea	102	405	FILTRADO POR:  departamento= AH,  anio= 2010,  AGRUPADO POR: municipio
1	14	1	{AH,CA,CH,CU,LL,LP,LU,MO,SA,SM,SO,SS,SV,US}	{6.178793,7.169131,5.497439,7.636937,6.439362,7.692308,6.103267,5.408348,5.135882,8.549831,1.989938,7.575580,13.548997,6.387661}	Barra	500	331	FILTRADO POR:  anio= 2010,  AGRUPADO POR: departamento
5	11	1	{AH,CA,CH,CU,LL,LP,LU,MO,SA,SM,SO,SS,SV,US}	{28.566170,28.589951,28.002699,29.846873,32.565130,32.571151,30.024160,30.699088,31.402266,31.821572,30.299217,33.987023,30.276817,33.468286}	Barra	111	313	FILTRADO POR:  anio= 2010,  AGRUPADO POR: departamento
1	3	1	{AH,CA,CH,CU,LL,LP,LU,MO,SA,SM,SO,SS,SV,US}	{92.426449,92.665765,88.967320,91.742586,91.617447,94.493263,99.390244,77.997644,86.791586,100.614314,91.954999,79.569037,95.496009,94.585448}	Linea	103	406	FILTRADO POR:  anio= 2010,  AGRUPADO POR: departamento
5	14	1	{Centra,Metrop,Occide,Orient,Parace}	{6.102006,7.575580,4.399562,6.857643,8.748903}	Linea	114	330	FILTRADO POR:  anio= 2010,  AGRUPADO POR: region
1	4	1	{AH,CA,CH,CU,LL,LP,LU,MO,SA,SM,SO,SS,SV,US}	{85.683076,91.907984,84.444444,81.081605,57.776768,70.738137,83.658537,78.421673,68.687425,72.785912,80.407557,47.419194,81.841505,70.818691}	Barra	104	338	FILTRADO POR:  anio= 2010,  AGRUPADO POR: departamento
1	19	1	{Centra,Metrop,Occide,Orient,Parace}	{28.409091,6.091371,12.651646,6.875754,6.644518}	Barra	119	388	FILTRADO POR:  anio= 2012,  AGRUPADO POR: region
\.


--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY usuarios (id_usuarios, usuario, clave, nombre, id_rol) FROM stdin;
1	admin	202cb962ac59075b964b07152d234b70	eduardo	1
2	teci	97db94356904d26ec4fc70bd1d889048	Tecnico Informatico	2
3	tece	8fe6503b94d93e0ddcc8fd488ca6f61c	Tecnico Estadistico	3
4	dig	1534477b314797aae378d292ec836521	Digitador	4
5	usr	0a744893951e0d1706ff74a7afccf561	Usuario Registrado	5
\.


--
-- Data for Name: variable_dato; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY variable_dato (id_variable, id_sentencia, id_web_service, nombre, id_fuente, id_responsable, confiabilidad, iniciales, comentario, es_poblacion) FROM stdin;
\.


--
-- Data for Name: vitacora; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY vitacora (usuario_id, ip, fecha) FROM stdin;
\.


--
-- Data for Name: web_service; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY web_service (id_web_service, nombre_web_service, url_web_service, nombre_func_web_service, credenciales_usuario, sentencia_consulta, comentario) FROM stdin;
\.


--
-- Name: ficha_periodicidad; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY ficha_tecnica_periodicidad
    ADD CONSTRAINT ficha_periodicidad UNIQUE (id_ficha_tecnica, id_periodicidad);


--
-- Name: ficha_presentacion; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY ficha_tecnica_presentacion
    ADD CONSTRAINT ficha_presentacion UNIQUE (id_ficha_tecnica, id_presentacion);


--
-- Name: fichatecnica_ariable; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY ficha_tecnica_variable
    ADD CONSTRAINT fichatecnica_ariable UNIQUE (id_ficha_tecnica, id_variable);


--
-- Name: id_2; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY form_2
    ADD CONSTRAINT id_2 PRIMARY KEY (id_2);


--
-- Name: id_area; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY cat_area
    ADD CONSTRAINT id_area PRIMARY KEY (id_area);


--
-- Name: id_canton; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY cat_canton
    ADD CONSTRAINT id_canton PRIMARY KEY (id_canton);


--
-- Name: id_cargofuncional; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY cat_cargo_funcional
    ADD CONSTRAINT id_cargofuncional PRIMARY KEY (id_cargofuncional);


--
-- Name: id_cargonominal; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY cat_cargo_nominal
    ADD CONSTRAINT id_cargonominal PRIMARY KEY (id_cargonominal);


--
-- Name: id_cat; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY catalogos
    ADD CONSTRAINT id_cat PRIMARY KEY (id_cat);


--
-- Name: id_cat_genero; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY cat_genero
    ADD CONSTRAINT id_cat_genero PRIMARY KEY (id_genero);


--
-- Name: id_cat_municipio; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY cat_municipio
    ADD CONSTRAINT id_cat_municipio PRIMARY KEY (id_municipio);


--
-- Name: id_clasificacio_nivel; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY clasificacion_nivel
    ADD CONSTRAINT id_clasificacio_nivel PRIMARY KEY (id_clasificacion_nivel);


--
-- Name: id_clasificacion_privacidad; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY clasificacion_privacidad
    ADD CONSTRAINT id_clasificacion_privacidad PRIMARY KEY (id_clasificacion_privacidad);


--
-- Name: id_clasificacion_tecnica; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY clasificacion_tecnica
    ADD CONSTRAINT id_clasificacion_tecnica PRIMARY KEY (id_clasificacion_tecnica);


--
-- Name: id_clasificacion_uso; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY clasificacion_uso
    ADD CONSTRAINT id_clasificacion_uso PRIMARY KEY (id_clasificacion_uso);


--
-- Name: id_conexion; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY conexion
    ADD CONSTRAINT id_conexion PRIMARY KEY (id_conexion);


--
-- Name: id_departamento; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY cat_departamento
    ADD CONSTRAINT id_departamento PRIMARY KEY (id_departamento);


--
-- Name: id_establecimiento2; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY form_2
    ADD CONSTRAINT id_establecimiento2 UNIQUE (id_establecimiento);


--
-- Name: id_ficha_tecnica; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY ficha_tecnica
    ADD CONSTRAINT id_ficha_tecnica PRIMARY KEY (id_ficha_tecnica);


--
-- Name: id_form; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY form
    ADD CONSTRAINT id_form PRIMARY KEY (id_form);


--
-- Name: id_fuente_datos; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY fuente_dato
    ADD CONSTRAINT id_fuente_datos PRIMARY KEY (id_fuente_dato);


--
-- Name: id_fuentefinanciamiento; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY cat_fuentefinanciamiento
    ADD CONSTRAINT id_fuentefinanciamiento PRIMARY KEY (id_fuentefinanciamiento);


--
-- Name: id_grupo_etario; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY grupos_etarios
    ADD CONSTRAINT id_grupo_etario PRIMARY KEY (id_grupo);


--
-- Name: id_menu; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY opciones_menu
    ADD CONSTRAINT id_menu PRIMARY KEY (id_menu);


--
-- Name: id_motor; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY motor_bd
    ADD CONSTRAINT id_motor PRIMARY KEY (id_motor);


--
-- Name: id_periodo; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY periodos
    ADD CONSTRAINT id_periodo PRIMARY KEY (id_periodo);


--
-- Name: id_periodo_indicador; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY cat_periodo_indicador
    ADD CONSTRAINT id_periodo_indicador PRIMARY KEY (id_periodo_indicador);


--
-- Name: id_presentacion; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY cat_presentacion
    ADD CONSTRAINT id_presentacion PRIMARY KEY (id_presentacion);


--
-- Name: id_programa; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY cat_programas
    ADD CONSTRAINT id_programa PRIMARY KEY (id_programa);


--
-- Name: id_region; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY cat_regiones
    ADD CONSTRAINT id_region PRIMARY KEY (id_region);


--
-- Name: id_region_sinab; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY cat_regiones_sinab
    ADD CONSTRAINT id_region_sinab PRIMARY KEY (id_region_sinab);


--
-- Name: id_responsable_datos; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY responsable_dato
    ADD CONSTRAINT id_responsable_datos PRIMARY KEY (id_responsable_dato);


--
-- Name: id_responsable_indicador; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY responsable_indicador
    ADD CONSTRAINT id_responsable_indicador PRIMARY KEY (id_responsable_indicador);


--
-- Name: id_rol; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT id_rol PRIMARY KEY (id_rol);


--
-- Name: id_sentencia; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY sentencia
    ADD CONSTRAINT id_sentencia PRIMARY KEY (id_sentencia);


--
-- Name: id_sexo; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY cat_sexo
    ADD CONSTRAINT id_sexo PRIMARY KEY (id_sexo);


--
-- Name: id_sibasi; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY cat_sibasi
    ADD CONSTRAINT id_sibasi PRIMARY KEY (idsibasi);


--
-- Name: id_sibasi_sinab; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY cat_sibasi_sinab
    ADD CONSTRAINT id_sibasi_sinab PRIMARY KEY (idsibasi_sinab);


--
-- Name: id_usuario; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT id_usuario PRIMARY KEY (id_usuarios);


--
-- Name: id_varaible; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY variable_dato
    ADD CONSTRAINT id_varaible PRIMARY KEY (id_variable);


--
-- Name: id_web_service; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY web_service
    ADD CONSTRAINT id_web_service PRIMARY KEY (id_web_service);


--
-- Name: idestasib; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY cat_ecos
    ADD CONSTRAINT idestasib PRIMARY KEY (idestasib);


--
-- Name: idestasibi; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY cat_estabi
    ADD CONSTRAINT idestasibi PRIMARY KEY (idestasibi);


--
-- Name: clas_nivel; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY ficha_tecnica
    ADD CONSTRAINT clas_nivel FOREIGN KEY (id_clasificacion_nivel) REFERENCES clasificacion_nivel(id_clasificacion_nivel);


--
-- Name: clas_privasidad; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY ficha_tecnica
    ADD CONSTRAINT clas_privasidad FOREIGN KEY (id_clasificacion_privacidad) REFERENCES clasificacion_privacidad(id_clasificacion_privacidad);


--
-- Name: clas_tecnica; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY ficha_tecnica
    ADD CONSTRAINT clas_tecnica FOREIGN KEY (id_clasificacion_tecnica) REFERENCES clasificacion_tecnica(id_clasificacion_tecnica);


--
-- Name: clas_uso; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY ficha_tecnica
    ADD CONSTRAINT clas_uso FOREIGN KEY (id_clasificacion_uso) REFERENCES clasificacion_uso(id_clasificacion_uso);


--
-- Name: id_cat; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY form_cat
    ADD CONSTRAINT id_cat FOREIGN KEY (id_cat) REFERENCES catalogos(id_cat);


--
-- Name: id_conexion; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY sentencia
    ADD CONSTRAINT id_conexion FOREIGN KEY (id_conexion) REFERENCES conexion(id_conexion) MATCH FULL;


--
-- Name: id_departamento; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY cat_municipio
    ADD CONSTRAINT id_departamento FOREIGN KEY (id_departamento) REFERENCES cat_departamento(id_departamento);


--
-- Name: id_ficha_tecnica_responsable_indicador; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY ficha_tecnica
    ADD CONSTRAINT id_ficha_tecnica_responsable_indicador FOREIGN KEY (id_responsable_indicador) REFERENCES responsable_indicador(id_responsable_indicador);


--
-- Name: id_form; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY form_cat
    ADD CONSTRAINT id_form FOREIGN KEY (id_form) REFERENCES form(id_form);


--
-- Name: id_motor; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY conexion
    ADD CONSTRAINT id_motor FOREIGN KEY (id_motor) REFERENCES motor_bd(id_motor) MATCH FULL;


--
-- Name: id_variable_fuente_datos; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY variable_dato
    ADD CONSTRAINT id_variable_fuente_datos FOREIGN KEY (id_fuente) REFERENCES fuente_dato(id_fuente_dato);


--
-- Name: id_variable_responsable_dato; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY variable_dato
    ADD CONSTRAINT id_variable_responsable_dato FOREIGN KEY (id_responsable) REFERENCES responsable_dato(id_responsable_dato);


--
-- Name: id_variable_sentencia; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY variable_dato
    ADD CONSTRAINT id_variable_sentencia FOREIGN KEY (id_sentencia) REFERENCES sentencia(id_sentencia);


--
-- Name: id_variable_web_service; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY variable_dato
    ADD CONSTRAINT id_variable_web_service FOREIGN KEY (id_web_service) REFERENCES web_service(id_web_service);


--
-- Name: rol_opcion; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY roles_opciones
    ADD CONSTRAINT rol_opcion FOREIGN KEY (id_rol) REFERENCES roles(id_rol);


--
-- Name: rol_usuario; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT rol_usuario FOREIGN KEY (id_rol) REFERENCES roles(id_rol);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

