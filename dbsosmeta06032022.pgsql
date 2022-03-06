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
-- Name: pqrsd; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.pqrsd (
    id_pqrsd integer NOT NULL,
    tipo text,
    id_radicado integer,
    num_oficio bigint,
    telefono bigint,
    nombre_remitente text,
    email_remitente text,
    asunto text,
    responsable integer,
    fecha_creacion timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    fecha_asignacion timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    soporte_solicitud character varying(255) DEFAULT NULL::character varying,
    num_radicado bigint,
    soporte_respuesta character varying(255) DEFAULT NULL::character varying,
    estado integer DEFAULT 0
);


ALTER TABLE public.pqrsd OWNER TO admin;

--
-- Name: pqrsd_id_pqrsd_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.pqrsd_id_pqrsd_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pqrsd_id_pqrsd_seq OWNER TO admin;

--
-- Name: pqrsd_id_pqrsd_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.pqrsd_id_pqrsd_seq OWNED BY public.pqrsd.id_pqrsd;


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
-- Name: pqrsd id_pqrsd; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.pqrsd ALTER COLUMN id_pqrsd SET DEFAULT nextval('public.pqrsd_id_pqrsd_seq'::regclass);


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
10	1	1	27	\N	2022-02-18	5	3	1
11	2	1	27	\N	2022-02-10	5	3	1
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
127	23	id_entidad	text	Id Entidad	f	f	t	t	t	t	{}	4
182	29	asistentes	multi	Asistentes	f	f	t	t	t	t	{}	11
193	30	concepto	text_area	Concepto Tecnico	f	f	t	t	t	t	{}	9
210	30	vereda	text	Vereda	f	f	t	t	t	t	{}	13
304	30	asistentes	multi	Asistentes	f	f	f	t	t	t	{}	14
121	23	estado	select_dropdown	Estado	f	f	t	t	t	t	{"default":"Registrado","options":{"Registrado":"Registrado","Aceptado":"Aceptado","Rechazado":"Rechazado"},"restricted":true}	10
129	23	emergencia_belongsto_entidade_relationship	relationship	Entidad	f	f	t	t	t	t	{"model":"\\\\App\\\\Models\\\\Entidad","table":"entidades","type":"belongsTo","column":"id_entidad","key":"id_entidad","label":"nombre","pivot_table":"entidades","pivot":"0","taggable":"0"}	15
303	23	emergencia_belongsto_user_relationship	relationship	Usuario	f	f	f	f	f	f	{"model":"\\\\App\\\\Models\\\\User","table":"users","type":"belongsTo","column":"user_id","key":"id","label":"name","pivot_table":"entidades","pivot":"0","taggable":"0"}	20
131	23	emergencia_belongsto_funcionario_relationship	relationship	Funcionarios	f	t	t	t	t	t	{"model":"\\\\App\\\\Models\\\\Funcionario","table":"funcionarios","type":"belongsTo","column":"id_funcionario","key":"id_funcionario","label":"nombre","pivot_table":"entidades","pivot":"0","taggable":"0"}	19
305	40	id_pqrsd	text	Id Pqrsd	t	f	f	f	f	f	{}	1
307	40	id_radicado	text	Id Radicado	f	t	t	t	t	t	{}	3
308	40	num_oficio	text	Num Oficio	f	t	t	t	t	t	{}	4
309	40	telefono	text	Telefono	f	t	t	t	t	t	{}	5
310	40	nombre_remitente	text	Nombre Remitente	f	t	t	t	t	t	{}	6
311	40	email_remitente	text	Email Remitente	f	t	t	t	t	t	{}	7
312	40	asunto	text	Asunto	f	t	t	t	t	t	{}	8
313	40	responsable	text	Responsable	f	t	t	t	t	t	{}	9
314	40	fecha_creacion	timestamp	Fecha Creacion	f	t	t	t	t	t	{}	10
315	40	fecha_asignacion	timestamp	Fecha Asignacion	f	t	t	t	t	t	{}	11
317	40	num_radicado	text	Num Radicado	f	t	t	t	t	t	{}	13
316	40	soporte_solicitud	file	Soporte Solicitud	f	t	t	t	t	t	{}	12
318	40	soporte_respuesta	file	Soporte Respuesta	f	t	t	t	t	t	{}	14
319	40	pqrsd_belongsto_funcionario_relationship	relationship	Responsable	f	t	t	t	t	t	{"model":"App\\\\Models\\\\Funcionario","table":"funcionarios","type":"belongsTo","column":"responsable","key":"id_funcionario","label":"nombre","pivot_table":"entidades","pivot":"0","taggable":"0"}	15
306	40	tipo	select_dropdown	Tipo	f	t	t	t	t	t	{"default":"Petici\\u00f3n","options":{"Petici\\u00f3n":"Petici\\u00f3n","Queja":"Queja","Reclamo":"Reclamo","Solicitud":"Solicitud","Sugerencia":"Sugerencia","Denuncia":"Denuncia","Informativo":"Informativo"}}	2
320	40	estado	select_dropdown	Estado	f	t	t	t	t	t	{"default":0,"options":{"0":"No asignado","1":"Asignado","2":"Terminado"}}	15
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
23	emergencias	emergencias	Emergencia	Emergencias	voyager-lifebuoy	App\\Models\\Emergencia	\N	t	2021-05-25 12:04:39	2022-02-09 03:15:34	0	App\\Http\\Controllers\\EmergenciaController	\N	{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}
40	pqrsd	pqrsd	pqrsd	CorrespondenciasPQRSD	voyager-sound	App\\Models\\Pqrsd	\N	t	2022-02-11 05:56:52	2022-03-02 21:10:08	0	\N	\N	{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}
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
25	Incendio emergencia	4.1507397,-73.5921939	2022-02-10 14:41:00	Registrado	4	180	\N	\N	1	\N	\N	Baja	["emergencias\\/February2022\\/TSFcadSbkSZY3LeYRI6X.png","emergencias\\/February2022\\/BjYUdbP2fQja0Tfe26b2.png"]	[]	146
26	Lalaala	4.1506573,-73.5924443	2022-02-10 14:50:27	Registrado	3	180	\N	\N	1	\N	\N	Baja	["files\\/filename01644504627.png","files\\/filename11644504627.png"]	[]	146
27	Ayúdanos en la inundación	4.1507421,-73.5921889	2022-02-10 15:01:28	Registrado	1	180	\N	\N	1	\N	\N	Baja	["files\\/filename01644505288.jpg","files\\/filename11644505288.jpg"]	[]	146
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
61	LUZ AIDA MEDINA AYA	1121889155	29	F	CARRERA 59#44-100 	3115452593	Administradora de empresas n/a	luza_523@hotmail.com	N/A	Contratista	1327 de 2022	2022-01-26	1.Realizar seguimiento y control a los trámites administrativos y financieros que le sean requeridos en cumplimiento del objeto contractual.\n2.Apoyo en la consolidación y archivo de los conceptos técnicos emitidos por las Entidades del orden Nacional y Departamental.\n3.Brindar apoyo en la proyección de documentos requeridos en el trámite de permisos y licencias.\n4.Mantener dispuestos en el archivo de gestión de la Dirección todos los documentos proyectados durante la ejecución del contrato.\n5.Apoyo en la organización documental de la Dirección de acuerdo con la reglamentación vigente.\n6.Obrar con lealtad y buena fe en las distintas actividades que realice\n7.Presentar informe mensual de actividades.\n8.Presentar al supervisor todos los soportes y evidencias en la realización de las actividades asignadas.\n9.Las demás que le sean asignadas y que correspondan al objeto contractual.\n"	COLMENA	SANITAS	PORVENIR
44	FLOOWER EMILIO PEÑA	86082962	37	M	CALLE 1 #1-101 CONJUNTO CERRO CAMPESTRE CASA B7	3216529952	ingeniero civil	rewolf8425@gmail.com	ESPECIALIZACIÓN	Contratista	0454 de 2022	2022-01-18	1. Asistir a reuniones, comités, capacitaciones y demás que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.\n2. Apoyo a la Supervisión de los contratos de la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.\n3. Realizar visitas técnicas e informes de acuerdo con lo asignado por la Dirección en cumplimiento del objeto contractual\n4. Dar respuesta oportuna a la correspondencia asignada por parte de la Dirección.\n5. Apoyar visitas técnicas en desarrollo del balance de calamidades que se presenten en el Departamento del Meta.\n6. Entregar periódicamente todos los documentos proyectados en atención al desarrollo de sus obligaciones.\n7. Apoyar la estructuración de los proyectos que le sean asignados por la Dirección.\n8. Apoyar en el cargue de información necesaria para de los proyectos, en las plataformas de SUIFP, SUIFP SGR y MGA\n9. Apoyar en la revisión documental de los proyectos y programas de Gestión del Riesgo, formulados por los municipios o demás entidades y demás que le sean asignados por la Dirección.\n10. Apoyar en la actualización de los proyectos que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento\n11. Apoyar en la realización y revisión de presupuestos, memorias de cantidades, especificaciones técnicas, Apus y su respectivo soporte de estudio de mercadeo, de los proyectos que le sean asignados por la Dirección.\n12. Mantener estricta reserva y confidencialidad sobre la información que conozca con ocasión de la ejecución del objeto contractual.\n13. Obrar con lealtad y buena fe en las distintas actividades que realice\n14. Presentar informe mensual de actividades\n15. Presentar al finalizar el contrato los archivos digitales que proyecto durante la ejecución contractual al supervisor del contrato con visto bueno del Director Departamental para la Gestión del Riesgo de Desastres\n16. Las demás que el sean asignadas y que correspondan al objeto contractual.\n"	COLMENA	SANITAS	PORVENIR
40	JUAN DAVID ROMERO HERRERA	1121883635	30	M	CALLE 3D # 19-72	3204767540	PROFESIONAL EN SALUD OCUPACIONAL	j.davidromeroh@gmail.com	N/A	Contratista	0493 DE 2022	2022-01-18	1. Verificar el cumplimiento en materia de seguridad y salud en el trabajo de los trabajadores que participan en la ejecución de los contratos o convenios que suscriba la dirección departamental, diferentes a la prestación de servicios profesionales o de apoyo a la gestión.\n2. Verificar el cumplimiento al sistema general de seguridad social por parte de los contratistas en especial de obra civil e interventoría que suscriba la dirección departamental para la gestión del riesgo de desastres.\n3. Elaborar planes de emergencia y contingencia que se requerían dentro del marco de las funciones y actividades que desarrolla la dirección departamental. \n4. Mantener la confidencialidad de la información atendida en el ejercicio de las actividades asignadas. \n5. Apoyar en el cumplimiento de los diferentes planes de emergencia y contingencia. \n6. Realizar el acompañamiento en caso de presentarse cualquier situación de emergencia y/o desastre.\n7. Realizar acompañamiento en la verificación del cumplimiento de las medidas de bioseguridad impuestas por el Gobierno Nacional con el fin de reducir el brote de contagios a causa del COVID-19 en las diferentes actividades que ejecuta la dirección.\n8. Supervisar las medidas de seguridad a llevar a cabo en las obras o interventoras de las cuales se le designe como apoyo.\n9. Acompañar y supervisar las actividades de alto riesgo.\n10. Ejecutar el objeto del contrato con responsabilidad ética y salvaguardando siempre los intereses de la Dirección Departamental para la Gestión del Riesgo de Desastres.\n11. Ejecutar todas las demás actividades que le sean encomendadas por el supervisor (es), del contrato. \n"	COLPATRIA ARP	SANITAS	PORVENIR
41	LUIS ALEJANDRO PEÑA ALVAREZ	1122126489	31	M	CALLE 4 #14-98	3142610022	ingeniero civil	lap142@hotmail.com	ESPECIALIZACION EN GERENCIA DE PROYECTOS DE CONSTRUCCION E INFRAESTRUCTURA	Contratista	0991 del 2022	2022-01-22	1. Asistir a reuniones, comités, capacitaciones y demás que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres\n2. Apoyo a la Supervisión de los contratos de la Dirección Departamental para la Gestión del Riesgo de Desastres.\n3. Realizar visitas técnicas e informes de acuerdo con lo asignado por la Dirección en cumplimiento del objeto contractual\n4. Apoyar visitas técnicas en desarrollo del balance de calamidades que se presenten en el Departamento del Meta.\n5. Entregar periódicamente todos los documentos proyectados en atención al desarrollo de sus obligaciones.\n6. Dar respuesta oportuna a la correspondencia asignada por parte de la Dirección.\n7. Apoyar la estructuración, formulación y viabilización de los proyectos que le sean asignados por la Dirección.\n8. Apoyar en la realización de presupuestos, memorias de cantidades, especificaciones técnicas, Apus y su respectivo soporte de estudio de mercadeo, de los proyectos que le sean asignados por la Dirección.\n9. Cargue de información necesaria para la viabilización de los proyectos, en las plataformas de SUIFP y MGA\n10. Apoyar en la revisión documental de los proyectos y programas de Gestión del Riesgo, formulados por los municipios o demás entidades y demás que le sean asignados por la Dirección.\n11. Apoyar en la actualización de los proyectos que sean asignados por la Dirección Departamental para la Gestión del Riesgo de Desastres \n12. Mantener estricta reserva y confidencialidad sobre la información que conozca con ocasión de la ejecución del objeto contractual.\n13. Obrar con lealtad y buena fe en las distintas actividades que realice\n14. Presentar informe mensual de actividades.\n15. Presentar al finalizar el contrato los archivos digitales que proyecto durante la ejecución contractual al supervisor del contrato con visto bueno del Director Departamental para la Gestión del Riesgo de Desastres"	COLMENA	CAJA COPI	COLPENSIONES
42	CLAUDIA ROCIO APARICIO DURAN	35264635	41	F	CALLE 47BIS NO. 27-35	3202485637	INGENIERA ELECTRONICA	claudiaaparicioduran@gmail.com	ESPECIALIZACION EN FORMULACION Y EVALUACION DE PROYECTOS	Contratista	0205 DEL 2022	2022-01-15	1. Asistir a reuniones, comités, capacitaciones y demás que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.\n2. Apoyo a la Supervisión de los contratos de la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.\n3. Realizar visitas técnicas e informes de acuerdo con lo asignado por la Dirección en cumplimiento del objeto contractual\n4. Dar respuesta oportuna a los derechos de petición que le sean asignados.\n5. Realizar entrega periódica de todos los documentos proyectados en atención al desarrollo de sus obligaciones.\n6. Apoyo y seguimiento a los procesos de la Dirección Departamental para la Gestión del Riesgo y Desastres.\n7. Apoyar en la revisión documental de los proyectos y programas de Gestión del Riesgo, formulados por los municipios o demás entidades y demás que le sean asignados por la Dirección.\n8. Apoyar en la elaboración, revisión, formulación y actualización de los proyectos que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento, en cumplimiento de las Metas del Plan de Desarrollo Hagamos Grande al Meta 2020-2023.\n9. Apoyar y consolidar la información de trazadores presupuestales en el instrumento de seguimiento, a proyectos de inversión SPI de los proyectos de la Dirección de Gestión del riesgo de desastres, en cumplimiento de las Metas del Plan de Desarrollo Hagamos Grande al Meta 2020-2023.\n10. Cargue de información necesaria de los proyectos, en las plataformas de SUIFP, MGA, GESPROY y SPI.\n11. Presentar informe mensual de actividades.\n12. Mantener estricta reserva y confidencialidad sobre la información que conozca con ocasión de la ejecución del objeto contractual.\n13. Obrar con lealtad y buena fe en las distintas actividades que realice\n14. Las demás que el sean asignadas y que correspondan al objeto contractual.\n15. Presentar al finalizar el contrato los archivos digitales que proyecto durante la ejecución contractual al supervisor del contrato con visto bueno del Director Departamental para la Gestión del Riesgo de Desastres.\n"	COLMENA	MEDIMAS	COLFONDOS
43	GEORGINA LEMUS	46380162	40	F	CRA 13  36 - 115 E	3118917109	Ingeniera Geologa	georginalemus@gmail.com	GESTIÓN AMBIENTAL	Contratista	0555 de 2022	2022-01-21	\n1. Apoyar en las visitas técnicas e informes de acuerdo con lo asignado por Ia Dirección Departamental pare la Gestión del riesgo de desastres.\n\n2. Actualizar la base de datos relacionada con los puntos críticos por amenazas naturales en el departamento del Meta.\n\n3. Brindar asistencia técnica en gestión del riesgo de desastres, a los diferentes municipios cuando sea requerido.\n\n4. Participar en Ia implementación y desarrollo del Decálogo de capacidades mínimas de la Dirección Departamental para mejora en los procesos de conocimiento, reducción del riesgo y manejo del desastre.\n\n5. Apoyar Ia formulación de proyectos para reducción del riesgo de desastres en el departamento de meta.\n\n6. Conformar equipos interdisciplinarios para gestión de proyectos.\n\n7. Mantener estricta reserva y confidencialidad sobre la información que conozca con ocasión de Ia ejecución del objeto contractual.\n\n8. Asistir a reuniones, comités y demás actividades que sean asignadas por Ia Dirección.\n\n9. Obrar con lealtad y buena fe en las distintas actividades que realice.\n\n\n10. Presentar informe mensual de actividades.\n\n11. Presentar al finalizar el contrato los archivos digitales que proyecto durante la ejecución contractual al supervisor del contrato con visto bueno del director Departamental para la Gestión del Riesgo de Desastres.\n\n12. Las demás que le sean asignadas e inherentes al contrato. \n"	COLMENA	NUEVA EPS	COLPENSIONES
45	EDGARDO FLOREZ IGLESIAS	1129579145	34	M	DIAGONAL 6 SUR # 40A - 124	3113216920	Ingeniero mecánico	edgardoflorez_87@hotmail.com	ESPECIALIZACIÓN	Contratista	0209 del 2022	2022-01-17	1. Asistir a reuniones, comités, capacitaciones y demás que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.\n2. Apoyar a la supervisión de los contratos que tengan relación directa con la adquisición y mantenimiento de la maquinaria amarilla.\n3. Atender visitas técnicas e informes de acuerdo con lo asignado por la Dirección en cumplimiento del objeto contractual. \n4. Asistir y participar en Comités Técnicos y demás reuniones a que haya lugar en los cuales se evaluará el estado de la maquinaria amarilla. \n5. Mantener un registro diario (bitácora), de seguimiento al uso, direccionamiento y ubicación del total de la maquinaria asignada a la Dirección departamental para la gestión del riesgo de desastres.\n6. Evaluar el estado y funcionamiento de los equipos excavadoras y volquetas que conforman el banco de maquinaria amarilla asignado a la Dirección Departamental para la Gestión del riesgo de Desastres.\n7. Planear y dirigir las actividades de mantenimiento preventivo y correctivo de la maquinaria amarilla.\n8. Elaborar procedimientos para llevar a cabo el plan de inspecciones, en los que se indique el paso a paso de como ejecutarlos, cuáles son los valores de referencia, como registrar la información obtenida y como analizarla. \n9. Participar en la planeación y ejecución de proyectos planteados por la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.\n10. Mantener y actualizar la información técnica de la maquinaria amarilla.\n11. Actualizar el inventario físico y en el sistema de todos los equipos y sus accesorios.\n12. Revisar constantemente los procedimientos de mantenimiento preventivo y los intervalos entre intervenciones para las maquinas estratégicas y críticas. \n13. Elaborar los planes de renovación de las herramientas para la adecuada ejecución de los mantenimientos preventivos y correctivos.\n14. Velar por el cumplimiento de los requerimientos de los mantenimientos y verificar el cumplimiento de las normas de seguridad por parte de los contratistas. \n15. Elaborar los informes periódicos de mantenimiento, en los que sobre todo se analizan los resultados del plan de mantenimiento. \n16. Estimar el tiempo y los materiales necesarios para realizar las labores de mantenimiento preventivo y correctivo de la maquinaria amarilla, realizando los respectivos presupuestos de costos. \n17. Mantener contacto con proveedores de repuestos, insumos y herramientas.\n18. Elaborar las solicitudes de pedidos de todos los insumos, herramientas y repuestos para la ejecución de los mantenimientos.\n19. Brindar información al jefe inmediato, del plan de mantenimiento y las actividades realizadas por parte del personal técnico externo.\n"	COLMENA	SANITAS	PROTECCIÓN
46	FREDDY ELIECER MARTÍNEZ AGUDELO 	1121824033	35	M	CALLE 5A SUR #40A-127 MAPIRE TORRE 1 APTO 301 	3204049511	Administrador de empresas 	freddymartinezag@hotmail.com	N/A	Contratista	651 del 2022	2022-01-21	1- Apoyar en la elaboración de estudios de mercado que soportan la estampa precontractual en los diferentes procesos de contratación que desarrolla la dirección departamental para la gestión del riesgo de desastres \n2- realizar informe de acuerdo con lo asignado por la dirección en cumplimiento del objeto contractual \n3- apoyar la Proyección de análisis del sector \n4- apoyar las evaluaciones en los procesos de selección que le sean requeridos \n5- asistir a reuniones, comités, capacitaciones y demás que sean indicados por la dirección departamental para la gestión del riesgo de desastres del departamento \n6- participar en la implementación y desarrollo del decálogo de capacidades mínimas de la dirección \n7- obrar con lealtad y buena fe en las distintas actividades que realice \n8- presentar a el finalizar el contrato los archivos digitales que proyectó durante la ejecución contractual. \n9-Las demás que le sean asignadas y que correspondan al objeto contractual "	COLMENA	SANITAS	PORVENIR
47	JUAN SEBASTIAN LOPEZ PRIETO	1121892967	29	M	CALLE 9SUR Nº36-115	3178954679	INGENIERO AMBIENTAL	ingsebastianlopezp@gmail.com	ESPECIALIZACIÓN EN SISTEMAS INTEGRADOS HSEQ - ESPECIALIZACIÓN EN ADMINISTRACIÓN DE LA SEGURIDAD Y SALUD EN EL TRABAJO - ESTUDIANTE MBA	Contratista	1020 del 2022	2022-01-22	1. Apoyo a la supervisión de los contratos de la Dirección Departamental para la Gestión del Riesgo de Desastres.\n2. Asistir a reuniones, comités, capacitaciones y demás que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres.\n3. Realizar visitas técnicas e informes de acuerdo con lo asignado por la Dirección Departamental para la Gestión del Riesgo de Desastres.\n4. Apoyar visitas técnicas en desarrollo del balance de calamidades que se presenten en el Departamento del Meta.\n5. Apoyar en las actividades que se presenten en el desarrollo del balance de calamidades que se presenten en el Departamento del Meta.\n6. Realizar entrega periódica de todos los documentos proyectados en atención al desarrollo de sus obligaciones.\n7. Apoyar la estructuración técnica de los proyectos que le sean asignados por la Dirección.\n8. Apoyar en la revisión documental de los proyectos y programas de gestión del riesgo, formulados por los municipios o demás entidades y demás que le sean asignados por la Dirección.\n9. Apoyar en la formulación de planes de manejo ambiental de los proyectos que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres.\n10. Apoyar en la actualización de los proyectos que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres.\n11. Apoyar en la realización y revisión de presupuestos, memorias de cantidades, especificaciones técnicas, Apus y su respectivo soporte de estudio de mercadeo, de los proyectos que le sean asignados por la Dirección.\n12. Mantener estricta reserva y confidencialidad sobre la información que conozca con ocasión de la ejecución del objeto contractual.\n13. Obrar con lealtad y buena fe en las distintas actividades que realice.\n14. Presentar informe mensual de actividades.\n15. Presentar al finalizar el contrato de los archivos digitales y físicos, que proyectó durante la ejecución contractual con visto bueno del supervisor y del Director Departamental para la Gestión del Riesgo de Desastres.\n16. Las demás que le sean asignadas y que correspondan al objeto contractual."	SURA ARL	SANITAS	COLPENSIONES
48	EDUARDO ALFREDO ÁVILA ARDILA	86063915	41	M	CRA 19 NO. 2A-61 MZ A CASA 7B	3102656059	Administrador Público 	avila0807@hotmail.com	ESPECIALIZACIÓN EN GERENCIA EMPRESARIAL 	Contratista	0649 del 2022	2022-01-22	1. Capacitar a los municipios del Departamento del Meta en los procesos de conocimiento y reducción del riesgo y manejo de desastres.\n2. Acompañar y asesorar a los municipios del Departamento del Meta en la implementación de los procesos de conocimiento y reducción del riesgo y manejo de desastres.\n3. Asistir a reuniones, comités, capacitaciones y demás que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres.\n4. Promover las políticas públicas de Gestión del Riesgo a través de estrategias que permitan mitigar el riesgo y desastres en el Departamento del Meta.\n5. Consolidar, analizar y evaluar la información de los factores de riesgo presentados en los municipios del Departamento del Meta.\n6. Proyectar solicitudes de información a las diferentes entidades públicas y/o privadas del Orden Nacional, Departamental y Municipal.\n7. Mantener estricta reserva y confidencialidad sobre la información que conozca con ocasión de la ejecución del objeto contractual.\n8. Obrar con lealtad y buena fe en las distintas actividades que realice.\n9. Las demás que le sean asignadas y que correspondan con el objeto contractual.\n"	COLMENA	COMPENSAR	PORVENIR
49	YESICA JULIETH RODRIGUEZ SANCHEZ	1121944466	24	F	CLL 11 B SUR # 18-57	3235224561	Psicología 	rodriguezpsico14@gmail.com	N/A	Contratista	0460 DEL 2022	2022-01-20	1. Asistir a reuniones, comités, capacitaciones y demás que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres.\n2. Apoyar el proceso de actualización del Plan Departamental para la Gestión del Riesgo de Desastres (PDGRD),, en los componentes comunitario, enfoque diferencial y demás asociados al perfil profesional.\n3. Capacitar a los municipios del Departamento del Meta en temas de enfoque diferencial en la gestión del riesgo de desastres y en primeros auxilios psicológicos en situaciones de emergencia.\n4. Acompañar y asesorar a los municipios del Departamento del Meta en la implementación de procesos de formación comunitaria en gestión del riesgo de desastres ( conocimiento del riesgo, reducción del riesgo y manejo de desastres),.\n5. Elaborar un documento practico de información, que facilite la orientación de intervención psicológica en una situación de crisis de desastres.\n6. Mantener estricta reserva y confidencialidad sobre la información que conozca con ocasión de la ejecución del objeto contractual.\n7.  Obrar con lealtad y buena fe en las distintas actividades que realice.\n8.  Presentar informe mensual de actividades.\n9. Presentar al finalizar el contrato los archivos digitales que proyectó durante la ejecución contractual al supervisor del contrato con visto bueno del Director Departamental para la Gestión del Riesgo de Desastres\n10. Las demás que le sean asignadas y que correspondan con el objeto contractuales\n"	COLMENA	NUEVA EPS	PORVENIR
50	DAVID ALEJANDRO SANTIAGO TIBAVIZCO	1121941657	25	M	CARRERA 42 # 20-25	3134666498	Ingeniero Civil e Ingeniero Industrial	santiagodavidt.23@gmail.com	N/A	Contratista	0648 DEL 2022	2022-01-21	1. Apoyo a la Supervisión de los contratos de la Dirección Departamental para la gestión del Riesgo de Desastres del Departamento.\n2. Dar respuesta dentro de los tiempos establecidos, a la correspondencia, Derechos de petición y demás requerimientos que sean asignados por parte de la Dirección.\n3. Asistir a reuniones, comités, capacitaciones y demás que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.\n4. Realizar visitas e inspecciones técnicas, y generar informes, informes y/o conceptos técnicos, por medio del cual se evidencie la afectación y posible solución.\n5. Apoyar visitas técnicas en desarrollo del balance de calamidades que se presenten en el Departamento del Meta.\n6. Entregar periódicamente todos los documentos proyectados en atención al desarrollo de sus obligaciones.\n7. Apoyar la estructuración técnica de los proyectos que le sean asignados por la Dirección.\n8. Apoyar en la revisión documental de los proyectos y programa de gestión del Riesgo, formulados por los municipios o demás entidades y demás que le sean asignados por la Dirección.\n9. Apoyar en la actualización de los proyectos que sean indicados por la dirección.\n10. Apoyar en el cargue de información necesaria para de los proyectos, en las plataformas de SUIT y MGA\n11. Apoyar en la realización y revisión de presupuestos, memorias de cantidades, especificaciones técnicas, Apus, y su respectivo soporte de estudio de mercadeo, de los proyectos que le sean asignados por la dirección.\n12. Mantener estricta reserva y confidencialidad sobre la información que conozca con ocasión de la ejecución del objeto contractual.\n13. Obrar con lealtad y buena fe en las distintas actividades que realice.\n14. Presentar informe mensual de actividades.\n15. Presentar al finalizar el contrato los archivos digitales que proyectó durante la ejecución contractual al supervisor del contrato con visto bueno del Director Departamental para la gestión del Riesgo de Desastres.\n16. Las demás que le sean asignadas y que correspondan al objeto contractual.\n"	COLMENA	SALUD TOTAL	PROTECCIÓN
51	ALEXA LISBETH MORENO LADINO	1122649492	30	F	CALLE 13 # 37 - 58 	3103254156	ingenieria civil	alemoreno0801@gmail.com	MAESTRIA EN GESTION DEL RIESGO Y DESARROLLO	Contratista	650	2022-01-21	1. Seguimiento y control técnico a la ejecución de las actividades de reducción y mitigación del riesgo desarrolladas por la UNGRD en coordinación con la Dirección Departamental para la Gestión del Riesgo de Desastres en los diferentes puntos criticos en el Departamento.\n2. Realizar visitas técnicas de apoyo a la supervisión de los contratos que le sean asignados por el Director Departamental para la Gestión del Riesgo de Desastres.\n3. Participar en la realización de mesas de trabajo, talleres que se efectúen en ocasión del desarrollo de las actividades relacionadas con el objeto contractual.\n4. Apoyar en la revisión documental de los proyectos y programas de Gestión del Riesgo, formulados por los municipios o demás entidades y demás que le sean asignados por la Dirección\n5. Asistir a reuniones, comités, capacitaciones y demás que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.\n6. Dar respuesta oportuna a los derechos de petición que le sean asignados.\n7. Presentar informe mensual de actividades.\n8. Obrar con lealtad y buena fe en las distintas actividades que realice\n9. Mantener estricta reserva y confidencialidad sobre la información que conozca con ocasión de la ejecución del objeto contractual.\n10. Las demás que el sean asignadas y que correspondan al objeto contractual.\n11. Acompañamiento y seguimiento a las actividades del Plan Departamental de Gestión del Riesgo de Desastres."	POSITIVA	SANITAS	PORVENIR
52	CARMENZA DANIELA VARGAS PABÓN	1121858727	32	F	CRA 30 48 91 APT 1002	3144712082	Arquitecta	cdanielavargasp@hotmail.com	DERECHO URBANÍSTICO /GESTIÓN DE ENTIDADES TERRITORIALES 	Contratista	1418 del 2022	2022-01-28	1.  Asistir a reuniones, comités, capacitaciones y demás que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres\n\n2. Apoyo a la Supervisión de los contratos de la Dirección Departamental para la Gestión del Riesgo de Desastres.\n\n3. Apoyar en la formulación, planeación y ejecución de proyectos arquitectónicos, urbanísticos y  paisajísticos que la Dirección Departamental para la Gestión del Riesgo de Desastres lo requiera.\n\n4. Realizar visitas técnicas e informes de acuerdo con lo asignado por la Dirección en cumplimiento del objeto contractual\n\n5. Recopilar información relacionada con puntos críticos en el departamento del Meta\n\n6. Recopilar información geográfica frente a los diferentes escenarios del riesgo del Departamento\n\n7. Soporte técnico administrativo y operativo de los diferentes proyectos desarrollados por la  Dirección Departamental para la Gestión del Riesgo de Desastres.\n\n8. Realizar acompañamiento a los municipios en relación a puntos críticos para la actualización del PDGRD\n\n9. Asistir a mesas de trabajo con municipios y diferentes entidades del orden territorial para la socialización de proyectos que hacen parte del PDGRD.\n\n10. Realizar entrega periódica de todos los documentos proyectados en atención al desarrollo de sus obligaciones.\n\n11. Proyectar solicitudes de información a las diferentes entidades jurídicas de orden nacional, Departamental y Municipal, privado o público.\n\n12. Asistir a las diferentes reuniones, mesas de trabajo y capacitaciones que se realicen dentro del marco del proceso de actualización del PDGRD\n\n13. Mantener estricta reserva y confidencialidad sobre la información que conozca con ocasión de la ejecución del objeto contractual.\n\n14. Obrar con lealtad y buena fe en las distintas actividades que realice\n\n15. Las demás que el sean asignadas y que correspondan al objeto contractual.\n\n16. Dar respuesta oportuna a los derechos de petición que sean asignados. \n\n17. Presentar informe mensual de actividades.\n\n18. Presentar al finalizar el contrato los archivos digitales que proyecto durante la ejecución contractual al supervisor del contrato con visto bueno del director Departamental para la Gestión del Riesgo de Desastres\n"	POSITIVA	SANITAS	PORVENIR
53	YAMILE BAHAMÓN GARCÍA	35264562	42	F	CRA 10B 24  21	3108570022	Abogada	yamilebg07@hotmail.com	DECRECHO ADMINISTRATIVO	Contratista	197	2022-01-15	1. Asesorar, proyectar y adelantar los procesos precontractuales, contractuales y postcontractuales que se surtan en la Dirección Departamental para la Gestión del Riesgo de Desastres.\n2. Atender respuestas a observaciones y realizar las evaluaciones jurídicas y actas de cierre de los procesos que se encuentran en página.\n3. Mantener estricta reserva y confidencialidad sobre la información que conozca con ocasión de la ejecución del objeto contractual.\n4. Asistir a reuniones, audiencias, comités contractuales y demás actuaciones que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.\n5. Participar en la realización de mesas de trabajo, talleres que se efectúen con ocasión del desarrollo de las actividades relacionadas con el objeto del contrato.\n6. Revisar y hacer seguimiento al estado de los procesos precontractuales y contractuales encomendados sin interesar la modalidad o la cuantía.\n7.  Obrar con lealtad y buena fe en las distintas etapas contractuales.\n8. Asistir a las reuniones y comités de seguimiento y evaluación de la contratación que sean convocados a fin de tratar temas jurídicos relacionados con los asuntos o procesos contractuales\n9. Revisar las Liquidaciones, pagos parciales y anticipos de los procesos contractuales adelantados.\n10. Efectuar las Evaluaciones jurídicas en los Procesos contractuales que le sean asignados y que adelante la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento del Meta.\n11. Estar actualizado en la normatividad vigente jurídica sobre la materia y en las directrices que imponga la Unidad Nacional para la Gestión del Riesgo de Desastres y la Secretaría Jurídica del Departamento en materia de contratación.\n12. Las demás que sean asignadas y que correspondan al objeto contractual"	COLMENA	FAMISANAR	COLPENSIONES
54	LAURA DANIELA MACIAS RODRIGUEZ	1121865984	31	F	CALLE 5C # 37-59	3108623817	INGENIERA CIVIL	ldmaciasr@hidroamericaingenieria.com	MAESTRIA EN INGENIERIA - RECURSOS HIDRAULICOS	Contratista	0987 DEL 2022	2022-01-22	1. Acatar las sugerencias de la supervisión encaminadas a mejorar el proceso.\n2. Garantizar la afiliación ante el sistema de seguridad social integral en los términos establecidos en la ley 100 de 1993, (EPS, Fondo de Pensiones y ARL), y presentar constancia de pago durante la ejecución del contrato. \n3. El contratista deberá allegar certificación del médico de ingreso legible (tendrá vigencia máxima de tres (3), años y será válido para todos los contratos que suscriba en contratista, de acuerdo con lo establecido en el artículo 18 del decreto 723 de 2013),.(Persona Natural),. \n4.  El contratista dentro del monto del contrato debe garantizar los gastos de transporte, materiales, insumos de apoyo logístico necesarios para el desarrollo del objeto del contrato.\n5. Dar cumplimiento a la Ley 594 del 2000 (Ley General de archivo),.\n6. Prestar los servicios con el personal y elementos propuestos, cualquier cambio será previamente autorizado por el Supervisor siempre que no sea de perfil inferior al ofertado.\n7. Las actividades no se pueden realizar con personas o material que pueda interpretarse como mensajes de inclinación política, social, racial, religiosa o cualquier otro que pueda ofender o causar agravio a un grupo de personas.\n8. Actuar de buena fe y diligentemente para con el supervisor del departamento y de la Gobernación del Meta teniendo en cuenta que el Contratista se considera un colaborador del Estado en el cumplimiento de los fines sociales que busca la contratación, acorde con el estatuto contractual. Por lo cual, además deberá avisar oportunamente de aquellos aspectos que puedan generar obstáculo para el desarrollo de la prestación del servicio.\n9. Presentar Informe de Ejecución previo a los pagos y demás soporte documental y cada vez que sea requerido por el Supervisor.\n10. Suscribir Actas de Inicio, Finalización y/o Liquidación del contrato.\n11. Cobrar los bienes y/o servicios suministrados y certificados por el Supervisor, con cargo al contrato, para lo cual deberá radicar cuenta, con todos los soportes documentales requeridos en los formatos del Sistema Integrado de Gestión de la Gobernación del Meta, que se encuentran publicados en la página web de la entidad.\n12. Guardar la debida reserva y confidencialidad sobre los documentos que le sean entregados o tenga conocimiento con ocasión de la ejecución del contrato así mismo abstenerse de hacer uso de la información de la población objeto obtenida con ocasión o como consecuencia directa de la ejecución del contrato.\n13. Pagar y asumir los impuestos a que haya lugar, así como las demás obligaciones legales y tributarias que le competan de acuerdo con el marco normativo.\n14. Cumplir las disposiciones y lineamientos dados en favor de la prevención, eliminación de lesiones, enfermedades y víctima mortal por ocasión del trabajo en el marco legal aplicable a los trabajadores en términos de seguridad y salud en el trabajo.\n15. Cumplir las disposiciones y directrices en favor de la prevención de la contaminación y la protección del medio ambiente a través del control adecuado de residuos y consumo responsable de recursos.\n16. Conocer y dar cumplimiento a las políticas y procedimientos de seguridad de la información establecidas por la organización, pertinentes al desarrollo del objeto contractual, de conformidad con lo estipulado en el Sistema Integrado de Gestión.\n17. cargar en la plataforma del SECOP los documentos soporte de la cuenta de cobro junto con los informes de ejecución a más tardar dentro de los tres (3), días hábiles siguientes a la fecha de elaboración de la misma \n18. Las demás que por naturaleza del contrato se requieran en el trascurso del mismo.\nOBLIGACIONES ESPECÍFICAS:\n\n1.Asistir a reuniones, comités, capacitaciones y demás que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.\n2.Dar respuesta dentro de los tiempos establecidos, a la correspondencia, Derechos de petición y demás requerimientos que sean asignados por parte de la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.\n3.Apoyo a la Supervisión de los contratos de la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.\n4.Apoyar el seguimiento, control y rendición de informes técnicos hasta la etapa de cierre de los proyectos y termites ante la Unidad Nació al para la Gestión del Riesgo de Desastres. \n5.Realizar visitas técnicas de acuerdo con lo asignado por la Dirección en cumplimiento del objeto contractual\n6.Emitir un diagnóstico y el levantamiento de la problemática una vez realizada la visita técnica donde sea requerido por la Dirección. \n7.Revisar y generar conceptos de Estudios Hidrológicos.\n8.Revisar y generar conceptos sobre Estudios y Diseños Hidráulicos.\n9.Apoyar visitas técnicas en desarrollo del balance de calamidades que se presenten en el Departamento del Meta.\n10. Entregar periódicamente los documentos proyectados en atención al desarrollo de sus obligaciones. \n11.Realizar trabajos de análisis del terreno o inmuebles que se requieren por parte de la Dirección.\n12.Participar en la definición de los estudios complementarios necesarios para los proyectos de obra.\n13.Realizar análisis de planos de proyectos de obra que requiera la Dirección.\n14.Realizar y aprobar estudios de prefactibilidad.\n15.Revisar y aprobar anteproyectos.\n16.Apoyar en la realización y revisión de presupuestos, memorias de cantidades, especificaciones técnicas, Apus y su respectivo soporte de estudio de mercadeo, de los proyectos que le sean asignados por la Dirección.\n17.Apoyar en la revisión documental de los proyectos y programas de Gestión del Riesgo, formulados por los municipios o demás entidades y demás que le sean asignados por la Dirección.\n18.Apoyar en la actualización de los proyectos que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento\n19.Mantener estricta reserva y confidencialidad sobre la información que conozca con ocasión de la ejecución del objeto contractual.\n20.Obrar con lealtad y buena fe en las distintas actividades que realice\n21.  Presentar informe mensual de actividades. \n22. Presentar al finalizar el contrato los archivos digitales que proyecto durante la ejecución contractual al supervisor del contrato con visto bueno del Director Departamental para la Gestión del Riesgo de Desastres \n23. Las demás que el sean asignadas y que correspondan al objeto contractual.\n"	POSITIVA	SANITAS	COLPENSIONES
55	JUAN DAVID REYES ESTEPA	1121889758	29	M	CALLE 47A NO 29A 08	3176645187	Abogado	juandavidreyesestepa@gmail.com	ESPECIALISTA EN DERECHO ADMINISTRATIVO Y ESPECIALISTA EN GESTIÓN DE CIUDAD Y TERRITORIO	Contratista	0723 de 2022	2022-01-22	1. Asesorar a la Dirección Departamental para la Gestión del Riesgo de Desastres en las actividades que le sean asignadas.\n2. Emitir conceptos jurídicos y proyectar la respuesta a la correspondencia que le sea asignada por el supervisor.\n3. Realizar acompañamiento al Director de Gestión del Riesgo de Desastres a las reuniones, comités, Consejos de Gestión del Riesgo y junta Departamental de Bomberos, según requerimiento.\n4. Estar Actualizado en la normatividad vigente jurídica sobre la materia y en las directrices que imponga la Unidad Nacional para la Gestión del Riesgo de Desastres y la Oficina jurídica del Departamento.\n5. Proyectar los planes de mejoramiento que le sean asignados.\n6. Atender los requerimientos de los entes de control que se presenten en la Dirección Departamental para la Gestión del Riesgo de desastres.\n7. Estar Actualizado en la normatividad vigente jurídica sobre la materia y en las directrices que imponga la Unidad Nacional para la Gestión del Riesgo de Desastres y la Secretaria jurídica del Departamento en materia de contratación.\n8. Las demás que sean asignadas y que correspondan al objeto contractual.\n"	POSITIVA	SANITAS	COLPENSIONES
56	AURA CAROLINA CASTILLO ROJAS 	30083238	42	F	CARRERA 43 15 104	3102392593	ADMINISTRADORA DE EMPRESAS 	carolinacastillo2020@gmail.com	ESPECIALIZACIÓN GERENCIA EMPRESARIAL Y MBA EN ADMINISTRACIÓN	Contratista	0459	2022-01-20	1. Brindar asesoría y acompañamiento a reuniones, capacitaciones y demás que la Dirección de Gestión del Riesgo designe para la implementación de medidas para la reducción del riesgo y manejo de desastres.\n2. Apoyar la organización administrativa de jornadas de sensibilización para la implementación de medidas en la reducción del riesgo y manejo de desastres en los Municipios del Departamento del Meta.\n3. Promover las políticas públicas de Gestión del Riesgo a través de estrategias que permitan mitigar el riesgo y desastres en el Departamento del Meta. \n4. Apoyar las actividades inherentes al Sistema de Calidad, seguimiento a matriz de riesgo y sus respectivas evidencias.     \n5. Elaborar cuadros estadísticos, tablas, y graficas que proporcionen información para el análisis  de los factores de riesgo presentados en los municipios del Departamento del Meta.\n6. Mantener estricta reserva y confidencialidad sobre la información que conozca con ocasión de la ejecución del objeto contractual.\n7.  Obrar con lealtad y buena fe en las distintas actividades que realice.\n8. Las demás que el sean asignadas y que correspondan con el objeto contractual\n"	COLMENA	SANITAS	COLPENSIONES
57	OSCAR ALBERTO CASTRILLON VELASQUEZ 	86075077	39	M	CLL 15 # 44B - 44C CASA A3 	3127980811	Profesional en mercadeo y publicidad	oacastrillonv@gmail.com	ALTA GERENCIA	Contratista	0207	2022-01-18	1. asistir a reuniones, comités, capacitaciones y demás que sean indicados por la dirección departamental para la gestión del riesgo de desastres del departamento. \n2. apoyar a la dirección en la creación de contenido digital, para la difusión de las acciones, gestiones, programas y proyectos.\n3. apoyo en la difusión y promoción en las diferentes redes sociales de las acciones realizadas por la dirección.\n4. apoyar en la implementación y construcción de estrategias de promoción de las actividades que ejecuta la dirección en los municipios del departamento.\n5. apoyar en los diferentes procesos que desarrolla la dirección a través de la elaboración de piezas gráficas para la socialización de proyectos.\n6. Obrar con lealtad y buena fe en las distintas actividades que realice.\n7. dar cumplimiento a las demás funciones que le sean asignadas y que correspondan al objeto contractual.\n8. presentar informe mensual de actividades.\n9. presentar al finalizar el contrato archivos digitales que proyecto durante la ejecución contractual al supervisor del contrato con visto bueno del director departamental de la gestión de desastres."	COLMENA	FAMISANAR	PROTECCIÓN
58	JULIAN DAVID ROJAS MARQUEZ	1121954233	23	M	MZ 53 CS 25  	3133836393	ingeniero civil 	juliand_06@hotmail.com	N/A	Contratista	1419 DEL 2022	2022-01-28	1. Asistir a reuniones, comités, capacitaciones y demás que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres.\n2. Apoyo a la Supervisión de los contratos de la Dirección Departamental para la Gestión del Riesgo de Desastres.\n3. Realizar visitas técnicas e informes de acuerdo con lo asignado por la Dirección en cumplimiento del objeto contractual.\n4. Realizar visitas técnicas de evaluación y valoración de puntos críticos, de acuerdo con lo asignado por la Dirección.\n5. Apoyo en la formulación de los análisis de precios unitarios dentro de los diferentes proyectos que desarrolle la Dirección Departamental para la Gestión del Riesgo de Desastres.\n6. Recopilar información frente a los diferentes escenarios del riesgo del Departamento.\n7. Asistir a mesas de trabajo con los Municipios  y Entidades del orden territorial para la socialización del PDGRD y la estrategia de respuesta a emergencia EDRE\n8. Proyectar respuesta a solicitudes de información a las diferentes entidades de orden nacional, departamental y municipal, privadas o públicas.\n9. Asistir a las diferentes reuniones, mesas de trabajo y capacitaciones que se realicen dentro del marco del proceso de actualización del PDGRD.\n10. Mantener estricta reserva y confidencialidad sobre la información que conozca con ocasión de la ejecución del objeto contractual.\n11. Obrar con lealtad y buena fe en las distintas actividades que realice\n"	SURA ARL	SALUD TOTAL	PORVENIR
59	MARTHA LILIANA PORRAS HERNANDEZ	1121821152	35	F	CRA 23 A # 37 D 68 CONJUNTO LLANO HERMOSO APTO 401 BLOQUE C	3204149714	INGENIERA AMBIENTAL	marthaporras@usantotomas.edu.co	ESPECIALIZACION EN SEGURIDAD Y SALUD EN EL TRABAJO	Contratista	1618 del 2022	2022-01-31	1. Asistir a reuniones, comités, capacitaciones y demás que sean indicados por la dirección departamental para la gestión del riesgo de desastres.\n2. Apoyar el proceso de actualización del Plan Departamental para la Gestión del Riesgo de Desastres (PDGRD),, en el componente ambiental y cambio climático.\n3. Consolidar información relacionada con políticas internacionales relacionadas con cambio climático para ser incorporadas como instrumentos bases en el marco del proceso de actualización.\n4. Implementar una estrategia de asistencia técnica relacionada con el cambio climático en los 29 municipios del departamento.\n5. Servir de enlace con la secretaria de ambiente y planeación en temas relacionados con cambio climático y medio ambiente.\n6. Brindar asesoría en materia ambiental en el marco de la incorporación de escenarios de riesgos.\n7. Mantener estricta reserva y confidencialidad sobre la información que conozca con ocasión de la ejecución del objeto contractual.\n8. Obrar con lealtad y buena fe en las distintas actividades que realice.\n9. Las demás que le sean asignadas y que correspondan con el objeto contractual."	SURA ARL	MEDIMAS	PORVENIR
60	JHON EDISSON CAICEDO GONZALEZ	1121867388	31	M	DG 6 SUR #40-124	3105670178	Ingeniero civil	jhonedissoncaicedo@hotmail.com	N/A	Contratista	0992	2022-01-22	1. Apoyo a la Supervisión de los contratos de la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.\n2. Dar respuesta dentro de los tiempos establecidos, a la correspondencia, Derechos de petición y demás requerimientos que sean asignados por parte de la Dirección.\n3. Asistir a reuniones, comités, capacitaciones y demás que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.\n4. Realizar visitas e inspecciones técnicas, y generar, informes y/o conceptos técnicos, por medio del cual se evidencie la afectación y posible solución.\n5. Apoyar visitas técnicas en desarrollo del balance de calamidades que se presenten en el Departamento del Meta.\n6. Entregar periódicamente los documentos proyectados en atención al desarrollo de las obligaciones.\n7. Apoyar la estructuración técnica de los proyectos que le sean asignados por la Dirección.\n8. Apoyar la revisión documental de los proyectos y programas de Gestión del Riesgo, formulados por los municipios o demás entidades y demás que le sean asignados por la Dirección.\n9. Apoyar en la actualización de los proyectos que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.\n10. Mantener estricta reserva y confidencialidad sobre la información que conozca con ocasión de la ejecución del objeto contractual.\n11. Obrar con lealtad y buena fe en las distintas actividades que realice.\n12. Presentar informe mensual de actividades\n13. Presentar al finalizar el contrato los archivos digitales que proyectó durante la ejecución contractual al supervisor del contrato con visto bueno del Director Departamental para la Gestión del Riesgo de Desastres\n14. Las demás que le sean asignadas y que correspondan al objeto contractual.\n"	COLMENA	NUEVA EPS	PORVENIR
62	LEOPOLDO SALGUERO BELTRAN	79305437	57	M	CARRERA 14B # 38-39 	3132827497	Arquitecto	leosalbe@yahoo.es 	N/A	Contratista	0854 de 2022	2022-01-23	1. Asistir a reuniones y comités, capacitaciones y demás que sean indicados por la Dirección Departamental para la Gestión de ríes o de desastres\n2. Apoyo a la supervisión de los contratos de la dirección departamental para la Gestión de riegos de desastres\n3. Realiza visitas técnicas e informe de acuerdo con lo asignado por la dirección en cumplimiento del objeto contractual\n4. Recopilar información relacionada con puntos críticos en el departamento del meta\n5. Recopilar información geográfica frente a los diferentes escenarios del riego del departamento \n6. Realizar acompañamiento a los municipios en relación a puntos críticos para la actualización del PDGRD\n7. Asistir a mesas de trabajo con mucipios y diferentes entidades del orden territorial para la socializacion de proyectos que hacen parte del PDGRD \n8. Entregar periódicamente los documentos proyectados en atención al desarrollo de sus obligaciones \n9. Proyectar solicitudes de informacion a las diferentes entidades jurídicas de orden nacional, departamental y municipal, privada o pública. \n10. Asistir a las diferentes reuniones, mesas de trabajo y capacitaciones que se realicen dentro del marco del proceso de actualización del PDGRD. \n11. Mantener estricta reserva y confidencialidad sobre la información que conozca con ocasión de la ejecución del objeto contractual. \n12. Obrar con lealtad y buena fe en las distintas actividades que realice \n13. Dar respuesta oportuna a los derechos de petición que sean asignado. \n14. Presentae informe mensual de actividades. \n15. Presentar al finalizar el contrato los archivos digitales que proyecto durante la ejecución contractual al supervisión del contrato con vista buena del director departamental para la Gestión de ríesgo de desastres. \n16. Las demás que le sean asignadas y que corresponda al objeto contractual. \n\n"	SURA ARL	SANITAS	PORVENIR
63	PATRICIA FIERRO CRUZ	51911765	53	F	CALLE 15 45-02 CONJUNTO EL TRAPICHE	3124811644	Abogado 	patriciafierrocruz@gmail.com	ESPECIALIZACION	Contratista	1417 de 2022	2022-01-28	1. Asesorar, proyectar y adelantar los procesos precontractuales, contractuales y postcontractuales que se surtan en la DIGERD.\n2. Atender respuestas a las observaciones y realizar las evaluaciones jurídicas y actas de cierre en los procesos que se encuentran en pagina.\n3. Mantener estricta reserva y confidencialidad sobre la información que conozca en ocasion de la ejecución del objeto contractual.\n4. Asistir a reuniones, audiencias, comites contractuales y demas actuaciones que sean necesarias indicados por la DIGERD.\n5. Participar en la realizacion de mesas de trabajo, talleres que se efectuen con ocasion del desarrollo de las actividades relacionadas con el objeto del contrato.\n6. Revisar y hacer seguimiento al estado de los procesos precontractuales y contractuales encomendados sin interesar la modalidad o la cuantia.\n7. Obrar con lealtad y buena fe en las distintas etapas contractuales.\n8. Asistir a las reuniones y comités de seguimiento y evaluación de la contratación que sean convocados a fin de tratar temas jurídicos relacionados con los asuntos o procesos contractuales. \n9. Revisar las liquidaciones, pagos parciales y anticipos de los procesos contractuales adelantados. \n10. Efectuar las evaluaciones jurídicas en los procesos contractuales que le sean asignados y que adelanta la DIGERD\n"	POSITIVA	SANITAS	COLPENSIONES
64	ASLEY FERNANDO ESPEJO DIAZ	80882602	36	M	CR 30 #4-66 SUR CONJ. REMANSOS DEL BOSQUE MZ5 C10	3134699122	Ingeniero Civil	asleyfer@gmail.com	ESPECIALIZACIÓN	Contratista	1114 del 2022	2022-01-28	1. Apoyar la Supervisión que realiza la Dirección Departamental Para La  Gestión Del Riesgo De Desastres al contrato de Interventoría cuyo objeto es la ""INTERVENTORIA INTEGRAL A LA CONSTRUCCION DE OBRAS DE PROTECCION EN LA LADERA DEL RIO NEGRO MUNICIPIO DE PUERTO LOPEZ-META "", para lo cual deberá realizar las actividades y procedimientos establecidos por la entidad y las demás normas que enmarquen las tareas de supervisión a realizar\n2. Dar asesoramiento competente a la Dirección Departamental Para La  Gestión Del Riesgo De Desastres, objetiva e imparcial y en todo momento otorgando la máxima importancia a los intereses de la Entidad, sin consideración alguna respecto de cualquier trabajo futuro y asegurarse de que la prestación de sus servicios esté libre de conflictos de interés.\n3. Presentar documentación mensualmente o cuando el Supervisor lo requiera, sobre el estado y avance del contrato de Interventoría del proyecto ""CONSTRUCCION DE OBRAS DE PROTECCION EN LA LADERA DEL RIO NEGRO MUNICIPIO DE PUERTO LOPEZ-META” de forma veraz, clara y oportuna de manera que no se lleve a la Dirección Departamental Para La  Gestión Del Riesgo De Desastres a tomar decisiones erróneas que perjudiquen los intereses de la entidad por la subjetividad, parcialidad o imprecisión de esta.\n4. Apoyar y gestionar el avance del proyecto hasta la etapa de la liquidación del contrato de Interventoría, para lo cual deberá proponer estrategias, emitir conceptos de carácter técnico y ejecutar acciones de avance para lograr el saneamiento integral del proyecto ""CONSTRUCCION DE OBRAS DE PROTECCION EN LA LADERA DEL RIO NEGRO MUNICIPIO DE PUERTO LOPEZ-META "", acorde y en concertación con la Supervisión del Contrato de Prestación de Servicios.\n5. Establecer canales de comunicación únicamente por vía escrita y de manera Oficial en coordinación con el Supervisor, a la Interventoría contratada para el proyecto ""CONSTRUCCION DE OBRAS DE PROTECCION EN LA LADERA DEL RIO NEGRO MUNICIPIO DE PUERTO LOPEZ-META "".\n6. Responsabilizarse por los documentos, soportes y demás elementos que sean entregados a su cargo durante la ejecución del contrato de Apoyo a la Supervisión del contrato de Interventoría del proyecto ""CONSTRUCCION DE OBRAS DE PROTECCION EN LA LADERA DEL RIO NEGRO MUNICIPIO DE PUERTO LOPEZ-META"".\n7. Apoyar la supervisión al contrato de Interventoría del proyecto ""CONSTRUCCION DE OBRAS DE PROTECCION EN LA LADERA DEL RIO NEGRO MUNICIPIO DE PUERTO LOPEZ-META"", mediante la asistencia integral en los diferentes comités que se lleven a cabo, relacionados con el proyecto y convocados tanto por la interventoría del contrato de obra, como por la Dirección Departamental Para La  Gestión Del Riesgo De Desastres.\n8. Verificar y emitir conceptos de carácter técnico frente a la revisión previa de los expedientes y documentación remitida por la Interventoría, respecto a la ejecución del proyecto ""CONSTRUCCION DE OBRAS DE PROTECCION EN LA LADERA DEL RIO NEGRO MUNICIPIO DE PUERTO LOPEZ-META"".\n9. Apoyar la revisión y viabilidad de las modificaciones relativas a los términos o especificaciones del contrato como cambios o ajustes en el personal del consultor, prórrogas, adiciones, suspensiones etc., acompañadas de la correspondiente justificación técnica solicitadas por el contratista de Obra mediante la Interventoría.\n10. Apoyar la revisión de las modificaciones relativas a los términos, especificaciones del contrato como cambios o ajustes en el personal ofertado, prorrogas, adiciones, suspensiones etc., acompañadas de la correspondiente justificación técnica solicitadas por la Interventoría del Proyecto.\n11. Apoyar a la Supervisión en la verificación y control de forma eficaz y de manera permanente en todas las etapas de ejecución del proyecto, para hacer cumplir las especificaciones técnicas, tiempos, actividades administrativas, legales, financieras y presupuestales establecidas en los respectivos contratos de Obra y de Interventoría.\n12. Verificar el cumplimiento de los requerimientos exigidos por los entes y entidades de control, teniendo en cuenta las medidas ambientales, sanitarias, forestales, ecológicas e industriales necesarias para no poner en peligro a las personas, a las cosas o al medio ambiente, y garantizar que así lo hagan, igualmente sus subcontratistas y proveedores.\n13. Entregar al finalizar el contrato de apoyo a la supervisión, todos los documentos proyectados, conocidos o trasladados, de manera física y digital de la ejecución del proyecto ""CONSTRUCCION DE OBRAS DE PROTECCION EN LA LADERA DEL RIO NEGRO MUNICIPIO DE PUERTO LOPEZ-META, DEPARTAMENTO DEL META.”\n14. Apoyar en la elaboración del informe mensual de supervisión del contrato Interventoría cuyo objeto es la ""INTERVENTORIA INTEGRAL A LA CONSTRUCCION DE OBRAS DE PROTECCION EN LA LADERA DEL RIO NEGRO MUNICIPIO DE PUERTO LOPEZ-META"", del cual deberá quedar soporte físico y digital, en las carpetas del archivo contractual  de la Dirección Departamental Para La  Gestión Del Riesgo De Desastres Apoyar coordinadamente la Interventoría del proyecto, la convocatoria de los comités técnicos de obra, que se realicen en el desarrollo del contrato de obra que tiene por objeto la ""CONSTRUCCION DE OBRAS DE PROTECCION EN LA LADERA DEL RIO NEGRO MUNICIPIO DE PUERTO LOPEZ-META"".\n15. Asistir y participar en los comités técnicos de obra, que se realicen en el desarrollo del Proyecto ""CONSTRUCCION DE OBRAS DE PROTECCION EN LA LADERA DEL RIO NEGRO MUNICIPIO DE PUERTO LOPEZ-META"".\n16. Elaborar las actas que se generen con ocasión de los comités técnicos de obra, garantizando que las mismas sean suscritas por todas las personas que hayan intervenido.\n17. Solicitar y notificar de manera oficial a la interventoría, el cumplimiento de las obligaciones contractuales, entrega de informes dentro de los (5), primeros días de cada mes, seguimiento al contrato de obra, verificaciones de afiliación al sistema de seguridad social del personal tanto de Obra como de Interventoría y las demás que permitan llevar reporte de la ejecución del proyecto.\n18. Apoyar la supervisión del contrato de Interventoría, mediante la realización de visitas técnicas de obra, como mínimo una vez por semana durante por lo menos tres días o cuando el Supervisor lo requiera, a fin de verificar el avance de ejecución del proyecto.\n19. Proyectar las respuestas a los requerimientos o solicitudes realizadas por los entes de control, veedurías, comunidad en general y/o cualquier entidad que solicite información, respecto al estado, avance de ejecución de obra e información relacionada con el proyecto.\n20. Verificar el avance de ejecución del proyecto, con el fin de prever eventuales incumplimientos de plazos. Informando a la Dirección Departamental Para La  Gestión Del Riesgo De Desastres de los posibles incumplimientos contractuales correspondientes.\n21. Coordina junto con la  Dirección Departamental Para La  Gestión Del Riesgo De Desastres, las acciones, notificaciones o requerimientos a realizar por posibles incumplimientos por parte del contratista de interventoría y obra del proyecto.\n22. Apoyar la verificación de los informes y demás documentación presentados por la interventoría.\n23. Proyectar las actas de modificaciones, suspensiones, prórrogas y demás trámites que se realicen al contrato de interventoría del proyecto ""CONSTRUCCION DE OBRAS DE PROTECCION EN LA LADERA DEL RIO NEGRO MUNICIPIO DE PUERTO LOPEZ-META” Estas acciones deberán ser coordinadas por la Supervisión y avaladas por la Interventoría.\n24. Digitalizar y cargar la Información de programación, ejecución, contractual y demás requerida por las plataformas del sistema de Monitoreo, Seguimiento, Control y Evaluación (SMSCE), entre ellas GESPROY, del contrato de obra, interventoría y apoyo a la supervisión. Esta información se cargará y enviará para aprobación por parte de la Dirección Departamental Para La  Gestión Del Riesgo De Desastres a más tardar dentro de los diez (10), primeros días de cada mes.\n25. Entregar un informe técnico en físico y digital, que contenga las acciones realizadas en el periodo del informe.\n26. Las demás actividades que se requieran para garantizar el cumplimiento del proyecto, y sean asignadas por el Supervisor del contrato.\n"	SEGUROS BOLIVAR	MEDIMAS	COLFONDOS
65	NICOLE ESTEFANIA CORTES GALVIS 	1125229562	27	F	CALLE 7B N 44-05	3202353162	Ingeniera Ambiental 	nicolecortes2094@hotmail.com	N/A	Contratista	0455 del 2022	2022-01-18	1. Apoyo a la supervisión de los contratos de la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.\n2. Dar respuesta oportuna a la correspondencia asignada por parte de la Dirección.\n3. Asistir a reuniones, comités y demás actividades que sean asignadas por la Dirección.\n4. Realizar visitas técnicas e informes de acuerdo con lo asignado por la Dirección Departamental para la Gestión del riesgo de desastres.\n5. Apoyar vistas técnicas en desarrollo del balance de calamidades que se presenten en el Departamento del Meta.\n6. Realizar entrega periódica de todos los documentos proyectados en atención al desarrollo de sus obligaciones.\n7. Apoyar la estructura técnica de los proyectos que le sean asignados por la Dirección\n8. Apoyar en la revisión documental de los proyectos y programas de Gestión del Riesgo\n9. Apoyar en la actualización de los proyectos que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.\n10. Apoyar en el cargue de información necesaria para los proyectos, en las plataformas de SUIF y MGAWEB\n11. Mantener estricta reserva y confidencialidad sobre la información que conozca con ocasión de la ejecución del objeto contractual\n12. Obrar con lealtad y buena fe en las distintas actividades que realice\n13. Las demás que sean asignadas y que correspondan al objeto contractual\n14. Presentar informe mensual de actividades.\n15. Presentar al finalizar el contrato los archivos digitales que proyecto durante la ejecución contractual al supervisor del contrato con visto bueno del Director para la Gestión del Riesgo de Desastres\n"	COLMENA	SANITAS	PORVENIR
66	DIANA MARCELA PATIÑO COLORADO	1121840570	33	F	CALLE 14 Nº 33-04	3112449351	Ingeniera Industrial	ingeniera.diana23@outlook.com	ESPECIALIZACION SISTEMA DE GESTION DE LA CALIDAD	Contratista	0378 del 2022	2022-01-18	1. Apoyar en el trámite de solicitud de bancos de programas y proyectos de los diferentes procesos de selección que tramite la Dirección.\n2. Tramitar la solicitud de certificado de disponibilidad presupuestal de los diferentes procesos de selección que tramite la Dirección.\n3. Apoyar la estructuración de estudios previos de los diferentes procesos de selección que tramite la Dirección.\n4. Revisar de los soportes para pago en los contratos que se encuentre el Director como supervisor.\n5. Proyectar las actas de inicio y liquidación de los contratos que se hayan suscrito por la Dirección que le sean asignados.\n6. Apoyar la verificación documental en el cumplimiento de la Ley de archivo en todos los procesos contractuales de la dirección.\n7. Apoyar el archivo de gestión de la dirección.\n8. Verificar que se diligencian en debida forma los documentos de los documentos contractuales en los formatos establecidos por la entidad.\n9. Mantener estricta reserva y confidencialidad sobre la información que conozca con ocasión de la ejecución del objeto contractual.\n10. Obrar con lealtad y buena fe en las distintas actividades que realice\n11. Presentar informe mensual de actividades.\n12. Presentar al finalizar el contrato los archivos digitales que proyectó durante la ejecución contractual al supervisor del contrato con visto bueno del Director Departamental para la Gestión del Riesgo de Desastres\n"	COLMENA	SANITAS	PORVENIR
67	NELLY MORENO	40386753	53	F	CARRERA 26 NO. 8 86 APTO 707 SANTA MARIA RESERVADO	3208471060	ABOGADA	nellymor1115@hotmail.com	ESPECIALIZACION- DERECHO PUBLICO	Contratista	0210 del 2022	2022-01-18	1. Apoyar la proyección de las respuestas a los derechos de petición que lleguen a la Dirección para la Gestión del Riesgo de Desastres. \n\n2. Proyectar la respuesta de las solicitudes de los Consejos de Gestión del Riesgo y Junta Departamental de Defensa Civil del Meta, según requerimiento. \n\n3. Proyectar conceptos jurídicos en los trámites administrativos en donde se requiera apoyo.\n\n4. Apoyar jurídicamente a los profesionales de la Dirección en los trámites ante las demás entidades que tienen relación directa con las con las funciones de la entidad. \n\n5. Apoyar la proyección de las respuestas a las solicitudes de quejas y reclamos allegados a la Dirección, para aprobación del Coordinador Departamental para la Gestión del Riesgo de Desastres. \n\n6. Participar en la realización de mesas de trabajo, talleres que se efectúan con ocasión del desarrollo de las actividades relacionadas con el objeto del contrato.\n\n7. Obrar con lealtad y buena fe en las distintas actividades que realice.\n\n8. Asesorar y brindar apoyo jurídico a la Dirección Departamental para la Gestión del Riesgo de Desastres. \n\n9. Estar actualizado en la normatividad vigente jurídica sobre la materia y en las directrices que imponga la Unidad Nacional para la Gestión del Riesgo de Desastres.\n\n10. Participar en la implementación y desarrollo del Decálogo de Capacidades Mínimas de la Dirección para la Gestión del Riesgo de Desastres para mejora en los procesos de conocimiento, reducción del riesgo y manejo de desastres. \n\n11. Mantener estricta reserva y confidencialidad sobre la información que conozca con ocasión de Ia ejecución del objeto contractual.\n\n12. Obrar con lealtad y buena fe en las distintas actividades que realice.\n\n13. Las demás que le sean asignadas e inherentes al contrato. \n\n14. Presentar informe mensual de actividades.\n\n15. Presentar al finalizar el contrato los archivos digitales que proyecto durante la ejecución contractual al supervisor del contrato con visto bueno del director Departamental para la Gestión del Riesgo de Desastres\n"	COLMENA	SANITAS	PORVENIR
68	CRISTIAN FELIPE PORTELA TRIANA	1121912453	27	M	CARRERA 18 # 4B 46 	3142535934	Ingeniero civil	felipe.portela88@hotmail.com	N/A	Contratista	0833 DEL 2022	2022-01-28	1. Apoyo a la Supervisión de los contratos de la Dirección Departamental para la gestión del Riesgo de Desastres del Departamento.\n2. Dar respuesta dentro de los tiempos establecidos, a la correspondencia, Derechos de petición y demás requerimientos que sean asignados por parte de la Dirección.\n3. Asistir a reuniones, comités, capacitaciones y demás que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.\n4. Realizar visitas e inspecciones técnicas, y generar informes, informes y/o conceptos técnicos, por medio del cual se evidencie la afectación y posible solución. \n5. Apoyar visitas técnicas en desarrollo del balance de calamidades que se presenten en el Departamento del Meta.\n6. Entregar periódicamente todos los documentos proyectados en atención al desarrollo de sus obligaciones.\n7. Apoyar la estructuración técnica de los proyectos que le sean asignados por la Dirección.\n8. Apoyar en la revisión documental de los proyectos y programa de gestión del Riesgo, formulados por los municipios o demás entidades y demás que le sean asignados por la Dirección. \n9. Apoyar en la actualización de los proyectos que sean indicados por la dirección.\n10. Apoyar en la realización y revisión de presupuestos, memorias de cantidades, especificaciones técnicas, Apus, y su respectivo soporte de estudio de mercadeo, de los proyectos que le sean asignados por la dirección.\n11. Mantener estricta reserva y confidencialidad sobre la información que conozca con ocasión de la ejecución del objeto contractual. \n12. Obrar con lealtad y buena fe en las distintas actividades que realice.\n13. Presentar informe mensual de actividades.\n14. Presentar al finalizar el contrato los archivos digitales que proyectó durante la ejecución contractual al supervisor del contrato con visto bueno del Director Departamental para la gestión del Riesgo de Desastres.\n15. Las demás que le sean asignadas y que correspondan al objeto contractual.\n"	COLMENA	MEDIMAS	PORVENIR
69	ERIKA MAYERLIS GARAY RUIZ 	1121890174	29	F	CRA 44 A# 30-24 CASA 4	3154994837	ADM DE EMPRESAS 	erika_8299@hotmail.com	N/A	Contratista	300 DEL 2022	2022-01-18	1.APOYO EN LA REVISIÓN Y CONTROL DE TODA LA INFORMACION QUE SE RECEPCIONA A TRAVES DE LOS CORREO INSTITUCIONALES ASIGNADOS A LA DIRECCIÓN \n2. APOYO EN EL REGISTRO DE SEGUIMIENTO Y CONTROL DE TODAS LAS PETICIONES, INFORMES Y DOCUMENTOS QUE INGRESEN A LA DEPENDENCIA \n3 APOYO EN LA ASIGNACIÓN DE CORRESPONDENCIA INTERNA, Y REMITIR RESPUESTAS Y DOCUMENTOS ASIGNADOS A LAS DIFERENTES DIRECCIONES  DE CORREO QUE SE LE SEAN IDICADOS \n4. APOYO EN EL REGISTRO DE CONSECUTIVOS DE CORRESPONDENCIA Y ACTOS ADMINISTRATIVOS GENERADOS POR LA DIRECCIÓN \n5.APOYO EN LA ORGANIZACIÓN DOCUMENTAL DE ACUERDO CON LA  REGLAMENTACIÓN VIGENTE \n6.OBRAR CON LEALTAD Y BUENA FE EN LAS DISTINTAS ACTIVIDADES QUE SE REALICE \n7.PRESENTAR INFORME  MENSUAL DE ACTIVIDADES \n8. PRESENTAR AL FINALIZAR EL CONTRATO LOS ARHIVOS DIGITALES QUE PROYECTO DURANTE LA EJECUCIÓN CONTRACTUAL  AL SUPERVISOR DEL CONTRATO CON VISTO BUENO DEL DIRECTOR DEPARTAMENTAL PARA LA GESTIÓN DEL RIESGO DE DESASTRES \n9. LAS DEMAS QUE SEAN ASIGNADAS Y LE CORRESPONDAN AL OBJETO CONTRACTUAL. "	COLMENA	FAMISANAR	PORVENIR
70	DIEGO LEONARDO RUBIO RIVERA	1214719097	28	M	CALLE 41#19-22	3142375403	Ingeniero Civil	rubio.r26@hotmail.com	N/A	Contratista	1326 del 2022	2022-01-31	1. Apoyo a la Supervisión de los contratos de la Dirección Departamental para la gestión del Riesgo de Desastres del Departamento.\n2. Dar respuesta dentro de los tiempos establecidos, a la correspondencia, Derechos de petición y demás requerimientos que sean asignados por parte de la Dirección.\n3. Asistir a reuniones, comités, capacitaciones y demás que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.\n4. Realizar visitas e inspecciones técnicas, y generar informes, informes y/o conceptos técnicos, por medio del cual se evidencie la afectación y posible solución.\n5. Apoyar visitas técnicas en desarrollo del balance de calamidades que se presenten en el Departamento del Meta.\n6. Entregar periódicamente los documentos proyectados en atención al desarrollo de sus obligaciones.\n7. Apoyar la estructuración técnica de los proyectos que le sean asignados por la Dirección.\n8. Apoyar en la revisión documental de los proyectos y programa de gestión del Riesgo, formulados por los municipios o demás entidades y demás que le sean asignados por la Dirección.\n9. Apoyar en la actualización de los proyectos que sean indicados por la dirección.\n10. Apoyar en la realización y revisión de presupuestos, memorias de cantidades, especificaciones técnicas, Apus, y su respectivo soporte de estudio de mercadeo, de los proyectos que le sean asignados por la dirección.\n11. Mantener estricta reserva y confidencialidad sobre la información que conozca con ocasión de la ejecución del objeto contractual.\n12. Obrar con lealtad y buena fe en las distintas actividades que realice.\n13. Presentar informe mensual de actividades.\n14. Presentar al finalizar el contrato los archivos digitales que proyectó durante la ejecución contractual al supervisor del contrato con visto bueno del Director Departamental para la gestión del Riesgo de Desastres\n15. Las demás que le sean asignadas y que correspondan al objeto contractual\n"	SURA ARL	SALUD TOTAL	PORVENIR
71	JULIAN ALEXANDER TORRES QUIROGA	86069457	40	M	CALLE 15 3-67 ESTE. 	3155872847	INGENIERO CIVIL	jatoquiro@hotmail.com	N/A	Contratista	0598 del 2022	2022-01-22	1. Apoyo a la Supervisión de los contratos de la Dirección Departamental para la gestión del Riesgo de Desastres del Departamento.\n2. Dar respuesta dentro de los tiempos establecidos, a la correspondencia, Derechos de petición y demás requerimientos que sean asignados por parte de la Dirección.\n3. Asistir a reuniones, comités, capacitaciones y demás que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.\n4. Realizar visitas e inspecciones técnicas, y generar informes, informes y/o conceptos técnicos, por medio del cual se evidencie la afectación y posible solución. \n5. Apoyar visitas técnicas en desarrollo del balance de calamidades que se presenten en el Departamento del Meta.\n6. Entregar periódicamente todos los documentos proyectados en atención al desarrollo de sus obligaciones.\n7. Apoyar la estructuración técnica de los proyectos que le sean asignados por la Dirección.\n8. Apoyar en la revisión documental de los proyectos y programa de gestión del Riesgo, formulados por los municipios o demás entidades y demás que le sean asignados por la Dirección. \n9. Apoyar en la actualización de los proyectos que sean indicados por la dirección.\n10. Apoyar en el cargue de información necesaria para de los proyectos, en las plataformas de SUIT y MGA\n11. Apoyar en la realización y revisión de presupuestos, memorias de cantidades, especificaciones técnicas, Apus, y su respectivo soporte de estudio de mercadeo, de los proyectos que le sean asignados por la dirección.\n12. Mantener estricta reserva y confidencialidad sobre la información que conozca con ocasión de la ejecución del objeto contractual. \n13. Obrar con lealtad y buena fe en las distintas actividades que realice.\n14. Presentar informe mensual de actividades.\n15. Presentar al finalizar el contrato los archivos digitales que proyectó durante la ejecución contractual al supervisor del contrato con visto bueno del Director Departamental para la gestión del Riesgo de Desastres.\n\n"	COLMENA	MEDIMAS	PROTECCIÓN
72	YANETH VIVIANA VIVAS CASTRILLON 	40342291	36	F	CRA 18A # 32-56 LLANO GRANDE	3132638312	Psicologa	vivianavivas2017@gmail.com 	MASTER ALTA GRERENCIA	Contratista	1044 del 2022	2022-01-23	1. Acompañar y asesorar a los municipios del Departamento del Meta en la implementación de procesos de formación comunitaria en gestión del riesgo de desastres (conocimiento del riesgo, reducción del riesgo y manejo de desastres),.\n2. Coordinar y apoyar la entrega de Ayudas Humanitarias de emergencia por parte de la Dirección de Gestión del Riesgo.\n3. Apoyar a las comunidades brindando capacitación en gestión del riesgo de desastres\n4. Elaborar cronogramas mensuales de capacitación a comunidades\n5. Apoyar la implementación de la gestión del riesgo de desastres en las juntas de acción comunal en el departamento.\n6. Acompañar las actividades relacionadas con salud\n7. Mantener estricta reserva y confidencialidad sobre la información que conozca con ocasión de la ejecución del objeto contractual.\n8. Obrar con lealtad y buena fe en las distintas actividades que realice.\n9. Las demás que le sean asignadas y que correspondan con el objeto contractual."	SURA ARL	SALUD TOTAL	PORVENIR
73	KAREN STEPHANIE RAMIREZ PATIÑO	1121904938	28	F	CALLE 36A 21 51 ESTE	3202356234	ingeniero civil	stepha.ramirezp@gmail.com	ESPECIALIACION EN VIAS Y TRANSPORTE	Contratista	1445 DE 2022	2022-01-31	1. Asistir a reuniones, comités, capacitaciones y demás que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.\n2. Dar respuesta dentro de los tiempos establecidos, a la correspondencia, Derechos de petición y demás requerimientos que sean asignados por parte de la Dirección.\n3. Apoyo a la Supervisión de los contratos de la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.\n4. Realizar visitas técnicas de acuerdo con lo asignado por la Dirección en cumplimiento del objeto contractual\n5. Dar respuesta oportuna a la correspondencia asignada por parte de la Dirección.\n6. Emitir un diagnóstico y el levantamiento de la problemática de las visitas de obra que le sean asignadas.\n7. Revisar conceptos sobre proyectos de vías y/o puentes.\n8. Apoyar visitas técnicas en desarrollo del balance de calamidades que se presenten en el Departamento del Meta.\n9. Entregar periódicamente todos los documentos proyectados en atención al desarrollo de sus obligaciones.\n10. Realizar trabajos de análisis del terreno o inmuebles que se requieren por parte de la Dirección.\n11. Participar en la definición de los estudios complementarios necesarios para los proyectos de obra.\n12. Realizar análisis de planos de proyectos de obra que requiera la Dirección.\n13. Realizar y aprobar estudios de prefactibilidad.\n14. Revisar y aprobar anteproyectos.\n15. Apoyar en la realización y revisión de presupuestos, memorias de cantidades, especificaciones técnicas, Apus y su respectivo soporte de estudio de mercadeo, de los proyectos que le sean asignados por la Dirección.\n16. Apoyar en la revisión documental de los proyectos y programas de Gestión del Riesgo, formulados por los municipios o demás entidades y demás que le sean asignados por la Dirección.\n17. Apoyar en la actualización de los proyectos que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento\n18. Mantener estricta reserva y confidencialidad sobre la información que conozca con ocasión de la ejecución del objeto contractual.\n19. Obrar con lealtad y buena fe en las distintas actividades que realice\n20. Presentar informe mensual de actividades\n21. Presentar al finalizar el contrato los archivos digitales que proyectó durante la ejecución contractual al supervisor del contrato con visto bueno del director Departamental para la Gestión del Riesgo de Desastres\n22. Las demás que le sean asignadas y que correspondan al objeto contractual.\n"	COLMENA	SALUD TOTAL	PORVENIR
74	WILSON JORGE GUAQUEZ CALDERON 	79300958	58	M	CARRERA 19 B NO 18-12 	3115665160	Profesional Ciencias Militares y Abogado 	wilsonguaquez@hotmail.com 	DERECHO PROCEDIMIENTO PENAL CONSTITUCIONAL 	Contratista	227 del 2022	2022-01-17	OBLIGACIONES ESPECÍFICAS:\n1. Asesorar a la Dirección Departamental para la Gestión del Riesgo de Desastres en las   \n  Actividades que le sean asignadas.\n2. Emitir conceptos jurídicos y proyectar la respuesta a la correspondencia que le sea                   \n       Asignada por el Supervisor.\n3. Realizar acompañamiento al Director de Gestión del Riesgo de Desastres a las        Reuniones comités Consejos de Gestión del Riesgo y Junta Departamental de      Bomberas según requerimiento\n4. Estar actualizado en la normatividad vigente jurídica sobre la materia y en las directrices     que imponga la Unidad Nacional para la Gestión del Riesgo de desastres y la Oficina Jurídica del Departamento.\n5. Proyectar los planes de mejoramiento que le sean asignados.\n6. Atender los requerimientos de los entes de control que se presenten  en la Dirección       \n           Departamental para la Gestión del Riesgo de desastres\n7. Estar actualizado en la normatividad vigente jurídica sobre la materia y en las directrices \n        que imponga la Unidad Nacional para la Gestión del Riesgo de Desastres y la Secretaria     \n           Jurídica del Departamento en materia de contratación.\n8. Las demás que sean asignadas y que correspondan al objeto contractual."	POSITIVA	SALUD TOTAL	PORVENIR
75	ADRIANA BOBADILLA 	1121853633	32	F	CALLE 4 #34 B 10 	3114752007	ARQUITECTO	arqadrianabg@gmail.com	ESPECIALISTA EN CONTRATACION PUBLICA 	Contratista	1458 DEL 2022	2022-01-28	1. Asistir a las diferentes reuniones, mesas de trabajo y capacitaciones que se realicen dentro del marco del proceso de actualización del PDGRD\n2. Apoyar a la entidad en la elaboración Viabilizarían, trámites y gestión de los proyectos de obra Pública.\n3. Realizar el seguimiento a los proyectos de infraestructura asignados por la secretaria PDGRD\n4. Apoyar en el desarrollo y ejecución de contratos que tengan como objetivo específico obra civil y mitigación de riesgos\n5. Realizar visitas a los sitios donde se adelanten las obras en desarrollo de los programas a cargo del PDGRD\n6. Hacer entrega periódica de todos los documentos proyectados en atención al desarrollo de sus obligaciones.\n7. Presentar informe mensual de actividades.\n8. Presentar apoyo  a la secretaria  de Gestión del Riesgo en las actividades en las cuales el jefe de la oficina estime conveniente  la administración departamental. \n"	COLMENA	SANITAS	PROTECCIÓN
76	CESAR HERNANDO CRUZ MURILLO	1121852564	32	M	CALLE 17 # 37 G 63 	3133617035	Administrador de Empresas	cesarcruzmurillo@gmail.com	ESPECIALIZACIÓN DE GESTIÓN DE PROYECTOS 	Contratista	1415 de 2022	2022-01-28	1. Realizar seguimiento y control a los trámites administrativos que le sean requeridos en cumplimiento del objeto contractual.\n2. Realizar visitas e informes de las comunidades atendidas en los diferentes eventos.\n3. Brindar apoyo en la realización de planes y estrategias para la atención de emergencias y desastres en el Departamento.\n4. Apoyo en la consolidación de información de eventos de emergencias y desastres causados en el Departamento del Meta.\n5. Mantener dispuestos en el archivo de gestión de la Dirección todos los documentos proyectados durante la ejecución del contrato.\n6. Obrar con lealtad y buena fe en las distintas actividades que realice\n7. Presentar informe mensual de actividades.\n8. Presentar al supervisor todos los soportes y evidencias en la realización de las actividades asignadas.\n9. Las demás que le sean asignadas y que correspondan al objeto contractual.\n"	POSITIVA	NUEVA EPS	PORVENIR
77	JOHAN BAYRON PULIDO SABOGAL	86083297	37	M	CALLE 4 B 24-84 	3134206628	Arquitecto	joba8410@hotmail.com 	NINGUNA	Contratista	1459 del 2022	2022-01-28	1. Desarrollar estrategias y actividades para la atención de las comunidades involucradas en situaciones reales o potenciales de riesgo, de conformidad con las situaciones presentadas en el Departamento del meta.\n2. Acudir a reuniones, comités, capacitaciones y demás que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres.\n3.  Presentar informes a entes de control y vigilancia sobre el estado de avance de las actividades realizadas en la Unidad de Gestión del Riesgo, al momento que estos los requieran.\n4. Realizar visitas técnicas a predios identificados y recopilar información relacionada con puntos críticos en el departamento del meta.\n5. Tramitar en los entes competentes, la obtención de los documentos necesarios para soportar las respuestas a las solicitudes y/o requerimientos de su competencia. \n6. Participar en la formulación, diseño, organización, ejecución y control de planes y programas del área de su competencia.\n7. Cumplir de manera efectiva la misión, visión, política y objetivos de calidad, y la ejecución de los procesos en que interviene en razón del cargo.\n8. Desempeñar las demás funciones que le sean asignadas por el jefe inmediato, las que reciba por delegación y aquellas inherentes a las que desarrolla la dependencia.\n9. Ejecutar el proyecto aceptado y contratado, con el mantenimiento de sus formas, dimensiones, calidades y utilidad a la hora de desempeñar dicha función.\n10. Verificar que se ejecuten los proyectos, en cuanto a su forma con arreglo a las normas constructivas especificadas en el proyecto, o si alguna quedara sin especificar, de lo que se decidiera en la obra.\n"	COLPATRIA ARP	FAMISANAR	PORVENIR
78	CAMILA JUANITA SCHMITT ROJAS	1018474709	26	F	CALLE 47 A #28-10	3106886623	ARQUITECTURA	jschmittro@hotmail.com	GERENCIA DE PROYECTOS	Contratista	1241 DEL 2022	2022-01-25	\n1. Asistir a reuniones, comités, capacitaciones y demás que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.\n2. Realizar visitas técnicas e informes de acuerdo con lo asignado por la Dirección en cumplimiento del objeto contractual\n3. Apoyar visitas técnicas en desarrollo del balance de calamidades que se presenten en el Departamento del Meta.\n4. Realizar entrega periódica de todos los documentos proyectados en atención al desarrollo de sus obligaciones.\n5. Apoyar la estructuración técnica de los proyectos que le sean asignados por la Dirección.\n6. Apoyar en la realización de presupuestos, memorias de cantidades, especificaciones técnicas, Apus y su respectivo soporte de estudio de mercadeo, de los proyectos que le sean asignados por la Dirección.\n7. Apoyar en la revisión documental de los proyectos y programas de Gestión del Riesgo, formulados por los municipios o demás entidades y demás que le sean asignados por la Dirección.\n8. Apoyar en la actualización de los proyectos que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento\n9. Mantener estricta reserva y confidencialidad sobre la información que conozca con ocasión de la ejecución del objeto contractual.\n10. Las demás que el sean asignadas y que correspondan al objeto contractual.\n11. Presentar informe mensual de actividades\n12. Presentar al finalizar el contrato los archivos digitales que proyecto durante la ejecución contractual al supervisor del contrato con visto bueno del Director Departamental para la Gestión del Riesgo de Desastres\n\n\n"	COLMENA	SANITAS	PROTECCIÓN
79	ROSALIA  ENCIZO QUENZA	68286273	61	F	CALLE  42 NO.35B - 21	3163552076	ADMINISTRADORA  PUBLICA	rencizoquenza94@gmail.com	N/A	Contratista	1004 del 2022	2022-01-23	1. Realizar seguimiento y  contol a los  tramites administrativos que  le  sean  requeridos  en cumplimiento  del objeto contractual.\n2. Realizar  visitas e  informes en  el  desasrrollo de  planes y  estrategias de  conocimiento del riesgo  en  las  diferentes  comunidades del Departamento del Meta.\n3. Brindar apoyo en la  proyecion de  documentos que le  sean  asisgnadas.\n4. Mantener dispuestos en el archivo de  gestion de  la  direccion todos los documentos proyectados  durante la ejecucion del  contrato.\n5. Apoyo en la  organizacion  documental  de la  Direccion  de  acuerdo con la reglamentacion vigente.\n6. Obrar con  lealtad y  buena  fe  en las diferentes  actividades que  realice.\n7. Presentar informes mensuales de  actividades.\n8. Presentar  al supervisor  todos los soportes y  evidencias en la realizacion de  las actividaddes asignadas.\n9. las  demas  que  le  sean  asignadasy que correspondan  al  objeto contractual. "	COLMENA	SANITAS	PORVENIR
80	JOHN FERNANDO LUPPI JARAMILLO 	1121867775	32	M	CALLE 6 # 33 B 57	3114035031	Bachiller Técnico 	luppi14@hotmail.com	N/A	Contratista	1566 de 2022	2022-01-31	1. Asistir a reuniones, comités, capacitaciones y demás que sean indicados por la dirección departamental para la gestión de riesgos de desastres.\n2. Apoyo en la organización y conservación de documentos, tanto físicos como digitales, incluyendo correos electrónicos, reportes técnicos y otros documentos administrativos.\n3. Escanear documentos físicos para respaldarlos de forma digital.\n4. Brindar asistencia registrando información y realizando el mantenimiento de la bases de datos.\n5. Apoyo en la organización de los diferentes comités y mesas de trabajo asignadas por la dirección.\n6. Mantener estricta reserva y confidencialidad sobre la información que conozca con ocasión de la ejecución del objeto contractual.\n7. Obrar con lealtad y buena fe en las distintas actividades que realice.\n8. Presentar informe mensual de actividades.\n9. Presentar al finalizar el contrato los archivos digitales que Proyectó durante la ejecución contractual al supervisor del contrato con visto bueno del director departamental para gestión de riesgo y desastres.\n10. Las demás que le sean asignadas y que correspondan al objeto contractual. "	COLMENA	SANITAS	PORVENIR
81	INGRID TATIANA TRIGOS ZULUAGA 	1121924822	26	F	CALLE 28A # 14-31	3115059317	Administrador público 	tatianatrigoszuluaga64@gmail.com 	N/A	Contratista	556 del 2022	2022-01-22	1. Asistir a reuniones, comités, capacitaciones y demás que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento\n2. Apoyar la organización administrativa de la dirección departamental\n3. Apoyo la organización del archivo de la dirección\n4. Apoyar en el seguimiento de la política de calidad y matrices de riesgo del sistema de calidad por parte de la dirección departamental.\n5. Elaboración de informes que se requieran en el marco de las actividades que se ejecutan por parte de la dirección departamental.\n6. Obrar con lealtad y buena fe en las distintas actividades que realice\n7. Dar cumplimiento a las demás funciones que le sean asignadas y que correspondan al objeto contractual\n"	COLMENA	MEDIMAS	COLFONDOS
82	DARIO CABALLERO HERRERA	86071537	34	M	CALLE 14 B#44-35	3186234299	Ing. Civil 	dariocaballeroh@gmail.com	ESPECIALISTA EN ESTRUCTURAS	Contratista	0988 DEL 2022	2022-02-22	1. Acatar las sugerencias de la supervisión encaminadas a mejorar el proceso.\n2. Las demás contenidas en la propuesta y que hacen parte integral del presente contrato.\n3. Garantizar la afiliación ante el sistema de seguridad social integral en los términos establecidos en la ley 100 de 1993, (EPS, Fondo de Pensiones y ARL), y presentar constancia de pago durante la ejecución del contrato.\n4. El contratista deberá allegar certificación del examen pre ocupacional respectivo una vez legalizado el contrato, dando cumplimiento al capítulo 5 artículo 18 del decreto No. 0723 de 2013 reglamentario de la ley 1562 de 2012.\n5. El contratista dentro del monto del contrato debe garantizar los gastos de transporte, materiales, insumos de apoyo logístico necesarios para el desarrollo del objeto del contrato.\n6. Dar cumplimiento a la Ley 594 del 2000 (Ley General de archivo),.\n7. Prestar los servicios con el personal y elementos propuestos, cualquier cambio será previamente autorizado por el Supervisor siempre que no sea de perfil inferior al ofertado.\n8. Las actividades no se pueden realizar con personas o material que pueda interpretarse como mensajes de inclinación política, social, racial, religiosa o cualquier otro que pueda ofender o causar agravio a un grupo de personas.\n9. Actuar de buena fe y diligentemente para con el supervisor del departamento y de la Gobernación del Meta teniendo en cuenta que el Contratista se considera un colaborador del Estado en el cumplimiento de los fines sociales que busca la contratación, acorde con el estatuto contractual. Por lo cual, además deberá avisar \n10. Apoyar en la realización y revisión de presupuestos, memorias de cantidades, mesas técnicas, Apus y su respectivo soporte de estudio de mercadeo de los proyectos asignados por la Dirección.\n11. Apoyar en la revisión documental de los proyectos y programas de Gestión del riesgo, por los municipios o demás entidades y demás que le sean asignados por el Director.\n12. Apoya en la actualización de los proyectos que sean indicados por la Dirección para la Gestión del Riesgo de Desastres del Departamento.\n13. Mantener estricta reserva  y confidencialidad sobre la información que conozca con la ejecución del objeto contractual.\n14. Obrar con lealtad y buena fe en las distintas actividades que realice.\n15. Las demás que sean asignadas y que correspondan al objeto contractual.\n16. Presentar informe mensual de actividades.\n17. Presentar al finalizar el contrato los archivos digitales que proyecto durante la ejecución contractual al supervisor del contrato con visto bueno del Director Departamental para la Gestión del Riesgo de Desastres.\n\n\n"	POSITIVA	MEDIMAS	PORVENIR
83	WILLIAM DAVID VALENCIA GONZÁLEZ 	1234788445	24	M	CALLE 6 SUR 24 A 27	3142086954	Ingeniero civil 	davidvalenciag@live.com	N/A	Contratista	0993 del 2022	2022-01-22	1.    Asistir  a  reuniones,   comités  y  demás  que  sean  indicados   por  la   Dirección\nDepartamental para la Gestión del Riesgo de Desastres.\n2.    Apoyo  a  la  Supervisión  de los contratos  de la  Dirección  Departamental para la\nGestión del Riesgo de Desastres.\n3.    Realizar visitas técnicas e informes de acuerdo con lo asignado por la Dirección en cumplimiento del objeto contractual.\n4.    Recopilar información relacionada con puntos críticos en el departamento del Meta.\n5.    Recopilar información  geográfica frente  a los  diferentes  escenarios del riesgo del\nDepartamento.\n6.    Asistir a mesas de trabajo con municipios y diferentes entidades del orden territorial para la socialización. de proyectos que hacen parte del PDGRD.\n7.    Proyectar solicitudes  de información  a las  diferentes entidades de orden nacional,\ndepartamental y municipal,  privadas o públicas.\n8.    Acompañamiento de los procedimientos y procesos de la Estrategia Departamental de Respuesta de Emergencias - EDRE\n9.    Mantener estricta reserva y confidencialidad  sobre la  información que conozca con\nocasión de la ejecución del objeto contractual.\n10.  Obrar con lealtad y buena fe en las distintas actividades que realice.\n11.   Presentar informe mensual de actividades.\n12.  Presentar  al  finalizar  el  contrato  los  archivos  drgitales  que  proyectó durante  la ejecución contractual al supervisor del contrato con visto bueno del director Departamental para la Gestión del Riesgo de Desastres.\n13.  Las demás que le sean asignadas y que correspondan al objeto contractual.\n"	COLMENA	SANITAS	PORVENIR
84	OMAR ENRIQUE GUERRERO LEÓN	1121893943	29	M	CR 38A #10-04	3115175922	INGENIERO CIVIL	omar.guerrero.leon24@gmail.com	ESTUDIANDO ESPECIALIZACION	Contratista	1386 DEL 2022	2022-01-31	1. Asistir a reuniones, comités, capacitaciones y demás que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.\n2. Dar respuesta dentro de los tiempos establecidos, a la correspondencia, Derechos de petición y demás requerimientos que sean asignados por parte de la Dirección.\n3. Apoyo a la Supervisión de los contratos de la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.\n4. Realizar visitas técnicas de acuerdo con lo asignado por la Dirección en cumplimiento del objeto contractual\n5. Dar respuesta oportuna a la correspondencia asignada por parte de la Dirección.\n6. Una vez realizada la visita técnica, deberá realizar un diagnóstico y el levantamiento de la problemática.\n7. Revisar conceptos sobre diseños y reforzamientos estructurales.\n8. Apoyar visitas técnicas en desarrollo del balance de calamidades que se presenten en el Departamento del Meta.\n9. Entregar periódicamente los documentos proyectados en atención al desarrollo de sus obligaciones.\n10. Realizar trabajos de análisis del terreno o inmuebles que se requieren por parte de la Dirección.\n11. Participar en la definición de los estudios complementarios necesarios para los proyectos de obra.\n12. Realizar análisis de planos de proyectos de obra que requiera la Dirección.\n13. Realizar y aprobar estudios de prefactibilidad.\n14. Revisar y aprobar anteproyectos.\n15. Apoyar en la realización y revisión de presupuestos, memorias de cantidades, especificaciones técnicas, Apus y su respectivo soporte de estudio de mercadeo, de los proyectos que le sean asignados por la Dirección.\n16. Apoyar en la revisión documental de los proyectos y programas de Gestión del Riesgo, formulados por los municipios o demás entidades y demás que le sean asignados por la Dirección.\n17. Apoyar en la actualización de los proyectos que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento\n18. Mantener estricta reserva y confidencialidad sobre la información que conozca con ocasión de la ejecución del objeto contractual.\n19. Obrar con lealtad y buena fe en las distintas actividades que realice\n20. Presentar informe mensual de actividades\n21. Presentar al finalizar el contrato los archivos digitales que proyectó durante la ejecución contractual al supervisor del contrato con visto bueno del Director Departamental para la Gestión del Riesgo de Desastres\n22. Las demás que le sean asignadas y que correspondan al objeto contractual.\n"	POSITIVA	SANITAS	PROTECCIÓN
85	MANUEL ALEJANDRO SANCHEZ ESGUERRA	86084688	37	M	CALLE 21 N 12C 03	3202392658	INGENIERO CIVIL	ing.manuel.esguerra10@gmail.com	DISEÑO Y CONSTRUCCION DE VIAS Y AEROPISTAS 	Contratista	0989 del 2022	2022-01-22	\n1. apoyo en la planeación, formulación, revisión y/o ajuste de diseños cantidades de obra y presupuestos de los proyectos\n2. Apoyo a la supervisión de los contratos de la dirección departamental para la gestión \ndel Riesgos del Riesgos de Desastres del Departamento\n3. Realizar el seguimiento técnico de los contratos asignados para el apoyo a la supervisión desde el inicio hasta el proceso de liquidación, proyectar los oficios de los requerimientos, comités de obras visitas de obras informes de supervisión.\n4. Una vez realizada la visita técnica, deberá realizar un diagnóstico y el levantamiento \nde la problemática,\n5. realizar actividades de revisión proyección y emitir conceptos respecto al área de suelos\n6. revisar y generar conceptos sobre estudios de suelos.\n7. Realizar visitas a los sitios donde se adelanten las obras en desarrollo de los programas a cargo del PDGRD\n\n8. revisión técnica a documentos que hacen parte del tránsito administrativo de los contratos en ejecución\n9. Emitir conceptos profesionales solicitados por el director departamental para la gestión del riesgo de desastres para la ejecución de las obras\n10. Realizar trabajos de análisis del terreno o inmueble que se requieren por parte de la dirección \n11. Obrar con lealtad y buena fe en las distintas actividades que realice\n12. Las demás que el sean asignadas y que correspondan al objeto contractual.\n13.  presentar informe mensual de actividades.\n14. presentar al finalizar el contrato los archivos digitales que proyecto durante la\nejecución contractual al supervisor del contrato con visto bueno del director departamental para la Gestión del Riesgo de Desastres.\n\n"	SURA ARL	NUEVA EPS	PROTECCIÓN
86	GLADYS YORMARY DUEÑAS RIVEROS 	40186658	41	F	CONJUNTO SANTA MARIA LL CASA 2-17	312768182	ABOGADA	yormydu@hotmail.com	DERECHO PUBLICO	Contratista	0211 DE 2022	2022-01-15	1. Proyectar las respuestas a los derechos de petición que lleguen a la Dirección Departamental para la gestión del riesgo de desastres.\n2.Proyectar las respuestas a las solicitudes de quejas y reclamos allegados a la Dirección, para aprobación del Director Departamental para la Gestión del Riesgo de Desastres.\n3.Asesorar y apoyar los convenios interadministrativos a suscribir con los organismos de socorro (Cruz Roja, Defensa Civil y Bomberos),.\n4. Participar en la realización de mesas de trabajo, talleres que se efectúen con ocasión del desarrollo de las actividades relacionadas con el objeto del contrato.\nAsesorar y brindar apoyo jurídico a la Dirección Departamental para la Gestión del Riesgo de Desastres.\n5. Estar actualizado en la normatividad vigente jurídica sobre la materia y en las directrices que imponga la Unidad Nacional para la Gestión del Riesgo de Desastres.\n6.Mantener estricta reserva y confidencialidad sobre la información que conozca con ocasión de la ejecución del objeto contractual.\n7.Obrar con lealtad y buena fe en las distintas actividades que realice\n8.Presentar informe mensual de actividades.\n9.Presentar al finalizar el contrato los archivos digitales que proyectó durante la ejecución 10.contractual al supervisor del contrato con visto bueno del Director Departamental para la Gestión del Riesgo de Desastres"	COLMENA	SANITAS	PROTECCIÓN
87	INGRID CATHERINE GONZALEZ LOPEZ 	1121860642	31	F	MAZANA I03 CASA 18 	3125622641	administradora de empresas 	ingridcate1227@gmail.com	TÉCNICA 	Contratista	1606 del 2022	2022-01-28	archivo 	COLMENA	MEDIMAS	COLPENSIONES
88	MARTHA TERESA JARA RIOS	51842146	50	F	CALLE 45 N° 45-15 	3102045210	ABOGADA	jaramartha@hotmail.com	DERECHO ADMINISTRATIVO	Contratista	206 DE 2022	2022-01-15	OBLIGACIONES ESPECÍFICAS: \n\n1. Asesorar y representar a la Dirección Departamental para la Gestión del Riesgo de Desastres en todas las actuaciones que le sean asignadas.\n2. Emitir conceptos jurídicos y proyectar los actos administrativos que de acuerdo al reparto y correspondiente asignación que para el efecto realice la Dirección Departamental para la Gestión del Riesgo de Desastres.\n3. Apoyar al Director de Gestión del Riesgo de Desastres en las reuniones, comités, Consejos de Gestión del Riesgo y Junta Departamental de Bomberos, según requerimiento.\n4. Estar actualizado en la normatividad vigente jurídica sobre la materia y en las directrices que imponga la Unidad Nacional para la Gestión del Riesgo de desastres y la Oficina Jurídica del Departamento.\n5. Sustanciar las respuestas por acciones administrativas judiciales donde se encuentre involucrada la Dirección Departamental para la Gestión del Riesgo de desastres.\n6. Atender los requerimientos de los entes de control que se presenten en la Dirección Departamental para la Gestión del Riesgo de desastres \n7. Asistir a reuniones audiencias, comités y demás actuaciones que sean indicados por la Dirección Departamental para la Gestión del Riesgo de desastres\n8. Mantener estricta reserva y confidencialidad sobre la información que conozca con ocasión de la ejecución del objeto contractual.\n9. Obrar con lealtad y buena fe en las distintas actividades que realice\n10. Presentar informe mensual de actividades.\n11. Presentar al finalizar el contrato los archivos digitales que proyectó durante la ejecución contractual al supervisor del contrato con visto bueno del Director Departamental para la Gestión del Riesgo de Desastres\n"	COLMENA	COMPENSAR	PORVENIR
89	FRANKLIN ALEXANDER REY BETANCOURTH	86048359	47	M	CARRERA 22 # 27-06 	3113482606	CONTADOR PUBLICO	frank160974@hotmail.com	N/A	Contratista	492 DE 2022	2022-01-18	1- APOYAR LAS EVALUACIONES FINANCIERAS QUE SE PRESENTEN EN LOS DIFERENTES PROCESOS DE SELECCION CONTRACTUAL.\n2- APOYAR LOS DIFERENTES TRAMITES PRESUPUESTALES QUE DEBA REALIZAR LA DIRECCION \n3- APOYAR LA ELABORACION DE ANALISIS DEL SECTOR CON RELACION A LA DETERMINACION DE INDICADORES FINANCIEROS\n4- VERIFICAR LOS PAGOS DE SEGURIDAD SOCIAL Y PARAFISCALES EN LOS DIFERENTES CONTRATOS QUE TRAMITE LA DIRECCION\n5- APOYAR EN LA ELABORACION DE INFORMESA DIFERENTES ENTIDADES O ENTES DE CONTROL QUE SEAN REQUERIDOS\n6- MANTENER ESTRICTA RESEVA Y CONFIABILIDAD SONBRE LA INFORMACION QUE CONOZCA CON OCASION DE LA EJECUCION DEL OBJETO CONTRACTUAL \n7-OBRAR CON LEALTAD Y BUENA EN LAS DISTINTAS ACTIVIDADES QUE REALICE \n8- PRESENTAR INFORMES MENSUALES DE ACTIVIADES\n9-PRESENTAR AL FINALIZAR EL CONTRATO LOS ARCHIVOS DIGITALES Y FISICOS, QUE PROYECTO DURANTE LA EJECUCION CONTRACTUAL CON VISTO BUENO DEL SUPERVISOR Y DEL DIRECTOR DEPARTAMENTAL DE LA GESTION DEL RIESGO DE DESASTRES\n10- LAS DEMAS QUE LE SEAN ASIGNADAS Y QUE CORRESPONDAN AL OBJETO CONTRACTUAL"	COLMENA	SALUD TOTAL	COLPENSIONES
90	LUIS CARLOS GUEVARA GRANADOS	86079187	38	M	CARRERA 1 # 15 B - 61	3204950638	INGENIERO DE SISTEMAS	ticsolt@gmail.com	ESPECIALIZACION EN GERENCIA DE PROYECTOS	Contratistas	0832 del 2022	2022-01-22	1. Asistir a reuniones, comités, capacitaciones y demás que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento\n2. Apoyar a la dirección en actividades de conectividad digital para los consejos departamentales de riesgos realizados\n3. Implementar y controlar la base de datos para el manejo y consolidación de información de la Dirección Departamental Para La Gestión Del Riesgo De Desastres.\n4. Apoyo en la logística necesaria que se requiera en las actividades de inventarios, activos de la dirección departamental para la gestión del riesgo de desastres.\n5. Apoyo a las actividades relacionadas con los sistemas informáticos de la dirección departamental para la gestión del riesgo de desastres.\n6. Planear y dirigir la formulación de proyectos de adquisición de software para la gestión integral de la Dirección.\n7. Participar en la planeación y ejecución de proyectos planteados por la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento\n8. Obrar con lealtad y buena fe en las distintas actividades que realice\n9. Dar cumplimiento a las demás funciones que le sean asignadas y que correspondan al objeto contractual.\n	COLMENA	COMPENSAR	COLPENSIONES
91	ALEXIS ADRIAN RAMIREZ	79790970	45	M	CALLE 36 # 17B-50	3143935671	INGENIERO CIVIL	aramirez@meta.gov.co	ESPECIALIZACION EN GERENCIA DE PROYECTOS	Contratistas	N/A	2022-01-01	N/A	COLMENA	SANITAS	PROTECCIÓN
92	CAMILO ANDRES SERNA SOLANO	86074098	40	M	DUARY 2 TORRE 2 APTO 402	3508332618	ABOGADO	csernas@meta.gov.co	REDUCCION, PREVENCION Y ATENCION DE DESASTRES	Contratistas	N/A	2020-12-24	N/A	COLMENA	SANITAS	PROTECCIÓN
93	MILENA LEON PEREZ	40334423	37	F	CRA 4 ESTE #15-148 APTO 901 T, QUINTAS DE MORELIA 3 TORRE 1, QUINTAS DE MORELIA 3 TORRE 1	3232916874	Ingeniero Civil	Milenaleonp85@hotmail.com	N/A	Contratistas	N/A	2021-02-01	N/A	POSITIVA	SANITAS	PORVENIR
94	Candido Moreno	1121958055	23	M	Manzana 14 casa #9	3138339062	Ingeniero de sistemas	stiivenmoreno@gmail.com	Sistemas	Contratista	N 0131	2022-02-01	[]	Seguros Bolivar	Cajacopi	Colpensiones
\.


--
-- Data for Name: informes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.informes (id_informe, id_funcionario, inicio, fin, elaboracion, numero, observaciones, aprobado, archivo) FROM stdin;
1	\N	2021-06-16	2021-07-27	2021-06-24	001	Prueba	0	[]
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
42	1	Municipios		_self	fa fa-map	\N	43	1	2021-06-30 18:56:13	2021-06-30 19:13:01	voyager.municipios.index	\N
44	1	Calamidad publica		_self	fa fa-crosshairs	#000000	43	2	2021-06-30 19:23:13	2021-06-30 19:27:45	voyager.calamidad.index	null
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
20	1	Funcionarios		_self	fa fa-address-card	#000000	19	2	2021-05-25 03:35:18	2021-07-19 03:15:50	voyager.funcionarios.index	null
21	1	Actividades		_self	fa fa-briefcase	\N	19	3	2021-05-25 03:44:17	2021-07-19 03:15:50	voyager.actividades.index	\N
31	1	Obligaciones		_self	fa fa-clock-o	\N	19	4	2021-05-27 17:06:27	2021-07-19 03:15:50	voyager.obligaciones.index	\N
27	1	Tipos Ayudas		_self	fa fa-stethoscope	\N	17	3	2021-05-25 11:57:40	2021-07-19 03:15:50	voyager.tipos-ayuda.index	\N
25	1	Tipos Actividades		_self	fa fa-puzzle-piece	#000000	17	4	2021-05-25 11:45:14	2021-07-19 03:15:50	voyager.tipos-actividad.index	null
37	1	Actas de Reunion		_self	fa fa-handshake-o	\N	19	1	2021-05-28 13:57:06	2021-07-19 03:15:50	voyager.actas-reunion.index	\N
40	1	Informes		_self	fa fa-flag-checkered	\N	19	5	2021-06-17 16:59:12	2021-07-19 03:15:50	voyager.informes.index	\N
41	1	Proyectos		_self	fa fa-paper-plane	\N	19	6	2021-06-28 01:58:28	2021-07-19 03:15:50	voyager.proyectos.index	\N
38	1	Visitas		_self	fa fa-binoculars	\N	16	3	2021-05-28 14:53:16	2022-02-11 06:00:59	voyager.visitas.index	\N
55	1	CorrespondenciasPQRSD		_self	voyager-sound	\N	19	7	2022-02-11 05:56:52	2022-02-11 06:00:59	voyager.pqrsd.index	\N
56	1	Respuestas PQRSD	/respuestaPQRSD	_self	voyager-sound	#000000	19	8	2022-03-02 21:22:38	2022-03-02 21:22:46	\N	
36	1	Inventario Salidas		_self	fa fa-sign-out	#000000	34	2	2021-05-28 04:32:25	2022-03-02 21:22:46	voyager.inventario-salida.index	null
47	1	Ayudas disponibles	disponibilidad	_self	fa fa-shopping-basket	#000000	34	3	2021-07-13 03:37:48	2022-03-02 21:22:46	\N	
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
336	39	Pendientes de redacción de documentos
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
1	6
11	6
12	6
16	6
17	6
42	6
43	6
44	6
45	6
46	6
47	6
48	6
49	6
50	6
51	6
52	6
53	6
54	6
55	6
56	6
57	6
58	6
59	6
60	6
61	6
62	6
63	6
64	6
65	6
66	6
67	6
68	6
69	6
70	6
71	6
72	6
73	6
74	6
75	6
76	6
77	6
78	6
79	6
80	6
81	6
82	6
83	6
84	6
85	6
86	6
87	6
88	6
89	6
90	6
91	6
92	6
93	6
94	6
95	6
96	6
97	6
98	6
99	6
100	6
101	6
102	6
103	6
104	6
105	6
106	6
107	6
108	6
109	6
110	6
111	6
112	6
113	6
114	6
115	6
116	6
117	6
118	6
119	6
120	6
121	6
122	6
123	6
124	6
125	6
126	6
127	6
128	6
129	6
130	6
131	6
132	6
133	6
134	6
135	6
136	6
137	6
138	6
139	6
140	6
141	6
142	6
143	6
144	6
145	6
146	6
147	6
148	6
149	6
150	6
151	6
152	6
153	6
157	6
158	6
162	6
163	6
167	1
168	1
169	1
170	1
171	1
167	6
168	6
169	6
170	6
171	6
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
167	browse_pqrsd	pqrsd	2022-02-11 05:56:52	2022-02-11 05:56:52
168	read_pqrsd	pqrsd	2022-02-11 05:56:52	2022-02-11 05:56:52
169	edit_pqrsd	pqrsd	2022-02-11 05:56:52	2022-02-11 05:56:52
170	add_pqrsd	pqrsd	2022-02-11 05:56:52	2022-02-11 05:56:52
171	delete_pqrsd	pqrsd	2022-02-11 05:56:52	2022-02-11 05:56:52
\.


--
-- Data for Name: personas_afectadas; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.personas_afectadas (id_personas_afectadas, fecha, hombres, mujeres, ninos, id_emergencia) FROM stdin;
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
-- Data for Name: pqrsd; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.pqrsd (id_pqrsd, tipo, id_radicado, num_oficio, telefono, nombre_remitente, email_remitente, asunto, responsable, fecha_creacion, fecha_asignacion, soporte_solicitud, num_radicado, soporte_respuesta, estado) FROM stdin;
2	option6	132456	741	322132456	Luis Guevara	ticsolt@gmail.com	Solciitud Maquinarua	46	2022-02-11 15:16:00	2022-02-11 15:16:00	[{"download_link":"pqrsd\\/February2022\\/viyKyhCj8Co7oYEMgPxO.pdf","original_name":"formato_experienciaprov (2).pdf"}]	123123	[]	0
1	option1	13154254	10111022022	3138339062	Diego Ramirez	prueba@gmail.com	Solicitud de visita  por conflictos	65	2022-02-10 01:02:00	2022-02-11 01:02:00	[{"download_link":"pqrsd\\/February2022\\/Rsr4kg0XXjdoubx1wEL6.docx","original_name":"informe que debo eliminaaaar.docx"}]	12312324	\N	0
3	Petición	258	355	3138671306	Luis Guevara	ticsolt@gmail.com	Solciitud Maquinarua	90	2022-03-02 09:22:00	2022-03-02 09:19:00	[{"download_link":"pqrsd\\/March2022\\/sYdcTuymJxMXxZ6E5evb.pdf","original_name":"medplus pago febrero.pdf"}]	123123	[{"download_link":"pqrsd\\/March2022\\/2VUicViDhjH1sGsjMhUc.pdf","original_name":"medplus pago febrero.pdf"}]	0
5	Queja	1231123	2525	3138671306	Luis Guevara	ticsolt@gmail.com	Solciitud Maquinarua	90	2022-03-03 09:54:00	2022-03-03 09:54:00	[{"download_link":"pqrsd\\/March2022\\/Lk37bbwLA8m3PAS0iNyT.pdf","original_name":"sonorizamos.pdf"}]	\N	[]	1
4	Petición	12312	10111022022	3138339062	Diego Ramirez	prueba@gmail.com	Solicitud de visita  por conflictos	94	2022-03-02 16:06:00	2022-03-02 16:06:00	[{"download_link":"pqrsd\\/March2022\\/9X7ZuEa2EqKjLge5zbVL.png","original_name":"firma.png"}]	23423423423	[{"download_link":"pqrsds/March2022/1646319535.pdf","original_name":"Cedula.pdf"}]	2
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
6	supervisor	Supervisor	2022-02-10 14:23:59	2022-02-10 14:23:59
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
161	ROSALIA  ENCIZO QUENZA	rencizoquenza94@gmail.com	\N	$2y$10$kFzn7/Z4LXrE2eHdQalf3uRxQrKQu0fmwKMiJW8Hu0pw3xaIAitNe	\N	\N	2022-02-10 05:04:47	users/default.png	4	\N	79	180
140	OSCAR ALBERTO CASTRILLON VELASQUEZ	oacastrillonv@gmail.com	\N	$2y$10$FvzU9KJqnOLs2RyENAxLR.qcPo/PJIFVAZMrqRSOTIyAXHwm.G2D6	\N	\N	2022-02-10 05:05:32	users/default.png	4	\N	57	180
143	JHON EDISSON CAICEDO GONZALEZ	jhonedissoncaicedo@hotmail.com	\N	$2y$10$gimtuApXQIMOQQ1/XxaNF.AgQH0J6wQfKBHbvFllWhr9I0VUz0VZO	\N	\N	2022-02-10 05:07:33	users/default.png	4	\N	60	180
124	JUAN DAVID ROMERO HERRERA	j.davidromeroh@gmail.com	\N	$2y$10$RAZ5Nf..vth9LVaxYGfxKeSNvWls.Plhix4EIrWWMQAmtzUWeFPj6	\N	\N	2022-02-10 05:09:16	users/default.png	4	\N	40	180
144	LEOPOLDO SALGUERO BELTRAN	leosalbe@yahoo.es	\N	$2y$10$wEYsJAicEb8r02H0TqTFKuCpfTmWjpMb245kXeIh8.rbjL77Kc9VS	\N	\N	2022-02-10 05:10:24	users/default.png	4	\N	62	180
136	YAMILE BAHAMÓN GARCÍA	yamilebg07@hotmail.com	\N	$2y$10$tHciKq.GAvcSzTiF124pl.rybTGWZEDGwBgSFb05iLW..FHzRFf9u	\N	\N	2022-02-10 05:47:08	users/default.png	4	\N	53	180
157	ADRIANA BOBADILLA	arqadrianabg@gmail.com	\N	$2y$10$eCOFcVR7f.IpiXXtclqi/uqjAGJ7VkE3SsEtWEWMmzSHkU53sgfD6	\N	\N	2022-02-10 05:01:00	users/default.png	4	\N	75	180
134	ALEXA LISBETH MORENO LADINO	alemoreno0801@gmail.com	\N	$2y$10$RZOj9fgoGnNfsgWDhKDBzOrnJROQlYWWQc8KsMIDBmAFmvFnbbd/C	\N	\N	2022-02-10 05:01:19	users/default.png	4	\N	51	180
132	YESICA JULIETH RODRIGUEZ SANCHEZ	rodriguezpsico14@gmail.com	\N	$2y$10$39cQYWbN0kikqZq3BLbv4OOxh5T0E7qZo7MOoUT82qe3rYkMuOdIG	\N	\N	2022-02-10 05:01:33	users/default.png	4	\N	49	180
146	ASLEY FERNANDO ESPEJO DIAZ	asleyfer@gmail.com	\N	$2y$10$g7aYwJrXbfwJd079VLjAdOknx48aOPWDMwbh18sD8BmOc0SAkYxHC	\N	\N	2022-02-10 05:01:34	users/default.png	4	\N	64	180
139	AURA CAROLINA CASTILLO ROJAS	carolinacastillo2020@gmail.com	\N	$2y$10$SDujv8qWI2jJqSnSh.nh...oP9ZQaTno1WzAed0iisMek1qNmfhKO	\N	\N	2022-02-10 05:01:47	users/default.png	4	\N	56	180
154	YANETH VIVIANA VIVAS CASTRILLON	vivianavivas2017@gmail.com	\N	$2y$10$Yhfj5bPg2pmeXvHsq3YzyeQq3kbsB107NCCoDIAyaKgB.Q0M5e/im	\N	\N	2022-02-10 05:02:33	users/default.png	4	\N	72	180
160	CAMILA JUANITA SCHMITT ROJAS	jschmittro@hotmail.com	\N	$2y$10$yDyFoJJMpeZvsuhcjKeJ3.w/bGg6Ir1utWGcYU6huN0YTpiGXTTsu	\N	\N	2022-02-10 05:02:29	users/default.png	4	\N	78	180
135	CARMENZA DANIELA VARGAS PABÓN	cdanielavargasp@hotmail.com	\N	$2y$10$eGY88/ATD1GsW8FP8/T.Cu0Ew8C2dP2x/Yl2dN50Grkh1ZI5meOei	\N	\N	2022-02-10 05:02:45	users/default.png	4	\N	52	180
158	CESAR HERNANDO CRUZ MURILLO	cesarcruzmurillo@gmail.com	\N	$2y$10$Yh4XdXSvWk1ndUggFLxAN.rAADBcIN/afEGERbeFrJ9faPsg3nwVa	\N	\N	2022-02-10 05:03:12	users/default.png	4	\N	76	180
126	CLAUDIA ROCIO APARICIO DURAN	claudiaaparicioduran@gmail.com	\N	$2y$10$bP8.2RXKAyblvXElao7mEenRibGSFtQ/m8iS6V3UFkPfUQO9HZz2m	\N	\N	2022-02-10 05:03:17	users/default.png	4	\N	42	180
150	CRISTIAN FELIPE PORTELA TRIANA	felipe.portela88@hotmail.com	\N	$2y$10$hw8Ytv5bTgt8DP87vQ4VMOsBcJKDMJ4vJS.tsmV6If2KFyY.Pq54a	\N	\N	2022-02-10 05:03:23	users/default.png	4	\N	68	180
156	WILSON JORGE GUAQUEZ CALDERON	wilsonguaquez@hotmail.com	\N	$2y$10$QnFQAg0o/P3A7hFaHcfNXucuQ6e/rF/oTe9fs0BWZxSuxgZsTCTv6	\N	\N	2022-02-10 05:03:30	users/default.png	4	\N	74	180
164	DARIO CABALLERO HERRERA	dariocaballeroh@gmail.com	\N	$2y$10$whV9X3nUtuX4uah9D1ZHjuzVzNhoZhloUberwvjWs6ZymsTQDsEoO	\N	\N	2022-02-10 05:03:49	users/default.png	4	\N	82	180
133	DAVID ALEJANDRO SANTIAGO TIBAVIZCO	santiagodavidt.23@gmail.com	\N	$2y$10$wGDyVgyYT12zonxC4kFJWOhrQyFVIerm4REmR1eJ8JRIY2dr/23VC	\N	\N	2022-02-10 05:03:55	users/default.png	4	\N	50	180
148	DIANA MARCELA PATIÑO COLORADO	ingeniera.diana23@outlook.com	\N	$2y$10$bKLXeh9J9AM89XWoYgL.jOPxZjPb83weD4oEt6qLOy9WQd5Rk9ngC	\N	\N	2022-02-10 05:04:03	users/default.png	4	\N	66	180
165	WILLIAM DAVID VALENCIA GONZÁLEZ	davidvalenciag@live.com	\N	$2y$10$MVo270vMywlfKou9vEB8AeNcyuxTFdu01wmQXxas8GrOkt1pVIZzq	\N	\N	2022-02-10 05:04:05	users/default.png	4	\N	83	180
152	DIEGO LEONARDO RUBIO RIVERA	rubio.r26@hotmail.com	\N	$2y$10$DIXVc4JB8XoauajlzIFiouXv.ctn.Mw2erR4bcNMU2sKN7hDMkp9O	\N	\N	2022-02-10 05:04:09	users/default.png	4	\N	70	180
128	EDGARDO FLOREZ IGLESIAS	edgardoflorez_87@hotmail.com	\N	$2y$10$57/mbO92Nw3Gi0E1u2QRKeQROint4YBoFuy2GXcmTc8Ww4tgDAvlC	\N	\N	2022-02-10 05:05:00	users/default.png	4	\N	45	180
131	EDUARDO ALFREDO ÁVILA ARDILA	avila0807@hotmail.com	\N	$2y$10$pkO8sNqQH9M7gZCRvuR9duZi/FciNy8JQfXhiNa8p1QHFkIaxkqTe	\N	\N	2022-02-10 05:05:06	users/default.png	4	\N	48	180
151	ERIKA MAYERLIS GARAY RUIZ	erika_8299@hotmail.com	\N	$2y$10$ygrnTdbwCxb39y5ErCiu0.qP.JCCmIds84gJ7r0CZXLGL3DNm33XC	\N	\N	2022-02-10 05:05:12	users/default.png	4	\N	69	180
123	FLOOWER EMILIO PEÑA	rewolf8425@gmail.com	\N	$2y$10$Q66IO/Cj1w64yuSBKR6lEuxBm/K.wsEThAKbhg.OHgUdPAeHSD8Ei	\N	\N	2022-02-10 05:05:18	users/default.png	4	\N	44	180
166	OMAR ENRIQUE GUERRERO LEÓN	omar.guerrero.leon24@gmail.com	\N	$2y$10$ywHipW/4115h6a/AZqQewuqiZOOrEnKT2Er/6tpSC/h.u9PCLf2qG	\N	\N	2022-02-10 05:06:06	users/default.png	4	\N	84	180
129	FREDDY ELIECER MARTÍNEZ AGUDELO	freddymartinezag@hotmail.com	\N	$2y$10$tiGmZB.qTijxU/RMaVTfW.5iiZM4yJeM1F4cpVYRQXx.l1HS/FYMK	\N	\N	2022-02-10 05:06:09	users/default.png	4	\N	46	180
127	GEORGINA LEMUS	georginalemus@gmail.com	\N	$2y$10$gDxqf09S6QMVOgZ9lLyhP.dWruzjofPv5H8N2eZKMoVtO0KgCumuu	\N	\N	2022-02-10 05:06:15	users/default.png	4	\N	43	180
163	INGRID TATIANA TRIGOS ZULUAGA	tatianatrigoszuluaga64@gmail.com	\N	$2y$10$fNFRoGzyc8CG/yYlli2S5eLiJ1e/9UWN7TCmi2yRUtyQitFkUFQ9e	\N	\N	2022-02-10 05:07:26	users/default.png	4	\N	81	180
159	JOHAN BAYRON PULIDO SABOGAL	joba8410@hotmail.com	\N	$2y$10$4rjF0SkjXDE/Q7hxLFPtIObIhiOT05fcSdRk3DussmW/qnkcd5wDq	\N	\N	2022-02-10 05:07:39	users/default.png	4	\N	77	180
149	NELLY MORENO	nellymor1115@hotmail.com	\N	$2y$10$jNjt357vwVAS82N1Sl8Q2uaPeI0onwHXrPRfcVCRxn7iloGWoXGkq	\N	\N	2022-02-10 05:07:44	users/default.png	4	\N	67	180
162	JOHN FERNANDO LUPPI JARAMILLO	luppi14@hotmail.com	\N	$2y$10$.86xIXU6O5nhxjpSAqaiQOdk9VIhknhgiMDnmM5t0YBstIg./4i2C	\N	\N	2022-02-10 05:07:45	users/default.png	4	\N	80	180
138	JUAN DAVID REYES ESTEPA	juandavidreyesestepa@gmail.com	\N	$2y$10$X4kFsf.MV94wr0pf5o04n.ufe1A3E1HikLln27OahvsInhR7RIbpO	\N	\N	2022-02-10 05:09:10	users/default.png	4	\N	55	180
167	MANUEL ALEJANDRO SANCHEZ ESGUERRA	ing.manuel.esguerra10@gmail.com	\N	$2y$10$eGCpuijk38nkXXHPBx6T9uuy/X2wnCN9e.f1VT/8AUpmhcGHoq8Om	\N	\N	2022-02-10 05:09:11	users/default.png	4	\N	85	180
130	JUAN SEBASTIAN LOPEZ PRIETO	ingsebastianlopezp@gmail.com	\N	$2y$10$O6K7oEfz0si8DV146zld/OhhDnuKxKE1I1c2xmxbLQQknI.CI4r/C	\N	\N	2022-02-10 05:09:23	users/default.png	4	\N	47	180
153	JULIAN ALEXANDER TORRES QUIROGA	jatoquiro@hotmail.com	\N	$2y$10$ZQJGL7WLwO/HposOeybWxOeBxGDeT5mLt0GD9N/W8qA568V5TYPFC	\N	\N	2022-02-10 05:09:29	users/default.png	4	\N	71	180
122	LUZ AIDA MEDINA AYA	luza_523@hotmail.com	\N	$2y$10$ssFe.cJVbVU9hWtfmkgKaOTBCd/.Cv/eA6dYtZbmzH5EPCR0ct8/W	\N	\N	2022-02-10 05:09:50	users/default.png	4	\N	61	180
125	LUIS ALEJANDRO PEÑA ALVAREZ	lap142@hotmail.com	\N	$2y$10$kWdgG9pECflotDLPSPtMGeKd8DVpJIBCBKJSuiNaRrwptkoL3oT8q	\N	\N	2022-02-10 05:10:11	users/default.png	4	\N	41	180
137	LAURA DANIELA MACIAS RODRIGUEZ	ldmaciasr@hidroamericaingenieria.com	\N	$2y$10$ekrv6dIsG47j4ZSGrzZ58el9YrOpAsYzCFIaBXkXyMyZf4XguHWBi	\N	\N	2022-02-10 05:10:38	users/default.png	4	\N	54	180
155	KAREN STEPHANIE RAMIREZ PATIÑO	stepha.ramirezp@gmail.com	\N	$2y$10$QCK5rRQ3CV4ns1CPr9Bo6u4ISkluvgb5dNoNbMeC6s/FBEPr1iUc6	\N	\N	2022-02-10 05:10:53	users/default.png	4	\N	73	180
175	MILENA LEON PEREZ	Milenaleonp85@hotmail.com	\N	$2y$10$fR5L8qvIIrbXETUvYDL4H.YJZAi4Sf.fzDFX05vFhpRHCcMxlk7xu	\N	\N	2022-02-10 14:24:40	users/default.png	6	\N	93	180
120	Municipio	municipio@gmail.com	\N	$2y$10$T/YH3o9I0hgyT4422ilNg.G0KnwLsRAXIFRKCeb5TZH4GnjcdgKPq	\N	2022-02-08 17:01:25	2022-02-08 17:01:25	users/default.png	5	\N	\N	180
174	CAMILO ANDRES SERNA SOLANO	csernas@meta.gov.co	\N	$2y$10$Ej4lBhCmng9ZMYGFNgQ5aumEC/iKqDxu9BQGO8I11PBCEd215aGF2	\N	\N	2022-02-10 14:26:36	users/default.png	6	\N	92	180
173	ALEXIS ADRIAN RAMIREZ	aramirez@meta.gov.co	\N	79790970	\N	\N	2022-02-10 14:26:41	users/default.png	6	\N	91	180
172	LUIS CARLOS GUEVARA GRANADOS	ticsolt@gmail.com	\N	$2y$10$KOpIzo5VZvg6xhkJCmJoauQ2PnibUZcRZzgBWiIwd/xY0E3y0zECy	\N	\N	2022-02-10 14:26:46	users/default.png	6	\N	90	180
145	PATRICIA FIERRO CRUZ	patriciafierrocruz@gmail.com	\N	$2y$10$r8gt.rx/nzGqsSa9snh6PetmWSgzZNPoLmycGiKPNYS4hujyd0uk6	\N	\N	2022-02-10 05:05:09	users/default.png	4	\N	63	180
171	FRANKLIN ALEXANDER REY BETANCOURTH	frank160974@hotmail.com	\N	$2y$10$hpGg3Bmo6By0ezkssTgzf.iNSTb105BwGlk30TAQigW9fj0bIqTtG	\N	\N	2022-02-10 05:06:03	users/default.png	4	\N	89	180
168	GLADYS YORMARY DUEÑAS RIVEROS	yormydu@hotmail.com	\N	$2y$10$rFp9JXcw0SB1umXy9iexLuTxFTVmdi7xgQ22.MG6C5zVT04.aVvmq	\N	\N	2022-02-10 05:06:21	users/default.png	4	\N	86	180
147	NICOLE ESTEFANIA CORTES GALVIS	nicolecortes2094@hotmail.com	\N	$2y$10$fq/HJVwz2UerLvDeXqRpeeQmgzv.ptOBDKz.m/g9kaEnOvpN8JU2y	\N	\N	2022-02-10 05:06:47	users/default.png	4	\N	65	180
169	INGRID CATHERINE GONZALEZ LOPEZ	ingridcate1227@gmail.com	\N	$2y$10$AILJ.5/0880bxrDL.obuseRB4eG/zOAdNhaVdEEhkfK/KMUSHxJpO	\N	\N	2022-02-10 05:07:20	users/default.png	4	\N	87	180
170	MARTHA TERESA JARA RIOS	jaramartha@hotmail.com	\N	$2y$10$VzJSUHWcmwVjk5NMDwrc8eohPrWlVTOOw9FIEbLNvcX3mA3.SfIfy	\N	\N	2022-02-10 05:08:45	users/default.png	4	\N	88	180
142	MARTHA LILIANA PORRAS HERNANDEZ	marthaporras@usantotomas.edu.co	\N	$2y$10$bS25AOjJcwDGlIHEgd0Hj.Nk9LuJLzjTBiPeS6d6uan/DjzzZxov2	\N	\N	2022-02-10 05:08:55	users/default.png	4	\N	59	180
141	JULIAN DAVID ROJAS MARQUEZ	juliand_06@hotmail.com	\N	$2y$10$iogdF1Ubnb4rK.K.Cy2LZOAbtc2PNuClcJNdX6fnlGsMMN0.9dprG	\N	\N	2022-02-10 05:09:35	users/default.png	4	\N	58	180
1	Admin	admin@admin.com	\N	$2y$10$7mLUDqcFoVGfJylKeWsj2eKfP0jiEJcq7FDLSVxzHaXw9CDUmK7LO	h7HvKlRrDbbDuZ6cTTNgImZgRdibcClSTLOc6jlQQ1OKK6Rp9XtwJb94WB65	2021-05-24 14:41:56	2022-02-09 05:02:17	users/May2021/fnekohZWYRzTwPnRQnrc.png	1	\N	\N	\N
176	Candido Moreno	stiivenmoreno@gmail.com	\N	$2y$10$Dha4znHfDYeUcqmLtwF8t.psKagmzeMaXdgyW8RfOWdNxjYzj/r0m	\N	2022-03-02 21:05:30	2022-03-02 21:05:30	users/default.png	4	\N	94	180
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
5	VISITA TECNICA	2021-07-13	VERIFICACION DESLIZAMIENTO	FULANITA DE TAL	4.1415692,-73.6493001	VERIFICACION AFECTACION POR DESLIZAMIENTO	SE REALIZA LA VISITA, SE REALIZA SOBRE VUELO CON DRON	\N	\N	\N	180	CENTRO	\N
4	\N	2021-05-30	emergency test	dasdasd	42.3562157,-3.6665102	regwergwer	gwrwrtgwrtg	wtrgwtr	wrgwrgw	wregwrgw	\N	\N	[{"nombre":"","correo":"","documento":"","telefono":"","externo":null}]
\.


--
-- Name: acciones_adelantadas_id_accion_adelantada_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.acciones_adelantadas_id_accion_adelantada_seq', 11, true);


--
-- Name: actas_reunion_id_acta_reunion_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.actas_reunion_id_acta_reunion_seq', 3, true);


--
-- Name: actividades_id_actividad_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.actividades_id_actividad_seq', 236, true);


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

SELECT pg_catalog.setval('public.data_rows_id_seq', 320, true);


--
-- Name: data_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.data_types_id_seq', 40, true);


--
-- Name: detalle_inventario_id_detalle_inventario_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.detalle_inventario_id_detalle_inventario_seq', 19, true);


--
-- Name: emergencias_id_emergencia_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.emergencias_id_emergencia_seq', 27, true);


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

SELECT pg_catalog.setval('public.funcionarios_id_funcionario_seq', 94, true);


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

SELECT pg_catalog.setval('public.menu_items_id_seq', 56, true);


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

SELECT pg_catalog.setval('public.obligaciones_id_obligacion_seq', 336, true);


--
-- Name: pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.pages_id_seq', 1, true);


--
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.permissions_id_seq', 171, true);


--
-- Name: personas_afectadas_id_personas_afectadas_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.personas_afectadas_id_personas_afectadas_seq', 11, true);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.posts_id_seq', 4, true);


--
-- Name: pqrsd_id_pqrsd_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.pqrsd_id_pqrsd_seq', 5, true);


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

SELECT pg_catalog.setval('public.roles_id_seq', 6, true);


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

SELECT pg_catalog.setval('public.users_id_seq', 176, true);


--
-- Name: visita_emergencia_id_visita_emergencia_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.visita_emergencia_id_visita_emergencia_seq', 1, false);


--
-- Name: visitas_id_visita_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.visitas_id_visita_seq', 6, true);


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
-- Name: pqrsd pqrsd_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.pqrsd
    ADD CONSTRAINT pqrsd_pkey PRIMARY KEY (id_pqrsd);


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
-- Name: pqrsd_responsable_index; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX pqrsd_responsable_index ON public.pqrsd USING btree (responsable);


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

