--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3 (Ubuntu 13.3-1.pgdg20.04+1)
-- Dumped by pg_dump version 13.3 (Ubuntu 13.3-1.pgdg20.04+1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: acciones_adelantadas; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.acciones_adelantadas (
    id_accion_adelantada integer NOT NULL,
    id_tipo_actividad integer,
    id_entidad integer,
    id_emergencia integer,
    personas_involucradas integer,
    fecha date,
    hombres integer DEFAULT 0,
    mujeres integer DEFAULT 0,
    ninos integer DEFAULT 0
);


ALTER TABLE public.acciones_adelantadas OWNER TO admin;

--
-- Name: acciones_adelantadas_id_accion_adelantada_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.acciones_adelantadas_id_accion_adelantada_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.acciones_adelantadas_id_accion_adelantada_seq OWNER TO admin;

--
-- Name: acciones_adelantadas_id_accion_adelantada_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.acciones_adelantadas_id_accion_adelantada_seq OWNED BY public.acciones_adelantadas.id_accion_adelantada;


--
-- Name: actas_reunion; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.actas_reunion (
    id_acta_reunion integer NOT NULL,
    fecha date,
    lugar character varying,
    hora_inicio character varying,
    hora_fin character varying,
    convoca character varying,
    objeto text,
    desarrollo text,
    conclusiones text,
    asistentes text,
    id_tipo_acta integer
);


ALTER TABLE public.actas_reunion OWNER TO admin;

--
-- Name: actas_reunion_id_acta_reunion_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.actas_reunion_id_acta_reunion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.actas_reunion_id_acta_reunion_seq OWNER TO admin;

--
-- Name: actas_reunion_id_acta_reunion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.actas_reunion_id_acta_reunion_seq OWNED BY public.actas_reunion.id_acta_reunion;


--
-- Name: actividades; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.actividades (
    id_actividad integer NOT NULL,
    fecha_estimada date,
    fecha_entrega date,
    descripcion text,
    id_funcionario integer,
    desarrollo text,
    anexos text,
    cumplida integer,
    id_obligacion integer
);


ALTER TABLE public.actividades OWNER TO admin;

--
-- Name: actividades_id_actividad_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.actividades_id_actividad_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.actividades_id_actividad_seq OWNER TO admin;

--
-- Name: actividades_id_actividad_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.actividades_id_actividad_seq OWNED BY public.actividades.id_actividad;


--
-- Name: calamidad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.calamidad (
    id_calamidad integer NOT NULL,
    descripcion text,
    fecha date,
    documentos text,
    fecha_cierre date,
    resolucion_cierre text,
    id_municipio integer
);


ALTER TABLE public.calamidad OWNER TO postgres;

--
-- Name: calamidad_id_calamidad_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.calamidad_id_calamidad_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.calamidad_id_calamidad_seq OWNER TO postgres;

--
-- Name: calamidad_id_calamidad_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.calamidad_id_calamidad_seq OWNED BY public.calamidad.id_calamidad;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    parent_id integer,
    "order" integer DEFAULT 1 NOT NULL,
    name character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.categories OWNER TO admin;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO admin;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: data_rows; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.data_rows (
    id integer NOT NULL,
    data_type_id integer NOT NULL,
    field character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    display_name character varying(255) NOT NULL,
    required boolean DEFAULT false NOT NULL,
    browse boolean DEFAULT true NOT NULL,
    read boolean DEFAULT true NOT NULL,
    edit boolean DEFAULT true NOT NULL,
    add boolean DEFAULT true NOT NULL,
    delete boolean DEFAULT true NOT NULL,
    details text,
    "order" integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.data_rows OWNER TO admin;

--
-- Name: data_rows_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.data_rows_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.data_rows_id_seq OWNER TO admin;

--
-- Name: data_rows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.data_rows_id_seq OWNED BY public.data_rows.id;


--
-- Name: data_types; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.data_types (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    display_name_singular character varying(255) NOT NULL,
    display_name_plural character varying(255) NOT NULL,
    icon character varying(255),
    model_name character varying(255),
    description character varying(255),
    generate_permissions boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    server_side smallint DEFAULT '0'::smallint NOT NULL,
    controller character varying(255),
    policy_name character varying(255),
    details text
);


ALTER TABLE public.data_types OWNER TO admin;

--
-- Name: data_types_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.data_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.data_types_id_seq OWNER TO admin;

--
-- Name: data_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.data_types_id_seq OWNED BY public.data_types.id;


--
-- Name: detalle_inventario; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.detalle_inventario (
    id_detalle_inventario integer NOT NULL,
    id_inventario_salida integer,
    id_tipo_ayuda integer,
    cantidad integer
);


ALTER TABLE public.detalle_inventario OWNER TO admin;

--
-- Name: detalle_inventario_id_detalle_inventario_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.detalle_inventario_id_detalle_inventario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.detalle_inventario_id_detalle_inventario_seq OWNER TO admin;

--
-- Name: detalle_inventario_id_detalle_inventario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.detalle_inventario_id_detalle_inventario_seq OWNED BY public.detalle_inventario.id_detalle_inventario;


--
-- Name: emergencias; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.emergencias (
    id_emergencia integer NOT NULL,
    descripcion character varying,
    localizacion character varying,
    fecha timestamp without time zone,
    estado character varying,
    tipo_emergencia integer,
    id_municipio integer,
    comuna character varying,
    fuente_agua character varying,
    movil integer,
    id_entidad integer,
    id_funcionario integer,
    criticidad character varying DEFAULT 'Baja'::character varying,
    fotos text,
    video text,
    user_id integer
);


ALTER TABLE public.emergencias OWNER TO admin;

--
-- Name: emergencias_actas; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.emergencias_actas (
    id_emergencia integer,
    id_acta_reunion integer
);


ALTER TABLE public.emergencias_actas OWNER TO admin;

--
-- Name: emergencias_id_emergencia_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.emergencias_id_emergencia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.emergencias_id_emergencia_seq OWNER TO admin;

--
-- Name: emergencias_id_emergencia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.emergencias_id_emergencia_seq OWNED BY public.emergencias.id_emergencia;


--
-- Name: entidades; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.entidades (
    id_entidad integer NOT NULL,
    nombre character varying,
    responsable character varying,
    telefono character varying,
    email character varying,
    id_municipio integer
);


ALTER TABLE public.entidades OWNER TO admin;

--
-- Name: entidades_id_entidad_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.entidades_id_entidad_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.entidades_id_entidad_seq OWNER TO admin;

--
-- Name: entidades_id_entidad_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.entidades_id_entidad_seq OWNED BY public.entidades.id_entidad;


--
-- Name: exports; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.exports (
    id_export integer NOT NULL,
    name character varying,
    query text,
    id_data_type integer
);


ALTER TABLE public.exports OWNER TO admin;

--
-- Name: exports_id_export_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.exports_id_export_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exports_id_export_seq OWNER TO admin;

--
-- Name: exports_id_export_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.exports_id_export_seq OWNED BY public.exports.id_export;


--
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO admin;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.failed_jobs_id_seq OWNER TO admin;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- Name: funcionarios; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.funcionarios (
    id_funcionario integer NOT NULL,
    nombre character varying,
    documento character varying,
    edad integer,
    sexo character(1),
    direccion character varying,
    telefono character varying,
    profesion character varying,
    email character varying,
    especializacion character varying,
    vinculacion character varying,
    contrato character varying,
    inicio_contrato date,
    actividades text,
    arl character varying,
    eps character varying,
    pensiones character varying
);


ALTER TABLE public.funcionarios OWNER TO admin;

--
-- Name: funcionarios_id_funcionario_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.funcionarios_id_funcionario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.funcionarios_id_funcionario_seq OWNER TO admin;

--
-- Name: funcionarios_id_funcionario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.funcionarios_id_funcionario_seq OWNED BY public.funcionarios.id_funcionario;


--
-- Name: informes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.informes (
    id_informe integer NOT NULL,
    id_funcionario integer,
    inicio date,
    fin date,
    elaboracion date,
    numero character varying,
    observaciones text,
    aprobado integer DEFAULT 0,
    archivo text
);


ALTER TABLE public.informes OWNER TO postgres;

--
-- Name: informes_id_informe_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.informes_id_informe_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.informes_id_informe_seq OWNER TO postgres;

--
-- Name: informes_id_informe_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.informes_id_informe_seq OWNED BY public.informes.id_informe;


--
-- Name: inventario_entrada; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.inventario_entrada (
    id_inventario_entrada integer NOT NULL,
    fecha date,
    id_tipo_ayuda integer,
    cantidad integer,
    origen_ayuda character varying(200)
);


ALTER TABLE public.inventario_entrada OWNER TO admin;

--
-- Name: inventario_entrada_id_inventario_entrada_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.inventario_entrada_id_inventario_entrada_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inventario_entrada_id_inventario_entrada_seq OWNER TO admin;

--
-- Name: inventario_entrada_id_inventario_entrada_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.inventario_entrada_id_inventario_entrada_seq OWNED BY public.inventario_entrada.id_inventario_entrada;


--
-- Name: inventario_salida; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.inventario_salida (
    id_inventario_salida integer NOT NULL,
    id_entidad integer,
    fecha date,
    id_emergencia integer
);


ALTER TABLE public.inventario_salida OWNER TO admin;

--
-- Name: inventario_salida_id_inventario_salida_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.inventario_salida_id_inventario_salida_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inventario_salida_id_inventario_salida_seq OWNER TO admin;

--
-- Name: inventario_salida_id_inventario_salida_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.inventario_salida_id_inventario_salida_seq OWNED BY public.inventario_salida.id_inventario_salida;


--
-- Name: inversiones; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.inversiones (
    id_inversion integer NOT NULL,
    descripcion character varying,
    valor numeric,
    fecha date,
    id_emergencia integer
);


ALTER TABLE public.inversiones OWNER TO admin;

--
-- Name: inversiones_id_inversion_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.inversiones_id_inversion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inversiones_id_inversion_seq OWNER TO admin;

--
-- Name: inversiones_id_inversion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.inversiones_id_inversion_seq OWNED BY public.inversiones.id_inversion;


--
-- Name: mantenimientos; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.mantenimientos (
    id_mantenimiento integer NOT NULL,
    id_maquinaria integer,
    fecha date,
    costo numeric,
    horas integer,
    proveedor character varying(200),
    valor_factura numeric(20,2),
    numero_factura character varying(20),
    numero_folio character varying(20),
    tipo_mantenimiento character varying(200)
);


ALTER TABLE public.mantenimientos OWNER TO admin;

--
-- Name: mantenimientos_id_mantenimiento_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.mantenimientos_id_mantenimiento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mantenimientos_id_mantenimiento_seq OWNER TO admin;

--
-- Name: mantenimientos_id_mantenimiento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.mantenimientos_id_mantenimiento_seq OWNED BY public.mantenimientos.id_mantenimiento;


--
-- Name: maquinaria; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.maquinaria (
    id_maquinaria integer NOT NULL,
    marca character varying,
    capacidad character varying,
    presupuesto character varying,
    ubicacion character varying,
    descripcion character varying,
    activa integer,
    linea character varying(100),
    serial character varying(100),
    "año_asignacion" integer,
    placa character varying(20),
    observaciones text,
    info character varying
);


ALTER TABLE public.maquinaria OWNER TO admin;

--
-- Name: maquinaria_id_maquinaria_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.maquinaria_id_maquinaria_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.maquinaria_id_maquinaria_seq OWNER TO admin;

--
-- Name: maquinaria_id_maquinaria_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.maquinaria_id_maquinaria_seq OWNED BY public.maquinaria.id_maquinaria;


--
-- Name: medios; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.medios (
    id_medio integer NOT NULL,
    id_emergencia integer,
    descripcion character varying,
    archivo text,
    tipo character(1)
);


ALTER TABLE public.medios OWNER TO admin;

--
-- Name: medios_id_medio_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.medios_id_medio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.medios_id_medio_seq OWNER TO admin;

--
-- Name: medios_id_medio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.medios_id_medio_seq OWNED BY public.medios.id_medio;


--
-- Name: menu_items; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.menu_items (
    id integer NOT NULL,
    menu_id integer,
    title character varying(255) NOT NULL,
    url character varying(255) NOT NULL,
    target character varying(255) DEFAULT '_self'::character varying NOT NULL,
    icon_class character varying(255),
    color character varying(255),
    parent_id integer,
    "order" integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    route character varying(255),
    parameters text
);


ALTER TABLE public.menu_items OWNER TO admin;

--
-- Name: menu_items_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.menu_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menu_items_id_seq OWNER TO admin;

--
-- Name: menu_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.menu_items_id_seq OWNED BY public.menu_items.id;


--
-- Name: menus; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.menus (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.menus OWNER TO admin;

--
-- Name: menus_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.menus_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menus_id_seq OWNER TO admin;

--
-- Name: menus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.menus_id_seq OWNED BY public.menus.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO admin;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO admin;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: municipios; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.municipios (
    id_municipio integer NOT NULL,
    nombre character varying,
    funcionario text,
    direccion text,
    email text,
    telefono text,
    documentos text,
    localizacion character varying
);


ALTER TABLE public.municipios OWNER TO admin;

--
-- Name: obligaciones; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.obligaciones (
    id_obligacion integer NOT NULL,
    id_funcionario integer,
    descripcion text
);


ALTER TABLE public.obligaciones OWNER TO admin;

--
-- Name: obligaciones_id_obligacion_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.obligaciones_id_obligacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.obligaciones_id_obligacion_seq OWNER TO admin;

--
-- Name: obligaciones_id_obligacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.obligaciones_id_obligacion_seq OWNED BY public.obligaciones.id_obligacion;


--
-- Name: pages; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.pages (
    id integer NOT NULL,
    author_id integer NOT NULL,
    title character varying(255) NOT NULL,
    excerpt text,
    body text,
    image character varying(255),
    slug character varying(255) NOT NULL,
    meta_description text,
    meta_keywords text,
    status character varying(255) DEFAULT 'INACTIVE'::character varying NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT pages_status_check CHECK (((status)::text = ANY (ARRAY[('ACTIVE'::character varying)::text, ('INACTIVE'::character varying)::text])))
);


ALTER TABLE public.pages OWNER TO admin;

--
-- Name: pages_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.pages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pages_id_seq OWNER TO admin;

--
-- Name: pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.pages_id_seq OWNED BY public.pages.id;


--
-- Name: password_resets; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.password_resets (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_resets OWNER TO admin;

--
-- Name: permission_role; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.permission_role (
    permission_id bigint NOT NULL,
    role_id bigint NOT NULL
);


ALTER TABLE public.permission_role OWNER TO admin;

--
-- Name: permissions; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.permissions (
    id bigint NOT NULL,
    key character varying(255) NOT NULL,
    table_name character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.permissions OWNER TO admin;

--
-- Name: permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permissions_id_seq OWNER TO admin;

--
-- Name: permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.permissions_id_seq OWNED BY public.permissions.id;


--
-- Name: personas_afectadas; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.personas_afectadas (
    id_personas_afectadas integer NOT NULL,
    fecha date,
    hombres integer,
    mujeres integer,
    ninos integer,
    id_emergencia integer
);


ALTER TABLE public.personas_afectadas OWNER TO admin;

--
-- Name: personas_afectadas_id_personas_afectadas_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.personas_afectadas_id_personas_afectadas_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personas_afectadas_id_personas_afectadas_seq OWNER TO admin;

--
-- Name: personas_afectadas_id_personas_afectadas_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.personas_afectadas_id_personas_afectadas_seq OWNED BY public.personas_afectadas.id_personas_afectadas;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.posts (
    id integer NOT NULL,
    author_id integer NOT NULL,
    category_id integer,
    title character varying(255) NOT NULL,
    seo_title character varying(255),
    excerpt text,
    body text NOT NULL,
    image character varying(255),
    slug character varying(255) NOT NULL,
    meta_description text,
    meta_keywords text,
    status character varying(255) DEFAULT 'DRAFT'::character varying NOT NULL,
    featured boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT posts_status_check CHECK (((status)::text = ANY (ARRAY[('PUBLISHED'::character varying)::text, ('DRAFT'::character varying)::text, ('PENDING'::character varying)::text])))
);


ALTER TABLE public.posts OWNER TO admin;

--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posts_id_seq OWNER TO admin;

--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: proyectos; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.proyectos (
    id_proyecto integer NOT NULL,
    nombre_formulador character varying,
    cargo character varying,
    email character varying,
    telefono character varying,
    id_municipio integer,
    nombre_proyecto text,
    fecha date,
    archivo text,
    efectos_indirectos text,
    efectos_directos text,
    problema_central text,
    causa_directa text,
    causa_indirecta text,
    fines_indirectos text,
    fines_directos text,
    medios_directos text,
    medios_indirectos text,
    planteamiento_problema text,
    magnitud_problema text,
    antecedentes text,
    justificacion_politica text,
    justificacion_tecnico_legal text,
    actores_entidades text,
    actores_actividad text,
    actores_tipo_actor text,
    articulacion_actores text,
    objetivo_general text,
    indicador text,
    unidad_medida text,
    cantidad text,
    objetivos_especificos text,
    alternativa_seleccionada text,
    descripcion_alternativa text,
    actividades_cadena_valor text,
    descripcion_actividades text,
    tiempo_ejecucion text,
    observaciones text
);


ALTER TABLE public.proyectos OWNER TO admin;

--
-- Name: proyectos_id_proyecto_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.proyectos_id_proyecto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.proyectos_id_proyecto_seq OWNER TO admin;

--
-- Name: proyectos_id_proyecto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.proyectos_id_proyecto_seq OWNED BY public.proyectos.id_proyecto;


--
-- Name: reportes; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.reportes (
    reporte integer NOT NULL,
    sql text NOT NULL,
    parametros text,
    nombre character varying(120),
    estadistica integer DEFAULT 0,
    landscape integer DEFAULT 0
);


ALTER TABLE public.reportes OWNER TO admin;

--
-- Name: reportes_reporte_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.reportes_reporte_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reportes_reporte_seq OWNER TO admin;

--
-- Name: reportes_reporte_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.reportes_reporte_seq OWNED BY public.reportes.reporte;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    display_name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.roles OWNER TO admin;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO admin;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: seguimientos_maquinaria; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.seguimientos_maquinaria (
    id_seguimientos_maquinaria integer NOT NULL,
    fecha date,
    descripcion text,
    id_maquinaria integer,
    horas integer
);


ALTER TABLE public.seguimientos_maquinaria OWNER TO admin;

--
-- Name: seguimientos_maquinaria_id_seguimientos_maquinaria_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.seguimientos_maquinaria_id_seguimientos_maquinaria_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seguimientos_maquinaria_id_seguimientos_maquinaria_seq OWNER TO admin;

--
-- Name: seguimientos_maquinaria_id_seguimientos_maquinaria_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.seguimientos_maquinaria_id_seguimientos_maquinaria_seq OWNED BY public.seguimientos_maquinaria.id_seguimientos_maquinaria;


--
-- Name: settings; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.settings (
    id integer NOT NULL,
    key character varying(255) NOT NULL,
    display_name character varying(255) NOT NULL,
    value text,
    details text,
    type character varying(255) NOT NULL,
    "order" integer DEFAULT 1 NOT NULL,
    "group" character varying(255)
);


ALTER TABLE public.settings OWNER TO admin;

--
-- Name: settings_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.settings_id_seq OWNER TO admin;

--
-- Name: settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.settings_id_seq OWNED BY public.settings.id;


--
-- Name: site_content; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.site_content (
    id_content integer NOT NULL,
    title text,
    content text,
    image text,
    id_page integer,
    link integer,
    sort integer,
    slider text,
    video text
);


ALTER TABLE public.site_content OWNER TO admin;

--
-- Name: site_content_id_content_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.site_content_id_content_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.site_content_id_content_seq OWNER TO admin;

--
-- Name: site_content_id_content_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.site_content_id_content_seq OWNED BY public.site_content.id_content;


--
-- Name: site_info; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.site_info (
    id_info integer NOT NULL,
    email character varying,
    phone character varying,
    address character varying,
    location character varying,
    twitter character varying,
    facebook character varying,
    linkedin character varying
);


ALTER TABLE public.site_info OWNER TO admin;

--
-- Name: site_info_id_info_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.site_info_id_info_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.site_info_id_info_seq OWNER TO admin;

--
-- Name: site_info_id_info_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.site_info_id_info_seq OWNED BY public.site_info.id_info;


--
-- Name: site_pages; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.site_pages (
    id_page integer NOT NULL,
    title text,
    banner_title text,
    banner_image text,
    banner_text text,
    id_template integer,
    banner_link integer,
    sort integer DEFAULT 0,
    show_menu integer DEFAULT 1
);


ALTER TABLE public.site_pages OWNER TO admin;

--
-- Name: site_pages_id_page_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.site_pages_id_page_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.site_pages_id_page_seq OWNER TO admin;

--
-- Name: site_pages_id_page_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.site_pages_id_page_seq OWNED BY public.site_pages.id_page;


--
-- Name: site_templates; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.site_templates (
    id_template integer NOT NULL,
    template text
);


ALTER TABLE public.site_templates OWNER TO admin;

--
-- Name: site_templates_id_template_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.site_templates_id_template_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.site_templates_id_template_seq OWNER TO admin;

--
-- Name: site_templates_id_template_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.site_templates_id_template_seq OWNED BY public.site_templates.id_template;


--
-- Name: tipos_acta; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.tipos_acta (
    id_tipo_acta integer NOT NULL,
    descripcion character varying
);


ALTER TABLE public.tipos_acta OWNER TO admin;

--
-- Name: tipos_acta_id_tipo_acta_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.tipos_acta_id_tipo_acta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipos_acta_id_tipo_acta_seq OWNER TO admin;

--
-- Name: tipos_acta_id_tipo_acta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.tipos_acta_id_tipo_acta_seq OWNED BY public.tipos_acta.id_tipo_acta;


--
-- Name: tipos_actividad; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.tipos_actividad (
    id_tipo_actividad integer NOT NULL,
    descripcion character varying,
    finaliza integer
);


ALTER TABLE public.tipos_actividad OWNER TO admin;

--
-- Name: tipos_actividad_id_tipo_actividad_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.tipos_actividad_id_tipo_actividad_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipos_actividad_id_tipo_actividad_seq OWNER TO admin;

--
-- Name: tipos_actividad_id_tipo_actividad_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.tipos_actividad_id_tipo_actividad_seq OWNED BY public.tipos_actividad.id_tipo_actividad;


--
-- Name: tipos_ayuda; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.tipos_ayuda (
    id_tipo_ayuda integer NOT NULL,
    descripcion character varying,
    disponible character varying
);


ALTER TABLE public.tipos_ayuda OWNER TO admin;

--
-- Name: tipos_ayuda_id_tipo_ayuda_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.tipos_ayuda_id_tipo_ayuda_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipos_ayuda_id_tipo_ayuda_seq OWNER TO admin;

--
-- Name: tipos_ayuda_id_tipo_ayuda_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.tipos_ayuda_id_tipo_ayuda_seq OWNED BY public.tipos_ayuda.id_tipo_ayuda;


--
-- Name: tipos_emergencia; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.tipos_emergencia (
    id_tipo_emergencia integer NOT NULL,
    descripcion character varying
);


ALTER TABLE public.tipos_emergencia OWNER TO admin;

--
-- Name: tipos_emergencia_id_tipo_emergencia_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.tipos_emergencia_id_tipo_emergencia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipos_emergencia_id_tipo_emergencia_seq OWNER TO admin;

--
-- Name: tipos_emergencia_id_tipo_emergencia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.tipos_emergencia_id_tipo_emergencia_seq OWNED BY public.tipos_emergencia.id_tipo_emergencia;


--
-- Name: translations; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.translations (
    id integer NOT NULL,
    table_name character varying(255) NOT NULL,
    column_name character varying(255) NOT NULL,
    foreign_key integer NOT NULL,
    locale character varying(255) NOT NULL,
    value text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.translations OWNER TO admin;

--
-- Name: translations_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.translations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.translations_id_seq OWNER TO admin;

--
-- Name: translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.translations_id_seq OWNED BY public.translations.id;


--
-- Name: user_roles; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.user_roles (
    user_id bigint NOT NULL,
    role_id bigint NOT NULL
);


ALTER TABLE public.user_roles OWNER TO admin;

--
-- Name: users; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    avatar character varying(255) DEFAULT 'users/default.png'::character varying,
    role_id bigint,
    settings text,
    id_funcionario integer,
    id_municipio integer
);


ALTER TABLE public.users OWNER TO admin;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO admin;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: v_criticidades; Type: VIEW; Schema: public; Owner: admin
--

CREATE VIEW public.v_criticidades AS
 SELECT DISTINCT emergencias.criticidad
   FROM public.emergencias;


ALTER TABLE public.v_criticidades OWNER TO admin;

--
-- Name: v_estados; Type: VIEW; Schema: public; Owner: admin
--

CREATE VIEW public.v_estados AS
 SELECT DISTINCT emergencias.estado
   FROM public.emergencias;


ALTER TABLE public.v_estados OWNER TO admin;

--
-- Name: v_tipos_ayuda; Type: VIEW; Schema: public; Owner: admin
--

CREATE VIEW public.v_tipos_ayuda AS
 SELECT tipos_ayuda.descripcion,
    COALESCE(entrada.total, (0)::bigint) AS entrada,
    COALESCE(salida.total, (0)::bigint) AS salida,
    (COALESCE(entrada.total, (0)::bigint) - COALESCE(salida.total, (0)::bigint)) AS disponible
   FROM ((public.tipos_ayuda
     LEFT JOIN ( SELECT ta.id_tipo_ayuda,
            ta.descripcion AS tipo_ayuda,
            sum(ie.cantidad) AS total
           FROM public.tipos_ayuda ta,
            public.inventario_entrada ie
          WHERE (ta.id_tipo_ayuda = ie.id_tipo_ayuda)
          GROUP BY ta.id_tipo_ayuda, ta.descripcion) entrada ON ((tipos_ayuda.id_tipo_ayuda = entrada.id_tipo_ayuda)))
     LEFT JOIN ( SELECT ta.id_tipo_ayuda,
            ta.descripcion,
            sum(i.cantidad) AS total
           FROM public.tipos_ayuda ta,
            public.detalle_inventario i
          WHERE (ta.id_tipo_ayuda = i.id_tipo_ayuda)
          GROUP BY ta.descripcion, ta.id_tipo_ayuda) salida ON ((tipos_ayuda.id_tipo_ayuda = salida.id_tipo_ayuda)));


ALTER TABLE public.v_tipos_ayuda OWNER TO admin;

--
-- Name: visita_emergencia; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.visita_emergencia (
    id_visita_emergencia integer NOT NULL,
    id_emergencia integer,
    id_visita integer
);


ALTER TABLE public.visita_emergencia OWNER TO admin;

--
-- Name: visita_emergencia_id_visita_emergencia_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.visita_emergencia_id_visita_emergencia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.visita_emergencia_id_visita_emergencia_seq OWNER TO admin;

--
-- Name: visita_emergencia_id_visita_emergencia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.visita_emergencia_id_visita_emergencia_seq OWNED BY public.visita_emergencia.id_visita_emergencia;


--
-- Name: visitas; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.visitas (
    id_visita integer NOT NULL,
    accion character varying,
    fecha date,
    asunto character varying,
    interesado character varying,
    localizacion character varying,
    objeto text,
    desarrollo text,
    concepto text,
    tecnico text,
    recomendaciones text,
    id_municipio integer,
    vereda character varying(200),
    asistentes text
);


ALTER TABLE public.visitas OWNER TO admin;

--
-- Name: visitas_id_visita_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.visitas_id_visita_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.visitas_id_visita_seq OWNER TO admin;

--
-- Name: visitas_id_visita_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.visitas_id_visita_seq OWNED BY public.visitas.id_visita;


--
-- Name: acciones_adelantadas id_accion_adelantada; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.acciones_adelantadas ALTER COLUMN id_accion_adelantada SET DEFAULT nextval('public.acciones_adelantadas_id_accion_adelantada_seq'::regclass);


--
-- Name: actas_reunion id_acta_reunion; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.actas_reunion ALTER COLUMN id_acta_reunion SET DEFAULT nextval('public.actas_reunion_id_acta_reunion_seq'::regclass);


--
-- Name: actividades id_actividad; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.actividades ALTER COLUMN id_actividad SET DEFAULT nextval('public.actividades_id_actividad_seq'::regclass);


--
-- Name: calamidad id_calamidad; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calamidad ALTER COLUMN id_calamidad SET DEFAULT nextval('public.calamidad_id_calamidad_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: data_rows id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.data_rows ALTER COLUMN id SET DEFAULT nextval('public.data_rows_id_seq'::regclass);


--
-- Name: data_types id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.data_types ALTER COLUMN id SET DEFAULT nextval('public.data_types_id_seq'::regclass);


--
-- Name: detalle_inventario id_detalle_inventario; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.detalle_inventario ALTER COLUMN id_detalle_inventario SET DEFAULT nextval('public.detalle_inventario_id_detalle_inventario_seq'::regclass);


--
-- Name: emergencias id_emergencia; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.emergencias ALTER COLUMN id_emergencia SET DEFAULT nextval('public.emergencias_id_emergencia_seq'::regclass);


--
-- Name: entidades id_entidad; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.entidades ALTER COLUMN id_entidad SET DEFAULT nextval('public.entidades_id_entidad_seq'::regclass);


--
-- Name: exports id_export; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.exports ALTER COLUMN id_export SET DEFAULT nextval('public.exports_id_export_seq'::regclass);


--
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- Name: funcionarios id_funcionario; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.funcionarios ALTER COLUMN id_funcionario SET DEFAULT nextval('public.funcionarios_id_funcionario_seq'::regclass);


--
-- Name: informes id_informe; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.informes ALTER COLUMN id_informe SET DEFAULT nextval('public.informes_id_informe_seq'::regclass);


--
-- Name: inventario_entrada id_inventario_entrada; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.inventario_entrada ALTER COLUMN id_inventario_entrada SET DEFAULT nextval('public.inventario_entrada_id_inventario_entrada_seq'::regclass);


--
-- Name: inventario_salida id_inventario_salida; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.inventario_salida ALTER COLUMN id_inventario_salida SET DEFAULT nextval('public.inventario_salida_id_inventario_salida_seq'::regclass);


--
-- Name: inversiones id_inversion; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.inversiones ALTER COLUMN id_inversion SET DEFAULT nextval('public.inversiones_id_inversion_seq'::regclass);


--
-- Name: mantenimientos id_mantenimiento; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.mantenimientos ALTER COLUMN id_mantenimiento SET DEFAULT nextval('public.mantenimientos_id_mantenimiento_seq'::regclass);


--
-- Name: maquinaria id_maquinaria; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.maquinaria ALTER COLUMN id_maquinaria SET DEFAULT nextval('public.maquinaria_id_maquinaria_seq'::regclass);


--
-- Name: medios id_medio; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.medios ALTER COLUMN id_medio SET DEFAULT nextval('public.medios_id_medio_seq'::regclass);


--
-- Name: menu_items id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.menu_items ALTER COLUMN id SET DEFAULT nextval('public.menu_items_id_seq'::regclass);


--
-- Name: menus id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.menus ALTER COLUMN id SET DEFAULT nextval('public.menus_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: obligaciones id_obligacion; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.obligaciones ALTER COLUMN id_obligacion SET DEFAULT nextval('public.obligaciones_id_obligacion_seq'::regclass);


--
-- Name: pages id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.pages ALTER COLUMN id SET DEFAULT nextval('public.pages_id_seq'::regclass);


--
-- Name: permissions id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.permissions ALTER COLUMN id SET DEFAULT nextval('public.permissions_id_seq'::regclass);


--
-- Name: personas_afectadas id_personas_afectadas; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.personas_afectadas ALTER COLUMN id_personas_afectadas SET DEFAULT nextval('public.personas_afectadas_id_personas_afectadas_seq'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: proyectos id_proyecto; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.proyectos ALTER COLUMN id_proyecto SET DEFAULT nextval('public.proyectos_id_proyecto_seq'::regclass);


--
-- Name: reportes reporte; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.reportes ALTER COLUMN reporte SET DEFAULT nextval('public.reportes_reporte_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: seguimientos_maquinaria id_seguimientos_maquinaria; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.seguimientos_maquinaria ALTER COLUMN id_seguimientos_maquinaria SET DEFAULT nextval('public.seguimientos_maquinaria_id_seguimientos_maquinaria_seq'::regclass);


--
-- Name: settings id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.settings ALTER COLUMN id SET DEFAULT nextval('public.settings_id_seq'::regclass);


--
-- Name: site_content id_content; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.site_content ALTER COLUMN id_content SET DEFAULT nextval('public.site_content_id_content_seq'::regclass);


--
-- Name: site_info id_info; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.site_info ALTER COLUMN id_info SET DEFAULT nextval('public.site_info_id_info_seq'::regclass);


--
-- Name: site_pages id_page; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.site_pages ALTER COLUMN id_page SET DEFAULT nextval('public.site_pages_id_page_seq'::regclass);


--
-- Name: site_templates id_template; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.site_templates ALTER COLUMN id_template SET DEFAULT nextval('public.site_templates_id_template_seq'::regclass);


--
-- Name: tipos_acta id_tipo_acta; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.tipos_acta ALTER COLUMN id_tipo_acta SET DEFAULT nextval('public.tipos_acta_id_tipo_acta_seq'::regclass);


--
-- Name: tipos_actividad id_tipo_actividad; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.tipos_actividad ALTER COLUMN id_tipo_actividad SET DEFAULT nextval('public.tipos_actividad_id_tipo_actividad_seq'::regclass);


--
-- Name: tipos_ayuda id_tipo_ayuda; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.tipos_ayuda ALTER COLUMN id_tipo_ayuda SET DEFAULT nextval('public.tipos_ayuda_id_tipo_ayuda_seq'::regclass);


--
-- Name: tipos_emergencia id_tipo_emergencia; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.tipos_emergencia ALTER COLUMN id_tipo_emergencia SET DEFAULT nextval('public.tipos_emergencia_id_tipo_emergencia_seq'::regclass);


--
-- Name: translations id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.translations ALTER COLUMN id SET DEFAULT nextval('public.translations_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: visita_emergencia id_visita_emergencia; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.visita_emergencia ALTER COLUMN id_visita_emergencia SET DEFAULT nextval('public.visita_emergencia_id_visita_emergencia_seq'::regclass);


--
-- Name: visitas id_visita; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.visitas ALTER COLUMN id_visita SET DEFAULT nextval('public.visitas_id_visita_seq'::regclass);


--
-- Data for Name: acciones_adelantadas; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.acciones_adelantadas (id_accion_adelantada, id_tipo_actividad, id_entidad, id_emergencia, personas_involucradas, fecha, hombres, mujeres, ninos) FROM stdin;
1	2	1	2	40	2021-07-13	0	0	0
2	1	1	4	1	\N	0	0	0
3	2	1	4	40	2021-07-13	0	0	0
4	1	1	8	4	2021-07-14	0	0	0
5	2	1	8	2	2021-07-17	0	0	0
6	1	1	13	\N	2021-07-20	10	5	2
7	1	1	19	\N	2021-08-01	2	1	0
8	1	1	19	\N	2021-07-29	10	2	1
\.


--
-- Data for Name: actas_reunion; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.actas_reunion (id_acta_reunion, fecha, lugar, hora_inicio, hora_fin, convoca, objeto, desarrollo, conclusiones, asistentes, id_tipo_acta) FROM stdin;
1	2021-05-20	Gobernacion	12:00	14:04	Andres Perez	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic	g Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now	There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chu	Jose Alvarez\r\nCamilo Rojas\r\nAdrian Romero\r\nPedro Gonzalez	1
2	2021-06-01	\N	19:34	06:39	dfffffffffffffffff	fddddddddddddddddddddd	fddddddddddddddddddd	fddddddddddddddddddddddddddddddd	dfffffffffffffffffffffffff	2
3	2021-07-13	Villavicencio, Edf Gobernacion del Meta	09:27	10:28	wilosn lopez bogota	Reunicon equipo de trabajo	\N	Asigancion  actividades a contratistas	[{"nombre":"CAMILO SERNA","correo":"csernas@meta.gov.co","documento":"","telefono":"","externo":"Si"},{"nombre":"FREDDY MARTINEZ","correo":"","documento":"","telefono":"","externo":"No"}]	1
\.


--
-- Data for Name: actividades; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.actividades (id_actividad, fecha_estimada, fecha_entrega, descripcion, id_funcionario, desarrollo, anexos, cumplida, id_obligacion) FROM stdin;
8	2021-05-25	2021-05-25	PLAN TE TRABAJO GUAYURIBA - ENTRE PUENTES	26	PENDIENTE CONFIRMACION DE INTERVENCION PUNTO	[{"download_link":"actividades\\/May2021\\/zzcP0q8sfKKaGLmtsRbc.docx","original_name":"Plan-de-Trabajo-2021-05-24.docx"}]	0	\N
13	2021-06-01	2021-06-01	Reunion Empresa ISATECH	4	Reunion Empresa ISATECH Conocimiento del software de Fotogrametria y sistemas de informacion cartografica	[{"download_link":"actividades\\/June2021\\/yDviFAoVpOnuzfLIPmer.pdf","original_name":"Brochure_Isatech.pdf"}]	1	\N
12	2021-04-19	2021-05-25	SOLICITUD DE OBRAS DE MITIGACIÓN URGENTES RIO UPIN-RESTREPO META, VEREDA LOS MEDIOS SECTOR ISLA PARAISO	6	SE DIO RESPUESTA AL D.P DE FECHA 19 DE ABRIL DE 2021 MEDIANTE UNA VISITA TECNICA DE RECONOCIMIENTO, INSPECCION Y VERFICACION DEL SECTOR AFECTADO POR LA OLA INVERNAL EN ISLA PARAISO VEREDA LOS MEDIOS DEL MUNICIPIO RESTREPO-META, LA CUAL SERA REALIZADA POR EL INGENIERIO ALEXIS ADRIAN RAMIREZ.	[{"download_link":"actividades\\/May2021\\/KOD4dCeFHhzoEZSpbcqK.pdf","original_name":"Respuesta D.P 365 Vereda los medios-restrepo..pdf"}]	0	135
15	2021-06-22	2021-06-22	Acompañamiento a Asamblea Departamental	4	Reunion acompañamiento a Asamblea Dptal del Meta al director	[]	1	\N
16	\N	\N	\N	1	\N	[]	0	\N
3	2021-07-01	\N	actividad de entrega	2	\N	[]	0	\N
1	2021-07-01	\N	prueba de actividad	1	\N	[]	0	\N
18	2021-07-01	2021-07-01	Asistencia en representacion e DIGERD  a la mesa de concertacion de la politica publica de internacionalizacion	4	se asiste en representacion e DIGERD  a la mesa de concertacion de la politica publica de internacionalizacion , donde se realizan actividades para conocer sobre sobre la formulacion de ideas sobre la importancia de desarrollar una politica publica de internacionalizacion para el departamento del meta	[]	1	143
19	2021-06-30	2021-06-30	Apoyo a la coneccion de la reunion con  LA UNGRD para la evaluacion de proyectos de reduccion de riesgos	4	Apoyo a la coneccion de la reunion con  LA UNGRD para la evaluacion de proyectos de reduccion de riesgos, se presta ayuda de conectividad, equipo de computo y gestion de la reun ion virtual	[]	1	144
20	2021-06-28	2021-06-28	Entrega  de kit s alimenticios a poblacion	4	Entrega  de kit s alimenticios a poblacion  vulnerable	[]	1	147
21	2021-06-22	2021-06-22	Se apoya  ala supervision del contrato de software para el analisis del estado axctual del software	4	Se apoya  ala supervision del contrato de software para el analisis del estado axctual del software, donde se agregan mejoras y funcionalidades al software para su ejecucion y puesta en marcha	[]	1	149
22	2021-06-07	2021-06-16	Se apoya al proyecto de SAT, para su formulacion, se solicitan cotizaciones a proveedores,	4	Se apoya al proyecto de SAT, para su formulacion, se solicitan cotizaciones a proveedores, de movilizaxion y solicitud de equipos de radiocomunicaciones	[]	1	148
14	2021-06-23	2021-06-16	TRASLADO DERECHO D EPETICION POR LA UNIDAD NACIONAL DE VEEDURIA RIO GUAYURIBA	2	\N	[{"download_link":"actividades\\/June2021\\/hycyUoKyLfVEi4ZsIszj.pdf","original_name":"Trasaldo Veeduri\\u0301a.pdf"},{"download_link":"actividades\\/June2021\\/4BdqfaynpyTUxCazjqEk.pdf","original_name":"RESPUESTA-VEEDURIA AMBIENTAL-HERNAN FAJARDO.pdf"},{"download_link":"actividades\\/June2021\\/34P0onvntPJ9c63rwm5X.pdf","original_name":"TRASLADO PLANEACION DEPARTAMENTAL-ANTICORRUPCION.pdf"}]	1	172
23	2021-07-14	2021-07-22	CAPACITACION MUNICPIOS DE GRANADA Y GUAMAL EN FONDOS MUNICIPALES PARA LA GESTION DEL RIESGO	19	\N	[]	0	173
25	2021-08-06	2021-08-06	ACOMPAÑAMIENTO  Y GESTION TECNOLOGICA DE CONSEJO DPTAL DE GESTION DEL RIESGO	4	se apoya en el motaje de la resunion de consejo dptal de gestion del riesgo	[{"download_link":"actividades\\/August2021\\/dipMMS9n5eRUM5n8698Z.jpeg","original_name":"WhatsApp Image 2021-08-17 at 08.31.45.jpeg"}]	1	143
26	2021-08-06	2021-08-06	ACOMPAÑAMIENTO  Y GESTION TECNOLOGICA DE CONSEJO DPTAL DE GESTION DEL RIESGO	4	se apoya en el motaje de la resunion de consejo dptal de gestion del riesgo	[{"download_link":"actividades\\/August2021\\/YZt6RRjFlNCrsKXP0hDu.jpeg","original_name":"WhatsApp Image 2021-08-17 at 08.31.45.jpeg"}]	1	143
27	2021-08-06	2021-08-06	ACOMPAÑAMIENTO  Y GESTION TECNOLOGICA DE CONSEJO DPTAL DE GESTION DEL RIESGO	4	se apoya en el motaje de la resunion de consejo dptal de gestion del riesgo	[{"download_link":"actividades\\/August2021\\/Rm3pRzVImpryBGIhS9BU.jpeg","original_name":"WhatsApp Image 2021-08-17 at 08.31.45.jpeg"}]	1	143
4	2021-05-25	2021-08-17	ASIGNACION HECTOR HERRERA	26	CONFIRMACION DE TRASLADO	[{"download_link":"actividades\\/May2021\\/LdMMRZtsAAFUpNULEKfD.pdf","original_name":"4. HECTOR_HERRERA-PLAN_DE_OBRAS_MINERAS_RIO_GUAYURIBA.pdf"}]	0	260
24	2021-07-14	2021-07-22	DICTAR CAPACITACION FONDOS TERRITORIALES DE GESTION DEL RIESGO A LOS MUNICIPIOS DE GRANADA Y GUAMAL	17	\N	[]	0	170
9	2021-05-26	2021-05-28	PUNTO CRITICO MI LLANITO GUATIQUIA	26	VISITA REALIZADA	[]	0	251
29	2021-07-28	2021-07-28	\N	17	\N	[]	0	97
30	2021-07-28	2021-07-28	solicitud de atención zona e riesgo para la via ruta 6505 cruce puerto rico YE de Granada-Meta	17	se proyecto respuesta al derecho de petición al presidente del concejo municipal ELKIN ADREI ORTIZ de puerto lleras - meta con  numero de radicado No 537 de fecha 28 de julio de 2021	[]	0	97
10	2021-05-27	2021-08-17	ASIGNACION GUAMAL - TRASLADO UNGR	26	RESPUESTA	\N	0	260
7	2021-05-28	2021-08-17	FORMATO DE INFORMACION URIBE	26	Formato enviado	[]	0	260
6	2021-05-26	2021-05-27	CUADRO CON PLAN DE INTERVENCION 5000 H MAQUINA - UNGR	26	Terminado y en ejecución Horas maquina	[{"download_link":"actividades\\/August2021\\/Vp8QhJTJvGf3HRSY5u2q.xlsx","original_name":"FASE I. Acumulado-Solicitud-Horas-Maquina-a-SGR-2021-16-06.xlsx"}]	0	255
5	2021-05-28	2021-05-31	ASIGNACION CORMACARENA	26	INFORMACIÓN RECIBIDA - RIO GUAYURIBA	[{"download_link":"actividades\\/August2021\\/5sZnqT6pd5LjLap9ISXX.pdf","original_name":"C.T. 3.44.20.2008 - Exp. 3.98.016.010 (1).pdf"}]	0	260
31	2021-07-28	2021-07-28	solicitud de atención zona e riesgo para la via ruta 6505 cruce puerto rico YE de Granada-Meta	17	\N	[]	0	95
32	2021-04-15	2021-04-22	Asignación de correspondencia, Asunto: Remisión comunicación relacionada con el sector de la Cuncia del rio Ocoa y suelo de protección municipio de Villavicencio, radicado UNGRD 2021ER02338 PETICIONARIO CARLOS JULIO CRISTANCHO PINTO	6	SE REALIZO TRASLADO POR COMPETENCIA DEL DERECHO DE PETICIÓN CON SOLICITUD DEL SEÑOR CARLOS JULIO CRISTANCHO PINTO SOBRE REMISIÓN COMUNICACIÓN RELACIONADA CON EL SECTOR DE LA CUNCIA DEL RIO OCOA Y SUELO DE PROTECCIÓN MUNICIPIO DE VILLAVICENCIO, RADICADO UNGRD 2021ER02338- DE FECHA 25 DE MARZO DE 2021 Y  RESPUESTA A LINA DORADO GONZÁLEZ SUBDIRECTORA PARA EL CONOCIMIENTO DEL RIESGO	[{"download_link":"actividades\\/August2021\\/LWuOBqDEDBRMF1oq16ri.pdf","original_name":"Respuesta_D.P_Rio_Ocoa.pdf"},{"download_link":"actividades\\/August2021\\/BzVlR3fXSjGoSZQk87Np.pdf","original_name":"Traslado_D.P_rio_Ocoa.pdf"}]	0	135
2	2021-06-19	\N	Informe de supervision	1	\N	[]	0	263
33	2021-04-15	2021-04-22	Asignación de correspondencia, Asunto: Remisión comunicación relacionada con el sector de la Cuncia del rio Ocoa y suelo de protección municipio de Villavicencio, radicado UNGRD 2021ER02338 PETICIONARIO CARLOS JULIO CRISTANCHO PINTO	6	SE REALIZO TRASLADO POR COMPETENCIA DEL DERECHO DE PETICIÓN CON SOLICITUD DEL SEÑOR CARLOS JULIO CRISTANCHO PINTO SOBRE REMISIÓN COMUNICACIÓN RELACIONADA CON EL SECTOR DE LA CUNCIA DEL RIO OCOA Y SUELO DE PROTECCIÓN MUNICIPIO DE VILLAVICENCIO, RADICADO UNGRD 2021ER02338- DE FECHA 25 DE MARZO DE 2021 Y  RESPUESTA A LINA DORADO GONZÁLEZ SUBDIRECTORA PARA EL CONOCIMIENTO DEL RIESGO	[{"download_link":"actividades\\/August2021\\/G1xjonc52dsf5uBgesYU.pdf","original_name":"Respuesta_D.P_Rio_Ocoa.pdf"},{"download_link":"actividades\\/August2021\\/JLwAAK9kyrSXHzqFauKk.pdf","original_name":"Traslado_D.P_rio_Ocoa.pdf"}]	0	135
34	2021-08-06	2021-08-06	ACOMPAÑAMIENTO  Y GESTION TECNOLOGICA DE CONSEJO DPTAL DE GESTION DEL RIESGO	4	se apoya en el motaje de la resunion de consejo dptal de gestion del riesgo	[{"download_link":"actividades\\/August2021\\/H6YrrxpFMiTSjpQ8trhb.jpeg","original_name":"WhatsApp Image 2021-08-17 at 08.31.45.jpeg"}]	1	144
28	\N	2021-08-13	\N	4	se apoya en el motaje de la resunion de consejo dptal de gestion del riesgo	[{"download_link":"actividades\\/August2021\\/spRFkUOLs585OItCK1ME.jpeg","original_name":"WhatsApp Image 2021-08-25 at 07.55.22 (4).jpeg"}]	0	143
35	2021-08-10	2021-08-19	SE APOYA EN LA SUPERVISION Y EL ANALISIS DEL SOFTWARE SOS	4	SE APOYA EN LA SUPERVISION Y EL ANALISIS DEL SOFTWARE SOS	[]	1	149
36	2021-08-14	2021-08-26	SE APOPYA EN LA LIGISTICA DEL PUNTO DE DONACION PUESTO PARA LA COMUNIDAD	4	SE APOPYA EN LA LIGISTICA DEL PUNTO DE DONACION PUESTO PARA LA COMUNIDAD	[{"download_link":"actividades\\/August2021\\/6aAuwyh2B3odtiF1Nc6Y.jpeg","original_name":"WhatsApp Image 2021-08-25 at 07.55.22 (1).jpeg"}]	1	147
37	2021-08-20	2021-08-18	SE APOYA EN LA GESTION DEL PROYECTO MGA PARA LA CRUZ ROJA	4	SE APOYA EN LA GESTION DEL PROYECTO MGA PARA LA CRUZ ROJA	[{"download_link":"actividades\\/August2021\\/J4ouI5SSJaH6kmoui2Lt.docx","original_name":"4_F-PE-22 reclutamiento Informaci\\u00f3n.docx"}]	1	149
38	2021-08-02	2021-09-01	SE APOYA EN LOS REQUERIMIENTOS PARA EL BUEN FUNCIONAMIENTO DE LAS REUNIONES YA CTIVIDADES TECNOLOGICAS ASIGNADAS POR EL SUPERVISIOR	4	SE APOYA EN LOS REQUERIMIENTOS PARA EL BUEN FUNCIONAMIENTO DE LAS REUNIONES YA CTIVIDADES TECNOLOGICAS ASIGNADAS POR EL SUPERVISIOR	[]	1	148
39	2021-08-05	2021-08-24	SE APOYA EN LA GESTION DEL PROYECTO DE ALERTAS TEMPRANAS SAT	4	SE APOYA EN LA GESTION DEL PROYECTO DE ALERTAS TEMPRANAS SAT SE CONSOLIDA LA FORMULACION, PUESTA EN MARCHA Y ESTUDIOS DE MERCADO	[{"download_link":"actividades\\/August2021\\/X3I8ZLcyuwk0dxZF9igy.xlsx","original_name":"Costos - Alertas Tempranas - CORREGIDO - 24 de agosto.xlsx"}]	1	145
40	2021-08-16	2021-08-26	APOYO EN LA GESTION DEL PROYECTO DE ESCENARIOS DE RIESGO	4	APOYO EN LA GESTION DEL PROYECTO DE ESCENARIOS DE RIESGO, DESARROLLANDO EL ESTUDIO PARA EL PERSONAL A CONTRATAR Y EJECUCION DEL PROYECTO	[{"download_link":"actividades\\/August2021\\/Ngd33svgrnAJRcSpvAs7.xlsx","original_name":"COSTOS ESCENARIOS DE RIESGOS.xlsx"}]	1	149
41	2021-08-11	2021-08-26	APOYO LOGISTICO EN LA ENTREGA DE AYUDAS HUMANITARIAS	4	APOYO LOGISTICO EN LA ENTREGA DE AYUDAS HUMANITARIAS EN LA VEREDA JUAN BOSCO AZOTADA POR AL OLA INVERNAL	[{"download_link":"actividades\\/August2021\\/6Zz0Bb193XsVOkLmtVOu.jpeg","original_name":"WhatsApp Image 2021-08-25 at 08.02.57.jpeg"}]	1	147
42	\N	\N	\N	17	Se proyectó respuesta al derecho de  petición “Solicitud de atención zona de riesgo para la vía 6508 cruce Puerto Rico –YE de Granada,  presentado por el señor ELKIN ORTIZ presidente del Concejo Municipal de Puerto Lleras – mediante radicado número 107000-CE-538.DIGER	[]	0	97
43	\N	\N	\N	17	Se proyectó respuesta al derecho de  petición “Solicitud de atención zona de riesgo para la vía 6508 cruce Puerto Rico –YE de Granada,  presentado por el señor ELKIN ORTIZ presidente del Concejo Municipal de Puerto Lleras – mediante radicado número 107000-CE-538.DIGER	[]	0	97
44	\N	\N	\N	17	Se proyectó respuesta al derecho de  petición “Solicitud de atención zona de riesgo para la vía 6508 cruce Puerto Rico –YE de Granada,  presentado por el señor ELKIN ORTIZ presidente del Concejo Municipal de Puerto Lleras – mediante radicado número 107000-CE-538.DIGER	[]	0	97
46	\N	\N	\N	17	Se proyectó respuesta al derecho de  petición “Solicitud de atención zona de riesgo para la vía 6508 cruce Puerto Rico –YE de Granada,  presentado por el señor ELKIN ORTIZ presidente del Concejo Municipal de Puerto Lleras – mediante radicado número 107000-CE-538.DIGER	[]	0	97
47	\N	\N	\N	17	Se proyectó respuesta al derecho de  petición “Solicitud de atención zona de riesgo para la vía 6508 cruce Puerto Rico –YE de Granada,  presentado por el señor ELKIN ORTIZ presidente del Concejo Municipal de Puerto Lleras – mediante radicado número 107000-CE-538.DIGER	[]	0	97
48	\N	\N	\N	17	Se proyectó respuesta al derecho de  petición “Solicitud de atención zona de riesgo para la vía 6508 cruce Puerto Rico –YE de Granada,  presentado por el señor ELKIN ORTIZ presidente del Concejo Municipal de Puerto Lleras – mediante radicado número 107000-CE-538.DIGER	[]	0	97
49	\N	2021-07-28	\N	17	Se dio traslado al derecho de petición “Solicitud de atención zona de riesgo para la vía 6508 cruce Puerto Rico –YE de Granada” para su conocimiento y fines pertinentes, al Director de Invias territorial del Meta.	[]	0	97
52	\N	2021-08-26	\N	17	Se proyectó respuesta al derecho de  petición” “Notificación por riesgo deslizamiento de tierra colonia agrícola finca loma vereda dan pablo del  municipio de Acacias” presentado por el señor FABIO QUINTERO BONILLA– mediante radicado número 107000-CE-634-	[]	0	97
53	\N	2021-08-26	\N	17	Se dio traslado al derecho de petición “Notificación por riesgo deslizamiento de tierra colonia agrícola finca loma vereda dan pablo del  municipio de acacias” para su conocimiento y fines pertinentes a la secretaria de Gobierno del municipio de Acacias- mediante radicado número 107000-CE-633.	[]	0	97
51	\N	2021-07-28	\N	17	Se dio traslado al derecho de petición “Arreglo vía mediante la construcción de una placa huella que de la vereda caney medio conduce a la vereda San Juaquin del municipio de Cumaral” para su conocimiento y fines pertinentes al gerente del AIM JUAN AOLONSO LATORRE y solitud de información.	[{"download_link":"actividades\\/August2021\\/S2eJSedQmfE0LpW4FDV0.pdf","original_name":"D.P 539 JUAN ALONSO LATORRE GERENTE A.I.M.pdf"}]	0	97
45	\N	\N	\N	17	Se proyectó respuesta al derecho de  petición “Solicitud de atención zona de riesgo para la vía 6508 cruce Puerto Rico –YE de Granada,  presentado por el señor ELKIN ORTIZ presidente del Concejo Municipal de Puerto Lleras – mediante radicado número 107000-CE-538.DIGER	[{"download_link":"actividades\\/August2021\\/4Eh7xFdUi185bbDESD9R.pdf","original_name":"D.P RADICADO 538 ELKIN ORTIZ PRESIDENTE CONCEJO MUNICIPAL PUERTO LLERAS.pdf"}]	0	97
50	\N	2021-07-28	\N	17	Se proyectó respuesta al derecho de  petición” Arreglo vía mediante la construcción de una placa huella que de la vereda caney medio conduce a la vereda San Juaquin del municipio de Cumaral” presentado por la secretaria de Infraestructura de Cumaral – mediante radicado número 107000-CE-540	[{"download_link":"actividades\\/August2021\\/3LLkUSMzQVEnTRfKYhgy.pdf","original_name":"D.P 540 MONICA JOHANA GOMEZ SECRETRARIA INFRAESTRUCTURA CUMARAL.pdf"}]	0	97
54	\N	\N	\N	17	participe en la reunión que se programó el día 02 de agosto del 2021 con los organismos de socorro con el fin de informarlos de la nueva implantación del sowar, actualización del plan de departamental	[]	0	94
55	\N	\N	\N	17	Se revisó el contrato No 0985 DEL 2021 cuyo objeto: “Suministro de kits alimentarios para atender a la población afectada o damnificada por los desastres   con ocasión de la temporada invernal en el departamento del Meta.	[]	0	168
57	\N	\N	\N	17	Participó en el apoyo de donaton que realizo  entre 19 de agosto al 26 de agosto para ayudar a los damnificados de la ola invernal que atraviesa  el departamento del Meta.	[]	0	265
58	2021-08-27	2021-08-27	ACOMPAÑAMIENTO A CAPACITACION	4	SE REALIZA ACOMPAÑAMIENTO A LA CAPACITACION DE PERSONAL NUEVO PARA EL SOFTWARE SOS	[]	1	148
59	2021-08-28	\N	Capacitacion en uso de software	1	Se realiza capacitacion en el uso del software	[{"download_link":"actividades\\/August2021\\/uR2wm922eZ93XAKpu1IC.pdf","original_name":"CumplimientoT\\u00e9cnico.pdf"}]	0	268
60	2021-08-27	2021-08-27	ACOMPAÑAMIENTO  Y GESTION TECNOLOGICA DE CONSEJO DPTAL DE GESTION DEL RIESGO	4	se apoya en el motaje de la resunion de consejo dptal de gestion del riesgo	[{"download_link":"actividades\\/August2021\\/yLSXLGXKcHvVvj0KjLYj.pptx","original_name":"Plantilla mesas de participaci\\u00f3n SGR-CRUZ ROJA META.pptx"}]	1	144
61	2021-06-26	2021-08-31	REALIZACION DE ESTUDIOS DE MERCADO ACCIONES PARA PREVENIR Y CONTROLAR LA OCURRENCIA DE INCENDIOS FORESTALES	12	REALIZACION DE ESTUDIOS DE MERCADO ACCIONES PARA PREVENIR Y CONTROLAR LA OCURRENCIA DE INCENDIOS FORESTALES	[]	1	232
62	2021-07-24	2021-07-31	REALIZACION DE ESTUDIOS DE MERCADO ACCIONES PARA PREVENIR Y CONTROLAR LA OCURRENCIA DE INCENDIOS FORESTALES	12	REALIZACION DE ESTUDIOS DE MERCADO ACCIONES PARA PREVENIR Y CONTROLAR LA OCURRENCIA DE INCENDIOS FORESTALES	[]	1	230
63	2021-08-24	2021-08-24	APOYAR LOGISITCAMENTE A LA ENTREGA DE AYUDAS HUMANIGTARIAS	12	APOYAR LOGISITCAMENTE A LA ENTREGA DE AYUDAS HUMANIGTARIAS	[{"download_link":"actividades\\/August2021\\/Lqx6kDHAJrKdr91ars7O.jpeg","original_name":"WhatsApp Image 2021-08-25 at 07.55.22.jpeg"}]	1	128
64	2021-08-25	2021-08-25	ACTIVIDAD REUNION GERENCIAL DE ACTIVIDADES	12	ACTIVIDAD REUNION GERENCIAL DE ACTIVIDADES	[{"download_link":"actividades\\/August2021\\/a1bupTB9SrJpJ1uHJYEX.jpeg","original_name":"WhatsApp Image 2021-08-29 at 21.47.26.jpeg"}]	1	228
65	2021-08-02	2021-09-01	REALIZACION DE ESTUDIO DE MERCADO EN GENERAL	12	REALIZACION DE ESTUDIO DE MERCADO EN GENERAL APOYANDO A LA ENTIDAD	[{"download_link":"actividades\\/August2021\\/X3ZEuEpzn1HJyBSLyB0o.xlsx","original_name":"ESTUDIO DE MERCADO ENTIDADES DE SOCORRO ULTIMA.xlsx"}]	1	129
66	2021-08-02	2021-09-01	se obra de buena fe	12	se obra de buena fe ante las actividades desarrolladas	[{"download_link":"actividades\\/August2021\\/CI1qeJGSnJfgPIYFAV2h.jpeg","original_name":"WhatsApp Image 2021-08-29 at 21.47.26 (2).jpeg"}]	1	130
56	\N	\N	\N	17	Participó en la capacitación dada por Unidad Nacional de Gestión del Riesgo de Desastre el día 09 de agosto de 2021, que se llevó a cabo de manera virtual sobre los siguientes temas normatividad del sistema nacional de gestión del riesgo del riesgo de desastre – primera sesión Módulo de Refuerzo Departamento Meta Proyecto de Asistencia Técnica.   Participó en la capacitación dada por Unidad Nacional de Gestión del Riesgo de Desastre el día 10 de agosto de 2021, que se llevó a cabo de manera virtual sobre los siguientes temas normatividad del sistema nacional de gestión del riesgo del riesgo de desastre- segunda sesión Modulo de Refuerzo Departamento Meta Proyecto de Asistencia Técnica.   Participó en la capacitación dada por Unidad Nacional de Gestión del Riesgo de Desastre el día 19 de agosto de 2021, que se llevó a cabo de manera virtual sobre los siguientes temas normatividad del sistema nacional de gestión del riesgo del riesgo de desastre-Lección 1 Coordinación y Planificación la ERE un instrumento para la Gestión del Riesgo de Desastres- Actualización de la Estrategia para la Respuesta a Emergencias.      Participó en la capacitación dada por Unidad Nacional de Gestión del Riesgo de Desastre el día 19 de agosto de 2021, que se llevó a cabo de manera virtual sobre los siguientes temas- Preparativos para la Respuesta Departamento del Meta y Villavicencio Proyecto Asistencia Técnica	[]	1	169
67	2021-07-19	2021-08-04	RESPUESTA MEDIANTE OFICIO No. 107000-CE-578-DIGERD- DE FECHA 04 DE AGOSTO DE 2021- RESPUESTA AL SEÑOR JUAN PABLO SANTAMARIA COLONIA- DE LA SOLICITUD SOBRE PODA Y DESCOPETE DE ARBOLES - UBICADO EN EL MUNICIPIO DE ACACIAS	19	\N	[{"download_link":"actividades\\/August2021\\/zPVi1hnmiDQPf4eMUzi6.pdf","original_name":"RESPUESTA-JUAN PABLO SANTAMARIA-ACACIAS.pdf"}]	0	269
68	2021-07-19	2021-08-04	RESPUESTA MEDIANTE OFICIO No. 107000-CE-578-DIGERD- DE FECHA 04 DE AGOSTO DE 2021- RESPUESTA AL SEÑOR JUAN PABLO SANTAMARIA COLONIA- DE LA SOLICITUD SOBRE PODA Y DESCOPETE DE ARBOLES - UBICADO EN EL MUNICIPIO DE ACACIAS	19	\N	[{"download_link":"actividades\\/August2021\\/Hv9j61MchXw2bTIiXfcK.pdf","original_name":"RESPUESTA-JUAN PABLO SANTAMARIA-ACACIAS.pdf"}]	0	173
69	2021-07-19	2021-08-04	RESPUESTA MEDIANTE OFICIO No. 107000-CE-578-DIGERD- DE FECHA 04 DE AGOSTO DE 2021- RESPUESTA AL SEÑOR JUAN PABLO SANTAMARIA COLONIA- DE LA SOLICITUD SOBRE PODA Y DESCOPETE DE ARBOLES - UBICADO EN EL MUNICIPIO DE ACACIAS	19	\N	\N	0	173
70	2021-06-22	2021-08-04	RESPUESTA DEL OFICIO NO.107000-CE-575-DIGERD- DIRIGIDIO A LA DOCTORA MARTHA ISABEL SERRANO GARCIA-SECRETARIA DE VIVIENDA DE LA GOBERNACION DEL META, SOLICITUD DELA SITUACION QUE ESTA PADECIENDO 250 FAMILIAS UBICADAS EN PUERTO LIMON EN EL MUNICIPIO DE FUENTE DE ORO	19	\N	[{"download_link":"actividades\\/August2021\\/siKKzx8i19cesTcPmBpr.pdf","original_name":"TRASLADO-SEC.VIVIENDA-MARTA SERRANO-PUERTO LIMON.pdf"}]	0	269
71	2021-07-21	2021-08-17	respuesta mediante oficio No. 107000-CE-614-DIGERRD- DE FECHA AGOSTO 17 DE 2021- A LOS SEÑORES JULIA ISABEL RODRIGUEZ RAMOS Y RAUL ARMANDO RODRIGUEZ RAMOS- DE LA SOLICTUD DE AYUDA DE OBRAS POR EL DESBORDAMIENTO DEL RIO GUAYURIBA.	19	\N	[{"download_link":"actividades\\/August2021\\/uajczH5iPdVn1A1pD0sa.pdf","original_name":"RESPUESTA-RAUL A. RODRIGUEZ-ISLA-CONCEPCION-VILLAVICENCIO.pdf"}]	0	269
72	2021-08-04	2021-08-24	TRASLADO MEDIANTE OFICIO NO. 107000-CE-628-DIGERD- DE FECHA AGOSTO 24 DE 2021- AL DOCTOR MIGUEL GIOVANNY BELTRAN KNOR- SECREATARIO DE SALUD DEL DERECHO DE PETICION DE LA SEÑORA RUBY ALBA CASTAÑO-DEFENSORA DE DERECHOS HUMANOS- SITUACION QUE ESTA PADECIENDO 250 FAMILIAS UBICADAS EN PUERTO LIMON DEL MUNICIPIO DE FUENTE DE OROUD DEL DEPARTAMENTO DEL META-DE LA SOLICITUD-	19	\N	[{"download_link":"actividades\\/August2021\\/hW8Ze8YK8Do32Qrqdg2C.pdf","original_name":"TRASLADO-SEC.SALUD-GIOVANNY KNOR-PUERTO LIMON.pdf"}]	0	269
73	2021-09-06	2021-09-06	se asiste a la reunion para el comite de rirsgos para el torneo del joropo	4	se asiste a la reunion para el comite de rirsgos para el torneo del joropo	[{"download_link":"actividades\\/September2021\\/Zv6VUcigenoRTN5CmlGB.pdf","original_name":"asigancion 06-09-2021.pdf"}]	1	143
74	2021-08-04	2021-08-04	se llevo acabo bajo la modalidad virtual en el 8:00 am a 12 a.m., la asistencia tecnica dirigida por la Unidad Nacional para la Gestion del Riesgo de Desastres (UNDRD) y los temas son los siguientes:  - Formulación y/o actualización de planes territoriales de gestion del riesgo de desastres  - Presentación del procedimiento para la descripción del territorio y su entorno.  - Fortalecimientos de los fondos de la Gestion del Riesgo de Desastres.	19	se continuo el siguiente dia 5 de agosto de 2021 - asistencia virtual por parte de la UNDRD	[]	0	177
75	2021-08-05	2021-08-05	5 de agosto de 2021, se llevo acabo bajo la modalidad virtual en el 8:00 am a 12 a.m., la asistencia tecnica dirigida por la Unidad Nacional para la Gestion del Riesgo de Desastres (UNDRD) y los temas son los siguientes:- Escenarios de Riesgo de desastres por cambio climático y variabilidad climática.  - Caracterización de los escenarios de riesgos mediante la identificación de los antecedentes históricos, caracterización de la amenaza, vulnerabilidad, riesgo  y medidas de intervención.  - procedimiento para la armonización de instrumentos de planificación y desarrollo.	19	\N	[{"download_link":"actividades\\/September2021\\/S6k6E22Cdl1a9d2jP0Hj.pdf","original_name":"FOTO.pdf"}]	0	177
76	2021-08-09	\N	Para el dia 9 y 10 de agosto de 2021, en el horario de 9:00 Am a 12:00 pm, se me asigno la asistencia tecnica, dirigida por la UNIDAD NACIONAL PARA LA GESTION DEL RIESGO DE DESASTRES (UNGRD), temas relacionados son los siguientes:  - Primera sección de modulo de refuerzo en el Departamento del Meta. - Segundo Sección de Modulo de refuerzo del Departamento del Meta:  a.\tFORMULACION DE PROYECTOS DE INVERSION)  b.\tGESTION DE REDUCCION DEL RIESGO     c: PROYECTOS DE INTERVENCION CORRECTIVAS ANTE EL FONDO NACIONAL DE     GESTION DEL RIESGP DE DESASTRES.	19	- Primera sección de modulo de refuerzo en el Departamento del Meta. - Segundo Sección de Modulo de refuerzo del Departamento del Meta: en las fechas 9 y 10 agosto de desarrollo esta asistencia virtual.	[{"download_link":"actividades\\/September2021\\/l1xiKoPSmon9kAC4JZEB.pdf","original_name":"fot.pdf"}]	0	177
77	2021-08-11	\N	Para el dia miércoles 11 de agosto de 2021 del horario 8:00 am a 10:00 am, asistencia tecnica virtual se realizo por parte de la UNGRD, el tema sobre la incorporación de la Gestion del Riesgo de Desastres en instrumentos de planificación del Departamento del Meta.	19	\N	[{"download_link":"actividades\\/September2021\\/OBEi4iJlnafIPafN2lLN.pdf","original_name":"foto 3.pdf"}]	0	177
78	2021-08-11	\N	Para el dia miércoles 11 de agosto de 2021 del horario 8:00 am a 10:00 am, asistencia tecnica virtual se realizo por parte de la UNGRD, el tema sobre la incorporación de la Gestion del Riesgo de Desastres en instrumentos de planificación del Departamento del Meta.	19	\N	[{"download_link":"actividades\\/September2021\\/4n9vLl1aDjd4ilTfb25H.pdf","original_name":"foto 3.pdf"}]	0	173
79	2021-08-25	\N	Para el día 25 de agosto y el 3 de septiembre del 2021, se me asigno por parte del Director Departamental de Gestion de Riesgo de Desastres para la colaboración de recibir donaciones (DONATON) para las familias mas afectadas por la temporada de lluvias , de las secretarias de Educación, Casa de Cultura, Unidad de Licores del Meta y Derechos Humanos y Paz de la Gobernación del Meta. E igual manera para el dia 3 de septiembre designada para la distribución y selección de las donaciones en las instalaciones de la Bodega de la DIGERD, ubicadas diagonal a la Defensa Civil del Meta.	19	\N	[{"download_link":"actividades\\/September2021\\/0Zqdm30tv7VCjAybwTKR.pdf","original_name":"foto 4.pdf"}]	0	177
80	2021-09-16	2021-09-30	Asistir semanalmente a  mesa SAR ,de seguimiento a riesgos por Covid.	21	Asistí a mesa SAR de fecha 13/09/2021.	[{"download_link":"actividades\\/September2021\\/MGw4FwaO2aFMhau3HxCt.pdf","original_name":"Asistencia 13 septiembre.pdf"}]	0	6
81	2021-08-19	2021-09-18	Coordinar actividad de recolección y entrega de productos recolectados en DONATON PRO DAMNIFICADOS POR TEMPORADA DE LLUVIAS EN EL DEPARTAMENTO	21	Se coordinó y realizó actividad de recolección,empaque y organización de  kits alimentarios donados.	[{"download_link":"actividades\\/September2021\\/CJGzfDdxSnkBHlqW9nn1.JPG","original_name":"AF871ADB-61CB-4373-8CF6-D333FDBD981E.JPG"},{"download_link":"actividades\\/September2021\\/yjWlcXykuHoDKPcRYpuF.jpg","original_name":"PHOTO-2021-08-21-10-07-37.jpg"},{"download_link":"actividades\\/September2021\\/6VkyAvKAyCwo2pNkvdbF.jpg","original_name":"PHOTO-2021-08-25-12-26-25.jpg"}]	0	312
82	2021-09-16	2021-11-05	Cumplir funciones como supervisora designada de contrato 0985 de 2021	21	El contrato se encuentra en ejecución (su fecha de finalización es Julio 5 de 2021.	[{"download_link":"actividades\\/September2021\\/w6mZ5JqLnBc6vbKJQcZk.pdf","original_name":"RESOLUCION Y DESIGNACION NOMBRAMIENTO SUPERVISOR-JUNIO 23 Y 24 DE 2021.pdf"}]	0	315
83	2021-09-16	2022-04-18	Realizar función de supervisora designada para la ejecución del contrato 1484 de 2021.	21	El contrato se encuentra en ejecución (su fecha de finalización es Diciembre 18 de 2021.	[{"download_link":"actividades\\/September2021\\/d4vT2BFKCq9kUb4lRR8M.pdf","original_name":"12 DESIGNACI\\u00d3N  DE SUPERVISOR.pdf"}]	0	315
84	2021-09-16	2022-04-18	Realizar función de supervisora designada para la ejecución del contrato 1484 de 2021.	21	El contrato se encuentra en ejecución (su fecha de finalización es Diciembre 18 de 2021.	[{"download_link":"actividades\\/September2021\\/M5Qx6C1rMdxbMPAMmFZI.pdf","original_name":"12 DESIGNACI\\u00d3N  DE SUPERVISOR.pdf"}]	0	315
85	2021-08-24	2021-08-24	Apoyo para estructuración del proyecto -  Sistema de Alertas Tempranas.	22	Se realizó la entrega del proyecto Sistema de Alertas Tempranas.	[{"download_link":"actividades\\/September2021\\/Ee6XyPACV7Qo30cWFXn5.pdf","original_name":"1. Correo de Gobernaci\\u00f3n del Meta - COSTOS - ESCENARIOS DE RIESGOS Y ALERTAS TEMPRANAS - CON C\\u00d3DIGOS RESPECTIVOS.pdf"}]	1	163
86	2021-08-20	2021-08-23	Visita técnica  - Restitución de tierras - Predio El Palenque - municipio de El Dorado - Meta.	22	Se realizó visita técnica y emisión del respectivo informe.	[{"download_link":"actividades\\/September2021\\/8Qi525QpMM852KM42aPM.pdf","original_name":"INFORME RIESGOS PREDIO EL PALENQUE DIGERD-META.pdf"}]	1	167
109	2021-10-07	2021-10-08	ASISTIR A  CAPACITACIÓN VIRTUAL TIENDA DEL ESTADO COLOMBIANO - TVEC DIA 08 DE OCTUBRE  8:30 AM - 4:30 PM	12	ASISTIR A CAPACITACIÓN	[{"download_link":"actividades\\/October2021\\/pF44wcdEFbLk8Kfc1YxF.pdf","original_name":"CamScanner 10-08-2021 10.34_5.pdf"}]	0	228
87	2021-08-13	2021-09-12	Se brindó asistencia técnica a todos los municipios del departamento del Meta, para los líderes comunales y comunitarios en Gestión del Riesgo de Desastres,  Capacitación  Estrategia ENFOCA	22	Convocatoria, Encuentros sincrónicos, correos electrónicos, WhatsApp.	[{"download_link":"actividades\\/September2021\\/yIB4Umj7Ut3X0JutfwTh.pdf","original_name":"ASISTENCIA T\\u00c9CNICA - Estrategia Nacional ENFOCA.pdf"}]	1	165
88	2021-09-09	2021-09-09	Apoyo interdisciplinario para estructuración proyecto - FORTALECER LAS ACCIONES DE PREVENCIÓN Y CONTROL DE LA OCURRENCIA DE INCENDIOS DE COBERTURA VEGETAL EN EL DEPARTAMENTO DEL META	22	Corrección y ajustes requeridos por Oficina Juridica de la Gobernación	[{"download_link":"actividades\\/September2021\\/Nez4cKuYwOWld3NXLZTF.docx","original_name":"F-BS-30_ESTUDIOS_PREVIOS_MINIMA_CUANTIA_V1 (6)  -  9  de septiembre.docx"}]	1	162
89	2021-08-13	2021-09-12	Asistencia a reuniones y comités	22	Asistencia y participación de los comités y reuniones asignadas - Temas: ANM, Cormacarena (Autorizaciones temporales), Mesa Climática Nacional, Reunión ESAP  - Actualización PMGRD, otras.	[{"download_link":"actividades\\/September2021\\/g2CkkwUZJmvLJFPYLLRd.docx","original_name":"Reuniones varias -  CONTRATO AGOSTO DE 2021 -.docx"}]	1	108
90	2021-08-18	2021-08-18	Respuesta a la señora Astrid Vanessa Franco  -  Vereda El Pañuelo, municipio de Acacias - Meta	22	Oficio 618 de Agosto de 2021	[{"download_link":"actividades\\/September2021\\/zZ6Nc8bzq9kuI1FV2SjR.PDF","original_name":"4CORRE~1.PDF"}]	1	106
91	2021-08-16	2021-08-16	Remisión por competencia a Coordinador de GRD de Acacias - Meta.	22	Oficio 619 de Agosto de 2021	[{"download_link":"actividades\\/September2021\\/gvILDnClMdorQaz2n99t.PDF","original_name":"5CORRE~1.PDF"}]	1	106
92	2021-09-02	2021-10-01	APOYO LOGISTICO EN LA ENTREGA DE AYUDAS HUMANITARIAS	4	APOYO LOGISTICO EN LA ENTREGA DE AYUDAS HUMANITARIAS EN LA VEREDA JUAN BOSCO AZOTADA POR AL OLA INVERNAL	[]	1	147
93	2021-09-02	2021-10-01	SE APOYA EN LA GESTION DEL PROYECTO DE ALERTAS TEMPRANAS SAT	4	SE APOYA EN LA GESTION DEL PROYECTO DE ALERTAS TEMPRANAS SAT	[]	1	145
94	2021-09-22	2021-09-29	APOYO A ACETIVIDADES DE ORGANIZACION DE SUMILACR ANCIONAL	4	APOYO A ACETIVIDADES DE ORGANIZACION DE SUMILACR ANCIONAL	[]	1	144
95	2021-09-02	2021-10-01	ACOMPAÑAMIENTO Y GESTION TECNOLOGICA DE CONSEJO DPTAL DE GESTION DEL RIESGO	4	SE APOYA A LA CONEXION EN AL REALIZADION DE REUNJONES VIRUTALES APOTO it	[]	1	144
96	2021-09-21	2021-09-21	APOYO  GESTION DE COMUNICACIONES EN LA ASAMBLEA	4	APOYO  GESTION DE COMUNICACIONES EN LA ASAMBLEA  BDEBATE CONTROL	[]	1	144
100	2021-10-05	2021-10-15	INFORME DE AFECTACIÓN RIO GUAPE SOBRE PUENTE LA CUBILLERA	20	INCLUIR EN LAS HORAS MAQUINAS EN ALQUILER	[{"download_link":"actividades\\/October2021\\/0NC3gPpt7uko1JenKYce.pdf","original_name":"AFECTACION RIO GUAPE SOBRE PUENTE LA CUBILLERA.pdf"}]	0	5
99	2021-10-05	2021-10-15	CONCEPTO TECNICO DE CORMACARENA OFICIO PM.GA 3.21.11861	13	REVISAR  CONCEPTO TECNICO Y REALAIZAR LOS TRAMITES CORRESPONDIENTES	[{"download_link":"actividades\\/October2021\\/BeARGyoWWtU117T4Xy01.pdf","original_name":"concepto t\\u00e9cnico_2.pdf"},{"download_link":"actividades\\/October2021\\/jdZDaIhnPM6JmK7KzKqF.pdf","original_name":"PDF COMRPOBANTE DE ENVIO - OFICIO 694.pdf"},{"download_link":"actividades\\/October2021\\/YhMQigh3TPc6rZXM3fZg.pdf","original_name":"oficio 694 CGR Villavicencio.pdf"}]	0	195
101	2021-10-07	2021-10-15	CORMACARENA OFICIO P.M.GA3.21.11907 RESPUESTA RADICADO 025559 DE SEPTIEMBRE 29 DE 2021	10	REVISAR OFICIO Y REALIZAR LOS TRAMITES PERTINENTES	[{"download_link":"actividades\\/October2021\\/tNsvBDtyUPSrwwCr3Jin.pdf","original_name":"CamScanner 10-07-2021 10.35.pdf"}]	0	225
98	2021-10-05	2021-10-15	REMISION DE CONCEPTO TECNICO N° PM -GA 3.44.21.3010 DE 15 DE SEPTIEMBRE DE 2021	13	REVISAR  CONCEPTO TECNICO Y REALAIZAR LOS TRAMITES CORRESPONDIENTES	[{"download_link":"actividades\\/October2021\\/b3dqXiCWjYKxHlVp77Cm.pdf","original_name":"concepto t\\u00e9cnico.pdf"},{"download_link":"actividades\\/October2021\\/hpGdZU89wkvcec3oj9xa.pdf","original_name":"COMPROBANTE DE ENVIO A DIGERD- META - OFICIO 693.pdf"},{"download_link":"actividades\\/October2021\\/4G2d0FNZqzk8wQE1hEuq.PDF","original_name":"oficio 693 CGR El Dorado.PDF"}]	0	195
97	2021-10-05	2021-10-13	Revisar oficio de cormacarena PM 3.21.11857 Respuesta  radicado N° 23423 del 7 de Septiembre de 2021 3.37.3.018.091	13	revisar con  profesional pertinente si oficio corresponde a la Dirección de gestión de riesgo de desastres	[{"download_link":"actividades\\/October2021\\/TDOwg3dssLdjDAqEnDoC.pdf","original_name":"Asignaci\\u00f3n  d\\u00eda 5 sep nicol cortes.pdf"},{"download_link":"actividades\\/October2021\\/qCdKa2ZTm8puyVLgqMtF.pdf","original_name":"EVIDENCIA DE RESPUESTA A CORRESPONDENCIA ASIGANADA - OFICIO 692.pdf"},{"download_link":"actividades\\/October2021\\/PP6ecXMc0i1nQtAwKQGk.pdf","original_name":"oficio 692 Grupo Suelo y Subsuelo CORMACARENA.pdf"}]	0	195
103	2021-10-08	2021-10-18	REMISIÓN POR COMPETENCIA DE DERECHO PETICIÓN SOLICITUD DE AYUDA HUMANITARIA POR INCENDIO	3	REVISAR DOCUMENTO Y REALIZAR LOS TRAMITES PERTINENTES	[{"download_link":"actividades\\/October2021\\/Xux01P9DwcljTiu3i24b.pdf","original_name":"DR CAMILO SERNA.pdf"}]	0	146
107	2021-10-07	2021-10-07	REUNIÓN DE K2 INGENIERIA S.A.S ALVIS QUE SON LOS SISTEMAS DE ALERTAS TEMPRANAS, CUALES SON LOS COMPONENTES, COMO PARTICIPA LA COMUNIDAD	4	ASISTIR A LA REUNIÓN FORO 8 DE OCTUBRE DE 2021 HORA 11: 00 AM	[{"download_link":"actividades\\/October2021\\/dxzqjyL367996CuoSfEV.pdf","original_name":"CamScanner 10-08-2021 10.34_4.pdf"}]	0	143
108	2021-10-07	2021-10-08	ASISTIR A  CAPACITACIÓN VIRTUAL TIENDA DEL ESTADO COLOMBIANO - TVEC DIA 08 DE OCTUBRE  8:30 AM - 4:30 PM	16	ASISTIR A CAPACITACIÓN	[{"download_link":"actividades\\/October2021\\/OL99neZ1F2qzL6T86jhi.pdf","original_name":"CamScanner 10-08-2021 10.34_5.pdf"}]	0	89
104	2021-10-08	2021-10-18	CORMACARENA OFICIO PM .GA 3.21.11849 REMISIÓN DEL CONCEPTO TECNICO N° PM .GA 3.44.21.3005 DEL 15 DE SEPTIEMBRE DE 2021 EXP N° 3.98.018	22	Se remite por competencia al coordinador de GRD de San Carlos de Guaroa, a través de oficio 706 del 14 de octubre de 2021.	[{"download_link":"actividades\\/October2021\\/AIkyAE5fZd1O2UoSIc2E.pdf","original_name":"CamScanner 10-08-2021 10.34_2.pdf"},{"download_link":"actividades\\/October2021\\/7CjsuTG91dTHfKAt23wD.pdf","original_name":"Oficio 706 -  San Carlos de Guaroa.pdf"}]	0	106
105	2021-10-08	2021-10-18	ACTA DE COMPROMISOS GENERADOS POR VISTA DE CONTINGENCIAS DENUNCIADAS POR LA CIUDADANIA EN LOS MUNICIPIO DE ACACIAS, GUAMAL Y CASTILLA LA NUEVA	6	REVISAR DOCUMENTO Y REALIZAR LOS TRAMITES PERTINENTES	[{"download_link":"actividades\\/October2021\\/gD84JrsqNzf0P3gqgVIu.pdf","original_name":"CamScanner 10-08-2021 10.34_3.pdf"}]	0	135
110	2021-10-08	2021-10-18	DERECHO DE PETICIÓN SR ALBERTO CONTRERAS  ECONOMISTA GCS	19	DAR RESPUESTA AL DERECHO DE PETICIÓN	[{"download_link":"actividades\\/October2021\\/4Ro5nHY5Bvc8p4bexGXe.pdf","original_name":"CamScanner 10-08-2021 11.28.pdf"}]	0	176
139	2021-10-15	2021-10-20	SOLICITUD DE APOYO PARA EVALUAR EL NIVEL DE RIESGO DE FAMILIAS QUE VIVEN EN LAS VEREDAS DE SAN AGUSTIN Y LA CRISTALINA	22	revisar la documentación y realizar los tramites pertinentes  -  Se reporta solicitud de vevículo .   última consulta el 17 de noviembre, no hay disponibilidad de vehiculo para ejecución de visita técnica.	[{"download_link":"actividades\\/October2021\\/JDcjZozxM66aPKzyVzJC.pdf","original_name":"ASIGNACI\\u00d3N  ING GEORGINA_4.pdf"}]	0	106
111	2021-10-08	2021-10-18	FORMULACIÓN DEL PLAN DE RESPUESTA FRENTE A LA SEGUNDA TEMPORADA DE LLUVIAS Y EL POSIBLE FENOMENO DE LA NIÑA 2021 CIRCULAR CONJUNTA NUMERO 001- DE 2021	20	REVISAR DOCUMENTO Y REALIZAR LOS TRAMITES PERTINENTES	[{"download_link":"actividades\\/October2021\\/9XsAUy84p0oqJc0mAZZH.pdf","original_name":"CamScanner 10-08-2021 14.08.pdf"}]	0	316
112	2021-10-08	2021-10-18	SOLICITUD DE INVERSIÓN URGENTE PARA PREVENIR LA PERDIDA DEL PUENTE SOBRE CAÑO SECO EN MONTFOR - MUNICIPIO DEL CALVARIO	11	CORDINAR VISITA TECNICA CON PROFESIONAL Y REMITIR SOLICITUD AL AIM	[{"download_link":"actividades\\/October2021\\/mbk1TmGbSH61TNlJyTvY.pdf","original_name":"CamScanner 10-08-2021 14.18.pdf"}]	0	2
113	2021-10-08	2021-10-19	APOYO DESCOLMATACIÓN PUENTE RIO GUAYURIBA	20	REVISAR OFICIO Y REALIZAR LOS TRAMITES PERTINENTES	[{"download_link":"actividades\\/October2021\\/ZZRzdl5f6sRpKeP0bcfc.pdf","original_name":"CamScanner 10-08-2021 14.18_2.pdf"}]	0	316
114	2021-10-08	2021-10-18	RESPUESTA DE LA UNIDAD RADICADO 2021ER09204 VEREDA OROTOY O- RIO GUAMAL DEL MUNICIPIO DE GUAMAL META	10	revisar la documentación y realizar los tramites pertinentes	[{"download_link":"actividades\\/October2021\\/N6La0b8aH1fvNsX1Z3ii.pdf","original_name":"CamScanner 10-08-2021 14.18_3.pdf"}]	0	225
115	2021-10-08	2021-10-19	REITERACIÓN INFORME DE AFECTACIÓN PLANEACIÓN CUMARAL	11	REVISAR OFICIO Y REALIZAR LOS TRAMITES PERTINENTES	[{"download_link":"actividades\\/October2021\\/zauaLnoXooLUNnqvMuW5.pdf","original_name":"CamScanner 10-08-2021 14.18_4.pdf"}]	0	2
116	2021-10-08	2021-10-14	AUDITORIA EXTERNA COMPLEMENTARIA	3	ORGANIZAR LOS DOCUMENTOS PERTINENTES PARA LA AUDITORIA	[{"download_link":"actividades\\/October2021\\/HACjMnpWBm5matz3wMQE.pdf","original_name":"CamScanner 10-08-2021 14.35.pdf"}]	0	140
117	2021-06-22	2021-09-06	problematica del rio ariari y afectacion a la comunidad del centro poblado de puerto limon del municipio de puerto limonss	19	Mediante oficio No. 107000-CE-647-DIGERD- de fecha del 06 de septiembre 2021 se elaboró un oficio dirigido al Ingeniero Jhon Alexis Sanabria Garzón-Secretaría de Educación del Departamento del Meta, traslado a la solicitud de la problemática del centro poblado de Puerto Limón del Municipio de Fuentedeoro, del requerimiento de la señora Rubí Alba Castaño – defensora de Derechos Humanos.	[{"download_link":"actividades\\/October2021\\/77sF2JqJlUPx3UzQz5RS.pdf","original_name":"TRASLADO-JHON SANABRIA-SECRET-EDUCACION-PUERTO LIMON (1).pdf"}]	0	269
118	2021-06-22	2021-09-06	problematica del rio ariari-  afectacion del centro poblado de puerto limon del municipio de fuentedeoro.	19	mediante oficio No. 107000-CE- 648-DIGERD- CON FECHA SEPTIEMBRE 06 DE 2021- SE DIO TRASLADO  A LA DOCTORA DIANA PATRICIA MANCERA CRUZ-ALCALDESA DE FUENTEDEORO-DE LA PROBLEMATICA DEL RIO ARIARI- AFECTACION DEL CENTRO POBLADO DE PUERTO LIMON	[{"download_link":"actividades\\/October2021\\/bIb6npKdKq3nYPorGN4v.pdf","original_name":"TRASLADO-DIANA P.MANCERA-ALCALDESA FUENTEDEORO (1).pdf"}]	0	173
119	2021-08-07	2021-09-06	TRASLADO DERECHO DE PETICION -DE LA JUNTA DE ACCION COMUNAL VEREDA CHOAPAL DEL MUNICIPIO DE RESPRESPO-DE APOYO DE MAQUINARIA AMARILLA .	19	MEDIANTE OFICIO NO. 107000-CE-649-DIGERD-DE FECHA SEPTIEMBRE DE 2021- TRASLADO DERECHO DE PETICION A LA DOCTORA MARLEN MOJICA GARZON ALCALDESA MUNICIPAL DE RESTREPO -	[{"download_link":"actividades\\/October2021\\/MXrmICZ00ND7bL8Wm1i1.pdf","original_name":"TRASLADO-MARLEN MOJICA GARZON-ALCALDESA RESTREPO (1).pdf"}]	0	269
120	2021-08-07	2021-09-06	RESPUESTA AL SEÑOR MARICIO GELVEZ ALEMAN-PRESIDENTE DE  LA JUNTA DE ACCION COMUNAL DE CHOAPAL DEL MUNICIPIO DE RESTREPO- APOYO DE MAQUINARIA AMARILLA	19	Oficio No. 107000-CE-650-DIGERD- fecha septiembre 06 de 2021- respuesta al señor peticionario Mauricio Gelvez Alemán-presidente de la JAC de la vereda Choapal- de la solicitud de apoyo de la maquinaria amarilla rio salinas en la vereda de Choapal del municipio de restrepo.	[{"download_link":"actividades\\/October2021\\/yiYXMAtxyx8dzS3GaNAy.pdf","original_name":"RESPUESTA-MAURICIO GELVEZ ALEMAN-CHOAPAL-RESTREPO (1).pdf"}]	0	269
121	2021-08-10	2021-09-06	traslado por competencia de la solicitud de situación de riesgo de comunidades Cristalina por Caño Guapaya. -	19	Oficio No.107000-CE-651-DIGERD-de septiembre 06 de 2021- al Doctor Jhon Jairo Ibarra Caicedo- alcalde municipal de Vista Hermosa- traslado por competencia de la solicitud de situación de riesgo de comunidades de la vereda Cristalina por Caño Guapaya. -	[{"download_link":"actividades\\/October2021\\/dzcdWdFDDCILOZiyBuDY.pdf","original_name":"TRASLADO-JHON JAIRO IBARRA-ALC-VISTA HERMOSA.pdf"}]	1	269
122	2021-08-10	2021-09-06	RESPUESTA DERECHO DE PETICION DE LA PERSONERIA DEL MUNICIPIO DE VISTA HERMOSA-DE LA SITUACION DE REISGO DE COMUNIDADES DE LA VEREDA CRISTALINA POR CAÑO GUAPAYA.	19	Oficio No.107000-CE-652-DIGERD- septiembre 06 de 2021- respuesta al doctor Jorge Iván Sanchez Ramírez-personero Municipal de Vista Hermosa- petición que presentó las comunidades de la vereda cristalina por caño Guapaya.	[{"download_link":"actividades\\/October2021\\/vs3Zu170EW1eJvWsHkg9.pdf","original_name":"RESPUESTA-JORGE I. SANCHEZ-PERSONERO VISTA HERMOSA.pdf"}]	1	269
123	2021-06-22	2021-09-06	TRASLADO POR COMPETENCIA -PROBLEMATICA DEL RIO ARIARI- AFECTAION A 250 FAMILIAS EN EL CENTRO POBLADO DE PUERTO LIMON DEL MUNCIPIO DE FUENTEDEORO	19	Oficio No.107000-CE-655-DIGER-del dia septiembre 06 de 2021- al Ingeniero Orlando Ortiz Gómez, director del Instituto Nacional de Vías (INVIAS)- solicitud de la problemática del rio ariari afectando a la población del centro poblado de puerto limón.	[{"download_link":"actividades\\/October2021\\/04d3MlWFhTv5kZiMqOeH.pdf","original_name":"RESPUESTA-MAURICIO GELVEZ ALEMAN-CHOAPAL-RESTREPO (1).pdf"}]	1	269
106	2021-10-07	2021-10-08	REUNIÓN DE K2 INGENIERIA S.A.S ALVIS QUE SON LOS SISTEMAS DE ALERTAS TEMPRANAS, CUALES SON LOS COMPONENTES, COMO PARTICIPA LA COMUNIDAD	22	ASISTIR A LA REUNIÓN FORO 8 DE OCTUBRE DE 2021 HORA 11: 00 AM - Se escribe solicitando Link, pero no se recibe respuesta por parte de la empresa K2 - No remitieron Link.	[{"download_link":"actividades\\/October2021\\/ZCBp1eDb1CYh3QWCd27h.pdf","original_name":"CamScanner 10-08-2021 10.34_4.pdf"},{"download_link":"actividades\\/October2021\\/xiGpiYislgllbbkAWfl6.pdf","original_name":"1. Soporte FOTO SAT - 8 de octubre 2021.pdf"}]	0	108
124	2021-06-22	2021-09-09	RESPUESTA DEL DERECHO DE PETICION. PROBLEMATICA DEL RIO ARIARI DE LA SITUACION QUE ESTAN PADECIENDO 250 FAMILIAS UBICADAS EN EL CENTRO POBLADO DE PUERTO LIMON DEL MUNICIPIO DE FUENTEDEORO.	19	Mediante oficio No.107000-CE-664-DIGERD-con fecha septiembre 09 de 2021- se dio respuesta a la señora Ruby Alba Castaño – Defensora de los Derechos Humanos del centro poblado de puerto limón del municipio de Fuentedeoro-situación de la problemática del rio Ariari afectando a mas de 250 familias de la comunidad.	[{"download_link":"actividades\\/October2021\\/Ywqc6X5rUJfcgp5MevwF.pdf","original_name":"RESPUESTA-RUBY ALBA CASTA\\u00d1O-PUERTO LIMON.pdf"}]	1	269
125	2021-09-17	2021-09-28	RESPUESTA A UN TRASLADO DEL DERECHO DE PETICION DE LA SEÑORA RUBY ALBA CASTAÑO- DEFENSORA DE LOS DERECHO HUMANOS DEL CENTRO POBLADO DE PUERTO LIMON DEL MUNICIPIO DE FUENTEDEORO.	19	Oficio No 107000-CE-671-DIGERD- respuesta al Ingeniero Orlando Ortiz Gómez-director Territorial del Meta e Instituto Nacional de Vías (INVIAS), traslado y adjunta el correspondiente derecho de petición de la señora Ruby Alba Castaño-centro poblado de puerto limón.	[{"download_link":"actividades\\/October2021\\/UBT90VBQNafpsDzAQscZ.pdf","original_name":"RESPUESTA-INVIAS-PUERTO LIMON-.pdf"}]	1	269
126	2021-08-03	2021-09-09	RESPUESTA DE LA SOLICITUD DE INFORME SINIESTROS PRESENTADOS Y POLIZAS VIGENTES TR, RCE Y SOAT SWL BANCO DE MAQUINARIA PESADA TRASFERIDOS AL DEPARTAMENTO DEL META-	19	Oficio No.107000-CE-697-DIGERD-septiembre 09 de 2021-respuesta del informe al Doctor Ariel Enrique Zambrano Meza- subdirector de manejo de desastres de la Unidad Nacional para la Gestion del Riesgo de Desastres- informe sobre el siniestro de la maquinaria presentada en el año 2018- se adjunto pólizas vigentes TR, RCE y SOAT de las maquinarias pesadas transferidos al Departamento del Meta.	[{"download_link":"actividades\\/October2021\\/5HPBiqPxEAhPfcj7dSvu.pdf","original_name":"OFICIO UNGRD - SI (1).pdf"}]	1	269
127	2021-09-11	2021-09-11	ASIGACION POR PARTE DEL DIRECTOR DEPARTAMENTAL PARA LA GESTION DEL RIESGO DE DESASTRES-	19	PARA EL DIA 11 DE SEPTIEMBRE DE 2021, SE ME ASIGNO A LA COLABORACION DE ORGANIZAR LAS AYUDAS RECIBIDAS POR LA DONATON, PARA LUEGO ENTREGAR A LOS DAMNIFICADOS DE VARIOS MUNICIPIOS AFECTADOS POR LA TEMPORADA DE LLUVIAS EN EL DEPARTAMENTO DEL META	[{"download_link":"actividades\\/October2021\\/FTCH632lkFhyvWWvC8Nq.jpg","original_name":"FOTO 2.jpg"},{"download_link":"actividades\\/October2021\\/Zv1oJIIb9CjBBQ9ga39t.jpg","original_name":"FOTO 3.jpg"}]	1	177
128	2021-09-22	2021-09-22	DESIGNACION POR PARTE DEL DIRECTOR DEPARTAMENTAL PARA LA GESTION DEL RIESGO DE DESASTRES - PARA LA SOCIALIZACION PNGRD-	19	Para el dia 22 de septiembre de 2021, se le delegó  para la reunión Virtual de socialización de la metodología de las mesas territoriales 2021, apertura con la participación de los 32 Consejos Departamentales de Gestion del Riesgo de Desastres (CDGRD), donde la socialización dan detalles de las mesas de trabajo que se realizara en el mes de octubre 20 y 21 de 2021 en el Departamento del Meta, para el seguimiento al Plan Nacional de Gestión del Riesgo de Desastres el XII informe de Seguimiento y Evaluación del PNGRD 2015 -2025.  -	[{"download_link":"actividades\\/October2021\\/GSYeNZnXqYKwBmWDwqds.jpg","original_name":"foto 5.jpg"},{"download_link":"actividades\\/October2021\\/U5ZOLR9Rgx7VFIuRM7nw.jpg","original_name":"foto 6.jpg"}]	1	177
129	2021-10-12	2021-10-20	RESPUESTA CORMACARENA RADICADO  DEL 19 DE MARZO DE 2021 EXPEDIENTE 3.37.3.020.066	13	REVISAR QUE  ESTA PENDIENTE CON ESTE DOCUMENTO Y REALIZAR LOS TRAMITES PERTINENTES	[{"download_link":"actividades\\/October2021\\/ACV5qzmEIMbMgAiXw3Sg.pdf","original_name":"ASIGNACI\\u00d3N NICOLE CORMACARENA.pdf"}]	0	195
130	2021-08-24	2021-08-24	Reunión socialización Plan de Ordenamiento Departamental	32	Se realiza Reunión socialización Plan de Ordenamiento Departamental por parte de funcionarios de Planeación Departamental.	[{"download_link":"actividades\\/October2021\\/YYuaz0EEGch8oVp6UCsO.pdf","original_name":"REUNI\\u00d3N_GESTION_RIESGO_24-8-21.pdf"}]	1	318
131	2021-09-28	2021-10-31	Respuesta a solicitud Olivia Alfonso Acevedo	32	Solicitud de intervención y protección a la Finca Paraiso, Vereda Tierra Grata, Municipio de Puerto Lleras de propiedad de la Señora Olivia Alfonso Acevedo quien da poder de representación al Señor José Alfredo Montenegro Ruiz periodista para llevar a cabo los procesos pertinentes.	[{"download_link":"actividades\\/October2021\\/ySp13iXfiS0CprTRQDTL.pdf","original_name":"2.Milena.pdf"}]	0	321
132	2021-10-31	2021-09-13	Apoyo en el Proyecto de Mejoramiento de la  Movilidad en 4 puntos del Departamento del Meta	32	Se realiza llamada a la Sra. Alcaldesa de Puerto Lleras Marly Johana Gutierrez Rincon en el Apoyo en el Proyecto de Mejoramiento de la  Movilidad en 4 puntos del Departamento del Meta, específicamente en el tema de construcción del Box Coulvert necesario para la vía Puerto Lleras - Puerto Toledo. Se crea compromiso del Arq. de unos viajes de volquete y material el cual se debe formalizar mediante una carta de la DIGERD	[]	0	321
133	2021-09-02	2021-09-02	Capacitación Autorización Temporales Alcaldes Meta	32	Se asiste en representación de la Dirección Departamental de Riesgos de Desastres a Capacitación de la Agencia Nacional Minera, impartida por la Dra. Doris Amanda Taute, Asesora Ambiental de Despacho.	[{"download_link":"actividades\\/October2021\\/WgZkoB0DUVXtXNVvlpCa.png","original_name":"Captura de Pantalla 2021-10-12 a la(s) 4.23.22 p.\\u00a0m..png"}]	1	318
134	2021-08-17	2021-08-17	Poder "Tramites y Permisos Ambientales" ante Cormacarena	32	Se realiza Poder para poder realizar en la DIGERD "Tramites y Permisos Ambientales" ante Cormacarena, el cual fue firmado y autenticado por el Arq. Wilson López Bogotá y la Dra. Angela Milena Lozano Caicedo, el mismo fue entregado en original a la Dra. Martha Amaya  y en copia a la Ing. Ambiental Nicole Cortes, encargada de realizar tramites ante la entidad.	[{"download_link":"actividades\\/October2021\\/yahZpeJe7TpR5NxwC8rj.pdf","original_name":"doc07923220210818114250.pdf"}]	1	330
136	2021-10-15	2021-10-23	DERECHO DE PETICIÓN SOLICITANDO AYUDA HUMANITARIA DE EMERGENCIA POR AFECTACIÓN PRODUCTO DE LA OLA INVERNAL EN FAVOR DE FAMILIAS INDIGENAS DEL MUNICIPIO DE VILLAVICENCIO	3	RESPONDER DERECHO DE PETICIÓN	[{"download_link":"actividades\\/October2021\\/bBY6Ovu2rS1rNEBLw1jd.pdf","original_name":"Derecho de petici\\u00f3n  Dr camilo serna.pdf"}]	0	146
137	2021-10-15	2021-10-23	SOLICITUD DE HORAS MAQUINA PARA VEREDA MILLANITO	20	ATENDER SOLICITUD	[{"download_link":"actividades\\/October2021\\/9pCp3eqjfQL9ERwQX1AR.pdf","original_name":"Ing alexis asignaci\\u00f3n_2.pdf"}]	0	316
138	2021-10-15	2021-10-23	OPORTUNIDAD Y RESPONSABILIDAD EN LOS REGISTROS DE INFORMACIÓN EN EL SPGR	7	REVISAR DOCUMENTO Y REALIZAR LOS TRAMITES PERTINENTES	[{"download_link":"actividades\\/October2021\\/CBZDAUK2L3bsX45TMkSg.pdf","original_name":"ASIGNACI\\u00d3N  DRA CLAUDIA_3.pdf"}]	0	67
140	2021-10-12	2021-10-25	PREPARACIÓN INFORME DE GESTIÓN	7	REVISAR DOCUMENTO Y REALIZAR LOS TRAMITES PERTINENTES	[{"download_link":"actividades\\/October2021\\/2194fvocpphjxjFKF0fo.pdf","original_name":"ASIGNACI\\u00d3N  dra claudia_5.pdf"}]	0	67
143	2021-10-15	2021-10-23	AFECTACIÓN TRAMO VIAL CORREGUIMIENTO N°2	26	REVISAR EL SITIO, HACER VISITA,	[{"download_link":"actividades\\/October2021\\/Vh5hV8bpZTASzHHlUuku.pdf","original_name":"ASIGANCION  DAVID SANTIAGO -ALEJANDRO-SEBASTIAN_8.pdf"}]	0	260
144	2021-10-15	2021-10-20	SOLICITUD DE REUNIÓN HOSPITAL DEPARTAMENTAL	10	AGENDAR COMITE TECNICO	[{"download_link":"actividades\\/October2021\\/SYkCmPlze1gqKNM08E03.pdf","original_name":"ASIGNACI\\u00d3N  ING CAMILO_9.pdf"}]	0	225
145	2021-10-15	2021-10-23	RESPUESTA DE SOLICITUD  RADICADO 1524 DE 2021 - TRASLADO POR COMPETENCIA	3	REVISAR DOCUMENTO Y REALIZAR LOS TRAMITES PERTINENTES	[{"download_link":"actividades\\/October2021\\/xKOnLArH1sT5QpImcWSz.pdf","original_name":"Dr camilo.pdf"}]	0	140
146	2021-10-15	2021-10-20	solicitud de apoyo técnico municipio de mapiripan	6	ATENDER SOLICITUD	[{"download_link":"actividades\\/October2021\\/AfLQyXvRRyiKwdnfloG1.pdf","original_name":"CamScanner 10-15-2021 13.56.pdf"}]	0	135
149	2021-10-19	2021-10-25	INFORM TECNICO VEREDA LAS DELICIAS EN LAS CORDENADAS N ° 33.756 W 74°03.650 MUNICIPIO DE LEJANIAS META	20	REVISAR Y REALIZAR LOS TRAMITES PERTINENTES	[{"download_link":"actividades\\/October2021\\/CCuGdM5Ucuqwm8BIuEkq.pdf","original_name":"CamScanner 10-19-2021 16.45_2 (2).pdf"}]	0	316
142	2021-10-15	2021-10-25	CORMACARENA OFICIO PM.GA 3.21.11851 Remisión del concepto Técnico No. PM.GA 3.44.21.3007 del 15 de septiembre de 2021. Exp. No. 3.98.021.042	13	REVISAR DOCUMENTO Y REALIZAR LOS TRAMITES PERTINENTES	[{"download_link":"actividades\\/October2021\\/CV6JnvVCfQHK2IwJZJum.pdf","original_name":"Asignaci\\u00f3n ing nicol_6.pdf"},{"download_link":"actividades\\/October2021\\/JjtEY0VbJziqrP3mp8Dq.PDF","original_name":"OFICIO 722.PDF"}]	0	195
141	2021-10-15	2021-10-25	CORMACARENA OFICIO PM.GA 3.21.11850 Remisión concepto técnico No. PM.GA 3.44.21.3006 del 15 de septiembre de 2021. Exp. No. 3.98.016.046	13	REVISAR DOCUMENTO Y REALIZAR LOS TRAMITES PERTINENTES	[{"download_link":"actividades\\/October2021\\/tEVJrMPonzC7X2LNFDMY.pdf","original_name":"Ing nicol_6.pdf"},{"download_link":"actividades\\/October2021\\/gHonEccmouZTMZxhM8Ck.PDF","original_name":"OFICIO 722.PDF"}]	0	195
150	2021-10-22	2021-10-25	SOLICITUD INFORME - PROCESO 500013121002-2017-0010900 URGENTE DE VISITA A PREDIO RURAL LA ESMERALDA VEREDA AGUAS CLARAS DEL  MUNICIPIO DE CUBARRAL META	3	REVISAR DOCUMENTO Y REALIZAR LOS TRAMITES PERTINENTES	[{"download_link":"actividades\\/October2021\\/EXbbVhvb3gAa0snrdagH.pdf","original_name":"Asigancion Dr camilo serna.pdf"}]	0	8
151	2021-08-19	2021-08-19	Apoyo Donatón Víctimas del Invierno - Parque Central Gobernación	32	Se realiza apoyo y asistencia a Donatón Víctimas del Invierno - Parque Central Gobernación	[]	1	321
135	2021-08-19	2021-08-19	\N	32	Reunión entre el Ing. Benjamin Valverde de Planeacion Departamental y el Ing. Sebastián López de la DIGERD para recibir exposición del Plan de Ordenamiento Departamental, el cual se le expondrá al Arq. Wilson López Bogotá para sus comentarios finales en el área de interés de la DIGERD.	[]	1	318
152	2021-08-26	2021-08-26	Apoyar en la recolección de alimentos no perecederos para Victimas de la Emergencia Climática del Departamento del Meta	32	Se realiza apoyo en la recolección de alimentos no perecederos para Victimas de la Emergencia Climática del Departamento del Meta en le parque central.	[]	1	321
154	2021-09-11	2021-09-11	Apoyo a la elaboración de bolsas de mercado bodega DIGERD	32	Se realiza apoyo a la elaboración de bolsas de mercado con los productos donados días anteriores.	[]	1	321
155	2021-10-21	2021-10-21	Asistencia a la Socialización del Plan Nacional del Riesgo de Desastres 2015-2025	32	Se realiza asistencia y apoyo a la Socialización de los resultados del XI Informe de Seguimiento y Evaluación del del Plan Nacional del Riesgo de Desastres 2015-2025	[]	1	318
156	2021-09-28	2021-10-28	Reunión POD con "Proyecto Biocarbono Orinoquia" - Planeación Dptal.	32	Se asite a acompañamiento y apoyo a la Reunión de divulgación del Plan de Ordenamiento Departamental con la Ing. Lina Gineth Rodriguez Chitiva, enlace del ministerio de Ambiente en marco del "Proyecto Biocarbono Orinioquia" - y el Ing. Benjamin Balverde de Planeación Departamental en donde se discuten los alcances de la DIGERD en marco del POD y el apoyo de Ambiente y Cambio Climatico en nuestra actualización de Planes y Estrategias.	[]	1	318
157	2021-09-30	2021-09-30	Acompañamiento reunión "Malecón Cabuyaro"	32	Se realiza acompañamiento como responsable del PMA del "Malecón Cabuyaro" en oficinas de la dirección DIGERD.	[]	1	325
158	2021-10-06	2021-10-06	REVISIÓN RESPUESTA NUMERALES 1 AL 11 Notificación CORMACARENA Auto Nº1.2.64.21.2125 del 4/08/21 Expediente Nº3.37.3.019.020	32	REVISIÓN RESPUESTA NUMERALES 1 AL 11 Notificación CORMACARENA Auto Nº1.2.64.21.2125 del 4/08/21 Expediente Nº3.37.3.019.020 Contrato 2085 de 2019	[{"download_link":"actividades\\/October2021\\/OoDxrg4sAd1iRg1DLHnj.xlsx","original_name":"Observaciones Servimacnos.xlsx"}]	1	317
159	2021-10-06	2021-10-06	Reunión POD - DIGERD - Biocarbono Orinoquia	32	Se realiza apoyo y asistencia a la reunión creada por la Ing. Lina Gineth Rodriguez Chitiva en donde se exponen las necesidad de la DIGERD en marco de la actualización de sus planes y estrategias, y la posibilidad de recibir en el tema ambiental apoyo por la Secretaria de Ambiente Departamental y el Ministerio de Ambiente en marco del "Proyecto Biocarbono Orinoquia"	[]	1	318
160	2021-10-25	2021-10-30	RESPUESTA A LOS OFICIOS ALLEGADOS EL 27 DE JULIO DE 2021 BAJO EL RADICADO EXTERNO N° 1129 E INTERNO N° 0851 Y AL OFICIO DEL DIA 28 DE JULIO DE 2021 BAJO RADICADO EXTERNO N° 1134	20	revisar documentos y realizar los tramites pertinentes	[{"download_link":"actividades\\/October2021\\/nrt9EyXfa7FOhZqYwuuU.pdf","original_name":"CamScanner 10-25-2021 13.36.pdf"}]	0	316
161	2021-10-25	2021-10-30	AUDITORIA INTERNA CONTRATO N° 1083 DE 2021 SOLICITUD DE DOCUMENTOS	9	REVISAR DOCUMENTOS Y REALIZAR LOS TRAMITES PERTINENTES	[{"download_link":"actividades\\/October2021\\/qQ5OuOUSwUy1cnpJxKtX.pdf","original_name":"CamScanner 10-25-2021 21.58.pdf"}]	0	210
162	2021-10-25	2021-10-30	SOLICITUD DE INFORMACION SOBRE FIDUCIA MUNICIPIO DE FUENTE DE ORO  POBLACIÓN DE PUERTO LIMON	26	REVISAR DOCUMENTOS Y REALIZAR LOS TRAMITES PERTINENTES	[{"download_link":"actividades\\/October2021\\/rPKODXk1rkn1Fmh1yEmM.pdf","original_name":"CamScanner 10-25-2021 22.03.pdf"}]	0	260
153	2021-09-03	2021-09-03	Apoyo bodega DIREGD acomodación y pesaje alimentos	32	Se realiza apoyo en la bodega DIREGD para realizar acomodación y pesaje de los alimentos no perecederos donados la semana anterior.	[]	1	321
163	2021-10-25	2021-10-30	CONVOCATORIA PARTICIPACIÓN EN PROYECTO/ PRODUCTIVIDAD PARA LA ADAPTACIÓN	12	REVISAR DOCUMENTOS Y REALIZAR LOS TRAMITES PERTINENTES	[{"download_link":"actividades\\/October2021\\/JD2j2fRvHxSCV7fAsZhb.pdf","original_name":"CamScanner 10-25-2021 22.10.pdf"}]	0	230
164	2021-10-26	2021-10-30	PLAN DE CONTINGENCIA SEGUNDA TEMPORADA DE LLUVIAS FENOMENO DE LA NIÑA 2021 MUNICIPIO DE MAPIRIPAN	20	REVISAR DOCUMENTO Y REALIZAR LOS TRAMITES PERTINENTES	[{"download_link":"actividades\\/October2021\\/P4L96bn04pLkaDPZMsaS.pdf","original_name":"Ing alexis y ing Edgardo.pdf"}]	0	316
165	2021-10-26	2021-10-30	PLAN DE CONTINGENCIA SEGUNDA TEMPORADA DE LLUVIAS FENOMENO DE LA NIÑA 2021 MUNICIPIO DE MAPIRIPAN	9	REVISAR LOS DOCUMENTOS Y REALIZAR LOS TRAMITES PERTINENTES	[{"download_link":"actividades\\/October2021\\/VsDFv7TPLzyY91G81IG7.pdf","original_name":"Ing alexis y ing Edgardo.pdf"}]	0	333
166	2021-10-26	2021-10-30	INFORMACIÓN DE PUNTOS CRITICOS MUNICIPIO DE LEJANIAS META	20	REVISAR DOCUMENTO Y REALIZAR LOS TRAMITES PERTINENTES	[{"download_link":"actividades\\/October2021\\/y3DsUqNqBA75eJFBth1Y.pdf","original_name":"asignaci\\u00f3n ing alexis.pdf"}]	0	316
167	2021-10-26	2021-10-30	SOCIALIZACIÓN DE PLAN DE TRABAJO Y OBRAS PTO DE GRUPO GUAYURIBA Y TRABAJOS DE CANALIZACIÓN EN ARTICULACIÓN CON RIESGOS DEPARTAMENTAL	26	REVISAR DOCUMENTOS Y REALIZAR LOS TERMINOS PERTINENTES	[{"download_link":"actividades\\/October2021\\/hzv1HJxG9ntve4Paoxc2.pdf","original_name":"DAVID SANTIAGO.pdf"}]	0	260
168	2021-10-27	2021-11-02	INFORMACIÓN DE EVIDENCIAS DE MAPA DE RIESGOS VIGENCIA 2021 OFICINA DE CONTROL INTERNO GOBERNACIÓN DEL META	3	DAR TRAMITE Y CUMPLIMIENTO AL REQUERIMIENTO	[{"download_link":"actividades\\/October2021\\/q863Aq9GngoreDkXqrVO.pdf","original_name":"CamScanner 10-28-2021 13.10.pdf"}]	0	140
169	2021-10-29	2021-11-05	INFORME TECNICO - AFECTACIÓN OLA INVERNAL MUNICIPIO DE LEJANIAS META	20	REVISAR DOCUMENTO Y REALIZAR LOS TRAMITES PERTINENTES	[{"download_link":"actividades\\/October2021\\/U0nWbS1kFhCYcpoZwgjd.pdf","original_name":"ASIGNACI\\u00d3N  ING ALEXIS.pdf"}]	0	316
171	2021-10-29	2021-10-05	RESPORTE DE INFORMACIÓN - RIESGOS LABORALES 4 Y 5	7	REVISAR Y INFORMAR AL AREA ENCARGADA	[{"download_link":"actividades\\/October2021\\/cclYp0qUeX1tLmHnLgAq.pdf","original_name":"CamScanner 10-29-2021 10.50 (1).pdf"}]	0	63
173	2021-10-29	2021-11-05	RESPUESTA DE PQ 01533 COVIORIENTE REFERENTE AL TRASLADO POR COMPETENCIA DEL PREDIO EL DESCANSO	20	REVISAR DOCUMENTOS Y REALIZAR LOS TRAMITES PERTINENTES	[{"download_link":"actividades\\/October2021\\/p0PAGdpHOxjIjWy3mAEE.pdf","original_name":"CamScanner 10-30-2021 10.43.pdf"}]	0	3
174	2021-10-29	2021-11-05	CORMACARENA OFICIO PM.GA 3.21.12590 REMISION DE CONCEPTO TECNICO N PM - GA 3.44.21.34.66 DEL 19 DE OCTUBRE 2021	13	REVISAR DOCUMENTOS Y REALIZAR LOS TRAMITES PERTINENTES	[]	0	195
175	2021-10-30	2021-11-07	LIQUIDACION CORMACARENA RADICADO 027876DE 26/10/2021	13	REVISAR DOCUMENTOS Y REALIZAR LOS TRAMITES PERTINENTES	[{"download_link":"actividades\\/October2021\\/Q1trVppidiGGl4EuNAPm.pdf","original_name":"CamScanner 10-30-2021 11.01_2.pdf"}]	0	195
176	2021-10-30	2021-12-15	derecho de petición sr Orlando amado Traslaviña	20	REVISAR DOCUMENTOS Y REALIZAR LOS TRAMITES PERTINENTES	[{"download_link":"actividades\\/October2021\\/SyMmbkBkRpMouSYo1T69.pdf","original_name":"CamScanner 10-30-2021 11.18.pdf"}]	0	3
177	2021-10-30	2021-11-10	INFORME TECNICO INESTABILIDAD TALUD MUNICIPIO DE LEJANIAS META	20	REVISAR DOCUMENTOS Y REALIZAR LOS TRAMITES PERTINENTES	[{"download_link":"actividades\\/October2021\\/BWThHV6pMCbT6Yky3roZ.pdf","original_name":"CamScanner 10-30-2021 11.29.pdf"}]	0	316
178	2021-10-30	2021-11-10	ENVIO INFORME TECNICO-DAÑOS OCASIONADOS POR EL AFLUENTE DENOMINADO (CAÑO SECO) EN LA VEREDA BAJA CRISTALINA DEL MUNICIPIO DE LEJANIAS META	20	REVISAR DOCUMENTOS Y REALIZAR LOS TRAMITES PERTINENTES	[{"download_link":"actividades\\/October2021\\/Ib3R5rwtD1Plc2xWofVz.pdf","original_name":"CamScanner 10-30-2021 11.29 (2).pdf"}]	0	316
180	2021-10-30	2021-12-02	UNIDAD NACIONAL DE GESTIÓN DE RIESGO DE DESASTRES\tREALIZAR EL SEGUIMIENTO DEL CONVENIO UNGRD-IDEAM-334-2017 (114/2017) Y SUS DERIVADOS IDEAM - ALCALDÍA DE VILLAVICENCIO 347-2017 Y CONTRATO DE ASOCIACIÓN IDEAM- GEOPARK 149-2020	11	REVISAR DOCUMENTOS Y REALIZAR LOS TRAMITES PERTINENTES	[{"download_link":"actividades\\/October2021\\/BSzBzqHDziU09utmB63h.pdf","original_name":"CamScanner 10-30-2021 11.42_5.pdf"}]	0	2
183	2021-10-30	2021-11-05	REMISIÓN RECURSO DE QUEJA TICKET N° GSC-2021-75083 - ATENCIÓN AL CIUDADANO UNGRD: CORRESPONDIENTE AL CIUDADANO QUERUBÍN CASTILLO CASTAÑEDA , QUIEN, COMO GERENTE DE LA EMPRESA SUMINISTROS, OBRAS CIVILES Y METALMECÁNICAS QCC, SOLICITA INTERVENCIÓN DE LA ENTIDAD PARA ESTABLECER CONTACTO CON EL CONTRATISTA ARMANDO CASTAÑO QUIEN ES RESPONSABLE DE LA EJECUCIÓN DE OBRAS EN LAS VEREDAS ARENALES Y CASCADAS, PARA SOLICITAR PAZ Y SALVOS DE MAQUINARIA Y PERSONAL	20	REVISAR DOCUMENTOS Y REALIZAR LOS TRAMITES PERTINENTES	[{"download_link":"actividades\\/October2021\\/xWceF02TyxbtWS8nMkr2.pdf","original_name":"CamScanner 10-30-2021 11.42_10.pdf"}]	0	316
184	2021-10-30	2021-11-05	FICHA VERIFICACIÓN NO. 1 BPIN 2021005500266 OBRAS DE PROTECCION DE LADERA RIO NEGRO MUNICIPIO DE PUERTO LOPEZ-META, FICHA DE VERIFICACIÓN DE REQUISITOS DE PRESENTACIÓN Y APROBACIÓN N° 1 DEL PROYECTO IDENTIFICADO CON BPIN 2021005500266 DENOMINADO OBRAS DE PROTECCION DE LADERA RIO NEGRO MUNICIPIO DE PUERTO LOPEZ-META .	7	REVISAR DOCUMENTOS Y REALIZAR LOS TRAMITES PERTINENTES	[{"download_link":"actividades\\/October2021\\/CmK9w4cERwISmJeLgCRQ.pdf","original_name":"CamScanner 10-30-2021 11.42_11.pdf"}]	0	63
179	2021-10-30	2021-11-10	PLAN DE GESTION DEL RIESGO MUNICIPAL PUERTO RICO META	22	REVISAR DOCUMENTOS Y REALIZAR LOS TRAMITES PERTINENTES - Se emite respuesta según oficio 743 del 27 de octubre de 2021.	[{"download_link":"actividades\\/October2021\\/hlXlDXfN4bTUlFSUGlIG.pdf","original_name":"CamScanner 10-30-2021 11.42.pdf"},{"download_link":"actividades\\/November2021\\/fgguKg29o6L61ypvU2g5.pdf","original_name":"743 - Oficio respuesta a Puerto Rico - PMGRD - Puerto Rico.pdf"}]	0	106
181	2021-10-30	2021-11-12	REPORTE PARCIAL 08 PLANTA APIAY	22	REVISAR DOCUMENTOS Y REALIZAR LOS TRAMITES PERTINENTES - Información de conocimiento general - No requiere oficio de resouesta.	[{"download_link":"actividades\\/October2021\\/5jrjHYJneqweDHYLQxJ6.pdf","original_name":"CamScanner 10-30-2021 11.42_7 (1).pdf"}]	0	106
199	2021-11-05	2021-11-10	TERCERA SESIÓN DEL SUBCOMITE DE RESTITUCIÓN DE TIERRAS, EN LA CIUDAD DE VILLAVICENCIO EL DIA MIERCOLES 10 DE NOVIEMBRE A LAS 9:30 AM	3	ASISTIR A REUNIÓN DE RESTITUCIÓN DE TIERRAS	[{"download_link":"actividades\\/November2021\\/NB4qJIoHZNM8yITWzcoD.pdf","original_name":"CamScanner 11-05-2021 16.33.pdf"}]	0	141
172	2021-10-30	2021-10-02	MESA TECNICA AGROCLIMATICA NACIONAL  NOVIEMBRE 02 9 00 AM	22	ASISTIR DE A REUNION   - NO requiere respuesta - Solo asistir a reunión.	[{"download_link":"actividades\\/October2021\\/lTk4oP04Iv8b9jVua0W5.pdf","original_name":"ASIGNACION ING GEORGINA.pdf"}]	0	108
220	2021-11-10	2021-11-15	CORMACARENA OFICIO PM.GA 3.21.12654 RESPUESTA RADICADO NO. 028248 OCTUBRE 29 DE 2021 Y ENVÍO COPIA DE CONCEPTO TÉCNICO PM -GA 3.44.21.3866 NOVIEMBRE 08 DE 2021	13	REVISAR DOCUMENTO Y REALIZAR LOS TRAMITES PERTINENTES	[{"download_link":"actividades\\/November2021\\/PYxyMthsdwofn0SNEhMe.pdf","original_name":"CamScanner 11-10-2021 14.44.pdf"}]	0	195
185	2021-10-30	2021-11-05	DOCUMENTOS DE PRORROGA CALAMIDAD PUBLICA EN EL MUNICIPIO DE PUERTO LLERAS – META decretada en el Municipio de Puerto Lleras Meta, por la ola invernal del mes de abril de 2021, DECRETO 068 DE 2021, ACTA DE COMITÉ DE GESTIÓN DEL RIESGO DE DESASTRES EXTRAORDINARIO CON SU ASISTENCIA., REMISIÓN DECRETO 068 DE 2021	3	REVISAR DOCUMENTOS Y REALIZAR LOS TRAMITES PERTINENTES	[{"download_link":"actividades\\/October2021\\/f5fz7RRfIxh2KK9AbVqc.pdf","original_name":"CamScanner 10-30-2021 11.42_12 (1).pdf"}]	0	140
186	2021-10-30	2021-11-10	CORMACARENA OFICIO PM.GA 3.21.12566 Remisión Concepto Técnico No. PM.GA 3.44.21.1208 del 10 de mayo de 2021	13	REVISAR DOCUMENTOS Y REALIZAR LOS TRAMITES PERTINENTES	[{"download_link":"actividades\\/October2021\\/9QfVIyaTZzz9GgZ3PL9b.pdf","original_name":"CamScanner 10-30-2021 11.42_14.pdf"}]	0	195
187	2021-10-30	2021-11-03	Notificación Radicación TGI S.A ESP. No. S20210100005552	3	REVISAR DOCUMENTOS Y REALIZAR LOS TRAMITES PERTINENTES	[{"download_link":"actividades\\/October2021\\/scOnyEClP1p4gk65pWmU.pdf","original_name":"CamScanner 10-30-2021 11.42_15.pdf"}]	0	140
188	2021-10-30	2021-11-05	PETICIONARIA LUZ MARINA CUERVO BERMEO Y MAGDA CRISTINABAQUERO FINCA SAN GREGORIO  VILLAVICENCIO-META CELULAR: 3013384360	20	REVISAR DOCUMENTOS Y REALIZAR LOS TRAMITES PERTINENTES	[{"download_link":"actividades\\/October2021\\/DtkfvQZmoxJGgV7zGbeA.pdf","original_name":"CamScanner 10-30-2021 11.42_16.pdf"}]	0	4
189	2021-10-30	2021-11-03	REITERACION DE SOLICITUD - SOPORTES DE ANTICIPOS	16	REVISAR EL EXPEDIENTE DEL CONTRATO 1214 DE 2019 Y DAR TRAMITE CONTRACTUAL QUE CORRESPONDA	[{"download_link":"actividades\\/November2021\\/I2rdgiXDE8W2umQTpSFh.pdf","original_name":"CamScanner 11-02-2021 14.06.pdf"}]	0	203
191	2021-11-02	2021-11-05	CONTRALORIA DEPARTAMENTAL DEL META - CIRCULAR EXTERNA N° 042 DE 2021	16	REVISAR DOCUMENTOS Y REALIZAR LOS TRAMITES PERTINENTES	[{"download_link":"actividades\\/November2021\\/1hZTLO1ead11dVbWrC2Q.pdf","original_name":"CamScanner 11-03-2021 11.33.pdf"}]	0	203
147	2021-10-19	2021-10-29	REPORTE MATRIZ DE RIESGO DE CASTILLA LA NUEVA	22	REVISAR DOCUMENTO Y REALIZAR LOS TRAMITES PERTINENTES  -   Se emite respuesta segun Oficio 732 de octubre de 2021	[{"download_link":"actividades\\/October2021\\/3PCkIFpdzWpHQJS75RxK.pdf","original_name":"CamScanner 10-19-2021 16.45.pdf"},{"download_link":"actividades\\/November2021\\/DlqEQNxKJjlNYgu0tbpN.jpeg","original_name":"Oficio 732 - Respuesta a Matriz de Riesgo Castilla La Nueva.jpeg"}]	0	106
148	2021-10-19	2021-10-25	Solicitud de información para la elaboración del “Estudio de Impacto Ambiental (EIA) para la modificación de las licencias ambientales de la fase exploratoria, a través de la obtención de la licencia ambiental global del Área De Desarrollo Bello – bloque CPO 11”.	22	REVISAR DOCUMENTO Y REALIZAR LOS TRAMITES PERTINENTES  - Se da respuesta a través de oficio 734 de octubre de 2021.  Adjunto oficio	[{"download_link":"actividades\\/October2021\\/raCQkne5UYu01d3Kv0CT.pdf","original_name":"CamScanner 10-19-2021 16.45_2.pdf"},{"download_link":"actividades\\/November2021\\/hC80Mvp2CirKROee11Yw.pdf","original_name":"Oficio 734 del 25 octubre - respuesta MCS COnsultores - Bloque Bello.pdf"}]	0	106
182	2021-10-30	2021-11-10	REPORTE VITAL DE SEGUIMIENTO CONTINGENCIA INTERCONEXIÓN A COMPARTO COPIA DE LA INFORMACIÓN DEL REPORTE DE INICIAL CORRESPONDIENTE A LA CONTINGENCIA POR FUGA DE FLUIDO DE NAFTA EN LÍNEA DE 8 PULGADAS DE LA INTERCONEXION A”,	22	REVISAR DOCUMENTOS Y REALIZAR LOS TRAMITES PERTINENTES - No requiere oficio de respuesta - Información de conocimeinto general	[{"download_link":"actividades\\/October2021\\/4bF3xQPvTnaZ2X5H5nAh.pdf","original_name":"CamScanner 10-30-2021 11.42_9 (1).pdf"}]	0	106
192	2021-11-05	2021-11-09	OFICIO 2021EE11867 INVITACION A TALLER " POLITICA PUBLICA PARA SISTEMAS DE ALERTA TEMPRANA 9 DE NOVIEMBRE DE 2021 A LAS 2:00 PM - 4:00 PM	4	\N	[{"download_link":"actividades\\/November2021\\/SIPGrTP8niAXOoTioytL.pdf","original_name":"CamScanner 11-05-2021 10.54.pdf"}]	0	148
193	2021-11-05	2021-11-15	TRASLADO DE COMUNICACIÓN RADICADO 6162 INFORME DE LA SITUACIONES EN GUAMAL META	10	REVISAR LOS DOCUMENTOS Y REALIZAR LOS TRAMITES PERTINENTES	[{"download_link":"actividades\\/November2021\\/wzsxxZlkgElG9gVKkJEB.pdf","original_name":"CamScanner 11-05-2021 11.21.pdf"}]	0	225
195	2021-11-05	2021-11-10	ACTA DE COMITE DEL RIESGO DIA 08/10/2021	3	REVISAR DOCUMENTO Y REALIZAR LOS TRAMITES PERTINENTES	[{"download_link":"actividades\\/November2021\\/1NiLtDeQck9gRTU3cBdu.pdf","original_name":"CamScanner 11-05-2021 11.34.pdf"}]	0	140
196	2021-11-05	2021-11-20	REITERACION SOLICITUD DE APOYO MUNICIPIO DE PUERTO LLERAS	11	REVISAR LOS DOCUMENTOS Y REALIZAR LOS TRAMITES PERTINENTES	[{"download_link":"actividades\\/November2021\\/dLp7x0h6lJeu8T3lukci.pdf","original_name":"CamScanner 11-05-2021 12.39.pdf"}]	0	2
197	2021-11-05	2021-11-10	OFICIO 2021IE03798-RESPUESTA OFICIO CON RADICADOS 2021ER08519, 2021ER09433 Y 2021ER09634. VIABILIZACIÓN DEL PROYECTO “CONSTRUCCIÓN DEL DIQUE LONGITUDINAL, ADECUACIÓN DEL SECTOR QUE CONDUCE DEL CEMENTERIO HASTA LA VEREDA CAÑOS NEGROS; PARA EVITAR LAS INUNDACIONES Y AFECTACIÓN CAUSADAS POR EL RÍO ARIARI EN LA ZONA AGRÍCOLA DEL MUNICIPIO DE PUERTO RICO, META, EN EL TRAMO COMPRENDIDO PUERTO LA PAZ Y LA VEREDA CAÑOS NEGROS, EN EL MUNICIPIO DE PUERTO RICO DEPARTAMENTO DEL META	10	REVISAR DOCUMENTOS Y REALIZAR LOS TRAMITES PERTINENTES	[{"download_link":"actividades\\/November2021\\/znuUveTQvWrhD67AB1cx.pdf","original_name":"CamScanner 11-05-2021 16.08 (1).pdf"}]	0	225
198	2021-11-05	2021-11-12	CIRCULAR N° 044 DE 2021 SOLICITUD ACTUALIZACIÓN DE INFORMACIÓN –MAPAS DE RIESGOS – INVENTARIO DE BIENES PLAZO DE ENVIO DE INFORMACIÓN 12 DE NOVIEMBRE A LAS 6:00 PM EN FORMATO PDF	22	ENVIAR LA INFORMACION SOLICITADA  - Se emite Respuesta a través  de oficio 836 de 8 de noviembre de 2021 -	[{"download_link":"actividades\\/November2021\\/s1LY9DeXGtbqnU7qAjrP.pdf","original_name":"CamScanner 11-05-2021 16.24.pdf"},{"download_link":"actividades\\/November2021\\/mozuNMmoqrni9hDzhpiy.pdf","original_name":"Oficio 836 - Respuesta a Circular 044 de 2021 - relacionada con solicitud de informaci\\u00f3n Mapas de Riesgo_.pdf"}]	0	106
190	2021-10-30	2021-11-05	OFICIO SGS 107000-1318 SOLICITUD DE INFORMACION OFERTA INSTITUCIONAL QUE PERMITA PREVENIR /O MITIGAR LOS FACTORES DE RIESGO ( CAUSAS ) DE LA DELINCUENCIA JUVENIL EN EL DEPARTAMENTO DEL META	22	revisar la documentación y realizar los tramites pertinentes - Se remite respuesta a través de oficio 834 del 8 de noviembre de 2021	[{"download_link":"actividades\\/November2021\\/9pXwmdEXHA29hB3ZeJaw.pdf","original_name":"CamScanner 11-02-2021 14.17.pdf"},{"download_link":"actividades\\/November2021\\/hubIpd3at3pGTbo7b6Wg.pdf","original_name":"OFICIO 834 - Respuesta a oficio SGS-107000-1318 - Factores de riesgo de la delincuencia juvenil en el Depto del Meta_.pdf"}]	0	106
219	2021-11-10	2021-11-15	CORMACARENA OFICIO PM.GA 3.21.12654 RESPUESTA RADICADO NO. 028248 OCTUBRE 29 DE 2021 Y ENVÍO COPIA DE CONCEPTO TÉCNICO PM -GA 3.44.21.3866 NOVIEMBRE 08 DE 2021	13	REVISAR DOCUMENTO Y REALIZAR LOS TRAMITES PERTINENTES	[{"download_link":"actividades\\/November2021\\/NEchxZOM5p2EVgrtJmSm.pdf","original_name":"CamScanner 11-10-2021 14.44.pdf"}]	0	195
170	2021-10-29	2021-11-05	INVITACIÓN A TALLERES DE FORTALECIMIENTO GESTIÓN DEL RIESGO UNGRD - MADR FAO DIA 05 DE NOVIEMBRE 8:00 AM	22	A través de ofico 806 del 3 de noviembre. se hace extensiva la invitación a la secretaria de agricultura del Meta.  Se asiste a reunión.	[{"download_link":"actividades\\/October2021\\/MAclSCIMcpZWHtaORewk.pdf","original_name":"CamScanner 10-29-2021 10.32 (1).pdf"},{"download_link":"actividades\\/November2021\\/D2AgZrvO9owXDxTJRcKU.pdf","original_name":"Oficio 806 del 3 de noviembre  - Invitaci\\u00f3n talleres FAO- UNGRD.pdf"},{"download_link":"actividades\\/November2021\\/hxKQMFmEL4Bo95ehsnC8.pdf","original_name":"Taller Fortalecimiento GRD - FAO - UNGRD.pdf"}]	0	108
102	2021-10-08	2021-10-16	plan de acción de san juan de Arama  enviado por secretario de gobierno seguridad y convivencia	22	revisar la documentación y realizar los tramites pertinentes  - Se da respuesta  a través de oficio 733 de octubre de 2021.	[{"download_link":"actividades\\/October2021\\/SBKcgfbPStnCAPp2roQI.pdf","original_name":"ING GEORGINA.pdf"},{"download_link":"actividades\\/November2021\\/urDMeMFMgDn7Wwbp3AaP.jpeg","original_name":"OFICIO 733 -  Respuesta a San Juan de Arama.jpeg"}]	0	106
200	2021-11-09	2021-11-14	NOTIFICACION JUDICAL RAD 50001312100220130014300 NOTIFICA ACTUACIÓN PROCESAR EN PROCESO DE RESTITUCION DE TIERRAS LEY 1448 TITULAR MARIANA ALEXANDRA CALVO BOLAÑOS Y OTROS	3	REVISAR DOCUMENTO Y REALIZAR LOS TRAMITES PERTINENTES	[{"download_link":"actividades\\/November2021\\/JdgFYa6zNeSdL3x3U4vn.pdf","original_name":"CamScanner 11-09-2021 15.54.pdf"}]	0	140
203	2021-11-09	2021-11-10	INVITACIÓN AL FORO AVANCES EN LA INVESTIGACIÓN EN GESTIÓN DEL RIESGO POR TSUNAMI DIA 10 DE NOVIEMBRE DE 4 PM – 6 PM	13	ASISTIR A CAPACITACIÓN	[{"download_link":"actividades\\/November2021\\/WmNtGo1KiMGQtgClyUOH.pdf","original_name":"CamScanner 11-09-2021 14.45.pdf"}]	0	48
204	2021-11-09	2021-11-10	INVITACIÓN AL FORO AVANCES EN LA INVESTIGACIÓN EN GESTIÓN DEL RIESGO POR TSUNAMI DIA 10 DE NOVIEMBRE DE 4 PM – 6 PM	32	ASISTIR A CAPACITACIÓN	[{"download_link":"actividades\\/November2021\\/ZexpWi87fNhGarN8aEf1.pdf","original_name":"CamScanner 11-09-2021 14.45.pdf"}]	0	330
205	2021-11-09	2021-11-10	INVITACIÓN AL FORO AVANCES EN LA INVESTIGACIÓN EN GESTIÓN DEL RIESGO POR TSUNAMI DIA 10 DE NOVIEMBRE DE 4 PM – 6 PM	6	ASISTIR A CAPACITACIÓN	[{"download_link":"actividades\\/November2021\\/Y77jHX3Dh44367m9wFio.pdf","original_name":"CamScanner 11-09-2021 14.45.pdf"}]	0	28
206	2021-11-09	2021-11-11	INVITACIÓN REUNIÓN GESTIÓN DE RIESGO Y CAMBIO CLIMÁTICO. DIA JUEVES 11 DE 10:00 AM – 12 PM VIRTUAL	6	ASISTIR	[{"download_link":"actividades\\/November2021\\/F6BpEM0EXHD5vmUAN8LS.pdf","original_name":"CamScanner 11-09-2021 14.50.pdf"}]	0	28
207	2021-11-09	2021-11-11	INVITACIÓN REUNIÓN GESTIÓN DE RIESGO Y CAMBIO CLIMÁTICO. DIA JUEVES 11 DE 10:00 AM – 12 PM VIRTUAL	32	ASISTIR	[{"download_link":"actividades\\/November2021\\/lHAF8R62GKLfA84HicBm.pdf","original_name":"CamScanner 11-09-2021 14.50.pdf"}]	0	330
209	2021-09-28	2021-09-28	Reunión Vereda Samaria - Contrato 254 de 2019 Turismo	32	Asistencia a reunión citada por le Sr. Galo Vargas, presidente de la Junta de Acción Comunal de la Vereda Samaría, en cuanto a la problemática de construcción de vías en marco del Contrato 254 de 2019 con el Instituto de Turismo del Meta.	[]	1	318
210	2021-11-10	2021-11-13	SOLICITUD DE ALIMENTOS TRASLADO DE ALIMENTOS PARA ANIMALES CANINOS	3	ATENDER SOLICITUD	[{"download_link":"actividades\\/November2021\\/nsxVVslQoZ78DcSOFRqA.pdf","original_name":"CamScanner 11-10-2021 13.14.pdf"}]	0	140
211	2021-11-10	2021-11-13	SOLICITUD DE 400 METROS DE JAVIONES PARA LA PROTECCIÓN DE UN TRAMO DE LA VIA LA ESPERANZA QUE COMUNICA EL SECTOR COMPRENDIDO ENTRE LA TRITURADORA DE MINAS MURILLO HUMADEA Y EL CAÑO CAMELIAS	11	REVISAR DOCUMENTO Y REALIZAR LOS TRAMITES PERTINENTES	[{"download_link":"actividades\\/November2021\\/IQecqJ2aTOu8sDvFOs5r.pdf","original_name":"CamScanner 11-10-2021 13.31.pdf"}]	0	2
212	2021-11-10	2021-11-12	APERTURA CONVOCATORIAS DE ASIGNACIÓN AMBIENTAL DEL BIENIO 2021-2022	10	REVISAR DOCUMENTO Y REALIZAR LOS TRAMITES PERTINENTES	[{"download_link":"actividades\\/November2021\\/OFyR4pIo6VaDmBxYex6T.pdf","original_name":"CamScanner 11-10-2021 13.37.pdf"}]	0	213
213	2021-11-10	2021-11-13	UNIDAD NACIONAL PARA LA GESTIÓN DEL RIESGO DE DESASTRES SUBDIRECTORA PARA EL CONOCIMIENTO DEL RIESGO LINA DORADO GONZÁLEZ\tAPERTURA CONVOCATORIAS DE ASIGNACIÓN AMBIENTAL DEL BIENIO 2021-2022	26	REVISAR DOCUMENTO Y REALIZAR LOS TRAMITES PERTINENTES	[{"download_link":"actividades\\/November2021\\/Zu62gMriIV4p3dl7pv2I.pdf","original_name":"CamScanner 11-10-2021 13.43.pdf"}]	0	260
214	2021-11-10	2021-11-13	DERECHO DE PETICIÓN SOLICITUD DE OBRAS DE MITIGACIÓN EN EL RIO GUATIQUIA PARA PREVENIR INUNDACIONES	20	REVISAR DOCUMENTO Y REALIZAR LOS TRAMITES PERTINENTES	[{"download_link":"actividades\\/November2021\\/Wh77PTmxDxvMHUsiMILN.pdf","original_name":"CamScanner 11-10-2021 13.48.pdf"}]	0	316
215	2021-11-10	2021-11-15	DERECHO DE PETICIÓN SOLICITUD DE OBRAS DE MITIGACIÓN EN EL RIO GUATIQUIA PARA PREVENIR INUNDACIONES	13	REVISAR DOCUMENTO Y REALIZAR LOS TRAMITES PERTINENTES	[{"download_link":"actividades\\/November2021\\/JuTCbcgKbpd61sKmtX6z.pdf","original_name":"CamScanner 11-10-2021 14.10.pdf"}]	0	195
216	2021-11-10	2021-11-14	NOTIFICACIÓN AUTO NO. PS-GJ. 1.2.64.21.3220 DEL 02/11/2021 - EXPEDIENTE 3.37.3.019.021	13	REVISAR DOCUMENTO Y REALIZAR LOS TRAMITES PERTINENTES	[{"download_link":"actividades\\/November2021\\/9kkT98MI5exshubpBSPC.pdf","original_name":"CamScanner 11-10-2021 14.17.pdf"}]	0	195
217	2021-11-10	2021-11-15	NOTIFICACIÓN AUTO NO. PS-GJ. 1.2.64.21.3220 DEL 02/11/2021 - EXPEDIENTE 3.37.3.019.021	20	REVISAR DOCUMENTO Y REALIZAR LOS TRAMITES PERTINENTES	[{"download_link":"actividades\\/November2021\\/O1JSQ0lGuZ0u63vbWNMF.pdf","original_name":"CamScanner 11-10-2021 14.19.pdf"}]	0	316
218	2021-11-10	2021-11-15	OFICIO 2021EE11915-TRASLADO POR COMPETENCIA – SOLICITUD APOYO CON HORAS DE MAQUINARIA AMARILLA. RADICADO UNGRD NO. 2021ER08948	13	CORMACARENA OFICIO PM.GA 3.21.12659 ENVÍO COPIA DE CONCEPTO TÉCNICO PM -GA 3.44.21.2842 NOVIEMBRE 04 DE 2021	[{"download_link":"actividades\\/November2021\\/SihqPstjaOkwk807D2rB.pdf","original_name":"CamScanner 11-10-2021 14.34.pdf"}]	0	195
208	2021-11-09	2021-11-11	INVITACIÓN REUNIÓN GESTIÓN DE RIESGO Y CAMBIO CLIMÁTICO. DIA JUEVES 11 DE 10:00 AM – 12 PM VIRTUAL	22	ASISTIR - Se  asiste a reunión 10:00 am	[{"download_link":"actividades\\/November2021\\/oGJy6Mjmqjjz3tAt9aic.pdf","original_name":"CamScanner 11-09-2021 14.50.pdf"}]	0	108
201	2021-11-09	2021-11-14	NOTIFICACION JUDICAL RAD 50001312100220130014300 NOTIFICA ACTUACIÓN PROCESAR EN PROCESO DE RESTITUCION DE TIERRAS LEY 1448 TITULAR MARIANA ALEXANDRA CALVO BOLAÑOS Y OTROS	22	REVISAR DOCUMENTO Y REALIZAR LOS TRAMITES PERTINENTES  -  No requiere respuesta, Es informativo - Está pediente que definancoordenadas del predio para realizar la visita técnica.	[{"download_link":"actividades\\/November2021\\/lHYlK7CnedIyQZDuhfHd.pdf","original_name":"CamScanner 11-09-2021 15.54.pdf"}]	0	106
221	2021-11-10	2021-11-16	DERECHO DE PETICIÓN META-DORADO -VEREDA SAN ISIDRO- FINCA EL BRILLANTE SOLICITA INFORMACIÓN DEL OFICIO 10700-CE-670 DEL 27 DE SEPTIEMBRE DE 2021, SOLIICTA RESPUESTA DEFINITIVA DE RADICADO 670 DE FECHA 13 DE SEPTIEMBRE	36	REVISAR DOCUMENTO Y REALIZAR LOS TRAMITES PERTINENTES	[{"download_link":"actividades\\/November2021\\/PjaqH6x5enc6jEdAeOHs.pdf","original_name":"CamScanner 11-10-2021 14.49.pdf"}]	0	334
223	2021-11-16	2021-11-17	INVITACION A FORO MONITOREO VOLCANICO EN COLOMBIA 17 DE NOVIEMBRE DE 2021 - 4PM - 6PM	13	ATENDER INVITACIÓN E INSCRIBIRSE A LA MISMA	[{"download_link":"actividades\\/November2021\\/hH07FS9ocqlXXFPG57zM.pdf","original_name":"CamScanner 11-17-2021 09.39 (1).pdf"}]	0	195
224	2021-11-16	2021-11-17	INVITACION A FORO MONITOREO VOLCANICO EN COLOMBIA 17 DE NOVIEMBRE DE 2021 - 4PM - 6PM	6	ATENDER INVITACION E INSCRIBIRSE PARA LA MISMA	[{"download_link":"actividades\\/November2021\\/m5SNJHGNoQfihZ0bYU8w.pdf","original_name":"CamScanner 11-17-2021 09.39 (1).pdf"}]	0	135
225	2021-11-16	2021-11-17	INVITACION A FORO MONITOREO VOLCANICO EN COLOMBIA 17 DE NOVIEMBRE DE 2021 - 4PM - 6PM	32	ATENDER INVITACION E INSCRIBIRSE PARA LA MISMA	[{"download_link":"actividades\\/November2021\\/QoL2SgKyplS4YVddpk1X.pdf","original_name":"CamScanner 11-17-2021 09.39 (1).pdf"}]	0	330
226	2021-11-16	2021-11-20	RESPUESTA A RADICADO INVIAS NO. 101802 CON FECHA 29/10/2021 "CORREO ELECTRONICO - TRASLADO 753-INVIAS-PUERTO LIMON" SRA LILIA FALLA ROMERO	19	REVISAR DOCUMENTO Y REALIZAR LOS TRAMITES PERTINENTES	[{"download_link":"actividades\\/November2021\\/dUFi1qI0VrPESCpC06tv.pdf","original_name":"CamScanner 11-17-2021 09.51.pdf"}]	0	178
202	2021-11-09	2021-11-10	INVITACIÓN AL FORO AVANCES EN LA INVESTIGACIÓN EN GESTIÓN DEL RIESGO POR TSUNAMI DIA 10 DE NOVIEMBRE DE 4 PM – 6 PM	22	ASISTIR A CAPACITACIÓN -  Capacitación reasiganda a INg. Sebastian,   Esta actividad se cruza con CAPACITACIÓN A LIDERES COMUNALES - ENFOCA	[{"download_link":"actividades\\/November2021\\/hKqjPRUhbLs55rMdXyL0.pdf","original_name":"CamScanner 11-09-2021 14.45.pdf"}]	0	106
194	2021-11-04	2021-11-10	ACTA DE COMITE DEL RIESGO DEIA 08/10/2021	22	REVISAR LOS DOCUMENTOS Y REALIZAR LOS TRAMITES PERTINENTES  - INFORMATIVO  - no requiere respuesta, debido a que son obras realizadas por parte de OGRD de Villavicencio.	[{"download_link":"actividades\\/November2021\\/MUmT9Mf5ezoPChUCXVXC.pdf","original_name":"CamScanner 11-05-2021 11.34.pdf"}]	0	106
228	2021-11-17	2021-11-25	RECORDATORIO INVITACIÓN TALLERES " COMUNALES CONSTRUYENDO TERRITORIOS SEGUROS Y RESILENTES REGION DE LA ORINOQUIA 25 DE NOVIEMBRE DE 2021	22	REVISAR DOCUMENTO Y REALIZAR LOS TRAMITES PERTINENTES  - La reunión fué aplazada por la UNGRD - Estamos atentos a la nueva fecha.	[{"download_link":"actividades\\/November2021\\/DV2dvnAw7ogRz8XmBCZl.pdf","original_name":"CamScanner 11-17-2021 10.54.pdf"}]	0	106
222	2021-11-16	2021-11-17	INVITACION A FORO MONITOREO VOLCANICO EN COLOMBIA 17 DE NOVIEMBRE DE 2021 - 4PM - 6PM	22	FAVOR ASISTIR A LA  INVITACIÓN E INSCRIBIRSE PARA LA MISMA  - Se asiste a la reunión.	[{"download_link":"actividades\\/November2021\\/T79sR6tWDz5JIz6nN0Ov.pdf","original_name":"CamScanner 11-17-2021 09.39 (1).pdf"},{"download_link":"actividades\\/November2021\\/PzAI27lqr1NUKNhCkY87.pdf","original_name":"Foro Monitoreo volc\\u00e1nico en Colombia UNGRD 17 11 2021.pdf"}]	0	106
227	2021-11-17	2021-12-10	ESTADO DE REPORTES PNGRD Y MEGIR - CORTE 10 DE NOVIEMBRE DE 2021 FECHA LIMITE PARA CARGAR LOS REPORTES MUNICIPALES Y DEPARTAMENTALES ES EL 15 DE DICIEMBRE	22	REVISAR DOCUMENTO Y REALIZAR LOS TRAMITES PERTINENTES  - No  requiere respuesta, corresponde a reporte semanal de avances. Informativo	[{"download_link":"actividades\\/November2021\\/WuJ4SBMr5UVboqmMDinK.pdf","original_name":"CamScanner 11-17-2021 10.23.pdf"}]	0	106
229	2021-11-19	2021-11-20	LIQUIDACIÓN DE CORMACARENA  029026 DE 08/11/2021	13	REVISAR LOS	[{"download_link":"actividades\\/November2021\\/4Prop0iT0qQ7Stal3RWi.pdf","original_name":"LIQUIDACI\\u00d3N CORMACARENA 029026.pdf"}]	0	195
230	2021-11-17	2021-11-22	PETICIONARIO ORLANDO TRASLAVIÑA DERECHO DE PETICIÓN PREDIO CIMARRON VEREDA LA ISLA GUAMAL META	20	REVISAR DOCUMENTO Y REALIZAR LOS TRAMITES PERTINENTES  PARA DAR RESPUESTA AL PETICIONARIO	[{"download_link":"actividades\\/November2021\\/ddu5oAdH13Ti2KkYTyHN.pdf","original_name":"CamScanner 11-19-2021 12.44.pdf"}]	0	316
231	2021-11-19	2021-11-23	SOLICITUD DE APOYO DE HORAS MAQUINA MUNICIPIO DE MESETAS - META	20	REVISAR Y REALIZAR LOS TRAMITES PERTINENTES PARA ATENDER LA SOLICITUD	[{"download_link":"actividades\\/November2021\\/khBOc9JbjWxjePOQUwxj.pdf","original_name":"CamScanner 11-19-2021 13.46.pdf"}]	0	316
232	2021-08-12	2021-10-27	DESBORDAMIENTO DEL RIO ARIARI AFECTANDO AL CENTRO POBLADO DE PUERTO LIMON EN EL MUNICIPIO DE FUENTEDEORO-META.	19	ADJUNTO VARIOS TRASLADO Y RESPUESTAS DE PETICIONARIOS DE LA COMUNIDAD DEL CENTRO POBLADO DE PUERTO LIMON-	[{"download_link":"actividades\\/December2021\\/pxEeDpEoz6IJE9Pfm49T.pdf","original_name":"TRASLADO 750-SECRETARIA VIVIENDA-PTO LIMON.pdf"},{"download_link":"actividades\\/December2021\\/5PiJgpupj4Q42Mbx9MR4.pdf","original_name":"TRASLADO 751-ALCALDIA FUENTEDEORO-PTOLIMON.pdf"},{"download_link":"actividades\\/December2021\\/Zb9pyr4vEnVaSOIFEtrU.pdf","original_name":"TRASLADO 752-SECRETARIA AGRICULTURA-PTO LIMON.pdf"},{"download_link":"actividades\\/December2021\\/HKcQPrhtHTQRgsZPynZ4.pdf","original_name":"TRASLADO 753-INVIAS-PTO LIMON.pdf"},{"download_link":"actividades\\/December2021\\/EwyUUHPrAnoDzEjEceFi.pdf","original_name":"TRASLADO 754-SECRETARIA VIVIENDA-PTO LIMON.pdf"},{"download_link":"actividades\\/December2021\\/zfDR1UxeznZJb8fhh8fH.pdf","original_name":"TRASLADO 755-ALCALDIA FUENTEDEORO-PTOLIMON.pdf"},{"download_link":"actividades\\/December2021\\/vRNRiliXpoYKbwVbpPSd.pdf","original_name":"TRASLADO 756-SECRETARIA AGRICULTURA-PTO LIMON.pdf"},{"download_link":"actividades\\/December2021\\/EJiFBYeqPvl1CAhEYFcz.pdf","original_name":"TRASLADO 757-SECRETARIA SOCIAL-PTO LIMON.pdf"},{"download_link":"actividades\\/December2021\\/mpx1HKqZaUHh08czzS2n.pdf","original_name":"TRASLADO 758-ALCALDIA FUENTEDEORO-PTOLIMON.pdf"},{"download_link":"actividades\\/December2021\\/12eggLbEFQerh5c6My7U.pdf","original_name":"TRASLADO 759-SECRETARIA VIVIENDA-PTOLIMON.pdf"},{"download_link":"actividades\\/December2021\\/0uImAnqg7huxN3eqmbii.pdf","original_name":"TRASLADO 760-SECRETARIA AGRICULTURA-PTOLIMON.pdf"},{"download_link":"actividades\\/December2021\\/4VUGacGgba0Lmzfdau5L.pdf","original_name":"TRASLADO 761-SECRETARIA SOCIAL-PTOLIMON.pdf"},{"download_link":"actividades\\/December2021\\/WQqecFAwoJkPIsmvp0Ws.pdf","original_name":"TRASLADO 762-SECRETARIA VIVIENDA-PTOLIMON.pdf"},{"download_link":"actividades\\/December2021\\/8JSNowduTnCD6qZfArJ0.pdf","original_name":"TRASLADO 763-ALCADIA FUENTEDEORO-PTOLIMON.pdf"},{"download_link":"actividades\\/December2021\\/yQntihZc5BqVXLGn5rBq.pdf","original_name":"TRASLADO 764-SECREATRIA EDUCACION-PTOLIMON.pdf"}]	1	269
233	2021-08-12	2021-10-27	DESBORDAMIENTO DEL RIO ARIARI AFECTANDO AL CENTRO POBLADO DE PUERTO LIMON EN EL MUNICIPIO DE FUENTEDEORO-META.	19	ADJUNTO VARIOS TRASLADO Y RESPUESTAS DE PETICIONARIOS DE LA COMUNIDAD DEL CENTRO POBLADO DE PUERTO LIMON-	[{"download_link":"actividades\\/December2021\\/u7MCrgbvCxnvuL3Rplcl.pdf","original_name":"TRASLADO 750-SECRETARIA VIVIENDA-PTO LIMON.pdf"},{"download_link":"actividades\\/December2021\\/zsBqJIe8oOjg2prEuhZf.pdf","original_name":"TRASLADO 751-ALCALDIA FUENTEDEORO-PTOLIMON.pdf"},{"download_link":"actividades\\/December2021\\/249qcKeXxUfeLZICzOsv.pdf","original_name":"TRASLADO 752-SECRETARIA AGRICULTURA-PTO LIMON.pdf"},{"download_link":"actividades\\/December2021\\/6KY0u2xh4MVLrb5gYQwr.pdf","original_name":"TRASLADO 753-INVIAS-PTO LIMON.pdf"},{"download_link":"actividades\\/December2021\\/mvtjb9MKZZKu3MaawfHT.pdf","original_name":"TRASLADO 754-SECRETARIA VIVIENDA-PTO LIMON.pdf"},{"download_link":"actividades\\/December2021\\/d5RRSnj2RVlgfKSNDheb.pdf","original_name":"TRASLADO 755-ALCALDIA FUENTEDEORO-PTOLIMON.pdf"},{"download_link":"actividades\\/December2021\\/sc6PcTttLSLNpwouWpgv.pdf","original_name":"TRASLADO 756-SECRETARIA AGRICULTURA-PTO LIMON.pdf"},{"download_link":"actividades\\/December2021\\/NwjaTeKHhvVqaAw9zE4Q.pdf","original_name":"TRASLADO 757-SECRETARIA SOCIAL-PTO LIMON.pdf"},{"download_link":"actividades\\/December2021\\/2b2X5UxVoBbsfqTncaSc.pdf","original_name":"TRASLADO 758-ALCALDIA FUENTEDEORO-PTOLIMON.pdf"},{"download_link":"actividades\\/December2021\\/mUslw2Av9jyOyv11nS8X.pdf","original_name":"TRASLADO 759-SECRETARIA VIVIENDA-PTOLIMON.pdf"},{"download_link":"actividades\\/December2021\\/8UBpp72W84hgusIcwawE.pdf","original_name":"TRASLADO 760-SECRETARIA AGRICULTURA-PTOLIMON.pdf"},{"download_link":"actividades\\/December2021\\/UR5Mgy9masDIj2mRf4dj.pdf","original_name":"TRASLADO 761-SECRETARIA SOCIAL-PTOLIMON.pdf"},{"download_link":"actividades\\/December2021\\/9j62lzZVKfX4vXJdakk1.pdf","original_name":"TRASLADO 762-SECRETARIA VIVIENDA-PTOLIMON.pdf"},{"download_link":"actividades\\/December2021\\/LdoPQOpvaLxrksDYDQOe.pdf","original_name":"TRASLADO 763-ALCADIA FUENTEDEORO-PTOLIMON.pdf"},{"download_link":"actividades\\/December2021\\/X2Run5DQQnOHNb95uAbS.pdf","original_name":"TRASLADO 764-SECREATRIA EDUCACION-PTOLIMON.pdf"}]	1	173
234	2021-08-12	2021-11-08	DESBORDAMIENTO DEL RIO ARIARI AFECTANDO AL CENTRO POBLADO DE PUERTO LIMON DEL MUNICIPIO DE FUENTEDEORO MUNICIPIO DE FUENTEDEORO-NETA	19	ADJUTO VARIAS TRASLADOS A SECRETARIAS COMO VIVIENDA, EDUCACION , SOCIAL, ALCALDIA DE FUENTEDEORO, AGRICULTURA, SALUD, E INVIAS- DE LAS SOLICITUDES DE LA COMUNIDAD DEL CENTRO POBLADO DE PUERTO LIMON	[]	0	269
235	2021-08-12	2021-11-08	DESBORDAMIENTO DEL RIO ARIARI AFECTANDO AL CENTRO POBLADO DE PUERTO LIMON DEL MUNICIPIO DE FUENTEDEORO MUNICIPIO DE FUENTEDEORO-NETA	19	ADJUTO VARIAS TRASLADOS A SECRETARIAS COMO VIVIENDA, EDUCACION , SOCIAL, ALCALDIA DE FUENTEDEORO, AGRICULTURA, SALUD, E INVIAS- DE LAS SOLICITUDES DE LA COMUNIDAD DEL CENTRO POBLADO DE PUERTO LIMON	[{"download_link":"actividades\\/December2021\\/BXtBMLGunLoCAefV2isA.pdf","original_name":"TRASLADO 786-AGRICULTURA-PTO LIMON.pdf"},{"download_link":"actividades\\/December2021\\/NiSfFFHlO8ptDD2NszMR.pdf","original_name":"TRASLADO 790-INVIAS-PTO LIMON.pdf"},{"download_link":"actividades\\/December2021\\/CAieXxNp97p970eKUtmm.pdf","original_name":"TRASLADO 791-VIVIENDA-PTO LIMON.pdf"},{"download_link":"actividades\\/December2021\\/cIqcOReGuLOREvX4WfY7.pdf","original_name":"TRASLADO 792-ALCALDIA FUENTEDEORO-PTO LIMON.pdf"},{"download_link":"actividades\\/December2021\\/M6od2IiZEm5891yVvjh3.pdf","original_name":"TRASLADO 794-INVIAS-PTO LIMON.pdf"},{"download_link":"actividades\\/December2021\\/sYy3G4aQn7iPzPDwjd2a.pdf","original_name":"TRASLADO 795-SECRETARIA DE VIVIENDA-PTO LIMON.pdf"},{"download_link":"actividades\\/December2021\\/f4A4Qa3PPbj46hTQc9O4.pdf","original_name":"TRASLADO 796-ALCALDIA FUENTEDEORO-PTO LIMON.pdf"},{"download_link":"actividades\\/December2021\\/CJOKmqNWvgsbrJMGFHVg.pdf","original_name":"TRASLADO 797-AGRICULTURA-PTO LIMON.pdf"},{"download_link":"actividades\\/December2021\\/27QKCBMflhUdOk63Ye3I.pdf","original_name":"TRASLADO 814-INVIAS-PTO LIMON.pdf"},{"download_link":"actividades\\/December2021\\/HHPVbrJNnXmcfuheaQ5G.pdf","original_name":"TRASLADO 815-VIVIENDA-PTO LIMON.pdf"},{"download_link":"actividades\\/December2021\\/i9FooFgSAGYLO1w4YyIc.pdf","original_name":"TRASLADO 816-ALCALDIA FTEDEORO-PTO LIMON.pdf"},{"download_link":"actividades\\/December2021\\/PNE1IKYfxeS0Uk871G4R.pdf","original_name":"TRASLADO 818-SOCIAL-PTO LIMON.pdf"},{"download_link":"actividades\\/December2021\\/d1yd13TlmxEmWeTzl1tV.pdf","original_name":"TRASLADO 819-EDUCACION-PTO LIMON.pdf"},{"download_link":"actividades\\/December2021\\/TRP0dK84YN6lB2BCD2nt.pdf","original_name":"TRASLADO 822-VIVIENDA-PTO LIMON.pdf"},{"download_link":"actividades\\/December2021\\/FcfLFXAQyASmghgJ240S.pdf","original_name":"TRASLADO 823- ALCALDIA FTEDEORO-PTO LIMON.pdf"},{"download_link":"actividades\\/December2021\\/fexWUnL7BP7ldXHR4IdX.pdf","original_name":"TRASLADO 824-SOCIAL-PTO LIMON.pdf"},{"download_link":"actividades\\/December2021\\/D3NmTqpkfmunnL6MWwJB.pdf","original_name":"TRASLADO 825-SALUD-PUERTO LIMON.pdf"},{"download_link":"actividades\\/December2021\\/LNoe3Ri4JEOi05lhxfNq.pdf","original_name":"TRASLADO 827-INVIAS-PTO LIMON.pdf"},{"download_link":"actividades\\/December2021\\/4zFtTcFurR3f5nbzpbv1.pdf","original_name":"TRASLADO 828-VIVIENDA-PTO LIMON.pdf"},{"download_link":"actividades\\/December2021\\/WteGwOI0P6iKO7rcK70Z.pdf","original_name":"TRASLADO 829-ALCALDIA FTEDEORO-PTO LIMON.pdf"}]	1	269
\.


--
-- Data for Name: calamidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.calamidad (id_calamidad, descripcion, fecha, documentos, fecha_cierre, resolucion_cierre, id_municipio) FROM stdin;
1	Incendio Forestal en Vereda Caney Declarado como Calamidad Pública mediante decreto....	2021-07-15	[{"download_link":"calamidad\\/July2021\\/v0KQa8rpJ9HzUA1NBfKB.pdf","original_name":"reporte.pdf"}]	2021-07-20	[{"download_link":"calamidad\\/July2021\\/7Od14vD8NvJKDRebaJlc.pdf","original_name":"reporte.pdf"}]	171
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.categories (id, parent_id, "order", name, slug, created_at, updated_at) FROM stdin;
1	\N	1	Category 1	category-1	2021-05-24 14:41:56	2021-05-24 14:41:56
2	\N	1	Category 2	category-2	2021-05-24 14:41:56	2021-05-24 14:41:56
\.


--
-- Data for Name: data_rows; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.data_rows (id, data_type_id, field, type, display_name, required, browse, read, edit, add, delete, details, "order") FROM stdin;
89	13	responsable	text	Responsable	f	f	t	t	t	t	{}	3
205	13	email	text	Email	f	f	t	t	t	t	{}	6
206	13	id_municipio	text	Id Municipio	f	t	t	t	t	t	{}	2
78	9	id_funcionario	listselect	Funcionario	f	t	t	t	t	t	{"table":"funcionarios","display_field":"nombre","return_field":"id_funcionario","model":"\\\\App\\\\Models\\\\Funcionario"}	2
207	13	entidade_belongsto_municipio_relationship	relationship	municipios	f	t	t	t	t	t	{"model":"\\\\App\\\\Models\\\\Municipio","table":"municipios","type":"belongsTo","column":"id_municipio","key":"id_municipio","label":"nombre","pivot_table":"actividades","pivot":"0","taggable":"0"}	7
212	32	id_informe	text	Id Informe	t	f	f	f	f	f	{}	1
213	32	id_funcionario	text	Id Funcionario	f	t	t	t	t	t	{}	2
214	32	inicio	date	Fecha inicial	f	t	t	t	t	t	{}	4
215	32	fin	date	Fecha Final	f	t	t	t	t	t	{}	5
216	32	elaboracion	date	Fecha Elaboracion	f	t	t	t	t	t	{}	6
217	32	numero	text	Numero de informe	f	t	t	t	t	t	{}	7
218	32	observaciones	text_area	Observaciones	f	t	t	t	t	t	{}	8
208	30	visita_belongsto_municipio_relationship	relationship	municipios	f	t	t	t	t	t	{"model":"\\\\App\\\\Models\\\\Municipio","table":"municipios","type":"belongsTo","column":"id_municipio","key":"id_municipio","label":"nombre","pivot_table":"actividades","pivot":"0","taggable":"0"}	12
219	32	informe_belongsto_funcionario_relationship	relationship	funcionarios	f	t	t	t	t	t	{"model":"\\\\App\\\\Models\\\\Funcionario","table":"funcionarios","type":"belongsTo","column":"id_funcionario","key":"id_funcionario","label":"nombre","pivot_table":"inventario_entrada","pivot":"0","taggable":"0"}	3
12	2	id	number	Id	t	f	f	f	f	f	\N	1
13	2	name	text	Name	t	t	t	t	t	t	\N	2
14	2	created_at	timestamp	Created At	f	f	f	f	f	f	\N	3
15	2	updated_at	timestamp	Updated At	f	f	f	f	f	f	\N	4
22	4	id	number	Id	t	f	f	f	f	f	\N	1
23	4	parent_id	select_dropdown	Parent	f	f	t	t	t	t	{"default":"","null":"","options":{"":"-- None --"},"relationship":{"key":"id","label":"name"}}	2
24	4	order	text	Order	t	t	t	t	t	t	{"default":1}	3
25	4	name	text	Name	t	t	t	t	t	t	\N	4
26	4	slug	text	Slug	t	t	t	t	t	t	{"slugify":{"origin":"name"}}	5
27	4	created_at	timestamp	Created At	f	f	t	f	f	f	\N	6
28	4	updated_at	timestamp	Updated At	f	f	f	f	f	f	\N	7
29	5	id	number	Id	t	f	f	f	f	f	\N	1
30	5	author_id	text	Author	t	f	t	t	f	t	\N	2
31	5	category_id	text	Category	t	f	t	t	t	f	\N	3
32	5	title	text	Title	t	t	t	t	t	t	\N	4
33	5	excerpt	text_area	Excerpt	t	f	t	t	t	t	\N	5
34	5	body	rich_text_box	Body	t	f	t	t	t	t	\N	6
35	5	image	image	Post Image	f	t	t	t	t	t	{"resize":{"width":"1000","height":"null"},"quality":"70%","upsize":true,"thumbnails":[{"name":"medium","scale":"50%"},{"name":"small","scale":"25%"},{"name":"cropped","crop":{"width":"300","height":"250"}}]}	7
36	5	slug	text	Slug	t	f	t	t	t	t	{"slugify":{"origin":"title","forceUpdate":true},"validation":{"rule":"unique:posts,slug"}}	8
37	5	meta_description	text_area	Meta Description	t	f	t	t	t	t	\N	9
38	5	meta_keywords	text_area	Meta Keywords	t	f	t	t	t	t	\N	10
39	5	status	select_dropdown	Status	t	t	t	t	t	t	{"default":"DRAFT","options":{"PUBLISHED":"published","DRAFT":"draft","PENDING":"pending"}}	11
40	5	created_at	timestamp	Created At	f	t	t	f	f	f	\N	12
41	5	updated_at	timestamp	Updated At	f	f	f	f	f	f	\N	13
42	5	seo_title	text	Seo Title	f	t	t	t	t	t	\N	14
43	5	featured	checkbox	Featured	t	t	t	t	t	t	\N	15
44	6	id	number	Id	t	f	f	f	f	f	\N	1
45	6	author_id	text	Author	t	f	f	f	f	f	\N	2
46	6	title	text	Title	t	t	t	t	t	t	\N	3
47	6	excerpt	text_area	Excerpt	t	f	t	t	t	t	\N	4
48	6	body	rich_text_box	Body	t	f	t	t	t	t	\N	5
49	6	slug	text	Slug	t	f	t	t	t	t	{"slugify":{"origin":"title"},"validation":{"rule":"unique:pages,slug"}}	6
50	6	meta_description	text	Meta Description	t	f	t	t	t	t	\N	7
51	6	meta_keywords	text	Meta Keywords	t	f	t	t	t	t	\N	8
52	6	status	select_dropdown	Status	t	t	t	t	t	t	{"default":"INACTIVE","options":{"INACTIVE":"INACTIVE","ACTIVE":"ACTIVE"}}	9
53	6	created_at	timestamp	Created At	t	t	t	f	f	f	\N	10
54	6	updated_at	timestamp	Updated At	t	f	f	f	f	f	\N	11
55	6	image	image	Page Image	f	t	t	t	t	t	\N	12
16	3	id	number	Id	t	f	f	f	f	f	{}	1
17	3	name	text	Nombre	t	t	t	t	t	t	{}	2
20	3	display_name	text	Nombre A Mostrar	t	t	t	t	t	t	{}	5
18	3	created_at	timestamp	Created At	f	f	f	f	f	f	{}	3
19	3	updated_at	timestamp	Updated At	f	f	f	f	f	f	{}	4
1	1	id	number	Id	t	f	f	f	f	f	{}	1
2	1	name	text	Nombre	t	t	t	t	t	t	{}	2
3	1	email	text	Email	t	t	t	t	t	t	{}	3
56	1	email_verified_at	timestamp	Email Verified At	f	f	f	f	f	f	{}	5
4	1	password	password	Password	t	f	f	t	t	f	{}	4
5	1	remember_token	text	Remember Token	f	f	f	f	f	f	{}	5
6	1	created_at	timestamp	Created At	f	f	f	f	f	f	{}	6
7	1	updated_at	timestamp	Updated At	f	f	f	f	f	f	{}	7
8	1	avatar	image	Icono	f	t	t	t	t	t	{}	8
21	1	role_id	text	Role	f	t	t	t	t	t	{}	9
11	1	settings	hidden	Settings	f	f	f	f	f	f	{}	12
9	1	user_belongsto_role_relationship	relationship	Role	f	t	t	t	t	f	{"model":"TCG\\\\Voyager\\\\Models\\\\Role","table":"roles","type":"belongsTo","column":"role_id","key":"id","label":"display_name","pivot_table":"roles","pivot":"0","taggable":"0"}	10
57	7	id_funcionario	text	Id Funcionario	t	f	f	f	f	f	{}	1
58	7	nombre	text	Nombre	f	t	t	t	t	t	{}	2
59	7	documento	text	Documento	f	t	t	t	t	t	{}	3
61	7	sexo	radio_btn	Sexo	f	t	t	t	t	t	{"default":"F","options":{"M":"Masculino","F":"Femenino"}}	5
65	7	email	text	Email	f	t	t	t	t	t	{"validation":{"rule":"required|email"}}	9
67	7	vinculacion	select_dropdown	Vinculacion	f	t	t	t	t	t	{"default":"Contratista","options":{"Planta":"Planta","Contratista":"Contratista"}}	11
60	7	edad	number	Edad	f	f	t	t	t	t	{}	4
62	7	direccion	text	Direccion	f	f	t	t	t	t	{}	6
63	7	telefono	text	Telefono	f	f	t	t	t	t	{}	7
64	7	profesion	text	Profesion	f	f	t	t	t	t	{}	8
66	7	especializacion	text	Especializacion	f	f	t	t	t	t	{}	10
68	7	contrato	text	Contrato	f	f	t	t	t	t	{}	12
69	7	inicio_contrato	date	Inicio Contrato	f	f	t	t	t	t	{}	13
71	7	arl	text	Arl	f	f	t	t	t	t	{}	15
72	7	eps	text	Eps	f	f	t	t	t	t	{}	16
73	7	pensiones	text	Pensiones	f	f	t	t	t	t	{}	17
74	9	id_actividad	text	Id Actividad	t	f	f	f	f	f	{}	1
10	1	user_belongstomany_role_relationship	relationship	Roles	f	t	t	t	t	f	{"model":"TCG\\\\Voyager\\\\Models\\\\Role","table":"roles","type":"belongsToMany","column":"id","key":"id","label":"display_name","pivot_table":"user_roles","pivot":"1","taggable":"on"}	11
79	9	desarrollo	text	Desarrollo	f	f	t	t	t	t	{}	9
75	9	fecha_estimada	date	Fecha Estimada	f	t	t	t	t	t	{"restricted":true}	6
84	1	id_funcionario	text	Id Funcionario	f	t	t	t	t	t	{}	3
83	1	user_belongsto_funcionario_relationship	relationship	Funcionario	f	t	t	t	t	t	{"model":"\\\\App\\\\Models\\\\Funcionario","table":"funcionarios","type":"belongsTo","column":"id_funcionario","key":"id_funcionario","label":"nombre","pivot_table":"migrations","pivot":"0","taggable":"0"}	13
85	12	id_tipo_acta	text	Id Tipo Acta	t	f	f	f	f	f	{}	1
86	12	descripcion	text	Descripcion	f	t	t	t	t	t	{}	2
87	13	id_entidad	text	Id Entidad	t	f	f	f	f	f	{}	1
88	13	nombre	text	Nombre	f	t	t	t	t	t	{}	2
151	26	fecha	date	Fecha	f	t	t	t	t	t	{}	3
90	13	telefono	text	Telefono	f	t	t	t	t	t	{}	4
92	14	id_tipo_emergencia	text	Id Tipo Emergencia	t	f	f	f	f	f	{}	1
93	14	descripcion	text	Descripcion	f	t	t	t	t	t	{}	2
94	15	id_tipo_actividad	text	Id Tipo Actividad	t	f	f	f	f	f	{}	1
95	15	descripcion	text	Descripcion	f	t	t	t	t	t	{}	2
96	15	finaliza	checkbox	Finaliza	f	t	t	t	t	t	{"on":"Si","off":"No","checked":false}	3
97	17	id_maquinaria	text	Id Maquinaria	t	f	f	f	f	f	{}	1
98	17	marca	text	Marca	f	t	t	t	t	t	{}	2
102	17	descripcion	text	Descripcion	f	t	t	t	t	t	{}	6
103	17	activa	checkbox	Activa	f	t	t	t	t	t	{"on":"Si","off":"No","checked":true}	7
104	18	id_tipo_ayuda	text	Id Tipo Ayuda	t	f	f	f	f	f	{}	1
105	18	descripcion	text	Descripcion	f	t	t	t	t	t	{}	2
106	20	id_mantenimiento	text	Id Mantenimiento	t	f	f	f	f	f	{}	1
107	20	id_maquinaria	text	Id Maquinaria	f	t	t	t	t	t	{}	2
108	20	fecha	date	Fecha	f	t	t	t	t	t	{}	3
109	20	costo	number	Costo	f	t	t	t	t	t	{}	4
111	21	id_seguimientos_maquinaria	text	Id Seguimientos Maquinaria	t	f	f	f	f	f	{}	1
112	21	fecha	date	Fecha	f	t	t	t	t	t	{}	3
113	21	descripcion	text	Descripcion	f	t	t	t	t	t	{}	4
114	21	id_maquinaria	text	Id Maquinaria	f	t	t	t	t	t	{}	2
115	21	horas	number	Horas	f	t	t	t	t	t	{}	5
116	21	seguimientos_maquinarium_belongsto_maquinarium_relationship	relationship	Maquinaria	f	t	t	t	t	t	{"model":"\\\\App\\\\Models\\\\Maquinaria","table":"maquinaria","type":"belongsTo","column":"id_maquinaria","key":"id_maquinaria","label":"descripcion","pivot_table":"entidades","pivot":"0","taggable":"0"}	6
117	23	id_emergencia	text	Id Emergencia	t	f	f	f	f	f	{}	1
122	23	tipo_emergencia	text	Tipo Emergencia	f	t	t	t	t	t	{}	2
123	23	id_municipio	text	Id Municipio	f	t	t	t	t	t	{}	3
99	17	capacidad	text	Capacidad	f	f	t	t	t	t	{}	3
100	17	presupuesto	text	Presupuesto	f	f	t	t	t	t	{}	4
101	17	ubicacion	text	Ubicacion	f	f	t	t	t	t	{}	5
133	17	linea	text	Linea	f	f	t	t	t	t	{}	8
134	17	serial	text	Serial	f	f	t	t	t	t	{}	9
135	17	año_asignacion	text	Año Asignacion	f	f	t	t	t	t	{}	10
136	17	placa	text	Placa	f	t	t	t	t	t	{}	11
137	17	observaciones	text	Observaciones	f	f	t	t	t	t	{}	12
128	23	id_funcionario	text	Id Funcionario	f	f	t	t	t	t	{}	5
118	23	descripcion	text	Descripcion	f	f	t	t	t	t	{}	7
120	23	fecha	timestamp	Fecha	f	t	t	t	t	t	{}	9
125	23	fuente_agua	text	Fuente Agua	f	f	t	t	t	t	{}	12
132	23	emergencia_belongsto_tipos_emergencium_relationship	relationship	Tipos_Emergencia	f	t	t	t	t	t	{"model":"\\\\App\\\\Models\\\\TiposEmergencia","table":"tipos_emergencia","type":"belongsTo","column":"tipo_emergencia","key":"id_tipo_emergencia","label":"descripcion","pivot_table":"entidades","pivot":"0","taggable":"0"}	6
138	20	horas	number	Horas	f	t	t	t	t	t	{}	5
139	20	proveedor	text	Proveedor	f	t	t	t	t	t	{}	6
140	20	valor_factura	text	Valor Factura	f	t	t	t	t	t	{}	7
141	20	numero_factura	text	Numero Factura	f	t	t	t	t	t	{}	8
142	20	numero_folio	text	Numero Folio	f	t	t	t	t	t	{}	9
143	20	tipo_mantenimiento	text	Tipo Mantenimiento	f	t	t	t	t	t	{}	10
110	20	mantenimiento_belongsto_maquinarium_relationship	relationship	Maquinaria	f	t	t	t	t	t	{"model":"\\\\App\\\\Models\\\\Maquinaria","table":"maquinaria","type":"belongsTo","column":"id_maquinaria","key":"id_maquinaria","label":"info","pivot_table":"entidades","pivot":"0","taggable":"0"}	5
70	7	actividades	text_area	Actividades Contractuales	f	f	t	t	t	t	{}	14
144	25	id_obligacion	text	Id Obligacion	t	f	f	f	f	f	{}	1
145	25	id_funcionario	text	Id Funcionario	f	t	t	t	t	t	{}	2
146	25	descripcion	text	Descripcion	f	t	t	t	t	t	{}	3
224	33	telefono	text	Telefono	f	f	t	t	t	t	{}	7
225	33	id_municipio	text	Id Municipio	f	t	t	t	t	t	{}	8
233	33	efectos_directos	text_area	Efectos Directos	f	f	t	t	t	t	{}	11
147	25	obligacione_belongsto_funcionario_relationship	relationship	Funcionario	t	t	t	t	t	t	{"model":"\\\\App\\\\Models\\\\Funcionario","table":"funcionarios","type":"belongsTo","column":"id_funcionario","key":"id_funcionario","label":"nombre","pivot_table":"entidades","pivot":"0","taggable":"0"}	4
76	9	fecha_entrega	date	Fecha Entrega	f	t	t	t	t	t	{}	7
77	9	descripcion	text	Descripcion	f	t	t	f	t	t	{"restricted":true}	8
80	9	anexos	file	Anexos	f	f	t	t	t	t	{}	10
179	29	objeto	text_area	Objeto	f	f	t	t	t	t	{}	8
180	29	desarrollo	text_area	Desarrollo	f	f	t	t	t	t	{}	9
150	26	id_personas_afectadas	text	Id Personas Afectadas	t	f	f	f	f	f	{}	1
119	23	localizacion	location	Localizacion	f	t	t	t	t	t	{}	8
152	26	hombres	number	Hombres	f	t	t	t	t	t	{}	4
153	26	mujeres	number	Mujeres	f	t	t	t	t	t	{}	5
154	26	ninos	number	Ninos	f	t	t	t	t	t	{}	6
155	26	id_emergencia	text	Id Emergencia	f	t	t	t	t	t	{}	2
156	26	personas_afectada_belongsto_emergencia_relationship	relationship	Emergencias	f	t	t	t	t	t	{"model":"\\\\App\\\\Models\\\\Emergencia","table":"emergencias","type":"belongsTo","column":"id_emergencia","key":"id_emergencia","label":"descripcion","pivot_table":"entidades","pivot":"0","taggable":null}	7
157	27	id_inventario_entrada	text	Id Inventario Entrada	t	f	f	f	f	f	{}	1
159	27	id_tipo_ayuda	text	Id Tipo Ayuda	f	t	t	t	t	t	{}	2
165	28	id_emergencia	text	Id Emergencia	f	t	t	t	t	t	{}	4
167	28	fecha	date	Fecha	f	t	t	t	t	t	{}	8
158	27	fecha	date	Fecha	f	t	t	t	t	t	{}	6
160	27	cantidad	number	Cantidad	f	t	t	t	t	t	{}	7
209	30	id_municipio	text	Id Municipio	f	t	t	t	t	t	{}	2
162	27	inventario_entrada_belongsto_tipos_ayuda_relationship	relationship	Tipo Ayuda	f	t	t	t	t	t	{"model":"\\\\App\\\\Models\\\\TiposAyuda","table":"tipos_ayuda","type":"belongsTo","column":"id_tipo_ayuda","key":"id_tipo_ayuda","label":"descripcion","pivot_table":"entidades","pivot":"0","taggable":"0"}	4
168	28	id_entidad	text	Id Entidad	f	t	t	t	t	t	{}	5
164	28	id_inventario_salida	text	Id Inventario Salida	t	f	f	f	f	f	{}	1
172	28	inventario_salida_belongsto_emergencia_relationship	relationship	Emergencias	f	t	t	t	t	t	{"model":"\\\\App\\\\Models\\\\Emergencia","table":"emergencias","type":"belongsTo","column":"id_emergencia","key":"id_emergencia","label":"descripcion","pivot_table":"entidades","pivot":"0","taggable":"0"}	2
170	28	inventario_salida_belongsto_entidade_relationship	relationship	Entidades	f	t	t	t	t	t	{"model":"\\\\App\\\\Models\\\\Entidad","table":"entidades","type":"belongsTo","column":"id_entidad","key":"id_entidad","label":"nombre","pivot_table":"entidades","pivot":"0","taggable":"0"}	3
173	29	id_acta_reunion	text	Id Acta Reunion	t	f	f	f	f	f	{}	1
174	29	fecha	date	Fecha	f	t	t	t	t	t	{}	3
175	29	lugar	text	Lugar	f	t	t	t	t	t	{}	4
176	29	hora_inicio	time	Hora Inicio	f	t	t	t	t	t	{}	5
177	29	hora_fin	time	Hora Fin	f	t	t	t	t	t	{}	6
178	29	convoca	text	Persona Que Convoca	f	t	t	t	t	t	{}	7
183	29	id_tipo_acta	text	Id Tipo Acta	f	t	t	t	t	t	{}	2
181	29	conclusiones	text_area	Conclusiones	f	f	t	t	t	t	{}	10
184	29	actas_reunion_belongsto_tipos_actum_relationship	relationship	Tipos_Acta	f	t	t	t	t	t	{"model":"\\\\App\\\\Models\\\\TiposActa","table":"tipos_acta","type":"belongsTo","column":"id_tipo_acta","key":"id_tipo_acta","label":"descripcion","pivot_table":"entidades","pivot":"0","taggable":"0"}	12
185	30	id_visita	text	Id Visita	t	f	f	f	f	f	{}	1
186	30	accion	text	Accion Adelantada	f	t	t	t	t	t	{}	2
187	30	fecha	date	Fecha	f	t	t	t	t	t	{}	3
188	30	asunto	text	Asunto	f	t	t	t	t	t	{}	4
189	30	interesado	text	Interesado	f	t	t	t	t	t	{}	5
190	30	localizacion	location	Localizacion	f	f	t	t	t	t	{}	6
191	30	objeto	text_area	Objeto	f	f	t	t	t	t	{}	7
192	30	desarrollo	text_area	Desarrollo	f	f	t	t	t	t	{}	8
195	30	recomendaciones	text_area	Recomendaciones	f	f	t	t	t	t	{}	11
196	31	id_accion_adelantada	text	Id Accion Adelantada	t	f	f	f	f	f	{}	1
197	31	id_tipo_actividad	text	Id Tipo Actividad	f	t	t	t	t	t	{}	2
198	31	id_entidad	text	Id Entidad	f	t	t	t	t	t	{}	4
199	31	id_emergencia	text	Id Emergencia	f	t	t	t	t	t	{}	7
202	31	acciones_adelantada_belongsto_entidade_relationship	relationship	Entidad	f	t	t	t	t	t	{"model":"\\\\App\\\\Models\\\\Entidad","table":"entidades","type":"belongsTo","column":"id_entidad","key":"id_entidad","label":"nombre","pivot_table":"entidades","pivot":"0","taggable":"0"}	6
204	31	acciones_adelantada_belongsto_tipos_actividad_relationship	relationship	Tipo De Actividad	f	t	t	t	t	t	{"model":"\\\\App\\\\Models\\\\TiposActividad","table":"tipos_actividad","type":"belongsTo","column":"id_tipo_actividad","key":"id_tipo_actividad","label":"descripcion","pivot_table":"entidades","pivot":"0","taggable":"0"}	3
203	31	acciones_adelantada_belongsto_emergencia_relationship	relationship	Emergencia	f	t	t	t	t	t	{"model":"\\\\App\\\\Models\\\\Emergencia","table":"emergencias","type":"belongsTo","column":"id_emergencia","key":"id_emergencia","label":"descripcion","pivot_table":"entidades","pivot":"0","taggable":"0"}	5
211	27	origen_ayuda	text	Origen Ayuda	f	t	t	t	t	t	{}	5
81	9	cumplida	checkbox	Cumplida	f	t	t	t	t	t	{"on":"Si","off":"No","checked":false,"restricted":true}	11
220	33	id_proyecto	text	Id Proyecto	t	f	f	f	f	f	{}	2
221	33	nombre_formulador	text	Nombre Formulador	f	t	t	t	t	t	{}	3
222	33	cargo	text	Cargo	f	f	t	t	t	t	{}	5
226	33	nombre_proyecto	text	Nombre Proyecto	f	t	t	t	t	t	{}	1
227	33	fecha	date	Fecha	f	t	t	t	t	t	{}	4
223	33	email	text	Email	f	f	t	t	t	t	{}	6
229	33	archivo	file	Proyecto Formulado	f	t	t	t	t	t	{}	9
228	33	proyecto_belongsto_municipio_relationship	relationship	Municipio	t	t	t	t	t	t	{"model":"\\\\App\\\\Models\\\\Municipio","table":"municipios","type":"belongsTo","column":"id_municipio","key":"id_municipio","label":"nombre","pivot_table":"entidades","pivot":"0","taggable":"0"}	9
230	32	aprobado	checkbox	Aprobado	f	t	t	t	t	t	{"off":"NO","on":"SI","checked":false,"restricted":true}	8
231	32	archivo	file	Archivo Informe Aprobado	f	t	t	t	t	t	{}	9
232	33	efectos_indirectos	text_area	Efectos Indirectos	f	f	t	t	t	t	{}	10
234	33	problema_central	text_area	Problema Central	f	f	t	t	t	t	{}	12
235	33	causa_directa	text_area	Causa Directa	f	f	t	t	t	t	{}	13
236	33	causa_indirecta	text_area	Causa Indirecta	f	f	t	t	t	t	{}	14
237	33	fines_indirectos	text_area	Fines Indirectos	f	f	t	t	t	t	{}	15
238	33	fines_directos	text_area	Fines Directos	f	f	t	t	t	t	{}	16
239	33	medios_directos	text_area	Medios Directos	f	f	t	t	t	t	{}	17
240	33	medios_indirectos	text_area	Medios Indirectos	f	f	t	t	t	t	{}	18
241	33	planteamiento_problema	text_area	Planteamiento Problema	f	f	t	t	t	t	{}	19
242	33	magnitud_problema	text_area	Magnitud Problema	f	f	t	t	t	t	{}	20
243	33	antecedentes	text_area	Antecedentes	f	f	t	t	t	t	{}	21
244	33	justificacion_politica	text_area	Justificacion Politica	f	f	t	t	t	t	{}	22
194	30	tecnico	text_area	Tecnico	f	f	f	f	f	f	{}	10
245	33	justificacion_tecnico_legal	text_area	Justificacion Tecnico Legal	f	f	t	t	t	t	{}	23
246	33	actores_entidades	text_area	Actores Entidades	f	f	t	t	t	t	{}	24
247	33	actores_actividad	text_area	Actores Actividad	f	f	t	t	t	t	{}	25
248	33	actores_tipo_actor	text_area	Actores Tipo Actor	f	f	t	t	t	t	{}	26
249	33	articulacion_actores	text_area	Articulacion Actores	f	f	t	t	t	t	{}	27
250	33	objetivo_general	text_area	Objetivo General	f	f	t	t	t	t	{}	28
251	33	indicador	text_area	Indicador	f	f	t	t	t	t	{}	29
252	33	unidad_medida	text_area	Unidad Medida	f	f	t	t	t	t	{}	30
253	33	cantidad	number	Cantidad	f	f	t	t	t	t	{}	31
254	33	objetivos_especificos	text_area	Objetivos Especificos	f	f	t	t	t	t	{}	32
255	33	alternativa_seleccionada	text_area	Alternativa Seleccionada	f	f	t	t	t	t	{}	33
256	33	descripcion_alternativa	text_area	Descripcion Alternativa	f	f	t	t	t	t	{}	34
257	33	actividades_cadena_valor	text_area	Actividades Cadena Valor	f	f	t	t	t	t	{}	35
258	33	descripcion_actividades	text_area	Descripcion Actividades	f	f	t	t	t	t	{}	36
259	33	tiempo_ejecucion	text_area	Tiempo Ejecucion	f	f	t	t	t	t	{}	37
260	33	observaciones	text_area	Observaciones	f	f	t	t	t	t	{}	38
261	34	id_municipio	text	Id Municipio	t	f	f	f	f	f	{}	1
262	34	nombre	text	Nombre	f	t	t	f	f	f	{}	2
263	34	funcionario	text	Funcionario	f	t	t	t	t	t	{}	3
264	34	direccion	text	Direccion	f	t	t	t	t	t	{}	4
265	34	email	text	Email	f	t	t	t	t	t	{}	5
266	34	telefono	text	Telefono	f	t	t	t	t	t	{}	6
267	34	documentos	file	Documentos	f	t	t	t	t	t	{}	7
269	1	id_municipio	text	Id Municipio	f	t	t	t	t	t	{}	13
268	1	user_belongsto_municipio_relationship	relationship	municipios	f	t	t	t	t	t	{"model":"\\\\App\\\\Models\\\\Municipio","table":"municipios","type":"belongsTo","column":"id_municipio","key":"id_municipio","label":"nombre","pivot_table":"entidades","pivot":"0","taggable":"0"}	14
270	36	id_calamidad	text	Id Calamidad	t	f	f	f	f	f	{}	1
271	36	descripcion	text_area	Descripcion	f	t	t	t	t	t	{}	2
272	36	fecha	date	Fecha	f	t	t	t	t	t	{}	3
274	36	fecha_cierre	date	Fecha Cierre	f	t	t	t	t	t	{}	5
276	36	id_municipio	text	Id Municipio	f	t	t	t	t	t	{}	7
273	36	documentos	file	Documentos	f	f	t	t	t	t	{}	4
275	36	resolucion_cierre	file	Resolucion Cierre	f	f	t	t	t	t	{}	6
277	36	calamidad_belongsto_municipio_relationship	relationship	municipios	f	t	t	t	t	t	{"model":"\\\\App\\\\Models\\\\Municipio","table":"municipios","type":"belongsTo","column":"id_municipio","key":"id_municipio","label":"nombre","pivot_table":"entidades","pivot":"0","taggable":"0"}	8
200	31	personas_involucradas	number	Personas atendidas	f	t	t	t	t	t	{}	8
201	31	fecha	date	Fecha	f	t	t	t	t	t	{}	9
124	23	comuna	text	Comuna / Vereda	f	f	t	t	t	t	{}	11
148	9	id_obligacion	cascade	Obligacion	f	t	t	t	t	t	{"parent":"id_funcionario","table":"obligaciones","display_field":"descripcion","return_field":"id_obligacion"}	4
279	37	id_template	text	Id Template	t	f	f	f	f	f	{}	1
280	37	template	text	Template	f	t	t	t	t	t	{}	2
281	38	id_page	text	Id Page	t	f	f	f	f	f	{}	1
282	38	title	text	Titulo	f	t	t	t	t	t	{}	4
283	38	banner_title	text	Titulo Banner	f	t	t	t	t	t	{}	5
284	38	banner_image	text	Imagen de Banner	f	t	t	t	t	t	{}	6
285	38	banner_text	radio_btn	Texto de Banner	f	t	t	t	t	t	{}	7
286	38	id_template	text	Id Template	f	t	t	t	t	t	{}	2
287	38	banner_link	text	Enlace de Banner	f	t	t	t	t	t	{}	3
288	38	sort	number	Ordenar	f	t	t	t	t	t	{}	8
289	38	site_page_belongsto_site_template_relationship	relationship	site_templates	f	t	t	t	t	t	{"model":"\\\\App\\\\Models\\\\SiteTemplate","table":"site_templates","type":"belongsTo","column":"id_template","key":"id_template","label":"template","pivot_table":"entidades","pivot":"0","taggable":"0"}	9
290	39	id_content	text	Id Content	t	f	f	f	f	f	{}	1
294	39	id_page	text	Id Page	f	t	t	t	t	t	{}	2
295	39	link	text	Link	f	t	t	t	t	t	{}	3
299	23	fotos	multiple_images	Fotos	f	f	t	t	t	t	{}	16
300	23	video	file	Video	f	f	t	t	t	t	{}	17
130	23	emergencia_belongsto_municipio_relationship	relationship	Municipios	f	t	t	t	t	t	{"model":"\\\\App\\\\Models\\\\Municipio","table":"municipios","type":"belongsTo","column":"id_municipio","key":"id_municipio","label":"nombre","pivot_table":"entidades","pivot":"0","taggable":"0"}	18
291	39	title	text	Titulo	f	t	t	t	t	t	{}	4
292	39	content	rich_text_box	Contenido	f	t	t	t	t	t	{}	5
293	39	image	image	Imagen	f	t	t	t	t	t	{}	6
297	39	slider	multiple_images	Slider	f	f	t	t	t	t	{}	8
301	39	video	file	Video	f	t	t	t	t	t	{}	9
298	39	site_content_belongsto_site_page_relationship	relationship	Pagina	f	t	t	t	t	t	{"model":"\\\\App\\\\Models\\\\SitePage","table":"site_pages","type":"belongsTo","column":"id_page","key":"id_page","label":"title","pivot_table":"entidades","pivot":"0","taggable":"0"}	9
296	39	sort	number	Ordenar	f	t	t	t	t	t	{}	7
126	23	movil	checkbox	Movil	f	f	t	t	t	t	{"on":"Si","off":"No","checked":false}	14
278	23	criticidad	select_dropdown	Criticidad	f	f	t	t	t	t	{"default":"Baja","options":{"Baja":"Baja","Media":"Media","Alta":"Alta"}}	13
302	23	user_id	text	User Id	f	f	f	f	f	f	{}	16
131	23	emergencia_belongsto_funcionario_relationship	relationship	Funcionarios	f	f	t	t	t	t	{"model":"\\\\App\\\\Models\\\\Funcionario","table":"funcionarios","type":"belongsTo","column":"id_funcionario","key":"id_funcionario","label":"nombre","pivot_table":"entidades","pivot":"0","taggable":"0"}	19
127	23	id_entidad	text	Id Entidad	f	f	t	t	t	t	{}	4
182	29	asistentes	multi	Asistentes	f	f	t	t	t	t	{}	11
193	30	concepto	text_area	Concepto Tecnico	f	f	t	t	t	t	{}	9
210	30	vereda	text	Vereda	f	f	t	t	t	t	{}	13
304	30	asistentes	multi	Asistentes	f	f	f	t	t	t	{}	14
121	23	estado	select_dropdown	Estado	f	f	t	t	t	t	{"default":"Registrado","options":{"Registrado":"Registrado","Aceptado":"Aceptado","Rechazado":"Rechazado"},"restricted":true}	10
129	23	emergencia_belongsto_entidade_relationship	relationship	Entidad	f	f	t	t	t	t	{"model":"\\\\App\\\\Models\\\\Entidad","table":"entidades","type":"belongsTo","column":"id_entidad","key":"id_entidad","label":"nombre","pivot_table":"entidades","pivot":"0","taggable":"0"}	15
303	23	emergencia_belongsto_user_relationship	relationship	Usuario	f	f	f	f	f	f	{"model":"\\\\App\\\\Models\\\\User","table":"users","type":"belongsTo","column":"user_id","key":"id","label":"name","pivot_table":"entidades","pivot":"0","taggable":"0"}	20
\.


--
-- Data for Name: data_types; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.data_types (id, name, slug, display_name_singular, display_name_plural, icon, model_name, description, generate_permissions, created_at, updated_at, server_side, controller, policy_name, details) FROM stdin;
2	menus	menus	Menu	Menus	voyager-list	TCG\\Voyager\\Models\\Menu		t	2021-05-24 14:41:56	2021-05-24 14:41:56	0		\N	\N
4	categories	categories	Category	Categories	voyager-categories	TCG\\Voyager\\Models\\Category		t	2021-05-24 14:41:56	2021-05-24 14:41:56	0		\N	\N
5	posts	posts	Post	Posts	voyager-news	TCG\\Voyager\\Models\\Post		t	2021-05-24 14:41:56	2021-05-24 14:41:56	0		TCG\\Voyager\\Policies\\PostPolicy	\N
6	pages	pages	Page	Pages	voyager-file-text	TCG\\Voyager\\Models\\Page		t	2021-05-24 14:41:56	2021-05-24 14:41:56	0		\N	\N
3	roles	roles	Role	Roles	voyager-lock	TCG\\Voyager\\Models\\Role	\N	t	2021-05-24 14:41:56	2021-05-24 15:49:05	0	TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController	\N	{"order_column":null,"order_display_column":null,"order_direction":"desc","default_search_key":null,"scope":null}
12	tipos_acta	tipos-acta	Tipo Acta	Tipos Acta	voyager-documentation	App\\Models\\TiposActa	\N	t	2021-05-25 11:39:31	2021-05-25 11:39:31	0	\N	\N	{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null}
14	tipos_emergencia	tipos-emergencia	Tipos Emergencia	Tipos Emergencia	fa fa-medkit	App\\Models\\TiposEmergencia	\N	t	2021-05-25 11:43:02	2021-05-25 11:43:02	0	\N	\N	{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null}
18	tipos_ayuda	tipos-ayuda	Tipos Ayuda	Tipos Ayudas	fa fa-stethoscope	App\\Models\\TiposAyuda	\N	t	2021-05-25 11:57:40	2021-05-25 11:57:40	0	\N	\N	{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null}
21	seguimientos_maquinaria	seguimientos-maquinaria	Seguimientos Maquinaria	Seguimientos Maquinaria	fa fa-calendar-check-o	App\\Models\\SeguimientosMaquinaria	\N	t	2021-05-25 12:02:49	2021-05-25 12:03:28	0	\N	\N	{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}
17	maquinaria	maquinaria	Maquinaria	Maquinaria	fa fa-cogs	App\\Models\\Maquinaria	\N	t	2021-05-25 11:51:51	2021-05-26 23:12:53	0	\N	\N	{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}
20	mantenimientos	mantenimientos	Mantenimiento	Mantenimientos	voyager-hammer	App\\Models\\Mantenimiento	\N	t	2021-05-25 12:00:29	2021-05-27 15:56:57	0	\\App\\Http\\Controllers\\Voyager\\BreadController	\N	{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}
7	funcionarios	funcionarios	Funcionario	Funcionarios	fa fa-address-card	App\\Models\\Funcionario	\N	t	2021-05-25 03:35:18	2021-05-27 16:18:54	0	\N	\N	{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}
26	personas_afectadas	personas-afectadas	Personas Afectada	Personas Afectadas	fa fa-male	App\\Models\\PersonasAfectada	\N	t	2021-05-28 04:17:49	2021-05-28 04:17:49	0	\N	\N	{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null}
15	tipos_actividad	tipos-actividad	Tipos Actividad	Tipos Actividades	fa fa-puzzle-piece	App\\Models\\TiposActividad	\N	t	2021-05-25 11:45:14	2021-05-28 13:29:06	0	\N	\N	{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}
13	entidades	entidades	Entidad	Entidades	fa fa-medkit	App\\Models\\Entidad	\N	t	2021-05-25 11:41:07	2021-06-02 04:25:55	0	\N	\N	{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}
27	inventario_entrada	inventario-entrada	Inventario Entrada	Inventario Entradas	fa fa-sign-in	App\\Models\\InventarioEntrada	\N	t	2021-05-28 04:26:15	2021-06-02 04:34:42	0	\N	\N	{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}
25	obligaciones	obligaciones	Obligacion	Obligaciones	fa fa-clock-o	App\\Models\\Obligacion	\N	t	2021-05-27 17:06:27	2021-06-08 14:59:44	0	\\App\\Http\\Controllers\\Voyager\\BreadController	\N	{"order_column":"id_obligacion","order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}
28	inventario_salida	inventario-salida	Inventario Salida	Inventario Salidas	fa fa-sign-out	App\\Models\\InventarioSalida	\N	t	2021-05-28 04:32:25	2021-06-28 04:29:34	0	App\\Http\\Controllers\\InventarioController	\N	{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}
32	informes	informes	Informe	Informes	fa fa-flag-checkered	App\\Models\\Informe	\N	t	2021-06-17 16:59:12	2021-06-28 12:20:08	0	\N	\N	{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}
33	proyectos	proyectos	Proyecto	Proyectos	fa fa-paper-plane	App\\Models\\Proyecto	\N	t	2021-06-28 01:58:28	2021-06-30 17:20:12	0	\N	\N	{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}
34	municipios	municipios	Municipio	Municipios	fa fa-map	App\\Models\\Municipio	\N	t	2021-06-30 18:56:13	2021-06-30 18:56:13	0	\N	\N	{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null}
1	users	users	User	Users	voyager-person	TCG\\Voyager\\Models\\User	\N	t	2021-05-24 14:41:56	2021-06-30 19:14:24	0	TCG\\Voyager\\Http\\Controllers\\VoyagerUserController	TCG\\Voyager\\Policies\\UserPolicy	{"order_column":null,"order_display_column":null,"order_direction":"desc","default_search_key":null,"scope":null}
36	calamidad	calamidad	Calamidad	Calamidads	fa fa-crosshairs	App\\Models\\Calamidad	\N	t	2021-06-30 19:23:13	2021-06-30 19:23:49	0	\N	\N	{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}
9	actividades	actividades	Actividad	Actividades	fa fa-briefcase	App\\Models\\Actividad	\N	t	2021-05-25 03:44:17	2021-07-15 03:42:37	0	\\App\\Http\\Controllers\\Voyager\\BreadController	\N	{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}
31	acciones_adelantadas	acciones-adelantadas	Acciones Adelantadas	Acciones Adelantadas	fa fa-bolt	App\\Models\\AccionesAdelantada	\N	t	2021-05-28 14:57:18	2021-07-13 14:46:44	0	\N	\N	{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}
37	site_templates	site-templates	Plantilla web	Plantillas Web	fa fa-safari	App\\Models\\SiteTemplate	\N	t	2021-07-16 17:30:18	2021-07-16 17:30:18	0	\N	\N	{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null}
38	site_pages	site-pages	Pagina de sitio	Paginas de Sitio	voyager-world	App\\Models\\SitePage	\N	t	2021-07-16 17:32:44	2021-07-16 17:33:34	0	\N	\N	{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}
29	actas_reunion	actas-reunion	Acta de Reunion	Actas de Reunion	fa fa-handshake-o	App\\Models\\ActasReunion	\N	t	2021-05-28 13:57:06	2021-07-19 14:22:06	0	\N	\N	{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}
30	visitas	visitas	Visita	Visitas	fa fa-binoculars	App\\Models\\Visita	\N	t	2021-05-28 14:53:16	2021-07-19 14:24:34	0	\N	\N	{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}
39	site_content	site-content	Contenido de Sitio	Contenidos de sitio	fa fa-file-code-o	App\\Models\\SiteContent	\N	t	2021-07-16 17:35:33	2021-07-16 21:33:32	0	\N	\N	{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}
23	emergencias	emergencias	Emergencia	Emergencias	voyager-lifebuoy	App\\Models\\Emergencia	\N	t	2021-05-25 12:04:39	2021-07-21 03:57:22	0	App\\Http\\Controllers\\EmergenciaController	\N	{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}
\.


--
-- Data for Name: detalle_inventario; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.detalle_inventario (id_detalle_inventario, id_inventario_salida, id_tipo_ayuda, cantidad) FROM stdin;
6	4	2	250
7	5	2	250
9	7	2	50
10	8	2	50
11	9	2	20
12	10	6	327
13	10	4	109
14	10	5	109
15	10	2	109
16	11	6	27
17	11	4	9
18	11	5	9
19	11	2	9
\.


--
-- Data for Name: emergencias; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.emergencias (id_emergencia, descripcion, localizacion, fecha, estado, tipo_emergencia, id_municipio, comuna, fuente_agua, movil, id_entidad, id_funcionario, criticidad, fotos, video, user_id) FROM stdin;
4	DESBORDAMIENTO RIO ARIARI	3.532610786227175,-73.70864868164064	2021-06-03 10:05:00	Aceptado	1	169	\N	RIO ARIARI	\N	1	3	Baja	\N	\N	\N
2	prueba de emergencia	4.141231537649657,-73.64430297195214	2021-05-19 22:00:00	Rechazado	2	180	\N	\N	\N	1	\N	Baja	\N	\N	\N
1	Inundacion rio meta	4.1424765,-73.65148658959404	2021-05-18 07:25:00	Rechazado	1	183	\N	\N	\N	1	11	Baja	\N	\N	\N
9	prueba de emergencia	-122.0840568,37.4219185	2021-07-18 02:12:51	Registrado	2	169	\N	\N	1	\N	\N	Baja	\N	\N	1
11	Prueba movil	4.13528462389533,-73.60111858695745	2021-07-18 02:45:51	Registrado	3	176	\N	\N	1	\N	\N	Baja	["files\\\\\\/filename01626576351.jpg","files\\\\\\/filename11626576351.jpg"]	["files\\\\\\/video1626576351.mp4"]	97
10	Incendio de prueba	37.428273378804064,-122.0746412873268	2021-07-18 02:43:00	Registrado	4	170	\N	\N	1	\N	\N	Baja	["files\\\\\\/filename01626576193.jpg","files\\\\\\/filename11626576193.jpg"]	[{"download_link":"emergencias\\/July2021\\/dCcwesu2dGwlL7ADHLtP.jpg","original_name":"bg.jpg"}]	1
12	El demo	4.1299871,-73.6027736	2021-07-18 02:52:49	Registrado	2	176	\N	\N	1	\N	\N	Baja	["files\\\\\\/filename01626576769.jpg"]	[{"download_link":"files\\\\\\/video1626576769.mp4","original_name":"video1626576769.mp4"}]	97
13	Incendio de prueba	4.15432264107124,-73.61834172159432	2021-07-06 00:00:00	Registrado	3	175	\N	\N	1	1	\N	Baja	\N	[{"download_link":"files\\\\\\/video1626579041.mp4","original_name":"video1626579041.mp4"}]	97
14	Inundación sector mi llanito	4.1513291,-73.6387903	2021-07-19 15:27:22	Registrado	1	180	\N	\N	1	\N	\N	Baja	["files\\\\\\/filename01626708442.jpg"]	[]	8
15	La Uribe, desde sogamoso	5.720086,-72.9369903	2021-07-21 00:56:43	Registrado	3	175	\N	\N	1	\N	\N	Baja	["files\\\\\\/filename01626829003.jpg"]	[{"download_link":"files\\\\\\/video1626829003.mp4","original_name":"video1626829003.mp4"}]	97
8	Incendio Forestal Vereda Caney	4.2952731999709615,-73.59805583953859	2021-07-14 00:00:00	Registrado	3	171	Vereda Caney Medio	Rio Xyx	0	1	2	Alta	["emergencias\\/July2021\\/euHrrC2qUCYdbqtajVTA.jpg"]	[]	\N
16	creciente rio Restrepo	4.2961718904218795,-73.58912944793703	2021-07-19 21:47:00	Registrado	2	171	La vereda	\N	0	1	\N	Baja	["emergencias\\/July2021\\/8sbtzw6X28nZIF1awEwx.png","emergencias\\/July2021\\/DfQGdZu4A8Iv4o5bdCMz.png"]	[{"download_link":"emergencias\\/July2021\\/Q2H8ISfwiRBhXFGooT95.png","original_name":"Screenshot_20210719_142458.png"}]	\N
17	Inundacion rio guatiquia	4.163068699130016,-73.63878250122072	2021-07-21 08:43:00	Registrado	1	171	Guatiquia	Rio Guatiquia	0	\N	1	Media	["emergencias\\/July2021\\/qb4avPbx0JVtCUz4qOEb.png","emergencias\\/July2021\\/5GepDaVoTx4ijs1kHxA3.png","emergencias\\/July2021\\/rLXvV9rWXW3QHFOiJEso.png"]	[{"download_link":"emergencias\\/July2021\\/wQaO7zSTMGconTdB0SQk.kdenlive","original_name":"fitsv4.kdenlive"}]	\N
18	incendio forestal en la parte alta del cerro	37.42177026166753,-122.08043720573188	2021-07-21 14:05:30	Registrado	3	171	\N	\N	1	\N	\N	Baja	["files\\\\\\/filename01626876330.jpg","files\\\\\\/filename11626876330.jpg"]	[{"download_link":"files\\\\\\/video1626876330.mp4","original_name":"video1626876330.mp4"}]	102
19	Creciente Rio guatiquia	4.160329359252149,-73.605694770813	2021-08-01 00:00:00	Registrado	2	171	Caney Medio	Rio Guatiquia	1	1	\N	Media	["emergencias\\/August2021\\/pjHdpeIMvGjpqmXFs89B.jpg","emergencias\\/August2021\\/VtCNt1YlSI17JcZHHRgE.jpg"]	[]	102
20	Incendio cocina	4.1568349,-73.6332518	2021-08-02 14:04:21	Registrado	3	192	\N	\N	1	\N	\N	Baja	["files\\\\\\/filename01627913061.jpg"]	[]	97
\.


--
-- Data for Name: emergencias_actas; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.emergencias_actas (id_emergencia, id_acta_reunion) FROM stdin;
\.


--
-- Data for Name: entidades; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.entidades (id_entidad, nombre, responsable, telefono, email, id_municipio) FROM stdin;
1	Defensa Civil	Pedro Rojas	30000000	\N	\N
\.


--
-- Data for Name: exports; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.exports (id_export, name, query, id_data_type) FROM stdin;
1	Listado de Mantenimientos a maquinaría	select m2.descripcion as maquina , m2.placa ,m2."serial" , m.fecha ,m.horas,\nm.numero_factura ,m.numero_folio ,m.tipo_mantenimiento ,m.valor_factura ,\nm.proveedor from mantenimientos m ,maquinaria m2 \nwhere m.id_maquinaria = m2.id_maquinaria 	20
\.


--
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- Data for Name: funcionarios; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.funcionarios (id_funcionario, nombre, documento, edad, sexo, direccion, telefono, profesion, email, especializacion, vinculacion, contrato, inicio_contrato, actividades, arl, eps, pensiones) FROM stdin;
2	Pedro Perez	86000000	22	M	\N	\N	\N	pedro@mail.com	\N	Contratista	\N	\N	[]	\N	\N	\N
11	Milena Leon perez	40334423	36	F	Cra 4 este #15-148 apto 901 T	3232916874	Ingeniera civil	milenaleonp85@hotmail.com		PLANTA		2021-01-02	Asesora de Despacho	Porvenir	Sanitas	Porvenir
20	ALEXIS ADRIAN RAMIREZ	79790970	44	M	CALLE 36 # 17B-50	3125192397	INGENIERO CIVIL	aramirez@meta.gov.co	GERENCIA DE PROYECTOS	PLANTA		2021-12-12	CONCEPTOS TÉCNICOS, DERECHOS DE PETICIÓN, VISITAS TÉCNICAS.	COLMENA	EPS SANITAS	PROTECCIÓN S.A.
21	María del Pilar Giraldo Noriega	40416864	49	F	Carrera 30 47-58  apto 301 edificio Santa Clara, barrio caudal 	3108519379	Optometra 	mgiraldon@meta.gov.co	Auditoría en salud-SST 	PLANTA		2014-01-05	Enlace DIGERD con Secretaría de Salud	Colmena	Sanitas 	Colpensiones
1	Juan Fajardo	860550406	43	M	Calle 15 26-22 Bogota	3006104615	Docente	juanfbarrero@gmail.com	\N	Contratista	\N	2021-06-01	\N	\N	\N	\N
3	Camilo Andrés Serna Solano	86074098	39	M	Amarilo Canaguay bloque 9 apto 603	3508332618	Abogado	csernas@meta.gov.co		PLANTA		2020-12-12	Seguimiento emergencias, asistencia técnica a Municipios 	Colmena 	Sanitas 	Protección 
4	LUIS CARLOS GUEVARA GRANADOS	86079187	37	M	Carrera 1 # 15B-61 CONDOMINIO ALAMEDA DEL BOSQUE	3138671306	INGENIERO DE SISTEMAS	ticsolt@gmail.com	ESP GERENCIA DE PROYECTOS	CONTRATO PRESTACION DE SERVICIOS	448 - 2021	2021-02-03	1.\tAsistir a reuniones, comités, capacitaciones y demás que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento\n2.\tApoyar a la dirección en actividades de conectividad digital para los consejos departamentales de riesgos realizados\n3.\tRealizar implementación y control de bases de datos para el manejo y consolidación de información de la Dirección Departamental Para La Gestión Del Riesgo De Desastres.\n4.\tApoyo en la logística necesaria que se requiera en las actividades de inventarios, activos de la dirección departamental para la gestión del riesgo de desastres.\n5.\tApoyo a las actividades relacionadas con los sistemas informáticos de la dirección departamental para la gestión del riesgo de desastres.\n6.\tPlanear y dirigir la formulación de proyectos de adquisición de software para la gestión integral de la Dirección.\n7.\tParticipar en la planeación y ejecución de proyectos planteados por la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento\n8.\tObrar con lealtad y buena fe en las distintas actividades que realice\n9.\tDar cumplimiento a las demás funciones que le sean asignadas y que correspondan al objeto contractual.	POSITIVA	COMPENSAR	COLPENSIONES
10	Camilo Andres Caballero Balcazar 	86056834	42	M	Calle 5 No. 25-25 Portal de Casibare	3142959147	Ingeniero Civil	camiloacaballerob@gmail.com 	Gerencia de Proyectos 	CONTRATO PRESTACION DE SERVICIOS	0904	2021-06-05	1.\tAsistir a reuniones, comités, capacitaciones y demás que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.\n2.\tApoyo a la Supervisión de los contratos de la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.\n3.\tRealizar visitas técnicas e informes de acuerdo con lo asignado por la Dirección en cumplimiento del objeto contractual\n4.\tApoyar visitas técnicas en desarrollo del balance de calamidades que se presenten en el Departamento del Meta.\n5.\tRealizar entrega periódica de todos los documentos proyectados en atención al desarrollo de sus obligaciones.\n6.\tApoyar la estructuración de los proyectos que le sean asignados por la Dirección.\n7.\tApoyar en la realización de presupuestos, memorias de cantidades, especificaciones técnicas, Apus y su respectivo soporte de estudio de mercadeo, de los proyectos que le sean asignados por la Dirección.\n8.\tApoyar en el cargue de información necesaria para la viabilización de los proyectos, en las plataformas de SUIT y MGA\n9.\tApoyar en la revisión documental de los proyectos y programas de Gestión del Riesgo, formulados por los municipios o demás entidades y demás que le sean asignados por la Dirección.\n10.\tApoyar en la actualización de los proyectos que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento\n11.\tMantener estricta reserva y confidencialidad sobre la información que conozca con ocasión de la ejecución del objeto contractual.\n12.\tObrar con lealtad y buena fe en las distintas actividades que realice\n13.\tLas demás que el sean asignadas y que correspondan al objeto contractual.\n14.\tPresentar informe mensual de actividades\n15.\tPresentar al finalizar el contrato los archivos digitales que proyecto durante la ejecución contractual al supervisor del contrato con visto bueno del Director Departamental para la Gestión del Riesgo de Desastre	Positiva 	Sanitas	Porvenir 
6	LYSETH TATIANA RUIZ ACERO	1121937106	24	F	CARRERA 19 #2A-61 CONDOMINIO PORTAL DEL MOLINO	3229442646	INGENIERIA AMBIENTAL	tatisruiz.12@hotmail.com	\N	Planta	0578	2021-03-15	1.\tApoyo a la supervisión de los contratos de la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.2.\tAsistir a reuniones, comités, capacitaciones y demás que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento. 3.\tRealizar visitas técnicas e informes de acuerdo con lo asignado por la Dirección en cumplimiento del objeto contractual. 4.\tApoyar visitas técnicas en desarrollo del balance de calamidades que se presenten en el Departamento del Meta.5.\tRealizar entrega periódica de todos los documentos proyectados en atención al desarrollo de sus obligaciones.6.\tApoyar la estructuración técnica de los proyectos que le sean asignados por la Dirección. 7.\tApoyar en la revisión documental de los proyectos y programas de Gestión del Riesgo, formulados por los municipios o demás entidades y demás que le sean asignadas por la Dirección.8.\tApoyar en la actualización de los proyectos que sean indicados por la dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.9.\tApoyar a la realización y revisión de presupuestos, memorias de cantidades, especificaciones técnicas, Apus y su respectivo soporte de estudio de mercadeo, de los proyectos que le sean asignados por la dirección.10.\tMantener estricta reserva y confidencialidad sobre la información que conozca con ocasión de la ejecución del objeto contractual.11.\tObrar con lealtad y buena fe en las distintas actividades que realice.12.\tLas demás que le sean asignadas y correspondan al objeto contractual.13.\tPresentar informe mensual de actividades 14.\tPresentar al finalizar el contrato los archivos digitales que proyecto durante la ejecución contractual al supervisor del contrato con visto bueno del Director Departamental para la Gestión del Riesgo de Desastres	COLMENA	SANITAS	PORVENIR
8	MARTHA TERESA JARA RIOS	51842146	53	F	Calle 45 # 45- 15 Barrio Santa Josefa	3138681169	abogada	jaramartha@hotmail.com	Derecho Administrativo	CONTRATO PRESTACION DE SERVICIOS	0346 de 2021	2022-09-02	OBLIGACIONES ESPECÍFICAS:\n1.\tAsesorar y representar a la Dirección Departamental para la Gestión del Riesgo de desastres en todas las actuaciones que le sean asignadas.\n2.\tEmitir conceptos jurídicos y proyectar los actos administrativos que de acuerdo al reparto y correspondiente asignación que para el efecto realice la Dirección Departamental para la Gestión del Riesgo de Desastres.\n3.\tRealizar acompañamiento al Director de Gestión del Riesgo de Desastres a las reuniones, comités, Consejos de Gestión del Riesgo y Junta Departamental de Bomberos, según requerimiento.\n4.\tEstar actualizado en la normatividad vigente jurídica sobre la materia y en las directrices que imponga la Unidad Nacional para la Gestión del Riesgo de desastres y la Oficina Jurídica del Departamento.\n5.\tSustanciar las respuestas por acciones administrativas judiciales donde se encuentre involucrada la Dirección Departamental para la Gestión del Riesgo de desastres.\n6.\tAtender los requerimientos de los entes de control que se presenten en la Dirección Departamental para la Gestión del Riesgo de desastres \n7.\tAsistir a reuniones audiencias, comités y demás actuaciones que sean indicados por la Dirección Departamental para la Gestión del Riesgo de desastres.\n8.\tLas demás que le sean asignadas y que correspondan al objeto contractual\n\n	COLMENA	COMPENSAR	PORVENIR
9	Edgardo Florez Iglesias	1129579145	33	M	Carrera 34 # 5B - 18	3002203100	Ingeniero Mecánico	edgardoflorez_87@hotmail.com	Automatización de procesos y equipos industriales	CONTRATO PRESTACION DE SERVICIOS	386 DE 2021	2023-02-02	1.\tAsistir a reuniones, comités, capacitaciones y demás que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento. \n2.\tRealizar visitas técnicas e informes de acuerdo con lo asignado por la Dirección en cumplimiento del objeto contractual. \n3.\tAsistir y participar en Comités Técnicos y demás reuniones a que haya lugar en los cuales se evaluará el estado de la maquinaria amarilla. \n4.\tMantener un registro diario (bitácora) de seguimiento al uso, direccionamiento y ubicación del total de la maquinaria asignada a la Dirección departamental para la gestión del riesgo de desastres. \n5.\tEvaluar el estado y funcionamiento de los equipos excavadoras y volquetas que conforman el banco de maquinaria amarilla asignado a la Dirección Departamental para la Gestión del riesgo de Desastres.\n6.\tPlanear y dirigir las actividades de mantenimiento preventivo y correctivo de la maquinaria amarilla.\n7.\tElaborar procedimientos para llevar a cabo el plan de inspecciones, en los que se indique el paso a paso de como ejecutarlos, cuáles son los valores de referencia, como registrar la información obtenida y como analizarla. \n8.\tParticipar en la planeación y ejecución de proyectos planteados por la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.\n9.\tMantener y actualizar la información técnica de la maquinaria amarilla.\n10.\tActualizar el inventario físico y en el sistema de todos los equipos y sus accesorios.\n11.\tRevisar constantemente los procedimientos de mantenimiento preventivo y los intervalos entre intervenciones para las maquinas estratégicas y críticas. \n12.\tElaborar los planes de renovación de las herramientas para la adecuada ejecución de los mantenimientos preventivos y correctivos.\n13.\tSupervisar y velar por el cumplimiento de los requerimientos de los mantenimientos y garantizar el cumplimiento de las normas de seguridad por parte de los contratistas. \n14.\tElaborar los informes periódicos de mantenimiento, en los que sobre todo se analizan los resultados del plan de mantenimiento. \n15.\tEstimar el tiempo y los materiales necesarios para realizar las labores de mantenimiento preventivo y correctivo de la maquinaria amarilla, realizando los respectivos presupuestos de costos. \n16.\tMantener contacto con proveedores de repuestos, insumos y herramientas.\n17.\tRealizar las solicitudes de pedidos de todos los insumos, herramientas y repuestos para la ejecución de los mantenimientos. \n18.\tBrindar información al jefe inmediato, del plan de mantenimiento y las actividades realizadas por parte del personal técnico externo.\n	Colmena	Sanitas	Protección
13	Nicole Estefania Cortes Galvis 	1125229562	26	F	Calle 7b N 44-05 	3105724778	Ing ambiental 	nicolecortes734@gmail.com		CONTRATO PRESTACION DE SERVICIOS	541	2021-06-03	1.\tApoyo a la supervisión de los contratos de la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.\n2.\tAsistir a reuniones, comités, capacitaciones y demás que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento. \n3.\tRealizar visitas técnicas e informes de acuerdo con lo asignado por la Dirección en cumplimiento del objeto contractual. \n4.\tApoyar visitas técnicas en desarrollo del balance de calamidades que se presenten en el Departamento del Meta.\n5.\tRealizar entrega periódica de todos los documentos proyectados en atención al desarrollo de sus obligaciones.\n6.\tApoyar la estructuración técnica de los proyectos que le sean asignados por la Dirección. \n7.\tApoyar en la revisión documental de los proyectos y programas de Gestión del Riesgo, formulados por los municipios o demás entidades y demás que le sean asignadas por la Dirección.\n8.\tApoyar en la actualización de los proyectos que sean indicados por la dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.\n9.\tApoyar a la realización y revisión de presupuestos, memorias de cantidades, especificaciones técnicas, Apus y su respectivo soporte de estudio de mercadeo, de los proyectos que le sean asignados por la dirección.\n10.\tMantener estricta reserva y confidencialidad sobre la información que conozca con ocasión de la ejecución del objeto contractual.\n11.\tObrar con lealtad y buena fe en las distintas actividades que realice.\n12.\tLas demás que le sean asignadas y correspondan al objeto contractual.\n13.\tPresentar informe mensual de actividades \n14.\tPresentar al finalizar el contrato los archivos digitales que proyecto durante la ejecución contractual al supervisor del contrato con visto bueno del Director Departamental para la Gestión del Riesgo de Desastres	Colmena 	Sanitas 	Porvenir 
14	Asley Fernando Espejo Diaz	80882602	35	M	Cra 30 # 4 - 66 - Sur Conj Remansos del Bosque Mz 5 C10	3014661058	Ingeniero Civil	asleyfer@gmail.com	Recursos Hidricos	CONTRATO PRESTACION DE SERVICIOS	859 de 2021	2023-02-04	1.\tAsistir a reuniones, comités, capacitaciones y demás que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.\n2.\tApoyo a la Supervisión de los contratos de la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.\n3.\tRealizar visitas técnicas de acuerdo con lo asignado por la Dirección en cumplimiento del objeto contractual\n4.\tUna vez realizada la visita técnica, deberá realizar un diagnóstico y el levantamiento de la problemática.\n5.\tRevisar y generar conceptos de Estudios Hidrológicos.\n6.\tRevisar y generar conceptos sobre Estudios y Diseños Hidráulicos.\n7.\tApoyar visitas técnicas en desarrollo del balance de calamidades que se presenten en el Departamento del Meta.\n8.\tRealizar entrega periódica de todos los documentos proyectados en atención al desarrollo de sus obligaciones.\n9.\tRealizar trabajos de análisis del terreno o inmuebles que se requieren por parte de la Dirección.\n10.\tParticipar en la definición de los estudios complementarios necesarios para los proyectos de obra.\n11.\tRealizar análisis de planos de proyectos de obra que requiera la Dirección.\n12.\tRealizar y aprobar estudios de prefactibilidad.\n13.\tRevisar y aprobar anteproyectos.\n14.\tApoyar en la realización y revisión de presupuestos, memorias de cantidades, especificaciones técnicas, Apus y su respectivo soporte de estudio de mercadeo, de los proyectos que le sean asignados por la Dirección.\n15.\tApoyar en la revisión documental de los proyectos y programas de Gestión del Riesgo, formulados por los municipios o demás entidades y demás que le sean asignados por la Dirección.\n16.\tApoyar en la actualización de los proyectos que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento\n17.\tMantener estricta reserva y confidencialidad sobre la información que conozca con ocasión de la ejecución del objeto contractual.\n18.\tObrar con lealtad y buena fe en las distintas actividades que realice\n19.\tLas demás que el sean asignadas y que correspondan al objeto contractual.\n20.\tPresentar informe mensual de actividades\n21.\tPresentar al finalizar el contrato los archivos digitales que proyecto durante la ejecución contractual al supervisor del contrato con visto bueno del Director Departamental para la Gestión del Riesgo de Desastres.	SEGUROS BOLIVAR	MEDIMAS 	COLPENSIONES 
15	Jhon edisson caicedo gonzalez	1121867388	30	M	Calle 34 #15-04 los sauces	3143751835	Ingeniero civil	jhonedissoncaicedo@hotmail.com		CONTRATO PRESTACION DE SERVICIOS	0662	2022-04-03	OBLIGACIONES ESPECÍFICAS:\n\n1.\tApoyo a la Supervisión de los contratos de la Dirección Departamental para la gestión del Riesgo de Desastres del Departamento.\n2.\tAsistir a reuniones, comités, capacitaciones y demás que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.\n3.\tRealizar visitas técnicas e informes de acuerdo con lo asignado por la Dirección en cumplimiento del objeto contractual. \n4.\tApoyar visitas técnicas en desarrollo del balance de calamidades que se presenten en el Departamento del Meta.\n5.\tRealizar entrega periódica de todos los documentos proyectados en atención al desarrollo de sus obligaciones.\n6.\tApoyar la estructuración técnica de los proyectos que le sean asignados por la Dirección.\n7.\tApoyar en la revisión documental de los proyectos y programa de gestión del Riesgo, formulados por los municipios o demás entidades y demás que le sean asignados por la Dirección. \n8.\tApoyar en la actualización de los proyectos que sean indicados por la dirección.\n9.\tApoyar en la realización y revisión de presupuestos, memorias de cantidades, especificaciones técnicas, Apus, y su respectivo soporte de estudio de mercadeo, de los proyectos que le sean asignados por la dirección.\n10.\tMantener estricta reserva y confidencialidad sobre la información que conozca con ocasión de la ejecución del objeto contractual. \n11.\tObrar con lealtad y buena fe en las distintas actividades que realice.\n12.\tLas demás que le sean asignadas y que correspondan al objeto contractual\n13.\tPresentar informe mensual de actividades.\n14.\tPresentar al finalizar el contrato los archivos digitales que proyecto durante la ejecución contractual al supervisor del contrato con visto bueno del Director Departamental para la gestión del Riesgo de Desastres.\n	Colmena	Nueva eps	Porvenir
16	YAMILE BAHAMON GARCIA	35264562	41	F	CRA. 10B # 24-21	3112377862	ABOGADO	yamilebg07@hotmail.com	DERECHO ADMINISTRATIVO	CONTRATO PRESTACION DE SERVICIOS	364 DE 2021	2023-02-02	1.\tAsesorar, proyectar y adelantar los procesos precontractuales, contractuales y postcontractuales que se surtan en la Dirección Departamental para la Gestión del Riesgo de Desastres.\n2.\tAtender respuestas a observaciones y realizar las evaluaciones jurídicas y actas de cierre de los procesos que se encuentran en página.\n3.\tMantener estricta reserva y confidencialidad sobre la información que conozca con ocasión de la ejecución del objeto contractual.\n4.\tAsistir a reuniones audiencias, comités contractuales y demás actuaciones que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.\n5.\tParticipar en la realización de mesas de trabajo, talleres que se efectúen con ocasión del desarrollo de las actividades relacionadas con el objeto del contrato.\n6.\tRevisar y hacer seguimiento al estado de los procesos precontractuales y contractuales encomendados sin interesar la modalidad o la cuantía.\n7.\tObrar con lealtad y buena fe en las distintas etapas contractuales.\n8.\tAsistir a las reuniones y comités de seguimiento y evaluación de la contratación que sean convocados a fin de tratar temas jurídicos relacionados con los asuntos o procesos contractuales\n9.\tRevisar las Liquidaciones, pagos parciales y anticipos de los procesos contractuales adelantados.\n10.\tEfectuar las Evaluaciones jurídicas en los Procesos contractuales que le sean asignados y que adelante la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento del Meta.\n11.\tEstar actualizado en la normatividad vigente jurídica sobre la materia y en las directrices que imponga la Unidad Nacional para la Gestión del Riesgo de Desastres y la Secretaría Jurídica del Departamento en materia de contratación.\n12.\tLas demás que sean asignadas y que correspondan al objeto contractual\n	POSITIVA SEGUROS	FAMISANAR EPS	COLPENSIONES
17	Gladys Yormary Dueñas Riveros	40186658	40	F	Calle 6Sur # 23-51, Conjunto Santa María 2 casa 2-17	3112029830	Abogada	yormydu@hotmail.com	Derecho Publico	CONTRATO PRESTACION DE SERVICIOS	357 DE 2021	2022-10-02	1.Proyectar las respuestas a los derechos de petición que lleguen a la Dirección para la gestión del riesgo de desastres.  \n2. Proyectar las respuestas a las solicitudes de quejas y reclamos allegados a la Dirección, para aprobación del Coordinador Departamental para la Gestión del Riesgo de Desastres. \n3. Asesorar y apoyar los convenios interadministrativos a suscribir con los organismos de Socorro (Cruz Roja, Defensa Civil y Bomberos). \n4. Participar en la realización de mesas de trabajo, talleres que se efectúen con ocasión del desarrollo de las actividades relacionadas con el objeto del contrato. \n5. Obrar con lealtad y buena fe en las distintas asesorías jurídicas. \n6. asesorar y brindar apoyo jurídico a la dirección departamental para la gestión del riesgo de desastres. \n7. Estar actualizado en la normatividad vigente jurídica sobre la materia y en las directrices que imponga la Unidad Nacional para la Gestión del Riesgo de Desastres. \n8. Participar en la implementación y desarrollo del Decálogo de capacidades mínimas de la Dirección Departamental para mejora en los procesos de conocimiento, reducción del riesgo y manejo del desastre. \n9. Obrar con lealtad y buena fe en las distintas actividades que realice.	Colmena	Sanitas	Porvenir
18	Jairo Alfonso Ospino Rodriguez	19266538	62	M	Calle 31 #17-87 Casa 315	3144742266	Medico	jospinor@meta.gov.co	Epidemiología	CONTRATO PRESTACION DE SERVICIOS	0441 de 2021	2021-01-03	1.\tRealizar análisis epidemiológico de la Covid-19 y transmitir información epidemiológica relacionada con Covid-19, al supervisor del contrato.\n2.\tApoyar cuando se requiera, las capacitaciones en temas epidemiológicos de la Covid- 19 a los equipos de voluntarios que apoyen la Gestión del Riesgo.\n3.\tAsesorar cuando sea necesario, en temas epidemiológicos de Covid-19, para la operación de los puestos de control.\n4.\tDireccionamiento de campañas publicitarias de medidas de cuidado frente al COVID-19.\n5.\tAsistir en representación de la Dirección de Gestión del Riesgo a la sala situacional SARS, cuando sea requerido.\n6.\tServir de enlace de la Dirección del Gestión del Riesgo y Desastres en temas epidemiológicos relacionado; con la COVID-19 con otras instituciones del orden Departamental y Municipal.\n7.\tApoyar y asistir a la dirección Departamental de Gestión del Riesgo en las reuniones relacionadas con el sistema de salud.\n	Colmena	NuevaEps	Colpensiones
19	Nelly morwno	40386753	52	F	Cra 26 #08-86Santa maria reservado 	3138898189	Abogada	nellymor1115@hotmail.com 	Derecho público y financiero 	CONTRATO PRESTACION DE SERVICIOS	395	2023-02-02	Apoyar la proyecciob de las rwpauestas a los derechos de petición que lleguen a la dirección para la Gestión del Riesgo de Desastres\n-proyectar las respuesta de las solicitudes de los consejos de gestión del riesgo y junta departamental d defensa civil del meta, según requerimiento.\n-proyectar conceptos jurídicos en los trámites administrativos en donde se requiera apoyo.\n-apoyar jurídicamente los profesionales de la Dirwcckob dnnlos trámites ange las demas entidades que tienen relación directa con las funciones de la entidad. \n-apoyar la proyecccion de las respuestas a las solicitudes de quejas ybreclamos allegafos a la dirección. Para aprobación del coordinador departamental para la gestión del riesgo de desastres. \n-participar en la realización de mesas de trabajo. Talleres que se efectúen con ocasion del desarrollo de las actividades relacionadas con el objeto del contrato. \n-obrar connlealtad y buena fe en las distintas asesorias juridicas. \n-asesorar y brindar apoyo juridico a la direccion departamental para la gestión del riesgo de desastres \n	Colmena	Sanitas	Porvenir 
22	Marianne Georgina Lemus Gonzalez	46380162	40	F	Carrera 13 36-115E	3204949590	Ingeniera Geologa	georginalemus@gmail.com	Gestión Ambiental	CONTRATO PRESTACION DE SERVICIOS	0396 de 2021	2021-01-03	1.\tRealizar visitas técnicas e informes de acuerdo con lo asignado por Ia Dirección Departamental pare la Gestión del riesgo de desastres.\n2.\tActualizar la base de datos relacionada con los puntos críticos por amenazas naturales en el departamento del Meta.\n3.\tBrindar asistencia técnica en gestión del riesgo de desastres, a los diferentes municipios cuando sea requerido.\n4.\tParticipar en Ia implementación y desarrollo del Decálogo de capacidades mínimas de la Dirección Departamental para mejora en los procesos de conocimiento, reducción del riesgo y manejo del desastre.\n5.\tApoyar Ia formulación de proyectos para reducción del riesgo de desastres en el departamento de meta.\n6.\tConformar equipos interdisciplinarios para gestión de proyectos.\n7.\tMantener estricta reserva y confidencialidad sobre la información que conozca con ocasión de Ia ejecución del objeto contractual.\n8.\tAsistir a reuniones, comités y demás actividades que sean asignadas por Ia Dirección.\n9.\tObrar con lealtad y buena fe en las distintas actividades que realice.\n10.\tLas demás que sean asignadas e inherentes al contrato.\n	Colmena	Nueva EPS	Colpensiones
23	MARTHA AMAYA AGUIRRE	23467273	50	F	Carrea 42 No.20-25	3112762961	Administrador de Empresas	marthaamaya@meta.gov.co		CONTRATO PRESTACION DE SERVICIOS	385-2021	2022-11-02	1.\tAsesorar y brindar apoyo en las actividades de la Dirección Departamental para la Gestión del Riesgo de Desastres.\n2.\tRealizar acompañamiento al Director de Gestión del Riesgo de Desastres a las reuniones, comités, Consejos de Gestión del Riesgo y demás que sean asignadas.\n3.\tBrindar apoyo y asesoría en la planeación, modificación y ajustes al Plan de Adquisiciones, plan Operativo anual de inversiones y plan de acción de la Dirección Departamental para la gestión del riesgo de desastres de acuerdo a los requerimientos de la Dirección.\n4.\tBrindar apoyo en el seguimiento financiero a la ejecución de los recursos del Fondo Departamental de Gestión del riesgo del Meta.\n5.\tElaboración de informes solicitados a la Dirección Departamental para la Gestión del Riesgo de Desastres, que le sean asignados \n6.\tCoordinar las acciones administrativas que se requieran para la ejecución de los procesos que desarrolle la Dirección.\n7.\tBrindar apoyo en el seguimiento al cumplimiento de la Metas de Plan de Desarrollo Departamental.\n8.\t Participar en la realización de mesas de trabajo, talleres que se efectúen con ocasión del desarrollo de las actividades relacionadas con el objeto del contrato.\n9.\tAsistir a reuniones, comités, capacitaciones y demás que sean indicados por la Dirección Departamental.\n10.\tParticipar en la implementación y desarrollo del Decálogo de capacidades mínimas de la Dirección Departamental para mejora en los procesos de conocimiento, reducción del riesgo y manejo del desastre.\n11.\tMantener estricta reserva y confidencialidad sobre la información que conozca con ocasión de la ejecución del objeto contractual.\n12.\tObrar con lealtad y buena fe en las distintas actividades que realice.\n13.\tLas demás que el sean asignadas y que correspondan al objeto contractual.\n\n	COLMENA	NUEVA EPS	COLPENSIONES
26	SANTIAGO DAVID	\N	\N	M	\N	\N	\N	santiagodavidt.23@gmail.com	\N	Contratista	\N	\N	[]	\N	\N	\N
5	Juanita schmitt	1018474709	26	F	Calle 47 A #28-10	3214527084	Arquitecta	jschmittro@hotmail.com	Gerencia de proyectos	Planta	0387 del 2021	2021-02-24	1. Apoyo a la supervisión de los contratos de la DIGERD2.Asisitir a reuniones, comités, capacitaciones y demás que sean indicados por la DIGERD3. Realizar visitas técnicas e informes de acuerdo con lo asignado por la DIGERD4. Apoyar visitas técnicas en desarrollo del balance de calamidades que se presenten en el departamento del meta 5. Realizar entrega periódica de todos los documentos proyectados en atención al desarrollo de sus obligaciones 6. Apoyar la estructuración técnica de los proyectos que le sean asignados por la dirección 7. Apoyar en la realización de presupuestos, memorias de cantidades, especificaciones técnicas, apus y su respectivo soporte de estudio de mercadeo, de los proyectos que le sean asignados 8. Apoyar en la actualización de los proyectos que sean indicados por la DIGERD9. Apoyar en la revisión documental de los proyectos y programas de la DIGERD10. Mantener estricta reserva y confidencialidad sobre la información que conozca en ocacion de la ejecución del objeto contractual11. Obrar con lealtad y buena fe en las distintas actividades que realice 12. Las demás que le sean asignadas y que correspondan al objeto contractual13. Presentar informe mensual de actividades 14. Presentar al finalizar el contrato los archivos digitales que proyectó durante la ejecución contractual al supervisor del contrato con victo bueno del director de la DIGERD	Colmena	Sanitas	Protección
12	freddy eliecer martinez agudelo	1121824033	34	M	calle 5 a sur N 40A-127 Amarillo Mapire	3175860792	Administrador de Empresas	freddymartinezag@hotmail.com	\N	Planta	0478 de 2021	2021-02-03	1. Apoyo en la elaboración de estudios de mercados que soportan la etapa precontractual en los diferentes procesos de contratación que desarrolla la Dirección Departamental para la Gestión del Riesgo de Desastres2. Realizar informes de acuerdo con lo asignado por la Dirección en cumplimiento del Objeto Contractual.3. Apoyar la proyección de análisis del sector.4.Apoyar las evaluaciones en los procesos de selección que le sean requeridos.5.Asistir a reuniones, comités, capacitaciones y demás que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.6.Participar en la implementación y desarrollo del Decálogo de capacidades mínimas de la Dirección Departamental para mejora en los procesos de conocimiento, reducción del riesgo y manejo de desastre.7.Obrar con lealtad y buena fe en las distintas actividades que realice.8.Presentar al finalizar el contrato los archivos digitales que proyecto durante la ejecución contractual.9.Las demás que le sean asignadas y que correspondan al objeto contractual.	SURA	SANITAS	PORVENIR
27	MANUEL ALEJANDRO SANCHEZ ESGUERRA	86084688	37	M	POPULAR	3204102438	INGENIERO CIVIL	ing.manuel.esguerra10@gmail.com	SUELOS	Contratista	612 DEL 2021	2021-03-12	\N	POSITIVA	SANITAS	COLPENSIONES
28	SANTIAGO NICOLAS DE LA PAVA	1032473203	25	M	\N	\N	\N	delapava.santiago@gmail.com	\N	Contratista	848 de 2021	2021-04-22	[]	\N	\N	\N
29	WILLIAM ALEXANDER ROJAS PARRA	86.058.258	37	M	calle 19B No. 17-20 Barrio Sausalito	3209992280	ADMINISTRADOR PUBLICO	williamrojasap@gmail.com	\N	Contratista	809 de 2021	2021-04-16	PRESTACION DE SERVICIOS PROFESIONALES COMO ADMINISTRADOR PUBLICO PARA BRINDAR APOYO Y ASISTENCIA LOGISTICA Y OPERATIVA PARA LA IMPLMENTACION DE MEDIDAS ADMINISTRATIVAS QUE SE REQUIEREN EN LA DIRECCION DEPARTAMENTAL PARA LA GESTION DEL RIESGO DE DESASTRES.	\N	\N	\N
30	Dario Caballero	86071537	35	M	\N	314 2742877	INGENIERO CIVIL	dariocaballeroh@gmail.com	ESTRUCTURAS	Contratista	0886-2021	2021-05-07	funcio	POSITIVA	SANITAS	COLPENSIONES
7	Claudia Rocio Aparicio Duran	35264635	40	F	Calle 47Bis No. 27-35 Caudal Oriental	3124578841	Ingeniero Electrónico	claudiaaparicioduran@gmail.com	Formulación y Evaluación de Proyectos	Contratista	0905 de 2021	2021-12-05	1.\tAsistir a reuniones, comités, capacitaciones y demás que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.2.\tApoyo a la Supervisión de los contratos de la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.3.\tRealizar visitas técnicas e informes de acuerdo con lo asignado por la Dirección en cumplimiento del objeto contractual4.\tDar respuesta oportuna a los derechos de petición que le sean asignados.5.\tRealizar entrega periódica de todos los documentos proyectados en atención al desarrollo de sus obligaciones.6.\tApoyar en la revisión de presupuestos, memorias de cantidades, especificaciones técnicas, Apus y su respectivo soporte de estudio de mercadeo, de los proyectos que le sean asignados por la Dirección.7.\tApoyar en la revisión documental de los proyectos y programas de Gestión del Riesgo, formulados por los municipios o demás entidades y demás que le sean asignados por la Dirección.8.\tApoyar en la elaboración, revisión, formulación y actualización de los proyectos que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento, en cumplimiento de las Metas del Plan de Desarrollo Hagamos Grande al Meta 2020-2023.9.\tApoyar y consolidar la información en el instrumento de seguimiento, a proyectos de inversión SPI de los proyectos de la Dirección de Gestión del riesgo de desastres, en cumplimiento de las Metas del Plan de Desarrollo Hagamos Grande al Meta 2020-2023.10.\tCargue de información necesaria de los proyectos, en las plataformas de SUIP y MGA11.\tPresentar informe mensual de actividades.12.\tMantener estricta reserva y confidencialidad sobre la información que conozca con ocasión de la ejecución del objeto contractual.13.\tObrar con lealtad y buena fe en las distintas actividades que realice14.\tLas demás que el sean asignadas y que correspondan al objeto contractual.15.\tPresentar al finalizar el contrato los archivos digitales que proyecto durante la ejecución contractual al supervisor del contrato con visto bueno del Director Departamental para la Gestión del Riesgo de Desastres	Colmena	Medimas	Colpensiones
36	DIEGO ARMANDO HERNANDEZ NONTILLA	1121870365	\N	M	\N	3143319553	INGENIERO CIVIL	ing.diegoahernandez@gmail.com	\N	Contratista	1374	2021-08-04	[]	\N	\N	\N
37	DIANA MARCELA PATIÑO COLORADO	1121840570	\N	F	\N	3014851701	\N	ingeniera.diana23@outlook.com	\N	Contratista	1368	2021-08-03	[]	\N	\N	\N
31	JUAN DAVID ROMERO HERRERA	1121883635	\N	M	\N	3123133273	PROFESIONAL EN SALUD OCUPACIONAL	j.davidromeroh@gmail.com	\N	Contratista	1463	2021-08-22	[]	\N	\N	\N
32	JUAN SEBASTIAN LOPEZ PRIETO	1121892967	\N	M	\N	3188711058	INGENIERO AMBIENTAL	ingsebastianlopez@gmail.com	\N	Contratista	1342	2021-08-04	[]	\N	\N	\N
33	ERIKA MAYERLIS GARAY RUIZ	1121890174	\N	F	\N	3156831463	ADMINISTRADOR DE EMPRESAS	erika_8299@hotmail.com	\N	Contratista	1484	2021-08-13	[]	\N	\N	\N
34	WILLIAM DAVID VALENCIA GONZALEZ	1234788445	\N	M	\N	3103061525	INGENIERO CIVIL	davidvalenciag@live.com	\N	Contratista	1373	2021-08-06	[]	\N	\N	\N
35	ALEXA LISBETH MORENO LADINO	1122649492	\N	F	\N	3174355958	INGENIERO CIVIL	alemoreno0801@gmail.com	\N	Contratista	1062	2021-07-09	[]	\N	\N	\N
38	Luis Alejandro Peña	\N	\N	M	\N	\N	\N	lap142@hotmail.com	\N	Contratista	\N	\N	[]	\N	\N	\N
\.


--
-- Data for Name: informes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.informes (id_informe, id_funcionario, inicio, fin, elaboracion, numero, observaciones, aprobado, archivo) FROM stdin;
1	1	2021-06-16	2021-07-27	2021-06-24	001	Prueba	0	[]
\.


--
-- Data for Name: inventario_entrada; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.inventario_entrada (id_inventario_entrada, fecha, id_tipo_ayuda, cantidad, origen_ayuda) FROM stdin;
8	2021-07-07	2	753	CONTRATO 985 DE 2021
9	2021-08-10	6	1220	Unidad Nacional
10	2021-08-10	4	1400	Unidad nacional
11	2021-08-10	5	1400	Unidad nacional
\.


--
-- Data for Name: inventario_salida; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.inventario_salida (id_inventario_salida, id_entidad, fecha, id_emergencia) FROM stdin;
4	\N	2021-07-02	\N
5	\N	2021-07-26	\N
7	\N	2021-07-15	\N
8	1	2021-07-14	\N
9	\N	2021-08-11	\N
10	\N	2021-08-18	\N
11	\N	2021-08-25	\N
\.


--
-- Data for Name: inversiones; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.inversiones (id_inversion, descripcion, valor, fecha, id_emergencia) FROM stdin;
1	Compra de material	400000000	2021-05-05	1
2	Sin descripcion	200000	2021-07-12	13
4	compra de bienes	2000000	2021-07-22	18
6	compra de biens	1000000	2021-07-22	17
7	Compra de viveres	2000000	2021-08-01	19
8	Compra de insumos	3000000	2021-08-01	19
\.


--
-- Data for Name: mantenimientos; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.mantenimientos (id_mantenimiento, id_maquinaria, fecha, costo, horas, proveedor, valor_factura, numero_factura, numero_folio, tipo_mantenimiento) FROM stdin;
1	2	2021-05-12	123123123	12	aaa	2223333.00	123	\N	\N
2	2	2021-06-02	154254221	\N	banano	154254221.00	321	\N	\N
3	16	2021-06-02	250000	\N	banano	45251.00	321	\N	PREVENTIVO
\.


--
-- Data for Name: maquinaria; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.maquinaria (id_maquinaria, marca, capacidad, presupuesto, ubicacion, descripcion, activa, linea, serial, "año_asignacion", placa, observaciones, info) FROM stdin;
1	John Deere	1tonelada	20000000	Villavicencio	Tractor	1	\N	\N	\N	\N	\N	\N
2	INTERNATIONAL	25000	\N	\N	CAMABAJA	1	WORKSTAR 7600 SBA 6X4	3HSWYAHT8EN014421	2014	\N		\N
3	CHEVROLET	7000	\N	\N	VOLQUETA	1	FTR	9GDFTR341EB032856	2014	\N		\N
4	CHEVROLET	7000	\N	\N	VOLQUETA	1	FTR	9GDFTR346EB032125	2014	\N		\N
5	CHEVROLET	7000	\N	\N	VOLQUETA	1	FTR	9GDFTR344EB032124	2014	\N		\N
6	CHEVROLET	7000	\N	\N	VOLQUETA	1	FTR	9GDFTR340EB032122	2014	\N		\N
7	LINKBELT	20000	\N	\N	EXCAVADORA SOBRE ORUGAS	1	210X2	LBX210Q5NDHEX2179	2014	\N		\N
8	LINKBELT	20000	\N	\N	EXCAVADORA SOBRE ORUGAS	1	210X2	LBX210Q5NDHEX2180	2014	\N		\N
9	LINKBELT	20000	\N	\N	EXCAVADORA SOBRE ORUGAS	1	210X2	LBX210Q5NDHEX2181	2014	\N		\N
10	LINKBELT	20000	\N	\N	EXCAVADORA SOBRE ORUGAS	1	210X2	LBX210Q5NDHEX2182	2014	\N		\N
11	LINKBELT	20000	\N	\N	EXCAVADORA SOBRE ORUGAS	1	210X2	LBX210Q5NDHEX2183	2014	\N		\N
12	CATERPILLAR	20000	\N	\N	RETROEXCAVADORA SOBRE LLANTAS	0	416E	CAT0416EPMFG08585	2014	\N	PRESENTA FALLAS MECANICAS	\N
13	CATERPILLAR	5000	\N	\N	BULLDOZER	0	D6K	CAT00D6KHFBH02764	2014	\N	PRESENTA FALLAS MECANICAS	\N
14	CATERPILLAR	5000	\N	\N	BULLDOZER	1	D6K	CAT00D6KEFBH02765	2014	\N		\N
15	CATERPILLAR	5000	\N	\N	BULLDOZER	0	D6K	CAT00D6KCFBH02766	2014	\N	PRESENTA FALLAS MECANICAS	\N
16	MAZDA	1000	\N	\N	CAMIONETA 4X4	1	BT-50	9FJUN84W0F0207097	2014	OJT172	\N	\N
\.


--
-- Data for Name: medios; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.medios (id_medio, id_emergencia, descripcion, archivo, tipo) FROM stdin;
\.


--
-- Data for Name: menu_items; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.menu_items (id, menu_id, title, url, target, icon_class, color, parent_id, "order", created_at, updated_at, route, parameters) FROM stdin;
6	1	Menu Builder		_self	voyager-list	\N	5	1	2021-05-24 14:41:56	2021-05-24 15:35:30	voyager.menus.index	\N
7	1	Database		_self	voyager-data	\N	5	2	2021-05-24 14:41:56	2021-05-24 15:35:30	voyager.database.index	\N
8	1	Compass		_self	voyager-compass	\N	5	3	2021-05-24 14:41:56	2021-05-24 15:35:30	voyager.compass.index	\N
9	1	BREAD		_self	voyager-bread	\N	5	4	2021-05-24 14:41:56	2021-05-24 15:35:30	voyager.bread.index	\N
14	1	Hooks		_self	voyager-hook	\N	5	5	2021-05-24 14:41:56	2021-05-24 15:35:30	voyager.hooks	\N
4	1	Roles		_self	voyager-lock	\N	15	2	2021-05-24 14:41:56	2021-05-24 15:35:40	voyager.roles.index	\N
10	1	Settings		_self	voyager-settings	\N	5	6	2021-05-24 14:41:56	2021-05-24 15:35:44	voyager.settings.index	\N
1	1	Dashboard		_self	fa fa-tachometer	#000000	\N	1	2021-05-24 14:41:56	2021-05-24 15:46:21	voyager.dashboard	null
3	1	Usuarios		_self	voyager-person	#000000	15	1	2021-05-24 14:41:56	2021-05-24 15:48:34	voyager.users.index	null
5	1	Tools		_self	voyager-tools	\N	\N	2	2021-05-24 14:41:56	2021-05-25 03:37:29	\N	\N
26	1	Maquinaria		_self	fa fa-cogs	\N	18	1	2021-05-25 11:51:51	2021-05-25 12:26:17	voyager.maquinaria.index	\N
28	1	Mantenimientos		_self	voyager-hammer	\N	18	2	2021-05-25 12:00:29	2021-05-25 12:26:26	voyager.mantenimientos.index	\N
30	1	Emergencias		_self	voyager-lifebuoy	\N	16	1	2021-05-25 12:04:39	2021-05-25 12:27:10	voyager.emergencias.index	\N
24	1	Tipos Emergencia		_self	fa fa-medkit	\N	17	1	2021-05-25 11:43:02	2021-05-25 12:26:40	voyager.tipos-emergencia.index	\N
35	1	Inventario Entradas		_self	fa fa-sign-in	\N	34	1	2021-05-28 04:26:15	2021-05-28 04:33:18	voyager.inventario-entrada.index	\N
36	1	Inventario Salidas		_self	fa fa-sign-out	#000000	34	2	2021-05-28 04:32:25	2021-05-28 04:33:35	voyager.inventario-salida.index	null
42	1	Municipios		_self	fa fa-map	\N	43	1	2021-06-30 18:56:13	2021-06-30 19:13:01	voyager.municipios.index	\N
44	1	Calamidad publica		_self	fa fa-crosshairs	#000000	43	2	2021-06-30 19:23:13	2021-06-30 19:27:45	voyager.calamidad.index	null
47	1	Ayudas disponibles	disponibilidad	_self	fa fa-shopping-basket	#000000	34	3	2021-07-13 03:37:48	2021-07-13 03:38:02	\N	
23	1	Entidades		_self	fa fa-medkit	\N	16	2	2021-05-25 11:41:07	2021-07-16 17:42:24	voyager.entidades.index	\N
50	1	Contenidos de sitio		_self	fa fa-file-code-o	\N	51	3	2021-07-16 17:35:33	2021-07-16 17:38:23	voyager.site-content.index	\N
43	1	Municipios		_self	fa fa-building-o	#000000	\N	9	2021-06-30 19:12:54	2021-07-16 17:43:45	\N	
46	1	Reportes	/reportes	_self	fa fa-print	#000000	\N	10	2021-07-07 07:14:31	2021-07-16 17:43:45	\N	
49	1	Paginas de Sitio		_self	voyager-world	\N	51	2	2021-07-16 17:32:44	2021-07-16 17:38:05	voyager.site-pages.index	\N
22	1	Tipos Acta		_self	voyager-documentation	\N	17	2	2021-05-25 11:39:31	2021-07-16 17:37:51	voyager.tipos-acta.index	\N
15	1	Administración		_self	fa fa-key	#000000	\N	3	2021-05-24 15:35:23	2021-07-16 17:43:44	\N	
16	1	Emergencias		_self	fa fa-ambulance	#000000	\N	4	2021-05-25 03:27:45	2021-07-16 17:43:44	\N	
29	1	Seguimientos Maquinaria		_self	fa fa-calendar-check-o	\N	18	3	2021-05-25 12:02:49	2021-07-16 17:40:17	voyager.seguimientos-maquinaria.index	\N
17	1	Parametros		_self	fa fa-cubes	#000000	\N	5	2021-05-25 03:28:48	2021-07-16 17:43:44	\N	
48	1	Plantillas Web		_self	fa fa-safari	\N	51	1	2021-07-16 17:30:18	2021-07-16 17:37:54	voyager.site-templates.index	\N
53	1	Plantilla de Sitio	/admin/site-templates	_self	fa fa-safari	#000000	5	7	2021-07-16 17:41:33	2021-07-16 17:42:27	\N	
54	1	Paginas del Sitio	/admin/site-pages	_self	voyager-world	#000000	5	9	2021-07-16 17:43:04	2021-07-16 17:44:06	\N	
52	1	Contenido de sitio	/admin/site-content	_self	fa fa-file-code-o	#000000	5	8	2021-07-16 17:39:58	2021-07-16 17:42:27	\N	
18	1	Maquinaria		_self	fa fa-truck	#000000	\N	6	2021-05-25 03:30:17	2021-07-16 17:43:44	\N	
19	1	Funcionarios		_self	fa fa-users	#000000	\N	7	2021-05-25 03:30:54	2021-07-16 17:43:44	\N	
34	1	Inventarios		_self	fa fa-inbox	#000000	\N	8	2021-05-28 04:24:36	2021-07-16 17:43:45	\N	
38	1	Visitas		_self	fa fa-binoculars	\N	16	4	2021-05-28 14:53:16	2021-07-19 03:15:47	voyager.visitas.index	\N
20	1	Funcionarios		_self	fa fa-address-card	#000000	19	2	2021-05-25 03:35:18	2021-07-19 03:15:50	voyager.funcionarios.index	null
21	1	Actividades		_self	fa fa-briefcase	\N	19	3	2021-05-25 03:44:17	2021-07-19 03:15:50	voyager.actividades.index	\N
31	1	Obligaciones		_self	fa fa-clock-o	\N	19	4	2021-05-27 17:06:27	2021-07-19 03:15:50	voyager.obligaciones.index	\N
27	1	Tipos Ayudas		_self	fa fa-stethoscope	\N	17	3	2021-05-25 11:57:40	2021-07-19 03:15:50	voyager.tipos-ayuda.index	\N
25	1	Tipos Actividades		_self	fa fa-puzzle-piece	#000000	17	4	2021-05-25 11:45:14	2021-07-19 03:15:50	voyager.tipos-actividad.index	null
37	1	Actas de Reunion		_self	fa fa-handshake-o	\N	19	1	2021-05-28 13:57:06	2021-07-19 03:15:50	voyager.actas-reunion.index	\N
40	1	Informes		_self	fa fa-flag-checkered	\N	19	5	2021-06-17 16:59:12	2021-07-19 03:15:50	voyager.informes.index	\N
41	1	Proyectos		_self	fa fa-paper-plane	\N	19	6	2021-06-28 01:58:28	2021-07-19 03:15:50	voyager.proyectos.index	\N
\.


--
-- Data for Name: menus; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.menus (id, name, created_at, updated_at) FROM stdin;
1	admin	2021-05-24 14:41:56	2021-05-24 14:41:56
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	2014_10_12_000000_create_users_table	1
2	2014_10_12_100000_create_password_resets_table	1
3	2016_01_01_000000_add_voyager_user_fields	1
4	2016_01_01_000000_create_data_types_table	1
5	2016_05_19_173453_create_menu_table	1
6	2016_10_21_190000_create_roles_table	1
7	2016_10_21_190000_create_settings_table	1
8	2016_11_30_135954_create_permission_table	1
9	2016_11_30_141208_create_permission_role_table	1
10	2016_12_26_201236_data_types__add__server_side	1
11	2017_01_13_000000_add_route_to_menu_items_table	1
12	2017_01_14_005015_create_translations_table	1
13	2017_01_15_000000_make_table_name_nullable_in_permissions_table	1
14	2017_03_06_000000_add_controller_to_data_types_table	1
15	2017_04_21_000000_add_order_to_data_rows_table	1
16	2017_07_05_210000_add_policyname_to_data_types_table	1
17	2017_08_05_000000_add_group_to_settings_table	1
18	2017_11_26_013050_add_user_role_relationship	1
19	2017_11_26_015000_create_user_roles_table	1
20	2018_03_11_000000_add_user_settings	1
21	2018_03_14_000000_add_details_to_data_types_table	1
22	2018_03_16_000000_make_settings_value_nullable	1
23	2019_08_19_000000_create_failed_jobs_table	1
24	2016_01_01_000000_create_pages_table	2
25	2016_01_01_000000_create_posts_table	2
26	2016_02_15_204651_create_categories_table	2
27	2017_04_11_000000_alter_post_nullable_fields_table	2
\.


--
-- Data for Name: municipios; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.municipios (id_municipio, nombre, funcionario, direccion, email, telefono, documentos, localizacion) FROM stdin;
178	Acacías	\N	\N	\N	\N	\N	3.9166667,-73.8333333
187	Barranca de Upía	\N	\N	\N	\N	\N	4.5755556,-72.9611111
192	Cabuyaro	\N	\N	\N	\N	\N	4.2902778,-72.7905556
186	Castilla La Nueva	\N	\N	\N	\N	\N	3.8,-73.5833333
189	Cubarral	\N	\N	\N	\N	\N	3.7713889,-73.8377778
168	Cumaral	\N	\N	\N	\N	\N	4.25,-73.3333333
188	El Calvario	\N	\N	\N	\N	\N	4.4166667,-73.6666667
172	El Castillo	\N	\N	\N	\N	\N	3.5680556,-73.7838889
191	El Dorado	\N	\N	\N	\N	\N	2.7791667,-72.8719444
184	Fuente de Oro	\N	\N	\N	\N	\N	3.4594444,-73.6127778
169	Granada	\N	\N	\N	\N	\N	3.5386111,-73.7005556
190	Guamal	\N	\N	\N	\N	\N	3.9166667,-74
185	La Macarena	\N	\N	\N	\N	\N	2.8536111,-73.9436111
175	La Uribe	\N	\N	\N	\N	\N	3.254,-74.358
167	Lejanías	\N	\N	\N	\N	\N	3.5136111,-74.0516667
173	Mapiripán	\N	\N	\N	\N	\N	2.8911111,-72.1322222
170	Mesetas	\N	\N	\N	\N	\N	3.3780556,-74.0447222
177	Puerto Concordia	\N	\N	\N	\N	\N	2.6794444,-72.7608333
183	Puerto Gaitán	\N	\N	\N	\N	\N	4.3141667,-72.0825
181	Puerto López	\N	\N	\N	\N	\N	4.0833333,-72.9666667
179	Puerto Rico	\N	\N	\N	\N	\N	2.9383333,-73.2083333
182	San Carlos de Guaroa	\N	\N	\N	\N	\N	3.7122222,-73.2436111
165	San Juan de Arama	\N	\N	\N	\N	\N	3.3463889,-73.8894444
174	San Juanito	\N	\N	\N	\N	\N	4.4586111,-73.6730556
166	San Martín	\N	\N	\N	\N	\N	3.7,-73.7
180	Villavicencio	\N	\N	\N	\N	\N	4.1533333,-73.635
176	Vista Hermosa	\N	\N	\N	\N	\N	3.0863889,-73.7513889
193	Puerto Lleras	\N	\N	\N	\N	\N	4.0833333,-72.9666667\n
171	Restrepo	Pedro Perez	Vereda Caney Medio	restrepo@meta.gov.co	3103333333	[{"download_link":"municipios\\/July2021\\/0Jp9RbSe2Dx41Orxha3C.pdf","original_name":"reporte.pdf"},{"download_link":"municipios\\/July2021\\/7g9EKFSP2Ih2ZQqnguW0.pdf","original_name":"marzojuanfajardo.pdf"}]	4.1666667,-73.4166667
\.


--
-- Data for Name: obligaciones; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.obligaciones (id_obligacion, id_funcionario, descripcion) FROM stdin;
1	2	[]
2	11	Asesora de Despacho
3	20	CONCEPTOS TÉCNICOS
4	20	 DERECHOS DE PETICIÓN
5	20	 VISITAS TÉCNICAS.
6	21	Enlace DIGERD con Secretaría de Salud
30	8	OBLIGACIONES ESPECÍFICAS:\n1.\tAsesorar y representar a la Dirección Departamental para la Gestión del Riesgo de desastres en todas las actuaciones que le sean asignadas.\n2.\tEmitir conceptos jurídicos y proyectar los actos administrativos que de acuerdo al reparto y correspondiente asignación que para el efecto realice la Dirección Departamental para la Gestión del Riesgo de Desastres.\n3.\tRealizar acompañamiento al Director de Gestión del Riesgo de Desastres a las reuniones
31	8	 comités
32	8	 Consejos de Gestión del Riesgo y Junta Departamental de Bomberos
33	8	 según requerimiento.\n4.\tEstar actualizado en la normatividad vigente jurídica sobre la materia y en las directrices que imponga la Unidad Nacional para la Gestión del Riesgo de desastres y la Oficina Jurídica del Departamento.\n5.\tSustanciar las respuestas por acciones administrativas judiciales donde se encuentre involucrada la Dirección Departamental para la Gestión del Riesgo de desastres.\n6.\tAtender los requerimientos de los entes de control que se presenten en la Dirección Departamental para la Gestión del Riesgo de desastres \n7.\tAsistir a reuniones audiencias
34	8	 comités y demás actuaciones que sean indicados por la Dirección Departamental para la Gestión del Riesgo de desastres.\n8.\tLas demás que le sean asignadas y que correspondan al objeto contractual\n\n
27	6	3. Realizar visitas técnicas e informes de acuerdo con lo asignado por la Dirección en cumplimiento del objeto contractual.
26	6	4. Apoyar visitas técnicas en desarrollo del balance de calamidades que se presenten en el Departamento del Meta.
8	3	BRINDAR ASISTENCIA TECNICA A MUNICIPIOS EN TEMAS RELACIONADOS CON GESTION DEL RIESGO
7	3	RECEPCIONAR INFORMES DE EMERGENCIAS REPORTADAS POR LOS MUNICPIOS A TRAVES DE CUALQUIER MEDIO
24	6	6.\tApoyar la estructuración técnica de los proyectos que le sean asignados por la Dirección.
23	6	7.Apoyar la revisión documental de los proyectos y programas de Gestión del Riesgo, formulados por los municipios o demás entidades y demás que le sean asignados por la Dirección.
22	6	8.\tApoyar en la actualización de los proyectos que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.
28	6	2. Asistir a reuniones, comités, capacitaciones y demás que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.
25	6	5. Realizar entrega periódica de todos los documentos proyectados en atención al desarrollo de las obligaciones.
36	9	18. Realizar las solicitudes de pedidos de todos los insumos, herramientas y repuestos para la ejecución de los mantenimientos.
35	9	19. Brindar información al jefe inmediato, del plan de mantenimiento y las actividades realizadas por parte del personal técnico externo.
55	7	1.\tAsistir a reuniones
56	7	 comités
57	7	 capacitaciones y demás que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.2.\tApoyo a la Supervisión de los contratos de la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.3.\tRealizar visitas técnicas e informes de acuerdo con lo asignado por la Dirección en cumplimiento del objeto contractual4.\tDar respuesta oportuna a los derechos de petición que le sean asignados.5.\tRealizar entrega periódica de todos los documentos proyectados en atención al desarrollo de sus obligaciones.6.\tApoyar en la revisión de presupuestos
58	7	 memorias de cantidades
59	7	 especificaciones técnicas
60	7	 Apus y su respectivo soporte de estudio de mercadeo
61	7	 de los proyectos que le sean asignados por la Dirección.7.\tApoyar en la revisión documental de los proyectos y programas de Gestión del Riesgo
62	7	 formulados por los municipios o demás entidades y demás que le sean asignados por la Dirección.8.\tApoyar en la elaboración
63	7	 revisión
64	7	 formulación y actualización de los proyectos que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento
65	7	 en cumplimiento de las Metas del Plan de Desarrollo Hagamos Grande al Meta 2020-2023.9.\tApoyar y consolidar la información en el instrumento de seguimiento
66	7	 a proyectos de inversión SPI de los proyectos de la Dirección de Gestión del riesgo de desastres
67	7	 en cumplimiento de las Metas del Plan de Desarrollo Hagamos Grande al Meta 2020-2023.10.\tCargue de información necesaria de los proyectos
68	7	 en las plataformas de SUIP y MGA11.\tPresentar informe mensual de actividades.12.\tMantener estricta reserva y confidencialidad sobre la información que conozca con ocasión de la ejecución del objeto contractual.13.\tObrar con lealtad y buena fe en las distintas actividades que realice14.\tLas demás que el sean asignadas y que correspondan al objeto contractual.15.\tPresentar al finalizar el contrato los archivos digitales que proyecto durante la ejecución contractual al supervisor del contrato con visto bueno del Director Departamental para la Gestión del Riesgo de Desastres
48	13	2. Asistir a reuniones, comités, capacitaciones y demás que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.
50	13	4. Apoyar visitas técnicas en desarrollo del balance de calamidades que se presenten en el Departamento del Meta.
51	13	5. Realizar entrega periódica de todos los documentos proyectados en atención al desarrollo de sus obligaciones.
52	13	6. Apoyar la estructuración técnica de los proyectos que le sean asignados por la Dirección.
53	13	7.Apoyar en la revisión documental de los proyectos y programas de Gestión del Riesgo, formulados por los municipios o demás entidades y demás que le sean asignadas por la Dirección.
54	13	8. Apoyar en la actualización de los proyectos que sean indicados por la dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.
46	9	08. Elaborar procedimientos para llevar a cabo el plan de inspecciones, en los que se indique el paso a paso de como ejecutarlos, cuáles son los valores de referencia, como registrar la información obtenida y como analizarla.
44	9	10. Mantener y actualizar la información técnica de la maquinaria amarilla.
43	9	11. Actualizar el inventario físico y en el sistema de todos los equipos y sus accesorios.
42	9	12. Revisar constantemente los procedimientos de mantenimiento preventivo y los intervalos entre intervenciones para las maquinas estratégicas y críticas.
41	9	13. Elaborar los planes de renovación de las herramientas para la adecuada ejecución de los mantenimientos preventivos y correctivos.
40	9	14. Supervisar y velar por el cumplimiento de los requerimientos de los mantenimientos y garantizar el cumplimiento de las normas de seguridad por parte de los contratistas.
39	9	15. Elaborar los informes periódicos de mantenimiento, en los que sobre todo se analizan los resultados del plan de mantenimiento.
38	9	16. Estimar el tiempo y los materiales necesarios para realizar las labores de mantenimiento preventivo y correctivo de la maquinaria amarilla, realizando los respectivos presupuestos de costos.
37	9	17. Mantener contacto con proveedores de repuestos, insumos y herramientas.
70	14	Participar en la definición de los estudios complementarios necesarios para los proyectos de obra.
69	14	Realizar análisis de planos de proyectos de obra que requiera la Dirección.
78	15	OBLIGACIONES ESPECÍFICAS:\n\n1.\tApoyo a la Supervisión de los contratos de la Dirección Departamental para la gestión del Riesgo de Desastres del Departamento.\n2.\tAsistir a reuniones
79	15	 comités
80	15	 capacitaciones y demás que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.\n3.\tRealizar visitas técnicas e informes de acuerdo con lo asignado por la Dirección en cumplimiento del objeto contractual. \n4.\tApoyar visitas técnicas en desarrollo del balance de calamidades que se presenten en el Departamento del Meta.\n5.\tRealizar entrega periódica de todos los documentos proyectados en atención al desarrollo de sus obligaciones.\n6.\tApoyar la estructuración técnica de los proyectos que le sean asignados por la Dirección.\n7.\tApoyar en la revisión documental de los proyectos y programa de gestión del Riesgo
81	15	 formulados por los municipios o demás entidades y demás que le sean asignados por la Dirección. \n8.\tApoyar en la actualización de los proyectos que sean indicados por la dirección.\n9.\tApoyar en la realización y revisión de presupuestos
82	15	 memorias de cantidades
83	15	 especificaciones técnicas
84	15	 Apus
85	15	 y su respectivo soporte de estudio de mercadeo
86	15	 de los proyectos que le sean asignados por la dirección.\n10.\tMantener estricta reserva y confidencialidad sobre la información que conozca con ocasión de la ejecución del objeto contractual. \n11.\tObrar con lealtad y buena fe en las distintas actividades que realice.\n12.\tLas demás que le sean asignadas y que correspondan al objeto contractual\n13.\tPresentar informe mensual de actividades.\n14.\tPresentar al finalizar el contrato los archivos digitales que proyecto durante la ejecución contractual al supervisor del contrato con visto bueno del Director Departamental para la gestión del Riesgo de Desastres.\n
95	17	3.\tAsesorar y apoyar los convenios interadministrativos a suscribir con los organismos de Socorro (Cruz Roja, Defensa Civil y Bomberos).
94	17	4.\tParticipar en la realización de mesas de trabajo, talleres que se efectúen con ocasión del desarrollo de las actividades relacionadas con el objeto del contrato.
171	17	9.\tMantener estricta reserva y confidencialidad sobre la información que conozca con ocasión de la ejecución del objeto contractua
93	17	5.\tObrar con lealtad y buena fe en las distintas asesorías jurídicas
184	27	6.\tRevisar y generar conceptos sobre estudios de suelos.
91	16	2.\tAtender respuestas a observaciones y realizar las evaluaciones jurídicas y actas de cierre de los procesos que se encuentran en página
90	16	3.\tMantener estricta reserva y confidencialidad sobre la información que conozca con ocasión de la ejecución del objeto contractual.
89	16	4.\tAsistir a reuniones audiencias, comités contractuales y demás actuaciones que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.
88	16	5.\tParticipar en la realización de mesas de trabajo, talleres que se efectúen con ocasión del desarrollo de las actividades relacionadas con el objeto del contrato.
87	16	6.\tRevisar y hacer seguimiento al estado de los procesos precontractuales y contractuales encomendados sin interesar la modalidad o la cuantía.
77	14	Asistir a reuniones, comités, capacitaciones y demás que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.
76	14	Apoyo a la Supervisión de los contratos de la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.
75	14	Realizar visitas técnicas de acuerdo con lo asignado por la Dirección en cumplimiento del objeto contractual.
74	14	Una vez realizada la visita técnica, deberá realizar un diagnóstico y el levantamiento de la problemática.
73	14	Revisar y generar conceptos de Estudios Hidrológicos.
72	14	Apoyar visitas técnicas en desarrollo del balance de calamidades que se presenten en el Departamento del Meta. Realizar entrega periódica de todos los documentos proyectados en atención al desarrollo de sus obligaciones.
71	14	Realizar trabajos de análisis del terreno o inmuebles que se requieren por parte de la Dirección.
98	18	1.\tRealizar análisis epidemiológico de la Covid-19 y transmitir información epidemiológica relacionada con Covid-19
99	18	 al supervisor del contrato.\n2.\tApoyar cuando se requiera
100	18	 las capacitaciones en temas epidemiológicos de la Covid- 19 a los equipos de voluntarios que apoyen la Gestión del Riesgo.\n3.\tAsesorar cuando sea necesario
101	18	 en temas epidemiológicos de Covid-19
102	18	 para la operación de los puestos de control.\n4.\tDireccionamiento de campañas publicitarias de medidas de cuidado frente al COVID-19.\n5.\tAsistir en representación de la Dirección de Gestión del Riesgo a la sala situacional SARS
29	6	1. Apoyo a la Supervisión de los contratos de la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.
173	19	- Proyectar la respuesta de las solicitudes de los Consejos de Gestión del Riesgo y Junta Departamental de Defensa Civil del Meta, según requerimiento
103	18	 cuando sea requerido.\n6.\tServir de enlace de la Dirección del Gestión del Riesgo y Desastres en temas epidemiológicos relacionado; con la COVID-19 con otras instituciones del orden Departamental y Municipal.\n7.\tApoyar y asistir a la dirección Departamental de Gestión del Riesgo en las reuniones relacionadas con el sistema de salud.\n
110	23	1.\tAsesorar y brindar apoyo en las actividades de la Dirección Departamental para la Gestión del Riesgo de Desastres.\n2.\tRealizar acompañamiento al Director de Gestión del Riesgo de Desastres a las reuniones
111	23	 comités
112	23	 Consejos de Gestión del Riesgo y demás que sean asignadas.\n3.\tBrindar apoyo y asesoría en la planeación
113	23	 modificación y ajustes al Plan de Adquisiciones
114	23	 plan Operativo anual de inversiones y plan de acción de la Dirección Departamental para la gestión del riesgo de desastres de acuerdo a los requerimientos de la Dirección.\n4.\tBrindar apoyo en el seguimiento financiero a la ejecución de los recursos del Fondo Departamental de Gestión del riesgo del Meta.\n5.\tElaboración de informes solicitados a la Dirección Departamental para la Gestión del Riesgo de Desastres
115	23	 que le sean asignados \n6.\tCoordinar las acciones administrativas que se requieran para la ejecución de los procesos que desarrolle la Dirección.\n7.\tBrindar apoyo en el seguimiento al cumplimiento de la Metas de Plan de Desarrollo Departamental.\n8.\t Participar en la realización de mesas de trabajo
116	23	 talleres que se efectúen con ocasión del desarrollo de las actividades relacionadas con el objeto del contrato.\n9.\tAsistir a reuniones
117	23	 comités
118	23	 capacitaciones y demás que sean indicados por la Dirección Departamental.\n10.\tParticipar en la implementación y desarrollo del Decálogo de capacidades mínimas de la Dirección Departamental para mejora en los procesos de conocimiento
119	23	 reducción del riesgo y manejo del desastre.\n11.\tMantener estricta reserva y confidencialidad sobre la información que conozca con ocasión de la ejecución del objeto contractual.\n12.\tObrar con lealtad y buena fe en las distintas actividades que realice.\n13.\tLas demás que el sean asignadas y que correspondan al objeto contractual.\n\n
120	26	[]
107	22	9.\tObrar con lealtad y buena fe en las distintas actividades que realice.
126	5	9.\tApoyar en la actualización de los proyectos que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.
125	5	10.\tMantener estricta reserva y confidencialidad sobre la información que conozca con ocasión de la ejecución del objeto contractual.
124	5	11.\tObrar con lealtad y buena fe en las distintas actividades que realice.
122	5	13.\tPresentar informe mensual de actividades.
121	5	14.\tPresentar al finalizar el contrato los archivos digitales que proyecto durante la ejecución contractual al supervisor del contrato con visto bueno del Director Departamental para la Gestión del Riesgo de Desastres.
106	22	10.\tLas demás que sean asignadas e inherentes al contrato.
96	17	2.\tProyectar las respuestas a las solicitudes de quejas y reclamos allegados a la Dirección, para aprobación del Coordinador Departamental para la Gestión del Riesgo de Desastres.
109	22	7.\tMantener estricta reserva y confidencialidad sobre la información que conozca con ocasión de Ia ejecución del objeto contractual.
108	22	8.\tAsistir a reuniones, comités y demás actividades que sean asignadas por Ia Dirección.
97	17	1.\tProyectar las respuestas a los derechos de petición que lleguen a la Dirección para la gestión del riesgo de desastres.
179	27	1. Apoyo a la supervision de los contratos de la Direccion Departamental para la Gestion del Riesgo de Desastres del departamento
180	27	2. Apoyo al planeacion, formulacion, estructuracion, revision y/o ajuste de los diseños cantidades de obra y presupuesto de los proyectos
182	27	4.\tUna vez realizada la visita técnica, deberá realizar un diagnóstico y el levantamiento de la problemática.
183	27	5.\tRealizar actividades de revisión, proyección y emitir conceptos respecto al área de suelos
185	27	7.\tRevisión técnica a documentos que hacen parte del tránsito administrativo de los contratos en ejecución.
186	27	8.\tEmitir conceptos profesionales solicitados por el Director Departamental para la Gestión del Riesgo de desastres para la ejecución de las obras.
187	27	9.\tRealizar trabajos de análisis del terreno o inmuebles que se requieren por parte de la Dirección.
188	27	10.\tObrar con lealtad y buena fe en las distintas actividades que realice
189	27	11.\tLas demás que el sean asignadas y que correspondan al objeto contractual.
190	27	12.\tPresentar informe mensual de actividades
230	12	3.\tApoyar la proyección de análisis del sector.
132	6	9.\tApoyar en la realización y revisión de presupuestos, memorias de cantidades, especificaciones técnicas, Apus y su respectivo soporte de estudio de mercadeo, de los proyectos que le sean asignados por la Dirección.
133	6	10.\tMantener estricta reserva y confidencialidad sobre la información que conozca con ocasión de la ejecución del objeto contractual.
134	6	11.\tObrar con lealtad y buena fe en las distintas actividades que realice
135	6	12.\tLas demás que el sean asignadas y que correspondan al objeto contractual.
136	6	13.\tPresentar informe mensual de actividades.
137	6	14.\tPresentar al finalizar el contrato los archivos digitales que proyecto durante la ejecución contractual al supervisor del contrato con visto bueno del Director Departamental para la Gestión del Riesgo de Desastres.
156	5	6.\tApoyar la estructuración técnica de los proyectos que le sean asignados por la Dirección.
138	6	OBLIGACIONES ESPECIFICAS.
178	19	- Asesorar y brindar apoyo jurídico a la Dirección Departamental para la Gestión del Riesgo de Desastres.
177	19	- Participar en la realización de mesas de trabajo, talleres que se efectúen con ocasión del desarrollo de las actividades relacionadas con el objeto del contrato.
174	19	- Proyectar conceptos jurídicos en los trámites administrativos en donde se requiera apoyo.
176	19	- Apoyar la proyección de lrespuestas a las solicitudes de quejas y reclamos allegados a la Dirección, para aprobación del Coordinador Departamental para la Gestión del Riesgo de Desastres.
139	3	ELABORACION DE CONSOLIDADO DE AFECTACIONES
140	3	APOYO JURIDICO A CUALQUIER REQUERIMIENTO
157	5	5.\tRealizar entrega periódica de todos los documentos proyectados en atención al desarrollo de sus obligaciones.
141	3	ASISTENCIA A REUNIONES Y COMITES ASIGNADOS POR EL DIRECTOR
143	4	1.\tAsistir a reuniones, comités, capacitaciones y demás que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento
144	4	2.\tApoyar a la dirección en actividades de conectividad digital para los consejos departamentales de riesgos realizados
145	4	3.\tRealizar implementación y control de bases de datos para el manejo y consolidación de información de la Dirección Departamental Para La Gestión Del Riesgo De Desastres.
146	3	CONSTESTACION DERECHOS DE PETICION
147	4	4.\tApoyo en la logística necesaria que se requiera en las actividades de inventarios, activos de la dirección departamental para la gestión del riesgo de desastres.
148	4	5.\tApoyo a las actividades relacionadas con los sistemas informáticos de la dirección departamental para la gestión del riesgo de desastres.
149	4	6.\tPlanear y dirigir la formulación de proyectos de adquisición de software para la gestión integral de la Dirección.
150	4	7.\tParticipar en la planeación y ejecución de proyectos planteados por la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento
142	3	REALIZAR SOBREVUELOS CON DRON SEGUN DIRECTRIZ DEL DIRECTOR
152	4	8.\tObrar con lealtad y buena fe en las distintas actividades que realice
153	4	9.\tDar cumplimiento a las demás funciones que le sean asignadas y que correspondan al objeto contractual.
154	3	REALIZAR INFORME DE EMERGENCIA ANTE LA UNIDAD NACIONAL, REPORTES DIARIOS Y CUANDO SEAN NECESARIOS
123	5	12.\tLas demás que el sean asignadas y que correspondan al objeto contractual.
127	5	8.\tApoyar en la revisión documental de los proyectos y programas de Gestión del Riesgo, formulados por los municipios o demás entidades y demás que le sean asignados por la Dirección.
151	5	7.\tApoyar en la realización de presupuestos, memorias de cantidades, especificaciones técnicas, Apus y su respectivo soporte de estudio de mercadeo, de los proyectos que le sean asignados por la Dirección.
158	5	4.\tApoyar visitas técnicas en desarrollo del balance de calamidades que se presenten en el Departamento del Meta.
159	5	3.\tRealizar visitas técnicas e informes de acuerdo con lo asignado por la Dirección en cumplimiento del objeto contractual.
160	5	2.\tAsistir a reuniones, comités, capacitaciones y demás que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.
161	5	1.\tApoyo a la supervision de los contratos de la Direccion Departamental para la Gestion del Riesgo de Desasastres del Departamento.
167	22	1.\tRealizar visitas técnicas e informes de acuerdo con lo asignado por Ia Dirección Departamental pare la Gestión del riesgo de desastres.
166	22	2.\tActualizar la base de datos relacionada con los puntos críticos por amenazas naturales en el departamento del Meta.
165	22	3.\tBrindar asistencia técnica en gestión del riesgo de desastres, a los diferentes municipios cuando sea requerido.
164	22	4.\tParticipar en Ia implementación y desarrollo del Decálogo de capacidades mínimas de la Dirección Departamental para mejora en los procesos de conocimiento, reducción del riesgo y manejo del desastre.
163	22	5.\tApoyar Ia formulación de proyectos para reducción del riesgo de desastres en el departamento de meta.
162	22	6.\tConformar equipos interdisciplinarios para gestión de proyectos.
168	17	6.\tAsesorar y brindar apoyo jurídico a la Dirección Departamental para la Gestión del Riesgo de Desastres.
169	17	7.\tEstar actualizado en la normatividad vigente jurídica sobre la materia y en las directrices que imponga la Unidad Nacional para la Gestión del Riesgo de Desastres
170	17	8.\tParticipar en la implementación y desarrollo del decálogo de capacitaciones mínimas de la Dirección para la Gestión del Riesgo de Desastres para mejora en los procesos de conocimiento, reducción del riesgo y manejo de desastres.
155	3	CONSOLIDACION DE DOCUMENTOS DE MUNICPIOS EN CASO DE PRESENTARSE DECLARATORIA DE CALAMIDAD PUBLICA
128	12	9.\tLas demás que le sean asignadas y que correspondan al objeto contractual.
129	12	8.\tPresentar al finalizar el contrato los archivos digitales que proyecto durante la ejecución contractual.
130	12	7.\tObrar con lealtad y buena fe en las distintas actividades que realice.
191	27	13.\tPresentar al finalizar el contrato los archivos digitales que proyecto durante la ejecución contractual al supervisor del contrato con visto bueno del Director Departamental para la Gestión del Riesgo de Desastres
181	27	3. Realizar seguimiento tecnico de los contratos asignados para el apoyo a la supervision desde el inciio hasta el proceso de liquidacion, proyectar oficios de los requerimientos, comites de obra, visitas de obra, infomrs de supervision
47	13	1.\tApoyo a la supervisión de los contratos de la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.
49	13	3.  Realizar visitas técnicas e informes de acuerdo con lo asignado por la Dirección en cumplimiento del objeto contractual.
192	13	9. Apoyar a la realización y revisión de presupuestos, memorias de cantidades, especificaciones técnicas, Apus y su respectivo soporte de estudio de mercadeo, de los proyectos que le sean asignados por la dirección.
193	13	10. Mantener estricta reserva y confidencialidad sobre la información que conozca con ocasión de la ejecución del objeto contractual.
194	13	11. Obrar con lealtad y buena fe en las distintas actividades que realice.
195	13	12. Las demás que le sean asignadas y correspondan al objeto contractual.
196	13	13. Presentar informe mensual de actividades
197	13	14. Presentar al finalizar el contrato los archivos digitales que proyecto durante la ejecución contractual al supervisor del contrato con visto bueno del Director Departamental para la Gestión del Riesgo de Desastres
92	16	1. Asesorar, proyectar y adelantar los procesos precontractuales, contractuales y postcontractuales que se surtan en la Dirección Departamental para la Gestión del Riesgo de Desastres.
198	16	7.\tObrar con lealtad y buena fe en las distintas etapas contractuales.
199	16	8.\tAsistir a las reuniones y comités de seguimiento y evaluación de la contratación que sean convocados a fin de tratar temas jurídicos relacionados con los asuntos o procesos contractuales
200	16	9.\tRevisar las Liquidaciones, pagos parciales y anticipos de los procesos contractuales adelantados.
201	16	10.\tEfectuar las Evaluaciones jurídicas en los Procesos contractuales que le sean asignados y que adelante la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento del Meta.
202	16	11.\tEstar actualizado en la normatividad vigente jurídica sobre la materia y en las directrices que imponga la Unidad Nacional para la Gestión del Riesgo de Desastres y la Secretaría Jurídica del Departamento en materia de contratación.
203	16	12.\tLas demás que sean asignadas y que correspondan al objeto contractual
215	10	3.\tRealizar visitas técnicas e informes de acuerdo con lo asignado por la Dirección en cumplimiento del objeto contractual
216	10	4.\tApoyar visitas técnicas en desarrollo del balance de calamidades que se presenten en el Departamento del Meta.
217	10	5.\tRealizar entrega periódica de todos los documentos proyectados en atención al desarrollo de sus obligaciones.
218	10	6.\tApoyar la estructuración de los proyectos que le sean asignados por la Dirección.
219	10	7.\tApoyar en la realización de presupuestos, memorias de cantidades, especificaciones técnicas, Apus y su respectivo soporte de estudio de mercadeo, de los proyectos que le sean asignados por la Dirección.
220	10	8.\tApoyar en el cargue de información necesaria para la viabilización de los proyectos, en las plataformas de SUIT y MGA
221	10	9.\tApoyar en la revisión documental de los proyectos y programas de Gestión del Riesgo, formulados por los municipios o demás entidades y demás que le sean asignados por la Dirección.
222	10	10.\tApoyar en la actualización de los proyectos que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento
223	10	11.\tMantener estricta reserva y confidencialidad sobre la información que conozca con ocasión de la ejecución del objeto contractual.
224	10	12.\tObrar con lealtad y buena fe en las distintas actividades que realice
225	10	13.\tLas demás que el sean asignadas y que correspondan al objeto contractual.
226	10	14.\tPresentar informe mensual de actividades
227	10	15.\tPresentar al finalizar el contrato los archivos digitales que proyecto durante la ejecución contractual al supervisor del contrato con visto bueno del Director Departamental para la Gestión del Riesgo de Desastre
214	10	2.\tApoyo a la Supervisión de los contratos de la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.
213	10	1.\tAsistir a reuniones, comités, capacitaciones y demás que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.
228	12	5.\tAsistir a reuniones, comités, capacitaciones y demás que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.
131	12	6.\tParticipar en la implementación y desarrollo del Decálogo de capacidades mínimas de la Dirección Departamental para mejora en los procesos de conocimiento, reducción del riesgo y manejo de desastre.
232	12	1.\tApoyo en la elaboración de estudios de mercados que soportan la etapa precontractual en los diferentes procesos de contratación que desarrolla la Dirección Departamental para la Gestión del Riesgo de Desastres.
231	12	2.\tRealizar informes de acuerdo con lo asignado por la Dirección en cumplimiento del objeto contractual.
229	12	4.\tApoyar las evaluaciones en los procesos de selección que le sean requeridos.
233	26	1. Apoyo a la Supervisión de los contratos de la Dirección Departamental para la gestión del Riesgo de Desastres del Departamento.
234	14	Realizar análisis de planos de proyectos de obra que requiera la Dirección.
235	14	Revisar y aprobar anteproyectos.
236	14	Apoyar en la realización y revisión de presupuestos, memorias de cantidades, especificaciones técnicas, Apus y su respectivo soporte de estudio de mercadeo, de los proyectos que le sean asignados por la Dirección.
237	14	Apoyar en la revisión documental de los proyectos y programas de Gestión del Riesgo, formulados por los municipios o demás entidades y demás que le sean asignados por la Dirección.
238	14	Apoyar en la actualización de los proyectos que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.
239	14	Mantener estricta reserva y confidencialidad sobre la información que conozca con ocasión de la ejecución del objeto contractual.
240	14	Obrar con lealtad y buena fe en las distintas actividades que realice
241	14	Las demás que el sean asignadas y que correspondan al objeto contractual.
242	14	Presentar informe mensual de actividades
243	14	Presentar al finalizar el contrato los archivos digitales que proyecto durante la ejecución contractual al supervisor del contrato con visto bueno del Director Departamental para la Gestión del Riesgo de Desastres.
244	14	Revisar y generar conceptos sobre Estudios y Diseños Hidráulicos.
245	30	Apoyar en la realización y revisión de presupuestos, memorias de cantidades, mesas técnicas, Apus y su respectivo soporte de estudio de mercadeo de los proyectos asignados por la Dirección.
205	9	07.\tPlanear y dirigir las actividades de mantenimiento preventivo y correctivo de la maquinaria amarilla.
207	9	05. Mantener un registro diario (bitácora) de seguimiento al uso, direccionamiento y ubicación del total de la maquinaria asignada a la Dirección departamental para la gestión del riesgo de desastres.
208	9	04. Asistir y participar en Comités Técnicos y demás reuniones a que haya lugar en los cuales se evaluará el estado de la maquinaria amarilla.
209	9	03. Realizar visitas técnicas e informes de acuerdo con lo asignado por la Dirección en cumplimiento del objeto contractual.
210	9	02. Realizar el apoyo a la supervisión de los contratos que tengan relación directa con la adquisición y mantenimiento de la maquinaria amarilla.
246	30	11.\tApoyar en la revisión documental de los proyectos y programas de Gestión del riesgo, por los municipios o demás entidades y demás que le sean asignados por el Director.
247	30	12.\tApoya en la actualización de los proyectos que sean indicados por la Dirección para la Gestión del Riesgo de Desastres del Departamento.
248	30	17.\tPresentar al finalizar el contrato los archivos digitales que proyecto durante la ejecución contractual al supervisor del contrato con visto bueno del Director Departamental para la Gestión del Riesgo de Desastres.
249	30	16.\tPresentar informe mensual de actividades.
250	26	2. Asistir a reuniones, comités, capacitaciones y demás que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.
251	26	3. Realizar visitas técnicas e informes de acuerdo con lo asignado por la Dirección en cumplimiento del objeto contractual.
252	26	4. Apoyar visitas técnicas en desarrollo del balance de calamidades que se presenten en el Departamento del Meta.
253	26	5. Realizar entrega periódica de todos los documentos proyectados en atención al desarrollo de sus obligaciones.
254	26	6. Apoyar la estructuración técnica de los proyectos que le sean asignados por la Dirección.
255	26	7. Apoyar en la revisión documental de los proyectos y programa de gestión del Riesgo, formulados por los municipios o demás entidades y demás que le sean asignados por la Dirección.
256	26	8. Apoyar en la actualización de los proyectos que sean indicados por la dirección.
257	26	9. Apoyar en la realización y revisión de presupuestos, memorias de cantidades, especificaciones técnicas, Apus, y su respectivo soporte de estudio de mercadeo, de los proyectos que le sean asignados por la dirección.
258	26	10. Mantener estricta reserva y confidencialidad sobre la información que conozca con ocasión de la ejecución del objeto contractual.
259	26	11. Obrar con lealtad y buena fe en las distintas actividades que realice.
260	26	12. Las demás que le sean asignadas y que correspondan al objeto contractual
261	26	13. Presentar informe mensual de actividades.
262	26	14. Presentar al finalizar el contrato los archivos digitales que proyecto durante la ejecución contractual al supervisor del contrato con visto bueno del Director Departamental para la gestión del Riesgo de Desastres.
263	1	Otras obligaciones
264	17	10.\tObrar con lealtad y buena fe en las distintas actividades que realice
265	17	11.\tLas demás que el sean asignadas y que correspondan al objeto contractual
266	17	12.\tPresentar informe mensual de actividades
267	17	13.\tPresentar al finalizar el contrato los archivos digitales que proyecto durante la ejecución contractual al supervisor del contrato con visto bueno del Director Departamental para la Gestión del Riesgo de Desastres
268	1	Asistencia a capacitaciones
172	19	-Participar en la implementación y desarrollo del decálogo de capacitaciones mínimas de la Dirección para la Gestión del Riesgo de Desastres para mejora en los procesos de conocimiento, reducción del riesgo y manejo de desastres.
175	19	- Apoyar jurídicamente los profesionales de la Dirección en los trámites ante las demás entidades que tienen relación directa con las funciones de la entidad.
269	19	- Apoyar la proyección de las respuestas a los derechos de petición que lleguen a la Dirección para la gestión del riesgo de desastres.
211	9	01. Asistir a reuniones, comités, capacitaciones y demás que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.
45	9	09. Participar en la planeación y ejecución de proyectos planteados por la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.
206	9	06. Evaluar el estado y funcionamiento de los equipos excavadoras y volquetas que conforman el banco de maquinaria amarilla asignado a la Dirección Departamental para la Gestión del riesgo de Desastres.
270	31	1.\tRealizar la verificación del cumplimiento de seguridad ocupacional de los trabajadores que participan en la ejecución de los contratos que suscriba la dirección departamental, diferentes a la prestación de servicios profesionales o de apoyo a la gestión
271	31	2.\tAdministrar y custodiar el archivo masivo activo o de gestión, el archivo físico inactivo y los medios magnéticos que se deban entregar al archivo departamental.
272	31	3.\tEntregar las carpetas que contienen la información documental a la oficina de asuntos contractuales o al archivo departamental.
273	31	4.\tRecoger y entregar los documentos que le sean solicitados, en el lugar que se le indique.
274	31	5.\tHacer la recepción y verificación inicial de los documentos entregados para custodia y administración.
275	31	6.\tAlmacenar y custodiar los documentos entregadas para custodia y administración.
276	31	7.\tRecuperar, realizar devoluciones y consulta física y digital de los documentos entregadas para custodia y administración.
277	31	8.\tMantener estricta reserva y confidencialidad sobre la información que conozca con ocasión de la ejecución del objeto contractual.
278	31	9.\tObrar con lealtad y buena fe en las distintas actividades que realice
279	31	10.\tLas demás que el sean asignadas y que correspondan al objeto contractual.
280	31	11.\tPresentar informe mensual de actividades
281	31	12.\tPresentar al finalizar el contrato los archivos digitales y físicos, que proyectó durante la ejecución contractual con visto bueno del Supervisor y del Director Departamental para la Gestión del Riesgo de Desastres
284	34	Realizar visitas técnicas e informes de acuerdo con lo asignado por la Dirección en cumplimiento del objeto contractual
285	34	Recopilar información relacionada con puntos críticos en el departamento del Meta
286	34	Recopilar  información  geográfica  frente  a  los  diferentes  escenarios  del  riesgo  del Departamento
287	34	Realizar acompañamiento a los municipios en relación a puntos críticos para la actualización del PDGRD
290	34	Actuar de buena fe y diligentemente para con el supervisor del departamento y de la Gobernación del Meta; teniendo en cuenta que el Contratista se considera un colaborador del Estado en el cumplimiento de los fines sociales que busca la contratación, acorde con el estatuto contractual.  Por lo cual, además deberá avisar oportunamente de aquellos aspectos que puedan generar obstáculo para el desarrollo de la prestación del servicio.
282	34	Asistir  a  reuniones,  comités,  capacitaciones  y  demás  que  sean  indicados  por  la Dirección Departamental para la Gestión del Riesgo de Desastres
283	34	Apoyo a la Supervisión de los contratos de la Dirección Departamental para la Gestión del Riesgo de Desastres.
288	34	Asistir  a mesas  de trabajo  con municipios  y diferentes entidades  del  orden  territorial para la socialización de proyectos  que hacen parte del PDGRD.
289	34	Proyectar  solicitudes  de  información  a  las  diferentes entidades jurídicas  de  orden nacional,  Departamental y Municipal, privadas o públicas.
291	34	Asistir  a las diferentes reuniones,  mesas  de trabajo  y capacitaciones que se realicen dentro del marco del proceso de actualización  del PDGRD
292	34	Mantener estricta  reserva  y confidencialidad  sobre  la  información que  conozca  con ocasión de la ejecución del objeto contractual.
293	34	Obrar con lealtad y buena fe en las distintas actividades que realice
294	34	Las demás que le sean asignadas  y que correspondan al objeto contractual.
295	34	Presentar informe mensual de actividades.
296	34	Presentar al finalizar el contrato los archivos digitales que proyecto durante la ejecución contractual al supervisor del contrato con visto  bueno del Director Departamental para la Gestión del Riesgo de Desastres
297	34	\N
298	34	\N
299	34	\N
300	34	\N
301	34	\N
302	21	Formular proyectos de inversión en la metodología establecida por el Departamento Nacional de Planeación.
303	21	Participar en la formulación y seguimiento a planes y programas
304	21	Realizar análisis y estudios y preparar los informes de acuerdo con las instrucciones recibidas.
305	21	Proyectar, desarrollar y recomendar las acciones que deban adoptarse para el logro de los objetivos y metas propuestas.
306	21	Estudiar, evaluar y conceptuar sobre temas de la dependencia y absolver consultas de acuerdo a su competencia.
307	21	Apoyar la formulación y el seguimiento de los planes de mejoramiento que sean de competencia del área o proceso en donde desempeña sus labores.
308	21	Operativizar eficientemente los procesos, actividades y tareas a su cargo.
309	21	Supervisar de manera continua la eficacia de los controles asociados a los procesos, actividades y tareas a su cargo.
310	21	Desarrollar la autoevaluación permanente a los resultados de su labor en el área administrativa a la cual pertenezca.
311	21	Tomar acciones que permitan realizar el ejercicio del autocontrol en los procesos, actividades y tareas a su cargo.
312	21	.  Liderar procesos y coordinar grupos de trabajo, conforme a los requerimientos
313	21	Realizar actividades en las etapas precontractual, contractual y postcontractual de los procesos de la entidad.
314	21	Dar aplicabilidad al sistema integrado de gestión y ejecutar acciones para su mantenimiento y fortalecimiento.
315	21	Cumplir las demás funciones que le asigne la autoridad competente, acordes con la naturaleza del empleo.
316	20	Dar respuesta a las peticiones
317	32	1. Apoyo a la Supervisión de los contratos de la Dirección Departamental para la gestión del Riesgo de Desastres
318	32	2. Asistir a reuniones, comités, capacitaciones y demás que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres
319	32	3. Realizar visitas técnicas e informes de acuerdo con lo asignado por la Dirección en cumplimiento del objeto contractual.
320	32	4. Apoyar visitas técnicas en desarrollo del balance de calamidades que se presenten en el Departamento del Meta
321	32	5. Apoyar en las actividades que se presenten en el desarrollo del balance de calamidades que se presenten en el Departamento del Meta
322	32	6. Realizar entrega periódica de todos los documentos proyectados en atención al desarrollo de sus obligaciones
323	32	7. Apoyar la estructuración técnica de los proyectos que le sean asignados por la Dirección
324	32	8. Apoyar en la revisión documental de los proyectos y programas de Gestión del Riesgo, formulados por los municipios o demás entidades y demás que le sean asignados por la Dirección
325	32	9. Apoyar en la formulación de planes de manejo ambiental de los proyectos que sean indicados por la Direccion Departamental para la Gestión del Riesgo de Desastres
326	32	10. Apoyar en la actualización de los proyectos que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres
327	32	11. Apoyar en la realización y revisión de presupuestos, memorias de cantidades, especificaciones técnicas, Apus y su respectivo soporte de estudio de mercadeo, de los proyectos que le sean asignados por la Dirección
328	32	12. Mantener estricta reserva y confidencialidad sobre la información que conozca con ocasión de la ejecución del objeto contractual
329	32	13. Obrar con lealtad y buena fe en las distintas actividades que realice
330	32	14. Las demás que le sean asignadas y que correspondan al objeto contractual
331	32	15. Presentar informe mensual de actividades
332	32	16. Presentar al finalizar el contrato los archivos digitales y físicos, que proyectó durante la ejecución contractual con visto bueno del Supervisor y del Director Departamental para la Gestión del Riesgo de Desastres
333	9	REVISAR LOS DOCUMENTOS ASIGNADOS POR LA DIRECCIÓN Y DAR EL RESPECTIVO TRAMITE SEGUN CORRESPONDA
334	36	Dar respuesta a las peticiones
\.


--
-- Data for Name: pages; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.pages (id, author_id, title, excerpt, body, image, slug, meta_description, meta_keywords, status, created_at, updated_at) FROM stdin;
1	0	Hello World	Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.	<p>Hello World. Scallywag grog swab Cat o'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>	pages/page1.jpg	hello-world	Yar Meta Description	Keyword1, Keyword2	ACTIVE	2021-05-24 14:41:56	2021-05-24 14:41:56
\.


--
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.password_resets (email, token, created_at) FROM stdin;
\.


--
-- Data for Name: permission_role; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.permission_role (permission_id, role_id) FROM stdin;
1	1
6	1
7	1
8	1
9	1
10	1
11	1
12	1
13	1
14	1
15	1
16	1
17	1
18	1
19	1
20	1
21	1
22	1
23	1
24	1
25	1
26	1
27	1
28	1
29	1
30	1
31	1
32	1
33	1
34	1
35	1
36	1
37	1
38	1
39	1
40	1
42	1
43	1
44	1
45	1
46	1
47	1
48	1
49	1
50	1
51	1
1	3
2	3
3	3
4	3
5	3
41	3
6	3
7	3
8	3
9	3
10	3
11	3
12	3
13	3
14	3
15	3
16	3
17	3
18	3
19	3
20	3
21	3
22	3
23	3
24	3
25	3
26	3
27	3
28	3
29	3
30	3
31	3
32	3
33	3
34	3
35	3
36	3
37	3
38	3
39	3
40	3
42	3
43	3
44	3
45	3
46	3
47	3
48	3
49	3
50	3
51	3
1	4
42	4
43	4
47	4
48	4
49	4
50	4
52	1
53	1
54	1
55	1
56	1
57	1
58	1
59	1
60	1
61	1
62	1
63	1
64	1
65	1
66	1
67	1
68	1
69	1
70	1
71	1
72	1
73	1
74	1
75	1
76	1
77	1
78	1
79	1
80	1
81	1
82	1
83	1
84	1
85	1
86	1
87	1
88	1
89	1
90	1
91	1
92	1
93	1
94	1
95	1
96	1
52	4
53	4
57	4
58	4
59	4
60	4
62	4
63	4
67	4
68	4
70	4
72	4
73	4
74	4
75	4
77	4
78	4
80	4
82	4
83	4
84	4
85	4
87	4
88	4
90	4
92	4
93	4
94	4
95	4
97	1
98	1
99	1
100	1
101	1
97	4
98	4
99	4
100	4
102	1
103	1
104	1
105	1
106	1
107	1
108	1
109	1
110	1
111	1
112	1
113	1
114	1
115	1
116	1
117	1
118	1
119	1
120	1
121	1
122	1
123	1
124	1
125	1
126	1
127	1
128	1
129	1
130	1
131	1
1	5
92	5
93	5
94	5
95	5
52	3
53	3
54	3
55	3
56	3
57	3
58	3
59	3
60	3
61	3
62	3
63	3
64	3
65	3
66	3
67	3
68	3
69	3
70	3
71	3
72	3
73	3
74	3
75	3
76	3
77	3
78	3
79	3
80	3
81	3
82	3
83	3
84	3
85	3
86	3
87	3
88	3
89	3
90	3
91	3
92	3
93	3
94	3
95	3
96	3
97	3
98	3
99	3
100	3
101	3
102	3
103	3
104	3
105	3
106	3
107	3
108	3
109	3
110	3
111	3
112	3
113	3
114	3
115	3
116	3
117	3
118	3
119	3
120	3
121	3
122	3
123	3
124	3
125	3
126	3
127	3
128	3
129	3
130	3
131	3
132	1
133	1
134	1
135	1
136	1
132	4
133	4
134	4
135	4
132	3
133	3
134	3
135	3
136	3
137	1
138	1
139	1
140	1
141	1
137	3
138	3
139	3
140	3
141	3
137	4
138	4
139	4
140	4
141	4
142	1
143	1
144	1
145	1
146	1
142	3
143	3
144	3
145	3
146	3
142	5
143	5
144	5
147	1
148	1
149	1
150	1
151	1
147	3
148	3
149	3
150	3
151	3
147	5
148	5
149	5
150	5
152	1
153	1
154	1
155	1
156	1
157	1
158	1
159	1
160	1
161	1
162	1
163	1
164	1
165	1
166	1
152	3
153	3
154	3
155	3
156	3
157	3
158	3
159	3
160	3
161	3
162	3
163	3
164	3
165	3
166	3
2	1
3	1
4	1
5	1
41	1
\.


--
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.permissions (id, key, table_name, created_at, updated_at) FROM stdin;
1	browse_admin	\N	2021-05-24 14:41:56	2021-05-24 14:41:56
2	browse_bread	\N	2021-05-24 14:41:56	2021-05-24 14:41:56
3	browse_database	\N	2021-05-24 14:41:56	2021-05-24 14:41:56
4	browse_media	\N	2021-05-24 14:41:56	2021-05-24 14:41:56
5	browse_compass	\N	2021-05-24 14:41:56	2021-05-24 14:41:56
6	browse_menus	menus	2021-05-24 14:41:56	2021-05-24 14:41:56
7	read_menus	menus	2021-05-24 14:41:56	2021-05-24 14:41:56
8	edit_menus	menus	2021-05-24 14:41:56	2021-05-24 14:41:56
9	add_menus	menus	2021-05-24 14:41:56	2021-05-24 14:41:56
10	delete_menus	menus	2021-05-24 14:41:56	2021-05-24 14:41:56
11	browse_roles	roles	2021-05-24 14:41:56	2021-05-24 14:41:56
12	read_roles	roles	2021-05-24 14:41:56	2021-05-24 14:41:56
13	edit_roles	roles	2021-05-24 14:41:56	2021-05-24 14:41:56
14	add_roles	roles	2021-05-24 14:41:56	2021-05-24 14:41:56
15	delete_roles	roles	2021-05-24 14:41:56	2021-05-24 14:41:56
16	browse_users	users	2021-05-24 14:41:56	2021-05-24 14:41:56
17	read_users	users	2021-05-24 14:41:56	2021-05-24 14:41:56
18	edit_users	users	2021-05-24 14:41:56	2021-05-24 14:41:56
19	add_users	users	2021-05-24 14:41:56	2021-05-24 14:41:56
20	delete_users	users	2021-05-24 14:41:56	2021-05-24 14:41:56
21	browse_settings	settings	2021-05-24 14:41:56	2021-05-24 14:41:56
22	read_settings	settings	2021-05-24 14:41:56	2021-05-24 14:41:56
23	edit_settings	settings	2021-05-24 14:41:56	2021-05-24 14:41:56
24	add_settings	settings	2021-05-24 14:41:56	2021-05-24 14:41:56
25	delete_settings	settings	2021-05-24 14:41:56	2021-05-24 14:41:56
26	browse_categories	categories	2021-05-24 14:41:56	2021-05-24 14:41:56
27	read_categories	categories	2021-05-24 14:41:56	2021-05-24 14:41:56
28	edit_categories	categories	2021-05-24 14:41:56	2021-05-24 14:41:56
29	add_categories	categories	2021-05-24 14:41:56	2021-05-24 14:41:56
30	delete_categories	categories	2021-05-24 14:41:56	2021-05-24 14:41:56
31	browse_posts	posts	2021-05-24 14:41:56	2021-05-24 14:41:56
32	read_posts	posts	2021-05-24 14:41:56	2021-05-24 14:41:56
33	edit_posts	posts	2021-05-24 14:41:56	2021-05-24 14:41:56
34	add_posts	posts	2021-05-24 14:41:56	2021-05-24 14:41:56
35	delete_posts	posts	2021-05-24 14:41:56	2021-05-24 14:41:56
36	browse_pages	pages	2021-05-24 14:41:56	2021-05-24 14:41:56
37	read_pages	pages	2021-05-24 14:41:56	2021-05-24 14:41:56
38	edit_pages	pages	2021-05-24 14:41:56	2021-05-24 14:41:56
39	add_pages	pages	2021-05-24 14:41:56	2021-05-24 14:41:56
40	delete_pages	pages	2021-05-24 14:41:56	2021-05-24 14:41:56
41	browse_hooks	\N	2021-05-24 14:41:56	2021-05-24 14:41:56
42	browse_funcionarios	funcionarios	2021-05-25 03:35:18	2021-05-25 03:35:18
43	read_funcionarios	funcionarios	2021-05-25 03:35:18	2021-05-25 03:35:18
44	edit_funcionarios	funcionarios	2021-05-25 03:35:18	2021-05-25 03:35:18
45	add_funcionarios	funcionarios	2021-05-25 03:35:18	2021-05-25 03:35:18
46	delete_funcionarios	funcionarios	2021-05-25 03:35:18	2021-05-25 03:35:18
47	browse_actividades	actividades	2021-05-25 03:44:17	2021-05-25 03:44:17
48	read_actividades	actividades	2021-05-25 03:44:17	2021-05-25 03:44:17
49	edit_actividades	actividades	2021-05-25 03:44:17	2021-05-25 03:44:17
50	add_actividades	actividades	2021-05-25 03:44:17	2021-05-25 03:44:17
51	delete_actividades	actividades	2021-05-25 03:44:17	2021-05-25 03:44:17
52	browse_tipos_acta	tipos_acta	2021-05-25 11:39:31	2021-05-25 11:39:31
53	read_tipos_acta	tipos_acta	2021-05-25 11:39:31	2021-05-25 11:39:31
54	edit_tipos_acta	tipos_acta	2021-05-25 11:39:31	2021-05-25 11:39:31
55	add_tipos_acta	tipos_acta	2021-05-25 11:39:31	2021-05-25 11:39:31
56	delete_tipos_acta	tipos_acta	2021-05-25 11:39:31	2021-05-25 11:39:31
57	browse_entidades	entidades	2021-05-25 11:41:07	2021-05-25 11:41:07
58	read_entidades	entidades	2021-05-25 11:41:07	2021-05-25 11:41:07
59	edit_entidades	entidades	2021-05-25 11:41:07	2021-05-25 11:41:07
60	add_entidades	entidades	2021-05-25 11:41:07	2021-05-25 11:41:07
61	delete_entidades	entidades	2021-05-25 11:41:07	2021-05-25 11:41:07
62	browse_tipos_emergencia	tipos_emergencia	2021-05-25 11:43:02	2021-05-25 11:43:02
63	read_tipos_emergencia	tipos_emergencia	2021-05-25 11:43:02	2021-05-25 11:43:02
64	edit_tipos_emergencia	tipos_emergencia	2021-05-25 11:43:02	2021-05-25 11:43:02
65	add_tipos_emergencia	tipos_emergencia	2021-05-25 11:43:02	2021-05-25 11:43:02
66	delete_tipos_emergencia	tipos_emergencia	2021-05-25 11:43:02	2021-05-25 11:43:02
67	browse_tipos_actividad	tipos_actividad	2021-05-25 11:45:14	2021-05-25 11:45:14
68	read_tipos_actividad	tipos_actividad	2021-05-25 11:45:14	2021-05-25 11:45:14
69	edit_tipos_actividad	tipos_actividad	2021-05-25 11:45:14	2021-05-25 11:45:14
70	add_tipos_actividad	tipos_actividad	2021-05-25 11:45:14	2021-05-25 11:45:14
71	delete_tipos_actividad	tipos_actividad	2021-05-25 11:45:14	2021-05-25 11:45:14
72	browse_maquinaria	maquinaria	2021-05-25 11:51:51	2021-05-25 11:51:51
73	read_maquinaria	maquinaria	2021-05-25 11:51:51	2021-05-25 11:51:51
74	edit_maquinaria	maquinaria	2021-05-25 11:51:51	2021-05-25 11:51:51
75	add_maquinaria	maquinaria	2021-05-25 11:51:51	2021-05-25 11:51:51
76	delete_maquinaria	maquinaria	2021-05-25 11:51:51	2021-05-25 11:51:51
77	browse_tipos_ayuda	tipos_ayuda	2021-05-25 11:57:40	2021-05-25 11:57:40
78	read_tipos_ayuda	tipos_ayuda	2021-05-25 11:57:40	2021-05-25 11:57:40
79	edit_tipos_ayuda	tipos_ayuda	2021-05-25 11:57:40	2021-05-25 11:57:40
80	add_tipos_ayuda	tipos_ayuda	2021-05-25 11:57:40	2021-05-25 11:57:40
81	delete_tipos_ayuda	tipos_ayuda	2021-05-25 11:57:40	2021-05-25 11:57:40
82	browse_mantenimientos	mantenimientos	2021-05-25 12:00:29	2021-05-25 12:00:29
83	read_mantenimientos	mantenimientos	2021-05-25 12:00:29	2021-05-25 12:00:29
84	edit_mantenimientos	mantenimientos	2021-05-25 12:00:29	2021-05-25 12:00:29
85	add_mantenimientos	mantenimientos	2021-05-25 12:00:29	2021-05-25 12:00:29
86	delete_mantenimientos	mantenimientos	2021-05-25 12:00:29	2021-05-25 12:00:29
87	browse_seguimientos_maquinaria	seguimientos_maquinaria	2021-05-25 12:02:49	2021-05-25 12:02:49
88	read_seguimientos_maquinaria	seguimientos_maquinaria	2021-05-25 12:02:49	2021-05-25 12:02:49
89	edit_seguimientos_maquinaria	seguimientos_maquinaria	2021-05-25 12:02:49	2021-05-25 12:02:49
90	add_seguimientos_maquinaria	seguimientos_maquinaria	2021-05-25 12:02:49	2021-05-25 12:02:49
91	delete_seguimientos_maquinaria	seguimientos_maquinaria	2021-05-25 12:02:49	2021-05-25 12:02:49
92	browse_emergencias	emergencias	2021-05-25 12:04:39	2021-05-25 12:04:39
93	read_emergencias	emergencias	2021-05-25 12:04:39	2021-05-25 12:04:39
94	edit_emergencias	emergencias	2021-05-25 12:04:39	2021-05-25 12:04:39
95	add_emergencias	emergencias	2021-05-25 12:04:39	2021-05-25 12:04:39
96	delete_emergencias	emergencias	2021-05-25 12:04:39	2021-05-25 12:04:39
97	browse_obligaciones	obligaciones	2021-05-27 17:06:27	2021-05-27 17:06:27
98	read_obligaciones	obligaciones	2021-05-27 17:06:27	2021-05-27 17:06:27
99	edit_obligaciones	obligaciones	2021-05-27 17:06:27	2021-05-27 17:06:27
100	add_obligaciones	obligaciones	2021-05-27 17:06:27	2021-05-27 17:06:27
101	delete_obligaciones	obligaciones	2021-05-27 17:06:27	2021-05-27 17:06:27
102	browse_personas_afectadas	personas_afectadas	2021-05-28 04:17:49	2021-05-28 04:17:49
103	read_personas_afectadas	personas_afectadas	2021-05-28 04:17:49	2021-05-28 04:17:49
104	edit_personas_afectadas	personas_afectadas	2021-05-28 04:17:49	2021-05-28 04:17:49
105	add_personas_afectadas	personas_afectadas	2021-05-28 04:17:49	2021-05-28 04:17:49
106	delete_personas_afectadas	personas_afectadas	2021-05-28 04:17:49	2021-05-28 04:17:49
107	browse_inventario_entrada	inventario_entrada	2021-05-28 04:26:15	2021-05-28 04:26:15
108	read_inventario_entrada	inventario_entrada	2021-05-28 04:26:15	2021-05-28 04:26:15
109	edit_inventario_entrada	inventario_entrada	2021-05-28 04:26:15	2021-05-28 04:26:15
110	add_inventario_entrada	inventario_entrada	2021-05-28 04:26:15	2021-05-28 04:26:15
111	delete_inventario_entrada	inventario_entrada	2021-05-28 04:26:15	2021-05-28 04:26:15
112	browse_inventario_salida	inventario_salida	2021-05-28 04:32:25	2021-05-28 04:32:25
113	read_inventario_salida	inventario_salida	2021-05-28 04:32:25	2021-05-28 04:32:25
114	edit_inventario_salida	inventario_salida	2021-05-28 04:32:25	2021-05-28 04:32:25
115	add_inventario_salida	inventario_salida	2021-05-28 04:32:25	2021-05-28 04:32:25
116	delete_inventario_salida	inventario_salida	2021-05-28 04:32:25	2021-05-28 04:32:25
117	browse_actas_reunion	actas_reunion	2021-05-28 13:57:06	2021-05-28 13:57:06
118	read_actas_reunion	actas_reunion	2021-05-28 13:57:06	2021-05-28 13:57:06
119	edit_actas_reunion	actas_reunion	2021-05-28 13:57:06	2021-05-28 13:57:06
120	add_actas_reunion	actas_reunion	2021-05-28 13:57:06	2021-05-28 13:57:06
121	delete_actas_reunion	actas_reunion	2021-05-28 13:57:06	2021-05-28 13:57:06
122	browse_visitas	visitas	2021-05-28 14:53:16	2021-05-28 14:53:16
123	read_visitas	visitas	2021-05-28 14:53:16	2021-05-28 14:53:16
124	edit_visitas	visitas	2021-05-28 14:53:16	2021-05-28 14:53:16
125	add_visitas	visitas	2021-05-28 14:53:16	2021-05-28 14:53:16
126	delete_visitas	visitas	2021-05-28 14:53:16	2021-05-28 14:53:16
127	browse_acciones_adelantadas	acciones_adelantadas	2021-05-28 14:57:18	2021-05-28 14:57:18
128	read_acciones_adelantadas	acciones_adelantadas	2021-05-28 14:57:18	2021-05-28 14:57:18
129	edit_acciones_adelantadas	acciones_adelantadas	2021-05-28 14:57:18	2021-05-28 14:57:18
130	add_acciones_adelantadas	acciones_adelantadas	2021-05-28 14:57:18	2021-05-28 14:57:18
131	delete_acciones_adelantadas	acciones_adelantadas	2021-05-28 14:57:18	2021-05-28 14:57:18
132	browse_informes	informes	2021-06-17 16:59:12	2021-06-17 16:59:12
133	read_informes	informes	2021-06-17 16:59:12	2021-06-17 16:59:12
134	edit_informes	informes	2021-06-17 16:59:12	2021-06-17 16:59:12
135	add_informes	informes	2021-06-17 16:59:12	2021-06-17 16:59:12
136	delete_informes	informes	2021-06-17 16:59:12	2021-06-17 16:59:12
137	browse_proyectos	proyectos	2021-06-28 01:58:28	2021-06-28 01:58:28
138	read_proyectos	proyectos	2021-06-28 01:58:28	2021-06-28 01:58:28
139	edit_proyectos	proyectos	2021-06-28 01:58:28	2021-06-28 01:58:28
140	add_proyectos	proyectos	2021-06-28 01:58:28	2021-06-28 01:58:28
141	delete_proyectos	proyectos	2021-06-28 01:58:28	2021-06-28 01:58:28
142	browse_municipios	municipios	2021-06-30 18:56:13	2021-06-30 18:56:13
143	read_municipios	municipios	2021-06-30 18:56:13	2021-06-30 18:56:13
144	edit_municipios	municipios	2021-06-30 18:56:13	2021-06-30 18:56:13
145	add_municipios	municipios	2021-06-30 18:56:13	2021-06-30 18:56:13
146	delete_municipios	municipios	2021-06-30 18:56:13	2021-06-30 18:56:13
147	browse_calamidad	calamidad	2021-06-30 19:23:13	2021-06-30 19:23:13
148	read_calamidad	calamidad	2021-06-30 19:23:13	2021-06-30 19:23:13
149	edit_calamidad	calamidad	2021-06-30 19:23:13	2021-06-30 19:23:13
150	add_calamidad	calamidad	2021-06-30 19:23:13	2021-06-30 19:23:13
151	delete_calamidad	calamidad	2021-06-30 19:23:13	2021-06-30 19:23:13
152	browse_site_templates	site_templates	2021-07-16 17:30:18	2021-07-16 17:30:18
153	read_site_templates	site_templates	2021-07-16 17:30:18	2021-07-16 17:30:18
154	edit_site_templates	site_templates	2021-07-16 17:30:18	2021-07-16 17:30:18
155	add_site_templates	site_templates	2021-07-16 17:30:18	2021-07-16 17:30:18
156	delete_site_templates	site_templates	2021-07-16 17:30:18	2021-07-16 17:30:18
157	browse_site_pages	site_pages	2021-07-16 17:32:44	2021-07-16 17:32:44
158	read_site_pages	site_pages	2021-07-16 17:32:44	2021-07-16 17:32:44
159	edit_site_pages	site_pages	2021-07-16 17:32:44	2021-07-16 17:32:44
160	add_site_pages	site_pages	2021-07-16 17:32:44	2021-07-16 17:32:44
161	delete_site_pages	site_pages	2021-07-16 17:32:44	2021-07-16 17:32:44
162	browse_site_content	site_content	2021-07-16 17:35:33	2021-07-16 17:35:33
163	read_site_content	site_content	2021-07-16 17:35:33	2021-07-16 17:35:33
164	edit_site_content	site_content	2021-07-16 17:35:33	2021-07-16 17:35:33
165	add_site_content	site_content	2021-07-16 17:35:33	2021-07-16 17:35:33
166	delete_site_content	site_content	2021-07-16 17:35:33	2021-07-16 17:35:33
\.


--
-- Data for Name: personas_afectadas; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.personas_afectadas (id_personas_afectadas, fecha, hombres, mujeres, ninos, id_emergencia) FROM stdin;
1	2021-05-29	21	23	50	1
2	2021-05-14	10	10	10	2
3	2021-06-03	40	25	12	4
4	2021-07-13	20	10	10	4
5	2021-07-15	12	4	1	4
6	2021-07-14	10	5	3	8
7	2021-07-16	10	5	3	8
8	2021-07-06	1	2	5	13
9	2021-07-20	7	9	2	8
10	2021-08-01	10	5	2	19
11	2021-07-31	5	5	5	19
\.


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.posts (id, author_id, category_id, title, seo_title, excerpt, body, image, slug, meta_description, meta_keywords, status, featured, created_at, updated_at) FROM stdin;
1	0	\N	Lorem Ipsum Post	\N	This is the excerpt for the Lorem Ipsum Post	<p>This is the body of the lorem ipsum post</p>	posts/post1.jpg	lorem-ipsum-post	This is the meta description	keyword1, keyword2, keyword3	PUBLISHED	f	2021-05-24 14:41:56	2021-05-24 14:41:56
2	0	\N	My Sample Post	\N	This is the excerpt for the sample Post	<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>	posts/post2.jpg	my-sample-post	Meta Description for sample post	keyword1, keyword2, keyword3	PUBLISHED	f	2021-05-24 14:41:56	2021-05-24 14:41:56
3	0	\N	Latest Post	\N	This is the excerpt for the latest post	<p>This is the body for the latest post</p>	posts/post3.jpg	latest-post	This is the meta description	keyword1, keyword2, keyword3	PUBLISHED	f	2021-05-24 14:41:56	2021-05-24 14:41:56
4	0	\N	Yarr Post	\N	Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.	<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>	posts/post4.jpg	yarr-post	this be a meta descript	keyword1, keyword2, keyword3	PUBLISHED	f	2021-05-24 14:41:56	2021-05-24 14:41:56
\.


--
-- Data for Name: proyectos; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.proyectos (id_proyecto, nombre_formulador, cargo, email, telefono, id_municipio, nombre_proyecto, fecha, archivo, efectos_indirectos, efectos_directos, problema_central, causa_directa, causa_indirecta, fines_indirectos, fines_directos, medios_directos, medios_indirectos, planteamiento_problema, magnitud_problema, antecedentes, justificacion_politica, justificacion_tecnico_legal, actores_entidades, actores_actividad, actores_tipo_actor, articulacion_actores, objetivo_general, indicador, unidad_medida, cantidad, objetivos_especificos, alternativa_seleccionada, descripcion_alternativa, actividades_cadena_valor, descripcion_actividades, tiempo_ejecucion, observaciones) FROM stdin;
1	Juan Fajardo	Profesional Grado 2	juanfbarrero@gmail.com	3006104615	169	Proyecto de prueba	2021-06-27	[{"download_link":"proyectos\\/June2021\\/fpAYm63HDaz4GTcnPT6T.docx","original_name":"proyecto_202106301723.docx"}]	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce elementum bibendum neque, ac gravida eros efficitur id. Quisque fermentum consequat leo rutrum sagittis. Donec aliquam lorem id nisi pharetra vestibulum. Vivamus imperdiet, tellus vitae tincidunt luctus, dolor nisi varius nibh, ac vulputate est orci sit amet urna. In eu sodales mauris, quis sagittis diam. Maecenas eget arcu sit amet eros lacinia facilisis eget at eros. Praesent nec velit et justo dapibus tempor quis a lorem.\r\n\r\nUt ullamcorper a elit quis facilisis. Suspendisse rhoncus, risus non egestas convallis, dolor diam ullamcorper ante, eget pharetra nulla ex id tellus. Vivamus metus velit, mollis auctor enim in, accumsan ullamcorper lorem. Cras vulputate lobortis felis, vitae egestas augue euismod et. Phasellus volutpat consectetur mollis. Nam vitae dui lobortis, lacinia sapien sed, bibendum turpis. Duis ornare ipsum ut fringilla facilisis. Nullam faucibus sed augue eu condimentum. Sed ornare eu ipsum ut mollis. Quisque tempor metus quis lectus tincidunt, ac mollis mi dignissim. Proin et massa venenatis, suscipit turpis in, suscipit quam. Aliquam interdum nunc vitae molestie consequat. Quisque mattis eget arcu sit amet sagittis. Aenean aliquet neque ac lectus porttitor semper.	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce elementum bibendum neque, ac gravida eros efficitur id. Quisque fermentum consequat leo rutrum sagittis. Donec aliquam lorem id nisi pharetra vestibulum. Vivamus imperdiet, tellus vitae tincidunt luctus, dolor nisi varius nibh, ac vulputate est orci sit amet urna. In eu sodales mauris, quis sagittis diam. Maecenas eget arcu sit amet eros lacinia facilisis eget at eros. Praesent nec velit et justo dapibus tempor quis a lorem.\r\n\r\nUt ullamcorper a elit quis facilisis. Suspendisse rhoncus, risus non egestas convallis, dolor diam ullamcorper ante, eget pharetra nulla ex id tellus. Vivamus metus velit, mollis auctor enim in, accumsan ullamcorper lorem. Cras vulputate lobortis felis, vitae egestas augue euismod et. Phasellus volutpat consectetur mollis. Nam vitae dui lobortis, lacinia sapien sed, bibendum turpis. Duis ornare ipsum ut fringilla facilisis. Nullam faucibus sed augue eu condimentum. Sed ornare eu ipsum ut mollis. Quisque tempor metus quis lectus tincidunt, ac mollis mi dignissim. Proin et massa venenatis, suscipit turpis in, suscipit quam. Aliquam interdum nunc vitae molestie consequat. Quisque mattis eget arcu sit amet sagittis. Aenean aliquet neque ac lectus porttitor semper.	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce elementum bibendum neque, ac gravida eros efficitur id. Quisque fermentum consequat leo rutrum sagittis. Donec aliquam lorem id nisi pharetra vestibulum. Vivamus imperdiet, tellus vitae tincidunt luctus, dolor nisi varius nibh, ac vulputate est orci sit amet urna. In eu sodales mauris, quis sagittis diam. Maecenas eget arcu sit amet eros lacinia facilisis eget at eros. Praesent nec velit et justo dapibus tempor quis a lorem.\r\n\r\nUt ullamcorper a elit quis facilisis. Suspendisse rhoncus, risus non egestas convallis, dolor diam ullamcorper ante, eget pharetra nulla ex id tellus. Vivamus metus velit, mollis auctor enim in, accumsan ullamcorper lorem. Cras vulputate lobortis felis, vitae egestas augue euismod et. Phasellus volutpat consectetur mollis. Nam vitae dui lobortis, lacinia sapien sed, bibendum turpis. Duis ornare ipsum ut fringilla facilisis. Nullam faucibus sed augue eu condimentum. Sed ornare eu ipsum ut mollis. Quisque tempor metus quis lectus tincidunt, ac mollis mi dignissim. Proin et massa venenatis, suscipit turpis in, suscipit quam. Aliquam interdum nunc vitae molestie consequat. Quisque mattis eget arcu sit amet sagittis. Aenean aliquet neque ac lectus porttitor semper.	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce elementum bibendum neque, ac gravida eros efficitur id. Quisque fermentum consequat leo rutrum sagittis. Donec aliquam lorem id nisi pharetra vestibulum. Vivamus imperdiet, tellus vitae tincidunt luctus, dolor nisi varius nibh, ac vulputate est orci sit amet urna. In eu sodales mauris, quis sagittis diam. Maecenas eget arcu sit amet eros lacinia facilisis eget at eros. Praesent nec velit et justo dapibus tempor quis a lorem.\r\n\r\nUt ullamcorper a elit quis facilisis. Suspendisse rhoncus, risus non egestas convallis, dolor diam ullamcorper ante, eget pharetra nulla ex id tellus. Vivamus metus velit, mollis auctor enim in, accumsan ullamcorper lorem. Cras vulputate lobortis felis, vitae egestas augue euismod et. Phasellus volutpat consectetur mollis. Nam vitae dui lobortis, lacinia sapien sed, bibendum turpis. Duis ornare ipsum ut fringilla facilisis. Nullam faucibus sed augue eu condimentum. Sed ornare eu ipsum ut mollis. Quisque tempor metus quis lectus tincidunt, ac mollis mi dignissim. Proin et massa venenatis, suscipit turpis in, suscipit quam. Aliquam interdum nunc vitae molestie consequat. Quisque mattis eget arcu sit amet sagittis. Aenean aliquet neque ac lectus porttitor semper.	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce elementum bibendum neque, ac gravida eros efficitur id. Quisque fermentum consequat leo rutrum sagittis. Donec aliquam lorem id nisi pharetra vestibulum. Vivamus imperdiet, tellus vitae tincidunt luctus, dolor nisi varius nibh, ac vulputate est orci sit amet urna. In eu sodales mauris, quis sagittis diam. Maecenas eget arcu sit amet eros lacinia facilisis eget at eros. Praesent nec velit et justo dapibus tempor quis a lorem.\r\n\r\nUt ullamcorper a elit quis facilisis. Suspendisse rhoncus, risus non egestas convallis, dolor diam ullamcorper ante, eget pharetra nulla ex id tellus. Vivamus metus velit, mollis auctor enim in, accumsan ullamcorper lorem. Cras vulputate lobortis felis, vitae egestas augue euismod et. Phasellus volutpat consectetur mollis. Nam vitae dui lobortis, lacinia sapien sed, bibendum turpis. Duis ornare ipsum ut fringilla facilisis. Nullam faucibus sed augue eu condimentum. Sed ornare eu ipsum ut mollis. Quisque tempor metus quis lectus tincidunt, ac mollis mi dignissim. Proin et massa venenatis, suscipit turpis in, suscipit quam. Aliquam interdum nunc vitae molestie consequat. Quisque mattis eget arcu sit amet sagittis. Aenean aliquet neque ac lectus porttitor semper.	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce elementum bibendum neque, ac gravida eros efficitur id. Quisque fermentum consequat leo rutrum sagittis. Donec aliquam lorem id nisi pharetra vestibulum. Vivamus imperdiet, tellus vitae tincidunt luctus, dolor nisi varius nibh, ac vulputate est orci sit amet urna. In eu sodales mauris, quis sagittis diam. Maecenas eget arcu sit amet eros lacinia facilisis eget at eros. Praesent nec velit et justo dapibus tempor quis a lorem.\r\n\r\nUt ullamcorper a elit quis facilisis. Suspendisse rhoncus, risus non egestas convallis, dolor diam ullamcorper ante, eget pharetra nulla ex id tellus. Vivamus metus velit, mollis auctor enim in, accumsan ullamcorper lorem. Cras vulputate lobortis felis, vitae egestas augue euismod et. Phasellus volutpat consectetur mollis. Nam vitae dui lobortis, lacinia sapien sed, bibendum turpis. Duis ornare ipsum ut fringilla facilisis. Nullam faucibus sed augue eu condimentum. Sed ornare eu ipsum ut mollis. Quisque tempor metus quis lectus tincidunt, ac mollis mi dignissim. Proin et massa venenatis, suscipit turpis in, suscipit quam. Aliquam interdum nunc vitae molestie consequat. Quisque mattis eget arcu sit amet sagittis. Aenean aliquet neque ac lectus porttitor semper.	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce elementum bibendum neque, ac gravida eros efficitur id. Quisque fermentum consequat leo rutrum sagittis. Donec aliquam lorem id nisi pharetra vestibulum. Vivamus imperdiet, tellus vitae tincidunt luctus, dolor nisi varius nibh, ac vulputate est orci sit amet urna. In eu sodales mauris, quis sagittis diam. Maecenas eget arcu sit amet eros lacinia facilisis eget at eros. Praesent nec velit et justo dapibus tempor quis a lorem.\r\n\r\nUt ullamcorper a elit quis facilisis. Suspendisse rhoncus, risus non egestas convallis, dolor diam ullamcorper ante, eget pharetra nulla ex id tellus. Vivamus metus velit, mollis auctor enim in, accumsan ullamcorper lorem. Cras vulputate lobortis felis, vitae egestas augue euismod et. Phasellus volutpat consectetur mollis. Nam vitae dui lobortis, lacinia sapien sed, bibendum turpis. Duis ornare ipsum ut fringilla facilisis. Nullam faucibus sed augue eu condimentum. Sed ornare eu ipsum ut mollis. Quisque tempor metus quis lectus tincidunt, ac mollis mi dignissim. Proin et massa venenatis, suscipit turpis in, suscipit quam. Aliquam interdum nunc vitae molestie consequat. Quisque mattis eget arcu sit amet sagittis. Aenean aliquet neque ac lectus porttitor semper.	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce elementum bibendum neque, ac gravida eros efficitur id. Quisque fermentum consequat leo rutrum sagittis. Donec aliquam lorem id nisi pharetra vestibulum. Vivamus imperdiet, tellus vitae tincidunt luctus, dolor nisi varius nibh, ac vulputate est orci sit amet urna. In eu sodales mauris, quis sagittis diam. Maecenas eget arcu sit amet eros lacinia facilisis eget at eros. Praesent nec velit et justo dapibus tempor quis a lorem.\r\n\r\nUt ullamcorper a elit quis facilisis. Suspendisse rhoncus, risus non egestas convallis, dolor diam ullamcorper ante, eget pharetra nulla ex id tellus. Vivamus metus velit, mollis auctor enim in, accumsan ullamcorper lorem. Cras vulputate lobortis felis, vitae egestas augue euismod et. Phasellus volutpat consectetur mollis. Nam vitae dui lobortis, lacinia sapien sed, bibendum turpis. Duis ornare ipsum ut fringilla facilisis. Nullam faucibus sed augue eu condimentum. Sed ornare eu ipsum ut mollis. Quisque tempor metus quis lectus tincidunt, ac mollis mi dignissim. Proin et massa venenatis, suscipit turpis in, suscipit quam. Aliquam interdum nunc vitae molestie consequat. Quisque mattis eget arcu sit amet sagittis. Aenean aliquet neque ac lectus porttitor semper.	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce elementum bibendum neque, ac gravida eros efficitur id. Quisque fermentum consequat leo rutrum sagittis. Donec aliquam lorem id nisi pharetra vestibulum. Vivamus imperdiet, tellus vitae tincidunt luctus, dolor nisi varius nibh, ac vulputate est orci sit amet urna. In eu sodales mauris, quis sagittis diam. Maecenas eget arcu sit amet eros lacinia facilisis eget at eros. Praesent nec velit et justo dapibus tempor quis a lorem.\r\n\r\nUt ullamcorper a elit quis facilisis. Suspendisse rhoncus, risus non egestas convallis, dolor diam ullamcorper ante, eget pharetra nulla ex id tellus. Vivamus metus velit, mollis auctor enim in, accumsan ullamcorper lorem. Cras vulputate lobortis felis, vitae egestas augue euismod et. Phasellus volutpat consectetur mollis. Nam vitae dui lobortis, lacinia sapien sed, bibendum turpis. Duis ornare ipsum ut fringilla facilisis. Nullam faucibus sed augue eu condimentum. Sed ornare eu ipsum ut mollis. Quisque tempor metus quis lectus tincidunt, ac mollis mi dignissim. Proin et massa venenatis, suscipit turpis in, suscipit quam. Aliquam interdum nunc vitae molestie consequat. Quisque mattis eget arcu sit amet sagittis. Aenean aliquet neque ac lectus porttitor semper.	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce elementum bibendum neque, ac gravida eros efficitur id. Quisque fermentum consequat leo rutrum sagittis. Donec aliquam lorem id nisi pharetra vestibulum. Vivamus imperdiet, tellus vitae tincidunt luctus, dolor nisi varius nibh, ac vulputate est orci sit amet urna. In eu sodales mauris, quis sagittis diam. Maecenas eget arcu sit amet eros lacinia facilisis eget at eros. Praesent nec velit et justo dapibus tempor quis a lorem.\r\n\r\nUt ullamcorper a elit quis facilisis. Suspendisse rhoncus, risus non egestas convallis, dolor diam ullamcorper ante, eget pharetra nulla ex id tellus. Vivamus metus velit, mollis auctor enim in, accumsan ullamcorper lorem. Cras vulputate lobortis felis, vitae egestas augue euismod et. Phasellus volutpat consectetur mollis. Nam vitae dui lobortis, lacinia sapien sed, bibendum turpis. Duis ornare ipsum ut fringilla facilisis. Nullam faucibus sed augue eu condimentum. Sed ornare eu ipsum ut mollis. Quisque tempor metus quis lectus tincidunt, ac mollis mi dignissim. Proin et massa venenatis, suscipit turpis in, suscipit quam. Aliquam interdum nunc vitae molestie consequat. Quisque mattis eget arcu sit amet sagittis. Aenean aliquet neque ac lectus porttitor semper.	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce elementum bibendum neque, ac gravida eros efficitur id. Quisque fermentum consequat leo rutrum sagittis. Donec aliquam lorem id nisi pharetra vestibulum. Vivamus imperdiet, tellus vitae tincidunt luctus, dolor nisi varius nibh, ac vulputate est orci sit amet urna. In eu sodales mauris, quis sagittis diam. Maecenas eget arcu sit amet eros lacinia facilisis eget at eros. Praesent nec velit et justo dapibus tempor quis a lorem.\r\n\r\nUt ullamcorper a elit quis facilisis. Suspendisse rhoncus, risus non egestas convallis, dolor diam ullamcorper ante, eget pharetra nulla ex id tellus. Vivamus metus velit, mollis auctor enim in, accumsan ullamcorper lorem. Cras vulputate lobortis felis, vitae egestas augue euismod et. Phasellus volutpat consectetur mollis. Nam vitae dui lobortis, lacinia sapien sed, bibendum turpis. Duis ornare ipsum ut fringilla facilisis. Nullam faucibus sed augue eu condimentum. Sed ornare eu ipsum ut mollis. Quisque tempor metus quis lectus tincidunt, ac mollis mi dignissim. Proin et massa venenatis, suscipit turpis in, suscipit quam. Aliquam interdum nunc vitae molestie consequat. Quisque mattis eget arcu sit amet sagittis. Aenean aliquet neque ac lectus porttitor semper.	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce elementum bibendum neque, ac gravida eros efficitur id. Quisque fermentum consequat leo rutrum sagittis. Donec aliquam lorem id nisi pharetra vestibulum. Vivamus imperdiet, tellus vitae tincidunt luctus, dolor nisi varius nibh, ac vulputate est orci sit amet urna. In eu sodales mauris, quis sagittis diam. Maecenas eget arcu sit amet eros lacinia facilisis eget at eros. Praesent nec velit et justo dapibus tempor quis a lorem.\r\n\r\nUt ullamcorper a elit quis facilisis. Suspendisse rhoncus, risus non egestas convallis, dolor diam ullamcorper ante, eget pharetra nulla ex id tellus. Vivamus metus velit, mollis auctor enim in, accumsan ullamcorper lorem. Cras vulputate lobortis felis, vitae egestas augue euismod et. Phasellus volutpat consectetur mollis. Nam vitae dui lobortis, lacinia sapien sed, bibendum turpis. Duis ornare ipsum ut fringilla facilisis. Nullam faucibus sed augue eu condimentum. Sed ornare eu ipsum ut mollis. Quisque tempor metus quis lectus tincidunt, ac mollis mi dignissim. Proin et massa venenatis, suscipit turpis in, suscipit quam. Aliquam interdum nunc vitae molestie consequat. Quisque mattis eget arcu sit amet sagittis. Aenean aliquet neque ac lectus porttitor semper.	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce elementum bibendum neque, ac gravida eros efficitur id. Quisque fermentum consequat leo rutrum sagittis. Donec aliquam lorem id nisi pharetra vestibulum. Vivamus imperdiet, tellus vitae tincidunt luctus, dolor nisi varius nibh, ac vulputate est orci sit amet urna. In eu sodales mauris, quis sagittis diam. Maecenas eget arcu sit amet eros lacinia facilisis eget at eros. Praesent nec velit et justo dapibus tempor quis a lorem.\r\n\r\nUt ullamcorper a elit quis facilisis. Suspendisse rhoncus, risus non egestas convallis, dolor diam ullamcorper ante, eget pharetra nulla ex id tellus. Vivamus metus velit, mollis auctor enim in, accumsan ullamcorper lorem. Cras vulputate lobortis felis, vitae egestas augue euismod et. Phasellus volutpat consectetur mollis. Nam vitae dui lobortis, lacinia sapien sed, bibendum turpis. Duis ornare ipsum ut fringilla facilisis. Nullam faucibus sed augue eu condimentum. Sed ornare eu ipsum ut mollis. Quisque tempor metus quis lectus tincidunt, ac mollis mi dignissim. Proin et massa venenatis, suscipit turpis in, suscipit quam. Aliquam interdum nunc vitae molestie consequat. Quisque mattis eget arcu sit amet sagittis. Aenean aliquet neque ac lectus porttitor semper.	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce elementum bibendum neque, ac gravida eros efficitur id. Quisque fermentum consequat leo rutrum sagittis. Donec aliquam lorem id nisi pharetra vestibulum. Vivamus imperdiet, tellus vitae tincidunt luctus, dolor nisi varius nibh, ac vulputate est orci sit amet urna. In eu sodales mauris, quis sagittis diam. Maecenas eget arcu sit amet eros lacinia facilisis eget at eros. Praesent nec velit et justo dapibus tempor quis a lorem.\r\n\r\nUt ullamcorper a elit quis facilisis. Suspendisse rhoncus, risus non egestas convallis, dolor diam ullamcorper ante, eget pharetra nulla ex id tellus. Vivamus metus velit, mollis auctor enim in, accumsan ullamcorper lorem. Cras vulputate lobortis felis, vitae egestas augue euismod et. Phasellus volutpat consectetur mollis. Nam vitae dui lobortis, lacinia sapien sed, bibendum turpis. Duis ornare ipsum ut fringilla facilisis. Nullam faucibus sed augue eu condimentum. Sed ornare eu ipsum ut mollis. Quisque tempor metus quis lectus tincidunt, ac mollis mi dignissim. Proin et massa venenatis, suscipit turpis in, suscipit quam. Aliquam interdum nunc vitae molestie consequat. Quisque mattis eget arcu sit amet sagittis. Aenean aliquet neque ac lectus porttitor semper.	\N	\N	\N	\N	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce elementum bibendum neque, ac gravida eros efficitur id. Quisque fermentum consequat leo rutrum sagittis. Donec aliquam lorem id nisi pharetra vestibulum. Vivamus imperdiet, tellus vitae tincidunt luctus, dolor nisi varius nibh, ac vulputate est orci sit amet urna. In eu sodales mauris, quis sagittis diam. Maecenas eget arcu sit amet eros lacinia facilisis eget at eros. Praesent nec velit et justo dapibus tempor quis a lorem.\r\n\r\nUt ullamcorper a elit quis facilisis. Suspendisse rhoncus, risus non egestas convallis, dolor diam ullamcorper ante, eget pharetra nulla ex id tellus. Vivamus metus velit, mollis auctor enim in, accumsan ullamcorper lorem. Cras vulputate lobortis felis, vitae egestas augue euismod et. Phasellus volutpat consectetur mollis. Nam vitae dui lobortis, lacinia sapien sed, bibendum turpis. Duis ornare ipsum ut fringilla facilisis. Nullam faucibus sed augue eu condimentum. Sed ornare eu ipsum ut mollis. Quisque tempor metus quis lectus tincidunt, ac mollis mi dignissim. Proin et massa venenatis, suscipit turpis in, suscipit quam. Aliquam interdum nunc vitae molestie consequat. Quisque mattis eget arcu sit amet sagittis. Aenean aliquet neque ac lectus porttitor semper.	personas beneficiadas	cantidad	\N	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce elementum bibendum neque, ac gravida eros efficitur id. Quisque fermentum consequat leo rutrum sagittis. Donec aliquam lorem id nisi pharetra vestibulum. Vivamus imperdiet, tellus vitae tincidunt luctus, dolor nisi varius nibh, ac vulputate est orci sit amet urna. In eu sodales mauris, quis sagittis diam. Maecenas eget arcu sit amet eros lacinia facilisis eget at eros. Praesent nec velit et justo dapibus tempor quis a lorem.\r\n\r\nUt ullamcorper a elit quis facilisis. Suspendisse rhoncus, risus non egestas convallis, dolor diam ullamcorper ante, eget pharetra nulla ex id tellus. Vivamus metus velit, mollis auctor enim in, accumsan ullamcorper lorem. Cras vulputate lobortis felis, vitae egestas augue euismod et. Phasellus volutpat consectetur mollis. Nam vitae dui lobortis, lacinia sapien sed, bibendum turpis. Duis ornare ipsum ut fringilla facilisis. Nullam faucibus sed augue eu condimentum. Sed ornare eu ipsum ut mollis. Quisque tempor metus quis lectus tincidunt, ac mollis mi dignissim. Proin et massa venenatis, suscipit turpis in, suscipit quam. Aliquam interdum nunc vitae molestie consequat. Quisque mattis eget arcu sit amet sagittis. Aenean aliquet neque ac lectus porttitor semper.	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce elementum bibendum neque, ac gravida eros efficitur id. Quisque fermentum consequat leo rutrum sagittis. Donec aliquam lorem id nisi pharetra vestibulum. Vivamus imperdiet, tellus vitae tincidunt luctus, dolor nisi varius nibh, ac vulputate est orci sit amet urna. In eu sodales mauris, quis sagittis diam. Maecenas eget arcu sit amet eros lacinia facilisis eget at eros. Praesent nec velit et justo dapibus tempor quis a lorem.\r\n\r\nUt ullamcorper a elit quis facilisis. Suspendisse rhoncus, risus non egestas convallis, dolor diam ullamcorper ante, eget pharetra nulla ex id tellus. Vivamus metus velit, mollis auctor enim in, accumsan ullamcorper lorem. Cras vulputate lobortis felis, vitae egestas augue euismod et. Phasellus volutpat consectetur mollis. Nam vitae dui lobortis, lacinia sapien sed, bibendum turpis. Duis ornare ipsum ut fringilla facilisis. Nullam faucibus sed augue eu condimentum. Sed ornare eu ipsum ut mollis. Quisque tempor metus quis lectus tincidunt, ac mollis mi dignissim. Proin et massa venenatis, suscipit turpis in, suscipit quam. Aliquam interdum nunc vitae molestie consequat. Quisque mattis eget arcu sit amet sagittis. Aenean aliquet neque ac lectus porttitor semper.	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce elementum bibendum neque, ac gravida eros efficitur id. Quisque fermentum consequat leo rutrum sagittis. Donec aliquam lorem id nisi pharetra vestibulum. Vivamus imperdiet, tellus vitae tincidunt luctus, dolor nisi varius nibh, ac vulputate est orci sit amet urna. In eu sodales mauris, quis sagittis diam. Maecenas eget arcu sit amet eros lacinia facilisis eget at eros. Praesent nec velit et justo dapibus tempor quis a lorem.\r\n\r\nUt ullamcorper a elit quis facilisis. Suspendisse rhoncus, risus non egestas convallis, dolor diam ullamcorper ante, eget pharetra nulla ex id tellus. Vivamus metus velit, mollis auctor enim in, accumsan ullamcorper lorem. Cras vulputate lobortis felis, vitae egestas augue euismod et. Phasellus volutpat consectetur mollis. Nam vitae dui lobortis, lacinia sapien sed, bibendum turpis. Duis ornare ipsum ut fringilla facilisis. Nullam faucibus sed augue eu condimentum. Sed ornare eu ipsum ut mollis. Quisque tempor metus quis lectus tincidunt, ac mollis mi dignissim. Proin et massa venenatis, suscipit turpis in, suscipit quam. Aliquam interdum nunc vitae molestie consequat. Quisque mattis eget arcu sit amet sagittis. Aenean aliquet neque ac lectus porttitor semper.	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce elementum bibendum neque, ac gravida eros efficitur id. Quisque fermentum consequat leo rutrum sagittis. Donec aliquam lorem id nisi pharetra vestibulum. Vivamus imperdiet, tellus vitae tincidunt luctus, dolor nisi varius nibh, ac vulputate est orci sit amet urna. In eu sodales mauris, quis sagittis diam. Maecenas eget arcu sit amet eros lacinia facilisis eget at eros. Praesent nec velit et justo dapibus tempor quis a lorem.\r\n\r\nUt ullamcorper a elit quis facilisis. Suspendisse rhoncus, risus non egestas convallis, dolor diam ullamcorper ante, eget pharetra nulla ex id tellus. Vivamus metus velit, mollis auctor enim in, accumsan ullamcorper lorem. Cras vulputate lobortis felis, vitae egestas augue euismod et. Phasellus volutpat consectetur mollis. Nam vitae dui lobortis, lacinia sapien sed, bibendum turpis. Duis ornare ipsum ut fringilla facilisis. Nullam faucibus sed augue eu condimentum. Sed ornare eu ipsum ut mollis. Quisque tempor metus quis lectus tincidunt, ac mollis mi dignissim. Proin et massa venenatis, suscipit turpis in, suscipit quam. Aliquam interdum nunc vitae molestie consequat. Quisque mattis eget arcu sit amet sagittis. Aenean aliquet neque ac lectus porttitor semper.	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce elementum bibendum neque, ac gravida eros efficitur id. Quisque fermentum consequat leo rutrum sagittis. Donec aliquam lorem id nisi pharetra vestibulum. Vivamus imperdiet, tellus vitae tincidunt luctus, dolor nisi varius nibh, ac vulputate est orci sit amet urna. In eu sodales mauris, quis sagittis diam. Maecenas eget arcu sit amet eros lacinia facilisis eget at eros. Praesent nec velit et justo dapibus tempor quis a lorem.\r\n\r\nUt ullamcorper a elit quis facilisis. Suspendisse rhoncus, risus non egestas convallis, dolor diam ullamcorper ante, eget pharetra nulla ex id tellus. Vivamus metus velit, mollis auctor enim in, accumsan ullamcorper lorem. Cras vulputate lobortis felis, vitae egestas augue euismod et. Phasellus volutpat consectetur mollis. Nam vitae dui lobortis, lacinia sapien sed, bibendum turpis. Duis ornare ipsum ut fringilla facilisis. Nullam faucibus sed augue eu condimentum. Sed ornare eu ipsum ut mollis. Quisque tempor metus quis lectus tincidunt, ac mollis mi dignissim. Proin et massa venenatis, suscipit turpis in, suscipit quam. Aliquam interdum nunc vitae molestie consequat. Quisque mattis eget arcu sit amet sagittis. Aenean aliquet neque ac lectus porttitor semper.	6 meses	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce elementum bibendum neque, ac gravida eros efficitur id. Quisque fermentum consequat leo rutrum sagittis. Donec aliquam lorem id nisi pharetra vestibulum. Vivamus imperdiet, tellus vitae tincidunt luctus, dolor nisi varius nibh, ac vulputate est orci sit amet urna. In eu sodales mauris, quis sagittis diam. Maecenas eget arcu sit amet eros lacinia facilisis eget at eros. Praesent nec velit et justo dapibus tempor quis a lorem.\r\n\r\nUt ullamcorper a elit quis facilisis. Suspendisse rhoncus, risus non egestas convallis, dolor diam ullamcorper ante, eget pharetra nulla ex id tellus. Vivamus metus velit, mollis auctor enim in, accumsan ullamcorper lorem. Cras vulputate lobortis felis, vitae egestas augue euismod et. Phasellus volutpat consectetur mollis. Nam vitae dui lobortis, lacinia sapien sed, bibendum turpis. Duis ornare ipsum ut fringilla facilisis. Nullam faucibus sed augue eu condimentum. Sed ornare eu ipsum ut mollis. Quisque tempor metus quis lectus tincidunt, ac mollis mi dignissim. Proin et massa venenatis, suscipit turpis in, suscipit quam. Aliquam interdum nunc vitae molestie consequat. Quisque mattis eget arcu sit amet sagittis. Aenean aliquet neque ac lectus porttitor semper.
\.


--
-- Data for Name: reportes; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.reportes (reporte, sql, parametros, nombre, estadistica, landscape) FROM stdin;
2	SELECT a.descripcion,a.fecha_estimada,a.fecha_entrega,\na.desarrollo,(case when a.cumplida=1 then 'SI' else 'NO' end) as cumplida,\nf.nombre FROM actividades a,funcionarios f\nWHERE a.id_funcionario=f.id_funcionario AND a.fecha_estimada>='[inicio]' AND a.fecha_estimada<='[fin]'  \n	inicio|Fecha de inicio|fecha;fin|Fecha Final|fecha	Reporte de actividades	0	0
3	SELECT i.descripcion,i.valor,i.fecha,e.descripcion,e.fecha as fecha_emergencia\nFROM inversiones i,emergencias e\nWHERE i.id_emergencia=e.id_emergencia AND e.id_emergencia=[idemergencia]	idemergencia|Emergencia|combo:emergencias,id_emergencia,descripcion	Reporte de inversiones	0	0
4	\nSELECT marca,capacidad,presupuesto,ubicacion,\ndescripcion,(case when activa=1 then 'SI' else 'NO' end) as cumplida,linea,serial,año_asignacion,placa,observaciones\nFROM maquinaria WHERE descripcion ilike '%[desc]%'	desc|Descripcion (% para todo)|texto	Reporte de maquinaria	0	0
5	SELECT v.accion,v.fecha,v.asunto,v.interesado,v.concepto,m.nombre as municipio FROM visitas v,municipios m\nWHERE m.id_municipio=v.id_municipio AND v.asunto ilike '%[desc]%'	desc|Descripcion(% para todo)|texto	Reporte de visitas	0	0
6	SELECT e.descripcion,e.fecha,e.estado,t.descripcion as tipo_emergencia,m.nombre as municipio,comuna,fuente_agua,ent.nombre as entidad,\nf.nombre as funcionario FROM\nemergencias e,tipos_emergencia t,entidades ent,funcionarios f,\nmunicipios m\nWHERE e.tipo_emergencia=t.id_tipo_emergencia\nAND e.id_entidad=ent.id_entidad AND e.id_funcionario=f.id_funcionario\nAND m.id_municipio=e.id_municipio AND e.descripcion ilike '%[desc]%'	desc|Descripcion(% para todo)|texto	Reporte general de Emergencias	0	0
7	SELECT e.descripcion,e.fecha,e.estado,t.descripcion as tipo_emergencia,m.nombre as municipio,comuna,fuente_agua,ent.nombre as entidad,\nf.nombre as funcionario FROM\nemergencias e,tipos_emergencia t,entidades ent,funcionarios f,\nmunicipios m\nWHERE e.tipo_emergencia=t.id_tipo_emergencia\nAND e.id_entidad=ent.id_entidad AND e.id_funcionario=f.id_funcionario\nAND m.id_municipio=e.id_municipio AND e.id_municipio=[mun]	mun|Municipio|combo:municipios,id_municipio,nombre	Reporte de Emergencias por municipio	0	0
8	SELECT e.descripcion,e.fecha,e.estado,t.descripcion as tipo_emergencia,m.nombre as municipio,comuna,fuente_agua,ent.nombre as entidad,\nf.nombre as funcionario FROM\nemergencias e,tipos_emergencia t,entidades ent,funcionarios f,\nmunicipios m\nWHERE e.tipo_emergencia=t.id_tipo_emergencia\nAND e.id_entidad=ent.id_entidad AND e.id_funcionario=f.id_funcionario\nAND m.id_municipio=e.id_municipio AND e.tipo_emergencia=[tipo]	tipo|Tipo de Eemrgencia|combo:tipos_emergencia,id_tipo_emergencia,descripcion	Reporte de Emergencias por tipo de emergencia	0	0
9	SELECT e.descripcion,e.fecha,e.estado,t.descripcion as tipo_emergencia,m.nombre as municipio,comuna,fuente_agua,ent.nombre as entidad,\nf.nombre as funcionario FROM\nemergencias e,tipos_emergencia t,entidades ent,funcionarios f,\nmunicipios m\nWHERE e.tipo_emergencia=t.id_tipo_emergencia\nAND e.id_entidad=ent.id_entidad AND e.id_funcionario=f.id_funcionario\nAND m.id_municipio=e.id_municipio AND e.estado='[est]'	est|Estado de emergencia|combo:v_estados,estado,estado	Reporte de Emergencias por estado	0	0
11	SELECT e.descripcion,e.fecha,e.estado,t.descripcion as tipo_emergencia,m.nombre as municipio,comuna,fuente_agua,ent.nombre as entidad,\nf.nombre as funcionario FROM\nemergencias e,tipos_emergencia t,entidades ent,funcionarios f,\nmunicipios m\nWHERE e.tipo_emergencia=t.id_tipo_emergencia\nAND e.id_entidad=ent.id_entidad AND e.id_funcionario=f.id_funcionario\nAND m.id_municipio=e.id_municipio AND e.criticidad='[crit]'	crit|Criticidad|combo:v_criticidades,criticidad,criticidad	Reporte de Emergencias por criticidad	0	0
10	SELECT e.descripcion,e.fecha,e.estado,t.descripcion as tipo_emergencia,m.nombre as municipio,comuna,fuente_agua,ent.nombre as entidad,\nf.nombre as funcionario FROM\nemergencias e,tipos_emergencia t,entidades ent,funcionarios f,\nmunicipios m\nWHERE e.tipo_emergencia=t.id_tipo_emergencia\nAND e.id_entidad=ent.id_entidad AND e.id_funcionario=f.id_funcionario\nAND m.id_municipio=e.id_municipio AND e.id_entidad=[ent]	ent|Entidad|combo:entidades,id_entidad,nombre	Reporte de Emergencias  por entidad	0	0
12	select fecha,movimiento,tipo_ayuda,cantidad FROM\n(select ta.descripcion as tipo_ayuda,ie.cantidad,'Entrada'as movimiento,ie.fecha  from tipos_ayuda ta ,inventario_entrada ie\nwhere ta.id_tipo_ayuda=ie.id_tipo_ayuda  \nunion all \nselect ta.descripcion,i.cantidad,'Salida' as movimiento,is2.fecha from tipos_ayuda ta ,detalle_inventario  i,\ninventario_salida is2\nwhere is2.id_inventario_salida =i.id_inventario_salida  and ta.id_tipo_ayuda=i.id_tipo_ayuda  ) as inv WHERE tipo_ayuda  ilike '%[desc]%'\norder by tipo_ayuda,movimiento\n	desc|Descripcion(% para todo)|texto	Reporte de Inventario	0	0
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.roles (id, name, display_name, created_at, updated_at) FROM stdin;
1	admin	Administrator	2021-05-24 14:41:56	2021-05-24 14:41:56
2	user	Normal User	2021-05-24 14:41:56	2021-05-24 14:41:56
3	dev	development	2021-05-25 03:47:38	2021-05-25 03:47:38
4	funcionario	Funcionarios	2021-05-25 03:48:37	2021-05-25 03:48:37
5	municipio	Municipios	2021-06-02 03:08:49	2021-06-02 03:08:49
\.


--
-- Data for Name: seguimientos_maquinaria; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.seguimientos_maquinaria (id_seguimientos_maquinaria, fecha, descripcion, id_maquinaria, horas) FROM stdin;
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.settings (id, key, display_name, value, details, type, "order", "group") FROM stdin;
1	site.title	Site Title	Site Title		text	1	Site
2	site.description	Site Description	Site Description		text	2	Site
3	site.logo	Site Logo			image	3	Site
8	admin.loader	Admin Loader			image	3	Admin
4	site.google_analytics_tracking_id	Google Analytics Tracking ID	\N		text	4	Site
6	admin.title	Admin Title	SOS Meta :: Panel de administración		text	1	Admin
7	admin.description	Admin Description	Bienvenido a la plataforma SOS Meta		text	2	Admin
10	admin.google_analytics_client_id	Google Analytics Client ID (used for admin dashboard)	\N		text	1	Admin
9	admin.icon_image	Admin Icon Image	settings/May2021/wcG1qLqlH2O5REHBAamv.png		image	4	Admin
5	admin.bg_image	Admin Background Image	settings/May2021/HaUB0ssbaqo7NN5mAnio.jpg		image	5	Admin
\.


--
-- Data for Name: site_content; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.site_content (id_content, title, content, image, id_page, link, sort, slider, video) FROM stdin;
1	Crear Emergencias	<p>Para iniciar sesi&oacute;n, ingrese a la plataforma SOS meta usando la direcci&oacute;n: <a title="SOSMeta" href="https://sos.meta.gov.co" target="_blank" rel="noopener">https://sos.meta.gov.co</a>.</p>\r\n<p>Las credenciales le ser&aacute;n suministradas por email por el administrador de la plataforma.</p>	site-content/July2021/MZeDGmn2QhRBFbovg5KM.png	1	\N	1	\N	[]
2	Crear Emergencias	<p>Para crear la emergencia ingrese a la opcion Emergencias, utilice el boton Crear en la parte superior de la pantalla<img src="https://sos.meta.gov.co/storage/site-content/July2021/incendio.jpg" alt="" /></p>	\N	2	\N	\N	\N	[{"download_link":"site-content\\/July2021\\/UfE2e9B58dAOI1fF4DGq.webm","original_name":"Registro_Emergencia.webm"}]
3	Editar Emergencias	<div class="panel-body" style="padding-top: 0;">Para editar la emergencia ingrese a la opcion Emergencias, ingrese en la opci&oacute;n de Editar a una emergencia ya creada para registrar las novedades pertinentes.</div>	site-content/July2021/ofYelvZukj3bdRwOfRar.jpeg	3	\N	\N	\N	[{"download_link":"site-content\\/July2021\\/IgltxGjUs4a9U7t45RZ7.webm","original_name":"Edicion_Emergencia.webm"}]
5	Crear Calamidad Pública	<p>Para crear la calamidad ingrese a la opcion Calamidad P&uacute;blica dentro de la secci&oacute;n de Municipios, utilice el boton Crear en la parte superior de la pantalla.</p>	site-content/July2021/8ozquZhVy6YbyGzjHfwV.jpg	5	\N	\N	\N	[{"download_link":"site-content\\/July2021\\/t7RhMDM5gKoWUAIpNRoC.webm","original_name":"Calamidad_Registro.webm"}]
4	Información de Municipios	<p>Para editar la informaci&oacute;n del municipio, ingrese en la opci&oacute;n de Editar a un municipio ya creado para registrar las novedades pertinentes.</p>	site-content/July2021/zkT2En4xKzgKiCGDcSKB.jpeg	4	\N	\N	\N	[{"download_link":"site-content\\/July2021\\/WYhdyOvf9HgfgapX0omv.webm","original_name":"Edicion_Municipios.webm"}]
6	Descargue la aplicación Móvil	<p>para registrar emergencias desde su dispositivo m&oacute;vil descargue la App utilizando el siguiente enlace:</p>\r\n<p><a title="Aplicaci&oacute;n Android" href="https://sos.meta.gov.co/hot/sosmeta.apk" target="_blank" rel="noopener">Aplicaci&oacute;n Android&nbsp;</a></p>\r\n<p><a title="Aplicaci&oacute;n Android" href="https://sos.meta.gov.co/hot/sosmeta.apk" target="_blank" rel="noopener"><img src="https://sos.meta.gov.co/storage/site-content/July2021/WhatsApp Image 2021-07-17 at 10.19.00 PM.jpeg" alt="" width="198" height="429" /></a></p>	\N	1	\N	10	\N	[]
\.


--
-- Data for Name: site_info; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.site_info (id_info, email, phone, address, location, twitter, facebook, linkedin) FROM stdin;
\.


--
-- Data for Name: site_pages; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.site_pages (id_page, title, banner_title, banner_image, banner_text, id_template, banner_link, sort, show_menu) FROM stdin;
1	Inicio - SOS Meta	\N	\N	\N	1	\N	0	1
2	Crear Emergencias	\N	\N	\N	1	\N	2	1
3	Editar Emergencias	\N	\N	\N	1	\N	3	1
4	Información de Municipios	\N	\N	\N	1	\N	4	1
5	Crear Calamidades Públicas	\N	\N	\N	1	\N	5	1
\.


--
-- Data for Name: site_templates; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.site_templates (id_template, template) FROM stdin;
1	index
\.


--
-- Data for Name: tipos_acta; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.tipos_acta (id_tipo_acta, descripcion) FROM stdin;
1	Reunion Semanal de Seguimiento
2	Reunion Extraordinaria
\.


--
-- Data for Name: tipos_actividad; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.tipos_actividad (id_tipo_actividad, descripcion, finaliza) FROM stdin;
1	Acompañamiento inicial	0
2	Cierre de Emergencia	1
\.


--
-- Data for Name: tipos_ayuda; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.tipos_ayuda (id_tipo_ayuda, descripcion, disponible) FROM stdin;
1	Colchones	\N
4	Kit Aseo	\N
5	Kit Cocina	\N
6	Colchoneta	\N
7	Frazadas	\N
8	Mallas para Gavion	\N
9	Materiales construccion	\N
10	Otros	\N
2	Kit Alimenticio	\N
\.


--
-- Data for Name: tipos_emergencia; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.tipos_emergencia (id_tipo_emergencia, descripcion) FROM stdin;
1	Inundacion
2	Creciente Subita
3	Incendio forestal
4	Incendio estructural
\.


--
-- Data for Name: translations; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.translations (id, table_name, column_name, foreign_key, locale, value, created_at, updated_at) FROM stdin;
1	data_types	display_name_singular	5	pt	Post	2021-05-24 14:41:56	2021-05-24 14:41:56
2	data_types	display_name_singular	6	pt	Página	2021-05-24 14:41:56	2021-05-24 14:41:56
3	data_types	display_name_singular	1	pt	Utilizador	2021-05-24 14:41:56	2021-05-24 14:41:56
4	data_types	display_name_singular	4	pt	Categoria	2021-05-24 14:41:56	2021-05-24 14:41:56
5	data_types	display_name_singular	2	pt	Menu	2021-05-24 14:41:56	2021-05-24 14:41:56
6	data_types	display_name_singular	3	pt	Função	2021-05-24 14:41:56	2021-05-24 14:41:56
7	data_types	display_name_plural	5	pt	Posts	2021-05-24 14:41:56	2021-05-24 14:41:56
8	data_types	display_name_plural	6	pt	Páginas	2021-05-24 14:41:56	2021-05-24 14:41:56
9	data_types	display_name_plural	1	pt	Utilizadores	2021-05-24 14:41:56	2021-05-24 14:41:56
10	data_types	display_name_plural	4	pt	Categorias	2021-05-24 14:41:56	2021-05-24 14:41:56
11	data_types	display_name_plural	2	pt	Menus	2021-05-24 14:41:56	2021-05-24 14:41:56
12	data_types	display_name_plural	3	pt	Funções	2021-05-24 14:41:56	2021-05-24 14:41:56
13	categories	slug	1	pt	categoria-1	2021-05-24 14:41:56	2021-05-24 14:41:56
14	categories	name	1	pt	Categoria 1	2021-05-24 14:41:56	2021-05-24 14:41:56
15	categories	slug	2	pt	categoria-2	2021-05-24 14:41:56	2021-05-24 14:41:56
16	categories	name	2	pt	Categoria 2	2021-05-24 14:41:56	2021-05-24 14:41:56
17	pages	title	1	pt	Olá Mundo	2021-05-24 14:41:56	2021-05-24 14:41:56
18	pages	slug	1	pt	ola-mundo	2021-05-24 14:41:56	2021-05-24 14:41:56
19	pages	body	1	pt	<p>Olá Mundo. Scallywag grog swab Cat o'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>	2021-05-24 14:41:56	2021-05-24 14:41:56
20	menu_items	title	1	pt	Painel de Controle	2021-05-24 14:41:56	2021-05-24 14:41:56
21	menu_items	title	2	pt	Media	2021-05-24 14:41:56	2021-05-24 14:41:56
22	menu_items	title	12	pt	Publicações	2021-05-24 14:41:56	2021-05-24 14:41:56
23	menu_items	title	3	pt	Utilizadores	2021-05-24 14:41:56	2021-05-24 14:41:56
24	menu_items	title	11	pt	Categorias	2021-05-24 14:41:56	2021-05-24 14:41:56
25	menu_items	title	13	pt	Páginas	2021-05-24 14:41:56	2021-05-24 14:41:56
26	menu_items	title	4	pt	Funções	2021-05-24 14:41:56	2021-05-24 14:41:56
27	menu_items	title	5	pt	Ferramentas	2021-05-24 14:41:56	2021-05-24 14:41:56
28	menu_items	title	6	pt	Menus	2021-05-24 14:41:56	2021-05-24 14:41:56
29	menu_items	title	7	pt	Base de dados	2021-05-24 14:41:56	2021-05-24 14:41:56
30	menu_items	title	10	pt	Configurações	2021-05-24 14:41:56	2021-05-24 14:41:56
\.


--
-- Data for Name: user_roles; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_roles (user_id, role_id) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at, avatar, role_id, settings, id_funcionario, id_municipio) FROM stdin;
2	Pedro perez	pedroperez@mail.com	\N	$2y$10$/0eRHndNYXe6bXZkUdTX2.qTN3f0o0YpOD6ZvLSaYCbERVpi12SV2	\N	2021-05-25 04:05:21	2021-05-25 04:05:21	users/default.png	4	\N	2	\N
14	MARTHA TERESA JARA RIOS	jaramartha@hotmail.com	\N	$2y$12$VIuQ3hmxgjdaNU0YRKE0ceEeGdfI64GxqFRghnJDRofHAtnbUtDgK	\N	\N	\N	users/default.png	4	\N	8	\N
18	Asley Fernando Espejo Diaz	asleyfer@gmail.com	\N	$2y$12$VIuQ3hmxgjdaNU0YRKE0ceEeGdfI64GxqFRghnJDRofHAtnbUtDgK	\N	\N	\N	users/default.png	4	\N	14	\N
19	Jhon edisson caicedo gonzalez	jhonedissoncaicedo@hotmail.com	\N	$2y$12$VIuQ3hmxgjdaNU0YRKE0ceEeGdfI64GxqFRghnJDRofHAtnbUtDgK	\N	\N	\N	users/default.png	4	\N	15	\N
21	Gladys Yormary Dueñas Riveros	yormydu@hotmail.com	\N	$2y$12$VIuQ3hmxgjdaNU0YRKE0ceEeGdfI64GxqFRghnJDRofHAtnbUtDgK	\N	\N	\N	users/default.png	4	\N	17	\N
25	MARTHA AMAYA AGUIRRE	marthaamaya@meta.gov.co	\N	$2y$12$VIuQ3hmxgjdaNU0YRKE0ceEeGdfI64GxqFRghnJDRofHAtnbUtDgK	\N	\N	\N	users/default.png	4	\N	23	\N
26	David Santiago	santiagodavidt.23@gmail.com	\N	$2y$10$FDtflexoPdg5iB76cG15Tu13XZuPE5aAX9YRWiqwXBQRGe5yAP6TS	UyGSyJm96BVYAvgzpIZ2ZvZK7JMnSu34prCfhFNaTNTQlmveYbi6URw59m5L	2021-05-25 13:53:00	2021-05-25 14:00:19	users/default.png	4	\N	26	\N
11	Juanita schmitt 	jschmittro@hotmail.com	\N	$2y$12$VIuQ3hmxgjdaNU0YRKE0ceEeGdfI64GxqFRghnJDRofHAtnbUtDgK	62Fx5Ahg9v34tMPmNEzHDkgng7dY8SomuBqLe1RA4OD8t0r8g8ini4LdGfN5	\N	\N	users/default.png	4	\N	5	\N
22	Jairo Alfonso Ospino Rodriguez	jospinor@meta.gov.co	\N	$2y$10$LGFzAzcAwwOWzjsIyFQ3WeAHLugluHFAg18JnmDpwqoFy7bCPupOy	\N	\N	2021-05-25 13:46:07	users/May2021/TjrSXM3RBEk4ud7d9Rpd.jpg	4	\N	18	\N
16	Freddy Eliecer Martinez Agudelo	freddymartinezag@hotmail.com	\N	$2y$10$g5lcs04OrdcvcAWxdcC7oOkyAG3GsSVzUomO.SLLrUBYrbNkAuhkq	SK36JAPUO5QvIZ9BWP0SP4M28UTlogA5Map4tKQ3iTDXJxSStrsXlmO6pbwo	\N	2021-06-04 03:15:21	users/default.png	4	\N	12	\N
23	Nelly morwno	nellymor1115@hotmail.com	\N	$2y$10$w4BX538W8jJooRSU96edV.F4egJ4vcJQUQc4s2PJ2wmTZ2kBRjSQq	JPQ7qyn2alGbjYo9PfxVXAPASMOVJWgYTrDnltyRcltEUAHEoNMkQUmGv1xj	\N	2021-05-25 13:54:17	users/default.png	4	\N	19	\N
27	MANUEL ALEJANDRO SANCHEZ ESGUERRA	ing.manuel.esguerra10@gmail.com	\N	$2y$10$D2Z0IEaz42hm28ouMDKASOLURdpi5ZCA4z0hfhs9QU14O0KgfP5dS	\N	2021-06-01 23:00:56	2021-06-01 23:20:32	users/default.png	4	\N	27	\N
97	Developer	dev@meta.gov.co	\N	$2y$10$Z//qXrBHpOiFjlQX3m.wS.ytSpoe4OV3GZhjoD1vqa/6VuM3s3lK6	\N	2021-06-02 03:53:39	2021-06-02 03:53:54	users/default.png	3	\N	\N	\N
12	LYSETH TATIANA RUIZ ACERO	tatisruiz.12@hotmail.com	\N	$2y$12$VIuQ3hmxgjdaNU0YRKE0ceEeGdfI64GxqFRghnJDRofHAtnbUtDgK	PhZfkUybBYIaba9GbURS3eSMxRhmGx7Y1FTfxXRaGLZ4bPkaQCmCVYr6NylD	\N	2021-05-25 13:59:07	users/May2021/PuHgFnJ7bH6rilqTi6wa.jpg	4	\N	6	\N
4	Milena Leon perez	milenaleonp85@hotmail.com	\N	$2y$12$VIuQ3hmxgjdaNU0YRKE0ceEeGdfI64GxqFRghnJDRofHAtnbUtDgK	\N	\N	2021-06-17 17:02:13	users/default.png	1	\N	11	\N
20	YAMILE BAHAMON GARCIA	yamilebg07@hotmail.com	\N	$2y$12$VIuQ3hmxgjdaNU0YRKE0ceEeGdfI64GxqFRghnJDRofHAtnbUtDgK	88MFKG43PHlclvIw9LNggXNoBMHuXTpSjATlZ9OLu569DkHPg9J79QCAp2jP	\N	\N	users/default.png	4	\N	16	\N
10	Camilo Andres Caballero Balcazar	camiloacaballerob@gmail.com	\N	$2y$10$zUnirnEgMrLecjoSzaczoevTwGDacjMHQyek6ulKKlaHYPsjAm15C	k0kkOOIvBnRWxnmUqzlzuL4fsAOwwpqK6ayw4pYBgSBpJa7cICXabgz2Dhvt	\N	2021-05-25 14:00:39	users/May2021/Ym0AaN9W5D45UuauyZPV.jpeg	4	\N	10	\N
9	LUIS CARLOS GUEVARA GRANADOS	ticsolt@gmail.com	\N	$2y$12$VIuQ3hmxgjdaNU0YRKE0ceEeGdfI64GxqFRghnJDRofHAtnbUtDgK	\N	\N	2021-06-22 00:05:44	users/default.png	4	\N	4	\N
99	WILLIAM ALEXANDER ROJAS PARRA	williamrojasap@gmail.com	\N	$2y$10$nOYXeUy4h13GedSrtmGbqOiupkbPzRDvOZo8kHuSUlq0AXjcSnpAC	yBqCbOMzdRcVvP7i2vtwxBQcYcG8VrWZBsU1OQyvLRTzwvWZdly23YHJesze	2021-06-04 14:41:44	2021-06-04 14:44:39	users/default.png	2	\N	29	\N
5	ALEXIS ADRIAN RAMIREZ	aramirez@meta.gov.co	\N	$2y$12$VIuQ3hmxgjdaNU0YRKE0ceEeGdfI64GxqFRghnJDRofHAtnbUtDgK	upZ0QIxYeKeRV58N53IcDYrl7zYFg8ztVdWVi0M3DIFRDqERnk4ECZ2CX5YO	\N	2021-06-17 16:55:46	users/May2021/8Q2px3ocjiTdJCjvs7k0.jpg	1	\N	20	\N
85	Lejanias	cmgrd.lejanias@meta.gov.co	\N	$2y$12$smxubmbFwJJuY9vVFmmKuOFNzg3iLc5k8aGusxr0OwArSgHpAUpum	\N	\N	\N	users/default.png	5	\N	\N	\N
86	Puerto Concordia	cmgrd.puertoconcordia@meta.gov.co	\N	$2y$12$smxubmbFwJJuY9vVFmmKuOFNzg3iLc5k8aGusxr0OwArSgHpAUpum	\N	\N	\N	users/default.png	5	\N	\N	\N
87	Puerto Gaitan	cmgrd.puertogaitan@meta.gov.co	\N	$2y$12$smxubmbFwJJuY9vVFmmKuOFNzg3iLc5k8aGusxr0OwArSgHpAUpum	\N	\N	\N	users/default.png	5	\N	\N	\N
88	Puerto Lopez	cmgrd.puertolopez@meta.gov.co	\N	$2y$12$smxubmbFwJJuY9vVFmmKuOFNzg3iLc5k8aGusxr0OwArSgHpAUpum	\N	\N	\N	users/default.png	5	\N	\N	\N
89	Puerto Lleras	cmgrd.puertolleras@meta.gov.co	\N	$2y$12$smxubmbFwJJuY9vVFmmKuOFNzg3iLc5k8aGusxr0OwArSgHpAUpum	\N	\N	\N	users/default.png	5	\N	\N	\N
90	Puerto Rico	cmgrd.puertorico@meta.gov.co	\N	$2y$12$smxubmbFwJJuY9vVFmmKuOFNzg3iLc5k8aGusxr0OwArSgHpAUpum	\N	\N	\N	users/default.png	5	\N	\N	\N
91	Restrepo	cmgrd.restrepo@meta.gov.co	\N	$2y$12$smxubmbFwJJuY9vVFmmKuOFNzg3iLc5k8aGusxr0OwArSgHpAUpum	\N	\N	\N	users/default.png	5	\N	\N	\N
92	San Carlos De Guaroa	cmgrd.sancarlosdeguaroa@meta.gov.co	\N	$2y$12$smxubmbFwJJuY9vVFmmKuOFNzg3iLc5k8aGusxr0OwArSgHpAUpum	\N	\N	\N	users/default.png	5	\N	\N	\N
93	San Juan De Arama	cmgrd.sanjuandearama@meta.gov.co	\N	$2y$12$smxubmbFwJJuY9vVFmmKuOFNzg3iLc5k8aGusxr0OwArSgHpAUpum	\N	\N	\N	users/default.png	5	\N	\N	\N
94	San Juanito	cmgrd.sanjuanito@meta.gov.co	\N	$2y$12$smxubmbFwJJuY9vVFmmKuOFNzg3iLc5k8aGusxr0OwArSgHpAUpum	\N	\N	\N	users/default.png	5	\N	\N	\N
95	San Martin	cmgrd.sanmartin@meta.gov.co	\N	$2y$12$smxubmbFwJJuY9vVFmmKuOFNzg3iLc5k8aGusxr0OwArSgHpAUpum	\N	\N	\N	users/default.png	5	\N	\N	\N
96	Vista Hermosa	cmgrd.vistahermosa@meta.gov.co	\N	$2y$12$smxubmbFwJJuY9vVFmmKuOFNzg3iLc5k8aGusxr0OwArSgHpAUpum	\N	\N	\N	users/default.png	5	\N	\N	\N
15	Edgardo Florez Iglesias	edgardoflorez_87@hotmail.com	\N	$2y$12$VIuQ3hmxgjdaNU0YRKE0ceEeGdfI64GxqFRghnJDRofHAtnbUtDgK	ckgIE8rZsr2oVJxwn6GXUxNbRQ3gGXLvD1790tLduYc5OCBIUCrR6nxxe4Zk	\N	\N	users/default.png	4	\N	9	\N
100	DARIO CABALLERO HERRERA	dariocaballeroh@gmail.com	\N	$2y$10$c5sz9eJam2bjXi2phjQKo.eBVMuacqZj1iczJcMnTymsf2Ais.aBe	\N	2021-06-04 18:38:54	2021-06-04 19:25:09	users/default.png	4	\N	\N	\N
6	María del Pilar Giraldo Noriega	mgiraldon@meta.gov.co	\N	$2y$10$Nem2hDrC5a4tpc4M3/KQAO06c.FDwtAB4JJHVc6mPdffXOyg1T4py	48hJxWPJCSCKmbJup88abO5QlDSwHzLqcxYe8Cjjk71iDPuwQZGvm4lsJzvH	\N	2021-09-16 14:30:31	users/May2021/MqEt24pXWLeTo0BrgxGD.jpeg	4	\N	21	\N
17	Nicole Estefania Cortes Galvis 	nicolecortes734@gmail.com	\N	$2y$12$VIuQ3hmxgjdaNU0YRKE0ceEeGdfI64GxqFRghnJDRofHAtnbUtDgK	DXXVi4gmpTnzSh6odhFvfzqOQi8uYef05WL4GdfI5dmWUfQjSyfcDloQ1D2b	\N	\N	users/default.png	4	\N	13	\N
98	SANTIAGO DE LA PAVA	delapava.santiago@gmail.com	\N	$2y$10$CocvvMFnsxdyUpr4XG/QsOwZweo2hbqe2eZb8FuB2U3BrSTGMdnXi	\N	2021-06-02 16:21:00	2021-06-02 16:21:00	users/default.png	4	\N	28	\N
101	Wilson López Bogotá	wilson.bogota@meta.gov.co	\N	$2y$10$F7/1sb6lUBzhQyEwlUS4mu5wB2Nch92i2dv4ItAjclEMUNbnVA/gC	\N	2021-06-17 16:56:26	2021-06-22 16:04:56	users/default.png	1	\N	\N	\N
68	Villavicencio	cmgrd.villavicencio@meta.gov.co	\N	$2y$12$smxubmbFwJJuY9vVFmmKuOFNzg3iLc5k8aGusxr0OwArSgHpAUpum	\N	\N	\N	users/default.png	5	\N	\N	\N
69	Acacias	cmgrd.acacias@meta.gov.co	\N	$2y$12$smxubmbFwJJuY9vVFmmKuOFNzg3iLc5k8aGusxr0OwArSgHpAUpum	\N	\N	\N	users/default.png	5	\N	\N	\N
70	Barranca De Upia	cmgrd.barrancadeupia@meta.gov.co	\N	$2y$12$smxubmbFwJJuY9vVFmmKuOFNzg3iLc5k8aGusxr0OwArSgHpAUpum	\N	\N	\N	users/default.png	5	\N	\N	\N
71	Cabuyaro	cmgrd.cabuyaro@meta.gov.co	\N	$2y$12$smxubmbFwJJuY9vVFmmKuOFNzg3iLc5k8aGusxr0OwArSgHpAUpum	\N	\N	\N	users/default.png	5	\N	\N	\N
72	Castilla La Nueva	cmgrd.castillalanueva@meta.gov.co	\N	$2y$12$smxubmbFwJJuY9vVFmmKuOFNzg3iLc5k8aGusxr0OwArSgHpAUpum	\N	\N	\N	users/default.png	5	\N	\N	\N
73	Cubarral	cmgrd.cubarral@meta.gov.co	\N	$2y$12$smxubmbFwJJuY9vVFmmKuOFNzg3iLc5k8aGusxr0OwArSgHpAUpum	\N	\N	\N	users/default.png	5	\N	\N	\N
74	Cumaral	cmgrd.cumaral@meta.gov.co	\N	$2y$12$smxubmbFwJJuY9vVFmmKuOFNzg3iLc5k8aGusxr0OwArSgHpAUpum	\N	\N	\N	users/default.png	5	\N	\N	\N
75	El Calvario	cmgrd.elcalvario@meta.gov.co	\N	$2y$12$smxubmbFwJJuY9vVFmmKuOFNzg3iLc5k8aGusxr0OwArSgHpAUpum	\N	\N	\N	users/default.png	5	\N	\N	\N
77	El Dorado	cmgrd.eldorado@meta.gov.co	\N	$2y$12$smxubmbFwJJuY9vVFmmKuOFNzg3iLc5k8aGusxr0OwArSgHpAUpum	\N	\N	\N	users/default.png	5	\N	\N	\N
78	Fuente De Oro	cmgrd.fuentedeoro@meta.gov.co	\N	$2y$12$smxubmbFwJJuY9vVFmmKuOFNzg3iLc5k8aGusxr0OwArSgHpAUpum	\N	\N	\N	users/default.png	5	\N	\N	\N
79	Granada	cmgrd.granada@meta.gov.co	\N	$2y$12$smxubmbFwJJuY9vVFmmKuOFNzg3iLc5k8aGusxr0OwArSgHpAUpum	\N	\N	\N	users/default.png	5	\N	\N	\N
80	Guamal	cmgrd.guamal@meta.gov.co	\N	$2y$12$smxubmbFwJJuY9vVFmmKuOFNzg3iLc5k8aGusxr0OwArSgHpAUpum	\N	\N	\N	users/default.png	5	\N	\N	\N
81	Mapiripan	cmgrd.mapiripan@meta.gov.co	\N	$2y$12$smxubmbFwJJuY9vVFmmKuOFNzg3iLc5k8aGusxr0OwArSgHpAUpum	\N	\N	\N	users/default.png	5	\N	\N	\N
82	Mesetas	cmgrd.mesetas@meta.gov.co	\N	$2y$12$smxubmbFwJJuY9vVFmmKuOFNzg3iLc5k8aGusxr0OwArSgHpAUpum	\N	\N	\N	users/default.png	5	\N	\N	\N
83	La Macarena	cmgrd.lamacarena@meta.gov.co	\N	$2y$12$smxubmbFwJJuY9vVFmmKuOFNzg3iLc5k8aGusxr0OwArSgHpAUpum	\N	\N	\N	users/default.png	5	\N	\N	\N
84	Uribe	cmgrd.uribe@meta.gov.co	\N	$2y$12$smxubmbFwJJuY9vVFmmKuOFNzg3iLc5k8aGusxr0OwArSgHpAUpum	\N	\N	\N	users/default.png	5	\N	\N	\N
7	Juan Fajardo	juanfbarrero@gmail.com	\N	$2y$12$VIuQ3hmxgjdaNU0YRKE0ceEeGdfI64GxqFRghnJDRofHAtnbUtDgK	\N	\N	2021-07-15 03:45:16	users/default.png	4	\N	1	173
102	Restrepo	restrepo@meta.gov.co	\N	$2y$10$PUP1NFpEA/r0n0tKdvBR6.7D7PTLsucGPQYI3bAIK/G65TT.T.7x6	\N	2021-07-16 19:47:25	2021-07-16 19:47:25	users/default.png	5	\N	\N	171
109	ERIKA MAYERLIS GARAY RUIZ	erika_8299@hotmail.com	\N	$2y$10$jFD7c17BJO1tH3cWuUIid.WkXu6WcI.cuKIooFCl9dKWSouvewDxe	\N	2021-08-31 04:52:01	2021-08-31 04:52:01	users/default.png	4	\N	33	180
103	Seccional Meta Defensa Civil	sec.meta@defensacivil.gov.co	\N	$2y$10$r0O.PGq2tpatZq0t82GJ..iAHHlfr8qx7ySB8gJRSklfB6ZlH558G	\N	2021-08-05 16:03:10	2021-08-05 16:03:10	users/default.png	5	\N	\N	180
104	Delegado departamental de bomberos del Meta	bomberosptorico@gmail.com	\N	$2y$10$ht5pBJM0.7WpTYJqwcWG0Olep.DLq5QyN3ttzzZlRwnrC71qIGXSu	\N	2021-08-05 16:05:28	2021-08-05 16:05:28	users/default.png	5	\N	\N	180
76	El Castillo	cmgrd.elcastillo@meta.gov.co	\N	$2y$10$Ztg151brMFX70x8grf2iMePVR/ToOCjtb4u3I0ThHIkFzfXq8l93m	\N	\N	2021-08-05 16:06:35	users/default.png	5	\N	\N	172
13	Claudia Rocio Aparicio Duran	claudiaaparicioduran@gmail.com	\N	$2y$12$VIuQ3hmxgjdaNU0YRKE0ceEeGdfI64GxqFRghnJDRofHAtnbUtDgK	\N	\N	2021-08-12 15:13:05	users/May2021/HWqbngpRWA9KdtZ2EZDd.jpeg	1	\N	7	\N
113	DIEGO ARMANDO HERNANDEZ MONTILLA	ing.diegoahernandezm@gmail.com	\N	$2y$10$N8of1gk/LMggZbZ8./Rx1uVFJOpNjR5YhXVFhu3ewM65VJTdlP9xa	sQLUJtbgKpHvWziyqmhvVbu7q3IOXr7mEVnWSyWD2lGviUKUZF1tzQ4fOWsY	2021-08-31 05:07:29	2021-09-16 14:19:51	users/default.png	4	\N	36	180
105	Milena Leon	mleonp@meta.gov.co	\N	$2y$10$9fT.KbepNR9Mi.5WW3g0WuAceZF1/UNhRxwGCDckrtjWmzeaILF4O	42NuNVUwO80UUu0GVmbRxpNagVCDx7HNEAxOuetO8uIynO21guYoGv53k8IX	2021-08-17 20:50:40	2021-08-17 20:50:40	users/default.png	4	\N	11	\N
8	Camilo Andrés Serna Solano	csernas@meta.gov.co	\N	$2y$12$VIuQ3hmxgjdaNU0YRKE0ceEeGdfI64GxqFRghnJDRofHAtnbUtDgK	7KlUOO0mNdYjJbFGeb34FvHbKBmesYN4qZP1qmuHBsIvBmnHp6lHaM76RB8l	\N	2021-06-02 04:04:05	users/default.png	1	\N	3	\N
112	ALEXA LISBETH MORENO LADINO	alemoreno0801@gmail.com	\N	$2y$10$.DuwX.IX4.S8ssXhiaMPBOd9wcNntxyfeklt6P7zwLbC3BsP.DytC	\N	2021-08-31 05:03:48	2021-08-31 05:03:48	users/default.png	4	\N	35	180
116	LUIS ALEJANDRO PEÑA	lap142@hotmail.com	\N	$2y$10$2D2koua4n39DreQ3z6BZ7u3IcqJJksH3yKdyYX.eIHGKeuavbOZbO	\N	2021-09-16 14:31:07	2021-09-16 14:31:07	users/default.png	4	\N	38	\N
114	DIANA MARCELA PATIÑO COLORADO	ingeniera.diana23@outlook.com	\N	$2y$10$nI7pVmkHWDjYKaNif/Uy1.gMKnIS4UNIk7JongW43JYmTmQgTs6nC	\N	2021-08-31 05:08:51	2021-08-31 05:08:51	users/default.png	4	\N	37	180
106	WILLIAM DAVID VALENCIA GONZALEZ	davidvalenciag@live.com	\N	$2y$10$IX9AITdgXdgWcWT1x0kmVO1qFnihqODvOy2OFoSN0/UnhDJqhX41O	gWP2uN9937kRoEDWRZ0xjnW4XX81L5CrDp97N7KeJa4GoSIePg2AOgxDLMVf	2021-08-17 20:51:28	2021-09-08 15:30:11	users/default.png	4	\N	34	180
24	Marianne Georgina Lemus Gonzalez	georginalemus@gmail.com	\N	$2y$12$VIuQ3hmxgjdaNU0YRKE0ceEeGdfI64GxqFRghnJDRofHAtnbUtDgK	KsKqd0Qau6ASM3avbqztqlITfeiOHYO312XB0V3gM7CfARUBSCKPMm1LGmVh	\N	\N	users/default.png	4	\N	22	\N
115	Direccion de Gestion del Riesgo	gestiondelriesgoydesastres@meta.gov.co	\N	$2y$10$TmFoTeUW3Opj6G130FvbrOdPpVFQp1z0rdPvKIvYcsoNX4hFGjAhO	\N	2021-09-14 16:49:23	2021-09-14 16:49:23	users/default.png	1	\N	\N	180
107	JUAN DAVID ROMERO HERRERA	j.davidromeroh@gmail.com	\N	$2y$10$.HsAPqs2UZC08MIbkl7Cp.O8xhgZPFaKsWWo3BX8yf3Ikhc4XjILC	J9q73YpPiuD86CrEpZsGByewkh1595S114FfiyYORh6ZvCmZKdkjXv4bqljC	2021-08-31 04:48:01	2021-09-01 18:38:34	users/default.png	4	\N	31	180
108	JUAN SEBASTIAN LOPEZ PRIETO	ingsebastianlopezp@gmail.com	\N	$2y$10$LVto5RVxQp49X6WVr8LUbO6zXMqLifOKyBT1LmpwgGQ9c2J2.fIWu	\N	2021-08-31 04:50:21	2021-10-12 15:13:17	users/October2021/BhLUYUymOrtASMoryAFa.jpg	4	\N	32	180
117	Candido Moreno	candido@admin.com	\N	$2y$10$K5DgOn9bg8vqtLOG0zkDZeanDdcD2JA9MKMxwZpUencdfC36sYmzy	\N	2022-01-26 21:43:31	2022-01-26 21:43:31	users/default.png	1	\N	\N	\N
1	Admin	admin@admin.com	\N	$2y$10$92gJi0xP.x2AIr2xHThWzeqKP8XZju/1pwLBjp3dI5/2WnvF9xjKS	K3S1enXGjvifofgiHFh81IZwP19wYYDcKrNFosIGxInCem0B6vdZi0CF8IT1	2021-05-24 14:41:56	2022-01-26 21:45:15	users/May2021/fnekohZWYRzTwPnRQnrc.png	1	\N	\N	\N
\.


--
-- Data for Name: visita_emergencia; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.visita_emergencia (id_visita_emergencia, id_emergencia, id_visita) FROM stdin;
\.


--
-- Data for Name: visitas; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.visitas (id_visita, accion, fecha, asunto, interesado, localizacion, objeto, desarrollo, concepto, tecnico, recomendaciones, id_municipio, vereda, asistentes) FROM stdin;
2	\N	\N	\N	\N	4.1512610500000005,-73.63883377725107	\N	\N	\N	\N	\N	\N	\N	\N
3	\N	\N	\N	\N	5.0675718,-75.51039883648761	\N	\N	\N	\N	\N	\N	\N	\N
4	\N	2021-05-30	emergency test	dasdasd	37.2793406,-121.87455145824268	regwergwer	gwrwrtgwrtg	wtrgwtr	wrgwrgw	wregwrgw	\N	\N	\N
5	VISITA TECNICA	2021-07-13	VERIFICACION DESLIZAMIENTO	FULANITA DE TAL	4.1415692,-73.6493001	VERIFICACION AFECTACION POR DESLIZAMIENTO	SE REALIZA LA VISITA, SE REALIZA SOBRE VUELO CON DRON	\N	\N	\N	180	CENTRO	\N
\.


--
-- Name: acciones_adelantadas_id_accion_adelantada_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.acciones_adelantadas_id_accion_adelantada_seq', 8, true);


--
-- Name: actas_reunion_id_acta_reunion_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.actas_reunion_id_acta_reunion_seq', 3, true);


--
-- Name: actividades_id_actividad_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.actividades_id_actividad_seq', 235, true);


--
-- Name: calamidad_id_calamidad_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.calamidad_id_calamidad_seq', 1, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.categories_id_seq', 2, true);


--
-- Name: data_rows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.data_rows_id_seq', 304, true);


--
-- Name: data_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.data_types_id_seq', 39, true);


--
-- Name: detalle_inventario_id_detalle_inventario_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.detalle_inventario_id_detalle_inventario_seq', 19, true);


--
-- Name: emergencias_id_emergencia_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.emergencias_id_emergencia_seq', 20, true);


--
-- Name: entidades_id_entidad_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.entidades_id_entidad_seq', 1, true);


--
-- Name: exports_id_export_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.exports_id_export_seq', 1, true);


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- Name: funcionarios_id_funcionario_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.funcionarios_id_funcionario_seq', 38, true);


--
-- Name: informes_id_informe_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.informes_id_informe_seq', 1, true);


--
-- Name: inventario_entrada_id_inventario_entrada_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.inventario_entrada_id_inventario_entrada_seq', 11, true);


--
-- Name: inventario_salida_id_inventario_salida_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.inventario_salida_id_inventario_salida_seq', 11, true);


--
-- Name: inversiones_id_inversion_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.inversiones_id_inversion_seq', 8, true);


--
-- Name: mantenimientos_id_mantenimiento_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.mantenimientos_id_mantenimiento_seq', 3, true);


--
-- Name: maquinaria_id_maquinaria_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.maquinaria_id_maquinaria_seq', 16, true);


--
-- Name: medios_id_medio_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.medios_id_medio_seq', 1, false);


--
-- Name: menu_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.menu_items_id_seq', 54, true);


--
-- Name: menus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.menus_id_seq', 3, true);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.migrations_id_seq', 27, true);


--
-- Name: obligaciones_id_obligacion_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.obligaciones_id_obligacion_seq', 334, true);


--
-- Name: pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.pages_id_seq', 1, true);


--
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.permissions_id_seq', 166, true);


--
-- Name: personas_afectadas_id_personas_afectadas_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.personas_afectadas_id_personas_afectadas_seq', 11, true);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.posts_id_seq', 4, true);


--
-- Name: proyectos_id_proyecto_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.proyectos_id_proyecto_seq', 1, true);


--
-- Name: reportes_reporte_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.reportes_reporte_seq', 12, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.roles_id_seq', 5, true);


--
-- Name: seguimientos_maquinaria_id_seguimientos_maquinaria_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.seguimientos_maquinaria_id_seguimientos_maquinaria_seq', 1, false);


--
-- Name: settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.settings_id_seq', 12, true);


--
-- Name: site_content_id_content_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.site_content_id_content_seq', 6, true);


--
-- Name: site_info_id_info_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.site_info_id_info_seq', 1, false);


--
-- Name: site_pages_id_page_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.site_pages_id_page_seq', 5, true);


--
-- Name: site_templates_id_template_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.site_templates_id_template_seq', 1, true);


--
-- Name: tipos_acta_id_tipo_acta_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.tipos_acta_id_tipo_acta_seq', 2, true);


--
-- Name: tipos_actividad_id_tipo_actividad_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.tipos_actividad_id_tipo_actividad_seq', 2, true);


--
-- Name: tipos_ayuda_id_tipo_ayuda_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.tipos_ayuda_id_tipo_ayuda_seq', 10, true);


--
-- Name: tipos_emergencia_id_tipo_emergencia_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.tipos_emergencia_id_tipo_emergencia_seq', 4, true);


--
-- Name: translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.translations_id_seq', 30, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.users_id_seq', 117, true);


--
-- Name: visita_emergencia_id_visita_emergencia_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.visita_emergencia_id_visita_emergencia_seq', 1, false);


--
-- Name: visitas_id_visita_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.visitas_id_visita_seq', 5, true);


--
-- Name: acciones_adelantadas acciones_adelantadas_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.acciones_adelantadas
    ADD CONSTRAINT acciones_adelantadas_pkey PRIMARY KEY (id_accion_adelantada);


--
-- Name: actas_reunion actas_reunion_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.actas_reunion
    ADD CONSTRAINT actas_reunion_pkey PRIMARY KEY (id_acta_reunion);


--
-- Name: actividades actividades_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.actividades
    ADD CONSTRAINT actividades_pkey PRIMARY KEY (id_actividad);


--
-- Name: calamidad calamidad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calamidad
    ADD CONSTRAINT calamidad_pkey PRIMARY KEY (id_calamidad);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: categories categories_slug_unique; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_slug_unique UNIQUE (slug);


--
-- Name: data_rows data_rows_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.data_rows
    ADD CONSTRAINT data_rows_pkey PRIMARY KEY (id);


--
-- Name: data_types data_types_name_unique; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.data_types
    ADD CONSTRAINT data_types_name_unique UNIQUE (name);


--
-- Name: data_types data_types_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.data_types
    ADD CONSTRAINT data_types_pkey PRIMARY KEY (id);


--
-- Name: data_types data_types_slug_unique; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.data_types
    ADD CONSTRAINT data_types_slug_unique UNIQUE (slug);


--
-- Name: detalle_inventario detalle_inventario_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.detalle_inventario
    ADD CONSTRAINT detalle_inventario_pkey PRIMARY KEY (id_detalle_inventario);


--
-- Name: emergencias emergencias_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.emergencias
    ADD CONSTRAINT emergencias_pkey PRIMARY KEY (id_emergencia);


--
-- Name: entidades entidades_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.entidades
    ADD CONSTRAINT entidades_pkey PRIMARY KEY (id_entidad);


--
-- Name: exports exports_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.exports
    ADD CONSTRAINT exports_pkey PRIMARY KEY (id_export);


--
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- Name: funcionarios funcionarios_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_pkey PRIMARY KEY (id_funcionario);


--
-- Name: informes informes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.informes
    ADD CONSTRAINT informes_pkey PRIMARY KEY (id_informe);


--
-- Name: inventario_entrada inventario_entrada_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.inventario_entrada
    ADD CONSTRAINT inventario_entrada_pkey PRIMARY KEY (id_inventario_entrada);


--
-- Name: inventario_salida inventario_salida_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.inventario_salida
    ADD CONSTRAINT inventario_salida_pkey PRIMARY KEY (id_inventario_salida);


--
-- Name: inversiones inversiones_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.inversiones
    ADD CONSTRAINT inversiones_pkey PRIMARY KEY (id_inversion);


--
-- Name: mantenimientos mantenimientos_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.mantenimientos
    ADD CONSTRAINT mantenimientos_pkey PRIMARY KEY (id_mantenimiento);


--
-- Name: maquinaria maquinaria_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.maquinaria
    ADD CONSTRAINT maquinaria_pkey PRIMARY KEY (id_maquinaria);


--
-- Name: medios medios_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.medios
    ADD CONSTRAINT medios_pkey PRIMARY KEY (id_medio);


--
-- Name: menu_items menu_items_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.menu_items
    ADD CONSTRAINT menu_items_pkey PRIMARY KEY (id);


--
-- Name: menus menus_name_unique; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.menus
    ADD CONSTRAINT menus_name_unique UNIQUE (name);


--
-- Name: menus menus_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.menus
    ADD CONSTRAINT menus_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: municipios municipios_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.municipios
    ADD CONSTRAINT municipios_pkey PRIMARY KEY (id_municipio);


--
-- Name: obligaciones obligaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.obligaciones
    ADD CONSTRAINT obligaciones_pkey PRIMARY KEY (id_obligacion);


--
-- Name: pages pages_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_pkey PRIMARY KEY (id);


--
-- Name: pages pages_slug_unique; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_slug_unique UNIQUE (slug);


--
-- Name: permission_role permission_role_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.permission_role
    ADD CONSTRAINT permission_role_pkey PRIMARY KEY (permission_id, role_id);


--
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- Name: personas_afectadas personas_afectadas_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.personas_afectadas
    ADD CONSTRAINT personas_afectadas_pkey PRIMARY KEY (id_personas_afectadas);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: posts posts_slug_unique; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_slug_unique UNIQUE (slug);


--
-- Name: proyectos proyectos_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.proyectos
    ADD CONSTRAINT proyectos_pkey PRIMARY KEY (id_proyecto);


--
-- Name: reportes reportes_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.reportes
    ADD CONSTRAINT reportes_pkey PRIMARY KEY (reporte);


--
-- Name: roles roles_name_unique; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_unique UNIQUE (name);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: seguimientos_maquinaria seguimientos_maquinaria_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.seguimientos_maquinaria
    ADD CONSTRAINT seguimientos_maquinaria_pkey PRIMARY KEY (id_seguimientos_maquinaria);


--
-- Name: settings settings_key_unique; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_key_unique UNIQUE (key);


--
-- Name: settings settings_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);


--
-- Name: site_content site_content_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.site_content
    ADD CONSTRAINT site_content_pkey PRIMARY KEY (id_content);


--
-- Name: site_info site_info_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.site_info
    ADD CONSTRAINT site_info_pkey PRIMARY KEY (id_info);


--
-- Name: site_pages site_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.site_pages
    ADD CONSTRAINT site_pages_pkey PRIMARY KEY (id_page);


--
-- Name: site_templates site_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.site_templates
    ADD CONSTRAINT site_templates_pkey PRIMARY KEY (id_template);


--
-- Name: tipos_acta tipos_acta_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.tipos_acta
    ADD CONSTRAINT tipos_acta_pkey PRIMARY KEY (id_tipo_acta);


--
-- Name: tipos_actividad tipos_actividad_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.tipos_actividad
    ADD CONSTRAINT tipos_actividad_pkey PRIMARY KEY (id_tipo_actividad);


--
-- Name: tipos_ayuda tipos_ayuda_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.tipos_ayuda
    ADD CONSTRAINT tipos_ayuda_pkey PRIMARY KEY (id_tipo_ayuda);


--
-- Name: tipos_emergencia tipos_emergencia_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.tipos_emergencia
    ADD CONSTRAINT tipos_emergencia_pkey PRIMARY KEY (id_tipo_emergencia);


--
-- Name: translations translations_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.translations
    ADD CONSTRAINT translations_pkey PRIMARY KEY (id);


--
-- Name: translations translations_table_name_column_name_foreign_key_locale_unique; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.translations
    ADD CONSTRAINT translations_table_name_column_name_foreign_key_locale_unique UNIQUE (table_name, column_name, foreign_key, locale);


--
-- Name: user_roles user_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (user_id, role_id);


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: visita_emergencia visita_emergencia_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.visita_emergencia
    ADD CONSTRAINT visita_emergencia_pkey PRIMARY KEY (id_visita_emergencia);


--
-- Name: visitas visitas_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.visitas
    ADD CONSTRAINT visitas_pkey PRIMARY KEY (id_visita);


--
-- Name: password_resets_email_index; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX password_resets_email_index ON public.password_resets USING btree (email);


--
-- Name: permission_role_permission_id_index; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX permission_role_permission_id_index ON public.permission_role USING btree (permission_id);


--
-- Name: permission_role_role_id_index; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX permission_role_role_id_index ON public.permission_role USING btree (role_id);


--
-- Name: permissions_key_index; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX permissions_key_index ON public.permissions USING btree (key);


--
-- Name: user_roles_role_id_index; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX user_roles_role_id_index ON public.user_roles USING btree (role_id);


--
-- Name: user_roles_user_id_index; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX user_roles_user_id_index ON public.user_roles USING btree (user_id);


--
-- Name: acciones_adelantadas acciones_adelantadas_id_emergencia_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.acciones_adelantadas
    ADD CONSTRAINT acciones_adelantadas_id_emergencia_fkey FOREIGN KEY (id_emergencia) REFERENCES public.emergencias(id_emergencia) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: acciones_adelantadas acciones_adelantadas_id_entidad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.acciones_adelantadas
    ADD CONSTRAINT acciones_adelantadas_id_entidad_fkey FOREIGN KEY (id_entidad) REFERENCES public.entidades(id_entidad) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: acciones_adelantadas acciones_adelantadas_id_tipo_actividad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.acciones_adelantadas
    ADD CONSTRAINT acciones_adelantadas_id_tipo_actividad_fkey FOREIGN KEY (id_tipo_actividad) REFERENCES public.tipos_actividad(id_tipo_actividad) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: actas_reunion actas_reunion_id_tipo_acta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.actas_reunion
    ADD CONSTRAINT actas_reunion_id_tipo_acta_fkey FOREIGN KEY (id_tipo_acta) REFERENCES public.tipos_acta(id_tipo_acta) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: actividades actividades_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.actividades
    ADD CONSTRAINT actividades_fk FOREIGN KEY (id_obligacion) REFERENCES public.obligaciones(id_obligacion) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: actividades actividades_id_funcionario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.actividades
    ADD CONSTRAINT actividades_id_funcionario_fkey FOREIGN KEY (id_funcionario) REFERENCES public.funcionarios(id_funcionario) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: categories categories_parent_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_parent_id_foreign FOREIGN KEY (parent_id) REFERENCES public.categories(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: data_rows data_rows_data_type_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.data_rows
    ADD CONSTRAINT data_rows_data_type_id_foreign FOREIGN KEY (data_type_id) REFERENCES public.data_types(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: detalle_inventario detalle_inventario_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.detalle_inventario
    ADD CONSTRAINT detalle_inventario_fk FOREIGN KEY (id_inventario_salida) REFERENCES public.inventario_salida(id_inventario_salida) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: emergencias_actas emergencias_actas_id_acta_reunion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.emergencias_actas
    ADD CONSTRAINT emergencias_actas_id_acta_reunion_fkey FOREIGN KEY (id_acta_reunion) REFERENCES public.actas_reunion(id_acta_reunion) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: emergencias_actas emergencias_actas_id_emergencia_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.emergencias_actas
    ADD CONSTRAINT emergencias_actas_id_emergencia_fkey FOREIGN KEY (id_emergencia) REFERENCES public.emergencias(id_emergencia) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: emergencias emergencias_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.emergencias
    ADD CONSTRAINT emergencias_fk FOREIGN KEY (id_municipio) REFERENCES public.municipios(id_municipio) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: emergencias emergencias_id_entidad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.emergencias
    ADD CONSTRAINT emergencias_id_entidad_fkey FOREIGN KEY (id_entidad) REFERENCES public.entidades(id_entidad) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: emergencias emergencias_id_funcionario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.emergencias
    ADD CONSTRAINT emergencias_id_funcionario_fkey FOREIGN KEY (id_funcionario) REFERENCES public.funcionarios(id_funcionario) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: emergencias emergencias_tipo_emergencia_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.emergencias
    ADD CONSTRAINT emergencias_tipo_emergencia_fkey FOREIGN KEY (tipo_emergencia) REFERENCES public.tipos_emergencia(id_tipo_emergencia) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: entidades entidades_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.entidades
    ADD CONSTRAINT entidades_fk FOREIGN KEY (id_municipio) REFERENCES public.municipios(id_municipio) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: inventario_entrada inventario_entrada_id_tipo_ayuda_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.inventario_entrada
    ADD CONSTRAINT inventario_entrada_id_tipo_ayuda_fkey FOREIGN KEY (id_tipo_ayuda) REFERENCES public.tipos_ayuda(id_tipo_ayuda) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: inventario_salida inventario_salida_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.inventario_salida
    ADD CONSTRAINT inventario_salida_fk FOREIGN KEY (id_emergencia) REFERENCES public.emergencias(id_emergencia) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: inventario_salida inventario_salida_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.inventario_salida
    ADD CONSTRAINT inventario_salida_fk_1 FOREIGN KEY (id_entidad) REFERENCES public.entidades(id_entidad) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: inversiones inversiones_emergencia; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.inversiones
    ADD CONSTRAINT inversiones_emergencia FOREIGN KEY (id_emergencia) REFERENCES public.emergencias(id_emergencia) ON UPDATE CASCADE;


--
-- Name: site_content lf_content_link; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.site_content
    ADD CONSTRAINT lf_content_link FOREIGN KEY (link) REFERENCES public.site_pages(id_page) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: site_content lf_content_page; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.site_content
    ADD CONSTRAINT lf_content_page FOREIGN KEY (id_page) REFERENCES public.site_pages(id_page) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: site_pages lf_page_link; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.site_pages
    ADD CONSTRAINT lf_page_link FOREIGN KEY (banner_link) REFERENCES public.site_pages(id_page) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: site_pages lf_page_template; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.site_pages
    ADD CONSTRAINT lf_page_template FOREIGN KEY (id_template) REFERENCES public.site_templates(id_template) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: mantenimientos mantenimientos_id_mantenimiento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.mantenimientos
    ADD CONSTRAINT mantenimientos_id_mantenimiento_fkey FOREIGN KEY (id_mantenimiento) REFERENCES public.maquinaria(id_maquinaria) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: medios medios_id_emergencia_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.medios
    ADD CONSTRAINT medios_id_emergencia_fkey FOREIGN KEY (id_emergencia) REFERENCES public.emergencias(id_emergencia) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: menu_items menu_items_menu_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.menu_items
    ADD CONSTRAINT menu_items_menu_id_foreign FOREIGN KEY (menu_id) REFERENCES public.menus(id) ON DELETE CASCADE;


--
-- Name: permission_role permission_role_permission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.permission_role
    ADD CONSTRAINT permission_role_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;


--
-- Name: permission_role permission_role_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.permission_role
    ADD CONSTRAINT permission_role_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- Name: personas_afectadas personas_afectadas_id_emergencia_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.personas_afectadas
    ADD CONSTRAINT personas_afectadas_id_emergencia_fkey FOREIGN KEY (id_emergencia) REFERENCES public.emergencias(id_emergencia) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: seguimientos_maquinaria seguimientos_maquinaria_id_maquinaria_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.seguimientos_maquinaria
    ADD CONSTRAINT seguimientos_maquinaria_id_maquinaria_fkey FOREIGN KEY (id_maquinaria) REFERENCES public.maquinaria(id_maquinaria) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_roles user_roles_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- Name: user_roles user_roles_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: users users_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_fk FOREIGN KEY (id_funcionario) REFERENCES public.funcionarios(id_funcionario) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: users users_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: visita_emergencia visita_emergencia_id_emergencia_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.visita_emergencia
    ADD CONSTRAINT visita_emergencia_id_emergencia_fkey FOREIGN KEY (id_emergencia) REFERENCES public.emergencias(id_emergencia) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: visita_emergencia visita_emergencia_id_visita_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.visita_emergencia
    ADD CONSTRAINT visita_emergencia_id_visita_fkey FOREIGN KEY (id_visita) REFERENCES public.visitas(id_visita) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: visitas visitas_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.visitas
    ADD CONSTRAINT visitas_fk FOREIGN KEY (id_municipio) REFERENCES public.municipios(id_municipio) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

