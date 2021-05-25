--
-- PostgreSQL database dump
--

-- Dumped from database version 12.6 (Ubuntu 12.6-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.6 (Ubuntu 12.6-0ubuntu0.20.04.1)

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
    fecha date
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
    cumplida integer
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
    id_funcionario integer
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
    direccion character varying
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
-- Name: inventario_entrada; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.inventario_entrada (
    id_inventario_entrada integer NOT NULL,
    fecha date,
    id_tipo_ayuda integer,
    cantidad integer,
    id_entidad integer
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
    id_emergencia integer,
    cantidad integer,
    fecha integer,
    id_entidad integer,
    id_inventario_entrada integer
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
    costo numeric
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
    activa integer
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
    nombre character varying
);


ALTER TABLE public.municipios OWNER TO admin;

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
    CONSTRAINT pages_status_check CHECK (((status)::text = ANY ((ARRAY['ACTIVE'::character varying, 'INACTIVE'::character varying])::text[])))
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
    CONSTRAINT posts_status_check CHECK (((status)::text = ANY ((ARRAY['PUBLISHED'::character varying, 'DRAFT'::character varying, 'PENDING'::character varying])::text[])))
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
    descripcion character varying
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
    id_funcionario integer
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
    recomendaciones text
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
-- Name: emergencias id_emergencia; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.emergencias ALTER COLUMN id_emergencia SET DEFAULT nextval('public.emergencias_id_emergencia_seq'::regclass);


--
-- Name: entidades id_entidad; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.entidades ALTER COLUMN id_entidad SET DEFAULT nextval('public.entidades_id_entidad_seq'::regclass);


--
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- Name: funcionarios id_funcionario; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.funcionarios ALTER COLUMN id_funcionario SET DEFAULT nextval('public.funcionarios_id_funcionario_seq'::regclass);


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

COPY public.acciones_adelantadas (id_accion_adelantada, id_tipo_actividad, id_entidad, id_emergencia, personas_involucradas, fecha) FROM stdin;
\.


--
-- Data for Name: actas_reunion; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.actas_reunion (id_acta_reunion, fecha, lugar, hora_inicio, hora_fin, convoca, objeto, desarrollo, conclusiones, asistentes, id_tipo_acta) FROM stdin;
\.


--
-- Data for Name: actividades; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.actividades (id_actividad, fecha_estimada, fecha_entrega, descripcion, id_funcionario, desarrollo, anexos, cumplida) FROM stdin;
1	2021-05-27	\N	prueba de actividad	1	\N	[]	0
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
12	2	id	number	ID	t	f	f	f	f	f	\N	1
13	2	name	text	Name	t	t	t	t	t	t	\N	2
14	2	created_at	timestamp	Created At	f	f	f	f	f	f	\N	3
15	2	updated_at	timestamp	Updated At	f	f	f	f	f	f	\N	4
22	4	id	number	ID	t	f	f	f	f	f	\N	1
23	4	parent_id	select_dropdown	Parent	f	f	t	t	t	t	{"default":"","null":"","options":{"":"-- None --"},"relationship":{"key":"id","label":"name"}}	2
24	4	order	text	Order	t	t	t	t	t	t	{"default":1}	3
25	4	name	text	Name	t	t	t	t	t	t	\N	4
26	4	slug	text	Slug	t	t	t	t	t	t	{"slugify":{"origin":"name"}}	5
27	4	created_at	timestamp	Created At	f	f	t	f	f	f	\N	6
28	4	updated_at	timestamp	Updated At	f	f	f	f	f	f	\N	7
29	5	id	number	ID	t	f	f	f	f	f	\N	1
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
42	5	seo_title	text	SEO Title	f	t	t	t	t	t	\N	14
43	5	featured	checkbox	Featured	t	t	t	t	t	t	\N	15
44	6	id	number	ID	t	f	f	f	f	f	\N	1
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
16	3	id	number	ID	t	f	f	f	f	f	{}	1
17	3	name	text	Nombre	t	t	t	t	t	t	{}	2
20	3	display_name	text	Nombre a mostrar	t	t	t	t	t	t	{}	5
18	3	created_at	timestamp	Created At	f	f	f	f	f	f	{}	3
19	3	updated_at	timestamp	Updated At	f	f	f	f	f	f	{}	4
1	1	id	number	ID	t	f	f	f	f	f	{}	1
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
70	7	actividades	text	Actividades	f	f	t	t	t	t	{}	14
71	7	arl	text	Arl	f	f	t	t	t	t	{}	15
72	7	eps	text	Eps	f	f	t	t	t	t	{}	16
73	7	pensiones	text	Pensiones	f	f	t	t	t	t	{}	17
74	9	id_actividad	text	Id Actividad	t	f	f	f	f	f	{}	1
78	9	id_funcionario	text	Id Funcionario	f	t	t	t	t	t	{}	2
10	1	user_belongstomany_role_relationship	relationship	Roles	f	t	t	t	t	f	{"model":"TCG\\\\Voyager\\\\Models\\\\Role","table":"roles","type":"belongsToMany","column":"id","key":"id","label":"display_name","pivot_table":"user_roles","pivot":"1","taggable":"on"}	11
75	9	fecha_estimada	date	Fecha Estimada	f	t	t	t	t	t	{}	4
76	9	fecha_entrega	date	Fecha Entrega	f	t	t	t	t	t	{}	5
77	9	descripcion	text	Descripcion	f	t	t	t	t	t	{}	6
79	9	desarrollo	text	Desarrollo	f	t	t	t	t	t	{}	7
80	9	anexos	file	Anexos	f	f	t	t	t	t	{}	8
82	9	actividade_belongsto_funcionario_relationship	relationship	funcionarios	t	t	t	t	t	t	{"model":"\\\\App\\\\Models\\\\Funcionario","table":"funcionarios","type":"belongsTo","column":"id_funcionario","key":"id_funcionario","label":"nombre","pivot_table":"migrations","pivot":"0","taggable":"0"}	3
81	9	cumplida	checkbox	Cumplida	f	t	t	t	t	t	{"on":"Si","off":"No","checked":false}	9
84	1	id_funcionario	text	Id Funcionario	f	t	t	t	t	t	{}	3
83	1	user_belongsto_funcionario_relationship	relationship	Funcionario	f	t	t	t	t	t	{"model":"\\\\App\\\\Models\\\\Funcionario","table":"funcionarios","type":"belongsTo","column":"id_funcionario","key":"id_funcionario","label":"nombre","pivot_table":"migrations","pivot":"0","taggable":"0"}	13
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
7	funcionarios	funcionarios	Funcionario	Funcionarios	fa-address-card	App\\Models\\Funcionario	\N	t	2021-05-25 03:35:18	2021-05-25 03:40:09	0	\N	\N	{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}
1	users	users	User	Users	voyager-person	TCG\\Voyager\\Models\\User	\N	t	2021-05-24 14:41:56	2021-05-25 04:17:27	0	TCG\\Voyager\\Http\\Controllers\\VoyagerUserController	TCG\\Voyager\\Policies\\UserPolicy	{"order_column":null,"order_display_column":null,"order_direction":"desc","default_search_key":null,"scope":null}
9	actividades	actividades	Actividad	Actividades	fa fa-briefcase	App\\Models\\Actividad	\N	t	2021-05-25 03:44:17	2021-05-25 04:20:15	0	\N	\N	{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}
\.


--
-- Data for Name: emergencias; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.emergencias (id_emergencia, descripcion, localizacion, fecha, estado, tipo_emergencia, id_municipio, comuna, fuente_agua, movil, id_entidad, id_funcionario) FROM stdin;
\.


--
-- Data for Name: emergencias_actas; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.emergencias_actas (id_emergencia, id_acta_reunion) FROM stdin;
\.


--
-- Data for Name: entidades; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.entidades (id_entidad, nombre, responsable, telefono, direccion) FROM stdin;
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
5	Juanita schmitt 	1018474709	26	F	Calle 47 A #28-10	3214527084	Arquitecta 	jschmittro@hotmail.com	Gerencia de proyectos 	CONTRATO PRESTACION DE SERVICIOS	0387 del 2021 	2022-12-02	1. Apoyo a la supervisión de los contratos de la DIGERD\n2.Asisitir a reuniones, comités, capacitaciones y demás que sean indicados por la DIGERD\n3. Realizar visitas técnicas e informes de acuerdo con lo asignado por la DIGERD\n4. Apoyar visitas técnicas en desarrollo del balance de calamidades que se presenten en el departamento del meta \n5. Realizar entrega periódica de todos los documentos proyectados en atención al desarrollo de sus obligaciones \n6. Apoyar la estructuración técnica de los proyectos que le sean asignados por la dirección \n7. Apoyar en la realización de presupuestos, memorias de cantidades, especificaciones técnicas, apus y su respectivo soporte de estudio de mercadeo, de los proyectos que le sean asignados \n8. Apoyar en la actualización de los proyectos que sean indicados por la DIGERD\n9. Apoyar en la revisión documental de los proyectos y programas de la DIGERD\n10. Mantener estricta reserva y confidencialidad sobre la información que conozca en ocacion de la ejecución del objeto contractual\n11. Obrar con lealtad y buena fe en las distintas actividades que realice \n12. Las demás que le sean asignadas y que correspondan al objeto contractual\n13. Presentar informe mensual de actividades \n14. Presentar al finalizar el contrato los archivos digitales que proyectó durante la ejecución contractual al supervisor del contrato con victo bueno del director de la DIGERD	Colmena 	Sanitas 	Protección 
6	LYSETH TATIANA RUIZ ACERO	1121937106	24	F	CARRERA 19 #2A-61 CONDOMINIO PORTAL DEL MOLINO	3229442646	INGENIERIA AMBIENTAL	tatisruiz.12@hotmail.com		CONTRATO PRESTACION DE SERVICIOS	0578	2022-03-03	1.\tApoyo a la supervisión de los contratos de la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.\n2.\tAsistir a reuniones, comités, capacitaciones y demás que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento. \n3.\tRealizar visitas técnicas e informes de acuerdo con lo asignado por la Dirección en cumplimiento del objeto contractual. \n4.\tApoyar visitas técnicas en desarrollo del balance de calamidades que se presenten en el Departamento del Meta.\n5.\tRealizar entrega periódica de todos los documentos proyectados en atención al desarrollo de sus obligaciones.\n6.\tApoyar la estructuración técnica de los proyectos que le sean asignados por la Dirección. \n7.\tApoyar en la revisión documental de los proyectos y programas de Gestión del Riesgo, formulados por los municipios o demás entidades y demás que le sean asignadas por la Dirección.\n8.\tApoyar en la actualización de los proyectos que sean indicados por la dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.\n9.\tApoyar a la realización y revisión de presupuestos, memorias de cantidades, especificaciones técnicas, Apus y su respectivo soporte de estudio de mercadeo, de los proyectos que le sean asignados por la dirección.\n10.\tMantener estricta reserva y confidencialidad sobre la información que conozca con ocasión de la ejecución del objeto contractual.\n11.\tObrar con lealtad y buena fe en las distintas actividades que realice.\n12.\tLas demás que le sean asignadas y correspondan al objeto contractual.\n13.\tPresentar informe mensual de actividades \n14.\tPresentar al finalizar el contrato los archivos digitales que proyecto durante la ejecución contractual al supervisor del contrato con visto bueno del Director Departamental para la Gestión del Riesgo de Desastres \n	COLMENA	SANITAS	PORVENIR
7	Claudia Rocio Aparicio Duran	35264635	40	F	Calle 47Bis No. 27-35 Caudal Oriental	3124578841	Ingeniero Electrónico	claudiaaparicioduran@gmail.com	Formulación y Evaluación de Proyectos	CONTRATO PRESTACION DE SERVICIOS	0905 de 2021	2021-12-05	1.\tAsistir a reuniones, comités, capacitaciones y demás que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.\n2.\tApoyo a la Supervisión de los contratos de la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.\n3.\tRealizar visitas técnicas e informes de acuerdo con lo asignado por la Dirección en cumplimiento del objeto contractual\n4.\tDar respuesta oportuna a los derechos de petición que le sean asignados.\n5.\tRealizar entrega periódica de todos los documentos proyectados en atención al desarrollo de sus obligaciones.\n6.\tApoyar en la revisión de presupuestos, memorias de cantidades, especificaciones técnicas, Apus y su respectivo soporte de estudio de mercadeo, de los proyectos que le sean asignados por la Dirección.\n7.\tApoyar en la revisión documental de los proyectos y programas de Gestión del Riesgo, formulados por los municipios o demás entidades y demás que le sean asignados por la Dirección.\n8.\tApoyar en la elaboración, revisión, formulación y actualización de los proyectos que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento, en cumplimiento de las Metas del Plan de Desarrollo Hagamos Grande al Meta 2020-2023.\n9.\tApoyar y consolidar la información en el instrumento de seguimiento, a proyectos de inversión SPI de los proyectos de la Dirección de Gestión del riesgo de desastres, en cumplimiento de las Metas del Plan de Desarrollo Hagamos Grande al Meta 2020-2023.\n10.\tCargue de información necesaria de los proyectos, en las plataformas de SUIP y MGA\n11.\tPresentar informe mensual de actividades.\n12.\tMantener estricta reserva y confidencialidad sobre la información que conozca con ocasión de la ejecución del objeto contractual.\n13.\tObrar con lealtad y buena fe en las distintas actividades que realice\n14.\tLas demás que el sean asignadas y que correspondan al objeto contractual.\n15.\tPresentar al finalizar el contrato los archivos digitales que proyecto durante la ejecución contractual al supervisor del contrato con visto bueno del Director Departamental para la Gestión del Riesgo de Desastres	Colmena	Medimas	Colpensiones
8	MARTHA TERESA JARA RIOS	51842146	53	F	Calle 45 # 45- 15 Barrio Santa Josefa	3138681169	abogada	jaramartha@hotmail.com	Derecho Administrativo	CONTRATO PRESTACION DE SERVICIOS	0346 de 2021	2022-09-02	OBLIGACIONES ESPECÍFICAS:\n1.\tAsesorar y representar a la Dirección Departamental para la Gestión del Riesgo de desastres en todas las actuaciones que le sean asignadas.\n2.\tEmitir conceptos jurídicos y proyectar los actos administrativos que de acuerdo al reparto y correspondiente asignación que para el efecto realice la Dirección Departamental para la Gestión del Riesgo de Desastres.\n3.\tRealizar acompañamiento al Director de Gestión del Riesgo de Desastres a las reuniones, comités, Consejos de Gestión del Riesgo y Junta Departamental de Bomberos, según requerimiento.\n4.\tEstar actualizado en la normatividad vigente jurídica sobre la materia y en las directrices que imponga la Unidad Nacional para la Gestión del Riesgo de desastres y la Oficina Jurídica del Departamento.\n5.\tSustanciar las respuestas por acciones administrativas judiciales donde se encuentre involucrada la Dirección Departamental para la Gestión del Riesgo de desastres.\n6.\tAtender los requerimientos de los entes de control que se presenten en la Dirección Departamental para la Gestión del Riesgo de desastres \n7.\tAsistir a reuniones audiencias, comités y demás actuaciones que sean indicados por la Dirección Departamental para la Gestión del Riesgo de desastres.\n8.\tLas demás que le sean asignadas y que correspondan al objeto contractual\n\n	COLMENA	COMPENSAR	PORVENIR
9	Edgardo Florez Iglesias	1129579145	33	M	Carrera 34 # 5B - 18	3002203100	Ingeniero Mecánico	edgardoflorez_87@hotmail.com	Automatización de procesos y equipos industriales	CONTRATO PRESTACION DE SERVICIOS	386 DE 2021	2023-02-02	1.\tAsistir a reuniones, comités, capacitaciones y demás que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento. \n2.\tRealizar visitas técnicas e informes de acuerdo con lo asignado por la Dirección en cumplimiento del objeto contractual. \n3.\tAsistir y participar en Comités Técnicos y demás reuniones a que haya lugar en los cuales se evaluará el estado de la maquinaria amarilla. \n4.\tMantener un registro diario (bitácora) de seguimiento al uso, direccionamiento y ubicación del total de la maquinaria asignada a la Dirección departamental para la gestión del riesgo de desastres. \n5.\tEvaluar el estado y funcionamiento de los equipos excavadoras y volquetas que conforman el banco de maquinaria amarilla asignado a la Dirección Departamental para la Gestión del riesgo de Desastres.\n6.\tPlanear y dirigir las actividades de mantenimiento preventivo y correctivo de la maquinaria amarilla.\n7.\tElaborar procedimientos para llevar a cabo el plan de inspecciones, en los que se indique el paso a paso de como ejecutarlos, cuáles son los valores de referencia, como registrar la información obtenida y como analizarla. \n8.\tParticipar en la planeación y ejecución de proyectos planteados por la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.\n9.\tMantener y actualizar la información técnica de la maquinaria amarilla.\n10.\tActualizar el inventario físico y en el sistema de todos los equipos y sus accesorios.\n11.\tRevisar constantemente los procedimientos de mantenimiento preventivo y los intervalos entre intervenciones para las maquinas estratégicas y críticas. \n12.\tElaborar los planes de renovación de las herramientas para la adecuada ejecución de los mantenimientos preventivos y correctivos.\n13.\tSupervisar y velar por el cumplimiento de los requerimientos de los mantenimientos y garantizar el cumplimiento de las normas de seguridad por parte de los contratistas. \n14.\tElaborar los informes periódicos de mantenimiento, en los que sobre todo se analizan los resultados del plan de mantenimiento. \n15.\tEstimar el tiempo y los materiales necesarios para realizar las labores de mantenimiento preventivo y correctivo de la maquinaria amarilla, realizando los respectivos presupuestos de costos. \n16.\tMantener contacto con proveedores de repuestos, insumos y herramientas.\n17.\tRealizar las solicitudes de pedidos de todos los insumos, herramientas y repuestos para la ejecución de los mantenimientos. \n18.\tBrindar información al jefe inmediato, del plan de mantenimiento y las actividades realizadas por parte del personal técnico externo.\n	Colmena	Sanitas	Protección
12	freddy eliecer martinez agudelo	1121824033	24	M	calle 5 a sur N 40A-127 Amarillo Mapire	3175860792	Administrador de Empresas	freddymartinezag@hotmail.com		CONTRATO PRESTACION DE SERVICIOS	0478 de 2021	2021-02-03	1. Apoyo en la elaboración de estudios de mercados que soportan la etapa precontractual en los diferentes procesos de contratación que desarrolla la Dirección Departamental para la Gestión del Riesgo de Desastres\n2. Realizar informes de acuerdo con lo asignado por la Dirección en cumplimiento del Objeto Contractual.\n3. Apoyar la proyección de análisis del sector.\n4.Apoyar las evaluaciones en los procesos de selección que le sean requeridos.\n5.Asistir a reuniones, comités, capacitaciones y demás que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.\n6.Participar en la implementación y desarrollo del Decálogo de capacidades mínimas de la Dirección Departamental para mejora en los procesos de conocimiento, reducción del riesgo y manejo de desastre.\n7.Obrar con lealtad y buena fe en las distintas actividades que realice.\n8.Presentar al finalizar el contrato los archivos digitales que proyecto durante la ejecución contractual.\n9.Las demás que le sean asignadas y que correspondan al objeto contractual.\n	SURA	SANITAS	PORVENIR
13	Nicole Estefania Cortes Galvis 	1125229562	26	F	Calle 7b N 44-05 	3105724778	Ing ambiental 	nicolecortes734@gmail.com		CONTRATO PRESTACION DE SERVICIOS	541	2021-06-03	1.\tApoyo a la supervisión de los contratos de la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.\n2.\tAsistir a reuniones, comités, capacitaciones y demás que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento. \n3.\tRealizar visitas técnicas e informes de acuerdo con lo asignado por la Dirección en cumplimiento del objeto contractual. \n4.\tApoyar visitas técnicas en desarrollo del balance de calamidades que se presenten en el Departamento del Meta.\n5.\tRealizar entrega periódica de todos los documentos proyectados en atención al desarrollo de sus obligaciones.\n6.\tApoyar la estructuración técnica de los proyectos que le sean asignados por la Dirección. \n7.\tApoyar en la revisión documental de los proyectos y programas de Gestión del Riesgo, formulados por los municipios o demás entidades y demás que le sean asignadas por la Dirección.\n8.\tApoyar en la actualización de los proyectos que sean indicados por la dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.\n9.\tApoyar a la realización y revisión de presupuestos, memorias de cantidades, especificaciones técnicas, Apus y su respectivo soporte de estudio de mercadeo, de los proyectos que le sean asignados por la dirección.\n10.\tMantener estricta reserva y confidencialidad sobre la información que conozca con ocasión de la ejecución del objeto contractual.\n11.\tObrar con lealtad y buena fe en las distintas actividades que realice.\n12.\tLas demás que le sean asignadas y correspondan al objeto contractual.\n13.\tPresentar informe mensual de actividades \n14.\tPresentar al finalizar el contrato los archivos digitales que proyecto durante la ejecución contractual al supervisor del contrato con visto bueno del Director Departamental para la Gestión del Riesgo de Desastres	Colmena 	Sanitas 	Porvenir 
14	Asley Fernando Espejo Diaz	80882602	35	M	Cra 30 # 4 - 66 - Sur Conj Remansos del Bosque Mz 5 C10	3014661058	Ingeniero Civil	asleyfer@gmail.com	Recursos Hidricos	CONTRATO PRESTACION DE SERVICIOS	859 de 2021	2023-02-04	1.\tAsistir a reuniones, comités, capacitaciones y demás que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.\n2.\tApoyo a la Supervisión de los contratos de la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.\n3.\tRealizar visitas técnicas de acuerdo con lo asignado por la Dirección en cumplimiento del objeto contractual\n4.\tUna vez realizada la visita técnica, deberá realizar un diagnóstico y el levantamiento de la problemática.\n5.\tRevisar y generar conceptos de Estudios Hidrológicos.\n6.\tRevisar y generar conceptos sobre Estudios y Diseños Hidráulicos.\n7.\tApoyar visitas técnicas en desarrollo del balance de calamidades que se presenten en el Departamento del Meta.\n8.\tRealizar entrega periódica de todos los documentos proyectados en atención al desarrollo de sus obligaciones.\n9.\tRealizar trabajos de análisis del terreno o inmuebles que se requieren por parte de la Dirección.\n10.\tParticipar en la definición de los estudios complementarios necesarios para los proyectos de obra.\n11.\tRealizar análisis de planos de proyectos de obra que requiera la Dirección.\n12.\tRealizar y aprobar estudios de prefactibilidad.\n13.\tRevisar y aprobar anteproyectos.\n14.\tApoyar en la realización y revisión de presupuestos, memorias de cantidades, especificaciones técnicas, Apus y su respectivo soporte de estudio de mercadeo, de los proyectos que le sean asignados por la Dirección.\n15.\tApoyar en la revisión documental de los proyectos y programas de Gestión del Riesgo, formulados por los municipios o demás entidades y demás que le sean asignados por la Dirección.\n16.\tApoyar en la actualización de los proyectos que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento\n17.\tMantener estricta reserva y confidencialidad sobre la información que conozca con ocasión de la ejecución del objeto contractual.\n18.\tObrar con lealtad y buena fe en las distintas actividades que realice\n19.\tLas demás que el sean asignadas y que correspondan al objeto contractual.\n20.\tPresentar informe mensual de actividades\n21.\tPresentar al finalizar el contrato los archivos digitales que proyecto durante la ejecución contractual al supervisor del contrato con visto bueno del Director Departamental para la Gestión del Riesgo de Desastres.	SEGUROS BOLIVAR	MEDIMAS 	COLPENSIONES 
15	Jhon edisson caicedo gonzalez	1121867388	30	M	Calle 34 #15-04 los sauces	3143751835	Ingeniero civil	jhonedissoncaicedo@hotmail.com		CONTRATO PRESTACION DE SERVICIOS	0662	2022-04-03	OBLIGACIONES ESPECÍFICAS:\n\n1.\tApoyo a la Supervisión de los contratos de la Dirección Departamental para la gestión del Riesgo de Desastres del Departamento.\n2.\tAsistir a reuniones, comités, capacitaciones y demás que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.\n3.\tRealizar visitas técnicas e informes de acuerdo con lo asignado por la Dirección en cumplimiento del objeto contractual. \n4.\tApoyar visitas técnicas en desarrollo del balance de calamidades que se presenten en el Departamento del Meta.\n5.\tRealizar entrega periódica de todos los documentos proyectados en atención al desarrollo de sus obligaciones.\n6.\tApoyar la estructuración técnica de los proyectos que le sean asignados por la Dirección.\n7.\tApoyar en la revisión documental de los proyectos y programa de gestión del Riesgo, formulados por los municipios o demás entidades y demás que le sean asignados por la Dirección. \n8.\tApoyar en la actualización de los proyectos que sean indicados por la dirección.\n9.\tApoyar en la realización y revisión de presupuestos, memorias de cantidades, especificaciones técnicas, Apus, y su respectivo soporte de estudio de mercadeo, de los proyectos que le sean asignados por la dirección.\n10.\tMantener estricta reserva y confidencialidad sobre la información que conozca con ocasión de la ejecución del objeto contractual. \n11.\tObrar con lealtad y buena fe en las distintas actividades que realice.\n12.\tLas demás que le sean asignadas y que correspondan al objeto contractual\n13.\tPresentar informe mensual de actividades.\n14.\tPresentar al finalizar el contrato los archivos digitales que proyecto durante la ejecución contractual al supervisor del contrato con visto bueno del Director Departamental para la gestión del Riesgo de Desastres.\n	Colmena	Nueva eps	Porvenir
16	YAMILE BAHAMON GARCIA	35264562	41	F	CRA. 10B # 24-21	3112377862	ABOGADO	yamilebg07@hotmail.com	DERECHO ADMINISTRATIVO	CONTRATO PRESTACION DE SERVICIOS	364 DE 2021	2023-02-02	1.\tAsesorar, proyectar y adelantar los procesos precontractuales, contractuales y postcontractuales que se surtan en la Dirección Departamental para la Gestión del Riesgo de Desastres.\n2.\tAtender respuestas a observaciones y realizar las evaluaciones jurídicas y actas de cierre de los procesos que se encuentran en página.\n3.\tMantener estricta reserva y confidencialidad sobre la información que conozca con ocasión de la ejecución del objeto contractual.\n4.\tAsistir a reuniones audiencias, comités contractuales y demás actuaciones que sean indicados por la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento.\n5.\tParticipar en la realización de mesas de trabajo, talleres que se efectúen con ocasión del desarrollo de las actividades relacionadas con el objeto del contrato.\n6.\tRevisar y hacer seguimiento al estado de los procesos precontractuales y contractuales encomendados sin interesar la modalidad o la cuantía.\n7.\tObrar con lealtad y buena fe en las distintas etapas contractuales.\n8.\tAsistir a las reuniones y comités de seguimiento y evaluación de la contratación que sean convocados a fin de tratar temas jurídicos relacionados con los asuntos o procesos contractuales\n9.\tRevisar las Liquidaciones, pagos parciales y anticipos de los procesos contractuales adelantados.\n10.\tEfectuar las Evaluaciones jurídicas en los Procesos contractuales que le sean asignados y que adelante la Dirección Departamental para la Gestión del Riesgo de Desastres del Departamento del Meta.\n11.\tEstar actualizado en la normatividad vigente jurídica sobre la materia y en las directrices que imponga la Unidad Nacional para la Gestión del Riesgo de Desastres y la Secretaría Jurídica del Departamento en materia de contratación.\n12.\tLas demás que sean asignadas y que correspondan al objeto contractual\n	POSITIVA SEGUROS	FAMISANAR EPS	COLPENSIONES
17	Gladys Yormary Dueñas Riveros	40186658	40	F	Calle 6Sur # 23-51, Conjunto Santa María 2 casa 2-17	3112029830	Abogada	yormydu@hotmail.com	Derecho Publico	CONTRATO PRESTACION DE SERVICIOS	357 DE 2021	2022-10-02	1.Proyectar las respuestas a los derechos de petición que lleguen a la Dirección para la gestión del riesgo de desastres.  \n2. Proyectar las respuestas a las solicitudes de quejas y reclamos allegados a la Dirección, para aprobación del Coordinador Departamental para la Gestión del Riesgo de Desastres. \n3. Asesorar y apoyar los convenios interadministrativos a suscribir con los organismos de Socorro (Cruz Roja, Defensa Civil y Bomberos). \n4. Participar en la realización de mesas de trabajo, talleres que se efectúen con ocasión del desarrollo de las actividades relacionadas con el objeto del contrato. \n5. Obrar con lealtad y buena fe en las distintas asesorías jurídicas. \n6. asesorar y brindar apoyo jurídico a la dirección departamental para la gestión del riesgo de desastres. \n7. Estar actualizado en la normatividad vigente jurídica sobre la materia y en las directrices que imponga la Unidad Nacional para la Gestión del Riesgo de Desastres. \n8. Participar en la implementación y desarrollo del Decálogo de capacidades mínimas de la Dirección Departamental para mejora en los procesos de conocimiento, reducción del riesgo y manejo del desastre. \n9. Obrar con lealtad y buena fe en las distintas actividades que realice.	Colmena	Sanitas	Porvenir
18	Jairo Alfonso Ospino Rodriguez	19266538	62	M	Calle 31 #17-87 Casa 315	3144742266	Medico	jospinor@meta.gov.co	Epidemiología	CONTRATO PRESTACION DE SERVICIOS	0441 de 2021	2021-01-03	1.\tRealizar análisis epidemiológico de la Covid-19 y transmitir información epidemiológica relacionada con Covid-19, al supervisor del contrato.\n2.\tApoyar cuando se requiera, las capacitaciones en temas epidemiológicos de la Covid- 19 a los equipos de voluntarios que apoyen la Gestión del Riesgo.\n3.\tAsesorar cuando sea necesario, en temas epidemiológicos de Covid-19, para la operación de los puestos de control.\n4.\tDireccionamiento de campañas publicitarias de medidas de cuidado frente al COVID-19.\n5.\tAsistir en representación de la Dirección de Gestión del Riesgo a la sala situacional SARS, cuando sea requerido.\n6.\tServir de enlace de la Dirección del Gestión del Riesgo y Desastres en temas epidemiológicos relacionado; con la COVID-19 con otras instituciones del orden Departamental y Municipal.\n7.\tApoyar y asistir a la dirección Departamental de Gestión del Riesgo en las reuniones relacionadas con el sistema de salud.\n	Colmena	NuevaEps	Colpensiones
19	Nelly morwno	40386753	52	F	Cra 26 #08-86Santa maria reservado 	3138898189	Abogada	nellymor1115@hotmail.com 	Derecho público y financiero 	CONTRATO PRESTACION DE SERVICIOS	395	2023-02-02	Apoyar la proyecciob de las rwpauestas a los derechos de petición que lleguen a la dirección para la Gestión del Riesgo de Desastres\n-proyectar las respuesta de las solicitudes de los consejos de gestión del riesgo y junta departamental d defensa civil del meta, según requerimiento.\n-proyectar conceptos jurídicos en los trámites administrativos en donde se requiera apoyo.\n-apoyar jurídicamente los profesionales de la Dirwcckob dnnlos trámites ange las demas entidades que tienen relación directa con las funciones de la entidad. \n-apoyar la proyecccion de las respuestas a las solicitudes de quejas ybreclamos allegafos a la dirección. Para aprobación del coordinador departamental para la gestión del riesgo de desastres. \n-participar en la realización de mesas de trabajo. Talleres que se efectúen con ocasion del desarrollo de las actividades relacionadas con el objeto del contrato. \n-obrar connlealtad y buena fe en las distintas asesorias juridicas. \n-asesorar y brindar apoyo juridico a la direccion departamental para la gestión del riesgo de desastres \n	Colmena	Sanitas	Porvenir 
22	Marianne Georgina Lemus Gonzalez	46380162	40	F	Carrera 13 36-115E	3204949590	Ingeniera Geologa	georginalemus@gmail.com	Gestión Ambiental	CONTRATO PRESTACION DE SERVICIOS	0396 de 2021	2021-01-03	1.\tRealizar visitas técnicas e informes de acuerdo con lo asignado por Ia Dirección Departamental pare la Gestión del riesgo de desastres.\n2.\tActualizar la base de datos relacionada con los puntos críticos por amenazas naturales en el departamento del Meta.\n3.\tBrindar asistencia técnica en gestión del riesgo de desastres, a los diferentes municipios cuando sea requerido.\n4.\tParticipar en Ia implementación y desarrollo del Decálogo de capacidades mínimas de la Dirección Departamental para mejora en los procesos de conocimiento, reducción del riesgo y manejo del desastre.\n5.\tApoyar Ia formulación de proyectos para reducción del riesgo de desastres en el departamento de meta.\n6.\tConformar equipos interdisciplinarios para gestión de proyectos.\n7.\tMantener estricta reserva y confidencialidad sobre la información que conozca con ocasión de Ia ejecución del objeto contractual.\n8.\tAsistir a reuniones, comités y demás actividades que sean asignadas por Ia Dirección.\n9.\tObrar con lealtad y buena fe en las distintas actividades que realice.\n10.\tLas demás que sean asignadas e inherentes al contrato.\n	Colmena	Nueva EPS	Colpensiones
23	MARTHA AMAYA AGUIRRE	23467273	50	F	Carrea 42 No.20-25	3112762961	Administrador de Empresas	marthaamaya@meta.gov.co		CONTRATO PRESTACION DE SERVICIOS	385-2021	2022-11-02	1.\tAsesorar y brindar apoyo en las actividades de la Dirección Departamental para la Gestión del Riesgo de Desastres.\n2.\tRealizar acompañamiento al Director de Gestión del Riesgo de Desastres a las reuniones, comités, Consejos de Gestión del Riesgo y demás que sean asignadas.\n3.\tBrindar apoyo y asesoría en la planeación, modificación y ajustes al Plan de Adquisiciones, plan Operativo anual de inversiones y plan de acción de la Dirección Departamental para la gestión del riesgo de desastres de acuerdo a los requerimientos de la Dirección.\n4.\tBrindar apoyo en el seguimiento financiero a la ejecución de los recursos del Fondo Departamental de Gestión del riesgo del Meta.\n5.\tElaboración de informes solicitados a la Dirección Departamental para la Gestión del Riesgo de Desastres, que le sean asignados \n6.\tCoordinar las acciones administrativas que se requieran para la ejecución de los procesos que desarrolle la Dirección.\n7.\tBrindar apoyo en el seguimiento al cumplimiento de la Metas de Plan de Desarrollo Departamental.\n8.\t Participar en la realización de mesas de trabajo, talleres que se efectúen con ocasión del desarrollo de las actividades relacionadas con el objeto del contrato.\n9.\tAsistir a reuniones, comités, capacitaciones y demás que sean indicados por la Dirección Departamental.\n10.\tParticipar en la implementación y desarrollo del Decálogo de capacidades mínimas de la Dirección Departamental para mejora en los procesos de conocimiento, reducción del riesgo y manejo del desastre.\n11.\tMantener estricta reserva y confidencialidad sobre la información que conozca con ocasión de la ejecución del objeto contractual.\n12.\tObrar con lealtad y buena fe en las distintas actividades que realice.\n13.\tLas demás que el sean asignadas y que correspondan al objeto contractual.\n\n	COLMENA	NUEVA EPS	COLPENSIONES
\.


--
-- Data for Name: inventario_entrada; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.inventario_entrada (id_inventario_entrada, fecha, id_tipo_ayuda, cantidad, id_entidad) FROM stdin;
\.


--
-- Data for Name: inventario_salida; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.inventario_salida (id_inventario_salida, id_emergencia, cantidad, fecha, id_entidad, id_inventario_entrada) FROM stdin;
\.


--
-- Data for Name: inversiones; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.inversiones (id_inversion, descripcion, valor, fecha, id_emergencia) FROM stdin;
\.


--
-- Data for Name: mantenimientos; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.mantenimientos (id_mantenimiento, id_maquinaria, fecha, costo) FROM stdin;
\.


--
-- Data for Name: maquinaria; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.maquinaria (id_maquinaria, marca, capacidad, presupuesto, ubicacion, descripcion, activa) FROM stdin;
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
15	1	Administración		_self	fa fa-key	#000000	\N	3	2021-05-24 15:35:23	2021-05-25 03:37:29	\N	
16	1	Emergencias		_self	fa fa-ambulance	#000000	\N	4	2021-05-25 03:27:45	2021-05-25 03:37:29	\N	
17	1	Parametros		_self	fa fa-cubes	#000000	\N	5	2021-05-25 03:28:48	2021-05-25 03:37:29	\N	
18	1	Maquinaria		_self	fa fa-truck	#000000	\N	6	2021-05-25 03:30:17	2021-05-25 03:37:29	\N	
19	1	Funcionarios		_self	fa fa-users	#000000	\N	7	2021-05-25 03:30:54	2021-05-25 03:37:29	\N	
20	1	Funcionarios		_self	fa fa-address-card	#000000	19	1	2021-05-25 03:35:18	2021-05-25 03:39:02	voyager.funcionarios.index	null
21	1	Actividades		_self	fa fa-briefcase	\N	19	2	2021-05-25 03:44:17	2021-05-25 03:44:30	voyager.actividades.index	\N
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

COPY public.municipios (id_municipio, nombre) FROM stdin;
174	San Juanito
175	La Uribe
176	Vista Hermosa
169	Granada
170	Mesetas
177	Puerto Concordia
165	San Juan de Arama
166	San Martín
167	Lejanías
168	Cumaral
172	El Castillo
173	Mapiripán
171	Restrepo
178	Acacías
179	Puerto Rico
180	Villavicencio
181	Puerto López
182	San Carlos de Guaroa
183	Puerto Gaitán
184	Fuente de Oro
185	La Macarena
186	Castilla La Nueva
188	El Calvario
187	Barranca de Upía
189	Cubarral
190	Guamal
191	El Dorado
192	Cabuyaro
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
2	1
3	1
4	1
5	1
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
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.roles (id, name, display_name, created_at, updated_at) FROM stdin;
1	admin	Administrator	2021-05-24 14:41:56	2021-05-24 14:41:56
2	user	Normal User	2021-05-24 14:41:56	2021-05-24 14:41:56
3	dev	development	2021-05-25 03:47:38	2021-05-25 03:47:38
4	funcionario	Funcionarios	2021-05-25 03:48:37	2021-05-25 03:48:37
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
-- Data for Name: tipos_acta; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.tipos_acta (id_tipo_acta, descripcion) FROM stdin;
\.


--
-- Data for Name: tipos_actividad; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.tipos_actividad (id_tipo_actividad, descripcion, finaliza) FROM stdin;
\.


--
-- Data for Name: tipos_ayuda; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.tipos_ayuda (id_tipo_ayuda, descripcion) FROM stdin;
\.


--
-- Data for Name: tipos_emergencia; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.tipos_emergencia (id_tipo_emergencia, descripcion) FROM stdin;
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

COPY public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at, avatar, role_id, settings, id_funcionario) FROM stdin;
1	Admin	admin@admin.com	\N	$2y$10$zC8FYuzvOr7ZY4QL0OC2POumy7UMjK5TU6qsuq/AoJAITwcW4lU5.	TEqqFEojWiUv8kFJPJ3ILzVJx6ofKLp0AUo7tYR5gWslLiMTCSeHd5sZFYS2	2021-05-24 14:41:56	2021-05-25 04:03:40	users/May2021/fnekohZWYRzTwPnRQnrc.png	1	\N	2
2	Pedro perez	pedroperez@mail.com	\N	$2y$10$/0eRHndNYXe6bXZkUdTX2.qTN3f0o0YpOD6ZvLSaYCbERVpi12SV2	\N	2021-05-25 04:05:21	2021-05-25 04:05:21	users/default.png	4	\N	2
3	Pedro Perez	pedro@mail.com	\N	$2y$12$VIuQ3hmxgjdaNU0YRKE0ceEeGdfI64GxqFRghnJDRofHAtnbUtDgK	\N	\N	\N	users/default.png	4	\N	2
4	Milena Leon perez	milenaleonp85@hotmail.com	\N	$2y$12$VIuQ3hmxgjdaNU0YRKE0ceEeGdfI64GxqFRghnJDRofHAtnbUtDgK	\N	\N	\N	users/default.png	4	\N	11
5	ALEXIS ADRIAN RAMIREZ	aramirez@meta.gov.co	\N	$2y$12$VIuQ3hmxgjdaNU0YRKE0ceEeGdfI64GxqFRghnJDRofHAtnbUtDgK	\N	\N	\N	users/default.png	4	\N	20
6	María del Pilar Giraldo Noriega	mgiraldon@meta.gov.co	\N	$2y$12$VIuQ3hmxgjdaNU0YRKE0ceEeGdfI64GxqFRghnJDRofHAtnbUtDgK	\N	\N	\N	users/default.png	4	\N	21
7	Juan Fajardo	juanfbarrero@gmail.com	\N	$2y$12$VIuQ3hmxgjdaNU0YRKE0ceEeGdfI64GxqFRghnJDRofHAtnbUtDgK	\N	\N	\N	users/default.png	4	\N	1
8	Camilo Andrés Serna Solano	csernas@meta.gov.co	\N	$2y$12$VIuQ3hmxgjdaNU0YRKE0ceEeGdfI64GxqFRghnJDRofHAtnbUtDgK	\N	\N	\N	users/default.png	4	\N	3
9	LUIS CARLOS GUEVARA GRANADOS	ticsolt@gmail.com	\N	$2y$12$VIuQ3hmxgjdaNU0YRKE0ceEeGdfI64GxqFRghnJDRofHAtnbUtDgK	\N	\N	\N	users/default.png	4	\N	4
10	Camilo Andres Caballero Balcazar 	camiloacaballerob@gmail.com 	\N	$2y$12$VIuQ3hmxgjdaNU0YRKE0ceEeGdfI64GxqFRghnJDRofHAtnbUtDgK	\N	\N	\N	users/default.png	4	\N	10
11	Juanita schmitt 	jschmittro@hotmail.com	\N	$2y$12$VIuQ3hmxgjdaNU0YRKE0ceEeGdfI64GxqFRghnJDRofHAtnbUtDgK	\N	\N	\N	users/default.png	4	\N	5
12	LYSETH TATIANA RUIZ ACERO	tatisruiz.12@hotmail.com	\N	$2y$12$VIuQ3hmxgjdaNU0YRKE0ceEeGdfI64GxqFRghnJDRofHAtnbUtDgK	\N	\N	\N	users/default.png	4	\N	6
13	Claudia Rocio Aparicio Duran	claudiaaparicioduran@gmail.com	\N	$2y$12$VIuQ3hmxgjdaNU0YRKE0ceEeGdfI64GxqFRghnJDRofHAtnbUtDgK	\N	\N	\N	users/default.png	4	\N	7
14	MARTHA TERESA JARA RIOS	jaramartha@hotmail.com	\N	$2y$12$VIuQ3hmxgjdaNU0YRKE0ceEeGdfI64GxqFRghnJDRofHAtnbUtDgK	\N	\N	\N	users/default.png	4	\N	8
15	Edgardo Florez Iglesias	edgardoflorez_87@hotmail.com	\N	$2y$12$VIuQ3hmxgjdaNU0YRKE0ceEeGdfI64GxqFRghnJDRofHAtnbUtDgK	\N	\N	\N	users/default.png	4	\N	9
16	freddy eliecer martinez agudelo	freddymartinezag@hotmail.com	\N	$2y$12$VIuQ3hmxgjdaNU0YRKE0ceEeGdfI64GxqFRghnJDRofHAtnbUtDgK	\N	\N	\N	users/default.png	4	\N	12
17	Nicole Estefania Cortes Galvis 	nicolecortes734@gmail.com	\N	$2y$12$VIuQ3hmxgjdaNU0YRKE0ceEeGdfI64GxqFRghnJDRofHAtnbUtDgK	\N	\N	\N	users/default.png	4	\N	13
18	Asley Fernando Espejo Diaz	asleyfer@gmail.com	\N	$2y$12$VIuQ3hmxgjdaNU0YRKE0ceEeGdfI64GxqFRghnJDRofHAtnbUtDgK	\N	\N	\N	users/default.png	4	\N	14
19	Jhon edisson caicedo gonzalez	jhonedissoncaicedo@hotmail.com	\N	$2y$12$VIuQ3hmxgjdaNU0YRKE0ceEeGdfI64GxqFRghnJDRofHAtnbUtDgK	\N	\N	\N	users/default.png	4	\N	15
20	YAMILE BAHAMON GARCIA	yamilebg07@hotmail.com	\N	$2y$12$VIuQ3hmxgjdaNU0YRKE0ceEeGdfI64GxqFRghnJDRofHAtnbUtDgK	\N	\N	\N	users/default.png	4	\N	16
21	Gladys Yormary Dueñas Riveros	yormydu@hotmail.com	\N	$2y$12$VIuQ3hmxgjdaNU0YRKE0ceEeGdfI64GxqFRghnJDRofHAtnbUtDgK	\N	\N	\N	users/default.png	4	\N	17
22	Jairo Alfonso Ospino Rodriguez	jospinor@meta.gov.co	\N	$2y$12$VIuQ3hmxgjdaNU0YRKE0ceEeGdfI64GxqFRghnJDRofHAtnbUtDgK	\N	\N	\N	users/default.png	4	\N	18
23	Nelly morwno	nellymor1115@hotmail.com 	\N	$2y$12$VIuQ3hmxgjdaNU0YRKE0ceEeGdfI64GxqFRghnJDRofHAtnbUtDgK	\N	\N	\N	users/default.png	4	\N	19
24	Marianne Georgina Lemus Gonzalez	georginalemus@gmail.com	\N	$2y$12$VIuQ3hmxgjdaNU0YRKE0ceEeGdfI64GxqFRghnJDRofHAtnbUtDgK	\N	\N	\N	users/default.png	4	\N	22
25	MARTHA AMAYA AGUIRRE	marthaamaya@meta.gov.co	\N	$2y$12$VIuQ3hmxgjdaNU0YRKE0ceEeGdfI64GxqFRghnJDRofHAtnbUtDgK	\N	\N	\N	users/default.png	4	\N	23
\.


--
-- Data for Name: visita_emergencia; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.visita_emergencia (id_visita_emergencia, id_emergencia, id_visita) FROM stdin;
\.


--
-- Data for Name: visitas; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.visitas (id_visita, accion, fecha, asunto, interesado, localizacion, objeto, desarrollo, concepto, tecnico, recomendaciones) FROM stdin;
\.


--
-- Name: acciones_adelantadas_id_accion_adelantada_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.acciones_adelantadas_id_accion_adelantada_seq', 1, false);


--
-- Name: actas_reunion_id_acta_reunion_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.actas_reunion_id_acta_reunion_seq', 1, false);


--
-- Name: actividades_id_actividad_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.actividades_id_actividad_seq', 1, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.categories_id_seq', 2, true);


--
-- Name: data_rows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.data_rows_id_seq', 84, true);


--
-- Name: data_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.data_types_id_seq', 9, true);


--
-- Name: emergencias_id_emergencia_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.emergencias_id_emergencia_seq', 1, false);


--
-- Name: entidades_id_entidad_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.entidades_id_entidad_seq', 1, false);


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- Name: funcionarios_id_funcionario_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.funcionarios_id_funcionario_seq', 25, true);


--
-- Name: inventario_entrada_id_inventario_entrada_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.inventario_entrada_id_inventario_entrada_seq', 1, false);


--
-- Name: inventario_salida_id_inventario_salida_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.inventario_salida_id_inventario_salida_seq', 1, false);


--
-- Name: inversiones_id_inversion_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.inversiones_id_inversion_seq', 1, false);


--
-- Name: mantenimientos_id_mantenimiento_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.mantenimientos_id_mantenimiento_seq', 1, false);


--
-- Name: maquinaria_id_maquinaria_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.maquinaria_id_maquinaria_seq', 1, false);


--
-- Name: medios_id_medio_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.medios_id_medio_seq', 1, false);


--
-- Name: menu_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.menu_items_id_seq', 21, true);


--
-- Name: menus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.menus_id_seq', 1, true);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.migrations_id_seq', 27, true);


--
-- Name: pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.pages_id_seq', 1, true);


--
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.permissions_id_seq', 51, true);


--
-- Name: personas_afectadas_id_personas_afectadas_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.personas_afectadas_id_personas_afectadas_seq', 1, false);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.posts_id_seq', 4, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.roles_id_seq', 4, true);


--
-- Name: seguimientos_maquinaria_id_seguimientos_maquinaria_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.seguimientos_maquinaria_id_seguimientos_maquinaria_seq', 1, false);


--
-- Name: settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.settings_id_seq', 10, true);


--
-- Name: tipos_acta_id_tipo_acta_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.tipos_acta_id_tipo_acta_seq', 1, false);


--
-- Name: tipos_actividad_id_tipo_actividad_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.tipos_actividad_id_tipo_actividad_seq', 1, false);


--
-- Name: tipos_ayuda_id_tipo_ayuda_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.tipos_ayuda_id_tipo_ayuda_seq', 1, false);


--
-- Name: tipos_emergencia_id_tipo_emergencia_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.tipos_emergencia_id_tipo_emergencia_seq', 1, false);


--
-- Name: translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.translations_id_seq', 30, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.users_id_seq', 25, true);


--
-- Name: visita_emergencia_id_visita_emergencia_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.visita_emergencia_id_visita_emergencia_seq', 1, false);


--
-- Name: visitas_id_visita_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.visitas_id_visita_seq', 1, false);


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
    ADD CONSTRAINT acciones_adelantadas_id_emergencia_fkey FOREIGN KEY (id_emergencia) REFERENCES public.emergencias(id_emergencia);


--
-- Name: acciones_adelantadas acciones_adelantadas_id_entidad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.acciones_adelantadas
    ADD CONSTRAINT acciones_adelantadas_id_entidad_fkey FOREIGN KEY (id_entidad) REFERENCES public.entidades(id_entidad);


--
-- Name: acciones_adelantadas acciones_adelantadas_id_tipo_actividad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.acciones_adelantadas
    ADD CONSTRAINT acciones_adelantadas_id_tipo_actividad_fkey FOREIGN KEY (id_tipo_actividad) REFERENCES public.tipos_actividad(id_tipo_actividad);


--
-- Name: actas_reunion actas_reunion_id_tipo_acta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.actas_reunion
    ADD CONSTRAINT actas_reunion_id_tipo_acta_fkey FOREIGN KEY (id_tipo_acta) REFERENCES public.tipos_acta(id_tipo_acta);


--
-- Name: actividades actividades_id_funcionario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.actividades
    ADD CONSTRAINT actividades_id_funcionario_fkey FOREIGN KEY (id_funcionario) REFERENCES public.funcionarios(id_funcionario);


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
-- Name: emergencias_actas emergencias_actas_id_acta_reunion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.emergencias_actas
    ADD CONSTRAINT emergencias_actas_id_acta_reunion_fkey FOREIGN KEY (id_acta_reunion) REFERENCES public.actas_reunion(id_acta_reunion);


--
-- Name: emergencias_actas emergencias_actas_id_emergencia_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.emergencias_actas
    ADD CONSTRAINT emergencias_actas_id_emergencia_fkey FOREIGN KEY (id_emergencia) REFERENCES public.emergencias(id_emergencia);


--
-- Name: emergencias emergencias_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.emergencias
    ADD CONSTRAINT emergencias_fk FOREIGN KEY (id_municipio) REFERENCES public.municipios(id_municipio) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: emergencias emergencias_id_entidad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.emergencias
    ADD CONSTRAINT emergencias_id_entidad_fkey FOREIGN KEY (id_entidad) REFERENCES public.entidades(id_entidad);


--
-- Name: emergencias emergencias_id_funcionario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.emergencias
    ADD CONSTRAINT emergencias_id_funcionario_fkey FOREIGN KEY (id_funcionario) REFERENCES public.funcionarios(id_funcionario);


--
-- Name: emergencias emergencias_tipo_emergencia_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.emergencias
    ADD CONSTRAINT emergencias_tipo_emergencia_fkey FOREIGN KEY (tipo_emergencia) REFERENCES public.tipos_emergencia(id_tipo_emergencia);


--
-- Name: inventario_entrada inventario_entrada_id_entidad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.inventario_entrada
    ADD CONSTRAINT inventario_entrada_id_entidad_fkey FOREIGN KEY (id_entidad) REFERENCES public.entidades(id_entidad);


--
-- Name: inventario_entrada inventario_entrada_id_tipo_ayuda_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.inventario_entrada
    ADD CONSTRAINT inventario_entrada_id_tipo_ayuda_fkey FOREIGN KEY (id_tipo_ayuda) REFERENCES public.tipos_ayuda(id_tipo_ayuda);


--
-- Name: inventario_salida inventario_salida_id_emergencia_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.inventario_salida
    ADD CONSTRAINT inventario_salida_id_emergencia_fkey FOREIGN KEY (id_emergencia) REFERENCES public.emergencias(id_emergencia);


--
-- Name: inventario_salida inventario_salida_id_entidad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.inventario_salida
    ADD CONSTRAINT inventario_salida_id_entidad_fkey FOREIGN KEY (id_entidad) REFERENCES public.entidades(id_entidad);


--
-- Name: inventario_salida inventario_salida_id_inventario_entrada_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.inventario_salida
    ADD CONSTRAINT inventario_salida_id_inventario_entrada_fkey FOREIGN KEY (id_inventario_entrada) REFERENCES public.inventario_entrada(id_inventario_entrada);


--
-- Name: inversiones inversiones_id_inversion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.inversiones
    ADD CONSTRAINT inversiones_id_inversion_fkey FOREIGN KEY (id_inversion) REFERENCES public.emergencias(id_emergencia);


--
-- Name: mantenimientos mantenimientos_id_mantenimiento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.mantenimientos
    ADD CONSTRAINT mantenimientos_id_mantenimiento_fkey FOREIGN KEY (id_mantenimiento) REFERENCES public.maquinaria(id_maquinaria);


--
-- Name: medios medios_id_emergencia_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.medios
    ADD CONSTRAINT medios_id_emergencia_fkey FOREIGN KEY (id_emergencia) REFERENCES public.emergencias(id_emergencia);


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
    ADD CONSTRAINT personas_afectadas_id_emergencia_fkey FOREIGN KEY (id_emergencia) REFERENCES public.emergencias(id_emergencia);


--
-- Name: seguimientos_maquinaria seguimientos_maquinaria_id_maquinaria_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.seguimientos_maquinaria
    ADD CONSTRAINT seguimientos_maquinaria_id_maquinaria_fkey FOREIGN KEY (id_maquinaria) REFERENCES public.maquinaria(id_maquinaria);


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
    ADD CONSTRAINT users_fk FOREIGN KEY (id_funcionario) REFERENCES public.funcionarios(id_funcionario);


--
-- Name: users users_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- Name: visita_emergencia visita_emergencia_id_emergencia_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.visita_emergencia
    ADD CONSTRAINT visita_emergencia_id_emergencia_fkey FOREIGN KEY (id_emergencia) REFERENCES public.emergencias(id_emergencia);


--
-- Name: visita_emergencia visita_emergencia_id_visita_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.visita_emergencia
    ADD CONSTRAINT visita_emergencia_id_visita_fkey FOREIGN KEY (id_visita) REFERENCES public.visitas(id_visita);


--
-- PostgreSQL database dump complete
--

