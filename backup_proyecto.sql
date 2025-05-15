--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

-- Started on 2025-05-14 22:36:31

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
-- TOC entry 9 (class 2615 OID 34094)
-- Name: proyecto; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA proyecto;


ALTER SCHEMA proyecto OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 264 (class 1259 OID 34377)
-- Name: city; Type: TABLE; Schema: proyecto; Owner: postgres
--

CREATE TABLE proyecto.city (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    departament_id character varying(10) NOT NULL
);


ALTER TABLE proyecto.city OWNER TO postgres;

--
-- TOC entry 263 (class 1259 OID 34350)
-- Name: client; Type: TABLE; Schema: proyecto; Owner: postgres
--

CREATE TABLE proyecto.client (
    id integer NOT NULL,
    name1 character varying(20) NOT NULL,
    name2 character varying(20),
    lastname1 character varying(20) NOT NULL,
    lastname2 character varying(20),
    contact character varying(11),
    address character varying(100)
);


ALTER TABLE proyecto.client OWNER TO postgres;

--
-- TOC entry 262 (class 1259 OID 34349)
-- Name: client_id_seq; Type: SEQUENCE; Schema: proyecto; Owner: postgres
--

CREATE SEQUENCE proyecto.client_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE proyecto.client_id_seq OWNER TO postgres;

--
-- TOC entry 4949 (class 0 OID 0)
-- Dependencies: 262
-- Name: client_id_seq; Type: SEQUENCE OWNED BY; Schema: proyecto; Owner: postgres
--

ALTER SEQUENCE proyecto.client_id_seq OWNED BY proyecto.client.id;


--
-- TOC entry 261 (class 1259 OID 34319)
-- Name: departament; Type: TABLE; Schema: proyecto; Owner: postgres
--

CREATE TABLE proyecto.departament (
    id character varying(7) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE proyecto.departament OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 34212)
-- Name: devolution; Type: TABLE; Schema: proyecto; Owner: postgres
--

CREATE TABLE proyecto.devolution (
    purchase_id integer NOT NULL,
    id integer NOT NULL,
    devolution_date date NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE proyecto.devolution OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 34211)
-- Name: devolution_id_seq; Type: SEQUENCE; Schema: proyecto; Owner: postgres
--

CREATE SEQUENCE proyecto.devolution_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE proyecto.devolution_id_seq OWNER TO postgres;

--
-- TOC entry 4950 (class 0 OID 0)
-- Dependencies: 249
-- Name: devolution_id_seq; Type: SEQUENCE OWNED BY; Schema: proyecto; Owner: postgres
--

ALTER SEQUENCE proyecto.devolution_id_seq OWNED BY proyecto.devolution.id;


--
-- TOC entry 251 (class 1259 OID 34218)
-- Name: employee; Type: TABLE; Schema: proyecto; Owner: postgres
--

CREATE TABLE proyecto.employee (
    id character varying(20) NOT NULL,
    name1 character varying(20) NOT NULL,
    name2 character varying(20),
    lastname1 character varying(20) NOT NULL,
    lastname2 character varying(20),
    contact character varying(10) NOT NULL,
    employment character varying(50) NOT NULL,
    salary numeric(10,0) NOT NULL
);


ALTER TABLE proyecto.employee OWNER TO postgres;

--
-- TOC entry 253 (class 1259 OID 34224)
-- Name: product; Type: TABLE; Schema: proyecto; Owner: postgres
--

CREATE TABLE proyecto.product (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    amount integer NOT NULL,
    price numeric(10,0) NOT NULL,
    description character varying(200),
    type_product character varying(50) NOT NULL,
    promotional_value numeric(10,0),
    product_category_id character varying(20)
);


ALTER TABLE proyecto.product OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 34173)
-- Name: product_category; Type: TABLE; Schema: proyecto; Owner: postgres
--

CREATE TABLE proyecto.product_category (
    id character varying(20) NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(255)
);


ALTER TABLE proyecto.product_category OWNER TO postgres;

--
-- TOC entry 252 (class 1259 OID 34223)
-- Name: product_id_seq; Type: SEQUENCE; Schema: proyecto; Owner: postgres
--

CREATE SEQUENCE proyecto.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE proyecto.product_id_seq OWNER TO postgres;

--
-- TOC entry 4951 (class 0 OID 0)
-- Dependencies: 252
-- Name: product_id_seq; Type: SEQUENCE OWNED BY; Schema: proyecto; Owner: postgres
--

ALTER SEQUENCE proyecto.product_id_seq OWNED BY proyecto.product.id;


--
-- TOC entry 254 (class 1259 OID 34235)
-- Name: product_supplier; Type: TABLE; Schema: proyecto; Owner: postgres
--

CREATE TABLE proyecto.product_supplier (
    supply_date date NOT NULL,
    cost numeric(10,2) NOT NULL,
    product_id integer NOT NULL,
    supplier_id integer NOT NULL
);


ALTER TABLE proyecto.product_supplier OWNER TO postgres;

--
-- TOC entry 256 (class 1259 OID 34241)
-- Name: purchase; Type: TABLE; Schema: proyecto; Owner: postgres
--

CREATE TABLE proyecto.purchase (
    id integer NOT NULL,
    purchase_date date NOT NULL,
    total_purchase numeric(10,0) NOT NULL,
    client_id integer,
    employee_id character varying(20) NOT NULL,
    method_pay character varying(20) NOT NULL
);


ALTER TABLE proyecto.purchase OWNER TO postgres;

--
-- TOC entry 258 (class 1259 OID 34248)
-- Name: purchase_detail; Type: TABLE; Schema: proyecto; Owner: postgres
--

CREATE TABLE proyecto.purchase_detail (
    id integer NOT NULL,
    product_id integer NOT NULL,
    purchase_id integer NOT NULL,
    amount integer NOT NULL,
    cost numeric(10,0)
);


ALTER TABLE proyecto.purchase_detail OWNER TO postgres;

--
-- TOC entry 257 (class 1259 OID 34247)
-- Name: purchase_detail_id_seq; Type: SEQUENCE; Schema: proyecto; Owner: postgres
--

CREATE SEQUENCE proyecto.purchase_detail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE proyecto.purchase_detail_id_seq OWNER TO postgres;

--
-- TOC entry 4952 (class 0 OID 0)
-- Dependencies: 257
-- Name: purchase_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: proyecto; Owner: postgres
--

ALTER SEQUENCE proyecto.purchase_detail_id_seq OWNED BY proyecto.purchase_detail.id;


--
-- TOC entry 255 (class 1259 OID 34240)
-- Name: purchase_id_seq; Type: SEQUENCE; Schema: proyecto; Owner: postgres
--

CREATE SEQUENCE proyecto.purchase_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE proyecto.purchase_id_seq OWNER TO postgres;

--
-- TOC entry 4953 (class 0 OID 0)
-- Dependencies: 255
-- Name: purchase_id_seq; Type: SEQUENCE OWNED BY; Schema: proyecto; Owner: postgres
--

ALTER SEQUENCE proyecto.purchase_id_seq OWNED BY proyecto.purchase.id;


--
-- TOC entry 260 (class 1259 OID 34257)
-- Name: supplier; Type: TABLE; Schema: proyecto; Owner: postgres
--

CREATE TABLE proyecto.supplier (
    id integer NOT NULL,
    name1 character varying(50) NOT NULL,
    contact character varying(11) NOT NULL,
    address character varying(50)
);


ALTER TABLE proyecto.supplier OWNER TO postgres;

--
-- TOC entry 259 (class 1259 OID 34256)
-- Name: supplier_id_seq; Type: SEQUENCE; Schema: proyecto; Owner: postgres
--

CREATE SEQUENCE proyecto.supplier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE proyecto.supplier_id_seq OWNER TO postgres;

--
-- TOC entry 4954 (class 0 OID 0)
-- Dependencies: 259
-- Name: supplier_id_seq; Type: SEQUENCE OWNED BY; Schema: proyecto; Owner: postgres
--

ALTER SEQUENCE proyecto.supplier_id_seq OWNED BY proyecto.supplier.id;


--
-- TOC entry 4757 (class 2604 OID 34353)
-- Name: client id; Type: DEFAULT; Schema: proyecto; Owner: postgres
--

ALTER TABLE ONLY proyecto.client ALTER COLUMN id SET DEFAULT nextval('proyecto.client_id_seq'::regclass);


--
-- TOC entry 4752 (class 2604 OID 34215)
-- Name: devolution id; Type: DEFAULT; Schema: proyecto; Owner: postgres
--

ALTER TABLE ONLY proyecto.devolution ALTER COLUMN id SET DEFAULT nextval('proyecto.devolution_id_seq'::regclass);


--
-- TOC entry 4753 (class 2604 OID 34227)
-- Name: product id; Type: DEFAULT; Schema: proyecto; Owner: postgres
--

ALTER TABLE ONLY proyecto.product ALTER COLUMN id SET DEFAULT nextval('proyecto.product_id_seq'::regclass);


--
-- TOC entry 4754 (class 2604 OID 34244)
-- Name: purchase id; Type: DEFAULT; Schema: proyecto; Owner: postgres
--

ALTER TABLE ONLY proyecto.purchase ALTER COLUMN id SET DEFAULT nextval('proyecto.purchase_id_seq'::regclass);


--
-- TOC entry 4755 (class 2604 OID 34251)
-- Name: purchase_detail id; Type: DEFAULT; Schema: proyecto; Owner: postgres
--

ALTER TABLE ONLY proyecto.purchase_detail ALTER COLUMN id SET DEFAULT nextval('proyecto.purchase_detail_id_seq'::regclass);


--
-- TOC entry 4756 (class 2604 OID 34260)
-- Name: supplier id; Type: DEFAULT; Schema: proyecto; Owner: postgres
--

ALTER TABLE ONLY proyecto.supplier ALTER COLUMN id SET DEFAULT nextval('proyecto.supplier_id_seq'::regclass);


--
-- TOC entry 4943 (class 0 OID 34377)
-- Dependencies: 264
-- Data for Name: city; Type: TABLE DATA; Schema: proyecto; Owner: postgres
--

COPY proyecto.city (id, name, departament_id) FROM stdin;
5001	Medellín	5
8001	Barranquilla	8
81001	Arauca	81
11001	Bogotá D.C.	11
13001	Cartagena	13
15001	Tunja	15
17001	Manizales	17
18001	Florencia	18
19001	Popayán	19
20001	Valledupar	20
27001	Quibdó	27
23001	Montería	23
25001	Chía	25
94001	Inírida	94
95001	San José del Guaviare	95
44001	Riohacha	44
47001	Santa Marta	47
50001	Villavicencio	50
52001	Pasto	52
54001	Cúcuta	54
63001	Armenia	63
66001	Pereira	66
68001	Bucaramanga	68
70001	Sincelejo	70
73001	Ibagué	73
76001	Cali	76
85001	Yopal	85
86001	Mocoa	86
88001	San Andrés	88
97001	Mitú	97
99001	Puerto Carreño	99
54078	Ocaña	54
\.


--
-- TOC entry 4942 (class 0 OID 34350)
-- Dependencies: 263
-- Data for Name: client; Type: TABLE DATA; Schema: proyecto; Owner: postgres
--

COPY proyecto.client (id, name1, name2, lastname1, lastname2, contact, address) FROM stdin;
1	Sebastián	Juliana	Castro	Díaz	3924289962	Diagonal 68 #77-44, Ibagué
2	Carlos	Felipe	Pérez	Torres	3883876607	Avenida 70 #50-57, Bogotá
3	Camila	Esteban	Díaz	Gómez	3970327746	Transversal 100 #65-44, Medellín
4	Laura	Felipe	Pérez	Díaz	3986999043	Transversal 50 #82-45, Cartagena
5	Valentina	Elena	Díaz	Castro	3833906321	Carrera 27 #98-53, Pereira
6	Laura	Esteban	Castro	Pérez	3260969310	Avenida 14 #83-54, Barranquilla
7	Juan	Antonio	Rojas	Ramírez	3162344240	Calle 30 #78-74, Cúcuta
8	Laura	Juliana	Rojas	López	3946568764	Diagonal 27 #17-29, Manizales
9	Daniel	David	Pérez	Martínez	3211708397	Carrera 63 #50-22, Barranquilla
10	Andrés	Juliana	Castro	Rojas	3476727921	Transversal 10 #10-48, Bogotá
11	Luis	Antonio	Díaz	Rojas	3905421009	Transversal 11 #36-59, Cartagena
12	Daniel	Antonio	Gómez	Castro	3859925325	Calle 15 #62-99, Cúcuta
13	Juan	Lucía	Rojas	Gómez	3710121264	Calle 15 #18-83, Bucaramanga
14	Daniel	Lucía	Martínez	Hernández	3861112193	Carrera 34 #51-32, Bucaramanga
15	Laura	Juliana	Pérez	López	3342352184	Transversal 87 #91-78, Bucaramanga
16	Valentina	Andrés	Martínez	López	3508764240	Calle 9 #60-92, Bogotá
17	Sebastián	Isabel	Martínez	Pérez	3159489046	Calle 14 #48-18, Pereira
18	Juan	Lucía	Díaz	López	3990119773	Calle 16 #84-62, Barranquilla
19	Sebastián	David	Torres	Gómez	3469881643	Transversal 27 #27-16, Bucaramanga
20	Luis	David	Torres	López	3474211669	Carrera 6 #54-35, Cali
21	Daniel	Felipe	López	Hernández	3764645999	Calle 88 #37-18, Cartagena
22	Andrés	Elena	Hernández	Rojas	3180317268	Avenida 53 #45-14, Ibagué
23	Valentina	Lucía	Rojas	Pérez	3555258019	Avenida 51 #45-98, Medellín
24	Sofía	Antonio	Torres	Hernández	3778705144	Transversal 41 #80-82, Bogotá
25	Camila	Lucía	Gómez	Díaz	3756290579	Calle 33 #36-80, Cúcuta
26	Valentina	Antonio	Gómez	Hernández	3255409784	Avenida 28 #59-75, Bogotá
27	Paula	Andrés	Rojas	Gómez	3958006374	Calle 82 #54-76, Medellín
28	Camila	Isabel	Hernández	Gómez	3645773562	Diagonal 60 #51-30, Medellín
29	Andrés	Isabel	Hernández	Ramírez	3347341611	Carrera 15 #18-89, Bucaramanga
30	Daniel	María	Torres	Ramírez	3553104484	Calle 21 #85-13, Bogotá
31	Paula	Antonio	Gómez	Martínez	3122300481	Transversal 75 #56-80, Cali
32	Daniel	Carlos	Martínez	Gómez	3119144982	Carrera 17 #91-91, Cúcuta
33	Carlos	David	Castro	Díaz	3902775182	Calle 32 #23-18, Pereira
34	Carlos	Lucía	Castro	Hernández	3411177747	Calle 100 #52-35, Bucaramanga
35	Juan	Andrés	Torres	Martínez	3491894170	Diagonal 4 #66-62, Bogotá
36	Sofía	Isabel	Díaz	Hernández	3822792769	Avenida 67 #15-72, Medellín
37	Camila	Esteban	Gómez	Gómez	3296392175	Carrera 59 #57-93, Cúcuta
38	Sofía	David	Martínez	Gómez	3666097157	Carrera 91 #93-98, Bucaramanga
39	Valentina	Elena	Díaz	Rojas	3880394833	Transversal 79 #76-50, Pereira
40	Luis	Elena	Martínez	Pérez	3822702087	Carrera 27 #29-85, Barranquilla
41	Laura	Andrés	Díaz	Ramírez	3599916137	Carrera 20 #64-88, Cali
42	Carlos	Antonio	Castro	Pérez	3727282911	Transversal 29 #13-77, Medellín
43	Camila	María	López	Pérez	3418718471	Calle 54 #94-95, Barranquilla
44	Camila	Elena	Torres	Gómez	3972671883	Carrera 20 #32-60, Barranquilla
45	Camila	María	Torres	Rojas	3798598037	Calle 3 #36-50, Manizales
46	Luis	Isabel	Castro	Martínez	3608186747	Carrera 33 #66-84, Ibagué
47	Juan	Elena	Hernández	Pérez	3947794225	Calle 22 #58-24, Barranquilla
48	Paula	Esteban	Ramírez	Rojas	3800704324	Avenida 6 #56-74, Ibagué
49	Camila	Juliana	López	Torres	3641894194	Avenida 39 #49-40, Barranquilla
50	Sebastián	Lucía	Torres	Pérez	3509248466	Diagonal 85 #15-49, Barranquilla
51	Andrés	Antonio	Gómez	Hernández	3536406917	Transversal 65 #54-34, Manizales
52	Sebastián	Carlos	Gómez	Rojas	3994789223	Diagonal 40 #46-65, Barranquilla
53	Luis	Isabel	Ramírez	López	3529254139	Transversal 30 #74-70, Manizales
54	Valentina	Isabel	López	Pérez	3898189604	Diagonal 5 #53-69, Bucaramanga
55	Sofía	Lucía	Díaz	López	3984605060	Carrera 2 #44-51, Manizales
56	Luis	Carlos	Ramírez	Pérez	3991792466	Transversal 68 #46-67, Bogotá
57	Luis	Juliana	Rojas	Castro	3294022836	Diagonal 87 #59-69, Medellín
58	Andrés	Antonio	Gómez	Martínez	3720126673	Diagonal 58 #14-37, Bogotá
59	Valentina	Felipe	López	Martínez	3849010503	Carrera 79 #44-18, Cartagena
60	Sebastián	Isabel	Pérez	Hernández	3758376007	Transversal 46 #16-82, Bucaramanga
61	Luis	Elena	Torres	Gómez	3829578979	Calle 45 #26-28, Manizales
62	Laura	David	Hernández	Torres	3985537643	Avenida 58 #19-61, Cali
63	Camila	Isabel	Martínez	López	3847540739	Carrera 55 #89-13, Pereira
64	Camila	Elena	López	Rojas	3442949538	Diagonal 56 #87-59, Manizales
65	Andrés	Andrés	Pérez	Martínez	3645976214	Transversal 66 #84-81, Barranquilla
66	Sofía	Felipe	Hernández	Pérez	3775819061	Avenida 97 #24-24, Cali
67	Carlos	Lucía	Díaz	Torres	3915009781	Carrera 3 #51-19, Ibagué
68	Luis	Lucía	Díaz	Hernández	3948514833	Carrera 95 #55-92, Bogotá
69	Sofía	David	Hernández	Díaz	3445741800	Calle 99 #91-90, Ibagué
70	Sofía	Esteban	Gómez	Gómez	3383262099	Carrera 42 #24-98, Manizales
71	Valentina	Carlos	Díaz	Castro	3448589985	Avenida 45 #84-49, Cartagena
72	Ana	Felipe	Gómez	Díaz	3632376300	Diagonal 34 #72-93, Bogotá
73	Daniel	Lucía	Pérez	Torres	3759476722	Avenida 79 #26-21, Barranquilla
74	Paula	María	López	Gómez	3212293598	Diagonal 75 #92-10, Cúcuta
75	Carlos	Juliana	Ramírez	Ramírez	3757274283	Calle 91 #17-87, Bucaramanga
76	Laura	María	Rojas	López	3346107779	Carrera 96 #56-68, Manizales
77	Sofía	David	Hernández	Díaz	3729530968	Calle 33 #40-71, Bucaramanga
78	Andrés	Isabel	Hernández	Martínez	3619633998	Avenida 61 #27-68, Bucaramanga
79	Sebastián	Antonio	Hernández	Ramírez	3366244900	Calle 38 #66-10, Barranquilla
80	Carlos	Carlos	Torres	Gómez	3642499987	Calle 29 #52-19, Cali
81	Sebastián	Esteban	Díaz	Rojas	3719192645	Avenida 55 #56-63, Medellín
82	Ana	Andrés	Ramírez	Ramírez	3458158554	Calle 9 #61-68, Manizales
83	Laura	Andrés	Pérez	Hernández	3526866523	Avenida 62 #82-23, Bogotá
84	Luis	Juliana	Díaz	Hernández	3318493101	Calle 38 #86-62, Cúcuta
85	Sebastián	Antonio	Pérez	Pérez	3675481637	Avenida 39 #75-46, Manizales
86	Sebastián	María	Rojas	Rojas	3771767818	Transversal 86 #85-12, Cartagena
87	Andrés	Isabel	Martínez	López	3890766644	Calle 88 #69-24, Cali
88	Juan	María	Martínez	Torres	3569010906	Avenida 36 #77-41, Cúcuta
89	Andrés	Antonio	Castro	Martínez	3733586281	Carrera 37 #65-69, Bucaramanga
90	Camila	David	Díaz	Pérez	3923307011	Diagonal 7 #72-71, Cali
91	Ana	David	Pérez	Pérez	3907274592	Calle 41 #28-38, Ibagué
92	Laura	Isabel	Rojas	Hernández	3218441583	Calle 67 #44-35, Manizales
93	Sofía	María	Gómez	Gómez	3278011510	Transversal 35 #21-74, Pereira
94	Ana	Elena	Gómez	López	3959594012	Carrera 71 #55-32, Barranquilla
95	Sebastián	Juliana	Rojas	Díaz	3919891463	Diagonal 76 #10-33, Bogotá
96	Daniel	Esteban	Castro	Castro	3443096975	Calle 65 #29-21, Cali
97	Juan	Antonio	Torres	Torres	3924012035	Calle 1 #86-57, Bogotá
98	Carlos	David	Martínez	Castro	3404114819	Carrera 11 #64-93, Manizales
99	Laura	Antonio	Rojas	Gómez	3374841530	Calle 62 #49-37, Cartagena
100	Ana	Antonio	Ramírez	Ramírez	3528277621	Diagonal 30 #56-78, Manizales
101	Luis	Carlos	Ramírez	Rojas	3678164278	Diagonal 60 #92-71, Ibagué
102	Ana	Isabel	Torres	Gómez	3491315566	Avenida 7 #43-83, Barranquilla
103	Ana	Elena	Pérez	Pérez	3842218424	Avenida 65 #45-12, Cali
104	Carlos	Juliana	Torres	Gómez	3218897884	Avenida 17 #53-28, Pereira
105	Laura	Andrés	Hernández	Gómez	3718213189	Avenida 47 #89-88, Bogotá
106	Juan	Carlos	Castro	Gómez	3817730640	Avenida 91 #27-48, Bogotá
107	Valentina	Andrés	Ramírez	Rojas	3484465987	Carrera 28 #88-59, Cartagena
108	Ana	Felipe	Martínez	Rojas	3930886163	Avenida 31 #93-53, Cali
109	Luis	Andrés	Gómez	Díaz	3833483666	Carrera 94 #37-23, Barranquilla
110	Luis	Felipe	López	López	3974719342	Carrera 49 #59-81, Bogotá
111	Juan	Esteban	Pérez	Díaz	3581476404	Calle 59 #37-11, Pereira
112	Paula	Felipe	Martínez	Torres	3354020995	Diagonal 70 #66-42, Cartagena
113	Valentina	Elena	López	Díaz	3147978604	Avenida 53 #70-67, Ibagué
114	Ana	Juliana	Díaz	Ramírez	3942836153	Avenida 25 #83-98, Cartagena
115	Carlos	Carlos	López	Rojas	3641447937	Carrera 99 #19-22, Pereira
116	Paula	Esteban	Martínez	Castro	3517676109	Diagonal 70 #27-40, Bucaramanga
117	Juan	Isabel	Castro	López	3108753661	Calle 48 #74-66, Pereira
118	Camila	Isabel	Torres	Hernández	3303231099	Carrera 25 #73-74, Bogotá
119	Sofía	Lucía	Hernández	Torres	3507578694	Calle 4 #44-78, Cali
120	Andrés	Isabel	Pérez	Rojas	3415052172	Transversal 93 #74-89, Medellín
121	Camila	Elena	Gómez	Hernández	3620361455	Calle 36 #20-50, Cúcuta
122	Juan	Antonio	Gómez	López	3541390738	Carrera 31 #83-67, Cúcuta
123	Andrés	David	Castro	Castro	3236671708	Transversal 70 #86-89, Ibagué
124	Valentina	Antonio	Martínez	Torres	3552929513	Transversal 100 #57-77, Cartagena
125	Daniel	David	Castro	Castro	3352936142	Avenida 38 #47-46, Barranquilla
126	Andrés	Isabel	Castro	Martínez	3248549561	Avenida 62 #32-96, Pereira
127	Valentina	Carlos	Ramírez	Torres	3359576862	Avenida 54 #15-43, Manizales
128	Camila	Juliana	Pérez	López	3894322975	Transversal 92 #65-28, Manizales
129	Paula	Carlos	Gómez	Díaz	3967838394	Avenida 53 #31-11, Bogotá
130	Daniel	Lucía	Castro	Torres	3166240614	Carrera 75 #35-46, Manizales
131	Valentina	María	Castro	Díaz	3624343914	Transversal 69 #62-85, Cali
132	Juan	David	Gómez	Castro	3533652992	Diagonal 22 #12-25, Bogotá
133	Andrés	Andrés	Hernández	Hernández	3902282255	Calle 86 #70-36, Barranquilla
134	Sofía	Isabel	Hernández	Díaz	3711920606	Carrera 77 #50-13, Medellín
135	Andrés	Carlos	López	Gómez	3442270304	Avenida 75 #15-41, Bogotá
136	Sofía	Felipe	Martínez	López	3630488567	Transversal 22 #22-18, Cali
137	Valentina	David	Gómez	Hernández	3899531299	Calle 42 #45-64, Bogotá
138	Camila	Esteban	Ramírez	Díaz	3227756264	Carrera 4 #78-69, Pereira
139	Paula	Lucía	Gómez	Rojas	3877625148	Carrera 85 #52-48, Manizales
140	Sofía	Esteban	Martínez	Torres	3403147753	Avenida 30 #86-52, Ibagué
141	Luis	Esteban	Torres	Pérez	3169724271	Transversal 52 #19-55, Bucaramanga
142	Sebastián	Elena	Torres	Gómez	3330253261	Carrera 16 #64-87, Manizales
143	Paula	Felipe	Martínez	Hernández	3821282218	Transversal 91 #37-71, Bucaramanga
144	Sofía	Antonio	Rojas	Pérez	3765243470	Calle 98 #19-51, Cúcuta
145	Sofía	Lucía	Castro	López	3804468546	Diagonal 36 #21-62, Medellín
146	Daniel	Elena	Torres	Díaz	3822317855	Avenida 80 #91-74, Bucaramanga
147	Sofía	Felipe	Rojas	Martínez	3575834751	Calle 49 #45-16, Bogotá
148	Camila	Carlos	López	Ramírez	3251936759	Diagonal 28 #57-63, Barranquilla
149	Sebastián	David	Ramírez	Castro	3527451821	Transversal 88 #69-94, Manizales
150	Sofía	David	Martínez	Torres	3979296758	Calle 74 #61-81, Ibagué
151	Camila	Elena	Rojas	Ramírez	3588946302	Transversal 75 #70-55, Barranquilla
152	Juan	María	Pérez	Rojas	3502261481	Carrera 23 #71-20, Bogotá
153	Paula	Elena	Díaz	López	3870508504	Calle 60 #61-66, Ibagué
154	Sofía	Juliana	Castro	Gómez	3347851255	Avenida 16 #52-93, Barranquilla
155	Laura	Lucía	Gómez	Martínez	3857611908	Carrera 5 #25-73, Cúcuta
156	Juan	Isabel	Díaz	Rojas	3896364941	Avenida 47 #95-85, Medellín
157	Valentina	David	Gómez	López	3293798892	Avenida 58 #53-17, Medellín
158	Ana	Juliana	Pérez	Ramírez	3501993678	Diagonal 20 #33-42, Cúcuta
159	Juan	Felipe	Torres	Castro	3431113850	Avenida 64 #52-83, Pereira
160	Sebastián	Elena	Ramírez	Torres	3278960904	Transversal 88 #52-85, Bogotá
161	Andrés	Andrés	Gómez	Gómez	3102360902	Avenida 51 #40-20, Ibagué
162	Luis	Esteban	Gómez	Rojas	3266006630	Diagonal 60 #66-17, Medellín
163	Sebastián	Esteban	Díaz	Pérez	3860119093	Calle 44 #67-26, Cartagena
164	Luis	María	Castro	Torres	3880238552	Transversal 26 #32-40, Cali
165	Sebastián	Esteban	Rojas	Díaz	3182922674	Calle 18 #91-40, Cúcuta
166	Ana	Andrés	Hernández	Ramírez	3998738956	Diagonal 15 #64-12, Bucaramanga
167	Luis	María	Gómez	Castro	3771672347	Avenida 3 #83-96, Cartagena
168	Ana	Felipe	Díaz	Gómez	3597056551	Diagonal 91 #99-11, Bucaramanga
169	Laura	Elena	Pérez	Pérez	3232440693	Calle 13 #41-90, Barranquilla
170	Carlos	María	Castro	Rojas	3971807439	Transversal 96 #57-49, Barranquilla
171	Sofía	Esteban	Castro	Castro	3421540296	Carrera 88 #72-76, Ibagué
172	Luis	Carlos	Gómez	Torres	3825601969	Diagonal 55 #80-17, Cali
173	Camila	Isabel	Ramírez	Martínez	3732196959	Calle 94 #90-91, Bogotá
174	Valentina	Felipe	Gómez	Hernández	3158890912	Calle 35 #76-30, Cali
175	Sofía	Felipe	Gómez	Rojas	3683740402	Avenida 95 #74-65, Medellín
176	Andrés	Carlos	Gómez	Castro	3508877746	Carrera 98 #76-66, Manizales
177	Sofía	Isabel	Castro	Rojas	3277782108	Carrera 90 #46-22, Cartagena
178	Sebastián	Felipe	Hernández	Ramírez	3665081665	Avenida 76 #78-23, Cúcuta
179	Ana	David	Díaz	Díaz	3224093676	Transversal 76 #98-35, Bucaramanga
180	Juan	Lucía	Pérez	Hernández	3788003021	Transversal 73 #49-41, Manizales
181	Sofía	Elena	Torres	Torres	3360338976	Diagonal 23 #99-12, Pereira
182	Camila	Juliana	Gómez	López	3915459677	Carrera 42 #38-50, Medellín
183	Sofía	Esteban	Pérez	Rojas	3884728718	Carrera 29 #41-99, Manizales
184	Sofía	Lucía	Díaz	Torres	3397148009	Carrera 93 #96-83, Manizales
185	Valentina	María	Ramírez	Rojas	3405064460	Carrera 13 #76-73, Cali
186	Carlos	Antonio	Ramírez	Ramírez	3691837978	Diagonal 65 #52-35, Cartagena
187	Valentina	Lucía	Castro	Torres	3616787976	Avenida 22 #36-35, Cartagena
188	Daniel	David	Gómez	Pérez	3572859354	Diagonal 67 #81-60, Barranquilla
189	Paula	Andrés	Castro	Pérez	3917337107	Diagonal 96 #73-29, Pereira
190	Camila	Isabel	Hernández	Gómez	3344445626	Avenida 24 #34-21, Cali
191	Laura	Elena	Gómez	Torres	3832360020	Calle 30 #98-19, Bucaramanga
192	Ana	Lucía	Hernández	Ramírez	3354195943	Carrera 54 #49-58, Cali
193	Juan	Elena	López	Rojas	3687654047	Transversal 5 #11-42, Cúcuta
194	Ana	Antonio	Rojas	Torres	3374958792	Carrera 8 #72-84, Ibagué
195	Luis	Lucía	Castro	Hernández	3906922898	Calle 59 #75-79, Bogotá
196	Sofía	Felipe	Torres	Torres	3510632985	Diagonal 18 #97-59, Ibagué
197	Sofía	Isabel	Gómez	Pérez	3469587021	Avenida 47 #58-41, Cali
198	Laura	Andrés	Martínez	Torres	3718991404	Carrera 12 #93-60, Cartagena
199	Paula	Felipe	Ramírez	Torres	3435609687	Transversal 82 #58-24, Barranquilla
200	Sebastián	Juliana	Martínez	Martínez	3765371070	Diagonal 45 #62-38, Medellín
201	Sofía	Lucía	Díaz	Castro	3289091751	Diagonal 15 #22-58, Cali
202	Andrés	Carlos	Torres	Díaz	3955362109	Calle 75 #54-68, Cali
203	Sofía	David	Ramírez	Gómez	3635699506	Transversal 12 #75-13, Bogotá
204	Daniel	Elena	Castro	Hernández	3692835161	Diagonal 98 #67-95, Bogotá
205	Juan	Carlos	Pérez	Torres	3894705464	Transversal 59 #46-53, Barranquilla
206	Carlos	Antonio	Ramírez	Castro	3520950375	Carrera 60 #15-93, Cúcuta
207	Luis	David	Gómez	López	3371724903	Avenida 12 #22-25, Bucaramanga
208	Luis	Esteban	Martínez	Rojas	3966795841	Avenida 76 #34-71, Barranquilla
209	Sofía	Elena	Castro	Torres	3105895326	Carrera 78 #59-65, Medellín
210	Laura	Juliana	Martínez	Torres	3198190761	Diagonal 10 #77-66, Manizales
211	Camila	Carlos	Castro	Torres	3291092331	Calle 19 #84-34, Cali
212	Andrés	Juliana	Martínez	López	3199707419	Transversal 43 #39-38, Medellín
213	Laura	David	Gómez	López	3151268193	Diagonal 84 #89-71, Bucaramanga
214	Paula	Antonio	Díaz	Díaz	3951507977	Diagonal 9 #55-73, Manizales
215	Sebastián	Andrés	Castro	Rojas	3318486257	Calle 8 #77-62, Medellín
216	Andrés	María	Díaz	Ramírez	3989246552	Carrera 53 #25-26, Barranquilla
217	Sofía	David	Hernández	López	3501747729	Carrera 99 #24-98, Manizales
218	Carlos	Carlos	Pérez	Ramírez	3664355009	Diagonal 15 #17-45, Barranquilla
219	Andrés	Elena	Díaz	Díaz	3249052623	Carrera 68 #29-19, Cartagena
220	Luis	Andrés	Rojas	López	3731914226	Calle 87 #23-85, Barranquilla
221	Sebastián	Lucía	Pérez	López	3699547210	Diagonal 14 #71-24, Medellín
222	Ana	Antonio	Torres	Ramírez	3190068178	Transversal 75 #20-22, Cartagena
223	Daniel	Carlos	Martínez	Ramírez	3668358227	Transversal 35 #62-32, Pereira
224	Daniel	Elena	Ramírez	Hernández	3901788485	Calle 19 #76-16, Cartagena
225	Carlos	María	López	Pérez	3187243216	Diagonal 30 #46-20, Bogotá
226	Juan	Felipe	Díaz	Pérez	3185535291	Transversal 49 #71-84, Cali
227	Sebastián	Carlos	Hernández	Gómez	3382192776	Avenida 9 #75-83, Manizales
228	Laura	David	Ramírez	López	3859754262	Calle 87 #43-27, Pereira
229	Valentina	Isabel	Castro	Hernández	3840197803	Avenida 3 #60-53, Cartagena
230	Juan	María	Pérez	Gómez	3562622446	Transversal 30 #36-72, Cali
231	Carlos	Juliana	Ramírez	Rojas	3447888543	Avenida 31 #53-79, Cali
232	Camila	Lucía	Hernández	Díaz	3307431375	Transversal 35 #37-96, Manizales
233	Andrés	Lucía	López	Pérez	3147694031	Avenida 3 #95-64, Medellín
234	Carlos	David	Castro	Ramírez	3484461799	Calle 61 #60-99, Pereira
235	Paula	Lucía	Castro	Hernández	3122659969	Diagonal 39 #79-39, Bucaramanga
236	Valentina	María	Hernández	Castro	3960999999	Transversal 54 #12-29, Bucaramanga
237	Daniel	Elena	Torres	Hernández	3529636664	Diagonal 32 #86-35, Pereira
238	Juan	Esteban	Díaz	López	3145072246	Carrera 39 #12-29, Ibagué
239	Paula	Juliana	López	Hernández	3288090566	Carrera 4 #68-50, Cartagena
240	Paula	Esteban	Díaz	Martínez	3430510873	Diagonal 99 #67-68, Bogotá
241	Laura	Esteban	Hernández	Castro	3314895814	Carrera 7 #87-69, Cartagena
242	Paula	Esteban	Ramírez	Gómez	3129614250	Calle 20 #31-82, Medellín
243	Luis	Isabel	Martínez	Martínez	3348679599	Calle 41 #38-69, Medellín
244	Sofía	David	Gómez	Castro	3222285645	Diagonal 71 #79-16, Cúcuta
245	Paula	Elena	Díaz	Gómez	3896986757	Carrera 19 #65-69, Barranquilla
246	Juan	Felipe	Castro	Martínez	3108123226	Carrera 59 #55-26, Cartagena
247	Daniel	Elena	Torres	Ramírez	3804111321	Carrera 22 #82-93, Cartagena
248	Valentina	David	Díaz	López	3515658507	Diagonal 51 #86-66, Manizales
249	Camila	Felipe	Pérez	Martínez	3463349685	Carrera 24 #25-70, Manizales
250	Ana	Isabel	Rojas	Castro	3541785904	Transversal 49 #45-49, Barranquilla
251	Camila	David	Martínez	Hernández	3604964334	Diagonal 65 #58-36, Cali
252	Andrés	Elena	Pérez	Castro	3177582038	Carrera 63 #56-46, Cúcuta
253	Sebastián	Carlos	Ramírez	López	3326103663	Carrera 24 #43-52, Bogotá
254	Andrés	Antonio	López	Castro	3795126618	Avenida 9 #32-64, Cartagena
255	Daniel	María	Rojas	Martínez	3981246156	Diagonal 14 #19-38, Bucaramanga
256	Sofía	Carlos	Castro	López	3836629413	Avenida 43 #96-38, Barranquilla
257	Sebastián	David	Castro	Rojas	3721343215	Diagonal 75 #37-39, Barranquilla
258	Luis	Felipe	Hernández	Gómez	3236011965	Carrera 5 #30-47, Cartagena
259	Sofía	Juliana	Hernández	López	3408119422	Carrera 67 #85-96, Cartagena
260	Paula	Juliana	Pérez	Rojas	3910990077	Calle 82 #76-85, Barranquilla
261	Carlos	David	Hernández	Díaz	3409998546	Carrera 89 #22-23, Manizales
262	Paula	David	Díaz	Torres	3276448325	Transversal 99 #12-30, Medellín
263	Ana	Elena	Hernández	Rojas	3270717855	Diagonal 95 #29-30, Bucaramanga
264	Ana	Felipe	Díaz	Gómez	3940084976	Diagonal 9 #71-71, Cúcuta
265	Juan	María	Castro	Rojas	3464393231	Diagonal 53 #75-98, Pereira
266	Daniel	Carlos	Hernández	Gómez	3229968519	Diagonal 97 #81-96, Bogotá
267	Luis	María	Ramírez	Hernández	3282226826	Transversal 94 #16-72, Barranquilla
268	Camila	Antonio	Torres	Martínez	3665553103	Diagonal 63 #26-96, Manizales
269	Laura	Antonio	Castro	Torres	3109556491	Transversal 62 #44-98, Bogotá
270	Paula	Juliana	Hernández	Pérez	3103057713	Carrera 90 #66-48, Cali
271	Sofía	Antonio	Rojas	López	3543629842	Carrera 27 #23-59, Bogotá
272	Camila	Elena	Rojas	Gómez	3996668111	Avenida 33 #94-15, Cali
273	Luis	Juliana	Castro	Hernández	3780168408	Calle 46 #73-42, Cali
274	Sofía	María	Castro	Torres	3900645574	Avenida 65 #39-42, Cúcuta
275	Juan	David	Hernández	Hernández	3344424812	Avenida 94 #46-93, Barranquilla
276	Valentina	David	Rojas	Hernández	3138052535	Diagonal 64 #73-13, Pereira
277	Paula	Esteban	Castro	Torres	3875326849	Avenida 11 #48-92, Cartagena
278	Daniel	Antonio	Gómez	Torres	3359931228	Calle 70 #35-71, Bogotá
279	Laura	Andrés	Martínez	Hernández	3208956153	Calle 93 #27-58, Cali
280	Ana	Carlos	López	López	3512074579	Carrera 57 #73-20, Ibagué
281	Camila	David	Hernández	Ramírez	3575958944	Avenida 3 #59-83, Bogotá
282	Luis	Lucía	Torres	Torres	3723359196	Avenida 26 #47-34, Cúcuta
283	Sebastián	María	Díaz	López	3212745827	Transversal 76 #38-74, Medellín
284	Juan	Isabel	Pérez	Gómez	3376832741	Diagonal 11 #41-38, Ibagué
285	Camila	Felipe	Díaz	López	3916010932	Carrera 13 #96-35, Bogotá
286	Ana	Esteban	Ramírez	López	3751043692	Carrera 34 #65-80, Cúcuta
287	Sofía	Carlos	Castro	Díaz	3326235999	Carrera 41 #12-18, Bucaramanga
288	Juan	Juliana	Hernández	Gómez	3749170756	Avenida 2 #60-31, Barranquilla
289	Ana	Carlos	Ramírez	Gómez	3558848999	Avenida 30 #17-83, Medellín
290	Paula	Felipe	Gómez	Rojas	3861738687	Calle 91 #18-98, Cúcuta
291	Laura	Elena	Díaz	Pérez	3217757739	Calle 93 #67-59, Medellín
292	Camila	Elena	Díaz	Castro	3844419394	Transversal 43 #34-17, Manizales
293	Andrés	David	Ramírez	Martínez	3612366099	Carrera 42 #13-99, Cúcuta
294	Valentina	Antonio	Pérez	Torres	3506928333	Transversal 28 #56-40, Cúcuta
295	Sofía	Felipe	Pérez	Castro	3519534627	Carrera 26 #87-36, Manizales
296	Carlos	Juliana	Martínez	López	3545431384	Calle 93 #82-14, Ibagué
297	Andrés	Esteban	López	Hernández	3951057844	Avenida 42 #53-98, Cartagena
298	Ana	Esteban	López	Hernández	3930078628	Carrera 74 #91-77, Medellín
299	Laura	Lucía	Ramírez	Ramírez	3870296914	Carrera 38 #63-81, Manizales
300	Daniel	Andrés	Pérez	Castro	3899102142	Diagonal 67 #55-47, Ibagué
301	Juan	Lucía	Díaz	Díaz	3153840429	Carrera 29 #31-91, Cartagena
302	Valentina	Esteban	Pérez	Torres	3143832237	Calle 14 #58-85, Pereira
303	Sofía	Carlos	Torres	Gómez	3151924227	Carrera 27 #24-37, Medellín
304	Paula	Isabel	López	Díaz	3948591850	Carrera 44 #58-41, Cúcuta
305	Camila	Carlos	Hernández	Castro	3981514382	Calle 85 #41-91, Pereira
306	Sofía	Juliana	Castro	Torres	3229208221	Transversal 17 #86-83, Pereira
307	Paula	Carlos	Hernández	Díaz	3260631003	Transversal 72 #60-53, Manizales
308	Carlos	Carlos	López	Rojas	3972734444	Transversal 37 #45-29, Cali
309	Juan	Felipe	Hernández	Díaz	3635141371	Avenida 94 #79-25, Medellín
310	Sofía	Antonio	Gómez	López	3919581446	Avenida 9 #66-67, Ibagué
311	Laura	Antonio	Castro	Martínez	3413401511	Calle 59 #12-15, Cartagena
312	Paula	Andrés	Hernández	Díaz	3651401842	Diagonal 85 #74-74, Bucaramanga
313	Sofía	Lucía	Ramírez	López	3423633161	Avenida 25 #41-49, Bucaramanga
314	Juan	Isabel	Martínez	Díaz	3206486356	Transversal 82 #98-81, Cúcuta
315	Daniel	Felipe	Pérez	Gómez	3565232662	Diagonal 80 #48-76, Cali
316	Laura	María	Ramírez	Castro	3956771034	Transversal 34 #28-88, Manizales
317	Valentina	Isabel	Rojas	Martínez	3241262865	Diagonal 12 #11-69, Cali
318	Ana	María	Torres	Pérez	3923360383	Transversal 56 #46-47, Medellín
319	Sebastián	Juliana	Díaz	Castro	3159849472	Calle 58 #30-57, Pereira
320	Luis	Esteban	Pérez	Torres	3310273984	Transversal 49 #36-46, Cúcuta
321	Ana	Elena	López	Gómez	3651672971	Calle 22 #88-11, Bogotá
322	Juan	Isabel	Martínez	Díaz	3782830182	Calle 56 #34-25, Cali
323	Sofía	Andrés	Díaz	Pérez	3781940743	Diagonal 84 #20-83, Manizales
324	Valentina	Felipe	Gómez	Hernández	3240434412	Avenida 60 #46-34, Ibagué
325	Paula	Andrés	Pérez	Castro	3872134568	Diagonal 90 #48-31, Manizales
326	Camila	Isabel	Hernández	Pérez	3398847682	Transversal 42 #98-57, Cartagena
327	Valentina	María	Díaz	López	3404185092	Carrera 66 #40-83, Bogotá
328	Andrés	Juliana	López	Hernández	3558916643	Avenida 78 #13-35, Ibagué
329	Laura	Esteban	Rojas	Gómez	3820246148	Diagonal 64 #87-35, Cúcuta
330	Andrés	Esteban	Gómez	Rojas	3344900310	Calle 89 #66-45, Cali
331	Daniel	Esteban	Castro	Castro	3608238519	Diagonal 77 #17-37, Medellín
332	Daniel	Andrés	Ramírez	Torres	3753444753	Avenida 24 #50-75, Manizales
333	Paula	Esteban	Martínez	Rojas	3376904035	Calle 69 #73-45, Barranquilla
334	Andrés	Esteban	Castro	Gómez	3844385611	Transversal 43 #72-13, Bucaramanga
335	Sebastián	Lucía	Díaz	López	3814983436	Avenida 34 #10-74, Bucaramanga
336	Andrés	Elena	López	Martínez	3662392021	Calle 50 #39-50, Barranquilla
337	Laura	Lucía	López	Hernández	3149133212	Avenida 35 #10-73, Medellín
338	Ana	Carlos	Hernández	Ramírez	3810747525	Calle 63 #76-19, Cúcuta
339	Luis	David	Torres	Gómez	3895520120	Calle 1 #24-48, Bogotá
340	Valentina	Felipe	Hernández	Castro	3103143370	Avenida 24 #89-20, Pereira
341	Ana	Antonio	Díaz	López	3834198717	Avenida 59 #32-28, Cali
342	Camila	David	López	Martínez	3112407024	Diagonal 86 #98-12, Ibagué
343	Luis	David	Díaz	Hernández	3246930387	Avenida 52 #85-23, Cartagena
344	Juan	David	Pérez	Martínez	3349948355	Avenida 24 #62-12, Medellín
345	Luis	David	Ramírez	Castro	3322871599	Transversal 22 #54-81, Bucaramanga
346	Valentina	Felipe	Ramírez	Rojas	3606997408	Calle 52 #37-17, Cúcuta
347	Valentina	Antonio	Díaz	Hernández	3998195108	Diagonal 49 #79-81, Bucaramanga
348	Juan	María	Gómez	López	3340922613	Diagonal 29 #24-94, Cartagena
349	Luis	Lucía	Rojas	Martínez	3254373481	Avenida 23 #62-38, Manizales
350	Luis	Elena	López	Rojas	3300672326	Transversal 67 #79-91, Cúcuta
351	Daniel	Andrés	López	Pérez	3538550663	Diagonal 21 #62-17, Manizales
352	Sofía	Andrés	Ramírez	Rojas	3432686811	Diagonal 95 #75-74, Pereira
353	Andrés	David	Ramírez	Hernández	3958318583	Diagonal 37 #76-62, Cali
354	Paula	Antonio	Martínez	Pérez	3649573572	Carrera 32 #42-39, Pereira
355	Juan	Felipe	López	Rojas	3889251207	Diagonal 2 #99-52, Ibagué
356	Carlos	Juliana	Ramírez	Pérez	3391236105	Avenida 26 #22-80, Cali
357	Luis	María	Ramírez	Castro	3762375856	Carrera 32 #22-65, Bogotá
358	Andrés	Felipe	López	Rojas	3801651071	Avenida 24 #75-66, Cúcuta
359	Ana	Lucía	Díaz	Castro	3412188852	Carrera 56 #33-17, Cartagena
360	Luis	Elena	Gómez	Martínez	3369496161	Calle 1 #91-93, Barranquilla
361	Daniel	Juliana	Gómez	López	3372029105	Carrera 72 #22-61, Ibagué
362	Valentina	Juliana	López	López	3853889098	Avenida 30 #13-43, Pereira
363	Daniel	Elena	López	Torres	3784558902	Calle 42 #62-56, Pereira
364	Laura	Elena	Díaz	Castro	3145073625	Carrera 50 #57-98, Cartagena
365	Juan	Esteban	Ramírez	Gómez	3186224531	Carrera 98 #55-22, Manizales
366	Laura	Andrés	Díaz	Torres	3765058459	Diagonal 31 #42-56, Ibagué
367	Sofía	María	Hernández	Gómez	3505004613	Avenida 89 #90-73, Bucaramanga
368	Daniel	Lucía	Ramírez	López	3642338578	Avenida 94 #36-35, Ibagué
369	Juan	Andrés	Rojas	Rojas	3400416199	Carrera 68 #73-64, Ibagué
370	Ana	Carlos	Martínez	Rojas	3166077150	Calle 8 #13-60, Cúcuta
371	Daniel	Esteban	Ramírez	Pérez	3156330054	Diagonal 50 #43-33, Cartagena
372	Luis	Antonio	Torres	Ramírez	3424133453	Transversal 34 #39-53, Bucaramanga
373	Valentina	Juliana	Rojas	Rojas	3219245242	Carrera 90 #37-11, Bucaramanga
374	Camila	Antonio	Díaz	López	3763160424	Transversal 97 #21-13, Bogotá
375	Paula	Juliana	Martínez	Hernández	3851317874	Diagonal 2 #93-69, Barranquilla
376	Camila	María	Hernández	Castro	3516950940	Carrera 38 #53-16, Barranquilla
377	Ana	Felipe	Díaz	López	3361493490	Avenida 15 #27-12, Cali
378	Sofía	Juliana	Gómez	Martínez	3997009039	Diagonal 86 #47-30, Barranquilla
379	Valentina	Lucía	Gómez	López	3170601686	Transversal 93 #27-34, Cali
380	Camila	Isabel	Rojas	Castro	3252271905	Carrera 9 #36-44, Bucaramanga
381	Juan	Lucía	Torres	Castro	3306265512	Avenida 80 #73-39, Cali
382	Luis	David	Hernández	Pérez	3882763236	Carrera 24 #36-81, Cali
383	Juan	María	Ramírez	Martínez	3188034450	Avenida 26 #39-98, Manizales
384	Valentina	Carlos	Hernández	Gómez	3617456019	Avenida 35 #85-77, Ibagué
385	Ana	David	Díaz	Hernández	3188044755	Diagonal 25 #20-85, Cali
386	Sebastián	Lucía	Ramírez	Martínez	3381519699	Carrera 39 #34-91, Ibagué
387	Camila	Lucía	Rojas	Díaz	3822322897	Carrera 21 #23-10, Medellín
388	Daniel	Andrés	Hernández	Torres	3316201810	Avenida 86 #75-22, Cúcuta
389	Sebastián	David	Hernández	Torres	3627691672	Carrera 2 #29-93, Medellín
390	Laura	Esteban	Pérez	Pérez	3139216459	Diagonal 26 #20-98, Pereira
391	Valentina	María	Pérez	Martínez	3404459420	Avenida 74 #57-35, Barranquilla
392	Valentina	Elena	Castro	Pérez	3830348993	Transversal 45 #35-27, Cali
393	Luis	Andrés	Castro	Ramírez	3984962059	Avenida 67 #45-35, Manizales
394	Paula	Elena	Martínez	Gómez	3991529892	Carrera 81 #53-80, Bucaramanga
395	Sofía	Isabel	Rojas	Castro	3838180996	Diagonal 16 #18-53, Cartagena
396	Paula	David	Gómez	Castro	3566507223	Carrera 98 #84-59, Cali
397	Ana	María	Martínez	Díaz	3138069705	Carrera 43 #57-22, Bogotá
398	Laura	Isabel	Gómez	Rojas	3220235654	Transversal 79 #81-95, Barranquilla
399	Luis	María	Rojas	Martínez	3865997311	Calle 89 #68-36, Ibagué
400	Sofía	David	Hernández	Martínez	3530946281	Carrera 92 #24-92, Barranquilla
401	Andrés	Esteban	Díaz	Pérez	3180627950	Avenida 76 #15-55, Bucaramanga
402	Ana	María	Castro	Martínez	3387964175	Avenida 7 #25-68, Bogotá
403	Ana	María	Rojas	Pérez	3733196640	Diagonal 46 #37-75, Cali
404	Andrés	María	Ramírez	Pérez	3965900698	Carrera 67 #45-14, Pereira
405	Ana	Isabel	Díaz	Gómez	3617799445	Calle 87 #47-47, Manizales
406	Juan	Antonio	Ramírez	Díaz	3169658228	Diagonal 57 #84-38, Medellín
407	Juan	Isabel	Hernández	Torres	3863183125	Carrera 97 #91-78, Pereira
408	Sofía	Andrés	Pérez	Rojas	3555529738	Diagonal 41 #82-58, Cúcuta
409	Valentina	Andrés	Castro	Díaz	3973294385	Avenida 24 #36-25, Bucaramanga
410	Paula	David	Gómez	Pérez	3632183866	Calle 95 #33-46, Barranquilla
411	Carlos	Juliana	Pérez	Torres	3275545972	Diagonal 57 #98-80, Bogotá
412	Camila	María	Díaz	Torres	3176323771	Diagonal 43 #15-83, Manizales
413	Sofía	Elena	Pérez	Hernández	3773885622	Avenida 78 #90-75, Ibagué
414	Luis	Elena	López	Díaz	3553169250	Diagonal 44 #94-67, Cali
415	Andrés	Antonio	Pérez	Martínez	3201494707	Carrera 39 #60-37, Cartagena
416	Camila	Lucía	Ramírez	Torres	3956128011	Diagonal 97 #15-45, Bogotá
417	Juan	Antonio	Rojas	Hernández	3455578569	Calle 72 #61-97, Bucaramanga
418	Andrés	Carlos	Torres	Pérez	3865136877	Avenida 89 #82-81, Ibagué
419	Paula	Andrés	López	Martínez	3193989624	Calle 38 #33-33, Medellín
420	Laura	Carlos	Rojas	Rojas	3267286230	Diagonal 2 #94-92, Medellín
421	Sofía	Carlos	Gómez	Pérez	3622985333	Diagonal 79 #26-43, Barranquilla
422	Ana	Andrés	Rojas	López	3280684849	Carrera 39 #18-56, Medellín
423	Juan	Esteban	Castro	López	3196551253	Carrera 9 #23-18, Ibagué
424	Paula	Esteban	Gómez	Torres	3380324565	Transversal 67 #67-40, Manizales
425	Andrés	Andrés	Rojas	Gómez	3347421763	Transversal 17 #56-74, Cali
426	Sebastián	Felipe	Gómez	Torres	3285426268	Carrera 67 #52-40, Medellín
427	Valentina	Esteban	Gómez	Hernández	3224877966	Diagonal 38 #60-32, Cali
428	Juan	Esteban	López	Castro	3975352956	Avenida 76 #39-65, Bucaramanga
429	Andrés	Carlos	Martínez	López	3171774786	Carrera 18 #68-28, Manizales
430	Andrés	Isabel	Gómez	Rojas	3917307974	Calle 4 #49-43, Bucaramanga
431	Ana	Isabel	Díaz	Ramírez	3904514876	Carrera 29 #34-31, Cartagena
432	Juan	Antonio	Martínez	Hernández	3747562352	Avenida 86 #89-79, Barranquilla
433	Valentina	Esteban	Castro	Gómez	3395914089	Calle 54 #27-40, Barranquilla
434	Valentina	Esteban	Rojas	Rojas	3406425607	Transversal 3 #47-85, Manizales
435	Sebastián	Carlos	Castro	López	3602260564	Calle 89 #81-74, Cartagena
436	Laura	María	Torres	Torres	3957825905	Avenida 18 #20-59, Barranquilla
437	Carlos	Esteban	Rojas	Hernández	3134286092	Carrera 47 #12-29, Pereira
438	Juan	Lucía	Torres	Díaz	3124707518	Diagonal 25 #88-80, Pereira
439	Andrés	Andrés	Ramírez	Castro	3337045062	Diagonal 4 #34-68, Manizales
440	Camila	Isabel	López	Díaz	3193780804	Transversal 53 #35-44, Cartagena
441	Carlos	Elena	Hernández	Torres	3490730544	Carrera 37 #98-81, Cúcuta
442	Juan	Esteban	Martínez	Torres	3547913706	Carrera 47 #85-62, Barranquilla
443	Laura	Elena	Rojas	Díaz	3976486495	Avenida 3 #57-46, Pereira
444	Paula	María	Torres	Martínez	3343085570	Diagonal 4 #83-27, Manizales
445	Paula	Carlos	Rojas	Ramírez	3277943402	Avenida 15 #69-86, Pereira
446	Andrés	Juliana	Castro	Ramírez	3611410453	Calle 15 #14-70, Manizales
447	Andrés	María	Martínez	López	3685225869	Avenida 26 #90-20, Cali
448	Laura	Isabel	Gómez	Pérez	3922764800	Diagonal 53 #68-83, Bogotá
449	Laura	María	Castro	Martínez	3490964082	Calle 84 #41-13, Ibagué
450	Luis	Juliana	Díaz	Díaz	3640311642	Diagonal 55 #35-61, Cali
451	Daniel	Lucía	López	Díaz	3932183904	Calle 2 #94-63, Ibagué
452	Valentina	Felipe	Ramírez	Gómez	3927730909	Diagonal 56 #26-33, Bucaramanga
453	Laura	Esteban	Gómez	Ramírez	3231795567	Carrera 91 #61-51, Cartagena
454	Ana	Carlos	Rojas	Hernández	3982410993	Calle 23 #20-35, Ibagué
455	Luis	Esteban	Torres	Díaz	3397591182	Calle 87 #35-10, Medellín
456	Andrés	Lucía	López	Martínez	3391256090	Calle 91 #49-59, Ibagué
457	Juan	Isabel	Rojas	Ramírez	3621257873	Calle 80 #29-90, Ibagué
458	Laura	Antonio	López	Torres	3988377245	Carrera 61 #26-57, Bucaramanga
459	Carlos	Felipe	Díaz	Pérez	3317342640	Calle 27 #74-19, Barranquilla
460	Sebastián	Juliana	Rojas	Hernández	3312805512	Transversal 36 #78-19, Barranquilla
461	Sebastián	María	Ramírez	Ramírez	3894525912	Transversal 65 #96-49, Pereira
462	Ana	David	Rojas	Díaz	3863325988	Transversal 29 #58-85, Pereira
463	Camila	Juliana	Hernández	Rojas	3674299247	Avenida 7 #90-55, Cartagena
464	Ana	Juliana	Ramírez	López	3269917182	Diagonal 47 #31-35, Bucaramanga
465	Laura	Lucía	Hernández	Pérez	3523696801	Calle 42 #40-44, Barranquilla
466	Carlos	Lucía	Ramírez	Torres	3904227299	Diagonal 53 #92-22, Cartagena
467	Daniel	David	Díaz	Martínez	3538779904	Diagonal 19 #14-77, Ibagué
468	Laura	Carlos	Torres	Martínez	3205578946	Diagonal 32 #66-37, Manizales
469	Juan	Elena	Hernández	Pérez	3553004701	Calle 63 #85-31, Medellín
470	Daniel	Esteban	Díaz	Torres	3994114084	Calle 21 #95-25, Medellín
471	Sofía	María	Ramírez	Pérez	3590493007	Avenida 30 #85-19, Medellín
472	Ana	Juliana	Ramírez	Ramírez	3508055517	Diagonal 1 #19-31, Medellín
473	Carlos	Felipe	Pérez	Hernández	3588784455	Carrera 90 #87-20, Bogotá
474	Laura	Carlos	Torres	López	3226317472	Calle 34 #16-61, Bucaramanga
475	Daniel	Elena	Hernández	Hernández	3423268365	Diagonal 28 #74-38, Cali
476	Paula	David	Torres	Ramírez	3762807298	Avenida 17 #75-31, Ibagué
477	Carlos	Elena	López	Hernández	3865495628	Carrera 47 #47-23, Cúcuta
478	Sebastián	Juliana	Ramírez	Díaz	3179979055	Diagonal 15 #34-35, Pereira
479	Andrés	Esteban	Pérez	Hernández	3828529863	Carrera 63 #68-47, Pereira
480	Sofía	Elena	Ramírez	Martínez	3270750487	Calle 24 #75-59, Ibagué
481	Ana	Andrés	Torres	Gómez	3946050484	Calle 27 #60-15, Manizales
482	Daniel	Isabel	Pérez	Ramírez	3283863893	Avenida 58 #17-85, Cúcuta
483	Ana	Elena	Castro	Pérez	3312821619	Avenida 62 #45-56, Bucaramanga
484	Andrés	Juliana	Díaz	López	3587646081	Avenida 57 #21-71, Bucaramanga
485	Luis	Isabel	Pérez	Hernández	3353718016	Avenida 26 #84-10, Barranquilla
486	Carlos	Esteban	Pérez	López	3886082636	Calle 50 #86-32, Cartagena
487	Luis	Isabel	Castro	Ramírez	3768324471	Avenida 78 #60-91, Cúcuta
488	Paula	Andrés	Torres	Hernández	3691674299	Avenida 10 #28-39, Manizales
489	Carlos	Lucía	Rojas	Torres	3124573684	Carrera 33 #51-98, Medellín
490	Camila	Juliana	Rojas	Rojas	3894337993	Diagonal 51 #81-35, Cartagena
491	Andrés	María	Rojas	López	3288134593	Carrera 85 #69-55, Barranquilla
492	Sofía	David	Ramírez	Ramírez	3692724934	Transversal 45 #87-35, Medellín
493	Ana	Felipe	López	Hernández	3579154204	Avenida 44 #16-77, Bucaramanga
494	Paula	Antonio	Torres	Ramírez	3853548427	Diagonal 56 #45-79, Bogotá
495	Daniel	Lucía	Hernández	Torres	3319457423	Carrera 88 #43-71, Cali
496	Sofía	David	Torres	Rojas	3299886421	Calle 52 #19-41, Barranquilla
497	Paula	Lucía	Rojas	Hernández	3855622892	Transversal 28 #23-20, Cali
498	Luis	Isabel	Rojas	López	3916713449	Calle 32 #27-43, Bogotá
499	Andrés	Elena	Díaz	Ramírez	3671525371	Carrera 97 #12-13, Pereira
500	Paula	Felipe	Castro	Pérez	3340356640	Transversal 50 #98-18, Manizales
501	Andrés	Carlos	Díaz	Castro	3801771785	Carrera 45 #69-45, Manizales
502	Valentina	Carlos	Ramírez	Hernández	3605853281	Transversal 58 #11-81, Bucaramanga
503	Valentina	Lucía	Ramírez	Hernández	3767901071	Avenida 88 #62-84, Bucaramanga
504	Sofía	Carlos	Ramírez	Gómez	3366045210	Calle 27 #42-65, Cúcuta
505	Laura	Isabel	Díaz	Hernández	3298991947	Avenida 57 #55-69, Cali
506	Camila	Felipe	Hernández	Gómez	3573733369	Transversal 6 #72-33, Bucaramanga
507	Camila	Elena	Díaz	Castro	3671999982	Avenida 61 #22-12, Bucaramanga
508	Valentina	Juliana	Gómez	Díaz	3616850219	Calle 79 #39-89, Cartagena
509	Carlos	Elena	Ramírez	Hernández	3448499475	Calle 7 #47-93, Bucaramanga
510	Andrés	María	Rojas	Rojas	3640069717	Avenida 72 #37-29, Cúcuta
511	Laura	Carlos	Rojas	Gómez	3206046575	Transversal 81 #39-92, Ibagué
512	Luis	Isabel	Ramírez	Gómez	3587695915	Calle 37 #50-89, Cartagena
513	Valentina	María	Martínez	Torres	3391806288	Calle 40 #85-48, Ibagué
514	Luis	Andrés	Díaz	Torres	3452832847	Calle 13 #13-50, Medellín
515	Ana	David	Rojas	Pérez	3949974080	Calle 62 #35-68, Barranquilla
516	Ana	María	Rojas	Rojas	3137342124	Avenida 77 #42-94, Medellín
517	Daniel	María	Gómez	Hernández	3218793403	Avenida 12 #21-58, Barranquilla
518	Luis	Lucía	Martínez	Rojas	3729596188	Transversal 33 #20-61, Cali
519	Andrés	Elena	Rojas	López	3868418205	Carrera 23 #73-67, Manizales
520	Daniel	Juliana	Pérez	Torres	3541549545	Carrera 26 #91-76, Ibagué
521	Sebastián	Carlos	Martínez	Rojas	3841234442	Carrera 88 #99-90, Medellín
522	Daniel	Isabel	Hernández	Pérez	3960476187	Transversal 1 #97-15, Medellín
523	Luis	Andrés	Castro	Pérez	3203174731	Diagonal 2 #86-48, Bucaramanga
524	Luis	Carlos	López	Rojas	3212402582	Transversal 21 #82-34, Barranquilla
525	Andrés	Elena	Martínez	Hernández	3787607857	Transversal 71 #21-88, Bucaramanga
526	Luis	Esteban	Gómez	Díaz	3434052663	Avenida 67 #71-39, Manizales
527	Laura	Esteban	Díaz	Gómez	3655136637	Diagonal 30 #80-95, Manizales
528	Andrés	David	Ramírez	Castro	3805098106	Calle 59 #66-31, Cali
529	Juan	Antonio	Gómez	Pérez	3362610570	Calle 26 #45-67, Manizales
530	Sebastián	Andrés	Gómez	Pérez	3102315812	Transversal 84 #38-32, Manizales
531	Sebastián	Isabel	Torres	Gómez	3288674665	Calle 52 #88-73, Cali
532	Luis	Felipe	Hernández	Hernández	3402633647	Transversal 84 #56-57, Pereira
533	Paula	María	Castro	Torres	3693834204	Diagonal 76 #99-93, Cúcuta
534	Sebastián	María	Castro	Díaz	3325013990	Avenida 94 #48-25, Cartagena
535	Laura	Elena	Gómez	López	3245719460	Carrera 95 #67-39, Cúcuta
536	Daniel	Antonio	Ramírez	López	3290248373	Diagonal 28 #23-77, Barranquilla
537	Daniel	Isabel	Díaz	Hernández	3148534031	Avenida 62 #82-10, Cali
538	Carlos	Andrés	Torres	Castro	3816532064	Diagonal 42 #94-12, Cartagena
539	Daniel	Isabel	Martínez	Rojas	3335468898	Avenida 14 #54-45, Barranquilla
540	Luis	Antonio	Rojas	Martínez	3480596988	Diagonal 89 #49-89, Cali
541	Paula	Juliana	Torres	Pérez	3337133845	Avenida 75 #42-82, Manizales
542	Luis	Carlos	López	Ramírez	3322054504	Transversal 65 #21-59, Manizales
543	Carlos	María	Ramírez	Hernández	3677483418	Avenida 87 #61-79, Pereira
544	Carlos	Isabel	López	Ramírez	3113776979	Diagonal 30 #31-66, Bucaramanga
545	Laura	Esteban	Hernández	Castro	3724797035	Avenida 6 #86-51, Pereira
546	Laura	Felipe	Díaz	Ramírez	3353597549	Calle 46 #23-44, Barranquilla
547	Carlos	Antonio	Rojas	Hernández	3779391977	Transversal 8 #46-62, Bucaramanga
548	Camila	Lucía	Castro	López	3178780919	Calle 87 #44-97, Bogotá
549	Carlos	Antonio	Díaz	López	3493967728	Diagonal 56 #68-79, Cali
550	Valentina	Carlos	Hernández	Torres	3912649898	Diagonal 48 #78-71, Barranquilla
551	Valentina	Isabel	Rojas	López	3915146910	Calle 75 #95-88, Cúcuta
552	Ana	Lucía	Torres	Castro	3338084003	Avenida 51 #53-18, Barranquilla
553	Sofía	Juliana	Pérez	Martínez	3809473382	Avenida 80 #37-63, Cúcuta
554	Camila	María	Torres	Ramírez	3888946188	Transversal 15 #19-48, Manizales
555	Laura	Juliana	Gómez	Torres	3737225737	Calle 48 #45-16, Medellín
556	Carlos	Carlos	Torres	Hernández	3434034565	Avenida 16 #74-51, Cartagena
557	Ana	Antonio	Castro	Ramírez	3289243903	Calle 23 #14-47, Manizales
558	Luis	Juliana	Díaz	Hernández	3296094890	Calle 26 #17-49, Cali
559	Luis	David	Rojas	Rojas	3919863569	Diagonal 71 #94-91, Bucaramanga
560	Valentina	María	Pérez	Gómez	3622465887	Avenida 90 #12-26, Medellín
561	Ana	María	López	Hernández	3940321947	Avenida 12 #86-16, Bucaramanga
562	Luis	María	López	Gómez	3698610614	Calle 82 #42-90, Bucaramanga
563	Valentina	David	Díaz	Ramírez	3591670958	Diagonal 39 #67-15, Cartagena
564	Valentina	Esteban	Pérez	Rojas	3908752824	Diagonal 53 #40-88, Cúcuta
565	Laura	Lucía	Gómez	Martínez	3230630518	Calle 90 #86-39, Bucaramanga
566	Daniel	Carlos	Martínez	Hernández	3587073582	Carrera 24 #45-53, Medellín
567	Sebastián	Carlos	Torres	Rojas	3463292068	Diagonal 50 #98-66, Barranquilla
568	Sebastián	Lucía	López	Castro	3566150434	Diagonal 21 #30-57, Ibagué
569	Valentina	Juliana	López	Martínez	3549598360	Avenida 66 #87-99, Barranquilla
570	Laura	Carlos	Pérez	Martínez	3694940250	Avenida 57 #70-55, Cartagena
571	Carlos	Carlos	Martínez	Díaz	3400296828	Avenida 62 #15-29, Bucaramanga
572	Luis	Elena	Ramírez	Martínez	3511968684	Diagonal 63 #13-77, Barranquilla
573	Daniel	Carlos	Rojas	Castro	3123933981	Transversal 94 #90-49, Bogotá
574	Sebastián	Antonio	Castro	Hernández	3264605049	Transversal 29 #33-12, Pereira
575	Luis	Juliana	Rojas	Rojas	3899237480	Calle 75 #50-41, Cali
576	Luis	Carlos	Díaz	López	3108067468	Avenida 66 #30-22, Cúcuta
577	Valentina	María	Hernández	Hernández	3291472205	Diagonal 35 #78-12, Ibagué
578	Paula	María	Ramírez	Castro	3911054010	Calle 7 #94-70, Cúcuta
579	Ana	Lucía	Díaz	Hernández	3890329305	Diagonal 6 #99-69, Pereira
580	Valentina	Carlos	López	López	3784495298	Carrera 18 #82-17, Manizales
581	Daniel	Juliana	Rojas	Castro	3782186494	Transversal 24 #90-76, Cali
582	Andrés	Elena	Hernández	Rojas	3795295697	Carrera 9 #22-73, Cartagena
583	Paula	Lucía	Gómez	Torres	3134522681	Avenida 81 #76-96, Pereira
584	Daniel	Antonio	Rojas	Martínez	3405662334	Carrera 61 #86-82, Manizales
585	Ana	Isabel	Rojas	Castro	3774526893	Calle 74 #17-94, Pereira
586	Valentina	María	Torres	Ramírez	3914751772	Transversal 77 #79-46, Medellín
587	Andrés	Felipe	Castro	Gómez	3180213076	Avenida 33 #10-49, Barranquilla
588	Andrés	Felipe	Pérez	López	3166806751	Carrera 71 #18-85, Bogotá
589	Andrés	Isabel	Gómez	Torres	3522676388	Carrera 48 #71-72, Pereira
590	Daniel	David	Ramírez	Martínez	3817353270	Transversal 6 #30-39, Bucaramanga
591	Sebastián	Elena	Díaz	Ramírez	3821519953	Avenida 88 #79-75, Cartagena
592	Luis	Esteban	Pérez	Torres	3359410988	Calle 49 #57-90, Cali
593	Laura	Isabel	Castro	López	3428978090	Calle 63 #67-19, Ibagué
594	Daniel	Juliana	Díaz	Pérez	3158549273	Carrera 34 #23-87, Ibagué
595	Camila	Felipe	Díaz	Díaz	3765736179	Calle 2 #74-26, Medellín
596	Paula	Isabel	Rojas	Torres	3569776489	Calle 35 #39-73, Barranquilla
597	Laura	Isabel	Díaz	Torres	3566052562	Diagonal 82 #55-35, Cúcuta
598	Daniel	Felipe	Castro	Martínez	3856203760	Diagonal 96 #97-59, Barranquilla
599	Sebastián	David	Castro	López	3143242581	Diagonal 95 #13-59, Bucaramanga
600	Laura	Carlos	Díaz	Gómez	3610326033	Avenida 52 #90-53, Ibagué
601	Sebastián	Elena	Pérez	Torres	3421158538	Calle 2 #82-65, Medellín
602	Carlos	Andrés	Gómez	Díaz	3792346703	Calle 59 #70-91, Ibagué
603	Paula	Lucía	Gómez	Gómez	3630045285	Avenida 2 #59-91, Medellín
604	Camila	María	Hernández	Ramírez	3160898140	Calle 60 #85-88, Cartagena
605	Ana	María	Rojas	Martínez	3594152898	Transversal 90 #65-10, Bogotá
606	Juan	Juliana	Hernández	Hernández	3820249509	Avenida 27 #26-34, Cali
607	Daniel	Lucía	Torres	Castro	3709387014	Transversal 58 #43-22, Cali
608	Daniel	Felipe	Ramírez	Hernández	3120749747	Avenida 83 #85-44, Cali
609	Camila	Lucía	Gómez	Rojas	3806285868	Transversal 68 #21-71, Cúcuta
610	Daniel	María	Ramírez	Hernández	3339396560	Avenida 84 #21-18, Medellín
611	Andrés	Juliana	Pérez	Torres	3283081513	Avenida 25 #43-10, Bucaramanga
612	Ana	Esteban	Hernández	Pérez	3427188821	Diagonal 8 #56-79, Pereira
613	Valentina	Carlos	Díaz	Ramírez	3532757333	Diagonal 10 #84-18, Manizales
614	Luis	Lucía	Gómez	Ramírez	3636962229	Avenida 17 #44-85, Bogotá
615	Carlos	Lucía	López	Torres	3860584047	Diagonal 20 #19-60, Manizales
616	Laura	Elena	López	Rojas	3742636945	Diagonal 23 #40-43, Ibagué
617	Luis	Lucía	Pérez	Gómez	3915991348	Carrera 51 #48-51, Medellín
618	Laura	Esteban	Rojas	Castro	3106887074	Carrera 61 #35-29, Cúcuta
619	Sofía	Juliana	Ramírez	Gómez	3984987274	Transversal 67 #10-40, Ibagué
620	Sofía	Juliana	Martínez	Díaz	3711250713	Transversal 12 #65-90, Cali
621	Sofía	María	Martínez	López	3744227602	Carrera 32 #83-42, Pereira
622	Ana	Elena	Díaz	Castro	3673496045	Diagonal 57 #53-50, Bucaramanga
778	Daniel	Juliana	Castro	Díaz	3639750765	Carrera 38 #39-19, Cúcuta
623	Sebastián	Elena	Martínez	Rojas	3728870415	Transversal 60 #51-37, Cartagena
624	Andrés	Isabel	Castro	Ramírez	3359975468	Transversal 14 #36-38, Cali
625	Daniel	Antonio	Rojas	Gómez	3311171061	Calle 83 #96-42, Cali
626	Daniel	Juliana	Díaz	López	3376859761	Carrera 49 #83-36, Cartagena
627	Juan	David	Rojas	Pérez	3840373676	Calle 71 #93-74, Barranquilla
628	Andrés	David	Rojas	Martínez	3821563805	Diagonal 94 #36-49, Cali
629	Paula	Esteban	Rojas	López	3998299145	Carrera 97 #59-12, Cali
630	Andrés	Antonio	Hernández	Martínez	3365414815	Diagonal 77 #56-93, Bogotá
631	Laura	Isabel	Pérez	Ramírez	3838738446	Avenida 8 #24-25, Cali
632	Laura	Isabel	López	Gómez	3456925209	Diagonal 58 #43-93, Ibagué
633	Juan	David	Torres	Díaz	3893581015	Avenida 62 #25-36, Cúcuta
634	Carlos	Carlos	Martínez	Torres	3286009975	Transversal 88 #89-89, Cúcuta
635	Valentina	María	Castro	Rojas	3972852902	Avenida 29 #39-82, Ibagué
636	Andrés	Antonio	Pérez	Rojas	3436253049	Transversal 6 #29-20, Bogotá
637	Valentina	Elena	Pérez	Castro	3846333935	Carrera 31 #30-69, Pereira
638	Daniel	Carlos	Ramírez	Díaz	3169542940	Diagonal 47 #79-11, Cali
639	Camila	Esteban	Castro	Ramírez	3757596761	Diagonal 43 #79-15, Medellín
640	Laura	Isabel	Martínez	Rojas	3475313605	Transversal 56 #78-97, Ibagué
641	Laura	Elena	Gómez	Hernández	3733721786	Diagonal 12 #82-98, Bogotá
642	Carlos	Felipe	Gómez	Martínez	3369258532	Diagonal 72 #96-17, Medellín
643	Ana	Esteban	Castro	Ramírez	3664959784	Diagonal 60 #65-33, Manizales
644	Valentina	David	Rojas	Martínez	3538328432	Avenida 87 #25-59, Bucaramanga
645	Camila	Elena	Martínez	Gómez	3967943772	Calle 9 #93-42, Pereira
646	Sebastián	Esteban	Rojas	Rojas	3163870064	Transversal 62 #45-88, Medellín
647	Luis	David	Díaz	Torres	3337060458	Avenida 80 #82-33, Ibagué
648	Sebastián	Antonio	Torres	Díaz	3655969412	Carrera 76 #53-91, Pereira
649	Ana	Elena	Díaz	Hernández	3612383288	Transversal 83 #94-55, Bogotá
650	Carlos	Juliana	Martínez	Díaz	3615504997	Transversal 94 #52-18, Pereira
651	Sofía	Lucía	Pérez	López	3733825587	Diagonal 99 #13-94, Barranquilla
652	Ana	Lucía	López	Díaz	3288950747	Transversal 100 #52-90, Cartagena
653	Daniel	Andrés	López	Castro	3653358957	Diagonal 34 #53-15, Bucaramanga
654	Carlos	Felipe	Díaz	Torres	3912934674	Carrera 33 #75-23, Cartagena
655	Daniel	Antonio	Castro	Pérez	3477711537	Avenida 69 #86-40, Manizales
656	Sofía	Carlos	López	Ramírez	3699306833	Avenida 68 #60-15, Bogotá
657	Laura	Andrés	López	Rojas	3124568174	Avenida 24 #99-60, Ibagué
658	Sebastián	Felipe	Díaz	Ramírez	3119691310	Transversal 55 #24-83, Bucaramanga
659	Sebastián	Esteban	Torres	Ramírez	3865517815	Avenida 70 #63-46, Manizales
660	Ana	María	Hernández	López	3974325854	Diagonal 94 #70-49, Bucaramanga
661	Andrés	Juliana	Martínez	Torres	3972899003	Transversal 4 #46-71, Cartagena
662	Daniel	Andrés	López	Gómez	3232235880	Calle 70 #50-25, Manizales
663	Laura	Andrés	Hernández	Gómez	3853440721	Avenida 64 #10-60, Cúcuta
664	Ana	Felipe	Torres	Castro	3129687943	Diagonal 1 #78-73, Bucaramanga
665	Ana	Isabel	Ramírez	López	3650696064	Carrera 51 #99-30, Cúcuta
666	Luis	David	Torres	Hernández	3978927448	Avenida 8 #40-45, Cali
667	Ana	María	Gómez	López	3315138641	Avenida 15 #51-31, Cartagena
668	Valentina	María	Castro	Martínez	3735082468	Diagonal 63 #24-41, Cali
669	Andrés	Lucía	López	Gómez	3505013314	Avenida 75 #64-33, Cúcuta
670	Sebastián	David	Ramírez	López	3157381710	Carrera 83 #19-29, Medellín
671	Camila	Lucía	Gómez	Díaz	3438909502	Transversal 82 #37-76, Manizales
672	Daniel	Juliana	Martínez	Ramírez	3146187084	Transversal 87 #79-21, Manizales
673	Daniel	María	Torres	López	3542910862	Calle 68 #82-41, Bucaramanga
674	Ana	Juliana	Torres	Hernández	3424810373	Transversal 79 #12-22, Bogotá
675	Carlos	Felipe	Ramírez	Rojas	3848619707	Transversal 67 #71-18, Cali
676	Carlos	Elena	Rojas	Rojas	3690336294	Avenida 58 #23-76, Medellín
677	Juan	Andrés	Torres	Castro	3753460781	Diagonal 7 #38-51, Medellín
678	Ana	Isabel	Torres	Hernández	3113484520	Transversal 23 #48-19, Pereira
679	Daniel	Juliana	Pérez	López	3912741113	Calle 52 #22-68, Cúcuta
680	Paula	Carlos	Martínez	López	3755404907	Avenida 15 #63-81, Bucaramanga
681	Carlos	Antonio	Martínez	Díaz	3155427872	Avenida 29 #31-62, Pereira
682	Juan	Antonio	Torres	Díaz	3124791028	Carrera 43 #50-11, Pereira
683	Camila	David	Torres	Castro	3436116814	Transversal 38 #26-62, Barranquilla
684	Sebastián	Carlos	Castro	Martínez	3673563627	Calle 79 #57-41, Bogotá
685	Sebastián	Carlos	Torres	Gómez	3121716138	Avenida 95 #40-69, Medellín
686	Daniel	David	Ramírez	Castro	3604231449	Avenida 91 #33-69, Ibagué
687	Ana	Lucía	Rojas	López	3840475128	Avenida 55 #40-53, Ibagué
688	Ana	Juliana	Hernández	Rojas	3219405662	Transversal 98 #14-21, Ibagué
689	Paula	David	Castro	Díaz	3549205958	Carrera 76 #63-44, Barranquilla
690	Luis	María	Ramírez	Castro	3320865755	Carrera 41 #41-83, Barranquilla
691	Andrés	Andrés	Ramírez	Gómez	3401284361	Diagonal 32 #21-53, Medellín
692	Laura	Felipe	Torres	Gómez	3377014322	Avenida 88 #15-69, Bucaramanga
693	Juan	Juliana	Ramírez	López	3122312301	Calle 81 #23-40, Barranquilla
694	Sebastián	Carlos	Díaz	Martínez	3642659580	Diagonal 76 #60-93, Bucaramanga
695	Valentina	Isabel	Pérez	López	3163988343	Diagonal 52 #13-24, Cúcuta
696	Sebastián	David	Pérez	Rojas	3201440798	Calle 61 #91-42, Medellín
697	Paula	Andrés	Martínez	Ramírez	3190469902	Avenida 32 #15-21, Manizales
698	Laura	Isabel	Martínez	López	3131149545	Transversal 44 #41-41, Manizales
699	Sofía	Esteban	Rojas	Martínez	3136114103	Diagonal 15 #91-47, Pereira
700	Sebastián	Lucía	López	Torres	3853926809	Carrera 54 #64-59, Medellín
701	Laura	Felipe	Pérez	Gómez	3687832094	Carrera 94 #88-29, Medellín
702	Carlos	Carlos	Pérez	Castro	3515530010	Carrera 32 #30-14, Cali
703	Camila	Isabel	Ramírez	Hernández	3623324341	Diagonal 65 #35-66, Manizales
704	Ana	Elena	Gómez	Martínez	3138499525	Calle 7 #39-24, Cartagena
705	Laura	David	Pérez	Castro	3699112618	Calle 8 #90-30, Medellín
706	Camila	María	Martínez	Castro	3260977825	Avenida 20 #75-56, Barranquilla
707	Juan	Esteban	Castro	Pérez	3753983862	Diagonal 76 #54-92, Ibagué
708	Ana	David	Ramírez	Rojas	3393600884	Diagonal 40 #53-79, Bogotá
709	Juan	Antonio	Díaz	Gómez	3233360169	Avenida 15 #96-91, Cali
710	Sebastián	Isabel	López	Pérez	3762722788	Calle 40 #32-29, Cúcuta
711	Andrés	David	Hernández	Ramírez	3353335414	Calle 58 #27-83, Medellín
712	Sebastián	Andrés	Torres	Hernández	3295025765	Avenida 6 #86-57, Bucaramanga
713	Camila	Andrés	Díaz	Martínez	3195340815	Transversal 92 #31-66, Medellín
714	Juan	María	Rojas	Rojas	3452495330	Carrera 47 #26-16, Bucaramanga
715	Sebastián	Antonio	Rojas	Rojas	3195533966	Diagonal 27 #25-12, Cúcuta
716	Camila	Juliana	Díaz	Castro	3323161788	Calle 6 #22-62, Bucaramanga
717	Sebastián	María	Gómez	Rojas	3309921819	Diagonal 78 #58-38, Cali
718	Valentina	Andrés	Pérez	Gómez	3387601515	Calle 97 #36-92, Pereira
719	Daniel	Antonio	Martínez	Rojas	3318096678	Diagonal 80 #66-85, Manizales
720	Valentina	Carlos	Torres	Martínez	3553174500	Avenida 72 #46-57, Medellín
721	Sebastián	Juliana	Díaz	Ramírez	3330094095	Carrera 73 #81-92, Cúcuta
722	Carlos	Felipe	Hernández	López	3532704591	Transversal 18 #71-53, Ibagué
723	Valentina	Antonio	Martínez	Rojas	3765267027	Carrera 49 #49-22, Bucaramanga
724	Laura	Isabel	Hernández	Pérez	3914217372	Carrera 77 #35-58, Pereira
725	Carlos	Andrés	López	López	3199905759	Avenida 70 #86-85, Cali
726	Sofía	Esteban	Gómez	Pérez	3584132539	Avenida 76 #70-72, Medellín
727	Laura	Carlos	Castro	Hernández	3409555941	Calle 28 #83-29, Medellín
728	Sofía	Felipe	Martínez	Hernández	3913922111	Diagonal 100 #22-44, Pereira
729	Andrés	Juliana	Rojas	Gómez	3609048479	Transversal 29 #75-33, Manizales
730	Laura	Elena	Rojas	Ramírez	3864838005	Avenida 48 #97-16, Medellín
731	Sofía	Elena	Díaz	Torres	3505526353	Transversal 87 #54-48, Barranquilla
732	Sebastián	Elena	Díaz	Pérez	3940525451	Avenida 99 #95-31, Pereira
733	Valentina	María	López	Torres	3609832635	Avenida 31 #39-19, Medellín
734	Valentina	Felipe	Rojas	Ramírez	3721735677	Avenida 42 #47-58, Bogotá
735	Ana	María	Martínez	López	3728887106	Carrera 85 #64-32, Pereira
736	Sebastián	Andrés	Hernández	Díaz	3798969094	Avenida 25 #28-58, Cúcuta
737	Daniel	Carlos	Pérez	Pérez	3862682890	Carrera 46 #17-93, Cúcuta
738	Andrés	Esteban	Díaz	Castro	3801891270	Calle 34 #79-67, Cartagena
739	Luis	Elena	Rojas	López	3457802844	Avenida 82 #98-40, Bogotá
740	Luis	Isabel	López	Hernández	3275067077	Avenida 41 #39-33, Bogotá
741	Laura	David	Martínez	Gómez	3892193223	Carrera 2 #64-63, Barranquilla
742	Camila	Antonio	Díaz	Rojas	3752269871	Avenida 39 #85-81, Cali
743	Camila	Lucía	Torres	Gómez	3424122766	Transversal 41 #54-77, Cartagena
744	Andrés	Felipe	Torres	Pérez	3882385496	Calle 67 #47-67, Cúcuta
745	Andrés	Lucía	Martínez	Rojas	3527527648	Calle 59 #13-71, Bogotá
746	Sebastián	Andrés	Torres	Pérez	3630349891	Carrera 41 #60-44, Manizales
747	Paula	Isabel	Pérez	Hernández	3840187605	Transversal 88 #29-99, Cúcuta
748	Laura	Isabel	Torres	Pérez	3102673226	Diagonal 71 #37-27, Bogotá
749	Paula	Felipe	Torres	Díaz	3261534339	Carrera 87 #42-88, Ibagué
750	Laura	Lucía	Gómez	Díaz	3682710685	Diagonal 93 #44-88, Bucaramanga
751	Valentina	David	Castro	Pérez	3390398746	Transversal 34 #10-95, Cartagena
752	Camila	María	Hernández	Pérez	3631516060	Transversal 31 #58-28, Cúcuta
753	Sebastián	María	Torres	Castro	3664110067	Avenida 13 #70-34, Pereira
754	Daniel	David	Rojas	Díaz	3203279175	Avenida 10 #51-48, Cartagena
755	Daniel	Carlos	Gómez	Rojas	3341177232	Calle 67 #84-52, Cali
756	Paula	Lucía	Rojas	López	3819039221	Transversal 100 #77-19, Cali
757	Paula	Isabel	Torres	Hernández	3138127830	Calle 36 #73-55, Bucaramanga
758	Carlos	Isabel	Díaz	Martínez	3243082388	Transversal 89 #31-82, Bogotá
759	Paula	María	Torres	Ramírez	3289566713	Diagonal 45 #44-80, Manizales
760	Sofía	Andrés	Rojas	Torres	3157920414	Diagonal 42 #15-91, Barranquilla
761	Valentina	Esteban	Pérez	López	3909387180	Diagonal 99 #76-35, Bucaramanga
762	Camila	David	Rojas	Díaz	3935721428	Carrera 81 #72-61, Barranquilla
763	Sofía	David	Hernández	Castro	3149655290	Diagonal 50 #28-27, Cúcuta
764	Laura	María	Ramírez	Castro	3779874821	Transversal 14 #72-34, Manizales
765	Luis	María	Hernández	Torres	3233605720	Diagonal 16 #34-43, Barranquilla
766	Carlos	Andrés	Gómez	Rojas	3784633042	Avenida 20 #85-71, Medellín
767	Andrés	Esteban	López	Pérez	3628899751	Diagonal 12 #96-41, Manizales
768	Ana	Esteban	Díaz	Gómez	3546256265	Carrera 42 #69-95, Bucaramanga
769	Sebastián	María	Pérez	Pérez	3522479639	Avenida 80 #59-79, Bogotá
770	Luis	Lucía	Díaz	Martínez	3924630175	Avenida 15 #25-51, Medellín
771	Ana	Carlos	Martínez	Martínez	3216109843	Carrera 80 #38-27, Cali
772	Sofía	Felipe	Díaz	Gómez	3804782887	Diagonal 16 #76-94, Bucaramanga
773	Carlos	Esteban	Rojas	Hernández	3129515428	Calle 80 #34-19, Cali
774	Carlos	David	López	Torres	3788123172	Diagonal 18 #76-34, Manizales
775	Andrés	Lucía	Martínez	Hernández	3706855429	Diagonal 82 #10-24, Ibagué
776	Juan	María	Martínez	Rojas	3632950425	Avenida 94 #89-98, Ibagué
777	Andrés	Felipe	Gómez	Díaz	3783830427	Diagonal 47 #19-20, Cúcuta
779	Juan	Elena	Torres	Castro	3320385903	Avenida 86 #65-42, Manizales
780	Valentina	David	Martínez	Ramírez	3566180690	Diagonal 83 #69-54, Barranquilla
781	Juan	Elena	Hernández	Castro	3190057256	Diagonal 93 #18-55, Manizales
782	Sebastián	Elena	Ramírez	Rojas	3709882257	Avenida 21 #52-66, Cúcuta
783	Valentina	Felipe	López	Martínez	3974559789	Carrera 61 #15-50, Barranquilla
784	Valentina	Felipe	Pérez	Ramírez	3309517318	Diagonal 98 #58-24, Cali
785	Valentina	María	López	Ramírez	3641557435	Calle 41 #89-94, Cúcuta
786	Laura	David	Hernández	Díaz	3799377507	Carrera 31 #36-80, Ibagué
787	Sebastián	Andrés	López	Castro	3583671652	Carrera 5 #95-18, Cartagena
788	Ana	Juliana	Martínez	Gómez	3240830762	Calle 99 #17-40, Bucaramanga
789	Ana	Elena	Díaz	Díaz	3648778373	Calle 61 #64-58, Ibagué
790	Valentina	Antonio	Gómez	Hernández	3950425254	Avenida 99 #61-25, Ibagué
791	Carlos	Juliana	Torres	Pérez	3618750381	Avenida 34 #33-80, Medellín
792	Paula	Carlos	Pérez	Castro	3621435786	Avenida 31 #16-15, Bucaramanga
793	Camila	Felipe	Gómez	Rojas	3540283917	Calle 77 #87-99, Cartagena
794	Luis	Isabel	Rojas	Castro	3286777310	Calle 79 #79-46, Cúcuta
795	Sofía	Elena	Hernández	Rojas	3384814927	Transversal 92 #56-75, Medellín
796	Paula	Esteban	Gómez	Torres	3950568966	Diagonal 38 #35-80, Pereira
797	Daniel	Carlos	Díaz	Castro	3509110869	Transversal 9 #62-71, Bucaramanga
798	Sofía	Juliana	Pérez	Díaz	3787975990	Carrera 33 #72-40, Barranquilla
799	Juan	Esteban	Castro	Castro	3308113120	Diagonal 48 #71-82, Cúcuta
800	Camila	Esteban	Pérez	Torres	3414391911	Carrera 75 #29-34, Pereira
801	Juan	Esteban	Díaz	Díaz	3565083266	Calle 58 #62-32, Manizales
802	Luis	Esteban	Martínez	Torres	3910655718	Diagonal 40 #76-83, Cúcuta
803	Luis	Lucía	Díaz	Castro	3708936925	Transversal 37 #29-98, Pereira
804	Camila	Andrés	Martínez	Gómez	3621786941	Calle 24 #47-98, Manizales
805	Paula	David	Pérez	Gómez	3407167617	Calle 44 #83-51, Bucaramanga
806	Paula	Elena	Díaz	López	3412459524	Carrera 62 #97-51, Manizales
807	Paula	Antonio	Martínez	López	3880758362	Carrera 85 #14-13, Bogotá
808	Andrés	Andrés	Castro	Gómez	3954261589	Diagonal 82 #76-92, Cali
809	Daniel	Esteban	Rojas	Rojas	3822301747	Diagonal 3 #56-53, Bucaramanga
810	Juan	Elena	Martínez	Rojas	3885745327	Transversal 68 #71-29, Medellín
811	Sebastián	Esteban	Pérez	Martínez	3238911397	Transversal 98 #78-53, Bucaramanga
812	Paula	Lucía	Castro	Martínez	3627307227	Calle 59 #39-27, Cúcuta
813	Juan	Isabel	Ramírez	Torres	3961205339	Calle 73 #75-40, Medellín
814	Luis	Andrés	Torres	Hernández	3688905366	Diagonal 89 #44-35, Ibagué
815	Juan	Elena	Gómez	Gómez	3142172194	Calle 73 #87-66, Ibagué
816	Carlos	Antonio	Gómez	Torres	3237089150	Carrera 30 #47-25, Pereira
817	Daniel	Juliana	Rojas	Díaz	3452681993	Carrera 20 #86-42, Bucaramanga
818	Ana	Isabel	Díaz	López	3942693095	Calle 38 #82-34, Pereira
819	Ana	Elena	Ramírez	Ramírez	3914256968	Calle 35 #45-29, Barranquilla
820	Sofía	Antonio	Martínez	Hernández	3713406964	Calle 52 #61-96, Barranquilla
821	Andrés	David	Ramírez	Díaz	3142827572	Calle 15 #47-63, Pereira
822	Andrés	Carlos	Pérez	Rojas	3137113496	Transversal 72 #41-86, Pereira
823	Carlos	María	Castro	López	3898745708	Transversal 77 #30-34, Manizales
824	Andrés	Andrés	Díaz	Ramírez	3828051401	Avenida 4 #97-99, Ibagué
825	Juan	Isabel	Hernández	López	3841987982	Calle 2 #59-81, Manizales
826	Ana	María	Pérez	Ramírez	3301789078	Calle 21 #90-21, Pereira
827	Laura	Carlos	López	López	3114466484	Diagonal 8 #20-84, Bucaramanga
828	Juan	Carlos	Rojas	Hernández	3821389172	Carrera 7 #93-97, Cali
829	Valentina	Felipe	Ramírez	Rojas	3931636396	Avenida 94 #45-62, Cartagena
830	Valentina	Juliana	Pérez	Hernández	3589910977	Diagonal 45 #76-13, Barranquilla
831	Andrés	Carlos	Ramírez	Díaz	3394144770	Diagonal 98 #56-63, Barranquilla
832	Daniel	Isabel	Gómez	Martínez	3566475033	Avenida 12 #23-88, Manizales
833	Camila	Carlos	Díaz	Gómez	3662271855	Diagonal 97 #82-90, Manizales
834	Andrés	Elena	Rojas	Torres	3959998510	Diagonal 83 #96-68, Cartagena
835	Sebastián	Carlos	Díaz	Castro	3710610022	Calle 57 #34-55, Manizales
836	Ana	Antonio	López	Ramírez	3690959011	Carrera 19 #79-42, Cali
837	Camila	Elena	Hernández	Martínez	3880754849	Transversal 36 #45-19, Pereira
838	Paula	Juliana	Torres	Gómez	3325709965	Transversal 30 #56-76, Bucaramanga
839	Laura	Elena	Castro	Castro	3216952571	Avenida 85 #36-63, Cartagena
840	Paula	David	Gómez	Castro	3544381934	Diagonal 12 #48-26, Barranquilla
841	Ana	María	Díaz	Martínez	3248404456	Carrera 59 #74-27, Bogotá
842	Laura	María	Ramírez	Pérez	3852840960	Avenida 46 #62-44, Bucaramanga
843	Luis	Antonio	Hernández	Ramírez	3821398843	Avenida 94 #50-84, Bogotá
844	Paula	María	Rojas	Rojas	3808967096	Calle 76 #59-80, Barranquilla
845	Luis	Elena	Ramírez	Rojas	3700973639	Calle 56 #64-45, Cartagena
846	Camila	Juliana	Martínez	Ramírez	3320937618	Carrera 44 #82-50, Cúcuta
847	Carlos	Felipe	Hernández	López	3776465268	Diagonal 28 #89-71, Cartagena
848	Daniel	Isabel	Pérez	Gómez	3252045730	Avenida 36 #32-96, Medellín
849	Valentina	Carlos	Gómez	Martínez	3407310456	Diagonal 22 #62-24, Manizales
850	Andrés	Isabel	Hernández	Castro	3329722374	Diagonal 3 #44-45, Cartagena
851	Carlos	Juliana	Díaz	Ramírez	3733078597	Diagonal 3 #45-23, Bucaramanga
852	Paula	Isabel	Castro	Hernández	3332507521	Diagonal 32 #36-98, Cartagena
853	Camila	Antonio	Castro	Gómez	3306037476	Carrera 23 #52-90, Pereira
854	Valentina	Juliana	Rojas	Gómez	3662834019	Carrera 1 #41-78, Cartagena
855	Juan	Carlos	Castro	López	3298892490	Avenida 57 #78-16, Pereira
856	Daniel	Andrés	Castro	Castro	3194937939	Transversal 77 #94-32, Cartagena
857	Andrés	Juliana	Torres	Gómez	3101030968	Diagonal 65 #60-38, Pereira
858	Sebastián	Andrés	Hernández	Rojas	3308067817	Transversal 47 #60-90, Barranquilla
859	Paula	María	Pérez	Hernández	3452504081	Transversal 88 #32-69, Barranquilla
860	Sebastián	David	Díaz	López	3564704728	Calle 74 #19-84, Medellín
861	Carlos	Esteban	Martínez	Gómez	3235301020	Diagonal 14 #83-31, Bogotá
862	Paula	David	Hernández	Pérez	3716761178	Avenida 52 #74-86, Bucaramanga
863	Ana	Elena	Pérez	Pérez	3406321247	Transversal 48 #83-47, Cartagena
864	Camila	Esteban	Gómez	Hernández	3290969436	Carrera 1 #59-45, Cúcuta
865	Carlos	Felipe	Ramírez	Ramírez	3405658738	Carrera 78 #53-65, Bucaramanga
866	Luis	Carlos	Gómez	Torres	3666348042	Transversal 33 #58-66, Cali
867	Sofía	Antonio	Pérez	Castro	3404817029	Calle 51 #96-72, Cartagena
868	Daniel	Andrés	Martínez	López	3129390988	Avenida 47 #12-25, Cúcuta
869	Valentina	Felipe	López	Castro	3213270509	Diagonal 83 #28-47, Manizales
870	Sofía	Juliana	Gómez	Pérez	3231040691	Calle 15 #76-98, Cúcuta
871	Luis	Felipe	Rojas	López	3185171938	Carrera 55 #20-22, Bogotá
872	Sofía	Esteban	Castro	Castro	3434239462	Avenida 85 #86-72, Bogotá
873	Andrés	Esteban	Castro	Martínez	3310723644	Diagonal 73 #79-17, Medellín
874	Daniel	Elena	Ramírez	López	3893824901	Avenida 28 #98-70, Barranquilla
875	Juan	Antonio	López	Gómez	3865422776	Transversal 97 #31-36, Bogotá
876	Juan	Lucía	Castro	Hernández	3495632520	Calle 88 #66-66, Manizales
877	Carlos	Elena	Rojas	Ramírez	3879401970	Diagonal 94 #78-47, Cúcuta
878	Paula	María	Díaz	Torres	3309317050	Diagonal 30 #27-51, Ibagué
879	Luis	Carlos	Ramírez	Rojas	3148415350	Carrera 59 #18-57, Medellín
880	Paula	Esteban	Castro	Hernández	3273972302	Transversal 38 #12-68, Bucaramanga
881	Sofía	Juliana	Hernández	Ramírez	3579973857	Carrera 87 #71-47, Ibagué
882	Daniel	Esteban	Ramírez	Pérez	3983677156	Calle 39 #38-75, Medellín
883	Daniel	Isabel	Hernández	Hernández	3910709727	Carrera 49 #26-30, Pereira
884	Laura	Antonio	Pérez	Díaz	3189449634	Transversal 93 #95-72, Manizales
885	Sebastián	Juliana	López	Hernández	3215158004	Diagonal 25 #55-62, Ibagué
886	Sebastián	Esteban	Pérez	Pérez	3714465575	Transversal 34 #10-33, Cali
887	Ana	Esteban	Pérez	Díaz	3753681614	Avenida 19 #38-45, Ibagué
888	Sebastián	Felipe	Pérez	Castro	3816583841	Transversal 90 #70-25, Cali
889	Paula	Esteban	Pérez	Martínez	3583753560	Transversal 37 #96-17, Cali
890	Sebastián	Lucía	Díaz	Gómez	3276048333	Diagonal 66 #44-18, Bucaramanga
891	Laura	Isabel	Rojas	Martínez	3981179429	Diagonal 57 #72-94, Cúcuta
892	Valentina	Juliana	Rojas	Gómez	3298822088	Avenida 12 #85-24, Pereira
893	Sebastián	Elena	Torres	Rojas	3786178687	Diagonal 83 #86-13, Cali
894	Sofía	Juliana	Pérez	Gómez	3604253464	Carrera 28 #68-78, Cali
895	Luis	Isabel	Díaz	Ramírez	3494076859	Calle 29 #44-15, Bogotá
896	Sebastián	Felipe	Rojas	Hernández	3669446772	Calle 6 #96-29, Bucaramanga
897	Daniel	David	Martínez	López	3564859879	Transversal 15 #79-48, Medellín
898	Camila	Esteban	Torres	Rojas	3521325854	Calle 35 #20-45, Cúcuta
899	Paula	Antonio	López	López	3819146633	Diagonal 88 #20-11, Barranquilla
900	Daniel	Elena	Martínez	Ramírez	3443540382	Calle 88 #40-50, Cali
\.


--
-- TOC entry 4940 (class 0 OID 34319)
-- Dependencies: 261
-- Data for Name: departament; Type: TABLE DATA; Schema: proyecto; Owner: postgres
--

COPY proyecto.departament (id, name) FROM stdin;
5	Antioquia
8	Atlántico
11	Bogotá D.C.
13	Bolívar
15	Boyacá
17	Caldas
18	Caquetá
19	Cauca
20	Cesar
23	Córdoba
25	Cundinamarca
27	Chocó
41	Huila
44	La Guajira
47	Magdalena
50	Meta
52	Nariño
54	Norte de Santander
63	Quindío
66	Risaralda
68	Santander
70	Sucre
73	Tolima
76	Valle del Cauca
81	Arauca
85	Casanare
86	Putumayo
88	San Andrés y Providencia
91	Amazonas
94	Guainía
95	Guaviare
97	Vaupés
99	Vichada
\.


--
-- TOC entry 4929 (class 0 OID 34212)
-- Dependencies: 250
-- Data for Name: devolution; Type: TABLE DATA; Schema: proyecto; Owner: postgres
--

COPY proyecto.devolution (purchase_id, id, devolution_date, description) FROM stdin;
1	1	2024-11-01	Returned due to damaged packaging
2	2	2024-11-02	Client requested refund
3	3	2024-11-03	Product did not meet expectations
4	4	2024-11-04	Returned for exchange
5	5	2024-11-05	Product was incompatible with system
6	6	2024-11-06	Client changed mind after purchase
7	7	2024-11-07	Packaging was opened
8	8	2024-11-08	Wrong product shipped
9	9	2024-11-09	Item arrived late
10	10	2024-11-10	Received incorrect color
11	11	2024-11-11	Product malfunctioned
12	12	2024-11-12	Refund due to defective part
13	13	2024-11-13	Customer unsatisfied with quality
14	14	2024-11-14	Delivered item not as described
15	15	2024-11-15	Product too large for intended space
16	16	2024-11-16	Received damaged during shipping
17	17	2024-11-17	Incompatible with other products
18	18	2024-11-18	Product was a duplicate order
19	19	2024-11-19	Customer found better deal elsewhere
20	20	2024-11-20	Packaging was incomplete
21	21	2024-11-21	Return due to cosmetic defects
22	22	2024-11-22	Item not suitable for needs
23	23	2024-11-23	Quality issue reported by client
24	24	2024-11-24	Product arrived in bad condition
25	25	2024-11-25	Late delivery forced cancellation
26	26	2024-11-26	Client requested different model
27	27	2024-11-27	Received wrong size
28	28	2024-11-28	Product was a gift and not needed
29	29	2024-11-29	Faulty electronics
30	30	2024-11-30	Incorrect product shipped by mistake
31	31	2024-12-01	Packaging damaged during transport
32	32	2024-12-02	Refund processed after inspection
33	33	2024-12-03	Customer returned for store credit
34	34	2024-12-04	Product returned due to defect
35	35	2024-12-05	Order cancelled before delivery
36	36	2024-12-06	Returned due to miscommunication
37	37	2024-12-07	Customer opted for a different model
38	38	2024-12-08	Order error from warehouse
39	39	2024-12-09	Product returned after test
40	40	2024-12-10	Unwanted gift returned
41	41	2024-12-11	Returned after dissatisfaction
42	42	2024-12-12	Customer found defect after opening
43	43	2024-12-13	Product didn’t fit expected use
44	44	2024-12-14	Wrong product shipped, client not happy
45	45	2024-12-15	Returned after incorrect description
46	46	2024-12-16	Exchange for better product
47	47	2024-12-17	Item arrived broken and unusable
48	48	2024-12-18	Refund due to delay in arrival
49	49	2024-12-19	Returned because it wasn’t needed
50	50	2024-12-20	Returned for different version
1	51	2015-03-14	Returned due to damaged packaging
2	52	2015-05-22	Incorrect product delivered
3	53	2015-08-03	Product defective
4	54	2015-10-10	Client changed their mind
5	55	2015-11-25	Late delivery
6	56	2016-01-13	Product expired
7	57	2016-03-07	Wrong size or color
8	58	2016-04-21	Returned due to damaged packaging
9	59	2016-06-15	Incorrect product delivered
10	60	2016-08-09	Product defective
11	61	2016-10-28	Client changed their mind
12	62	2016-12-12	Late delivery
13	63	2017-02-18	Product expired
14	64	2017-03-30	Wrong size or color
15	65	2017-05-14	Returned due to damaged packaging
16	66	2017-07-20	Incorrect product delivered
17	67	2017-09-02	Product defective
18	68	2017-10-16	Client changed their mind
19	69	2017-12-01	Late delivery
20	70	2018-01-25	Product expired
21	71	2018-03-11	Wrong size or color
22	72	2018-04-23	Returned due to damaged packaging
23	73	2018-06-14	Incorrect product delivered
24	74	2018-08-07	Product defective
25	75	2018-09-30	Client changed their mind
26	76	2018-11-15	Late delivery
27	77	2018-12-27	Product expired
28	78	2019-02-09	Wrong size or color
29	79	2019-03-20	Returned due to damaged packaging
30	80	2019-05-01	Incorrect product delivered
31	81	2019-06-18	Product defective
32	82	2019-08-05	Client changed their mind
33	83	2019-09-21	Late delivery
34	84	2019-11-08	Product expired
35	85	2019-12-22	Wrong size or color
36	86	2020-02-04	Returned due to damaged packaging
37	87	2020-03-17	Incorrect product delivered
38	88	2020-05-02	Product defective
39	89	2020-06-19	Client changed their mind
40	90	2020-08-01	Late delivery
41	91	2020-09-12	Product expired
42	92	2020-10-27	Wrong size or color
43	93	2020-12-13	Returned due to damaged packaging
44	94	2021-01-29	Incorrect product delivered
45	95	2021-03-15	Product defective
46	96	2021-04-30	Client changed their mind
47	97	2021-06-13	Late delivery
48	98	2021-07-27	Product expired
49	99	2021-09-10	Wrong size or color
50	100	2021-10-22	Returned due to damaged packaging
51	101	2021-12-05	Incorrect product delivered
52	102	2022-01-17	Product defective
53	103	2022-03-01	Client changed their mind
54	104	2022-04-12	Late delivery
55	105	2022-05-25	Product expired
56	106	2022-07-08	Wrong size or color
57	107	2022-08-21	Returned due to damaged packaging
58	108	2022-10-03	Incorrect product delivered
59	109	2022-11-15	Product defective
60	110	2022-12-28	Client changed their mind
61	111	2023-02-08	Late delivery
62	112	2023-03-21	Product expired
63	113	2023-05-03	Wrong size or color
64	114	2023-06-15	Returned due to damaged packaging
65	115	2023-07-29	Incorrect product delivered
66	116	2023-09-10	Product defective
67	117	2023-10-22	Client changed their mind
68	118	2023-12-05	Late delivery
69	119	2024-01-17	Product expired
70	120	2024-03-01	Wrong size or color
71	121	2024-04-12	Returned due to damaged packaging
72	122	2024-05-25	Incorrect product delivered
73	123	2024-07-08	Product defective
74	124	2024-08-21	Client changed their mind
75	125	2024-10-03	Late delivery
76	126	2024-11-16	Product expired
77	127	2015-01-10	Wrong size or color
78	128	2015-03-23	Returned due to damaged packaging
79	129	2015-06-04	Incorrect product delivered
80	130	2015-08-15	Product defective
81	131	2015-10-28	Client changed their mind
82	132	2015-12-09	Late delivery
83	133	2016-02-20	Product expired
84	134	2016-04-04	Wrong size or color
85	135	2016-06-16	Returned due to damaged packaging
86	136	2016-08-27	Incorrect product delivered
87	137	2016-11-07	Product defective
88	138	2017-01-19	Client changed their mind
89	139	2017-03-04	Late delivery
90	140	2017-05-16	Product expired
91	141	2017-07-28	Wrong size or color
92	142	2017-10-09	Returned due to damaged packaging
93	143	2017-12-21	Incorrect product delivered
94	144	2018-03-04	Product defective
95	145	2018-05-15	Client changed their mind
96	146	2018-07-26	Late delivery
97	147	2018-10-06	Product expired
98	148	2018-12-18	Wrong size or color
99	149	2019-03-01	Returned due to damaged packaging
100	150	2019-05-12	Incorrect product delivered
101	151	2019-07-23	Product defective
102	152	2019-10-04	Client changed their mind
103	153	2019-12-15	Late delivery
104	154	2020-02-26	Product expired
105	155	2020-05-08	Wrong size or color
106	156	2020-07-19	Returned due to damaged packaging
107	157	2020-09-29	Incorrect product delivered
108	158	2020-12-10	Product defective
109	159	2021-02-21	Client changed their mind
110	160	2021-05-04	Late delivery
111	161	2021-07-15	Product expired
112	162	2021-09-26	Wrong size or color
113	163	2021-12-07	Returned due to damaged packaging
114	164	2022-02-18	Incorrect product delivered
115	165	2022-05-01	Product defective
116	166	2022-07-12	Client changed their mind
117	167	2022-09-23	Late delivery
118	168	2022-12-04	Product expired
119	169	2023-02-15	Wrong size or color
120	170	2023-04-28	Returned due to damaged packaging
121	171	2023-07-09	Incorrect product delivered
122	172	2023-09-20	Product defective
123	173	2023-12-01	Client changed their mind
124	174	2024-02-11	Late delivery
125	175	2024-04-23	Product expired
126	176	2024-07-04	Wrong size or color
127	177	2024-09-15	Returned due to damaged packaging
128	178	2024-11-26	Incorrect product delivered
129	179	2015-02-10	Product defective
130	180	2015-04-23	Client changed their mind
131	181	2015-07-04	Late delivery
132	182	2015-09-15	Product expired
133	183	2015-11-26	Wrong size or color
134	184	2016-02-06	Returned due to damaged packaging
135	185	2016-04-19	Incorrect product delivered
136	186	2016-07-01	Product defective
137	187	2016-09-12	Client changed their mind
138	188	2016-11-23	Late delivery
139	189	2017-02-03	Product expired
140	190	2017-04-16	Wrong size or color
141	191	2017-06-28	Returned due to damaged packaging
142	192	2017-09-08	Incorrect product delivered
143	193	2017-11-19	Product defective
144	194	2018-02-01	Client changed their mind
145	195	2018-04-14	Late delivery
146	196	2018-06-25	Product expired
147	197	2018-09-06	Wrong size or color
148	198	2018-11-17	Returned due to damaged packaging
149	199	2019-01-30	Incorrect product delivered
150	200	2019-04-12	Product defective
151	201	2019-06-23	Client changed their mind
152	202	2019-09-03	Late delivery
153	203	2019-11-14	Product expired
154	204	2020-01-25	Wrong size or color
155	205	2020-04-07	Returned due to damaged packaging
156	206	2020-06-18	Incorrect product delivered
157	207	2020-08-29	Product defective
158	208	2020-11-09	Client changed their mind
159	209	2021-01-21	Late delivery
160	210	2021-04-03	Product expired
161	211	2021-06-14	Wrong size or color
162	212	2021-08-25	Returned due to damaged packaging
163	213	2021-11-05	Incorrect product delivered
164	214	2022-01-17	Product defective
165	215	2022-03-30	Client changed their mind
166	216	2022-06-10	Late delivery
167	217	2022-08-21	Product expired
168	218	2022-11-01	Wrong size or color
169	219	2023-01-13	Returned due to damaged packaging
170	220	2023-03-26	Incorrect product delivered
171	221	2023-06-06	Product defective
172	222	2023-08-17	Client changed their mind
173	223	2023-10-28	Late delivery
174	224	2024-01-09	Product expired
175	225	2024-03-21	Wrong size or color
176	226	2024-06-01	Returned due to damaged packaging
177	227	2024-08-12	Incorrect product delivered
178	228	2024-10-23	Product defective
179	229	2015-01-05	Client changed their mind
180	230	2015-03-17	Late delivery
181	231	2015-05-29	Product expired
182	232	2015-08-09	Wrong size or color
183	233	2015-10-20	Returned due to damaged packaging
184	234	2015-12-31	Incorrect product delivered
185	235	2016-03-12	Product defective
186	236	2016-05-23	Client changed their mind
187	237	2016-08-03	Late delivery
188	238	2016-10-14	Product expired
189	239	2016-12-25	Wrong size or color
190	240	2017-03-07	Returned due to damaged packaging
191	241	2017-05-18	Incorrect product delivered
192	242	2017-07-29	Product defective
193	243	2017-10-09	Client changed their mind
194	244	2017-12-20	Late delivery
195	245	2018-03-02	Product expired
196	246	2018-05-13	Wrong size or color
197	247	2018-07-24	Returned due to damaged packaging
198	248	2018-10-04	Incorrect product delivered
199	249	2018-12-15	Product defective
200	250	2019-02-26	Client changed their mind
201	251	2019-05-09	Late delivery
202	252	2019-07-20	Product expired
203	253	2019-10-01	Wrong size or color
204	254	2019-12-12	Returned due to damaged packaging
205	255	2020-02-22	Incorrect product delivered
206	256	2020-05-04	Product defective
207	257	2020-07-15	Client changed their mind
208	258	2020-09-25	Late delivery
209	259	2020-12-06	Product expired
210	260	2021-02-17	Wrong size or color
211	261	2021-05-01	Returned due to damaged packaging
212	262	2021-07-12	Incorrect product delivered
213	263	2021-09-23	Product defective
214	264	2021-12-04	Client changed their mind
215	265	2022-02-14	Late delivery
216	266	2022-04-27	Product expired
217	267	2022-07-08	Wrong size or color
218	268	2022-09-19	Returned due to damaged packaging
219	269	2022-12-30	Incorrect product delivered
220	270	2023-03-12	Product defective
221	271	2023-05-23	Client changed their mind
222	272	2023-08-03	Late delivery
223	273	2023-10-14	Product expired
224	274	2023-12-25	Wrong size or color
225	275	2024-03-06	Returned due to damaged packaging
226	276	2024-05-17	Incorrect product delivered
227	277	2024-07-28	Product defective
228	278	2024-10-08	Client changed their mind
229	279	2015-01-20	Late delivery
230	280	2015-04-02	Product expired
231	281	2015-06-13	Wrong size or color
232	282	2015-08-24	Returned due to damaged packaging
233	283	2015-11-04	Incorrect product delivered
234	284	2016-01-15	Product defective
235	285	2016-03-27	Client changed their mind
236	286	2016-06-07	Late delivery
237	287	2016-08-18	Product expired
238	288	2016-10-29	Wrong size or color
239	289	2017-01-09	Returned due to damaged packaging
240	290	2017-03-22	Incorrect product delivered
241	291	2017-06-02	Product defective
242	292	2017-08-13	Client changed their mind
243	293	2017-10-24	Late delivery
244	294	2018-01-04	Product expired
245	295	2018-03-17	Wrong size or color
246	296	2018-05-28	Returned due to damaged packaging
247	297	2018-08-08	Incorrect product delivered
248	298	2018-10-19	Product defective
249	299	2018-12-30	Client changed their mind
250	300	2019-03-12	Late delivery
251	301	2019-05-23	Product expired
252	302	2019-08-03	Wrong size or color
253	303	2019-10-14	Returned due to damaged packaging
254	304	2019-12-25	Incorrect product delivered
255	305	2020-03-06	Product defective
256	306	2020-05-17	Client changed their mind
257	307	2020-07-28	Late delivery
258	308	2020-10-08	Product expired
259	309	2020-12-19	Wrong size or color
260	310	2021-03-01	Returned due to damaged packaging
261	311	2021-05-12	Incorrect product delivered
262	312	2021-07-23	Product defective
263	313	2021-10-03	Client changed their mind
264	314	2021-12-14	Late delivery
265	315	2022-02-25	Product expired
266	316	2022-05-08	Wrong size or color
267	317	2022-07-19	Returned due to damaged packaging
268	318	2022-09-29	Incorrect product delivered
269	319	2022-12-10	Product defective
270	320	2023-02-21	Client changed their mind
271	321	2023-05-04	Late delivery
272	322	2023-07-15	Product expired
273	323	2023-09-26	Wrong size or color
274	324	2023-12-07	Returned due to damaged packaging
275	325	2024-02-18	Incorrect product delivered
276	326	2024-05-01	Product defective
277	327	2024-07-12	Client changed their mind
278	328	2024-09-23	Late delivery
279	329	2024-12-04	Product expired
280	330	2015-02-15	Wrong size or color
281	331	2015-04-28	Returned due to damaged packaging
282	332	2015-07-09	Incorrect product delivered
283	333	2015-09-20	Product defective
284	334	2015-12-01	Client changed their mind
285	335	2016-02-11	Late delivery
286	336	2016-04-24	Product expired
287	337	2016-07-05	Wrong size or color
288	338	2016-09-16	Returned due to damaged packaging
289	339	2016-11-27	Incorrect product delivered
290	340	2017-02-08	Product defective
291	341	2017-04-21	Client changed their mind
292	342	2017-07-02	Late delivery
293	343	2017-09-13	Product expired
294	344	2017-11-24	Wrong size or color
295	345	2018-02-04	Returned due to damaged packaging
296	346	2018-04-17	Incorrect product delivered
297	347	2018-06-28	Product defective
298	348	2018-09-08	Client changed their mind
299	349	2018-11-19	Late delivery
300	350	2019-02-01	Product expired
\.


--
-- TOC entry 4930 (class 0 OID 34218)
-- Dependencies: 251
-- Data for Name: employee; Type: TABLE DATA; Schema: proyecto; Owner: postgres
--

COPY proyecto.employee (id, name1, name2, lastname1, lastname2, contact, employment, salary) FROM stdin;
EMP001	Juan	Carlos	Pérez	Gómez	1234567890	Manager	4501
EMP002	Ana	María	Rodríguez	López	9876543210	Cashier	2000
EMP003	Luis	\N	Martínez	Fernández	1122334455	Supervisor	3000
EMP004	Sofía	Elena	García	\N	5566778899	Accountant	3501
EMP005	Carlos	Andrés	Sánchez	Mejía	1234509876	Sales Representative	2800
EMP006	María	Fernanda	Ruiz	\N	6789012345	HR Specialist	3201
EMP007	José	\N	López	Cruz	3456789012	Technician	2500
EMP008	Laura	Beatriz	Morales	Ríos	7890123456	Marketing Coordinator	3700
EMP009	Diego	Armando	Vargas	\N	9012345678	Logistics Manager	4201
EMP0010	Juan	Carlos	Pérez	Gómez	1234567890	Manager	4501
EMP0020	Ana	María	Rodríguez	López	9876543210	Cashier	2000
EMP0030	Luis	\N	Martínez	Fernández	1122334455	Supervisor	3000
EMP0040	Sofía	Elena	García	\N	5566778899	Accountant	3501
EMP0050	Carlos	Andrés	Sánchez	Mejía	1234509876	Sales Representative	2800
EMP0060	María	Fernanda	Ruiz	\N	6789012345	HR Specialist	3201
EMP0070	José	\N	López	Cruz	3456789012	Technician	2500
EMP0080	Laura	Beatriz	Morales	Ríos	7890123456	Marketing Coordinator	3700
EMP0090	Diego	Armando	Vargas	\N	9012345678	Logistics Manager	4201
EMP0100	Patricia	\N	Castaño	Soto	1237894560	Customer Support	2200
EMP0110	Fernando	Alonso	Castro	Guzmán	4567890123	IT Specialist	4000
EMP0120	Julia	Teresa	Hernández	Peña	5678901234	Graphic Designer	3001
EMP0130	Miguel	Ángel	Delgado	\N	6789012345	Warehouse Manager	3600
EMP0140	Claudia	Rocío	Mendoza	Campos	7890123456	Recruiter	3100
EMP0150	Andrés	Felipe	Chávez	\N	8901234567	Business Analyst	3900
EMP0160	Gloria	\N	Núñez	Ramírez	2345678901	Secretary	2000
EMP0170	Hugo	Esteban	Ríos	Gómez	3456789012	Security Officer	2500
EMP0180	Valeria	Sofía	Ortega	Pineda	4567890123	Sales Manager	4100
EMP0190	Emilio	\N	Suárez	Velázquez	5678901234	HR Manager	3800
EMP0200	Carolina	Isabel	Torres	Quintero	6789012345	PR Specialist	3400
EMP0210	Roberto	Daniel	Villanueva	León	7890123456	Operations Manager	4500
EMP0220	Isabel	\N	Ávila	Cabrera	8901234567	Research Analyst	3200
EMP0230	Manuel	Antonio	Pacheco	\N	9012345678	Finance Manager	4701
EMP0240	Sara	Camila	Benítez	Vargas	1234567890	Event Coordinator	2900
EMP0250	Ricardo	Javier	Blanco	Zambrano	2345678901	IT Support	3100
EMP0260	Luz	María	Esquivel	Álvarez	3456789012	Executive Assistant	3300
EMP0270	Camilo	José	Guzmán	Duarte	4567890123	Maintenance Worker	2400
EMP0280	Estefanía	Andrea	Montoya	Jiménez	5678901234	Account Manager	3700
EMP0290	Ángel	\N	Navarro	Rosales	6789012345	Trainer	3100
EMP0300	Mariana	Alejandra	Zapata	Arévalo	7890123456	Project Manager	4601
EMP00100	Juan	Carlos	Pérez	Gómez	1234567890	Manager	4501
EMP00200	Ana	María	Rodríguez	López	9876543210	Cashier	2000
EMP00300	Luis	\N	Martínez	Fernández	1122334455	Supervisor	3000
EMP00400	Sofía	Elena	García	\N	5566778899	Accountant	3501
EMP00500	Carlos	Andrés	Sánchez	Mejía	1234509876	Sales Representative	2800
EMP00600	María	Fernanda	Ruiz	\N	6789012345	HR Specialist	3201
EMP00700	José	\N	López	Cruz	3456789012	Technician	2500
EMP00800	Laura	Beatriz	Morales	Ríos	7890123456	Marketing Coordinator	3700
EMP00900	Diego	Armando	Vargas	\N	9012345678	Logistics Manager	4201
EMP01000	Patricia	\N	Castaño	Soto	1237894560	Customer Support	2200
EMP01100	Fernando	Alonso	Castro	Guzmán	4567890123	IT Specialist	4000
EMP01200	Julia	Teresa	Hernández	Peña	5678901234	Graphic Designer	3001
EMP01300	Miguel	Ángel	Delgado	\N	6789012345	Warehouse Manager	3600
EMP01400	Claudia	Rocío	Mendoza	Campos	7890123456	Recruiter	3100
EMP01500	Andrés	Felipe	Chávez	\N	8901234567	Business Analyst	3900
EMP01600	Gloria	\N	Núñez	Ramírez	2345678901	Secretary	2000
EMP01700	Hugo	Esteban	Ríos	Gómez	3456789012	Security Officer	2500
EMP01800	Valeria	Sofía	Ortega	Pineda	4567890123	Sales Manager	4100
EMP01900	Emilio	\N	Suárez	Velázquez	5678901234	HR Manager	3800
EMP02000	Carolina	Isabel	Torres	Quintero	6789012345	PR Specialist	3400
EMP02100	Roberto	Daniel	Villanueva	León	7890123456	Operations Manager	4500
EMP02200	Isabel	\N	Ávila	Cabrera	8901234567	Research Analyst	3200
EMP02300	Manuel	Antonio	Pacheco	\N	9012345678	Finance Manager	4701
EMP02400	Sara	Camila	Benítez	Vargas	1234567890	Event Coordinator	2900
EMP02500	Ricardo	Javier	Blanco	Zambrano	2345678901	IT Support	3100
EMP02600	Luz	María	Esquivel	Álvarez	3456789012	Executive Assistant	3300
EMP02700	Camilo	José	Guzmán	Duarte	4567890123	Maintenance Worker	2400
EMP02800	Estefanía	Andrea	Montoya	Jiménez	5678901234	Account Manager	3700
EMP02900	Ángel	\N	Navarro	Rosales	6789012345	Trainer	3100
EMP03000	Mariana	Alejandra	Zapata	Arévalo	7890123456	Project Manager	4601
\.


--
-- TOC entry 4932 (class 0 OID 34224)
-- Dependencies: 253
-- Data for Name: product; Type: TABLE DATA; Schema: proyecto; Owner: postgres
--

COPY proyecto.product (id, name, amount, price, description, type_product, promotional_value, product_category_id) FROM stdin;
1	Vinilo rojo	10	8500	Vinilo para decoración de interiores	vini-color	8000	15
2	Vinilo verde	15	8000	Vinilo para manualidades	vini-color	7500	2
3	Vinilo blanco	12	9500	Vinilo corte para vehículos	vini-color	9000	3
4	Pegatina holográfica	20	12000	Calcomanía decorativa	sticker-premium	11500	4
5	Etiquetas resistentes	30	6000	Etiquetas a prueba de agua	label-durable	5500	5
6	Vinilo negro mate	8	8500	Vinilo para paredes	vini-mate	8000	1
7	Pegatina personalizada	25	7000	Adhesivo personalizado	sticker-basic	6500	2
8	Vinilo fluorescente	10	9500	Vinilo para señalización	vini-fluo	9000	3
9	Etiqueta código barras	50	5000	Etiqueta estándar	label-basic	4500	6
10	Calcomanía para laptops	40	7500	Diseño exclusivo	sticker-premium	7000	4
11	Pegatina decorativa	20	7000	Calcomanía para muebles	sticker-basic	6500	7
12	Vinilo texturizado	10	12000	Vinilo para exteriores	vini-premium	11500	8
13	Etiquetas de precio	50	3000	Etiquetas para tiendas	label-basic	2500	9
14	Vinilo dorado	5	20000	Vinilo metálico de lujo	vini-luxury	19000	10
15	Pegatina promocional	100	2000	Adhesivo para marketing	sticker-basic	1500	11
16	Calcomanía para botellas	30	4500	Etiqueta personalizada	label-durable	4000	12
17	Vinilo espejo	6	18000	Vinilo decorativo	vini-luxury	17000	1
18	Pegatina vintage	15	8500	Diseño retro	sticker-premium	8000	2
19	Vinilo gris claro	20	9500	Vinilo corte profesional	vini-color	9000	3
20	Calcomanía infantil	40	5000	Adhesivo educativo	sticker-basic	4500	4
21	Etiqueta para cosméticos	35	7000	Etiqueta decorativa	label-durable	6500	5
22	Vinilo resistente	10	10000	Vinilo para exteriores	vini-premium	9500	6
23	Pegatina holográfica premium	25	15000	Adhesivo especial	sticker-luxury	14000	7
24	Etiqueta promocional	50	3500	Etiqueta para eventos	label-basic	3000	8
25	Calcomanía para automóviles	20	12000	Adhesivo de alta resistencia	sticker-premium	11500	9
26	Vinilo negro brillante	12	9500	Vinilo para paredes	vini-mate	9000	10
27	Pegatina especial	30	8500	Adhesivo exclusivo	sticker-premium	8000	11
28	Vinilo traslúcido	8	11000	Vinilo para ventanas	vini-premium	10500	12
29	Etiqueta antideslizante	15	13000	Etiqueta para pisos	label-durable	12500	1
30	Calcomanía publicitaria	100	2500	Adhesivo promocional	sticker-basic	2000	2
31	Vinilo tornasol	6	22000	Vinilo decorativo premium	vini-luxury	21000	3
32	Rotulo amarillo	57	14041	Rotulo amarillo duradero y versátil	vini-metalico	13563	10
33	Vinilo negro	8	6335	Vinilo negro resistente al agua	vini-metalico	6226	2
34	Rotulo rojo	74	4108	Rotulo rojo duradero y versátil	vini-textura	3781	9
35	Sticker rojo	80	11056	Sticker rojo fácil de aplicar	vini-mate	10331	16
36	Pegatina blanco	29	5306	Pegatina blanco para decoración de interiores	vini-metalico	5120	17
37	Sticker amarillo	8	5565	Sticker amarillo uso profesional	vini-metalico	5031	18
38	Etiqueta negro	73	14592	Etiqueta negro fácil de aplicar	vini-color	14277	10
39	Pegatina blanco	51	2717	Pegatina blanco fácil de aplicar	vini-textura	1875	13
40	Vinilo azul	34	7309	Vinilo azul uso profesional	vini-color	6972	16
41	Calcomanía rojo	37	8428	Calcomanía rojo uso profesional	vini-textura	7871	3
42	Sticker verde	67	2605	Sticker verde resistente al agua	vini-textura	1879	7
43	Papel adhesivo verde	86	10610	Papel adhesivo verde duradero y versátil	vini-metalico	9659	3
44	Sticker blanco	76	11558	Sticker blanco fácil de aplicar	vini-mate	10718	9
45	Sticker rojo	22	9603	Sticker rojo resistente al agua	vini-color	8824	20
46	Calcomanía azul	7	5383	Calcomanía azul duradero y versátil	vini-textura	4568	3
47	Calcomanía amarillo	48	13248	Calcomanía amarillo para decoración de interiores	vini-color	12462	1
48	Pegatina morado	60	10609	Pegatina morado para decoración de interiores	vini-mate	10006	3
49	Calcomanía verde	87	7818	Calcomanía verde uso profesional	vini-mate	6997	17
50	Papel adhesivo verde	10	10762	Papel adhesivo verde para decoración de interiores	vini-color	10345	11
51	Vinilo naranja	25	4297	Vinilo naranja resistente al agua	vini-color	3917	5
52	Sticker blanco	17	7061	Sticker blanco para decoración de interiores	vini-metalico	6322	12
53	Calcomanía morado	98	4567	Calcomanía morado duradero y versátil	vini-mate	3793	17
54	Pegatina rojo	83	13873	Pegatina rojo resistente al agua	vini-mate	13460	3
55	Calcomanía morado	55	9752	Calcomanía morado resistente al agua	vini-mate	9403	17
56	Vinilo azul	42	14132	Vinilo azul ideal para exteriores	vini-color	13219	2
57	Pegatina negro	75	7270	Pegatina negro para decoración de interiores	vini-mate	6693	10
58	Rotulo amarillo	77	13650	Rotulo amarillo fácil de aplicar	vini-metalico	13352	4
59	Vinilo amarillo	41	8834	Vinilo amarillo ideal para exteriores	vini-textura	7868	6
60	Etiqueta naranja	96	6827	Etiqueta naranja duradero y versátil	vini-metalico	6123	16
61	Etiqueta verde	77	11026	Etiqueta verde fácil de aplicar	vini-mate	10734	5
62	Vinilo naranja	97	8712	Vinilo naranja ideal para exteriores	vini-textura	8292	15
63	Papel adhesivo azul	65	7259	Papel adhesivo azul ideal para exteriores	vini-mate	6696	16
64	Pegatina morado	19	10626	Pegatina morado para decoración de interiores	vini-metalico	9969	10
65	Papel adhesivo morado	41	3560	Papel adhesivo morado ideal para exteriores	vini-mate	3370	6
66	Rotulo negro	89	12697	Rotulo negro fácil de aplicar	vini-mate	11941	6
67	Sticker morado	28	3678	Sticker morado resistente al agua	vini-mate	3009	3
68	Papel adhesivo blanco	18	11287	Papel adhesivo blanco uso profesional	vini-textura	10567	3
69	Calcomanía azul	12	11020	Calcomanía azul para decoración de interiores	vini-color	10085	14
70	Calcomanía verde	91	9086	Calcomanía verde uso profesional	vini-color	8631	2
71	Sticker verde	68	2526	Sticker verde para decoración de interiores	vini-color	2010	15
72	Vinilo rojo	20	6934	Vinilo rojo ideal para exteriores	vini-mate	6738	18
73	Sticker blanco	74	3808	Sticker blanco fácil de aplicar	vini-metalico	3678	3
74	Sticker blanco	56	8949	Sticker blanco uso profesional	vini-mate	8449	8
75	Etiqueta azul	58	7727	Etiqueta azul ideal para exteriores	vini-color	7519	7
76	Vinilo blanco	81	10890	Vinilo blanco resistente al agua	vini-color	10112	8
77	Pegatina negro	28	6955	Pegatina negro fácil de aplicar	vini-color	6256	2
78	Pegatina verde	26	2357	Pegatina verde resistente al agua	vini-mate	1422	17
79	Calcomanía azul	71	11648	Calcomanía azul uso profesional	vini-color	11183	10
80	Etiqueta naranja	39	11344	Etiqueta naranja fácil de aplicar	vini-color	10974	1
81	Calcomanía rojo	98	7374	Calcomanía rojo duradero y versátil	vini-metalico	6694	19
82	Sticker naranja	93	6368	Sticker naranja uso profesional	vini-textura	5396	14
83	Papel adhesivo verde	70	14287	Papel adhesivo verde duradero y versátil	vini-mate	14006	11
84	Calcomanía verde	15	2934	Calcomanía verde para decoración de interiores	vini-color	1959	20
85	Calcomanía naranja	64	6944	Calcomanía naranja duradero y versátil	vini-mate	5977	11
86	Etiqueta naranja	66	14406	Etiqueta naranja ideal para exteriores	vini-mate	13947	15
87	Vinilo azul	93	14856	Vinilo azul uso profesional	vini-mate	14097	3
88	Calcomanía blanco	90	9240	Calcomanía blanco para decoración de interiores	vini-metalico	8616	19
89	Sticker azul	96	8782	Sticker azul resistente al agua	vini-textura	7993	7
90	Rotulo blanco	79	7162	Rotulo blanco ideal para exteriores	vini-textura	6195	11
91	Etiqueta rojo	18	4458	Etiqueta rojo duradero y versátil	vini-metalico	3682	13
92	Vinilo morado	60	9806	Vinilo morado fácil de aplicar	vini-mate	9703	3
93	Vinilo naranja	63	9022	Vinilo naranja ideal para exteriores	vini-metalico	8191	19
94	Rotulo negro	46	6008	Rotulo negro resistente al agua	vini-metalico	5189	16
95	Rotulo azul	81	9699	Rotulo azul uso profesional	vini-textura	8707	16
96	Sticker naranja	8	12082	Sticker naranja resistente al agua	vini-textura	11181	9
97	Vinilo amarillo	32	4906	Vinilo amarillo resistente al agua	vini-color	4407	10
98	Calcomanía verde	24	6815	Calcomanía verde resistente al agua	vini-color	6280	8
99	Sticker naranja	94	9927	Sticker naranja uso profesional	vini-textura	9348	9
100	Rotulo rojo	28	9726	Rotulo rojo resistente al agua	vini-metalico	9167	12
101	Sticker blanco	16	6016	Sticker blanco para decoración de interiores	vini-textura	5350	20
102	Calcomanía azul	73	11413	Calcomanía azul ideal para exteriores	vini-color	10491	13
103	Papel adhesivo blanco	66	5939	Papel adhesivo blanco para decoración de interiores	vini-metalico	5682	13
104	Sticker naranja	37	6943	Sticker naranja ideal para exteriores	vini-metalico	6473	20
105	Vinilo azul	38	3433	Vinilo azul uso profesional	vini-mate	3227	19
106	Sticker blanco	38	9065	Sticker blanco ideal para exteriores	vini-mate	8394	18
107	Pegatina amarillo	69	11091	Pegatina amarillo resistente al agua	vini-mate	10868	15
108	Rotulo morado	20	14600	Rotulo morado uso profesional	vini-textura	14373	8
109	Sticker naranja	72	2421	Sticker naranja para decoración de interiores	vini-mate	1912	7
110	Pegatina azul	56	11098	Pegatina azul duradero y versátil	vini-mate	10658	1
111	Etiqueta negro	34	7501	Etiqueta negro ideal para exteriores	vini-textura	6750	18
112	Rotulo naranja	89	11205	Rotulo naranja para decoración de interiores	vini-mate	11039	4
113	Vinilo negro	96	9663	Vinilo negro resistente al agua	vini-mate	9454	8
114	Sticker blanco	36	3042	Sticker blanco ideal para exteriores	vini-metalico	2386	11
115	Papel adhesivo naranja	88	7386	Papel adhesivo naranja resistente al agua	vini-metalico	6744	16
116	Pegatina negro	34	7783	Pegatina negro duradero y versátil	vini-metalico	7177	17
117	Calcomanía blanco	26	6496	Calcomanía blanco duradero y versátil	vini-color	5840	13
118	Vinilo morado	59	9703	Vinilo morado uso profesional	vini-metalico	9426	3
119	Pegatina verde	51	5004	Pegatina verde duradero y versátil	vini-mate	4218	16
120	Vinilo negro	5	7892	Vinilo negro para decoración de interiores	vini-metalico	7035	10
121	Pegatina azul	69	2414	Pegatina azul resistente al agua	vini-color	2295	19
122	Pegatina verde	50	13945	Pegatina verde fácil de aplicar	vini-color	13259	6
123	Pegatina azul	50	8044	Pegatina azul resistente al agua	vini-mate	7149	6
124	Sticker naranja	53	12540	Sticker naranja uso profesional	vini-color	12139	14
125	Sticker rojo	99	2733	Sticker rojo duradero y versátil	vini-metalico	1826	10
126	Vinilo blanco	70	4071	Vinilo blanco resistente al agua	vini-textura	3650	1
127	Papel adhesivo negro	12	5974	Papel adhesivo negro duradero y versátil	vini-color	5109	18
128	Vinilo negro	84	13684	Vinilo negro uso profesional	vini-metalico	13089	13
129	Pegatina amarillo	50	6226	Pegatina amarillo ideal para exteriores	vini-mate	5788	10
130	Vinilo morado	63	13043	Vinilo morado ideal para exteriores	vini-metalico	12452	10
131	Sticker naranja	44	12452	Sticker naranja fácil de aplicar	vini-textura	12085	14
132	Sticker amarillo	53	10294	Sticker amarillo fácil de aplicar	vini-metalico	9616	9
133	Calcomanía azul	42	7356	Calcomanía azul para decoración de interiores	vini-metalico	6815	8
134	Sticker morado	78	7512	Sticker morado ideal para exteriores	vini-mate	7160	12
135	Rotulo naranja	83	2313	Rotulo naranja resistente al agua	vini-mate	2211	1
136	Calcomanía amarillo	64	12078	Calcomanía amarillo duradero y versátil	vini-mate	11887	6
137	Etiqueta blanco	6	2038	Etiqueta blanco resistente al agua	vini-mate	1891	8
138	Etiqueta blanco	38	8855	Etiqueta blanco uso profesional	vini-mate	7857	12
139	Sticker rojo	80	3584	Sticker rojo ideal para exteriores	vini-mate	2807	4
140	Sticker morado	46	4811	Sticker morado fácil de aplicar	vini-textura	4442	12
141	Vinilo azul	21	6625	Vinilo azul fácil de aplicar	vini-mate	5847	7
142	Sticker amarillo	29	6991	Sticker amarillo duradero y versátil	vini-textura	6235	9
143	Etiqueta amarillo	94	9705	Etiqueta amarillo ideal para exteriores	vini-color	8912	19
144	Papel adhesivo negro	100	10913	Papel adhesivo negro duradero y versátil	vini-color	10497	9
145	Pegatina rojo	91	13860	Pegatina rojo fácil de aplicar	vini-mate	13567	1
146	Vinilo morado	54	4400	Vinilo morado ideal para exteriores	vini-mate	3579	20
147	Rotulo morado	7	3952	Rotulo morado ideal para exteriores	vini-metalico	3838	16
148	Calcomanía rojo	79	7663	Calcomanía rojo para decoración de interiores	vini-color	7442	13
149	Rotulo amarillo	31	4165	Rotulo amarillo ideal para exteriores	vini-textura	3699	14
150	Papel adhesivo morado	100	7999	Papel adhesivo morado uso profesional	vini-textura	7459	5
151	Rotulo rojo	55	2351	Rotulo rojo resistente al agua	vini-color	1448	15
152	Papel adhesivo azul	47	6556	Papel adhesivo azul fácil de aplicar	vini-mate	6071	8
153	Etiqueta naranja	100	10495	Etiqueta naranja para decoración de interiores	vini-textura	9967	1
154	Calcomanía verde	26	4908	Calcomanía verde fácil de aplicar	vini-metalico	4527	13
155	Rotulo rojo	36	7747	Rotulo rojo uso profesional	vini-metalico	7587	5
156	Rotulo azul	81	10810	Rotulo azul ideal para exteriores	vini-metalico	10468	3
157	Calcomanía azul	74	3491	Calcomanía azul uso profesional	vini-mate	3086	2
158	Papel adhesivo amarillo	91	3468	Papel adhesivo amarillo para decoración de interiores	vini-textura	2814	13
159	Calcomanía amarillo	83	3345	Calcomanía amarillo fácil de aplicar	vini-metalico	2395	7
160	Vinilo rojo	71	4237	Vinilo rojo duradero y versátil	vini-color	3998	12
161	Etiqueta rojo	35	6738	Etiqueta rojo resistente al agua	vini-textura	6351	18
162	Sticker negro	81	3866	Sticker negro ideal para exteriores	vini-color	3368	1
163	Etiqueta rojo	56	6548	Etiqueta rojo resistente al agua	vini-metalico	6217	16
164	Etiqueta azul	53	6254	Etiqueta azul resistente al agua	vini-textura	5938	20
165	Sticker verde	91	12700	Sticker verde uso profesional	vini-metalico	12331	5
166	Papel adhesivo azul	7	8386	Papel adhesivo azul ideal para exteriores	vini-metalico	7902	1
167	Vinilo azul	74	9609	Vinilo azul resistente al agua	vini-color	8658	7
168	Sticker verde	66	8446	Sticker verde fácil de aplicar	vini-color	7448	5
169	Papel adhesivo azul	69	7122	Papel adhesivo azul fácil de aplicar	vini-color	6975	16
170	Etiqueta verde	53	13826	Etiqueta verde resistente al agua	vini-metalico	13340	18
171	Vinilo azul	59	11544	Vinilo azul duradero y versátil	vini-mate	10606	17
172	Papel adhesivo amarillo	33	4163	Papel adhesivo amarillo para decoración de interiores	vini-mate	3520	15
173	Vinilo blanco	36	13452	Vinilo blanco duradero y versátil	vini-textura	12764	7
174	Pegatina amarillo	44	12513	Pegatina amarillo duradero y versátil	vini-textura	12127	10
175	Sticker negro	69	5866	Sticker negro resistente al agua	vini-mate	5652	10
176	Rotulo negro	65	9589	Rotulo negro para decoración de interiores	vini-metalico	8614	6
177	Papel adhesivo naranja	46	9977	Papel adhesivo naranja fácil de aplicar	vini-color	9447	20
178	Sticker morado	42	13237	Sticker morado duradero y versátil	vini-color	13013	1
179	Sticker rojo	30	13913	Sticker rojo fácil de aplicar	vini-color	13554	7
180	Sticker morado	13	7795	Sticker morado fácil de aplicar	vini-textura	7523	1
181	Calcomanía verde	15	8682	Calcomanía verde duradero y versátil	vini-mate	8243	7
182	Papel adhesivo rojo	19	14132	Papel adhesivo rojo fácil de aplicar	vini-mate	13861	1
183	Rotulo verde	32	13370	Rotulo verde fácil de aplicar	vini-mate	12612	2
184	Sticker rojo	5	6809	Sticker rojo para decoración de interiores	vini-metalico	6180	14
185	Etiqueta rojo	61	4462	Etiqueta rojo duradero y versátil	vini-mate	3963	10
186	Pegatina negro	99	12034	Pegatina negro para decoración de interiores	vini-mate	11267	15
187	Calcomanía azul	35	9949	Calcomanía azul fácil de aplicar	vini-metalico	9832	20
188	Sticker blanco	91	5316	Sticker blanco duradero y versátil	vini-textura	5140	14
189	Rotulo naranja	96	6015	Rotulo naranja uso profesional	vini-mate	5628	15
190	Vinilo blanco	74	10135	Vinilo blanco para decoración de interiores	vini-mate	9668	3
191	Pegatina morado	80	14361	Pegatina morado fácil de aplicar	vini-color	13417	2
192	Rotulo negro	16	3107	Rotulo negro duradero y versátil	vini-mate	2586	15
193	Sticker negro	81	5693	Sticker negro fácil de aplicar	vini-metalico	5372	17
194	Calcomanía rojo	46	10702	Calcomanía rojo uso profesional	vini-mate	10043	5
195	Pegatina blanco	79	6257	Pegatina blanco duradero y versátil	vini-mate	5716	17
196	Sticker blanco	22	13122	Sticker blanco ideal para exteriores	vini-metalico	12958	19
197	Rotulo naranja	37	9018	Rotulo naranja para decoración de interiores	vini-color	8307	13
198	Rotulo azul	26	10292	Rotulo azul duradero y versátil	vini-color	9715	19
199	Vinilo azul	65	8111	Vinilo azul para decoración de interiores	vini-textura	7209	4
200	Rotulo verde	26	12224	Rotulo verde duradero y versátil	vini-textura	11642	3
201	Pegatina azul	50	4354	Pegatina azul ideal para exteriores	vini-mate	3562	9
202	Pegatina verde	36	4642	Pegatina verde para decoración de interiores	vini-color	4158	15
203	Papel adhesivo verde	61	13025	Papel adhesivo verde fácil de aplicar	vini-metalico	12672	7
204	Etiqueta rojo	63	12317	Etiqueta rojo fácil de aplicar	vini-metalico	11626	20
205	Papel adhesivo azul	28	9129	Papel adhesivo azul para decoración de interiores	vini-mate	8437	4
206	Papel adhesivo azul	29	8446	Papel adhesivo azul uso profesional	vini-mate	8333	10
207	Calcomanía rojo	75	13185	Calcomanía rojo resistente al agua	vini-mate	12501	14
208	Rotulo naranja	60	13124	Rotulo naranja para decoración de interiores	vini-mate	12953	13
209	Papel adhesivo azul	94	3199	Papel adhesivo azul uso profesional	vini-mate	2295	18
210	Rotulo amarillo	13	12457	Rotulo amarillo duradero y versátil	vini-mate	12049	10
211	Pegatina azul	73	6720	Pegatina azul resistente al agua	vini-metalico	5760	14
212	Papel adhesivo amarillo	46	14546	Papel adhesivo amarillo uso profesional	vini-color	13893	4
213	Etiqueta blanco	14	2495	Etiqueta blanco uso profesional	vini-color	1725	9
214	Rotulo morado	29	14377	Rotulo morado uso profesional	vini-metalico	14223	11
215	Calcomanía negro	38	10367	Calcomanía negro duradero y versátil	vini-metalico	9374	17
216	Vinilo rojo	63	12591	Vinilo rojo fácil de aplicar	vini-color	11873	7
217	Papel adhesivo blanco	49	6203	Papel adhesivo blanco duradero y versátil	vini-textura	5287	9
218	Rotulo rojo	94	13737	Rotulo rojo fácil de aplicar	vini-color	13500	14
219	Rotulo azul	79	12585	Rotulo azul duradero y versátil	vini-textura	12160	19
220	Calcomanía rojo	75	2082	Calcomanía rojo uso profesional	vini-metalico	1538	9
221	Papel adhesivo morado	6	7968	Papel adhesivo morado ideal para exteriores	vini-color	7717	10
222	Etiqueta morado	59	11921	Etiqueta morado fácil de aplicar	vini-color	11010	9
223	Calcomanía amarillo	28	5484	Calcomanía amarillo duradero y versátil	vini-color	4486	2
224	Vinilo naranja	5	9387	Vinilo naranja uso profesional	vini-color	8535	1
225	Calcomanía verde	23	10146	Calcomanía verde resistente al agua	vini-textura	9582	12
226	Rotulo amarillo	11	4904	Rotulo amarillo resistente al agua	vini-color	4523	1
227	Calcomanía amarillo	87	10288	Calcomanía amarillo resistente al agua	vini-metalico	9782	13
228	Calcomanía azul	84	7163	Calcomanía azul para decoración de interiores	vini-color	7014	17
229	Papel adhesivo blanco	88	5475	Papel adhesivo blanco duradero y versátil	vini-textura	5226	20
230	Sticker amarillo	11	12141	Sticker amarillo uso profesional	vini-color	11641	8
231	Papel adhesivo blanco	46	7122	Papel adhesivo blanco uso profesional	vini-color	6369	11
232	Sticker amarillo	83	3927	Sticker amarillo para decoración de interiores	vini-color	2950	10
233	Vinilo naranja	70	10725	Vinilo naranja para decoración de interiores	vini-color	9918	20
234	Vinilo amarillo	89	12267	Vinilo amarillo resistente al agua	vini-textura	11476	5
235	Etiqueta azul	67	3080	Etiqueta azul ideal para exteriores	vini-color	2297	18
236	Papel adhesivo verde	67	4194	Papel adhesivo verde resistente al agua	vini-metalico	3588	8
237	Calcomanía morado	5	3871	Calcomanía morado ideal para exteriores	vini-textura	3620	11
238	Etiqueta naranja	90	2478	Etiqueta naranja fácil de aplicar	vini-metalico	2129	7
239	Vinilo naranja	49	11337	Vinilo naranja para decoración de interiores	vini-mate	10722	15
240	Pegatina naranja	13	6267	Pegatina naranja duradero y versátil	vini-mate	5278	7
241	Papel adhesivo negro	99	14816	Papel adhesivo negro resistente al agua	vini-metalico	14698	19
242	Etiqueta naranja	91	11977	Etiqueta naranja duradero y versátil	vini-color	11124	8
243	Papel adhesivo morado	95	10866	Papel adhesivo morado duradero y versátil	vini-textura	10457	18
244	Vinilo amarillo	58	7725	Vinilo amarillo uso profesional	vini-textura	7472	17
245	Vinilo rojo	47	8898	Vinilo rojo uso profesional	vini-textura	8685	14
246	Pegatina verde	83	12308	Pegatina verde fácil de aplicar	vini-color	12008	4
247	Etiqueta negro	26	11766	Etiqueta negro duradero y versátil	vini-metalico	11545	19
248	Pegatina naranja	28	8801	Pegatina naranja ideal para exteriores	vini-color	8037	4
249	Calcomanía naranja	65	13295	Calcomanía naranja fácil de aplicar	vini-metalico	12498	6
250	Rotulo negro	51	4217	Rotulo negro ideal para exteriores	vini-color	3605	3
251	Calcomanía azul	43	14573	Calcomanía azul ideal para exteriores	vini-mate	14104	9
252	Sticker blanco	69	13315	Sticker blanco uso profesional	vini-color	12942	14
253	Pegatina rojo	71	6519	Pegatina rojo para decoración de interiores	vini-metalico	5997	6
254	Vinilo rojo	73	12601	Vinilo rojo fácil de aplicar	vini-mate	11784	2
255	Papel adhesivo amarillo	15	7020	Papel adhesivo amarillo resistente al agua	vini-metalico	6042	13
256	Etiqueta naranja	28	7137	Etiqueta naranja ideal para exteriores	vini-color	6199	19
257	Rotulo rojo	40	3453	Rotulo rojo fácil de aplicar	vini-color	3249	20
258	Rotulo morado	86	11093	Rotulo morado resistente al agua	vini-textura	10913	5
259	Vinilo blanco	57	12549	Vinilo blanco resistente al agua	vini-mate	12057	9
260	Etiqueta naranja	86	14150	Etiqueta naranja uso profesional	vini-textura	13670	4
261	Pegatina negro	63	11123	Pegatina negro fácil de aplicar	vini-textura	10211	15
262	Etiqueta negro	11	9786	Etiqueta negro duradero y versátil	vini-metalico	9064	15
263	Sticker verde	64	11637	Sticker verde duradero y versátil	vini-color	11284	9
264	Sticker blanco	38	14911	Sticker blanco resistente al agua	vini-mate	13970	12
265	Calcomanía blanco	25	5173	Calcomanía blanco duradero y versátil	vini-metalico	4784	6
266	Etiqueta morado	53	8469	Etiqueta morado ideal para exteriores	vini-textura	8279	19
267	Etiqueta morado	87	4050	Etiqueta morado fácil de aplicar	vini-mate	3169	16
268	Etiqueta morado	73	14460	Etiqueta morado fácil de aplicar	vini-textura	13718	19
269	Rotulo blanco	84	4664	Rotulo blanco para decoración de interiores	vini-textura	4024	14
270	Papel adhesivo negro	53	11553	Papel adhesivo negro fácil de aplicar	vini-textura	10738	6
271	Papel adhesivo blanco	94	5147	Papel adhesivo blanco duradero y versátil	vini-textura	4299	7
272	Vinilo morado	71	9189	Vinilo morado para decoración de interiores	vini-textura	8886	20
273	Vinilo naranja	79	3254	Vinilo naranja para decoración de interiores	vini-metalico	2837	9
274	Vinilo morado	29	3635	Vinilo morado fácil de aplicar	vini-textura	3337	9
275	Etiqueta amarillo	12	12389	Etiqueta amarillo ideal para exteriores	vini-color	11713	1
276	Pegatina amarillo	96	11304	Pegatina amarillo uso profesional	vini-color	11192	15
277	Sticker rojo	96	11098	Sticker rojo ideal para exteriores	vini-mate	10521	7
278	Sticker azul	56	12313	Sticker azul resistente al agua	vini-color	11376	13
279	Etiqueta amarillo	71	11027	Etiqueta amarillo resistente al agua	vini-metalico	10432	13
280	Papel adhesivo rojo	100	6006	Papel adhesivo rojo duradero y versátil	vini-textura	5410	11
281	Pegatina morado	31	7421	Pegatina morado ideal para exteriores	vini-metalico	7218	14
282	Sticker morado	83	11036	Sticker morado fácil de aplicar	vini-metalico	10389	2
283	Calcomanía verde	63	12692	Calcomanía verde para decoración de interiores	vini-textura	11977	19
284	Etiqueta azul	61	2520	Etiqueta azul uso profesional	vini-mate	1780	14
285	Vinilo rojo	90	3369	Vinilo rojo uso profesional	vini-color	2429	11
286	Rotulo morado	87	13723	Rotulo morado fácil de aplicar	vini-mate	13326	2
287	Papel adhesivo rojo	85	13025	Papel adhesivo rojo fácil de aplicar	vini-textura	12746	20
288	Etiqueta verde	35	5564	Etiqueta verde uso profesional	vini-color	4921	13
289	Pegatina morado	96	10391	Pegatina morado resistente al agua	vini-metalico	9414	9
290	Papel adhesivo naranja	61	9525	Papel adhesivo naranja fácil de aplicar	vini-mate	8932	12
291	Pegatina verde	88	2063	Pegatina verde fácil de aplicar	vini-mate	1452	19
292	Rotulo morado	25	8970	Rotulo morado fácil de aplicar	vini-color	8608	20
293	Papel adhesivo negro	39	9458	Papel adhesivo negro ideal para exteriores	vini-color	9104	5
294	Papel adhesivo naranja	85	9468	Papel adhesivo naranja resistente al agua	vini-color	9114	20
295	Sticker rojo	84	13130	Sticker rojo ideal para exteriores	vini-metalico	12267	14
296	Calcomanía amarillo	86	13174	Calcomanía amarillo resistente al agua	vini-textura	12812	13
297	Calcomanía negro	69	10579	Calcomanía negro duradero y versátil	vini-metalico	9923	1
298	Rotulo rojo	93	3252	Rotulo rojo ideal para exteriores	vini-color	2560	6
299	Vinilo blanco	27	11186	Vinilo blanco uso profesional	vini-metalico	10322	15
300	Papel adhesivo naranja	95	12845	Papel adhesivo naranja uso profesional	vini-metalico	12164	17
301	Papel adhesivo rojo	65	10840	Papel adhesivo rojo resistente al agua	vini-color	10703	2
302	Etiqueta negro	66	10266	Etiqueta negro uso profesional	vini-metalico	9502	19
303	Papel adhesivo blanco	100	8204	Papel adhesivo blanco fácil de aplicar	vini-color	7611	16
304	Pegatina amarillo	48	12378	Pegatina amarillo duradero y versátil	vini-metalico	12277	1
305	Rotulo morado	24	11657	Rotulo morado resistente al agua	vini-textura	11488	1
306	Rotulo blanco	72	6302	Rotulo blanco fácil de aplicar	vini-textura	5660	17
307	Rotulo amarillo	98	14954	Rotulo amarillo resistente al agua	vini-mate	14032	11
308	Sticker negro	11	12140	Sticker negro ideal para exteriores	vini-color	11640	1
309	Etiqueta morado	53	5899	Etiqueta morado ideal para exteriores	vini-color	5574	13
310	Rotulo rojo	53	10606	Rotulo rojo fácil de aplicar	vini-textura	10321	2
311	Sticker morado	10	10320	Sticker morado duradero y versátil	vini-textura	10187	13
312	Etiqueta negro	13	14945	Etiqueta negro fácil de aplicar	vini-textura	14779	11
313	Sticker rojo	18	9109	Sticker rojo fácil de aplicar	vini-color	8289	14
314	Sticker azul	41	5959	Sticker azul para decoración de interiores	vini-textura	4965	13
315	Etiqueta morado	59	6059	Etiqueta morado ideal para exteriores	vini-textura	5138	11
316	Sticker negro	35	5427	Sticker negro para decoración de interiores	vini-color	5310	2
317	Etiqueta naranja	23	7224	Etiqueta naranja duradero y versátil	vini-metalico	6550	9
318	Rotulo azul	95	11569	Rotulo azul uso profesional	vini-textura	11082	3
319	Pegatina blanco	87	2620	Pegatina blanco fácil de aplicar	vini-metalico	2289	18
320	Etiqueta amarillo	80	12967	Etiqueta amarillo duradero y versátil	vini-mate	12257	12
321	Papel adhesivo rojo	89	9471	Papel adhesivo rojo ideal para exteriores	vini-textura	8599	15
322	Calcomanía rojo	74	5919	Calcomanía rojo uso profesional	vini-textura	5024	10
323	Etiqueta morado	69	8322	Etiqueta morado fácil de aplicar	vini-textura	7470	14
324	Etiqueta azul	57	12745	Etiqueta azul ideal para exteriores	vini-textura	11823	6
325	Rotulo amarillo	83	3901	Rotulo amarillo para decoración de interiores	vini-mate	2954	6
326	Sticker blanco	34	2049	Sticker blanco uso profesional	vini-mate	1186	7
327	Calcomanía amarillo	85	3783	Calcomanía amarillo ideal para exteriores	vini-mate	3644	5
328	Sticker negro	94	4229	Sticker negro uso profesional	vini-mate	3628	2
329	Vinilo negro	70	10478	Vinilo negro para decoración de interiores	vini-mate	10332	3
330	Etiqueta morado	19	4662	Etiqueta morado resistente al agua	vini-metalico	3850	17
331	Sticker blanco	58	5238	Sticker blanco resistente al agua	vini-textura	4384	19
332	Vinilo azul	81	11957	Vinilo azul duradero y versátil	vini-color	11026	12
333	Sticker negro	97	13277	Sticker negro duradero y versátil	vini-color	12294	7
334	Calcomanía morado	86	5619	Calcomanía morado fácil de aplicar	vini-color	5504	15
335	Pegatina negro	94	4444	Pegatina negro fácil de aplicar	vini-color	3797	8
336	Etiqueta morado	59	10917	Etiqueta morado ideal para exteriores	vini-metalico	10654	8
337	Etiqueta naranja	59	4820	Etiqueta naranja duradero y versátil	vini-metalico	4695	6
338	Calcomanía verde	11	2676	Calcomanía verde resistente al agua	vini-textura	2434	7
339	Etiqueta blanco	68	6666	Etiqueta blanco ideal para exteriores	vini-mate	6424	5
340	Pegatina negro	22	10340	Pegatina negro duradero y versátil	vini-metalico	9663	7
341	Pegatina verde	87	10433	Pegatina verde duradero y versátil	vini-color	10009	19
342	Papel adhesivo blanco	25	2267	Papel adhesivo blanco resistente al agua	vini-mate	1435	2
343	Calcomanía azul	19	12934	Calcomanía azul uso profesional	vini-mate	12626	14
344	Pegatina rojo	17	12760	Pegatina rojo ideal para exteriores	vini-metalico	11991	20
345	Calcomanía rojo	18	13861	Calcomanía rojo uso profesional	vini-metalico	13090	13
346	Vinilo blanco	14	4500	Vinilo blanco resistente al agua	vini-color	4116	17
347	Papel adhesivo amarillo	68	6933	Papel adhesivo amarillo duradero y versátil	vini-mate	6146	6
348	Sticker verde	42	4742	Sticker verde duradero y versátil	vini-color	4639	16
349	Rotulo azul	66	5051	Rotulo azul ideal para exteriores	vini-textura	4148	6
350	Pegatina azul	26	3234	Pegatina azul fácil de aplicar	vini-color	2855	20
351	Vinilo negro	60	11880	Vinilo negro duradero y versátil	vini-mate	11334	14
352	Vinilo verde	64	7127	Vinilo verde duradero y versátil	vini-mate	6810	5
353	Sticker negro	69	2355	Sticker negro duradero y versátil	vini-textura	2159	13
354	Rotulo negro	68	11577	Rotulo negro uso profesional	vini-color	10829	7
355	Rotulo amarillo	71	7699	Rotulo amarillo uso profesional	vini-textura	7246	11
356	Rotulo blanco	16	7612	Rotulo blanco ideal para exteriores	vini-textura	7366	18
357	Rotulo negro	40	10175	Rotulo negro resistente al agua	vini-color	9845	5
358	Sticker amarillo	27	14202	Sticker amarillo resistente al agua	vini-metalico	13732	8
359	Calcomanía morado	96	11235	Calcomanía morado resistente al agua	vini-color	10647	11
360	Rotulo blanco	7	13863	Rotulo blanco resistente al agua	vini-mate	13221	14
361	Vinilo azul	91	4747	Vinilo azul duradero y versátil	vini-metalico	4358	13
362	Rotulo amarillo	27	4704	Rotulo amarillo fácil de aplicar	vini-textura	4599	10
363	Sticker negro	85	10746	Sticker negro duradero y versátil	vini-mate	10235	5
364	Etiqueta negro	9	14377	Etiqueta negro duradero y versátil	vini-metalico	13463	16
365	Vinilo azul	5	3088	Vinilo azul resistente al agua	vini-mate	2347	8
366	Calcomanía rojo	49	12761	Calcomanía rojo resistente al agua	vini-textura	12642	11
367	Etiqueta amarillo	56	8391	Etiqueta amarillo fácil de aplicar	vini-textura	7514	5
368	Etiqueta rojo	15	5023	Etiqueta rojo uso profesional	vini-textura	4881	4
369	Pegatina naranja	51	8029	Pegatina naranja resistente al agua	vini-mate	7487	19
370	Rotulo amarillo	43	12471	Rotulo amarillo duradero y versátil	vini-metalico	11797	5
371	Sticker amarillo	94	10752	Sticker amarillo duradero y versátil	vini-color	9886	12
372	Calcomanía naranja	30	12179	Calcomanía naranja fácil de aplicar	vini-metalico	11634	2
373	Etiqueta negro	12	2622	Etiqueta negro fácil de aplicar	vini-textura	2351	19
374	Papel adhesivo rojo	20	10810	Papel adhesivo rojo para decoración de interiores	vini-color	10544	10
375	Sticker morado	19	6441	Sticker morado uso profesional	vini-textura	5981	11
376	Rotulo amarillo	77	2651	Rotulo amarillo duradero y versátil	vini-mate	2093	14
377	Sticker negro	45	6821	Sticker negro duradero y versátil	vini-mate	6039	14
378	Etiqueta naranja	89	6897	Etiqueta naranja ideal para exteriores	vini-color	6548	10
379	Rotulo verde	26	13279	Rotulo verde uso profesional	vini-metalico	13038	6
380	Pegatina negro	62	6813	Pegatina negro ideal para exteriores	vini-textura	6271	6
381	Pegatina negro	42	12492	Pegatina negro resistente al agua	vini-mate	11753	12
382	Sticker verde	90	14854	Sticker verde uso profesional	vini-metalico	14178	11
383	Etiqueta amarillo	50	8286	Etiqueta amarillo para decoración de interiores	vini-metalico	7498	5
384	Etiqueta naranja	46	3092	Etiqueta naranja fácil de aplicar	vini-textura	2427	1
385	Etiqueta azul	38	7957	Etiqueta azul para decoración de interiores	vini-textura	7348	8
386	Pegatina blanco	98	9099	Pegatina blanco ideal para exteriores	vini-metalico	8677	16
387	Pegatina negro	66	8068	Pegatina negro resistente al agua	vini-metalico	7453	20
388	Vinilo amarillo	5	3070	Vinilo amarillo uso profesional	vini-textura	2132	14
389	Sticker negro	30	12191	Sticker negro fácil de aplicar	vini-textura	11587	3
390	Sticker blanco	84	6386	Sticker blanco uso profesional	vini-color	5603	8
391	Calcomanía blanco	23	8365	Calcomanía blanco fácil de aplicar	vini-metalico	7731	1
392	Rotulo rojo	100	10876	Rotulo rojo para decoración de interiores	vini-color	10509	3
393	Pegatina naranja	5	12847	Pegatina naranja ideal para exteriores	vini-textura	12693	1
394	Calcomanía amarillo	92	4152	Calcomanía amarillo para decoración de interiores	vini-textura	3512	7
395	Sticker amarillo	52	14050	Sticker amarillo duradero y versátil	vini-metalico	13765	14
396	Vinilo morado	22	4288	Vinilo morado para decoración de interiores	vini-metalico	4173	1
397	Rotulo verde	50	14327	Rotulo verde uso profesional	vini-textura	13485	3
398	Papel adhesivo morado	76	11059	Papel adhesivo morado uso profesional	vini-mate	10758	1
399	Pegatina rojo	13	10712	Pegatina rojo para decoración de interiores	vini-textura	10186	13
400	Sticker amarillo	58	5382	Sticker amarillo fácil de aplicar	vini-color	4775	7
401	Etiqueta morado	71	12220	Etiqueta morado para decoración de interiores	vini-mate	11344	12
402	Sticker rojo	63	14867	Sticker rojo uso profesional	vini-metalico	14638	7
403	Rotulo morado	20	7053	Rotulo morado ideal para exteriores	vini-metalico	6355	10
404	Papel adhesivo rojo	92	4476	Papel adhesivo rojo duradero y versátil	vini-metalico	3856	20
405	Rotulo blanco	55	10101	Rotulo blanco para decoración de interiores	vini-mate	9329	4
406	Rotulo verde	53	12451	Rotulo verde resistente al agua	vini-metalico	12057	19
407	Papel adhesivo blanco	42	4143	Papel adhesivo blanco fácil de aplicar	vini-textura	3623	12
408	Calcomanía azul	35	2966	Calcomanía azul para decoración de interiores	vini-mate	2578	15
409	Sticker amarillo	38	11599	Sticker amarillo para decoración de interiores	vini-color	11372	19
410	Papel adhesivo azul	29	11084	Papel adhesivo azul ideal para exteriores	vini-metalico	10671	18
411	Pegatina rojo	83	7918	Pegatina rojo resistente al agua	vini-textura	7388	1
412	Calcomanía rojo	61	4195	Calcomanía rojo fácil de aplicar	vini-color	3988	4
413	Calcomanía blanco	32	5902	Calcomanía blanco resistente al agua	vini-textura	5117	6
414	Pegatina azul	77	2027	Pegatina azul duradero y versátil	vini-metalico	1794	15
415	Vinilo verde	54	12393	Vinilo verde fácil de aplicar	vini-mate	11648	15
416	Papel adhesivo blanco	97	9970	Papel adhesivo blanco ideal para exteriores	vini-mate	9155	11
417	Papel adhesivo amarillo	43	3655	Papel adhesivo amarillo resistente al agua	vini-metalico	2953	4
418	Rotulo morado	83	8244	Rotulo morado uso profesional	vini-textura	7940	11
419	Vinilo morado	86	7878	Vinilo morado duradero y versátil	vini-color	7223	15
420	Sticker naranja	80	5421	Sticker naranja resistente al agua	vini-textura	4949	3
421	Calcomanía negro	46	4947	Calcomanía negro uso profesional	vini-color	4589	15
422	Calcomanía negro	79	14861	Calcomanía negro uso profesional	vini-metalico	14366	15
423	Vinilo morado	29	8377	Vinilo morado duradero y versátil	vini-textura	8235	19
424	Calcomanía blanco	37	7809	Calcomanía blanco fácil de aplicar	vini-mate	6991	12
425	Papel adhesivo blanco	84	3786	Papel adhesivo blanco resistente al agua	vini-mate	3111	4
426	Vinilo naranja	26	2063	Vinilo naranja duradero y versátil	vini-color	1629	2
427	Vinilo naranja	77	13755	Vinilo naranja resistente al agua	vini-mate	13352	19
428	Rotulo amarillo	76	2379	Rotulo amarillo duradero y versátil	vini-metalico	1466	11
429	Papel adhesivo naranja	60	8998	Papel adhesivo naranja duradero y versátil	vini-color	8204	2
430	Pegatina verde	25	13726	Pegatina verde uso profesional	vini-mate	13415	19
431	Sticker verde	34	4382	Sticker verde fácil de aplicar	vini-color	4267	18
432	Calcomanía negro	34	4927	Calcomanía negro fácil de aplicar	vini-metalico	4767	5
433	Sticker azul	39	4055	Sticker azul duradero y versátil	vini-color	3904	18
434	Etiqueta amarillo	73	13287	Etiqueta amarillo para decoración de interiores	vini-metalico	12702	10
435	Calcomanía amarillo	97	13920	Calcomanía amarillo duradero y versátil	vini-mate	13421	4
436	Rotulo blanco	92	11637	Rotulo blanco para decoración de interiores	vini-metalico	10885	11
437	Pegatina negro	77	3308	Pegatina negro uso profesional	vini-metalico	2644	10
438	Sticker verde	30	11136	Sticker verde para decoración de interiores	vini-metalico	10805	17
439	Sticker amarillo	50	7141	Sticker amarillo ideal para exteriores	vini-color	6912	4
440	Sticker verde	92	4767	Sticker verde fácil de aplicar	vini-color	4363	13
441	Rotulo amarillo	42	11077	Rotulo amarillo fácil de aplicar	vini-mate	10830	15
442	Papel adhesivo naranja	33	11033	Papel adhesivo naranja resistente al agua	vini-mate	10922	14
443	Etiqueta azul	70	11644	Etiqueta azul uso profesional	vini-mate	11177	1
444	Calcomanía naranja	56	8011	Calcomanía naranja ideal para exteriores	vini-mate	7463	2
445	Etiqueta negro	93	10089	Etiqueta negro para decoración de interiores	vini-textura	9761	18
446	Etiqueta azul	85	10643	Etiqueta azul para decoración de interiores	vini-mate	9840	18
447	Sticker morado	31	5689	Sticker morado fácil de aplicar	vini-metalico	5376	18
448	Papel adhesivo negro	24	7642	Papel adhesivo negro duradero y versátil	vini-textura	6663	16
449	Papel adhesivo rojo	18	5975	Papel adhesivo rojo para decoración de interiores	vini-metalico	5818	10
450	Calcomanía negro	31	3869	Calcomanía negro uso profesional	vini-mate	2937	9
451	Papel adhesivo naranja	26	9477	Papel adhesivo naranja resistente al agua	vini-textura	8974	1
452	Papel adhesivo negro	67	7650	Papel adhesivo negro fácil de aplicar	vini-color	6739	19
453	Vinilo morado	23	4636	Vinilo morado fácil de aplicar	vini-color	4087	2
454	Calcomanía blanco	6	11377	Calcomanía blanco uso profesional	vini-color	10882	3
455	Sticker verde	47	12651	Sticker verde uso profesional	vini-metalico	12432	17
456	Papel adhesivo naranja	91	3344	Papel adhesivo naranja fácil de aplicar	vini-metalico	2883	8
457	Pegatina azul	12	11919	Pegatina azul fácil de aplicar	vini-mate	11717	9
458	Sticker azul	55	8846	Sticker azul fácil de aplicar	vini-mate	8375	2
459	Pegatina verde	25	6204	Pegatina verde fácil de aplicar	vini-color	5926	13
460	Vinilo rojo	97	8983	Vinilo rojo fácil de aplicar	vini-textura	8561	16
461	Papel adhesivo azul	57	3722	Papel adhesivo azul uso profesional	vini-textura	3087	11
462	Papel adhesivo azul	24	12572	Papel adhesivo azul para decoración de interiores	vini-textura	12435	18
463	Pegatina rojo	65	8047	Pegatina rojo para decoración de interiores	vini-mate	7621	19
464	Papel adhesivo rojo	92	5677	Papel adhesivo rojo ideal para exteriores	vini-mate	5135	13
465	Rotulo naranja	14	2097	Rotulo naranja para decoración de interiores	vini-textura	1109	5
466	Rotulo rojo	12	9351	Rotulo rojo uso profesional	vini-metalico	8478	13
467	Vinilo blanco	53	13347	Vinilo blanco uso profesional	vini-color	12383	5
468	Etiqueta morado	71	5276	Etiqueta morado uso profesional	vini-mate	4476	3
469	Vinilo negro	11	6699	Vinilo negro duradero y versátil	vini-metalico	6045	12
470	Calcomanía blanco	55	14941	Calcomanía blanco fácil de aplicar	vini-mate	14291	11
471	Papel adhesivo blanco	13	9661	Papel adhesivo blanco ideal para exteriores	vini-metalico	9448	5
472	Calcomanía verde	95	12182	Calcomanía verde resistente al agua	vini-mate	11271	1
473	Papel adhesivo negro	84	10564	Papel adhesivo negro fácil de aplicar	vini-metalico	10387	18
474	Papel adhesivo naranja	50	11045	Papel adhesivo naranja para decoración de interiores	vini-metalico	10377	5
475	Rotulo amarillo	35	4988	Rotulo amarillo para decoración de interiores	vini-metalico	4747	3
476	Vinilo azul	43	9426	Vinilo azul duradero y versátil	vini-metalico	8808	17
477	Pegatina verde	86	8043	Pegatina verde ideal para exteriores	vini-mate	7547	15
478	Sticker azul	5	8610	Sticker azul ideal para exteriores	vini-textura	7987	4
479	Sticker rojo	43	11292	Sticker rojo ideal para exteriores	vini-metalico	10421	4
480	Papel adhesivo amarillo	65	11769	Papel adhesivo amarillo uso profesional	vini-metalico	10848	4
481	Rotulo amarillo	27	5729	Rotulo amarillo fácil de aplicar	vini-textura	4787	6
482	Pegatina amarillo	19	12051	Pegatina amarillo duradero y versátil	vini-mate	11891	6
483	Papel adhesivo naranja	59	2518	Papel adhesivo naranja resistente al agua	vini-color	1808	2
484	Pegatina negro	33	14246	Pegatina negro ideal para exteriores	vini-metalico	13352	17
485	Vinilo morado	75	13946	Vinilo morado fácil de aplicar	vini-mate	13069	17
486	Papel adhesivo naranja	7	9023	Papel adhesivo naranja duradero y versátil	vini-mate	8306	12
487	Calcomanía azul	76	11970	Calcomanía azul duradero y versátil	vini-mate	11798	17
488	Rotulo blanco	10	5806	Rotulo blanco duradero y versátil	vini-mate	5010	17
489	Papel adhesivo blanco	71	4496	Papel adhesivo blanco duradero y versátil	vini-textura	3818	20
490	Etiqueta rojo	42	8648	Etiqueta rojo fácil de aplicar	vini-color	7767	8
491	Calcomanía morado	91	3793	Calcomanía morado para decoración de interiores	vini-color	3373	5
492	Rotulo verde	27	3289	Rotulo verde para decoración de interiores	vini-textura	2469	8
493	Sticker naranja	38	14446	Sticker naranja ideal para exteriores	vini-color	14307	15
494	Sticker blanco	67	6892	Sticker blanco resistente al agua	vini-metalico	6705	17
495	Etiqueta rojo	46	6153	Etiqueta rojo fácil de aplicar	vini-mate	5399	7
496	Rotulo amarillo	67	8634	Rotulo amarillo para decoración de interiores	vini-metalico	8034	7
497	Vinilo amarillo	55	4957	Vinilo amarillo duradero y versátil	vini-metalico	4786	1
498	Rotulo rojo	10	12521	Rotulo rojo ideal para exteriores	vini-textura	11788	7
499	Papel adhesivo amarillo	9	11667	Papel adhesivo amarillo para decoración de interiores	vini-textura	11155	4
500	Papel adhesivo azul	95	6805	Papel adhesivo azul fácil de aplicar	vini-metalico	6480	7
501	Vinilo negro	89	11167	Vinilo negro resistente al agua	vini-color	11004	6
502	Vinilo verde	89	10054	Vinilo verde ideal para exteriores	vini-textura	9602	15
503	Rotulo azul	53	9860	Rotulo azul para decoración de interiores	vini-metalico	8870	18
504	Rotulo naranja	36	3305	Rotulo naranja duradero y versátil	vini-color	2971	10
505	Calcomanía azul	7	14649	Calcomanía azul para decoración de interiores	vini-color	13901	14
506	Papel adhesivo naranja	90	5482	Papel adhesivo naranja ideal para exteriores	vini-textura	4828	15
507	Vinilo morado	13	14064	Vinilo morado duradero y versátil	vini-mate	13515	3
508	Vinilo azul	22	11175	Vinilo azul uso profesional	vini-textura	10175	17
509	Vinilo morado	36	6243	Vinilo morado fácil de aplicar	vini-color	5793	9
510	Vinilo morado	35	11350	Vinilo morado fácil de aplicar	vini-metalico	11158	17
511	Calcomanía amarillo	7	4858	Calcomanía amarillo fácil de aplicar	vini-color	4684	3
512	Etiqueta blanco	62	9286	Etiqueta blanco duradero y versátil	vini-color	8800	13
513	Etiqueta rojo	48	6669	Etiqueta rojo fácil de aplicar	vini-color	5924	11
514	Papel adhesivo amarillo	38	14972	Papel adhesivo amarillo para decoración de interiores	vini-color	14316	16
515	Rotulo verde	50	14300	Rotulo verde resistente al agua	vini-metalico	13766	10
516	Rotulo blanco	86	13624	Rotulo blanco ideal para exteriores	vini-color	12994	4
517	Sticker naranja	67	5727	Sticker naranja fácil de aplicar	vini-mate	4849	11
518	Rotulo amarillo	88	11042	Rotulo amarillo duradero y versátil	vini-metalico	10541	2
519	Rotulo naranja	69	5091	Rotulo naranja ideal para exteriores	vini-color	4419	11
520	Pegatina amarillo	76	8986	Pegatina amarillo ideal para exteriores	vini-color	8816	15
521	Calcomanía naranja	77	2924	Calcomanía naranja ideal para exteriores	vini-metalico	2349	1
522	Vinilo blanco	18	9942	Vinilo blanco resistente al agua	vini-mate	9415	12
523	Calcomanía naranja	98	7267	Calcomanía naranja para decoración de interiores	vini-metalico	6803	6
524	Sticker blanco	29	2975	Sticker blanco ideal para exteriores	vini-textura	2548	17
525	Papel adhesivo blanco	25	2737	Papel adhesivo blanco duradero y versátil	vini-textura	2357	4
526	Vinilo blanco	82	13817	Vinilo blanco para decoración de interiores	vini-color	13380	9
527	Sticker blanco	62	8213	Sticker blanco resistente al agua	vini-color	7984	16
528	Sticker negro	32	7833	Sticker negro uso profesional	vini-metalico	7028	2
529	Etiqueta amarillo	86	12607	Etiqueta amarillo fácil de aplicar	vini-color	12357	14
530	Vinilo amarillo	88	2216	Vinilo amarillo ideal para exteriores	vini-mate	1804	12
531	Vinilo morado	99	12874	Vinilo morado resistente al agua	vini-textura	12358	4
532	Etiqueta blanco	68	9742	Etiqueta blanco fácil de aplicar	vini-mate	9364	9
533	Sticker blanco	50	11923	Sticker blanco para decoración de interiores	vini-color	11784	15
534	Vinilo negro	97	4724	Vinilo negro uso profesional	vini-textura	4075	15
535	Papel adhesivo amarillo	53	13877	Papel adhesivo amarillo uso profesional	vini-color	13726	13
536	Calcomanía amarillo	18	3945	Calcomanía amarillo fácil de aplicar	vini-textura	3194	12
537	Vinilo azul	49	9319	Vinilo azul ideal para exteriores	vini-mate	8663	20
538	Calcomanía amarillo	81	5282	Calcomanía amarillo uso profesional	vini-textura	4725	10
539	Pegatina verde	76	11334	Pegatina verde uso profesional	vini-textura	10971	4
540	Vinilo verde	19	11037	Vinilo verde ideal para exteriores	vini-metalico	10251	5
541	Etiqueta naranja	58	12018	Etiqueta naranja ideal para exteriores	vini-metalico	11917	1
542	Sticker verde	45	7281	Sticker verde ideal para exteriores	vini-textura	6397	3
543	Papel adhesivo rojo	34	12138	Papel adhesivo rojo fácil de aplicar	vini-metalico	11507	9
544	Calcomanía amarillo	76	3598	Calcomanía amarillo ideal para exteriores	vini-metalico	2813	4
545	Vinilo azul	43	6313	Vinilo azul duradero y versátil	vini-mate	5955	7
546	Vinilo naranja	50	2065	Vinilo naranja para decoración de interiores	vini-color	1832	1
547	Sticker verde	64	12294	Sticker verde uso profesional	vini-metalico	11379	4
548	Sticker amarillo	85	10819	Sticker amarillo uso profesional	vini-color	9947	3
549	Calcomanía blanco	44	11829	Calcomanía blanco fácil de aplicar	vini-textura	11181	19
550	Rotulo negro	6	8174	Rotulo negro resistente al agua	vini-metalico	7537	2
551	Vinilo negro	77	5825	Vinilo negro fácil de aplicar	vini-color	5047	10
552	Vinilo verde	88	7123	Vinilo verde fácil de aplicar	vini-mate	6137	15
553	Papel adhesivo azul	7	4194	Papel adhesivo azul para decoración de interiores	vini-metalico	3641	5
554	Etiqueta morado	22	6640	Etiqueta morado resistente al agua	vini-color	5668	15
555	Rotulo amarillo	24	7852	Rotulo amarillo ideal para exteriores	vini-textura	6889	6
556	Etiqueta blanco	92	5313	Etiqueta blanco para decoración de interiores	vini-textura	4785	14
557	Calcomanía negro	9	7548	Calcomanía negro uso profesional	vini-metalico	7287	6
558	Calcomanía verde	66	14151	Calcomanía verde uso profesional	vini-color	13928	14
559	Sticker negro	42	8174	Sticker negro fácil de aplicar	vini-metalico	7800	15
560	Calcomanía verde	8	6600	Calcomanía verde para decoración de interiores	vini-textura	6366	7
561	Sticker negro	77	7228	Sticker negro uso profesional	vini-textura	6816	8
562	Rotulo amarillo	29	13754	Rotulo amarillo uso profesional	vini-color	13024	17
563	Calcomanía amarillo	79	11896	Calcomanía amarillo fácil de aplicar	vini-mate	11095	20
564	Papel adhesivo negro	52	3359	Papel adhesivo negro duradero y versátil	vini-color	2881	20
565	Sticker amarillo	79	12726	Sticker amarillo duradero y versátil	vini-mate	11943	10
566	Sticker verde	23	14944	Sticker verde para decoración de interiores	vini-textura	14296	17
567	Sticker azul	44	13327	Sticker azul resistente al agua	vini-color	12683	1
568	Etiqueta blanco	94	3005	Etiqueta blanco para decoración de interiores	vini-color	2740	5
569	Etiqueta naranja	47	6832	Etiqueta naranja duradero y versátil	vini-metalico	6591	1
570	Pegatina verde	79	13215	Pegatina verde para decoración de interiores	vini-color	12244	17
571	Etiqueta rojo	82	8285	Etiqueta rojo resistente al agua	vini-textura	7442	2
572	Papel adhesivo blanco	91	3185	Papel adhesivo blanco uso profesional	vini-mate	2204	6
573	Papel adhesivo azul	38	14310	Papel adhesivo azul fácil de aplicar	vini-color	13990	12
574	Papel adhesivo negro	96	4574	Papel adhesivo negro fácil de aplicar	vini-mate	3997	20
575	Calcomanía verde	94	2669	Calcomanía verde uso profesional	vini-metalico	2162	5
576	Rotulo amarillo	56	4667	Rotulo amarillo resistente al agua	vini-mate	4316	14
577	Papel adhesivo naranja	47	14782	Papel adhesivo naranja resistente al agua	vini-textura	13969	16
578	Rotulo verde	83	10832	Rotulo verde ideal para exteriores	vini-mate	10384	14
579	Pegatina amarillo	20	8652	Pegatina amarillo fácil de aplicar	vini-textura	8219	10
580	Pegatina rojo	80	14448	Pegatina rojo para decoración de interiores	vini-metalico	14038	7
581	Rotulo negro	50	13433	Rotulo negro fácil de aplicar	vini-color	12592	7
582	Papel adhesivo verde	40	13770	Papel adhesivo verde ideal para exteriores	vini-metalico	13491	8
583	Etiqueta negro	20	4080	Etiqueta negro ideal para exteriores	vini-textura	3319	18
584	Etiqueta rojo	33	6942	Etiqueta rojo duradero y versátil	vini-metalico	6076	3
585	Pegatina azul	10	11653	Pegatina azul para decoración de interiores	vini-color	11463	1
586	Vinilo negro	74	12684	Vinilo negro resistente al agua	vini-textura	11875	10
587	Pegatina azul	54	12110	Pegatina azul resistente al agua	vini-metalico	11146	3
588	Etiqueta azul	75	2689	Etiqueta azul uso profesional	vini-textura	2552	16
589	Etiqueta morado	74	3936	Etiqueta morado para decoración de interiores	vini-mate	3508	14
590	Vinilo rojo	8	13192	Vinilo rojo duradero y versátil	vini-color	12919	2
591	Rotulo naranja	51	13631	Rotulo naranja fácil de aplicar	vini-textura	13504	6
592	Etiqueta amarillo	89	6717	Etiqueta amarillo para decoración de interiores	vini-metalico	6572	9
593	Vinilo azul	99	2629	Vinilo azul fácil de aplicar	vini-metalico	2138	15
594	Sticker morado	58	5425	Sticker morado uso profesional	vini-mate	4602	7
595	Rotulo amarillo	20	2020	Rotulo amarillo ideal para exteriores	vini-color	1538	16
596	Calcomanía azul	92	12001	Calcomanía azul ideal para exteriores	vini-color	11414	19
597	Vinilo naranja	10	12011	Vinilo naranja resistente al agua	vini-color	11457	7
598	Rotulo blanco	97	9452	Rotulo blanco resistente al agua	vini-metalico	9249	14
599	Rotulo morado	12	9174	Rotulo morado resistente al agua	vini-color	8393	15
600	Vinilo verde	40	3495	Vinilo verde fácil de aplicar	vini-metalico	2875	2
601	Calcomanía morado	13	14215	Calcomanía morado ideal para exteriores	vini-metalico	13403	4
602	Etiqueta azul	18	11871	Etiqueta azul uso profesional	vini-color	11475	2
603	Vinilo naranja	89	7437	Vinilo naranja para decoración de interiores	vini-metalico	7326	5
604	Papel adhesivo negro	63	5574	Papel adhesivo negro resistente al agua	vini-mate	4704	8
605	Etiqueta blanco	5	3861	Etiqueta blanco ideal para exteriores	vini-color	3164	20
606	Calcomanía negro	60	2424	Calcomanía negro ideal para exteriores	vini-textura	2097	14
607	Pegatina morado	38	3083	Pegatina morado duradero y versátil	vini-color	2978	18
608	Etiqueta amarillo	68	9939	Etiqueta amarillo fácil de aplicar	vini-textura	9209	20
609	Rotulo amarillo	76	9139	Rotulo amarillo resistente al agua	vini-color	8794	8
610	Sticker morado	76	14327	Sticker morado duradero y versátil	vini-mate	13808	16
611	Sticker rojo	42	8383	Sticker rojo ideal para exteriores	vini-mate	7977	15
612	Etiqueta azul	89	13619	Etiqueta azul ideal para exteriores	vini-metalico	12682	13
613	Etiqueta azul	58	14578	Etiqueta azul fácil de aplicar	vini-mate	14390	19
614	Sticker amarillo	59	6376	Sticker amarillo duradero y versátil	vini-mate	5921	16
615	Rotulo morado	96	10791	Rotulo morado resistente al agua	vini-mate	10659	2
616	Calcomanía amarillo	48	5195	Calcomanía amarillo fácil de aplicar	vini-textura	4669	8
617	Vinilo rojo	40	5139	Vinilo rojo para decoración de interiores	vini-mate	4599	17
618	Sticker naranja	60	6173	Sticker naranja resistente al agua	vini-metalico	5431	17
619	Papel adhesivo blanco	34	11053	Papel adhesivo blanco ideal para exteriores	vini-mate	10054	14
620	Vinilo negro	34	14070	Vinilo negro uso profesional	vini-metalico	13905	7
621	Pegatina naranja	83	2387	Pegatina naranja ideal para exteriores	vini-mate	2056	4
622	Papel adhesivo azul	8	6540	Papel adhesivo azul duradero y versátil	vini-metalico	5888	6
623	Vinilo verde	12	13227	Vinilo verde para decoración de interiores	vini-color	12928	12
624	Rotulo rojo	42	8186	Rotulo rojo ideal para exteriores	vini-mate	7641	15
625	Papel adhesivo morado	35	14217	Papel adhesivo morado resistente al agua	vini-metalico	13545	3
626	Pegatina amarillo	94	4036	Pegatina amarillo uso profesional	vini-metalico	3117	17
627	Papel adhesivo morado	55	7139	Papel adhesivo morado para decoración de interiores	vini-metalico	6912	17
628	Papel adhesivo naranja	9	6430	Papel adhesivo naranja para decoración de interiores	vini-metalico	5804	13
629	Sticker azul	89	8678	Sticker azul duradero y versátil	vini-mate	7725	19
630	Pegatina negro	59	10504	Pegatina negro resistente al agua	vini-color	10368	15
631	Papel adhesivo naranja	12	2785	Papel adhesivo naranja para decoración de interiores	vini-color	2093	2
632	Sticker rojo	42	10603	Sticker rojo duradero y versátil	vini-mate	10320	17
633	Rotulo blanco	98	4923	Rotulo blanco ideal para exteriores	vini-mate	4807	6
634	Vinilo amarillo	7	11172	Vinilo amarillo ideal para exteriores	vini-textura	10513	19
635	Pegatina naranja	32	3255	Pegatina naranja ideal para exteriores	vini-mate	2853	19
636	Sticker negro	7	8209	Sticker negro ideal para exteriores	vini-metalico	7643	2
637	Papel adhesivo negro	61	14259	Papel adhesivo negro uso profesional	vini-metalico	13665	3
638	Pegatina negro	13	11934	Pegatina negro fácil de aplicar	vini-mate	11367	17
639	Sticker rojo	83	9892	Sticker rojo resistente al agua	vini-mate	9518	8
640	Rotulo amarillo	73	13975	Rotulo amarillo duradero y versátil	vini-textura	13697	9
641	Sticker negro	92	7325	Sticker negro ideal para exteriores	vini-mate	6907	2
642	Papel adhesivo morado	7	14238	Papel adhesivo morado para decoración de interiores	vini-color	13238	8
643	Pegatina morado	37	5060	Pegatina morado para decoración de interiores	vini-metalico	4859	3
644	Rotulo morado	43	4478	Rotulo morado para decoración de interiores	vini-color	3512	1
645	Pegatina amarillo	85	2650	Pegatina amarillo fácil de aplicar	vini-metalico	2512	6
646	Rotulo blanco	82	9731	Rotulo blanco ideal para exteriores	vini-mate	9523	1
647	Calcomanía naranja	40	7022	Calcomanía naranja resistente al agua	vini-mate	6351	7
648	Pegatina azul	67	9464	Pegatina azul duradero y versátil	vini-metalico	9220	20
649	Sticker verde	47	11470	Sticker verde ideal para exteriores	vini-mate	10706	14
650	Pegatina morado	11	4648	Pegatina morado para decoración de interiores	vini-metalico	3648	19
651	Vinilo negro	57	5094	Vinilo negro ideal para exteriores	vini-mate	4199	2
652	Vinilo rojo	63	11610	Vinilo rojo resistente al agua	vini-metalico	11488	19
653	Etiqueta morado	41	9746	Etiqueta morado fácil de aplicar	vini-textura	8831	5
654	Sticker negro	74	14405	Sticker negro ideal para exteriores	vini-textura	13571	16
655	Etiqueta naranja	60	8966	Etiqueta naranja uso profesional	vini-textura	8365	4
656	Pegatina morado	41	4872	Pegatina morado para decoración de interiores	vini-textura	4511	9
657	Sticker amarillo	48	6955	Sticker amarillo ideal para exteriores	vini-metalico	6388	11
658	Etiqueta azul	75	3758	Etiqueta azul ideal para exteriores	vini-color	3047	6
659	Etiqueta amarillo	45	2990	Etiqueta amarillo resistente al agua	vini-mate	2580	10
660	Calcomanía amarillo	66	9466	Calcomanía amarillo ideal para exteriores	vini-metalico	8806	15
661	Etiqueta verde	8	4598	Etiqueta verde para decoración de interiores	vini-mate	4239	4
662	Vinilo negro	80	3067	Vinilo negro fácil de aplicar	vini-mate	2159	17
663	Papel adhesivo azul	15	13316	Papel adhesivo azul ideal para exteriores	vini-color	13095	20
664	Rotulo negro	25	7556	Rotulo negro ideal para exteriores	vini-textura	6989	16
665	Vinilo negro	67	4964	Vinilo negro ideal para exteriores	vini-metalico	4859	10
666	Rotulo rojo	49	9261	Rotulo rojo resistente al agua	vini-metalico	8267	15
667	Vinilo morado	41	7435	Vinilo morado fácil de aplicar	vini-textura	6438	15
668	Pegatina blanco	42	3528	Pegatina blanco ideal para exteriores	vini-mate	3025	13
669	Rotulo naranja	17	4175	Rotulo naranja duradero y versátil	vini-color	3719	20
670	Vinilo amarillo	15	3568	Vinilo amarillo para decoración de interiores	vini-color	2791	5
671	Etiqueta rojo	85	10446	Etiqueta rojo resistente al agua	vini-color	9486	7
672	Sticker verde	36	6986	Sticker verde fácil de aplicar	vini-metalico	6371	2
673	Papel adhesivo amarillo	57	8456	Papel adhesivo amarillo fácil de aplicar	vini-textura	7456	17
674	Vinilo naranja	13	7616	Vinilo naranja resistente al agua	vini-color	7291	7
675	Calcomanía naranja	39	2553	Calcomanía naranja resistente al agua	vini-textura	1728	9
676	Rotulo negro	86	6111	Rotulo negro duradero y versátil	vini-metalico	5663	1
677	Rotulo amarillo	20	10752	Rotulo amarillo duradero y versátil	vini-metalico	10527	7
678	Etiqueta blanco	56	12197	Etiqueta blanco duradero y versátil	vini-metalico	11908	9
679	Etiqueta verde	62	7600	Etiqueta verde duradero y versátil	vini-color	7035	14
680	Papel adhesivo azul	39	2462	Papel adhesivo azul para decoración de interiores	vini-color	2113	18
681	Etiqueta naranja	81	8885	Etiqueta naranja fácil de aplicar	vini-textura	8725	1
682	Pegatina blanco	62	2146	Pegatina blanco ideal para exteriores	vini-mate	1954	7
683	Etiqueta negro	97	11984	Etiqueta negro duradero y versátil	vini-metalico	11180	7
684	Vinilo blanco	80	3037	Vinilo blanco para decoración de interiores	vini-metalico	2645	18
685	Rotulo verde	87	5821	Rotulo verde resistente al agua	vini-metalico	5287	5
686	Rotulo amarillo	98	13869	Rotulo amarillo resistente al agua	vini-metalico	13186	18
687	Pegatina naranja	17	5940	Pegatina naranja uso profesional	vini-color	5459	7
688	Vinilo amarillo	41	8996	Vinilo amarillo uso profesional	vini-metalico	8174	3
689	Pegatina verde	77	9487	Pegatina verde para decoración de interiores	vini-mate	8638	14
690	Papel adhesivo blanco	98	6768	Papel adhesivo blanco resistente al agua	vini-color	6141	6
691	Papel adhesivo blanco	17	6180	Papel adhesivo blanco uso profesional	vini-color	6053	13
692	Rotulo azul	73	9762	Rotulo azul resistente al agua	vini-color	9287	5
693	Etiqueta rojo	58	3275	Etiqueta rojo duradero y versátil	vini-metalico	2737	8
694	Rotulo negro	91	9648	Rotulo negro fácil de aplicar	vini-color	9109	12
695	Etiqueta naranja	75	13361	Etiqueta naranja para decoración de interiores	vini-color	12381	4
696	Etiqueta verde	38	10334	Etiqueta verde para decoración de interiores	vini-metalico	10008	10
697	Rotulo morado	86	13352	Rotulo morado resistente al agua	vini-textura	12869	17
698	Sticker rojo	36	12535	Sticker rojo fácil de aplicar	vini-textura	12410	6
699	Papel adhesivo rojo	31	2128	Papel adhesivo rojo fácil de aplicar	vini-mate	1589	9
700	Pegatina morado	93	13119	Pegatina morado fácil de aplicar	vini-metalico	12464	19
701	Rotulo blanco	55	2403	Rotulo blanco resistente al agua	vini-textura	1407	17
702	Pegatina amarillo	20	4829	Pegatina amarillo ideal para exteriores	vini-textura	4400	5
703	Calcomanía amarillo	25	11386	Calcomanía amarillo uso profesional	vini-textura	10689	1
704	Etiqueta rojo	58	10458	Etiqueta rojo duradero y versátil	vini-mate	9945	4
705	Pegatina azul	43	6182	Pegatina azul duradero y versátil	vini-mate	5831	18
706	Vinilo amarillo	49	4473	Vinilo amarillo ideal para exteriores	vini-mate	4175	13
707	Etiqueta azul	7	8185	Etiqueta azul fácil de aplicar	vini-color	7209	11
708	Vinilo morado	27	7442	Vinilo morado duradero y versátil	vini-color	6930	8
709	Sticker azul	5	13629	Sticker azul resistente al agua	vini-textura	12706	6
710	Papel adhesivo azul	19	14042	Papel adhesivo azul ideal para exteriores	vini-mate	13497	12
711	Sticker naranja	22	13841	Sticker naranja uso profesional	vini-metalico	13496	11
712	Vinilo azul	47	7472	Vinilo azul uso profesional	vini-metalico	7335	1
713	Calcomanía amarillo	65	9232	Calcomanía amarillo para decoración de interiores	vini-mate	8504	19
714	Pegatina amarillo	48	4391	Pegatina amarillo duradero y versátil	vini-metalico	4280	3
715	Etiqueta amarillo	39	9741	Etiqueta amarillo duradero y versátil	vini-metalico	9507	10
716	Calcomanía azul	15	4123	Calcomanía azul resistente al agua	vini-textura	3334	4
717	Papel adhesivo blanco	57	9522	Papel adhesivo blanco para decoración de interiores	vini-mate	8970	20
718	Sticker azul	32	6159	Sticker azul resistente al agua	vini-metalico	5755	5
719	Etiqueta rojo	9	5853	Etiqueta rojo resistente al agua	vini-mate	5168	7
720	Calcomanía verde	58	6877	Calcomanía verde duradero y versátil	vini-color	6285	15
721	Etiqueta negro	53	13617	Etiqueta negro resistente al agua	vini-metalico	13291	6
722	Calcomanía negro	67	9868	Calcomanía negro resistente al agua	vini-mate	8977	6
723	Sticker negro	15	5822	Sticker negro fácil de aplicar	vini-textura	5182	5
724	Pegatina amarillo	33	2485	Pegatina amarillo para decoración de interiores	vini-mate	1863	1
725	Etiqueta rojo	82	12703	Etiqueta rojo duradero y versátil	vini-mate	12491	2
726	Rotulo naranja	62	7415	Rotulo naranja ideal para exteriores	vini-mate	6801	11
727	Etiqueta naranja	17	7567	Etiqueta naranja duradero y versátil	vini-color	6662	12
728	Sticker naranja	78	4783	Sticker naranja uso profesional	vini-metalico	4318	15
729	Papel adhesivo amarillo	96	7525	Papel adhesivo amarillo resistente al agua	vini-metalico	6738	12
730	Etiqueta azul	94	4374	Etiqueta azul para decoración de interiores	vini-textura	3815	11
731	Pegatina amarillo	41	12093	Pegatina amarillo resistente al agua	vini-color	11537	1
732	Vinilo amarillo	83	6715	Vinilo amarillo uso profesional	vini-textura	5821	2
733	Vinilo morado	57	4418	Vinilo morado resistente al agua	vini-metalico	3989	12
734	Rotulo blanco	68	12830	Rotulo blanco ideal para exteriores	vini-color	11886	9
735	Rotulo blanco	74	7432	Rotulo blanco uso profesional	vini-mate	6895	5
736	Vinilo negro	7	12363	Vinilo negro fácil de aplicar	vini-color	11546	13
737	Pegatina blanco	79	8226	Pegatina blanco resistente al agua	vini-textura	7813	3
738	Sticker amarillo	68	14417	Sticker amarillo duradero y versátil	vini-mate	13880	15
739	Calcomanía amarillo	60	7788	Calcomanía amarillo uso profesional	vini-metalico	7309	16
740	Papel adhesivo negro	35	5885	Papel adhesivo negro resistente al agua	vini-metalico	5646	1
741	Sticker azul	78	13831	Sticker azul resistente al agua	vini-mate	13469	12
742	Sticker negro	69	4953	Sticker negro fácil de aplicar	vini-metalico	4190	6
743	Etiqueta verde	52	3748	Etiqueta verde para decoración de interiores	vini-metalico	2785	18
744	Sticker rojo	7	10889	Sticker rojo fácil de aplicar	vini-color	10747	11
745	Etiqueta negro	19	14824	Etiqueta negro duradero y versátil	vini-metalico	14400	1
746	Papel adhesivo negro	99	14439	Papel adhesivo negro para decoración de interiores	vini-mate	14297	1
747	Papel adhesivo rojo	49	2061	Papel adhesivo rojo fácil de aplicar	vini-color	1871	9
748	Rotulo negro	59	2752	Rotulo negro ideal para exteriores	vini-textura	2488	12
749	Vinilo blanco	70	11205	Vinilo blanco uso profesional	vini-mate	10484	4
750	Pegatina morado	20	8322	Pegatina morado uso profesional	vini-textura	8166	18
751	Papel adhesivo negro	85	10302	Papel adhesivo negro duradero y versátil	vini-textura	9941	7
752	Pegatina verde	65	14667	Pegatina verde uso profesional	vini-metalico	14085	16
753	Sticker morado	62	2287	Sticker morado ideal para exteriores	vini-metalico	1553	19
754	Calcomanía naranja	98	8366	Calcomanía naranja para decoración de interiores	vini-mate	7386	12
755	Sticker verde	53	3014	Sticker verde ideal para exteriores	vini-mate	2678	1
756	Sticker azul	29	14033	Sticker azul fácil de aplicar	vini-mate	13486	15
757	Rotulo negro	87	9428	Rotulo negro ideal para exteriores	vini-textura	9098	16
758	Rotulo morado	83	12520	Rotulo morado uso profesional	vini-metalico	11525	6
759	Papel adhesivo rojo	42	12605	Papel adhesivo rojo ideal para exteriores	vini-color	11956	15
760	Rotulo naranja	35	11181	Rotulo naranja duradero y versátil	vini-metalico	10982	20
761	Vinilo azul	92	13667	Vinilo azul uso profesional	vini-metalico	13382	2
762	Pegatina naranja	38	8206	Pegatina naranja resistente al agua	vini-metalico	7863	4
763	Pegatina amarillo	61	10951	Pegatina amarillo para decoración de interiores	vini-textura	10029	11
764	Rotulo morado	41	14627	Rotulo morado duradero y versátil	vini-mate	14443	3
765	Pegatina verde	56	14984	Pegatina verde uso profesional	vini-color	14754	15
766	Vinilo amarillo	57	5061	Vinilo amarillo fácil de aplicar	vini-textura	4870	20
767	Rotulo blanco	89	13813	Rotulo blanco fácil de aplicar	vini-textura	13491	15
768	Calcomanía amarillo	87	13734	Calcomanía amarillo fácil de aplicar	vini-metalico	12945	7
769	Rotulo morado	58	6868	Rotulo morado fácil de aplicar	vini-mate	6128	2
770	Rotulo negro	76	5741	Rotulo negro duradero y versátil	vini-textura	5568	5
771	Sticker verde	34	4569	Sticker verde ideal para exteriores	vini-color	3885	8
772	Rotulo naranja	5	12112	Rotulo naranja fácil de aplicar	vini-mate	11627	5
773	Pegatina rojo	22	10079	Pegatina rojo uso profesional	vini-textura	9678	2
774	Papel adhesivo verde	96	2386	Papel adhesivo verde para decoración de interiores	vini-metalico	1584	16
775	Sticker blanco	92	9176	Sticker blanco para decoración de interiores	vini-metalico	8335	17
776	Etiqueta blanco	82	6009	Etiqueta blanco uso profesional	vini-metalico	5456	7
777	Sticker verde	29	13518	Sticker verde resistente al agua	vini-metalico	12567	9
778	Rotulo naranja	38	12646	Rotulo naranja ideal para exteriores	vini-mate	11782	3
779	Rotulo negro	86	13971	Rotulo negro uso profesional	vini-mate	13551	9
780	Sticker azul	69	7937	Sticker azul fácil de aplicar	vini-mate	7644	6
781	Papel adhesivo negro	99	5130	Papel adhesivo negro para decoración de interiores	vini-mate	4834	13
782	Papel adhesivo rojo	53	5566	Papel adhesivo rojo uso profesional	vini-metalico	4600	10
783	Vinilo rojo	71	13415	Vinilo rojo resistente al agua	vini-mate	12756	18
784	Sticker verde	73	8325	Sticker verde para decoración de interiores	vini-textura	7792	11
785	Calcomanía verde	73	11713	Calcomanía verde uso profesional	vini-color	11495	1
786	Papel adhesivo naranja	62	5261	Papel adhesivo naranja resistente al agua	vini-textura	5147	2
787	Sticker verde	92	12431	Sticker verde para decoración de interiores	vini-metalico	11442	4
788	Pegatina negro	73	10850	Pegatina negro resistente al agua	vini-textura	10177	13
789	Pegatina amarillo	65	2552	Pegatina amarillo ideal para exteriores	vini-color	2032	15
790	Vinilo negro	63	8769	Vinilo negro ideal para exteriores	vini-color	8235	5
791	Calcomanía naranja	76	14663	Calcomanía naranja fácil de aplicar	vini-textura	13929	1
792	Etiqueta azul	80	9776	Etiqueta azul ideal para exteriores	vini-metalico	9528	16
793	Sticker negro	59	9151	Sticker negro fácil de aplicar	vini-textura	8721	5
794	Calcomanía blanco	16	9286	Calcomanía blanco duradero y versátil	vini-textura	8588	11
795	Papel adhesivo negro	18	10182	Papel adhesivo negro uso profesional	vini-color	10052	9
796	Papel adhesivo rojo	56	8553	Papel adhesivo rojo uso profesional	vini-metalico	7920	16
797	Calcomanía azul	62	4914	Calcomanía azul para decoración de interiores	vini-mate	3976	14
798	Sticker azul	26	8004	Sticker azul uso profesional	vini-mate	7004	15
799	Etiqueta negro	79	10893	Etiqueta negro fácil de aplicar	vini-mate	10193	5
800	Etiqueta verde	95	2018	Etiqueta verde duradero y versátil	vini-metalico	1325	15
801	Pegatina naranja	33	2039	Pegatina naranja resistente al agua	vini-textura	1173	14
802	Etiqueta negro	37	13196	Etiqueta negro resistente al agua	vini-mate	13089	6
803	Rotulo amarillo	36	4223	Rotulo amarillo uso profesional	vini-mate	3935	20
804	Sticker amarillo	6	5645	Sticker amarillo uso profesional	vini-textura	4972	16
805	Etiqueta rojo	88	2395	Etiqueta rojo duradero y versátil	vini-color	1737	6
806	Etiqueta amarillo	43	4385	Etiqueta amarillo para decoración de interiores	vini-metalico	3796	11
807	Pegatina blanco	28	14586	Pegatina blanco ideal para exteriores	vini-color	13852	19
808	Vinilo blanco	94	2226	Vinilo blanco uso profesional	vini-color	2079	10
809	Rotulo negro	84	10115	Rotulo negro resistente al agua	vini-metalico	9978	1
810	Rotulo verde	78	4372	Rotulo verde fácil de aplicar	vini-metalico	3553	13
811	Sticker negro	83	2078	Sticker negro para decoración de interiores	vini-mate	1193	19
812	Vinilo morado	67	3433	Vinilo morado duradero y versátil	vini-color	3046	3
813	Calcomanía amarillo	41	9444	Calcomanía amarillo para decoración de interiores	vini-textura	9279	10
814	Rotulo verde	43	6818	Rotulo verde fácil de aplicar	vini-mate	6385	18
815	Papel adhesivo amarillo	14	2308	Papel adhesivo amarillo fácil de aplicar	vini-metalico	1636	19
816	Pegatina amarillo	60	14371	Pegatina amarillo ideal para exteriores	vini-textura	13785	9
817	Calcomanía negro	47	7003	Calcomanía negro uso profesional	vini-textura	6111	7
818	Sticker rojo	50	14875	Sticker rojo fácil de aplicar	vini-metalico	14551	20
819	Vinilo amarillo	48	10130	Vinilo amarillo duradero y versátil	vini-mate	9919	10
820	Papel adhesivo negro	84	4457	Papel adhesivo negro fácil de aplicar	vini-color	3827	5
821	Sticker amarillo	73	5277	Sticker amarillo para decoración de interiores	vini-mate	4910	17
822	Rotulo azul	12	7922	Rotulo azul resistente al agua	vini-color	7417	3
823	Rotulo blanco	38	8620	Rotulo blanco uso profesional	vini-metalico	7884	13
824	Rotulo naranja	41	9737	Rotulo naranja fácil de aplicar	vini-mate	8869	2
825	Calcomanía verde	69	4074	Calcomanía verde resistente al agua	vini-metalico	3530	2
826	Pegatina verde	66	4256	Pegatina verde duradero y versátil	vini-color	3596	4
827	Rotulo blanco	12	12854	Rotulo blanco uso profesional	vini-mate	12107	6
828	Calcomanía verde	27	9174	Calcomanía verde ideal para exteriores	vini-color	8269	19
829	Calcomanía morado	51	6958	Calcomanía morado para decoración de interiores	vini-mate	6451	4
830	Calcomanía amarillo	12	11521	Calcomanía amarillo uso profesional	vini-metalico	10860	8
831	Etiqueta azul	22	5092	Etiqueta azul ideal para exteriores	vini-color	4965	4
832	Rotulo naranja	35	12389	Rotulo naranja para decoración de interiores	vini-color	11911	6
833	Etiqueta naranja	33	11638	Etiqueta naranja fácil de aplicar	vini-textura	11394	17
834	Vinilo verde	16	13101	Vinilo verde para decoración de interiores	vini-mate	12267	9
835	Vinilo verde	74	14434	Vinilo verde resistente al agua	vini-mate	13612	17
836	Calcomanía blanco	80	11315	Calcomanía blanco fácil de aplicar	vini-metalico	11124	8
837	Pegatina azul	52	6782	Pegatina azul fácil de aplicar	vini-metalico	5870	15
838	Calcomanía amarillo	97	2559	Calcomanía amarillo uso profesional	vini-mate	1839	15
839	Etiqueta amarillo	84	14903	Etiqueta amarillo resistente al agua	vini-textura	14507	8
840	Calcomanía morado	87	9143	Calcomanía morado uso profesional	vini-metalico	8196	4
841	Vinilo blanco	56	14077	Vinilo blanco resistente al agua	vini-metalico	13590	3
842	Sticker verde	11	13454	Sticker verde duradero y versátil	vini-textura	13326	5
843	Pegatina naranja	21	9508	Pegatina naranja resistente al agua	vini-metalico	8782	20
844	Sticker morado	56	9119	Sticker morado resistente al agua	vini-mate	8501	5
845	Pegatina negro	27	6480	Pegatina negro fácil de aplicar	vini-textura	6276	20
846	Etiqueta rojo	21	13288	Etiqueta rojo duradero y versátil	vini-metalico	12430	12
847	Pegatina naranja	23	3059	Pegatina naranja uso profesional	vini-mate	2151	18
848	Papel adhesivo naranja	70	9550	Papel adhesivo naranja duradero y versátil	vini-color	9015	20
849	Sticker amarillo	12	14806	Sticker amarillo fácil de aplicar	vini-textura	14357	20
850	Vinilo amarillo	78	5141	Vinilo amarillo duradero y versátil	vini-mate	4258	6
851	Pegatina amarillo	92	2706	Pegatina amarillo para decoración de interiores	vini-textura	1990	15
852	Pegatina verde	82	10883	Pegatina verde fácil de aplicar	vini-textura	9887	4
853	Rotulo amarillo	40	3681	Rotulo amarillo uso profesional	vini-color	3189	10
854	Calcomanía blanco	22	8208	Calcomanía blanco duradero y versátil	vini-mate	7766	18
855	Etiqueta blanco	42	4344	Etiqueta blanco uso profesional	vini-color	3748	8
856	Vinilo azul	82	5313	Vinilo azul para decoración de interiores	vini-metalico	4585	17
857	Pegatina morado	46	12145	Pegatina morado fácil de aplicar	vini-metalico	12025	14
858	Rotulo azul	84	13522	Rotulo azul uso profesional	vini-mate	12963	10
859	Rotulo amarillo	80	13830	Rotulo amarillo fácil de aplicar	vini-color	13124	6
860	Vinilo amarillo	36	5219	Vinilo amarillo duradero y versátil	vini-mate	4429	7
861	Vinilo naranja	82	8066	Vinilo naranja resistente al agua	vini-mate	7152	19
862	Rotulo azul	84	3078	Rotulo azul duradero y versátil	vini-mate	2841	16
863	Rotulo naranja	62	4417	Rotulo naranja uso profesional	vini-metalico	4315	4
864	Vinilo blanco	8	13485	Vinilo blanco fácil de aplicar	vini-textura	13112	20
865	Rotulo naranja	41	8150	Rotulo naranja uso profesional	vini-metalico	7534	5
866	Etiqueta naranja	25	9350	Etiqueta naranja resistente al agua	vini-textura	8590	9
867	Papel adhesivo morado	48	3370	Papel adhesivo morado ideal para exteriores	vini-mate	2397	1
868	Papel adhesivo negro	21	6211	Papel adhesivo negro ideal para exteriores	vini-textura	5912	14
869	Rotulo blanco	41	11767	Rotulo blanco para decoración de interiores	vini-color	11025	8
870	Rotulo naranja	100	2388	Rotulo naranja para decoración de interiores	vini-textura	1825	4
871	Rotulo amarillo	96	13854	Rotulo amarillo resistente al agua	vini-metalico	13046	10
872	Etiqueta rojo	27	5155	Etiqueta rojo ideal para exteriores	vini-color	4475	6
873	Rotulo morado	44	8992	Rotulo morado duradero y versátil	vini-mate	8872	17
874	Rotulo azul	36	5160	Rotulo azul uso profesional	vini-metalico	4335	13
875	Pegatina naranja	25	12730	Pegatina naranja resistente al agua	vini-textura	12223	16
876	Rotulo verde	18	7873	Rotulo verde fácil de aplicar	vini-metalico	7558	2
877	Etiqueta amarillo	86	6924	Etiqueta amarillo para decoración de interiores	vini-metalico	6760	3
878	Sticker verde	19	7556	Sticker verde uso profesional	vini-color	6779	6
879	Calcomanía azul	72	12055	Calcomanía azul resistente al agua	vini-metalico	11654	6
880	Rotulo verde	21	9966	Rotulo verde para decoración de interiores	vini-color	9463	18
881	Papel adhesivo blanco	19	6428	Papel adhesivo blanco uso profesional	vini-color	6119	2
882	Vinilo naranja	5	10300	Vinilo naranja uso profesional	vini-color	9926	1
883	Rotulo blanco	70	5565	Rotulo blanco duradero y versátil	vini-metalico	4895	19
884	Vinilo blanco	75	5187	Vinilo blanco uso profesional	vini-textura	4889	3
885	Etiqueta rojo	86	7726	Etiqueta rojo para decoración de interiores	vini-mate	7598	3
886	Pegatina azul	40	9006	Pegatina azul duradero y versátil	vini-color	8396	11
887	Vinilo rojo	47	7500	Vinilo rojo resistente al agua	vini-mate	7191	18
888	Sticker amarillo	46	6493	Sticker amarillo uso profesional	vini-color	5594	7
889	Rotulo negro	35	3696	Rotulo negro fácil de aplicar	vini-color	2697	15
890	Vinilo morado	67	11648	Vinilo morado ideal para exteriores	vini-metalico	11312	17
891	Papel adhesivo morado	32	12261	Papel adhesivo morado resistente al agua	vini-metalico	11885	2
892	Sticker azul	53	6661	Sticker azul duradero y versátil	vini-metalico	5682	11
893	Sticker negro	57	12611	Sticker negro ideal para exteriores	vini-metalico	12499	5
894	Etiqueta amarillo	59	5573	Etiqueta amarillo resistente al agua	vini-mate	5306	11
895	Sticker naranja	89	8007	Sticker naranja fácil de aplicar	vini-textura	7079	9
896	Vinilo verde	10	11879	Vinilo verde ideal para exteriores	vini-mate	11381	20
897	Sticker blanco	39	8729	Sticker blanco ideal para exteriores	vini-textura	8229	3
898	Rotulo naranja	64	12454	Rotulo naranja duradero y versátil	vini-color	12018	15
899	Pegatina naranja	57	3470	Pegatina naranja ideal para exteriores	vini-textura	3179	7
900	Vinilo morado	83	11327	Vinilo morado duradero y versátil	vini-color	10696	11
901	Calcomanía verde	34	11593	Calcomanía verde ideal para exteriores	vini-mate	10837	7
902	Pegatina naranja	7	3810	Pegatina naranja fácil de aplicar	vini-metalico	2829	2
903	Etiqueta verde	23	8477	Etiqueta verde fácil de aplicar	vini-textura	7883	14
904	Pegatina naranja	79	7292	Pegatina naranja resistente al agua	vini-mate	6544	13
905	Vinilo naranja	98	13278	Vinilo naranja resistente al agua	vini-mate	12892	1
906	Pegatina azul	19	11638	Pegatina azul uso profesional	vini-mate	10946	2
907	Pegatina amarillo	65	3990	Pegatina amarillo duradero y versátil	vini-color	3006	1
908	Vinilo morado	78	7160	Vinilo morado resistente al agua	vini-textura	6183	6
909	Pegatina morado	72	11109	Pegatina morado uso profesional	vini-textura	10383	18
910	Etiqueta verde	11	11096	Etiqueta verde resistente al agua	vini-textura	10709	17
911	Pegatina amarillo	89	2263	Pegatina amarillo fácil de aplicar	vini-mate	1579	16
912	Sticker naranja	8	13986	Sticker naranja fácil de aplicar	vini-color	13384	9
913	Sticker morado	13	9582	Sticker morado resistente al agua	vini-metalico	8903	5
914	Etiqueta amarillo	60	4700	Etiqueta amarillo duradero y versátil	vini-metalico	4270	9
915	Calcomanía morado	68	5096	Calcomanía morado duradero y versátil	vini-textura	4681	13
916	Calcomanía amarillo	31	13144	Calcomanía amarillo ideal para exteriores	vini-mate	12561	20
917	Vinilo morado	82	8564	Vinilo morado uso profesional	vini-color	8278	11
918	Etiqueta blanco	89	2387	Etiqueta blanco duradero y versátil	vini-metalico	1421	4
919	Pegatina rojo	99	14157	Pegatina rojo resistente al agua	vini-metalico	14043	12
920	Sticker negro	53	11276	Sticker negro uso profesional	vini-metalico	11094	18
921	Papel adhesivo azul	38	14829	Papel adhesivo azul fácil de aplicar	vini-mate	14073	11
922	Papel adhesivo negro	16	5669	Papel adhesivo negro ideal para exteriores	vini-color	5367	15
923	Etiqueta morado	45	9034	Etiqueta morado uso profesional	vini-textura	8615	20
924	Vinilo negro	84	7332	Vinilo negro fácil de aplicar	vini-color	6419	15
925	Etiqueta blanco	50	9465	Etiqueta blanco ideal para exteriores	vini-textura	8706	10
926	Pegatina rojo	50	6930	Pegatina rojo uso profesional	vini-color	6766	19
927	Sticker verde	63	3578	Sticker verde ideal para exteriores	vini-metalico	2655	12
928	Vinilo morado	33	6790	Vinilo morado para decoración de interiores	vini-color	6098	19
929	Vinilo rojo	35	13394	Vinilo rojo fácil de aplicar	vini-metalico	12944	16
930	Etiqueta amarillo	91	4226	Etiqueta amarillo uso profesional	vini-metalico	3712	18
931	Etiqueta negro	70	11808	Etiqueta negro ideal para exteriores	vini-mate	11225	2
932	Calcomanía verde	29	14007	Calcomanía verde fácil de aplicar	vini-color	13755	1
933	Calcomanía naranja	83	8739	Calcomanía naranja ideal para exteriores	vini-textura	8537	6
934	Pegatina naranja	81	14011	Pegatina naranja ideal para exteriores	vini-textura	13643	6
935	Etiqueta naranja	29	9860	Etiqueta naranja resistente al agua	vini-metalico	9433	20
936	Sticker amarillo	81	2104	Sticker amarillo resistente al agua	vini-color	1107	17
937	Vinilo verde	73	7501	Vinilo verde ideal para exteriores	vini-color	6589	4
938	Calcomanía amarillo	43	10323	Calcomanía amarillo uso profesional	vini-color	9536	9
939	Pegatina naranja	40	2877	Pegatina naranja para decoración de interiores	vini-color	2171	15
940	Pegatina blanco	44	7255	Pegatina blanco uso profesional	vini-textura	7003	6
941	Calcomanía azul	76	9586	Calcomanía azul fácil de aplicar	vini-metalico	8973	11
942	Etiqueta amarillo	73	9476	Etiqueta amarillo uso profesional	vini-mate	9212	17
943	Rotulo amarillo	34	6961	Rotulo amarillo duradero y versátil	vini-textura	6102	9
944	Calcomanía naranja	49	3092	Calcomanía naranja fácil de aplicar	vini-metalico	2418	12
945	Rotulo morado	56	5966	Rotulo morado para decoración de interiores	vini-mate	5831	3
946	Pegatina negro	26	4827	Pegatina negro duradero y versátil	vini-color	4263	4
947	Papel adhesivo rojo	56	2624	Papel adhesivo rojo fácil de aplicar	vini-mate	1836	13
948	Calcomanía rojo	36	14603	Calcomanía rojo fácil de aplicar	vini-mate	14157	7
949	Calcomanía naranja	25	7986	Calcomanía naranja ideal para exteriores	vini-color	7769	6
950	Pegatina blanco	59	13462	Pegatina blanco uso profesional	vini-metalico	12730	1
951	Papel adhesivo negro	78	9759	Papel adhesivo negro uso profesional	vini-mate	9055	4
952	Papel adhesivo naranja	73	11106	Papel adhesivo naranja para decoración de interiores	vini-metalico	10475	11
953	Sticker morado	77	5778	Sticker morado uso profesional	vini-textura	4939	19
954	Rotulo amarillo	100	3872	Rotulo amarillo uso profesional	vini-metalico	3335	5
955	Calcomanía negro	15	12943	Calcomanía negro resistente al agua	vini-metalico	12464	20
956	Vinilo amarillo	40	3773	Vinilo amarillo duradero y versátil	vini-textura	3609	12
957	Calcomanía naranja	86	13323	Calcomanía naranja para decoración de interiores	vini-mate	13173	11
958	Papel adhesivo azul	21	12041	Papel adhesivo azul resistente al agua	vini-textura	11293	2
959	Rotulo amarillo	68	14764	Rotulo amarillo uso profesional	vini-color	13861	12
960	Rotulo negro	43	4011	Rotulo negro ideal para exteriores	vini-metalico	3843	4
961	Vinilo amarillo	23	3243	Vinilo amarillo para decoración de interiores	vini-textura	2364	16
962	Papel adhesivo morado	22	10868	Papel adhesivo morado fácil de aplicar	vini-metalico	10153	14
963	Vinilo naranja	37	14798	Vinilo naranja uso profesional	vini-color	14232	18
964	Sticker rojo	77	12430	Sticker rojo para decoración de interiores	vini-textura	12171	1
965	Papel adhesivo morado	97	2443	Papel adhesivo morado ideal para exteriores	vini-mate	1491	3
966	Pegatina amarillo	78	8041	Pegatina amarillo duradero y versátil	vini-mate	7457	7
967	Papel adhesivo rojo	51	4619	Papel adhesivo rojo para decoración de interiores	vini-color	3688	9
968	Sticker morado	62	3118	Sticker morado resistente al agua	vini-mate	2503	16
969	Etiqueta azul	66	5681	Etiqueta azul resistente al agua	vini-metalico	4801	6
970	Papel adhesivo azul	56	7019	Papel adhesivo azul fácil de aplicar	vini-color	6595	2
971	Sticker verde	37	6753	Sticker verde duradero y versátil	vini-metalico	6014	14
972	Pegatina morado	46	9508	Pegatina morado ideal para exteriores	vini-mate	8838	20
973	Calcomanía naranja	6	2557	Calcomanía naranja ideal para exteriores	vini-mate	2352	19
974	Calcomanía verde	6	2758	Calcomanía verde uso profesional	vini-mate	2381	12
975	Rotulo negro	81	11734	Rotulo negro duradero y versátil	vini-color	11155	11
976	Vinilo morado	9	8741	Vinilo morado ideal para exteriores	vini-color	8559	18
977	Papel adhesivo negro	64	2700	Papel adhesivo negro uso profesional	vini-color	1967	5
978	Papel adhesivo rojo	23	9290	Papel adhesivo rojo uso profesional	vini-metalico	9034	5
979	Papel adhesivo morado	35	11811	Papel adhesivo morado para decoración de interiores	vini-textura	11332	9
980	Sticker negro	96	5479	Sticker negro ideal para exteriores	vini-metalico	4664	4
981	Etiqueta blanco	48	8954	Etiqueta blanco fácil de aplicar	vini-textura	8820	20
982	Sticker azul	98	5069	Sticker azul ideal para exteriores	vini-textura	4813	14
983	Sticker naranja	38	14560	Sticker naranja para decoración de interiores	vini-textura	14349	6
984	Rotulo amarillo	48	13758	Rotulo amarillo uso profesional	vini-textura	13206	4
985	Pegatina blanco	33	14063	Pegatina blanco fácil de aplicar	vini-metalico	13834	10
986	Pegatina azul	26	13928	Pegatina azul para decoración de interiores	vini-metalico	12986	11
987	Sticker negro	90	12486	Sticker negro uso profesional	vini-metalico	11699	1
988	Papel adhesivo blanco	74	9578	Papel adhesivo blanco fácil de aplicar	vini-color	9106	4
989	Sticker negro	88	10532	Sticker negro ideal para exteriores	vini-metalico	10043	7
990	Pegatina verde	47	8704	Pegatina verde fácil de aplicar	vini-mate	8117	2
991	Calcomanía amarillo	83	13621	Calcomanía amarillo resistente al agua	vini-metalico	13322	6
992	Sticker rojo	69	2580	Sticker rojo duradero y versátil	vini-mate	1750	20
993	Calcomanía amarillo	75	10210	Calcomanía amarillo uso profesional	vini-mate	9662	19
994	Rotulo rojo	85	14461	Rotulo rojo ideal para exteriores	vini-color	13601	11
995	Vinilo negro	72	8743	Vinilo negro ideal para exteriores	vini-metalico	7783	18
996	Vinilo azul	35	9066	Vinilo azul fácil de aplicar	vini-metalico	8304	12
997	Rotulo naranja	12	10473	Rotulo naranja ideal para exteriores	vini-textura	10060	8
998	Rotulo negro	78	9814	Rotulo negro resistente al agua	vini-textura	9179	4
999	Sticker amarillo	18	11153	Sticker amarillo uso profesional	vini-color	10579	11
1000	Calcomanía naranja	55	3414	Calcomanía naranja resistente al agua	vini-textura	3070	4
1001	Vinilo verde	85	14754	Vinilo verde ideal para exteriores	vini-mate	14186	19
1002	Pegatina blanco	83	7698	Pegatina blanco resistente al agua	vini-metalico	6721	19
1003	Papel adhesivo amarillo	75	14677	Papel adhesivo amarillo ideal para exteriores	vini-metalico	14282	2
1004	Rotulo rojo	39	12458	Rotulo rojo resistente al agua	vini-color	11939	10
1005	Sticker verde	86	13204	Sticker verde para decoración de interiores	vini-color	12638	14
1006	Rotulo verde	55	2002	Rotulo verde resistente al agua	vini-metalico	1462	9
1007	Rotulo morado	71	11329	Rotulo morado uso profesional	vini-textura	11087	14
1008	Papel adhesivo morado	76	10637	Papel adhesivo morado ideal para exteriores	vini-textura	10433	17
1009	Etiqueta blanco	69	12770	Etiqueta blanco duradero y versátil	vini-textura	12503	8
1010	Rotulo amarillo	69	13138	Rotulo amarillo uso profesional	vini-metalico	12855	1
1011	Sticker verde	99	11578	Sticker verde duradero y versátil	vini-color	10990	13
1012	Papel adhesivo blanco	55	14296	Papel adhesivo blanco ideal para exteriores	vini-metalico	13310	1
1013	Rotulo amarillo	88	13371	Rotulo amarillo ideal para exteriores	vini-mate	12912	7
1014	Sticker morado	20	14897	Sticker morado fácil de aplicar	vini-textura	14396	7
1015	Sticker amarillo	69	7096	Sticker amarillo uso profesional	vini-color	6460	5
1016	Pegatina morado	78	6386	Pegatina morado duradero y versátil	vini-mate	6043	5
1017	Etiqueta blanco	15	14604	Etiqueta blanco duradero y versátil	vini-textura	14165	4
1018	Sticker amarillo	31	9046	Sticker amarillo ideal para exteriores	vini-metalico	8506	16
1019	Sticker azul	14	11977	Sticker azul ideal para exteriores	vini-metalico	11627	17
1020	Calcomanía azul	20	6861	Calcomanía azul fácil de aplicar	vini-textura	6180	20
1021	Vinilo naranja	30	2827	Vinilo naranja resistente al agua	vini-mate	2264	17
1022	Papel adhesivo rojo	99	14893	Papel adhesivo rojo duradero y versátil	vini-color	14550	15
1023	Calcomanía azul	5	14530	Calcomanía azul duradero y versátil	vini-metalico	14096	18
1024	Rotulo rojo	27	5761	Rotulo rojo para decoración de interiores	vini-mate	5605	8
1025	Sticker blanco	87	9030	Sticker blanco uso profesional	vini-metalico	8656	6
1026	Calcomanía negro	35	4119	Calcomanía negro fácil de aplicar	vini-color	3902	10
1027	Vinilo negro	6	13038	Vinilo negro resistente al agua	vini-color	12897	10
1028	Sticker rojo	58	5715	Sticker rojo resistente al agua	vini-color	5290	15
1029	Sticker naranja	76	6610	Sticker naranja fácil de aplicar	vini-mate	5658	3
1030	Calcomanía azul	47	3335	Calcomanía azul duradero y versátil	vini-color	2895	4
1031	Sticker azul	64	9734	Sticker azul fácil de aplicar	vini-textura	9498	4
\.


--
-- TOC entry 4927 (class 0 OID 34173)
-- Dependencies: 248
-- Data for Name: product_category; Type: TABLE DATA; Schema: proyecto; Owner: postgres
--

COPY proyecto.product_category (id, name, description) FROM stdin;
1	Adhesivo 1	Decoración con vinilo para interiores
2	Adhesivo 2	Diseño gráfico para automóviles
3	Adhesivo 3	Pegatinas para laptops y dispositivos electrónicos
4	Adhesivo 4	Etiquetas personalizadas para botellas
5	Adhesivo 5	Calcomanías educativas para niños
6	Adhesivo 6	Papel vinilo para manualidades
7	Adhesivo 7	Pegatinas para personalización de paredes
8	Adhesivo 8	Etiquetas resistentes al agua para productos
9	Adhesivo 9	Decoración para ventanas con vinilo
10	Adhesivo 10	Adhesivos para señalización de seguridad
11	Adhesivo 11	Pegatinas promocionales para marketing
12	Adhesivo 12	Calcomanías de alta resistencia para vehículos
13	Adhesivo 13	Etiquetas decorativas para regalos
14	Adhesivo 14	Vinilo removible para diseño temporal
15	Adhesivo 15	Pegatinas de vinilo holográfico
16	Adhesivo 16	Calcomanías para electrodomésticos
17	Adhesivo 17	Etiquetas para organización del hogar
18	Adhesivo 18	Adhesivos de pared con frases motivadoras
19	Adhesivo 19	Vinilos decorativos para exteriores
20	Adhesivo 20	Pegatinas para embalaje y envío
21	Adhesivo 21	Etiquetas de precio y código de barras
22	Adhesivo 22	Calcomanías fluorescentes
23	Adhesivo 23	Vinilos para personalización de cascos
24	Adhesivo 24	Etiquetas productos belleza
25	Adhesivo 25	Pegatinas colección
26	Adhesivo 26	vinilo metálico
27	Adhesivo 27	Adhesivos antideslizantes
28	Adhesivo 28	Calcomanías muebles
29	Adhesivo 29	Etiquetas oficinas
30	Adhesivo 30	Vinilos arte
31	Adhesivo 31	Vinilo adhesivo número 31 ideal para decoración de interiores y exteriores
32	Adhesivo 32	Vinilo adhesivo número 32 ideal para decoración de interiores y exteriores
33	Adhesivo 33	Vinilo adhesivo número 33 ideal para decoración de interiores y exteriores
34	Adhesivo 34	Vinilo adhesivo número 34 ideal para decoración de interiores y exteriores
35	Adhesivo 35	Vinilo adhesivo número 35 ideal para decoración de interiores y exteriores
36	Adhesivo 36	Vinilo adhesivo número 36 ideal para decoración de interiores y exteriores
37	Adhesivo 37	Vinilo adhesivo número 37 ideal para decoración de interiores y exteriores
38	Adhesivo 38	Vinilo adhesivo número 38 ideal para decoración de interiores y exteriores
39	Adhesivo 39	Vinilo adhesivo número 39 ideal para decoración de interiores y exteriores
40	Adhesivo 40	Vinilo adhesivo número 40 ideal para decoración de interiores y exteriores
41	Adhesivo 41	Vinilo adhesivo número 41 ideal para decoración de interiores y exteriores
42	Adhesivo 42	Vinilo adhesivo número 42 ideal para decoración de interiores y exteriores
43	Adhesivo 43	Vinilo adhesivo número 43 ideal para decoración de interiores y exteriores
44	Adhesivo 44	Vinilo adhesivo número 44 ideal para decoración de interiores y exteriores
45	Adhesivo 45	Vinilo adhesivo número 45 ideal para decoración de interiores y exteriores
46	Adhesivo 46	Vinilo adhesivo número 46 ideal para decoración de interiores y exteriores
47	Adhesivo 47	Vinilo adhesivo número 47 ideal para decoración de interiores y exteriores
48	Adhesivo 48	Vinilo adhesivo número 48 ideal para decoración de interiores y exteriores
49	Adhesivo 49	Vinilo adhesivo número 49 ideal para decoración de interiores y exteriores
50	Adhesivo 50	Vinilo adhesivo número 50 ideal para decoración de interiores y exteriores
51	Adhesivo 51	Vinilo adhesivo número 51 ideal para decoración de interiores y exteriores
52	Adhesivo 52	Vinilo adhesivo número 52 ideal para decoración de interiores y exteriores
53	Adhesivo 53	Vinilo adhesivo número 53 ideal para decoración de interiores y exteriores
54	Adhesivo 54	Vinilo adhesivo número 54 ideal para decoración de interiores y exteriores
55	Adhesivo 55	Vinilo adhesivo número 55 ideal para decoración de interiores y exteriores
56	Adhesivo 56	Vinilo adhesivo número 56 ideal para decoración de interiores y exteriores
57	Adhesivo 57	Vinilo adhesivo número 57 ideal para decoración de interiores y exteriores
58	Adhesivo 58	Vinilo adhesivo número 58 ideal para decoración de interiores y exteriores
59	Adhesivo 59	Vinilo adhesivo número 59 ideal para decoración de interiores y exteriores
60	Adhesivo 60	Vinilo adhesivo número 60 ideal para decoración de interiores y exteriores
61	Adhesivo 61	Vinilo adhesivo número 61 ideal para decoración de interiores y exteriores
62	Adhesivo 62	Vinilo adhesivo número 62 ideal para decoración de interiores y exteriores
63	Adhesivo 63	Vinilo adhesivo número 63 ideal para decoración de interiores y exteriores
64	Adhesivo 64	Vinilo adhesivo número 64 ideal para decoración de interiores y exteriores
65	Adhesivo 65	Vinilo adhesivo número 65 ideal para decoración de interiores y exteriores
66	Adhesivo 66	Vinilo adhesivo número 66 ideal para decoración de interiores y exteriores
67	Adhesivo 67	Vinilo adhesivo número 67 ideal para decoración de interiores y exteriores
68	Adhesivo 68	Vinilo adhesivo número 68 ideal para decoración de interiores y exteriores
69	Adhesivo 69	Vinilo adhesivo número 69 ideal para decoración de interiores y exteriores
70	Adhesivo 70	Vinilo adhesivo número 70 ideal para decoración de interiores y exteriores
71	Adhesivo 71	Vinilo adhesivo número 71 ideal para decoración de interiores y exteriores
72	Adhesivo 72	Vinilo adhesivo número 72 ideal para decoración de interiores y exteriores
73	Adhesivo 73	Vinilo adhesivo número 73 ideal para decoración de interiores y exteriores
74	Adhesivo 74	Vinilo adhesivo número 74 ideal para decoración de interiores y exteriores
75	Adhesivo 75	Vinilo adhesivo número 75 ideal para decoración de interiores y exteriores
76	Adhesivo 76	Vinilo adhesivo número 76 ideal para decoración de interiores y exteriores
77	Adhesivo 77	Vinilo adhesivo número 77 ideal para decoración de interiores y exteriores
78	Adhesivo 78	Vinilo adhesivo número 78 ideal para decoración de interiores y exteriores
79	Adhesivo 79	Vinilo adhesivo número 79 ideal para decoración de interiores y exteriores
80	Adhesivo 80	Vinilo adhesivo número 80 ideal para decoración de interiores y exteriores
81	Adhesivo 81	Vinilo adhesivo número 81 ideal para decoración de interiores y exteriores
82	Adhesivo 82	Vinilo adhesivo número 82 ideal para decoración de interiores y exteriores
83	Adhesivo 83	Vinilo adhesivo número 83 ideal para decoración de interiores y exteriores
84	Adhesivo 84	Vinilo adhesivo número 84 ideal para decoración de interiores y exteriores
85	Adhesivo 85	Vinilo adhesivo número 85 ideal para decoración de interiores y exteriores
86	Adhesivo 86	Vinilo adhesivo número 86 ideal para decoración de interiores y exteriores
87	Adhesivo 87	Vinilo adhesivo número 87 ideal para decoración de interiores y exteriores
88	Adhesivo 88	Vinilo adhesivo número 88 ideal para decoración de interiores y exteriores
89	Adhesivo 89	Vinilo adhesivo número 89 ideal para decoración de interiores y exteriores
90	Adhesivo 90	Vinilo adhesivo número 90 ideal para decoración de interiores y exteriores
91	Adhesivo 91	Vinilo adhesivo número 91 ideal para decoración de interiores y exteriores
92	Adhesivo 92	Vinilo adhesivo número 92 ideal para decoración de interiores y exteriores
93	Adhesivo 93	Vinilo adhesivo número 93 ideal para decoración de interiores y exteriores
94	Adhesivo 94	Vinilo adhesivo número 94 ideal para decoración de interiores y exteriores
95	Adhesivo 95	Vinilo adhesivo número 95 ideal para decoración de interiores y exteriores
96	Adhesivo 96	Vinilo adhesivo número 96 ideal para decoración de interiores y exteriores
97	Adhesivo 97	Vinilo adhesivo número 97 ideal para decoración de interiores y exteriores
98	Adhesivo 98	Vinilo adhesivo número 98 ideal para decoración de interiores y exteriores
99	Adhesivo 99	Vinilo adhesivo número 99 ideal para decoración de interiores y exteriores
100	Adhesivo 100	Vinilo adhesivo número 100 ideal para decoración de interiores y exteriores
101	Adhesivo 101	Vinilo adhesivo número 101 ideal para decoración de interiores y exteriores
102	Adhesivo 102	Vinilo adhesivo número 102 ideal para decoración de interiores y exteriores
103	Adhesivo 103	Vinilo adhesivo número 103 ideal para decoración de interiores y exteriores
104	Adhesivo 104	Vinilo adhesivo número 104 ideal para decoración de interiores y exteriores
105	Adhesivo 105	Vinilo adhesivo número 105 ideal para decoración de interiores y exteriores
106	Adhesivo 106	Vinilo adhesivo número 106 ideal para decoración de interiores y exteriores
107	Adhesivo 107	Vinilo adhesivo número 107 ideal para decoración de interiores y exteriores
108	Adhesivo 108	Vinilo adhesivo número 108 ideal para decoración de interiores y exteriores
109	Adhesivo 109	Vinilo adhesivo número 109 ideal para decoración de interiores y exteriores
110	Adhesivo 110	Vinilo adhesivo número 110 ideal para decoración de interiores y exteriores
111	Adhesivo 111	Vinilo adhesivo número 111 ideal para decoración de interiores y exteriores
112	Adhesivo 112	Vinilo adhesivo número 112 ideal para decoración de interiores y exteriores
113	Adhesivo 113	Vinilo adhesivo número 113 ideal para decoración de interiores y exteriores
114	Adhesivo 114	Vinilo adhesivo número 114 ideal para decoración de interiores y exteriores
115	Adhesivo 115	Vinilo adhesivo número 115 ideal para decoración de interiores y exteriores
116	Adhesivo 116	Vinilo adhesivo número 116 ideal para decoración de interiores y exteriores
117	Adhesivo 117	Vinilo adhesivo número 117 ideal para decoración de interiores y exteriores
118	Adhesivo 118	Vinilo adhesivo número 118 ideal para decoración de interiores y exteriores
119	Adhesivo 119	Vinilo adhesivo número 119 ideal para decoración de interiores y exteriores
120	Adhesivo 120	Vinilo adhesivo número 120 ideal para decoración de interiores y exteriores
121	Adhesivo 121	Vinilo adhesivo número 121 ideal para decoración de interiores y exteriores
122	Adhesivo 122	Vinilo adhesivo número 122 ideal para decoración de interiores y exteriores
123	Adhesivo 123	Vinilo adhesivo número 123 ideal para decoración de interiores y exteriores
124	Adhesivo 124	Vinilo adhesivo número 124 ideal para decoración de interiores y exteriores
125	Adhesivo 125	Vinilo adhesivo número 125 ideal para decoración de interiores y exteriores
126	Adhesivo 126	Vinilo adhesivo número 126 ideal para decoración de interiores y exteriores
127	Adhesivo 127	Vinilo adhesivo número 127 ideal para decoración de interiores y exteriores
128	Adhesivo 128	Vinilo adhesivo número 128 ideal para decoración de interiores y exteriores
129	Adhesivo 129	Vinilo adhesivo número 129 ideal para decoración de interiores y exteriores
130	Adhesivo 130	Vinilo adhesivo número 130 ideal para decoración de interiores y exteriores
131	Adhesivo 131	Vinilo adhesivo número 131 ideal para decoración de interiores y exteriores
132	Adhesivo 132	Vinilo adhesivo número 132 ideal para decoración de interiores y exteriores
133	Adhesivo 133	Vinilo adhesivo número 133 ideal para decoración de interiores y exteriores
134	Adhesivo 134	Vinilo adhesivo número 134 ideal para decoración de interiores y exteriores
135	Adhesivo 135	Vinilo adhesivo número 135 ideal para decoración de interiores y exteriores
136	Adhesivo 136	Vinilo adhesivo número 136 ideal para decoración de interiores y exteriores
137	Adhesivo 137	Vinilo adhesivo número 137 ideal para decoración de interiores y exteriores
138	Adhesivo 138	Vinilo adhesivo número 138 ideal para decoración de interiores y exteriores
139	Adhesivo 139	Vinilo adhesivo número 139 ideal para decoración de interiores y exteriores
140	Adhesivo 140	Vinilo adhesivo número 140 ideal para decoración de interiores y exteriores
141	Adhesivo 141	Vinilo adhesivo número 141 ideal para decoración de interiores y exteriores
142	Adhesivo 142	Vinilo adhesivo número 142 ideal para decoración de interiores y exteriores
143	Adhesivo 143	Vinilo adhesivo número 143 ideal para decoración de interiores y exteriores
144	Adhesivo 144	Vinilo adhesivo número 144 ideal para decoración de interiores y exteriores
145	Adhesivo 145	Vinilo adhesivo número 145 ideal para decoración de interiores y exteriores
146	Adhesivo 146	Vinilo adhesivo número 146 ideal para decoración de interiores y exteriores
147	Adhesivo 147	Vinilo adhesivo número 147 ideal para decoración de interiores y exteriores
148	Adhesivo 148	Vinilo adhesivo número 148 ideal para decoración de interiores y exteriores
149	Adhesivo 149	Vinilo adhesivo número 149 ideal para decoración de interiores y exteriores
150	Adhesivo 150	Vinilo adhesivo número 150 ideal para decoración de interiores y exteriores
151	Adhesivo 151	Vinilo adhesivo número 151 ideal para decoración de interiores y exteriores
152	Adhesivo 152	Vinilo adhesivo número 152 ideal para decoración de interiores y exteriores
153	Adhesivo 153	Vinilo adhesivo número 153 ideal para decoración de interiores y exteriores
154	Adhesivo 154	Vinilo adhesivo número 154 ideal para decoración de interiores y exteriores
155	Adhesivo 155	Vinilo adhesivo número 155 ideal para decoración de interiores y exteriores
156	Adhesivo 156	Vinilo adhesivo número 156 ideal para decoración de interiores y exteriores
157	Adhesivo 157	Vinilo adhesivo número 157 ideal para decoración de interiores y exteriores
158	Adhesivo 158	Vinilo adhesivo número 158 ideal para decoración de interiores y exteriores
159	Adhesivo 159	Vinilo adhesivo número 159 ideal para decoración de interiores y exteriores
160	Adhesivo 160	Vinilo adhesivo número 160 ideal para decoración de interiores y exteriores
161	Adhesivo 161	Vinilo adhesivo número 161 ideal para decoración de interiores y exteriores
162	Adhesivo 162	Vinilo adhesivo número 162 ideal para decoración de interiores y exteriores
163	Adhesivo 163	Vinilo adhesivo número 163 ideal para decoración de interiores y exteriores
164	Adhesivo 164	Vinilo adhesivo número 164 ideal para decoración de interiores y exteriores
165	Adhesivo 165	Vinilo adhesivo número 165 ideal para decoración de interiores y exteriores
166	Adhesivo 166	Vinilo adhesivo número 166 ideal para decoración de interiores y exteriores
167	Adhesivo 167	Vinilo adhesivo número 167 ideal para decoración de interiores y exteriores
168	Adhesivo 168	Vinilo adhesivo número 168 ideal para decoración de interiores y exteriores
169	Adhesivo 169	Vinilo adhesivo número 169 ideal para decoración de interiores y exteriores
170	Adhesivo 170	Vinilo adhesivo número 170 ideal para decoración de interiores y exteriores
171	Adhesivo 171	Vinilo adhesivo número 171 ideal para decoración de interiores y exteriores
172	Adhesivo 172	Vinilo adhesivo número 172 ideal para decoración de interiores y exteriores
173	Adhesivo 173	Vinilo adhesivo número 173 ideal para decoración de interiores y exteriores
174	Adhesivo 174	Vinilo adhesivo número 174 ideal para decoración de interiores y exteriores
175	Adhesivo 175	Vinilo adhesivo número 175 ideal para decoración de interiores y exteriores
176	Adhesivo 176	Vinilo adhesivo número 176 ideal para decoración de interiores y exteriores
177	Adhesivo 177	Vinilo adhesivo número 177 ideal para decoración de interiores y exteriores
178	Adhesivo 178	Vinilo adhesivo número 178 ideal para decoración de interiores y exteriores
179	Adhesivo 179	Vinilo adhesivo número 179 ideal para decoración de interiores y exteriores
180	Adhesivo 180	Vinilo adhesivo número 180 ideal para decoración de interiores y exteriores
181	Adhesivo 181	Vinilo adhesivo número 181 ideal para decoración de interiores y exteriores
182	Adhesivo 182	Vinilo adhesivo número 182 ideal para decoración de interiores y exteriores
183	Adhesivo 183	Vinilo adhesivo número 183 ideal para decoración de interiores y exteriores
184	Adhesivo 184	Vinilo adhesivo número 184 ideal para decoración de interiores y exteriores
185	Adhesivo 185	Vinilo adhesivo número 185 ideal para decoración de interiores y exteriores
186	Adhesivo 186	Vinilo adhesivo número 186 ideal para decoración de interiores y exteriores
187	Adhesivo 187	Vinilo adhesivo número 187 ideal para decoración de interiores y exteriores
188	Adhesivo 188	Vinilo adhesivo número 188 ideal para decoración de interiores y exteriores
189	Adhesivo 189	Vinilo adhesivo número 189 ideal para decoración de interiores y exteriores
190	Adhesivo 190	Vinilo adhesivo número 190 ideal para decoración de interiores y exteriores
191	Adhesivo 191	Vinilo adhesivo número 191 ideal para decoración de interiores y exteriores
192	Adhesivo 192	Vinilo adhesivo número 192 ideal para decoración de interiores y exteriores
193	Adhesivo 193	Vinilo adhesivo número 193 ideal para decoración de interiores y exteriores
194	Adhesivo 194	Vinilo adhesivo número 194 ideal para decoración de interiores y exteriores
195	Adhesivo 195	Vinilo adhesivo número 195 ideal para decoración de interiores y exteriores
196	Adhesivo 196	Vinilo adhesivo número 196 ideal para decoración de interiores y exteriores
197	Adhesivo 197	Vinilo adhesivo número 197 ideal para decoración de interiores y exteriores
198	Adhesivo 198	Vinilo adhesivo número 198 ideal para decoración de interiores y exteriores
199	Adhesivo 199	Vinilo adhesivo número 199 ideal para decoración de interiores y exteriores
200	Adhesivo 200	Vinilo adhesivo número 200 ideal para decoración de interiores y exteriores
\.


--
-- TOC entry 4933 (class 0 OID 34235)
-- Dependencies: 254
-- Data for Name: product_supplier; Type: TABLE DATA; Schema: proyecto; Owner: postgres
--

COPY proyecto.product_supplier (supply_date, cost, product_id, supplier_id) FROM stdin;
2024-10-01	85000.00	1	1
2024-10-05	90000.00	2	2
2024-10-10	120000.00	3	3
2024-10-12	75000.00	4	4
2024-10-15	95000.00	5	5
2024-10-20	110000.00	6	1
2024-10-25	105000.00	7	2
2024-10-30	98000.00	8	3
2024-11-01	87000.00	9	4
2024-11-05	115000.00	10	5
2024-11-10	92000.00	11	1
2024-11-12	89000.00	12	2
2024-11-15	76000.00	13	3
2024-11-18	125000.00	14	4
2024-11-20	118000.00	15	5
2024-11-22	132000.00	16	1
2024-11-25	101000.00	17	2
2024-11-28	97000.00	18	3
2024-11-30	88000.00	19	4
2024-12-01	112000.00	20	5
2016-12-21	26668.00	203	399
2015-05-30	32421.00	99	507
2021-10-22	40742.00	23	642
2023-05-12	50807.00	470	29
2019-03-24	70678.00	428	391
2016-08-01	98510.00	231	58
2016-09-24	40299.00	108	489
2022-03-13	20068.00	381	795
2023-07-26	56681.00	486	681
2021-01-08	96739.00	366	127
2023-10-06	44618.00	329	526
2021-05-12	16714.00	104	645
2023-06-22	55306.00	190	400
2017-09-25	91317.00	459	535
2015-10-17	92663.00	308	503
2018-12-03	65114.00	157	379
2017-10-20	91975.00	338	787
2017-02-11	89796.00	218	527
2023-12-29	40256.00	195	847
2021-05-08	75416.00	150	500
2016-12-13	32284.00	353	910
2023-11-20	42009.00	374	416
2018-07-25	40022.00	475	799
2019-04-04	51735.00	16	16
2023-08-21	66214.00	433	815
2019-03-10	95569.00	183	922
2021-10-26	49605.00	293	267
2024-03-21	52036.00	287	328
2018-08-30	26677.00	166	661
2018-01-10	48251.00	57	294
2024-05-15	73067.00	42	654
2022-06-04	69438.00	236	948
2015-03-04	32140.00	301	319
2023-05-24	56583.00	195	830
2022-11-16	24055.00	99	235
2018-08-01	28574.00	230	316
2023-05-21	18122.00	333	157
2018-09-30	33893.00	254	589
2017-10-24	57184.00	406	20
2017-12-07	23630.00	284	232
2024-04-29	37218.00	407	553
2017-01-02	71142.00	239	408
2016-06-20	72802.00	212	721
2022-06-24	62561.00	222	525
2015-09-12	60450.00	107	360
2024-02-29	43525.00	149	29
2016-09-30	74815.00	100	35
2020-09-08	20434.00	6	575
2021-12-20	66109.00	296	804
2023-07-26	74937.00	291	486
2021-10-12	46608.00	110	850
2024-05-27	93046.00	491	682
2018-07-17	83878.00	437	929
2016-11-19	58638.00	422	801
2019-01-04	30652.00	420	694
2023-09-24	69746.00	442	122
2016-10-12	25763.00	362	476
2016-01-30	98976.00	138	711
2016-12-10	69170.00	101	220
2016-09-11	10997.00	85	915
2015-10-27	20079.00	161	561
2016-11-20	77128.00	310	551
2022-03-01	33462.00	465	405
2017-03-23	50099.00	74	335
2022-12-17	73258.00	449	613
2018-12-03	28640.00	394	526
2015-05-29	64741.00	295	344
2015-10-15	20146.00	193	45
2017-05-26	27284.00	433	950
2018-11-20	33943.00	191	119
2017-09-23	22932.00	248	744
2018-09-23	11293.00	379	329
2017-02-07	21867.00	306	701
2023-09-26	59750.00	112	367
2022-11-07	48116.00	272	1
2016-04-06	74418.00	416	924
2019-07-10	72291.00	291	739
2022-04-16	30838.00	369	640
2019-07-29	62067.00	488	89
2015-03-27	18407.00	483	873
2022-07-08	51905.00	377	436
2020-01-07	16991.00	449	435
2021-11-30	66506.00	204	394
2016-01-13	40743.00	413	366
2021-07-28	89939.00	405	281
2018-04-24	47031.00	203	111
2016-10-17	92121.00	397	598
2023-05-11	29562.00	252	460
2018-07-02	54059.00	339	760
2015-07-31	28151.00	16	43
2017-07-16	79734.00	151	484
2017-03-25	39564.00	82	639
2022-10-13	43098.00	264	538
2022-06-14	16727.00	97	416
2020-06-02	30572.00	384	376
2024-08-12	14925.00	72	964
2018-11-09	84673.00	423	109
2021-09-02	97911.00	422	215
2019-09-14	66414.00	281	779
2023-01-30	32826.00	254	960
2021-05-06	44917.00	135	698
2019-06-15	89896.00	398	493
2022-10-02	50539.00	203	776
2024-01-08	44852.00	423	135
2016-04-24	56729.00	361	179
2023-03-18	62390.00	401	835
2016-08-13	75140.00	361	30
2015-07-25	13904.00	271	390
2020-04-24	92682.00	61	416
2023-10-24	54641.00	407	85
2015-11-20	10401.00	273	868
2023-04-27	20784.00	8	304
2015-01-26	12633.00	189	547
2015-03-17	84287.00	143	370
2018-12-17	69122.00	294	981
2021-05-24	58422.00	243	225
2020-02-17	14923.00	353	828
2021-01-11	50038.00	379	578
2020-10-19	30581.00	115	552
2020-10-17	29131.00	180	895
2015-07-08	35016.00	449	161
2015-11-20	62734.00	167	811
2016-06-02	71116.00	60	951
2015-03-14	71637.00	190	824
2017-10-30	12986.00	238	707
2019-04-13	68182.00	200	980
2023-04-08	27477.00	194	579
2015-02-05	77720.00	477	569
2020-08-04	52819.00	344	702
2016-08-14	55696.00	236	409
2023-04-22	36260.00	113	857
2017-06-28	38881.00	250	545
2017-12-26	37652.00	127	453
2015-03-11	41834.00	352	898
2016-11-04	85110.00	262	680
2021-11-27	34648.00	40	220
2024-11-01	75214.00	247	121
2023-11-01	12412.00	385	525
2021-11-28	48059.00	70	327
2021-06-19	52571.00	144	712
2024-11-02	76352.00	391	33
2022-01-11	44155.00	348	982
2021-07-27	26123.00	49	354
2024-04-25	60158.00	423	955
2022-04-19	36625.00	142	269
2021-04-03	19702.00	11	176
2023-03-07	11469.00	344	572
2015-01-17	43495.00	387	820
2017-05-24	50773.00	425	87
2019-07-01	81313.00	6	998
2020-02-07	98521.00	187	888
2024-08-05	91692.00	210	418
2021-10-10	21142.00	466	342
2023-02-20	31912.00	264	637
2022-02-10	72977.00	358	77
2016-01-27	23173.00	158	833
2022-09-13	92428.00	218	831
2018-06-04	46601.00	327	978
2024-08-12	80473.00	450	162
2018-12-21	28629.00	206	191
2023-01-04	70601.00	51	921
2015-09-13	17847.00	421	137
2017-07-16	49397.00	143	691
2022-07-26	77101.00	291	466
2017-03-21	10381.00	343	745
2018-01-07	24240.00	435	450
2019-01-01	85406.00	117	76
2018-09-04	99919.00	245	421
2021-11-26	52930.00	97	382
2021-02-12	44821.00	151	761
2017-10-25	73872.00	131	511
2015-07-04	38995.00	428	311
2017-01-01	45443.00	405	863
2016-12-24	94772.00	460	897
2018-05-06	28169.00	176	30
2020-09-22	90829.00	429	63
2015-07-30	38278.00	281	816
2020-03-31	80748.00	401	741
2020-09-26	52047.00	193	304
2015-11-28	32347.00	353	993
2016-10-30	15755.00	476	925
2023-05-12	63491.00	113	309
2018-06-12	82379.00	170	682
2017-03-06	77307.00	63	757
2021-09-30	42134.00	151	316
2023-05-27	38896.00	125	587
2024-11-24	57304.00	203	5
2022-01-27	59677.00	455	627
2018-04-01	18406.00	171	632
2020-04-23	43168.00	96	390
2023-03-26	94216.00	472	793
2021-09-17	71640.00	254	466
2021-01-27	93689.00	494	508
2020-02-09	59914.00	269	63
2017-08-24	29108.00	53	227
2024-02-29	94597.00	174	355
2016-07-12	72618.00	118	991
2018-02-05	24561.00	40	458
2018-06-13	53124.00	173	283
2018-04-25	16810.00	146	692
2019-12-16	32627.00	29	881
2021-12-30	47168.00	402	806
2020-06-25	11041.00	279	796
2020-02-13	82721.00	49	10
2023-04-13	97683.00	356	352
2020-10-24	24191.00	379	339
2016-03-05	40738.00	126	810
2020-04-19	19178.00	466	707
2016-06-19	90457.00	63	766
2016-08-02	96400.00	101	177
2016-09-07	18307.00	329	261
2019-11-12	16274.00	257	656
2015-01-18	24107.00	57	489
2018-09-26	35245.00	369	777
2021-02-05	13906.00	269	939
2017-05-18	97797.00	102	115
2023-03-18	59279.00	148	610
2016-10-14	71480.00	409	383
2015-06-16	27861.00	348	459
2020-12-12	36851.00	221	812
2016-03-14	54430.00	481	701
2017-04-03	54632.00	49	210
2024-11-28	55316.00	141	104
2024-09-24	47599.00	373	475
2015-04-10	68974.00	185	258
2024-07-26	90022.00	495	755
2015-03-17	67952.00	26	933
2020-02-01	30711.00	155	709
2018-02-05	28588.00	182	418
2016-11-08	55399.00	20	526
2024-07-24	97569.00	26	627
2023-08-24	80047.00	259	398
2019-08-14	96490.00	414	449
2020-05-27	87826.00	260	580
2020-01-23	62734.00	424	425
2021-02-21	92997.00	179	34
2024-02-14	10627.00	295	153
2018-08-11	10445.00	190	821
2015-07-05	13501.00	21	232
2017-06-08	75491.00	385	112
2017-08-02	57946.00	396	423
2019-12-09	66152.00	25	847
2016-03-18	37454.00	385	767
2024-07-04	84727.00	187	72
2022-06-25	10097.00	99	899
2021-03-08	17763.00	179	63
2015-11-25	35577.00	327	227
2022-12-10	30976.00	354	353
2020-09-29	63114.00	165	161
2020-06-29	54546.00	275	370
2017-06-16	72137.00	15	988
2015-12-27	90107.00	471	381
2022-07-10	45006.00	350	710
2016-05-13	80811.00	429	72
2023-04-23	78166.00	327	311
2016-06-10	41860.00	169	682
2020-10-11	21202.00	336	494
2021-05-17	32318.00	305	366
2017-04-19	77460.00	50	547
2022-11-11	36609.00	441	49
2019-10-05	70029.00	304	270
2021-01-21	73664.00	139	282
2024-11-15	31764.00	248	996
2015-11-23	95968.00	296	248
2015-08-30	55889.00	219	784
2018-12-23	54694.00	487	237
2018-01-15	37637.00	313	553
2024-02-16	41284.00	147	367
2018-01-02	59012.00	363	373
2020-05-01	29094.00	363	59
2015-08-24	36550.00	492	410
2021-06-14	39846.00	392	534
2023-04-21	67026.00	141	601
2021-05-11	58807.00	462	370
2018-10-07	82005.00	110	466
2018-04-05	17152.00	345	294
2023-01-08	92039.00	135	477
2015-11-23	86285.00	162	640
2017-01-24	80647.00	68	377
2019-10-09	76973.00	46	479
2021-05-27	30490.00	323	16
2020-08-12	76159.00	16	425
2016-11-29	95761.00	235	209
2015-02-24	46382.00	339	696
2016-07-05	92815.00	215	602
2024-05-30	53786.00	401	96
2024-07-08	94814.00	108	937
2024-06-11	54960.00	148	3
2024-01-13	37752.00	20	102
2022-03-20	69816.00	478	471
2021-12-07	63188.00	144	950
2024-12-08	43968.00	45	675
2019-03-15	99992.00	78	624
2023-02-05	82512.00	24	62
2017-04-26	25540.00	253	153
2019-07-14	78536.00	359	687
2015-03-07	43953.00	38	152
2023-07-04	88430.00	92	71
2019-06-07	79926.00	183	72
2020-04-10	57321.00	406	757
2023-04-06	78540.00	237	225
2024-06-13	60613.00	337	127
2016-07-03	85319.00	176	442
2020-07-30	78842.00	482	764
2017-07-31	19329.00	370	577
2021-08-04	83687.00	347	68
2016-04-12	50425.00	21	306
2023-05-14	22912.00	57	909
2018-06-13	22017.00	270	497
2019-09-25	86463.00	96	904
2015-04-20	72715.00	67	325
2017-03-16	17796.00	308	558
2015-02-20	46253.00	164	657
2017-07-24	68192.00	82	117
2021-02-21	38851.00	303	555
2023-04-15	96126.00	309	389
2016-03-15	43020.00	395	955
2021-04-23	40877.00	323	687
2017-05-29	87640.00	494	307
2022-01-17	29901.00	66	127
2018-08-31	37877.00	413	650
2017-02-13	53690.00	419	844
2021-07-20	23527.00	403	13
2016-12-03	20230.00	228	27
2018-02-10	92395.00	375	764
2015-08-27	74306.00	103	297
2024-07-11	86242.00	304	91
2023-01-14	30306.00	473	227
2021-10-16	19902.00	384	153
2021-12-28	77127.00	461	352
2015-05-15	70667.00	244	306
2017-06-16	44363.00	163	540
2020-04-30	59238.00	394	954
2022-11-10	63214.00	157	101
2020-09-22	48998.00	316	788
2023-12-17	93081.00	317	840
2024-03-31	86167.00	130	625
2024-08-08	59407.00	118	932
2022-11-21	63259.00	340	101
2021-06-27	72710.00	133	481
2018-11-12	42116.00	138	631
2024-01-04	65007.00	71	893
2020-10-15	51538.00	126	558
2024-01-04	86704.00	196	809
2015-01-27	68322.00	278	331
2016-07-18	77561.00	109	795
2015-12-05	85774.00	487	775
2018-03-13	74757.00	105	920
2023-09-11	48982.00	105	838
2017-04-16	27280.00	438	645
2023-01-18	60050.00	475	326
2024-02-21	75178.00	395	287
2023-10-28	33440.00	242	212
2017-12-12	16058.00	479	495
2020-09-04	53625.00	446	978
2023-04-06	24952.00	278	156
2016-01-20	41089.00	357	392
2015-10-30	98915.00	289	5
2022-10-19	75790.00	338	719
2021-04-26	96572.00	342	349
2023-04-27	20243.00	57	910
2020-10-17	52917.00	188	804
2017-03-04	66619.00	350	529
2016-03-03	52300.00	196	352
2023-03-16	55116.00	174	789
2016-05-08	53357.00	323	284
2022-10-21	42671.00	105	691
2018-02-28	81526.00	152	829
2023-12-25	99337.00	112	778
2016-03-24	41656.00	334	928
2022-11-30	30515.00	334	602
2016-06-13	46762.00	327	278
2024-08-29	57921.00	318	456
2015-07-15	14626.00	63	213
2022-05-26	24234.00	34	578
2024-11-07	24872.00	436	576
2022-07-07	10348.00	39	655
2018-06-03	23060.00	110	137
2023-01-10	86626.00	226	537
2022-03-22	14133.00	95	39
2018-08-17	96170.00	47	603
2021-08-09	48180.00	56	831
2021-04-21	57742.00	204	849
2015-11-14	99313.00	200	95
2017-03-26	36346.00	209	232
2023-07-08	34375.00	334	331
2023-09-12	58386.00	166	814
2023-09-22	61693.00	497	126
2015-10-09	28214.00	48	668
2024-07-17	41574.00	416	97
2015-05-14	10071.00	118	553
2020-05-08	99094.00	220	465
2020-03-10	71911.00	243	436
2020-08-12	83607.00	58	755
2022-09-20	74395.00	390	912
2023-06-22	48056.00	35	565
2022-10-07	42234.00	173	970
2023-05-30	78380.00	258	203
2023-04-14	82044.00	325	310
2017-02-13	27307.00	366	558
2022-02-08	69881.00	262	282
2021-06-01	22390.00	391	688
2022-12-24	91271.00	8	946
2018-06-16	26794.00	252	201
2024-11-06	84356.00	378	573
2018-02-16	84504.00	364	232
2020-12-02	53393.00	284	893
2017-11-11	68460.00	269	618
2021-07-28	23813.00	157	136
2017-01-30	66174.00	45	748
2015-08-25	85150.00	326	633
2020-06-01	74436.00	354	684
2016-11-17	80707.00	352	376
2016-11-09	80847.00	276	366
2015-08-29	12694.00	493	229
2018-02-06	65104.00	21	212
2024-10-11	83769.00	215	222
2019-06-14	75720.00	112	949
2016-06-07	80587.00	275	707
2016-07-13	63119.00	203	163
2017-07-22	66702.00	83	268
2020-02-28	25091.00	466	476
2018-05-08	29226.00	448	146
2024-12-25	44677.00	75	114
2020-04-23	78102.00	410	506
2018-05-16	28682.00	404	238
2024-03-27	20791.00	479	724
2018-07-14	79906.00	429	928
2017-03-06	34935.00	429	663
2019-01-16	32068.00	295	54
2017-01-20	23223.00	148	873
2024-08-06	92366.00	34	993
2021-05-09	13771.00	390	956
2021-08-12	37234.00	122	877
2022-11-02	85691.00	490	226
2019-04-01	44761.00	179	302
2022-03-25	48320.00	407	714
2015-12-31	67840.00	496	670
2024-07-20	67715.00	241	209
2017-06-03	56608.00	220	230
2024-08-26	99395.00	205	946
2024-08-18	28103.00	98	248
2023-05-25	43551.00	36	62
2018-07-24	98246.00	394	696
2021-11-11	61111.00	379	324
2024-10-27	49750.00	476	664
2017-05-22	56990.00	137	130
2021-02-19	25911.00	479	828
2015-01-30	37356.00	283	37
2020-06-25	26198.00	21	345
2015-08-10	15708.00	54	90
2019-07-13	43068.00	66	750
2017-05-10	22924.00	4	251
2021-06-28	14856.00	79	314
2023-04-03	15638.00	396	33
2019-01-28	22633.00	320	653
2018-11-06	81469.00	7	218
2023-10-18	47366.00	145	414
2017-03-20	29356.00	427	687
2016-07-26	75301.00	307	577
2023-07-05	98621.00	381	249
2024-08-06	37698.00	283	248
2015-05-31	42615.00	323	878
2021-12-29	23878.00	16	374
2021-05-03	95191.00	201	135
2024-06-13	30416.00	360	384
2018-05-26	11573.00	62	151
2019-01-09	14308.00	101	174
2020-07-20	85529.00	376	811
2018-02-06	78011.00	182	882
2017-06-11	36615.00	177	525
2023-03-04	57610.00	433	334
2024-03-11	36507.00	166	33
2018-09-20	80984.00	257	398
2021-06-24	40344.00	440	280
2020-06-19	22698.00	1	608
2024-05-30	26001.00	282	77
2024-02-22	72164.00	447	387
2018-12-23	52271.00	313	72
2023-03-18	20604.00	150	644
2017-10-08	34760.00	349	665
2015-12-05	83498.00	100	287
2023-08-05	33607.00	205	634
2024-08-23	77656.00	444	812
2020-08-02	61515.00	145	18
2024-05-04	61745.00	297	314
2018-06-03	46949.00	200	496
2022-08-31	56123.00	367	272
2015-12-14	20731.00	129	786
2020-05-20	96105.00	64	50
2023-01-05	73705.00	7	291
2018-11-16	18585.00	43	568
2016-04-07	26081.00	228	775
2023-01-18	24803.00	189	510
2024-11-29	97156.00	226	719
2024-10-03	81093.00	281	484
2020-06-01	64658.00	302	796
2022-02-27	10737.00	58	146
2023-08-30	50330.00	109	450
2022-01-03	83889.00	96	201
\.


--
-- TOC entry 4935 (class 0 OID 34241)
-- Dependencies: 256
-- Data for Name: purchase; Type: TABLE DATA; Schema: proyecto; Owner: postgres
--

COPY proyecto.purchase (id, purchase_date, total_purchase, client_id, employee_id, method_pay) FROM stdin;
1	2024-11-01	1501	1	EMP001	Credit Card
2	2024-11-02	1200	2	EMP002	Cash
3	2024-11-03	3000	3	EMP003	Debit Card
4	2024-11-04	4500	4	EMP004	Transfer
5	2024-11-05	500	5	EMP005	Credit Card
6	2024-11-06	2401	6	EMP006	Cash
7	2024-11-07	1200	7	EMP007	Debit Card
8	2024-11-08	3201	8	EMP008	Transfer
9	2024-11-09	1800	9	EMP009	Credit Card
10	2024-11-10	1350	10	EMP010	Cash
11	2024-11-11	2901	11	EMP011	Debit Card
12	2024-11-12	4000	12	EMP012	Transfer
13	2024-11-13	750	13	EMP013	Credit Card
14	2024-11-14	2200	14	EMP014	Cash
15	2024-11-15	3500	15	EMP015	Debit Card
16	2024-11-16	4201	16	EMP016	Transfer
17	2024-11-17	5000	17	EMP017	Credit Card
18	2024-11-18	2001	18	EMP018	Cash
19	2024-11-19	2700	19	EMP019	Debit Card
20	2024-11-20	3000	20	EMP020	Transfer
21	2024-11-21	1101	21	EMP021	Credit Card
22	2024-11-22	2200	22	EMP022	Cash
23	2024-11-23	4501	23	EMP023	Debit Card
24	2024-11-24	3200	24	EMP024	Transfer
25	2024-11-25	1800	25	EMP025	Credit Card
26	2024-11-26	2901	26	EMP026	Cash
27	2024-11-27	2401	27	EMP027	Debit Card
28	2024-11-28	3300	28	EMP028	Transfer
29	2024-11-29	1701	29	EMP029	Credit Card
30	2024-11-30	4000	30	EMP030	Cash
31	2024-11-01	1500	31	EMP001	Debit Card
32	2024-11-02	2201	32	EMP002	Transfer
33	2024-11-03	3501	33	EMP003	Credit Card
34	2024-11-04	3000	34	EMP004	Cash
35	2024-11-05	4200	35	EMP005	Debit Card
36	2024-11-06	2900	36	EMP006	Transfer
37	2024-11-07	2401	37	EMP007	Credit Card
38	2024-11-08	3301	38	EMP008	Cash
39	2024-11-09	5001	39	EMP009	Debit Card
40	2024-11-10	2700	40	EMP010	Transfer
41	2024-11-11	1800	41	EMP011	Credit Card
42	2024-11-12	3000	42	EMP012	Cash
43	2024-11-13	1200	43	EMP013	Debit Card
44	2024-11-14	4201	44	EMP014	Transfer
45	2024-11-15	2801	45	EMP015	Credit Card
46	2024-11-16	2200	46	EMP016	Cash
47	2024-11-17	1501	47	EMP017	Debit Card
48	2024-11-18	3601	48	EMP018	Transfer
49	2024-11-19	4500	49	EMP019	Credit Card
50	2024-11-20	2901	50	EMP020	Cash
51	2024-11-21	1801	1	EMP001	Debit Card
52	2024-11-22	2500	2	EMP002	Transfer
53	2024-11-23	3001	3	EMP003	Credit Card
54	2024-11-24	1500	4	EMP004	Cash
55	2024-11-25	5000	5	EMP005	Debit Card
56	2024-11-26	3801	6	EMP006	Transfer
57	2024-11-27	2501	7	EMP007	Credit Card
58	2024-11-28	3300	8	EMP008	Cash
59	2024-11-29	1800	9	EMP009	Debit Card
60	2024-11-30	4201	10	EMP010	Transfer
61	2024-12-01	3001	11	EMP011	Credit Card
62	2024-12-02	2500	12	EMP012	Cash
63	2024-12-03	3501	13	EMP013	Debit Card
64	2024-12-04	4800	14	EMP014	Transfer
65	2024-12-05	2701	15	EMP015	Credit Card
66	2024-12-06	4100	16	EMP016	Cash
67	2024-12-07	3000	17	EMP017	Debit Card
68	2024-12-08	1501	18	EMP018	Transfer
69	2024-12-09	2200	19	EMP019	Credit Card
70	2024-12-10	2700	20	EMP020	Cash
71	2024-12-11	4201	21	EMP021	Debit Card
72	2024-12-12	5000	22	EMP022	Transfer
73	2024-12-13	3801	23	EMP023	Credit Card
74	2024-12-14	3201	24	EMP024	Cash
75	2024-12-15	2401	25	EMP025	Debit Card
76	2024-12-16	4200	26	EMP026	Transfer
77	2024-12-17	1800	27	EMP027	Credit Card
78	2024-12-18	3501	28	EMP028	Cash
79	2024-12-19	2900	29	EMP029	Debit Card
80	2024-12-20	2501	30	EMP030	Transfer
81	2024-12-21	3001	31	EMP001	Credit Card
82	2024-12-22	1800	32	EMP002	Cash
83	2024-12-23	3201	33	EMP003	Debit Card
84	2024-12-24	2200	34	EMP004	Transfer
85	2024-12-25	4201	35	EMP005	Credit Card
86	2024-12-26	2501	36	EMP006	Cash
87	2024-12-27	3500	37	EMP007	Debit Card
88	2024-12-28	2901	38	EMP008	Transfer
89	2024-12-29	3300	39	EMP009	Credit Card
90	2024-12-30	2000	40	EMP010	Cash
91	2024-12-31	3501	41	EMP011	Debit Card
92	2025-01-01	1500	42	EMP012	Transfer
93	2025-01-02	2700	43	EMP013	Credit Card
94	2025-01-03	3201	44	EMP014	Cash
95	2025-01-04	2500	45	EMP015	Debit Card
96	2025-01-05	5001	46	EMP016	Transfer
97	2025-01-06	3800	47	EMP017	Credit Card
98	2025-01-07	2701	48	EMP018	Cash
99	2025-01-08	3200	49	EMP019	Debit Card
100	2025-01-09	4501	50	EMP020	Transfer
101	2024-11-01	1501	1	EMP001	Credit Card
102	2024-11-02	1200	2	EMP002	Cash
103	2024-11-03	3000	3	EMP003	Debit Card
104	2024-11-04	4500	4	EMP004	Transfer
105	2024-11-05	500	5	EMP005	Credit Card
106	2024-11-06	2401	6	EMP006	Cash
107	2024-11-07	1200	7	EMP007	Debit Card
108	2024-11-08	3201	8	EMP008	Transfer
109	2024-11-09	1800	9	EMP009	Credit Card
110	2024-11-10	1350	10	EMP010	Cash
111	2024-11-11	2901	11	EMP011	Debit Card
112	2024-11-12	4000	12	EMP012	Transfer
113	2024-11-13	750	13	EMP013	Credit Card
114	2024-11-14	2200	14	EMP014	Cash
115	2024-11-15	3500	15	EMP015	Debit Card
116	2024-11-16	4201	16	EMP016	Transfer
117	2024-11-17	5000	17	EMP017	Credit Card
118	2024-11-18	2001	18	EMP018	Cash
119	2024-11-19	2700	19	EMP019	Debit Card
120	2024-11-20	3000	20	EMP020	Transfer
121	2024-11-21	1101	21	EMP021	Credit Card
122	2024-11-22	2200	22	EMP022	Cash
123	2024-11-23	4501	23	EMP023	Debit Card
124	2024-11-24	3200	24	EMP024	Transfer
125	2024-11-25	1800	25	EMP025	Credit Card
126	2024-11-26	2901	26	EMP026	Cash
127	2024-11-27	2401	27	EMP027	Debit Card
128	2024-11-28	3300	28	EMP028	Transfer
129	2024-11-29	1701	29	EMP029	Credit Card
130	2024-11-30	4000	30	EMP030	Cash
131	2024-11-01	1500	31	EMP001	Debit Card
132	2024-11-02	2201	32	EMP002	Transfer
133	2024-11-03	3501	33	EMP003	Credit Card
134	2024-11-04	3000	34	EMP004	Cash
135	2024-11-05	4200	35	EMP005	Debit Card
136	2024-11-06	2900	36	EMP006	Transfer
137	2024-11-07	2401	37	EMP007	Credit Card
138	2024-11-08	3301	38	EMP008	Cash
139	2024-11-09	5001	39	EMP009	Debit Card
140	2024-11-10	2700	40	EMP010	Transfer
141	2024-11-11	1800	41	EMP011	Credit Card
142	2024-11-12	3000	42	EMP012	Cash
143	2024-11-13	1200	43	EMP013	Debit Card
144	2024-11-14	4201	44	EMP014	Transfer
145	2024-11-15	2801	45	EMP015	Credit Card
146	2024-11-16	2200	46	EMP016	Cash
147	2024-11-17	1501	47	EMP017	Debit Card
148	2024-11-18	3601	48	EMP018	Transfer
149	2024-11-19	4500	49	EMP019	Credit Card
150	2024-11-20	2901	50	EMP020	Cash
151	2024-11-21	1801	1	EMP001	Debit Card
152	2024-11-22	2500	2	EMP002	Transfer
153	2024-11-23	3001	3	EMP003	Credit Card
154	2024-11-24	1500	4	EMP004	Cash
155	2024-11-25	5000	5	EMP005	Debit Card
156	2024-11-26	3801	6	EMP006	Transfer
157	2024-11-27	2501	7	EMP007	Credit Card
158	2024-11-28	3300	8	EMP008	Cash
159	2024-11-29	1800	9	EMP009	Debit Card
160	2024-11-30	4201	10	EMP010	Transfer
161	2024-12-01	3001	11	EMP011	Credit Card
162	2024-12-02	2500	12	EMP012	Cash
163	2024-12-03	3501	13	EMP013	Debit Card
164	2024-12-04	4800	14	EMP014	Transfer
165	2024-12-05	2701	15	EMP015	Credit Card
166	2024-12-06	4100	16	EMP016	Cash
167	2024-12-07	3000	17	EMP017	Debit Card
168	2024-12-08	1501	18	EMP018	Transfer
169	2024-12-09	2200	19	EMP019	Credit Card
170	2024-12-10	2700	20	EMP020	Cash
171	2024-12-11	4201	21	EMP021	Debit Card
172	2024-12-12	5000	22	EMP022	Transfer
173	2024-12-13	3801	23	EMP023	Credit Card
174	2024-12-14	3201	24	EMP024	Cash
175	2024-12-15	2401	25	EMP025	Debit Card
176	2024-12-16	4200	26	EMP026	Transfer
177	2024-12-17	1800	27	EMP027	Credit Card
178	2024-12-18	3501	28	EMP028	Cash
179	2024-12-19	2900	29	EMP029	Debit Card
180	2024-12-20	2501	30	EMP030	Transfer
181	2024-12-21	3001	31	EMP001	Credit Card
182	2024-12-22	1800	32	EMP002	Cash
183	2024-12-23	3201	33	EMP003	Debit Card
184	2024-12-24	2200	34	EMP004	Transfer
185	2024-12-25	4201	35	EMP005	Credit Card
186	2024-12-26	2501	36	EMP006	Cash
187	2024-12-27	3500	37	EMP007	Debit Card
188	2024-12-28	2901	38	EMP008	Transfer
189	2024-12-29	3300	39	EMP009	Credit Card
190	2024-12-30	2000	40	EMP010	Cash
191	2024-12-31	3501	41	EMP011	Debit Card
192	2025-01-01	1500	42	EMP012	Transfer
193	2025-01-02	2700	43	EMP013	Credit Card
194	2025-01-03	3201	44	EMP014	Cash
195	2025-01-04	2500	45	EMP015	Debit Card
196	2025-01-05	5001	46	EMP016	Transfer
197	2025-01-06	3800	47	EMP017	Credit Card
198	2025-01-07	2701	48	EMP018	Cash
199	2025-01-08	3200	49	EMP019	Debit Card
200	2025-01-09	4501	50	EMP020	Transfer
201	2022-07-11	575	25	EMP005	Cash
202	2016-09-28	911	10	EMP003	Nequi
203	2021-11-15	4315	21	EMP008	Transfer
204	2022-04-24	4771	40	EMP005	PSE
205	2016-05-29	233	43	EMP003	Credit Card
206	2022-11-04	113	35	EMP003	Credit Card
207	2016-11-05	3564	39	EMP001	PSE
208	2021-03-15	4456	17	EMP004	Nequi
209	2017-05-11	4081	30	EMP008	Nequi
210	2016-10-29	524	43	EMP003	Transfer
211	2024-02-11	400	34	EMP003	Transfer
212	2022-03-08	147	14	EMP006	Daviplata
213	2019-03-13	3737	34	EMP008	Daviplata
214	2015-04-15	3423	45	EMP001	Daviplata
215	2022-09-10	2320	29	EMP006	Nequi
216	2020-10-02	3570	26	EMP002	Nequi
217	2016-07-31	2346	37	EMP007	Nequi
218	2021-06-06	3331	15	EMP003	Nequi
219	2015-10-20	2050	25	EMP008	Nequi
220	2021-02-10	2191	9	EMP002	Nequi
221	2022-06-07	4109	1	EMP007	Transfer
222	2020-07-14	3561	6	EMP004	Nequi
223	2019-05-28	534	23	EMP005	Cash
224	2015-06-19	4060	4	EMP002	Cash
225	2020-01-05	108	39	EMP002	Daviplata
226	2017-10-15	108	19	EMP004	Transfer
227	2015-03-06	2719	44	EMP005	Daviplata
228	2019-01-03	519	40	EMP006	Transfer
229	2022-07-31	4252	20	EMP001	Daviplata
230	2023-01-24	4331	7	EMP008	Nequi
231	2021-05-03	2937	38	EMP008	Cash
232	2015-09-19	4823	33	EMP006	Credit Card
233	2021-03-06	209	33	EMP007	PSE
234	2016-05-04	2721	50	EMP005	Daviplata
235	2016-07-03	285	49	EMP006	Nequi
236	2023-05-27	727	15	EMP002	Transfer
237	2018-01-29	4039	43	EMP007	Cash
238	2016-04-16	216	36	EMP006	Transfer
239	2018-02-26	1765	28	EMP001	Cash
240	2023-10-13	3199	18	EMP005	PSE
241	2022-02-03	671	24	EMP001	Credit Card
242	2022-09-03	2426	23	EMP001	Transfer
243	2015-11-30	826	15	EMP003	PSE
244	2024-12-14	977	33	EMP001	PSE
245	2022-09-16	289	26	EMP001	Credit Card
246	2023-12-01	1660	14	EMP007	Credit Card
247	2018-12-05	4443	36	EMP007	Credit Card
248	2015-05-09	1200	6	EMP005	Credit Card
249	2023-09-22	592	49	EMP002	Transfer
250	2017-04-24	330	5	EMP007	Transfer
251	2018-01-12	216	42	EMP002	Daviplata
252	2017-05-13	2363	15	EMP006	Transfer
253	2022-07-23	3388	25	EMP005	Cash
254	2015-01-03	3703	10	EMP006	Credit Card
255	2016-01-11	1187	45	EMP005	Daviplata
256	2021-04-30	2650	34	EMP004	Cash
257	2020-06-16	824	41	EMP006	Credit Card
258	2015-07-21	1465	13	EMP002	Cash
259	2017-09-21	4825	20	EMP004	Cash
260	2016-07-24	551	30	EMP008	Transfer
261	2018-01-23	4774	38	EMP004	Transfer
262	2016-04-03	849	42	EMP003	Credit Card
263	2015-07-14	3626	19	EMP001	PSE
264	2017-06-01	4259	18	EMP005	Credit Card
265	2021-03-25	1950	24	EMP003	PSE
266	2019-04-19	2865	28	EMP004	PSE
267	2017-01-17	2386	37	EMP007	Daviplata
268	2020-01-16	4516	10	EMP006	Cash
269	2015-06-19	1123	39	EMP004	Cash
270	2020-02-20	1270	40	EMP001	Cash
271	2022-03-24	1265	2	EMP008	Cash
272	2021-02-16	1795	8	EMP004	Transfer
273	2021-08-31	503	28	EMP004	Cash
274	2022-01-21	4028	2	EMP003	Cash
275	2015-03-23	2968	11	EMP003	Daviplata
276	2021-09-22	3238	22	EMP005	Daviplata
277	2015-04-08	1407	11	EMP005	Daviplata
278	2023-12-11	859	10	EMP006	Cash
279	2018-05-17	1137	13	EMP003	Transfer
280	2017-07-28	1228	45	EMP003	Credit Card
281	2016-09-15	2372	27	EMP005	Transfer
282	2016-03-27	2512	8	EMP005	Daviplata
283	2017-01-30	4003	48	EMP001	Cash
284	2018-06-30	4685	19	EMP007	Nequi
285	2016-02-21	3046	43	EMP008	Daviplata
286	2024-08-10	1128	30	EMP001	PSE
287	2022-09-19	1393	2	EMP006	Daviplata
288	2017-03-25	2784	35	EMP006	Daviplata
289	2020-07-14	2258	1	EMP008	PSE
290	2016-09-20	2604	21	EMP003	Transfer
291	2017-12-02	2569	43	EMP008	Nequi
292	2021-04-06	1371	17	EMP002	PSE
293	2017-10-22	1662	35	EMP007	Cash
294	2015-08-28	566	7	EMP005	Credit Card
295	2015-11-20	1171	32	EMP006	Transfer
296	2023-04-13	2550	2	EMP004	Cash
297	2018-12-15	209	9	EMP002	Daviplata
298	2019-07-14	2953	34	EMP008	PSE
299	2017-02-02	2782	23	EMP006	Credit Card
300	2016-05-26	1077	3	EMP005	Credit Card
301	2016-05-28	3249	25	EMP007	PSE
302	2021-02-22	2210	12	EMP003	Daviplata
303	2018-01-17	1591	26	EMP004	Credit Card
304	2021-05-01	4701	45	EMP003	PSE
305	2021-12-28	2632	10	EMP004	Daviplata
306	2022-07-29	2573	49	EMP007	Credit Card
307	2022-03-11	1480	39	EMP005	Daviplata
308	2017-07-30	3387	19	EMP001	Daviplata
309	2020-10-30	4559	46	EMP003	Daviplata
310	2016-06-14	2654	37	EMP004	Cash
311	2021-06-18	1512	47	EMP002	Credit Card
312	2024-02-11	2789	27	EMP001	Credit Card
313	2016-10-24	928	25	EMP005	Cash
314	2015-10-17	1303	42	EMP003	Daviplata
315	2021-03-13	1060	27	EMP002	Credit Card
316	2024-04-30	4989	29	EMP008	Transfer
317	2017-04-30	4624	38	EMP007	Cash
318	2023-06-09	3741	10	EMP001	PSE
319	2024-01-30	1993	25	EMP006	PSE
320	2021-05-14	4748	3	EMP006	Nequi
321	2016-12-28	1065	46	EMP008	Cash
322	2021-04-12	2063	23	EMP003	Daviplata
323	2015-09-11	3215	44	EMP003	Cash
324	2023-08-03	4263	19	EMP004	PSE
325	2017-03-10	4691	7	EMP002	Transfer
326	2024-05-10	2036	42	EMP008	Cash
327	2020-11-16	1471	28	EMP005	Credit Card
328	2021-09-07	929	30	EMP004	Nequi
329	2022-04-02	3701	47	EMP003	Daviplata
330	2021-09-27	1378	4	EMP008	Cash
331	2016-10-15	2356	41	EMP006	Daviplata
332	2020-12-07	1429	19	EMP008	PSE
333	2019-12-17	1180	2	EMP004	Credit Card
334	2017-03-10	2358	41	EMP006	Nequi
335	2018-01-07	2231	47	EMP003	Cash
336	2018-08-11	3745	29	EMP001	Nequi
337	2023-04-12	4557	31	EMP008	Credit Card
338	2020-07-02	2525	34	EMP004	Daviplata
339	2024-03-25	3686	28	EMP006	PSE
340	2020-04-06	1422	14	EMP004	Transfer
341	2017-05-09	3418	26	EMP003	PSE
342	2020-02-13	2601	41	EMP008	Cash
343	2021-05-27	1943	29	EMP008	Credit Card
344	2018-05-13	3512	13	EMP004	PSE
345	2019-05-02	2990	43	EMP007	Cash
346	2021-02-03	3636	9	EMP002	Nequi
347	2021-08-29	1371	16	EMP004	Nequi
348	2023-06-09	3001	42	EMP004	Credit Card
349	2020-03-12	519	8	EMP007	PSE
350	2016-05-09	931	8	EMP007	PSE
351	2017-12-23	3684	33	EMP006	Cash
352	2021-06-01	4894	44	EMP004	Daviplata
353	2015-08-29	2537	23	EMP001	PSE
354	2018-06-26	1972	31	EMP003	PSE
355	2017-09-03	3453	47	EMP005	PSE
356	2015-11-09	1820	24	EMP007	Transfer
357	2021-11-04	4689	15	EMP001	PSE
358	2016-03-27	747	31	EMP002	Cash
359	2016-12-13	243	30	EMP006	Daviplata
360	2024-05-07	3764	40	EMP006	PSE
361	2020-06-13	1162	24	EMP004	Cash
362	2015-07-01	3131	8	EMP004	Cash
363	2023-05-28	3754	34	EMP007	Credit Card
364	2021-12-16	2139	35	EMP008	Transfer
365	2021-07-19	4113	46	EMP003	Cash
366	2022-05-23	3464	2	EMP007	Transfer
367	2022-04-23	1416	6	EMP006	Cash
368	2017-04-12	3106	20	EMP002	Credit Card
369	2020-11-03	3655	18	EMP008	PSE
370	2020-07-07	1106	37	EMP003	Transfer
371	2016-04-27	2454	10	EMP004	Daviplata
372	2024-06-15	4263	21	EMP003	Daviplata
373	2019-08-08	3658	31	EMP005	Nequi
374	2021-07-08	1814	50	EMP003	Nequi
375	2023-06-14	489	47	EMP004	Transfer
376	2020-11-15	3359	29	EMP001	PSE
377	2018-04-26	4580	48	EMP008	Credit Card
378	2024-12-15	2087	2	EMP006	PSE
379	2017-06-03	4800	36	EMP006	Transfer
380	2020-04-03	3666	6	EMP002	Daviplata
381	2015-10-26	3698	49	EMP007	Credit Card
382	2024-09-27	930	48	EMP008	Cash
383	2019-06-28	2998	8	EMP007	PSE
384	2018-11-04	3254	42	EMP005	Nequi
385	2022-12-13	4490	48	EMP001	PSE
386	2019-10-21	1376	10	EMP006	Cash
387	2017-06-01	4447	34	EMP001	Transfer
388	2017-04-08	3501	24	EMP003	Cash
389	2015-01-22	1293	48	EMP006	PSE
390	2015-01-24	4929	3	EMP001	Daviplata
391	2018-02-09	852	11	EMP001	Nequi
392	2018-09-15	1751	2	EMP007	Nequi
393	2018-07-08	4161	6	EMP007	Nequi
394	2018-10-03	4094	23	EMP003	Cash
395	2020-01-17	923	13	EMP007	Nequi
396	2020-08-03	4610	11	EMP002	Daviplata
397	2016-11-09	1046	27	EMP003	Transfer
398	2019-10-08	1045	6	EMP006	Credit Card
399	2017-09-28	3809	11	EMP004	PSE
400	2023-12-02	444	7	EMP008	PSE
401	2016-09-04	4965	37	EMP007	Transfer
402	2024-09-09	1824	37	EMP002	Nequi
403	2017-03-18	3263	24	EMP006	PSE
404	2021-01-23	1247	11	EMP002	Transfer
405	2020-09-14	2002	2	EMP007	Credit Card
406	2019-01-05	1531	5	EMP003	Credit Card
407	2017-12-20	3177	8	EMP001	Nequi
408	2023-01-28	2951	36	EMP004	Cash
409	2019-07-17	2894	41	EMP006	Cash
410	2015-04-23	100	13	EMP003	Cash
411	2019-03-03	985	15	EMP007	Credit Card
412	2019-02-03	2937	28	EMP006	PSE
413	2020-11-02	762	47	EMP002	Nequi
414	2021-03-23	3507	29	EMP008	PSE
415	2015-02-07	268	42	EMP002	Credit Card
416	2023-05-16	1033	38	EMP001	PSE
417	2017-03-26	1112	12	EMP004	Credit Card
418	2020-01-25	134	35	EMP004	Cash
419	2021-12-07	1559	31	EMP003	Credit Card
420	2019-08-20	2250	8	EMP005	Nequi
421	2017-11-18	4697	34	EMP006	Credit Card
422	2023-12-06	631	27	EMP002	Daviplata
423	2024-02-27	1639	18	EMP002	Nequi
424	2019-06-22	4363	10	EMP007	PSE
425	2021-07-10	1857	49	EMP001	Credit Card
426	2021-06-28	3296	33	EMP008	Transfer
427	2021-10-12	2153	8	EMP007	Transfer
428	2018-08-29	2547	50	EMP003	Daviplata
429	2017-01-22	1538	31	EMP005	Cash
430	2015-03-26	2665	43	EMP002	Nequi
431	2021-07-27	3359	46	EMP005	PSE
432	2022-06-30	2679	42	EMP003	Nequi
433	2016-03-06	3548	3	EMP006	Daviplata
434	2021-08-05	618	12	EMP004	Nequi
435	2020-10-01	4600	2	EMP005	Cash
436	2020-02-07	2240	3	EMP007	Cash
437	2018-03-11	3667	5	EMP006	PSE
438	2023-07-02	4387	39	EMP008	Daviplata
439	2018-09-02	2743	21	EMP008	Daviplata
440	2019-09-17	3118	27	EMP008	Daviplata
441	2017-10-24	120	48	EMP004	Nequi
442	2018-07-02	1309	7	EMP002	PSE
443	2018-01-12	3201	26	EMP002	Credit Card
444	2020-06-15	797	4	EMP001	Cash
445	2021-02-15	2266	28	EMP006	Credit Card
446	2016-05-10	1920	10	EMP005	Daviplata
447	2019-04-05	351	17	EMP001	Transfer
448	2023-06-27	3994	42	EMP005	Daviplata
449	2023-02-08	4052	16	EMP003	Daviplata
450	2023-12-22	2759	47	EMP005	Cash
451	2017-07-17	2992	33	EMP001	Daviplata
452	2023-07-27	2973	3	EMP003	Nequi
453	2024-07-29	2465	16	EMP001	PSE
454	2024-04-25	597	8	EMP002	PSE
455	2018-06-29	3208	21	EMP005	Nequi
456	2023-12-04	2943	7	EMP002	PSE
457	2020-12-26	1863	31	EMP007	Credit Card
458	2022-03-28	117	20	EMP001	PSE
459	2018-01-23	4694	1	EMP008	Transfer
460	2024-07-29	828	14	EMP003	Daviplata
461	2016-11-16	4684	43	EMP002	Daviplata
462	2023-06-13	2292	4	EMP002	Cash
463	2022-01-13	2280	21	EMP007	Cash
464	2024-06-08	990	29	EMP006	Daviplata
465	2019-06-05	4078	8	EMP001	Daviplata
466	2016-11-09	3739	47	EMP003	Transfer
467	2016-10-27	4302	31	EMP001	Nequi
468	2019-07-27	3422	45	EMP007	Transfer
469	2022-11-25	148	17	EMP004	PSE
470	2015-10-09	3727	17	EMP004	Nequi
471	2022-08-20	2723	14	EMP007	Credit Card
472	2023-08-28	2656	3	EMP008	Transfer
473	2018-03-12	2917	4	EMP005	PSE
474	2024-08-18	2753	42	EMP007	PSE
475	2019-04-22	4616	46	EMP004	Transfer
476	2024-01-04	4820	34	EMP001	Cash
477	2018-03-11	2397	41	EMP006	PSE
478	2021-11-08	2672	41	EMP006	Daviplata
479	2015-02-17	1994	18	EMP007	Transfer
480	2017-05-18	3118	46	EMP005	Transfer
481	2019-11-27	3862	43	EMP004	Daviplata
482	2018-09-05	2015	16	EMP007	Daviplata
483	2015-09-01	1551	6	EMP003	PSE
484	2021-09-08	1994	44	EMP008	Transfer
485	2017-12-03	2068	23	EMP003	Daviplata
486	2023-08-21	2136	3	EMP003	PSE
487	2018-02-06	2676	25	EMP007	Cash
488	2023-10-22	4591	8	EMP008	Cash
489	2019-06-08	2001	23	EMP008	Nequi
490	2020-10-19	3044	7	EMP004	Cash
491	2016-08-11	1823	2	EMP004	Credit Card
492	2021-12-05	2012	13	EMP006	Cash
493	2019-03-25	3175	39	EMP005	Nequi
494	2016-09-05	460	29	EMP003	Nequi
495	2023-01-29	2524	37	EMP004	Credit Card
496	2024-01-12	996	43	EMP002	PSE
497	2015-11-21	195	14	EMP001	PSE
498	2017-09-04	1156	49	EMP001	Nequi
499	2024-10-28	685	15	EMP004	Transfer
500	2021-08-17	1842	43	EMP007	Transfer
501	2016-11-30	484	28	EMP004	Credit Card
502	2022-02-06	1508	4	EMP008	Transfer
503	2015-03-27	2196	46	EMP003	Transfer
504	2019-12-22	1499	50	EMP008	Nequi
505	2020-02-24	3841	30	EMP002	Nequi
506	2019-10-23	1125	33	EMP002	PSE
507	2015-06-20	2413	39	EMP007	Nequi
508	2020-06-19	4720	17	EMP005	PSE
509	2020-01-02	1072	4	EMP005	Cash
510	2016-10-18	582	47	EMP003	Nequi
511	2024-08-01	153	37	EMP002	Transfer
512	2022-08-11	150	29	EMP001	Transfer
513	2017-06-17	3629	5	EMP008	Cash
514	2019-04-14	536	26	EMP001	PSE
515	2022-07-05	4228	22	EMP004	Cash
516	2024-03-20	2807	48	EMP001	Transfer
517	2020-04-13	2783	36	EMP006	Transfer
518	2019-08-09	3199	24	EMP001	Cash
519	2018-03-06	2658	48	EMP004	Daviplata
520	2022-08-11	4934	34	EMP008	PSE
521	2017-07-09	4435	33	EMP001	PSE
522	2015-03-21	4490	10	EMP004	PSE
523	2022-08-19	4012	16	EMP003	PSE
524	2023-01-08	1072	31	EMP003	Transfer
525	2019-09-04	4673	35	EMP004	Daviplata
526	2019-07-28	718	45	EMP005	Daviplata
527	2018-09-27	3005	50	EMP003	Credit Card
528	2021-04-24	3138	14	EMP001	Cash
529	2023-12-29	1914	13	EMP002	Credit Card
530	2018-07-02	2333	46	EMP003	Transfer
531	2015-01-31	3715	12	EMP003	Daviplata
532	2017-02-19	2598	6	EMP002	Daviplata
533	2015-01-01	4217	4	EMP003	Transfer
534	2022-11-07	2460	4	EMP008	Cash
535	2015-04-18	4190	38	EMP007	Daviplata
536	2016-04-16	4710	22	EMP005	Daviplata
537	2018-12-23	1283	29	EMP003	PSE
538	2015-08-31	3386	3	EMP005	PSE
539	2016-02-18	2161	50	EMP001	Credit Card
540	2021-09-07	3673	38	EMP004	Nequi
541	2022-01-02	1786	12	EMP001	Credit Card
542	2023-07-14	1121	38	EMP008	Credit Card
543	2016-06-19	1164	47	EMP005	Daviplata
544	2016-07-12	1680	11	EMP004	PSE
545	2021-02-02	3095	31	EMP005	Nequi
546	2022-10-29	4739	8	EMP002	Transfer
547	2017-12-07	1140	12	EMP001	Cash
548	2016-12-29	2592	24	EMP003	Credit Card
549	2020-06-22	4657	21	EMP005	Nequi
550	2020-07-31	3591	26	EMP007	Credit Card
551	2024-04-16	3646	8	EMP006	Nequi
552	2018-12-18	2147	34	EMP004	Nequi
553	2017-10-27	2728	26	EMP006	PSE
554	2015-04-30	2151	33	EMP002	PSE
555	2020-01-26	2619	37	EMP008	Credit Card
556	2022-07-21	597	41	EMP007	Credit Card
557	2024-01-30	1929	36	EMP002	Nequi
558	2018-01-19	1085	23	EMP002	PSE
559	2020-02-19	2671	15	EMP004	Cash
560	2023-09-27	4514	17	EMP004	PSE
561	2015-10-13	4552	30	EMP005	Credit Card
562	2024-04-22	1581	12	EMP001	Credit Card
563	2021-01-26	3544	33	EMP006	PSE
564	2017-01-23	3798	8	EMP006	Transfer
565	2021-03-13	1193	12	EMP006	Daviplata
566	2021-10-06	4153	48	EMP002	Transfer
567	2019-06-21	1115	14	EMP006	Nequi
568	2024-04-18	2457	47	EMP002	Cash
569	2015-07-05	3685	18	EMP001	PSE
570	2024-10-15	2249	21	EMP002	Transfer
571	2018-12-23	1161	16	EMP007	PSE
572	2023-02-01	3548	8	EMP008	PSE
573	2021-10-23	3660	45	EMP005	Cash
574	2018-04-24	998	20	EMP002	Nequi
575	2018-11-19	2388	23	EMP003	Daviplata
576	2018-05-08	4816	5	EMP003	Nequi
577	2016-12-19	576	47	EMP002	PSE
578	2020-07-11	4581	1	EMP001	Daviplata
579	2020-04-18	3337	46	EMP003	Nequi
580	2019-11-22	3415	21	EMP005	Cash
581	2023-01-02	1886	32	EMP003	PSE
582	2023-06-25	3074	38	EMP006	Transfer
583	2017-08-02	1034	6	EMP005	PSE
584	2020-02-04	3773	10	EMP002	Cash
585	2017-04-03	3921	11	EMP004	PSE
586	2017-06-24	1968	2	EMP002	Credit Card
587	2018-06-22	4669	39	EMP001	Cash
588	2023-05-30	1792	24	EMP006	Daviplata
589	2017-09-13	4928	41	EMP008	Daviplata
590	2020-07-15	1045	45	EMP008	Nequi
591	2020-07-04	990	36	EMP001	PSE
592	2024-10-03	3893	42	EMP001	PSE
593	2017-09-05	3219	7	EMP006	Cash
594	2023-02-02	380	42	EMP005	Cash
595	2020-12-09	3343	14	EMP006	Daviplata
596	2017-06-18	3834	11	EMP006	PSE
597	2017-01-15	2837	12	EMP001	Nequi
598	2018-01-08	2210	27	EMP004	Daviplata
599	2017-06-15	2252	50	EMP008	Nequi
600	2020-11-15	2225	37	EMP005	PSE
601	2016-12-08	358	15	EMP001	Transfer
602	2016-07-01	529	27	EMP006	PSE
603	2016-03-10	2903	42	EMP002	Credit Card
604	2018-02-06	2332	50	EMP001	Nequi
605	2017-11-22	900	2	EMP002	Transfer
606	2018-08-10	2131	28	EMP003	Credit Card
607	2017-12-25	2813	24	EMP007	Daviplata
608	2020-07-02	585	18	EMP008	Daviplata
609	2024-01-11	3936	48	EMP003	Nequi
610	2021-07-20	2233	12	EMP008	Cash
611	2017-04-17	4156	40	EMP005	Nequi
612	2022-09-03	4294	47	EMP001	Nequi
613	2017-02-19	4691	45	EMP004	Credit Card
614	2017-03-22	4015	43	EMP002	Cash
615	2022-12-23	1938	25	EMP007	Nequi
616	2016-09-01	969	42	EMP007	Cash
617	2016-02-27	3318	21	EMP003	Nequi
618	2021-02-07	910	50	EMP006	Credit Card
619	2015-07-15	456	9	EMP004	Credit Card
620	2018-06-07	2842	15	EMP002	PSE
621	2023-10-08	636	19	EMP005	Nequi
622	2022-09-10	3289	27	EMP006	Nequi
623	2024-06-01	4731	24	EMP008	Credit Card
624	2023-03-17	3647	11	EMP005	Cash
625	2016-03-13	4764	10	EMP002	Credit Card
626	2017-12-29	1327	39	EMP005	Credit Card
627	2022-10-06	1727	17	EMP004	Transfer
628	2019-12-24	2588	48	EMP003	Daviplata
629	2022-12-12	2755	37	EMP005	Nequi
630	2024-07-27	1836	29	EMP002	Cash
631	2021-01-10	1958	28	EMP001	Nequi
632	2024-11-17	3352	50	EMP001	PSE
633	2024-02-20	3577	17	EMP002	Nequi
634	2018-02-09	1137	20	EMP008	Transfer
635	2024-04-25	2472	32	EMP005	Credit Card
636	2015-10-17	2439	2	EMP004	Cash
637	2022-02-05	1180	10	EMP002	Cash
638	2015-12-29	4860	22	EMP007	Transfer
639	2021-06-11	2108	37	EMP005	Credit Card
640	2021-04-01	1226	19	EMP006	Daviplata
641	2024-01-31	2491	46	EMP001	Cash
642	2015-03-30	2061	45	EMP005	Transfer
643	2021-08-29	4680	31	EMP001	Cash
644	2016-04-27	2632	35	EMP001	PSE
645	2021-05-23	4008	20	EMP005	Transfer
646	2021-12-04	3370	6	EMP001	Cash
647	2020-04-24	4573	26	EMP002	Cash
648	2021-03-29	1972	38	EMP005	Nequi
649	2017-07-26	3376	37	EMP004	Transfer
650	2021-01-30	1873	12	EMP008	Transfer
651	2024-03-20	2388	45	EMP008	PSE
652	2018-11-15	425	48	EMP005	Transfer
653	2022-09-30	3583	45	EMP002	Cash
654	2024-11-12	4684	15	EMP005	Credit Card
655	2020-04-10	1168	21	EMP003	Nequi
656	2022-04-11	3286	28	EMP006	PSE
657	2020-01-08	3740	9	EMP008	Cash
658	2021-04-28	4949	42	EMP005	Transfer
659	2016-01-24	4682	49	EMP005	Credit Card
660	2023-04-15	3184	47	EMP004	PSE
661	2019-07-29	641	40	EMP005	PSE
662	2018-06-05	2569	9	EMP003	Transfer
663	2019-02-27	1647	15	EMP007	PSE
664	2024-10-02	4120	10	EMP004	Cash
665	2022-02-18	413	11	EMP008	PSE
666	2015-01-11	2077	48	EMP008	Transfer
667	2021-09-05	4769	40	EMP004	Credit Card
668	2016-05-18	133	15	EMP006	Credit Card
669	2015-07-24	1329	12	EMP004	Credit Card
670	2015-02-01	4847	38	EMP003	Nequi
671	2017-10-08	368	13	EMP006	Cash
672	2020-03-23	2644	35	EMP007	Credit Card
673	2023-10-06	2465	3	EMP001	Daviplata
674	2020-05-26	577	23	EMP007	Cash
675	2024-01-25	1780	34	EMP006	Credit Card
676	2022-10-24	1370	15	EMP001	Transfer
677	2015-04-27	2278	17	EMP005	Credit Card
678	2015-11-13	3266	24	EMP006	Daviplata
679	2022-11-09	1644	26	EMP008	Cash
680	2023-07-06	1625	24	EMP007	Nequi
681	2020-05-09	2791	44	EMP003	Cash
682	2022-03-31	1389	50	EMP007	Transfer
683	2016-12-12	2167	6	EMP006	Nequi
684	2019-02-17	2394	28	EMP001	Daviplata
685	2021-12-12	2233	43	EMP004	Credit Card
686	2017-08-08	997	17	EMP003	Nequi
687	2022-07-30	2208	22	EMP003	Credit Card
688	2023-08-27	411	33	EMP007	PSE
689	2018-12-10	534	27	EMP001	PSE
690	2022-05-14	3496	48	EMP003	Nequi
691	2023-12-21	447	16	EMP004	Cash
692	2015-04-15	2811	18	EMP007	Cash
693	2018-11-10	111	8	EMP006	Nequi
694	2024-02-29	3123	4	EMP006	Cash
695	2020-09-21	4433	12	EMP002	Transfer
696	2020-10-03	4732	27	EMP007	PSE
697	2019-05-10	4969	24	EMP008	Cash
698	2015-10-03	1963	44	EMP003	Daviplata
699	2017-07-02	4513	22	EMP006	Cash
700	2021-07-22	2377	35	EMP005	Nequi
701	2020-09-06	1322	48	EMP001	Daviplata
702	2024-12-20	4335	38	EMP004	PSE
703	2018-11-09	1895	10	EMP001	PSE
704	2016-02-29	3287	8	EMP001	Cash
705	2024-05-25	2956	37	EMP005	PSE
706	2021-08-22	2569	22	EMP005	Transfer
707	2022-09-10	694	11	EMP006	PSE
708	2024-12-06	1732	22	EMP005	Cash
709	2023-10-29	3618	7	EMP002	Credit Card
710	2019-06-10	3949	47	EMP006	Credit Card
711	2018-04-30	2085	5	EMP008	Cash
712	2020-01-05	4692	10	EMP005	Nequi
713	2016-05-23	1365	48	EMP004	Nequi
714	2021-07-22	2963	34	EMP004	Daviplata
715	2017-07-27	4648	48	EMP002	Credit Card
716	2024-01-02	3844	30	EMP006	Cash
717	2019-06-28	4478	13	EMP005	Credit Card
718	2016-12-10	4193	22	EMP007	Transfer
719	2015-07-07	2704	23	EMP001	Credit Card
720	2023-04-24	3449	24	EMP004	Daviplata
721	2023-08-22	1565	16	EMP004	Cash
722	2017-11-09	3910	14	EMP001	Credit Card
723	2017-04-03	2985	48	EMP001	Daviplata
724	2017-10-04	811	10	EMP005	Daviplata
725	2023-11-08	1152	40	EMP007	Transfer
726	2015-02-17	4791	32	EMP008	Daviplata
727	2020-05-24	2597	46	EMP005	Credit Card
728	2015-04-18	1237	3	EMP002	Nequi
729	2018-03-11	2114	46	EMP001	Daviplata
730	2021-12-22	2182	50	EMP004	Transfer
731	2024-08-26	135	24	EMP001	Transfer
732	2016-07-10	3231	3	EMP004	Nequi
733	2017-10-13	751	22	EMP007	Credit Card
734	2016-03-05	4117	5	EMP002	Nequi
735	2016-11-18	3503	48	EMP004	Transfer
736	2015-04-18	1067	7	EMP008	Transfer
737	2020-04-08	2186	17	EMP006	Cash
738	2020-10-18	3759	11	EMP002	Nequi
739	2018-10-02	3830	32	EMP008	Daviplata
740	2021-07-22	156	9	EMP003	Transfer
741	2024-08-11	3902	4	EMP003	Cash
742	2023-02-08	2518	22	EMP008	Nequi
743	2021-08-30	1780	24	EMP002	Nequi
744	2021-01-01	4465	17	EMP007	Nequi
745	2017-05-03	2004	6	EMP008	PSE
746	2016-12-05	738	40	EMP001	Cash
747	2024-03-07	1558	2	EMP006	PSE
748	2021-03-24	3093	24	EMP007	PSE
749	2017-01-31	2266	16	EMP003	Cash
750	2021-11-05	3952	29	EMP005	PSE
751	2023-07-03	2359	19	EMP005	Daviplata
752	2020-09-24	3567	41	EMP003	Credit Card
753	2017-11-11	3882	26	EMP003	Daviplata
754	2019-03-09	3775	14	EMP005	Transfer
755	2020-07-21	2635	19	EMP003	Cash
756	2020-11-22	2274	50	EMP002	PSE
757	2022-09-29	1784	50	EMP006	Cash
758	2017-12-31	3178	45	EMP001	Transfer
759	2016-06-13	2258	36	EMP001	PSE
760	2016-01-15	4885	4	EMP004	Daviplata
761	2022-08-17	613	39	EMP004	Cash
762	2023-10-28	3396	45	EMP007	Daviplata
763	2021-05-10	1603	5	EMP003	Transfer
764	2016-09-12	3410	21	EMP007	Transfer
765	2018-03-16	992	16	EMP008	Nequi
766	2024-12-05	2733	8	EMP008	Nequi
767	2018-07-08	3606	27	EMP007	Transfer
768	2017-02-24	237	11	EMP003	Daviplata
769	2015-01-01	402	45	EMP001	Credit Card
770	2020-12-09	1213	12	EMP006	Cash
771	2021-04-07	4466	10	EMP003	Nequi
772	2021-12-17	303	27	EMP004	Nequi
773	2016-01-15	1749	42	EMP006	Transfer
774	2018-07-29	1360	45	EMP001	PSE
775	2015-11-09	195	48	EMP003	Daviplata
776	2021-03-19	730	27	EMP004	PSE
777	2019-01-22	2054	3	EMP002	PSE
778	2022-07-21	304	42	EMP006	Cash
779	2021-10-17	356	28	EMP004	Nequi
780	2021-02-16	4508	6	EMP004	PSE
781	2023-08-14	4924	19	EMP006	Credit Card
782	2018-09-27	4321	30	EMP003	Transfer
783	2017-04-25	4236	18	EMP003	Transfer
784	2021-03-04	3942	16	EMP004	Cash
785	2022-11-22	2461	48	EMP001	Transfer
786	2022-12-05	4801	6	EMP003	Transfer
787	2024-03-15	862	47	EMP001	Transfer
788	2021-12-15	2921	31	EMP003	Transfer
789	2022-03-26	1648	39	EMP006	Nequi
790	2023-04-26	4519	20	EMP005	PSE
791	2021-09-25	1651	28	EMP002	Nequi
792	2018-06-01	2957	30	EMP002	Daviplata
793	2016-09-11	3661	23	EMP005	Cash
794	2021-03-20	919	11	EMP002	Nequi
795	2019-07-15	354	21	EMP007	PSE
796	2021-06-25	1614	47	EMP006	PSE
797	2018-04-04	972	27	EMP002	Transfer
798	2022-08-11	192	25	EMP005	Credit Card
799	2020-04-06	3612	49	EMP005	Daviplata
800	2021-08-01	1101	25	EMP007	Nequi
801	2021-07-02	1655	32	EMP002	Nequi
802	2024-10-04	3170	46	EMP006	PSE
803	2018-06-03	1576	28	EMP004	Cash
804	2023-02-27	875	25	EMP003	Daviplata
805	2015-11-18	3306	29	EMP006	PSE
806	2024-09-26	2438	47	EMP006	Transfer
807	2021-04-24	4145	37	EMP007	Credit Card
808	2021-04-25	3066	39	EMP004	Credit Card
809	2018-07-20	668	36	EMP004	Nequi
810	2020-04-21	4583	36	EMP001	PSE
811	2019-07-03	898	1	EMP007	Transfer
812	2022-03-28	3711	21	EMP002	Nequi
813	2017-03-16	2592	22	EMP008	Transfer
814	2017-01-07	2360	15	EMP003	PSE
815	2024-05-08	1976	43	EMP004	Cash
816	2016-08-16	3688	43	EMP007	Daviplata
817	2019-02-26	2269	37	EMP003	Credit Card
818	2016-12-14	3711	14	EMP003	Nequi
819	2019-11-30	2970	15	EMP004	Transfer
820	2016-03-15	3399	29	EMP003	Credit Card
821	2021-05-27	2494	44	EMP008	PSE
822	2017-08-13	4755	32	EMP008	Credit Card
823	2022-06-10	728	49	EMP002	Transfer
824	2015-05-23	4520	17	EMP005	Nequi
825	2017-04-23	3594	41	EMP003	Transfer
826	2018-12-23	2155	13	EMP007	Daviplata
827	2015-08-27	2261	19	EMP002	Nequi
828	2020-11-13	4998	25	EMP007	Credit Card
829	2018-11-17	4480	45	EMP005	Transfer
830	2016-09-21	4080	44	EMP007	Credit Card
831	2018-09-14	4515	42	EMP001	Daviplata
832	2015-10-01	4304	1	EMP007	Transfer
833	2019-04-24	4813	23	EMP003	Daviplata
834	2024-05-02	3533	31	EMP005	Cash
835	2015-07-26	2994	19	EMP006	Daviplata
836	2022-10-10	4679	7	EMP005	Cash
837	2020-01-14	488	18	EMP004	Nequi
838	2020-04-14	523	30	EMP006	Cash
839	2021-09-19	3958	38	EMP003	Credit Card
840	2015-04-09	2265	48	EMP005	PSE
841	2022-10-17	1737	36	EMP004	Nequi
842	2021-07-10	994	18	EMP008	Cash
843	2023-11-23	3921	42	EMP007	Nequi
844	2024-12-25	3899	17	EMP006	PSE
845	2019-01-01	847	19	EMP007	Transfer
846	2024-09-22	1982	37	EMP008	Transfer
847	2024-09-06	4747	26	EMP003	Credit Card
848	2023-12-13	1335	33	EMP008	Credit Card
849	2015-12-11	1268	6	EMP004	Daviplata
850	2022-06-29	4501	50	EMP001	Daviplata
851	2021-01-19	4501	15	EMP005	Transfer
852	2024-04-03	963	38	EMP008	Cash
853	2018-12-20	3535	22	EMP002	Credit Card
854	2015-12-20	3542	43	EMP001	Transfer
855	2016-05-02	2989	11	EMP001	PSE
856	2021-09-03	4799	16	EMP001	Cash
857	2018-03-14	1533	27	EMP001	PSE
858	2018-06-24	510	7	EMP006	Daviplata
859	2023-03-05	951	22	EMP006	PSE
860	2018-12-24	3695	34	EMP005	Transfer
861	2022-03-10	1757	28	EMP001	Daviplata
862	2024-06-23	3432	3	EMP003	Nequi
863	2017-10-06	2966	32	EMP004	Transfer
864	2023-11-08	1725	13	EMP002	Nequi
865	2017-09-23	4347	3	EMP005	PSE
866	2017-07-08	142	6	EMP007	Credit Card
867	2021-01-29	1920	31	EMP005	Credit Card
868	2024-01-06	2767	31	EMP001	Nequi
869	2020-09-09	3098	34	EMP001	Daviplata
870	2022-09-06	2082	47	EMP006	Credit Card
871	2019-01-08	3716	48	EMP008	Credit Card
872	2023-01-26	4758	21	EMP005	Daviplata
873	2017-01-04	199	45	EMP005	Cash
874	2018-09-30	3785	2	EMP008	Nequi
875	2019-03-02	4976	30	EMP007	Credit Card
876	2022-03-26	2473	42	EMP008	Cash
877	2022-08-31	965	35	EMP001	Cash
878	2019-12-12	4100	33	EMP001	Transfer
879	2017-04-05	865	35	EMP004	Transfer
880	2015-12-10	2093	24	EMP004	Nequi
881	2022-10-04	3968	47	EMP004	Daviplata
882	2016-03-27	4908	50	EMP005	Nequi
883	2017-12-10	2752	16	EMP002	PSE
884	2019-05-27	2630	5	EMP001	Transfer
885	2020-03-15	1458	5	EMP004	Nequi
886	2015-02-17	2802	42	EMP005	Cash
887	2016-06-12	1511	32	EMP005	Nequi
888	2015-05-04	4632	31	EMP004	PSE
889	2018-08-20	3580	17	EMP008	Nequi
890	2018-07-14	4042	9	EMP002	Daviplata
891	2022-09-23	2347	4	EMP001	Cash
892	2021-06-17	710	19	EMP008	Daviplata
893	2018-05-25	1532	7	EMP001	Credit Card
894	2016-10-10	3141	50	EMP008	Transfer
895	2016-01-01	1222	4	EMP008	Cash
896	2017-07-03	1437	24	EMP002	Daviplata
897	2019-07-16	2882	19	EMP006	Nequi
898	2017-01-27	4884	4	EMP004	Cash
899	2017-02-01	4156	43	EMP005	Credit Card
900	2024-11-01	2762	6	EMP002	Cash
901	2019-05-17	916	38	EMP008	Cash
902	2016-03-17	902	37	EMP006	Cash
903	2015-09-30	1603	6	EMP004	Daviplata
904	2018-08-27	1256	31	EMP003	Credit Card
905	2019-07-26	1039	47	EMP003	Cash
906	2024-10-28	2015	36	EMP003	Credit Card
907	2020-06-11	4272	39	EMP003	Daviplata
908	2019-01-23	1806	14	EMP002	Daviplata
909	2017-01-23	705	22	EMP003	Credit Card
910	2024-03-26	4546	7	EMP004	Cash
911	2019-09-19	3901	22	EMP003	Cash
912	2018-08-18	4393	44	EMP002	Credit Card
913	2021-04-14	1483	28	EMP002	Transfer
914	2022-10-03	2176	36	EMP004	Nequi
915	2016-03-17	3408	21	EMP005	Credit Card
916	2016-01-14	1225	24	EMP005	PSE
917	2024-08-19	4123	6	EMP002	Transfer
918	2017-05-01	3745	15	EMP002	Transfer
919	2015-05-11	1774	18	EMP004	Nequi
920	2017-02-20	4428	47	EMP004	Cash
921	2022-09-28	4914	9	EMP002	Cash
922	2022-03-17	4863	5	EMP003	Transfer
923	2019-10-15	3845	48	EMP003	Daviplata
924	2017-12-01	1948	9	EMP003	Daviplata
925	2023-07-29	626	37	EMP005	Transfer
926	2018-09-03	3510	38	EMP004	PSE
927	2018-12-15	1770	42	EMP006	Daviplata
928	2020-07-27	117	16	EMP005	Nequi
929	2017-05-20	4630	18	EMP008	Credit Card
930	2016-11-25	1846	1	EMP008	Nequi
931	2023-10-25	1050	10	EMP005	Nequi
932	2021-02-04	1268	15	EMP002	Nequi
933	2022-12-20	4563	15	EMP006	PSE
934	2015-09-30	106	20	EMP006	Credit Card
935	2017-05-10	1097	5	EMP005	Credit Card
936	2024-10-08	121	50	EMP001	PSE
937	2017-05-11	2314	24	EMP001	Nequi
938	2024-09-26	4121	7	EMP001	Cash
939	2015-05-16	1199	26	EMP001	Transfer
940	2016-06-21	2670	3	EMP003	Cash
941	2023-03-28	2693	11	EMP001	Transfer
942	2023-10-20	4023	17	EMP004	Transfer
943	2021-04-06	2470	17	EMP001	Daviplata
944	2017-08-25	2252	31	EMP002	Daviplata
945	2024-08-25	3295	14	EMP007	PSE
946	2021-10-05	2585	14	EMP002	PSE
947	2016-08-04	3584	39	EMP007	Nequi
948	2024-12-09	2648	8	EMP001	Daviplata
949	2019-12-28	4247	23	EMP006	Daviplata
950	2020-10-24	3979	16	EMP004	Transfer
951	2017-04-11	3986	31	EMP003	Daviplata
952	2021-08-23	1266	27	EMP004	Credit Card
953	2021-11-14	1887	6	EMP002	PSE
954	2018-05-19	4809	19	EMP001	Transfer
955	2018-07-28	989	49	EMP007	Transfer
956	2015-06-12	1412	8	EMP001	Credit Card
957	2024-01-29	3363	20	EMP008	Nequi
958	2021-09-19	1314	22	EMP006	Transfer
959	2023-05-16	2981	50	EMP008	Nequi
960	2021-01-08	3732	35	EMP007	PSE
961	2019-05-01	3840	23	EMP007	Daviplata
962	2018-06-11	2357	40	EMP006	PSE
963	2022-11-20	2399	39	EMP001	PSE
964	2016-05-06	2646	40	EMP007	Cash
965	2022-12-22	3046	40	EMP002	PSE
966	2016-10-04	4997	35	EMP006	Daviplata
967	2019-09-03	2179	25	EMP007	Credit Card
968	2020-05-11	3978	14	EMP002	Cash
969	2016-11-10	918	23	EMP008	Cash
970	2019-02-16	4193	15	EMP003	Credit Card
971	2017-11-22	805	37	EMP007	Credit Card
972	2018-10-29	4591	3	EMP007	Credit Card
973	2024-06-17	948	2	EMP003	Transfer
974	2022-05-11	767	29	EMP008	Credit Card
975	2018-07-29	4176	14	EMP004	Daviplata
976	2016-01-31	2129	49	EMP008	Daviplata
977	2022-01-07	3403	12	EMP005	Transfer
978	2024-05-20	3694	24	EMP002	Credit Card
979	2019-05-24	4551	33	EMP006	PSE
980	2016-07-13	699	26	EMP008	Daviplata
981	2021-05-08	1370	28	EMP006	PSE
982	2018-11-01	3789	13	EMP003	Cash
983	2020-12-27	4210	27	EMP005	Daviplata
984	2024-07-23	1969	40	EMP007	Daviplata
985	2018-11-21	2636	37	EMP007	Credit Card
986	2024-08-08	1123	26	EMP002	Daviplata
987	2024-10-10	1452	29	EMP008	PSE
988	2017-10-03	1399	27	EMP002	Credit Card
989	2022-09-06	288	40	EMP002	Transfer
990	2020-12-09	3338	21	EMP002	Credit Card
991	2020-11-30	2528	42	EMP008	Nequi
992	2021-05-31	3033	14	EMP001	Transfer
993	2018-02-12	255	22	EMP003	Nequi
994	2015-01-28	2523	32	EMP005	Daviplata
995	2021-06-30	2578	49	EMP002	Transfer
996	2021-01-05	2999	23	EMP005	Credit Card
997	2022-04-24	3380	46	EMP002	Transfer
\.


--
-- TOC entry 4937 (class 0 OID 34248)
-- Dependencies: 258
-- Data for Name: purchase_detail; Type: TABLE DATA; Schema: proyecto; Owner: postgres
--

COPY proyecto.purchase_detail (id, product_id, purchase_id, amount, cost) FROM stdin;
1	1	1	10	85000
2	2	1	5	40000
3	3	2	8	76000
4	4	2	20	150000
5	5	3	15	90000
6	6	3	10	80000
7	7	4	5	75000
8	8	4	12	102000
9	9	5	18	120000
10	10	5	6	54000
11	11	6	9	81000
12	12	6	4	36000
13	13	7	10	85000
14	14	7	3	25500
15	15	8	20	170000
16	16	8	7	59500
17	17	9	12	102000
18	18	9	6	51000
19	19	10	8	68000
20	20	10	5	42500
21	21	11	15	127500
22	22	11	2	17000
23	23	12	18	153000
24	24	12	3	25500
25	25	13	6	51000
26	26	13	10	85000
27	27	14	9	76500
28	28	14	4	34000
29	29	15	12	102000
30	30	15	8	68000
31	31	16	15	127500
32	32	16	5	42500
33	33	17	20	170000
34	34	17	7	59500
35	35	18	9	76500
36	36	18	6	51000
37	37	19	12	102000
38	38	19	8	68000
39	39	20	15	127500
40	40	20	5	42500
41	41	21	18	153000
42	42	21	7	59500
43	43	22	9	76500
44	44	22	4	34000
45	45	23	12	102000
46	46	23	10	85000
47	47	24	8	68000
48	48	24	6	51000
49	49	25	20	170000
50	50	25	5	42500
51	1	1	10	85000
52	2	1	5	40000
53	3	2	8	76000
54	4	2	20	150000
55	5	3	15	90000
56	6	3	10	80000
57	7	4	5	75000
58	8	4	12	102000
59	9	5	18	120000
60	10	5	6	54000
61	11	6	9	81000
62	12	6	4	36000
63	13	7	10	85000
64	14	7	3	25500
65	15	8	20	170000
66	16	8	7	59500
67	17	9	12	102000
68	18	9	6	51000
69	19	10	8	68000
70	20	10	5	42500
71	21	11	15	127500
72	22	11	2	17000
73	23	12	18	153000
74	24	12	3	25500
75	25	13	6	51000
76	26	13	10	85000
77	27	14	9	76500
78	28	14	4	34000
79	29	15	12	102000
80	30	15	8	68000
81	31	16	15	127500
82	32	16	5	42500
83	33	17	20	170000
84	34	17	7	59500
85	35	18	9	76500
86	36	18	6	51000
87	37	19	12	102000
88	38	19	8	68000
89	39	20	15	127500
90	40	20	5	42500
91	41	21	18	153000
92	42	21	7	59500
93	43	22	9	76500
94	44	22	4	34000
95	45	23	12	102000
96	46	23	10	85000
97	47	24	8	68000
98	48	24	6	51000
99	49	25	20	170000
100	50	25	5	42500
101	1	1	10	85000
102	2	1	5	40000
103	3	2	8	76000
104	4	2	20	150000
105	5	3	15	90000
106	6	3	10	80000
107	7	4	5	75000
108	8	4	12	102000
109	9	5	18	120000
110	10	5	6	54000
111	11	6	9	81000
112	12	6	4	36000
113	13	7	10	85000
114	14	7	3	25500
115	15	8	20	170000
116	16	8	7	59500
117	17	9	12	102000
118	18	9	6	51000
119	19	10	8	68000
120	20	10	5	42500
121	21	11	15	127500
122	22	11	2	17000
123	23	12	18	153000
124	24	12	3	25500
125	25	13	6	51000
126	26	13	10	85000
127	27	14	9	76500
128	28	14	4	34000
129	29	15	12	102000
130	30	15	8	68000
131	31	16	15	127500
132	32	16	5	42500
133	33	17	20	170000
134	34	17	7	59500
135	35	18	9	76500
136	36	18	6	51000
137	37	19	12	102000
138	38	19	8	68000
139	39	20	15	127500
140	40	20	5	42500
141	41	21	18	153000
142	42	21	7	59500
143	43	22	9	76500
144	44	22	4	34000
145	45	23	12	102000
146	46	23	10	85000
147	47	24	8	68000
148	48	24	6	51000
149	49	25	20	170000
150	50	25	5	42500
151	1	1	10	85000
152	2	1	5	40000
153	3	2	8	76000
154	4	2	20	150000
155	5	3	15	90000
156	6	3	10	80000
157	7	4	5	75000
158	8	4	12	102000
159	9	5	18	120000
160	10	5	6	54000
161	11	6	9	81000
162	12	6	4	36000
163	13	7	10	85000
164	14	7	3	25500
165	15	8	20	170000
166	16	8	7	59500
167	17	9	12	102000
168	18	9	6	51000
169	19	10	8	68000
170	20	10	5	42500
171	21	11	15	127500
172	22	11	2	17000
173	23	12	18	153000
174	24	12	3	25500
175	25	13	6	51000
176	26	13	10	85000
177	27	14	9	76500
178	28	14	4	34000
179	29	15	12	102000
180	30	15	8	68000
181	31	16	15	127500
182	32	16	5	42500
183	33	17	20	170000
184	34	17	7	59500
185	35	18	9	76500
186	36	18	6	51000
187	37	19	12	102000
188	38	19	8	68000
189	39	20	15	127500
190	40	20	5	42500
191	41	21	18	153000
192	42	21	7	59500
193	43	22	9	76500
194	44	22	4	34000
195	45	23	12	102000
196	46	23	10	85000
197	47	24	8	68000
198	48	24	6	51000
199	49	25	20	170000
200	50	25	5	42500
201	849	507	4	113862
202	459	760	8	113998
203	641	487	9	103241
204	431	443	10	149540
205	466	155	15	104458
206	512	737	9	122545
207	635	542	3	123855
208	248	645	15	50625
209	718	838	18	127437
210	662	622	18	20612
211	368	547	18	26431
212	790	70	1	54029
213	556	864	9	51996
214	424	610	20	135421
215	612	475	15	31935
216	169	149	12	121233
217	536	847	12	37053
218	673	100	20	117401
219	502	618	9	23542
220	556	840	2	85882
221	193	850	6	107284
222	656	827	8	137074
223	891	65	3	52916
224	371	485	1	32409
225	893	424	2	25408
226	998	309	15	26578
227	541	129	4	134548
228	646	813	16	127830
229	955	365	8	43883
230	691	572	5	42830
231	1000	717	8	122436
232	261	448	10	110983
233	734	270	9	38708
234	972	336	1	113109
235	689	11	7	27330
236	710	250	12	65721
237	862	883	12	108748
238	408	580	17	149112
239	134	896	4	15710
240	752	687	8	147461
241	164	792	16	11373
242	127	327	7	13240
243	231	696	10	33794
244	936	407	13	107402
245	402	292	2	13789
246	579	413	13	139776
247	868	879	6	125464
248	555	319	18	34340
249	519	172	4	64346
250	20	321	9	86530
251	428	745	20	131005
252	142	128	17	19777
253	172	223	16	60237
254	309	855	11	66932
255	669	145	7	78449
256	981	571	8	42928
257	851	613	10	70201
258	285	238	7	115174
259	930	97	16	39373
260	533	831	17	30926
261	908	435	2	34145
262	672	448	15	51576
263	85	234	16	94572
264	355	124	2	45914
265	297	111	16	47774
266	918	270	20	60338
267	137	324	13	119139
268	996	532	15	24780
269	260	246	12	12902
270	704	335	3	55092
271	601	696	13	31843
272	653	327	19	114928
273	497	56	19	10503
274	756	642	14	67566
275	603	659	15	31037
276	673	575	12	48408
277	301	98	1	36570
278	466	804	20	16755
279	94	518	5	66472
280	757	461	10	67009
281	714	317	5	109846
282	787	32	17	138237
283	511	191	13	113561
284	552	501	8	105674
285	11	645	11	49870
286	269	808	5	135697
287	827	181	1	140367
288	526	252	19	104359
289	113	162	6	38847
290	988	372	20	81847
291	454	265	8	48907
292	190	241	14	68059
293	19	159	5	83318
294	610	167	5	38482
295	569	521	2	88196
296	395	584	4	76405
297	479	721	11	58964
298	553	509	14	69886
299	310	376	15	73186
300	50	357	18	54283
301	366	840	9	41923
302	809	698	8	15268
303	902	150	3	64472
304	539	798	16	83008
305	742	695	13	73796
306	62	39	3	12271
307	726	474	9	28526
308	537	611	2	114678
309	678	579	2	114692
310	998	231	9	42252
311	419	848	14	86268
312	70	438	10	100233
313	95	168	6	131355
314	280	46	1	44795
315	673	641	7	47091
316	349	337	4	116992
317	109	289	18	133783
318	755	705	12	103512
319	195	797	7	107907
320	963	150	1	135361
321	861	311	4	130704
322	289	871	16	128260
323	922	487	7	118903
324	805	271	17	38260
325	131	469	20	66933
326	68	165	7	44016
327	934	682	17	36775
328	630	447	1	34089
329	330	251	13	63479
330	958	523	4	148074
331	937	530	7	101731
332	343	573	9	90426
333	998	174	12	42287
334	503	73	7	87019
335	757	21	10	33613
336	946	457	9	27644
337	317	620	10	91090
338	745	878	9	67874
339	304	801	15	87877
340	753	483	6	24525
341	440	278	16	96294
342	344	335	19	101829
343	309	520	11	73352
344	643	108	18	10653
345	267	322	18	24009
346	279	727	7	68811
347	463	818	8	56537
348	273	409	18	132567
349	962	88	9	42797
350	966	397	19	15270
351	980	273	5	49344
352	927	113	8	87693
353	281	772	19	34260
354	785	188	4	114356
355	803	85	3	104012
356	696	527	17	110732
357	931	534	16	10975
358	967	592	18	145054
359	407	892	9	116532
360	736	135	1	101836
361	643	136	20	47486
362	604	771	18	35161
363	294	679	13	12932
364	792	792	8	143963
365	442	123	7	140554
366	654	868	10	72838
367	805	390	7	99959
368	217	489	9	110701
369	170	666	10	129209
370	243	11	13	121836
371	214	285	3	35175
372	883	838	12	86134
373	662	150	2	135960
374	686	258	14	11148
375	868	419	13	48474
376	280	49	1	91313
377	102	666	1	43819
378	544	227	10	131013
379	308	220	19	103902
380	313	794	13	59568
381	478	278	6	54926
382	143	801	6	49690
383	504	422	20	103928
384	861	349	6	87891
385	49	811	12	61666
386	481	67	13	110429
387	274	496	5	40962
388	196	549	14	103909
389	826	226	7	127461
390	189	65	6	78434
391	778	112	19	135102
392	882	627	16	41444
393	823	499	10	77697
394	428	801	6	48746
395	978	654	15	102616
396	696	778	18	20624
397	785	143	10	119155
398	909	302	11	68258
399	150	620	10	146146
400	283	568	18	12079
401	732	314	7	103509
402	5	360	6	49655
403	881	437	13	132647
404	650	264	16	54848
405	977	22	3	22526
406	206	555	4	137213
407	859	6	19	69502
408	32	704	17	107882
409	242	577	10	37588
410	42	39	8	101409
411	584	480	13	59742
412	708	298	8	35400
413	135	162	6	137883
414	262	794	15	57392
415	957	735	8	42162
416	250	338	10	48277
417	891	570	12	35207
418	689	785	9	145785
419	463	766	7	144501
420	365	751	12	81182
421	904	326	10	21962
422	637	765	14	46188
423	845	673	17	18446
424	479	382	4	36103
425	756	373	4	53988
426	502	266	3	14990
427	271	58	6	55262
428	59	760	10	81490
429	592	379	8	129332
430	381	175	16	85441
431	844	833	2	101440
432	628	775	8	95585
433	38	347	15	48126
434	119	365	19	18522
435	415	222	3	47033
436	160	25	5	104225
437	148	511	11	24803
438	271	346	17	18243
439	33	31	9	38593
440	636	38	10	113273
441	884	136	18	117593
442	468	149	16	133218
443	972	737	12	52455
444	313	284	5	50815
445	297	633	7	49836
446	381	363	13	39013
447	574	350	2	18957
448	938	829	17	19874
449	296	110	15	20632
450	731	386	4	48426
451	388	70	10	70193
452	587	880	14	118654
453	697	546	18	102173
454	396	198	1	22907
455	578	661	10	119414
456	239	599	12	45016
457	259	223	18	99495
458	520	96	7	90698
459	92	323	9	47090
460	395	843	6	34904
461	889	542	12	15575
462	401	85	19	79869
463	680	609	6	40729
464	64	323	7	114292
465	574	632	1	72719
466	709	501	15	33991
467	492	253	20	79229
468	364	845	12	111482
469	468	47	15	111047
470	766	826	3	114952
471	822	409	18	61130
472	620	252	13	72099
473	409	31	7	100296
474	288	393	19	47463
475	82	391	12	84881
476	337	684	9	138482
477	104	738	7	93585
478	118	383	5	27483
479	535	609	14	39342
480	205	450	2	15392
481	643	217	16	37123
482	154	809	2	126960
483	475	757	16	112525
484	522	634	2	103867
485	279	418	8	81442
486	712	635	6	10700
487	582	257	20	45137
488	642	440	11	97150
489	22	246	11	43418
490	159	153	3	63168
491	545	609	2	13579
492	895	834	4	145060
493	652	194	9	85769
494	805	501	13	61435
495	117	534	13	31240
496	117	567	18	147596
497	186	655	10	12706
498	196	433	10	15495
499	498	289	1	81499
500	704	713	14	34165
501	638	855	7	14353
502	734	788	8	115549
503	22	414	6	105172
504	83	338	16	86119
505	392	193	13	85577
506	468	314	8	37105
507	638	492	14	83112
508	1000	610	3	66349
509	866	178	16	59605
510	242	42	6	106369
511	592	40	5	128333
512	154	518	7	85871
513	501	659	17	112107
514	14	548	8	91583
515	975	559	4	107629
516	19	250	6	18271
517	979	296	6	117631
518	161	525	3	94956
519	570	375	8	66514
520	578	583	20	56109
521	848	841	17	102891
522	292	487	20	138000
523	783	589	9	25809
524	80	426	15	63364
525	918	405	5	31157
526	795	898	15	33939
527	796	889	18	24542
528	763	689	1	138827
529	705	25	9	43129
530	250	123	6	137179
531	687	24	12	107756
532	935	194	5	73379
533	763	541	14	39553
534	611	522	3	37726
535	374	200	4	79924
536	429	717	16	81514
537	770	633	5	101823
538	43	498	14	65956
539	888	260	11	73866
540	936	557	11	132600
541	468	683	17	79708
542	590	181	11	25822
543	307	271	20	124342
544	595	250	9	84540
545	458	400	5	52505
546	944	785	6	24189
547	990	323	16	17591
548	38	319	4	134840
549	704	427	20	96773
550	48	370	16	95201
551	817	529	15	75144
552	728	680	10	89696
553	263	463	4	114272
554	974	283	12	69303
555	617	465	4	133647
556	212	772	18	44369
557	887	677	12	102862
558	164	232	18	75917
559	416	354	12	70357
560	247	851	14	17978
561	833	334	9	125026
562	166	578	18	87936
563	194	809	20	115954
564	742	701	7	56037
565	959	516	9	101106
566	918	606	12	110903
567	452	420	17	131688
568	125	138	20	110133
569	194	814	16	74723
570	791	359	18	89748
571	934	151	3	116541
572	450	697	19	43922
573	988	134	20	66345
574	458	142	8	71040
575	608	136	8	11075
576	58	791	7	32670
577	333	306	8	19472
578	161	381	5	140353
579	422	142	18	115753
580	585	790	5	10722
581	877	415	19	102545
582	130	73	16	122746
583	77	133	18	68736
584	820	606	9	74793
585	324	776	20	124386
586	73	171	7	144566
587	457	500	17	60045
588	625	295	10	20804
589	448	898	4	124152
590	733	25	5	69536
591	562	694	19	47718
592	860	552	9	28992
593	18	638	1	36266
594	360	390	19	147088
595	788	895	12	104873
596	148	340	11	46344
597	803	344	15	23611
598	436	783	14	17983
599	860	312	18	107714
600	448	738	12	109226
601	168	553	7	53275
602	436	314	12	37208
603	433	343	5	104644
604	951	862	8	86273
605	286	150	7	126215
606	31	208	1	13664
607	757	154	1	41896
608	49	856	2	113314
609	4	18	20	57074
610	975	26	6	70106
611	615	362	8	15614
612	454	366	17	142563
613	668	59	16	31326
614	236	309	17	62013
615	648	830	12	80046
616	528	354	7	145075
617	610	504	18	43373
618	148	584	18	115027
619	752	765	20	96768
620	379	332	10	80574
621	626	136	8	86332
622	553	887	1	47245
623	18	407	2	105053
624	387	545	12	32000
625	62	687	8	128740
626	105	843	6	88096
627	599	531	6	89358
628	405	881	7	81320
629	417	125	15	18747
630	430	751	20	111676
631	13	105	3	25317
632	564	562	13	117059
633	408	442	10	79862
634	889	302	20	55067
635	606	183	11	45208
636	653	622	19	147000
637	687	571	1	103653
638	986	131	19	89594
639	760	436	7	146161
640	637	115	12	75055
641	639	353	2	80760
642	406	68	7	41585
643	137	271	3	51326
644	24	553	15	71106
645	157	629	3	76156
646	927	300	10	59081
647	965	291	12	41929
648	485	627	2	98734
649	789	206	12	50536
650	291	548	18	26752
651	839	221	6	80660
652	994	606	6	98671
653	650	169	4	66483
654	288	687	5	89675
655	822	641	1	75006
656	66	636	1	65358
657	235	502	17	77507
658	62	740	10	126206
659	186	447	11	41421
660	40	738	11	75558
661	993	187	1	34748
662	206	242	6	48634
663	530	170	14	100222
664	547	388	10	118951
665	557	415	18	58191
666	673	583	15	134655
667	112	481	10	72293
668	5	204	16	80968
669	758	480	10	113041
670	663	573	9	132301
671	670	504	8	12914
672	432	834	11	39482
673	389	648	7	13314
674	434	453	12	110083
675	58	517	15	33656
676	829	688	14	22893
677	991	52	9	66108
678	504	106	14	115290
679	648	602	12	55933
680	769	175	1	139829
681	668	31	3	21439
682	981	531	10	39841
683	495	390	19	133216
684	506	748	13	31071
685	536	735	3	50384
686	845	194	12	32942
687	189	802	9	100510
688	448	123	11	88086
689	226	145	3	35103
690	32	751	18	59196
691	194	503	13	19422
692	370	686	8	28477
693	709	748	9	68892
694	70	465	17	38989
695	345	429	16	46012
696	240	667	4	108424
697	540	295	12	87314
698	753	62	15	88393
699	254	171	1	145143
700	863	188	18	100104
\.


--
-- TOC entry 4939 (class 0 OID 34257)
-- Dependencies: 260
-- Data for Name: supplier; Type: TABLE DATA; Schema: proyecto; Owner: postgres
--

COPY proyecto.supplier (id, name1, contact, address) FROM stdin;
2	Proveedora	3001234567	Calle 10 #15-30
3	Distribuciones	3109876543	Carrera 45 #25-60
4	Suministros	3207654321	Avenida 1 #20-15
5	AdhesivosNorte	3001122334	Calle 50 #10-45
6	Industria	3506781234	Carrera 80 #22-50
7	Etiqueta y Más	3103344556	Diagonal 40 #12-34
8	Express	3005566778	Transversal 60 #30-20
9	PegatinasDía	3019988776	Calle 8 #5-10
10	Vinilos & Diseño	3201144778	Avenida Central #35-40
11	Decoraciones	3123456789	Carrera 12 #4-22
12	Comercializadora 984	3636848282	Calle 66 #48-33, Cali
13	Exportadora 502	3967253254	Calle 38 #28-61, Bucaramanga
14	Distribuciones 367	3471413990	Calle 10 #46-61, Bogotá
15	Proveedora 615	3625851528	Calle 78 #50-36, Cali
16	Importadora 842	3942834093	Calle 31 #50-68, Bogotá
17	Proveedora 695	3275628395	Calle 76 #13-34, Bogotá
18	Exportadora 679	3919011158	Calle 99 #12-73, Cali
19	Distribuciones 359	3636922724	Calle 32 #50-16, Cartagena
20	Proveedora 880	3736630714	Calle 77 #31-33, Bucaramanga
21	Distribuciones 940	3717451477	Calle 45 #34-14, Bogotá
22	Importadora 473	3768942824	Calle 63 #21-90, Bucaramanga
23	Distribuciones 287	3486258250	Calle 60 #1-53, Medellín
24	Suministros 464	3897211566	Calle 87 #6-69, Bogotá
25	Importadora 232	3599035758	Calle 17 #1-71, Cartagena
26	Distribuciones 348	3859901953	Calle 48 #30-56, Medellín
27	Suministros 125	3415858751	Calle 14 #11-19, Bucaramanga
28	Importadora 286	3203918647	Calle 48 #30-56, Barranquilla
29	Comercializadora 394	3272451068	Calle 72 #27-78, Medellín
30	Suministros 205	3489128385	Calle 13 #13-26, Cali
31	Exportadora 369	3714293119	Calle 27 #31-3, Cali
32	Suministros 269	3720717647	Calle 38 #28-61, Bucaramanga
33	Exportadora 105	3225040711	Calle 29 #44-79, Cartagena
34	Distribuciones 351	3123700206	Calle 96 #3-46, Bogotá
35	Importadora 128	3743225658	Calle 55 #29-48, Cali
36	Importadora 350	3188043571	Calle 2 #44-59, Cartagena
37	Exportadora 541	3316681615	Calle 49 #6-48, Bogotá
38	Comercializadora 508	3323997416	Calle 4 #19-62, Bogotá
39	Distribuciones 803	3153219407	Calle 92 #44-13, Barranquilla
40	Distribuciones 349	3974014613	Calle 51 #18-30, Bogotá
41	Proveedora 207	3474364446	Calle 13 #13-26, Bucaramanga
42	Proveedora 856	3200440173	Calle 67 #10-12, Cali
43	Distribuciones 178	3573793016	Calle 32 #50-16, Cartagena
44	Exportadora 791	3473604325	Calle 58 #14-41, Bogotá
45	Proveedora 650	3921169623	Calle 74 #29-90, Bucaramanga
46	Distribuciones 698	3995751165	Calle 21 #11-14, Cali
47	Importadora 837	3848928355	Calle 15 #48-98, Bucaramanga
48	Exportadora 498	3519761905	Calle 27 #31-3, Barranquilla
49	Exportadora 599	3786182770	Calle 8 #26-54, Cali
50	Comercializadora 945	3587761586	Calle 78 #50-36, Cali
51	Proveedora 309	3399903817	Calle 94 #28-86, Cartagena
52	Proveedora 489	3978807708	Calle 92 #44-13, Cali
53	Distribuciones 618	3927072424	Calle 1 #41-54, Cali
54	Proveedora 141	3930658450	Calle 48 #30-56, Cartagena
55	Importadora 656	3488585002	Calle 68 #27-36, Cartagena
56	Comercializadora 810	3271908633	Calle 38 #28-61, Medellín
57	Suministros 385	3288932436	Calle 75 #37-33, Cali
58	Importadora 908	3270387700	Calle 17 #1-71, Bucaramanga
59	Suministros 824	3964135841	Calle 71 #23-53, Bucaramanga
60	Distribuciones 571	3473708740	Calle 92 #44-13, Cartagena
61	Exportadora 896	3445780031	Calle 73 #10-57, Cartagena
62	Distribuciones 127	3641280490	Calle 5 #35-90, Bucaramanga
63	Suministros 847	3164989251	Calle 86 #36-18, Barranquilla
64	Proveedora 169	3190464901	Calle 38 #28-61, Cartagena
65	Suministros 789	3406488184	Calle 91 #31-30, Bucaramanga
66	Importadora 218	3482884932	Calle 93 #34-26, Bogotá
67	Exportadora 228	3823073127	Calle 53 #1-21, Bucaramanga
68	Proveedora 677	3991470448	Calle 25 #10-77, Barranquilla
69	Proveedora 712	3536430574	Calle 40 #49-67, Medellín
70	Exportadora 754	3503213802	Calle 41 #9-52, Bucaramanga
71	Comercializadora 908	3988325746	Calle 10 #46-61, Cali
72	Proveedora 713	3942775485	Calle 71 #23-53, Medellín
73	Proveedora 858	3688919084	Calle 97 #17-25, Cartagena
74	Proveedora 550	3584566827	Calle 8 #26-54, Bucaramanga
75	Suministros 706	3615708797	Calle 62 #31-18, Bogotá
76	Distribuciones 805	3463646188	Calle 23 #48-65, Bogotá
77	Distribuciones 954	3386496186	Calle 26 #33-65, Cartagena
78	Suministros 470	3123021416	Calle 45 #34-14, Cali
79	Importadora 408	3669068250	Calle 4 #19-62, Barranquilla
80	Importadora 914	3693237093	Calle 31 #50-68, Cali
81	Comercializadora 485	3172422025	Calle 51 #18-30, Cali
82	Proveedora 970	3845090211	Calle 34 #8-80, Medellín
83	Comercializadora 284	3815914154	Calle 63 #21-90, Medellín
84	Distribuciones 520	3363230458	Calle 40 #49-67, Barranquilla
85	Comercializadora 317	3513480191	Calle 67 #10-12, Bogotá
86	Comercializadora 170	3165948927	Calle 94 #28-86, Barranquilla
87	Proveedora 554	3296668700	Calle 64 #18-14, Bucaramanga
88	Distribuciones 485	3204549149	Calle 77 #31-33, Cali
89	Distribuciones 392	3479143621	Calle 82 #26-20, Cartagena
90	Comercializadora 140	3166091417	Calle 31 #50-68, Barranquilla
91	Comercializadora 518	3212330729	Calle 81 #11-1, Barranquilla
92	Distribuciones 784	3607388223	Calle 4 #19-62, Cartagena
93	Suministros 371	3145986316	Calle 33 #8-9, Cartagena
94	Distribuciones 207	3529426365	Calle 13 #13-26, Barranquilla
95	Proveedora 754	3466561081	Calle 51 #18-30, Medellín
96	Importadora 587	3892778702	Calle 22 #27-91, Cali
97	Distribuciones 981	3587444593	Calle 74 #29-90, Bucaramanga
98	Suministros 551	3873077851	Calle 98 #17-90, Cali
99	Distribuciones 347	3316484352	Calle 32 #50-16, Barranquilla
100	Importadora 855	3164383416	Calle 70 #37-27, Medellín
101	Importadora 585	3350093805	Calle 7 #3-52, Bucaramanga
102	Importadora 605	3589628550	Calle 59 #49-44, Barranquilla
103	Exportadora 708	3777825186	Calle 38 #28-61, Cali
104	Distribuciones 968	3599028242	Calle 9 #45-38, Bucaramanga
105	Proveedora 926	3139776007	Calle 81 #11-1, Bucaramanga
106	Proveedora 308	3755348882	Calle 99 #12-73, Barranquilla
107	Proveedora 744	3323330664	Calle 53 #1-21, Barranquilla
108	Suministros 375	3979011050	Calle 96 #3-46, Medellín
109	Exportadora 220	3143308790	Calle 41 #9-52, Barranquilla
110	Proveedora 232	3310523786	Calle 84 #43-83, Bogotá
111	Importadora 383	3949366016	Calle 24 #14-46, Medellín
112	Comercializadora 789	3296760312	Calle 64 #18-14, Cartagena
113	Proveedora 509	3313931800	Calle 95 #10-47, Cali
114	Distribuciones 579	3104655297	Calle 36 #38-91, Bogotá
115	Exportadora 529	3868254694	Calle 80 #38-35, Cali
116	Suministros 164	3439127001	Calle 99 #12-73, Barranquilla
117	Importadora 987	3949034242	Calle 98 #17-90, Bogotá
118	Comercializadora 271	3876541825	Calle 22 #27-91, Cali
119	Importadora 700	3295974867	Calle 70 #37-27, Cali
120	Comercializadora 670	3145205707	Calle 56 #12-23, Bucaramanga
121	Distribuciones 384	3361157857	Calle 81 #11-1, Cartagena
122	Importadora 247	3704634574	Calle 17 #1-71, Bucaramanga
123	Importadora 638	3110206265	Calle 50 #22-85, Bucaramanga
124	Suministros 333	3578080047	Calle 36 #38-91, Barranquilla
125	Proveedora 690	3354590228	Calle 93 #34-26, Bogotá
126	Distribuciones 131	3657281056	Calle 70 #37-27, Bucaramanga
127	Proveedora 511	3494045772	Calle 23 #48-65, Cali
128	Exportadora 594	3556082706	Calle 51 #18-30, Barranquilla
129	Proveedora 368	3460507064	Calle 44 #23-97, Bucaramanga
130	Exportadora 612	3849457783	Calle 67 #10-12, Bogotá
131	Exportadora 453	3222151928	Calle 56 #12-23, Cartagena
132	Exportadora 834	3637236644	Calle 26 #33-65, Bucaramanga
133	Proveedora 944	3576991145	Calle 12 #16-50, Cali
134	Importadora 895	3631042109	Calle 43 #10-60, Cali
135	Exportadora 753	3664003707	Calle 15 #48-98, Cartagena
136	Importadora 662	3606687010	Calle 66 #48-33, Cartagena
137	Suministros 572	3538016305	Calle 13 #13-26, Bogotá
138	Importadora 948	3294516131	Calle 34 #8-80, Bucaramanga
139	Suministros 529	3411093635	Calle 53 #1-21, Cartagena
140	Importadora 403	3911814630	Calle 71 #23-53, Cartagena
141	Importadora 895	3386791941	Calle 88 #43-7, Cartagena
142	Comercializadora 757	3880906649	Calle 37 #48-61, Bogotá
143	Suministros 501	3264019857	Calle 24 #14-46, Cartagena
144	Proveedora 189	3389405740	Calle 3 #48-90, Cartagena
145	Distribuciones 332	3739736885	Calle 80 #38-35, Bucaramanga
146	Distribuciones 829	3642514228	Calle 22 #27-91, Barranquilla
147	Importadora 129	3883070507	Calle 34 #8-80, Cartagena
148	Importadora 772	3588169336	Calle 37 #48-61, Bogotá
149	Exportadora 529	3914974179	Calle 77 #31-33, Bogotá
150	Comercializadora 734	3944594428	Calle 96 #3-46, Barranquilla
151	Proveedora 344	3755301648	Calle 20 #21-20, Medellín
152	Comercializadora 428	3280380984	Calle 65 #37-99, Bogotá
153	Suministros 756	3322469141	Calle 85 #15-62, Cartagena
154	Importadora 537	3679340752	Calle 1 #41-54, Cartagena
155	Exportadora 365	3350052129	Calle 27 #31-3, Cartagena
156	Importadora 263	3625437183	Calle 93 #34-26, Barranquilla
157	Proveedora 715	3642844668	Calle 26 #33-65, Cali
158	Importadora 376	3860297331	Calle 28 #37-53, Cali
159	Exportadora 930	3884604459	Calle 31 #50-68, Bucaramanga
160	Distribuciones 950	3306276172	Calle 59 #49-44, Medellín
161	Comercializadora 572	3172808132	Calle 64 #18-14, Medellín
162	Exportadora 581	3384893284	Calle 53 #1-21, Bucaramanga
163	Comercializadora 467	3163616896	Calle 54 #23-51, Bogotá
164	Exportadora 327	3553600112	Calle 67 #10-12, Cartagena
165	Exportadora 775	3222805197	Calle 39 #44-90, Bogotá
166	Suministros 706	3303522133	Calle 21 #11-14, Medellín
167	Importadora 265	3732187539	Calle 90 #27-93, Cali
168	Exportadora 430	3725049110	Calle 96 #3-46, Medellín
169	Exportadora 828	3520881588	Calle 42 #7-85, Medellín
170	Distribuciones 317	3398489895	Calle 95 #10-47, Bucaramanga
171	Proveedora 797	3684733263	Calle 32 #50-16, Barranquilla
172	Proveedora 190	3541748125	Calle 27 #31-3, Barranquilla
173	Proveedora 881	3597243976	Calle 11 #46-67, Bucaramanga
174	Importadora 900	3839652807	Calle 10 #46-61, Bucaramanga
175	Importadora 233	3150255485	Calle 57 #32-41, Cartagena
176	Proveedora 796	3101561128	Calle 72 #27-78, Barranquilla
177	Comercializadora 613	3841927934	Calle 39 #44-90, Bogotá
178	Exportadora 306	3455964743	Calle 84 #43-83, Bucaramanga
179	Exportadora 685	3373280512	Calle 87 #6-69, Cali
180	Distribuciones 683	3995144086	Calle 24 #14-46, Barranquilla
181	Distribuciones 670	3475066337	Calle 30 #12-94, Cali
182	Proveedora 442	3447984177	Calle 12 #16-50, Medellín
183	Proveedora 405	3124190475	Calle 50 #22-85, Cali
184	Suministros 292	3800586287	Calle 65 #37-99, Bucaramanga
185	Suministros 752	3611994957	Calle 91 #31-30, Cartagena
186	Distribuciones 677	3426741286	Calle 85 #15-62, Barranquilla
187	Suministros 948	3770439299	Calle 65 #37-99, Medellín
188	Suministros 316	3553260286	Calle 89 #50-45, Bogotá
189	Exportadora 515	3773446271	Calle 27 #31-3, Medellín
190	Exportadora 273	3692482582	Calle 16 #19-32, Bogotá
191	Exportadora 703	3664914505	Calle 10 #46-61, Bogotá
192	Distribuciones 131	3420609412	Calle 96 #3-46, Barranquilla
193	Importadora 408	3852961013	Calle 9 #45-38, Barranquilla
194	Proveedora 759	3719510652	Calle 49 #6-48, Medellín
195	Importadora 260	3247680739	Calle 91 #31-30, Barranquilla
196	Suministros 413	3279182841	Calle 84 #43-83, Bogotá
197	Suministros 631	3106267930	Calle 48 #30-56, Bogotá
198	Importadora 682	3188027797	Calle 31 #50-68, Cali
199	Exportadora 684	3924559860	Calle 23 #48-65, Cartagena
200	Comercializadora 148	3129941552	Calle 7 #3-52, Bogotá
201	Proveedora 649	3770212277	Calle 41 #9-52, Bucaramanga
202	Importadora 801	3732873914	Calle 85 #15-62, Medellín
203	Comercializadora 161	3239529251	Calle 5 #35-90, Cartagena
204	Importadora 987	3650344435	Calle 28 #37-53, Bogotá
205	Comercializadora 142	3420462413	Calle 93 #34-26, Bogotá
206	Distribuciones 468	3140402784	Calle 63 #21-90, Medellín
207	Importadora 238	3725503977	Calle 56 #12-23, Bogotá
208	Importadora 422	3989810604	Calle 69 #31-89, Bucaramanga
209	Proveedora 568	3878401740	Calle 60 #1-53, Cartagena
210	Comercializadora 398	3522915577	Calle 50 #22-85, Bogotá
211	Comercializadora 747	3923298984	Calle 86 #36-18, Bucaramanga
212	Proveedora 903	3607769119	Calle 98 #17-90, Barranquilla
213	Suministros 897	3114157304	Calle 32 #50-16, Cali
214	Distribuciones 830	3938975040	Calle 62 #31-18, Medellín
215	Importadora 441	3467786146	Calle 61 #33-32, Cali
216	Exportadora 687	3976278201	Calle 88 #43-7, Cartagena
217	Distribuciones 902	3355996940	Calle 20 #21-20, Bucaramanga
218	Distribuciones 173	3208659479	Calle 93 #34-26, Medellín
219	Importadora 256	3238364946	Calle 64 #18-14, Barranquilla
220	Distribuciones 284	3672563490	Calle 98 #17-90, Barranquilla
221	Importadora 903	3799070123	Calle 66 #48-33, Cali
222	Suministros 823	3557605722	Calle 10 #46-61, Barranquilla
223	Comercializadora 360	3648964755	Calle 74 #29-90, Medellín
224	Exportadora 912	3255246155	Calle 28 #37-53, Barranquilla
225	Distribuciones 893	3967412948	Calle 76 #13-34, Cartagena
226	Proveedora 673	3370993795	Calle 71 #23-53, Cali
227	Suministros 770	3758903264	Calle 77 #31-33, Bucaramanga
228	Exportadora 777	3592530643	Calle 82 #26-20, Cali
229	Comercializadora 362	3937661323	Calle 18 #13-53, Cartagena
230	Distribuciones 624	3338303570	Calle 46 #48-58, Barranquilla
231	Comercializadora 247	3731715095	Calle 93 #34-26, Medellín
232	Comercializadora 777	3890475578	Calle 89 #50-45, Cali
233	Importadora 529	3349610305	Calle 31 #50-68, Bogotá
234	Exportadora 256	3440682495	Calle 81 #11-1, Medellín
235	Suministros 168	3120033816	Calle 77 #31-33, Cartagena
236	Importadora 558	3543728986	Calle 45 #34-14, Medellín
237	Suministros 369	3813836244	Calle 45 #34-14, Medellín
238	Suministros 337	3102796952	Calle 91 #31-30, Bogotá
239	Importadora 755	3311826370	Calle 31 #50-68, Cali
240	Exportadora 999	3565046583	Calle 99 #12-73, Cartagena
241	Proveedora 976	3478923826	Calle 15 #48-98, Cali
242	Proveedora 524	3217567401	Calle 97 #17-25, Cartagena
243	Proveedora 289	3924601304	Calle 93 #34-26, Barranquilla
244	Comercializadora 484	3948376631	Calle 85 #15-62, Medellín
245	Comercializadora 868	3966087804	Calle 52 #18-6, Bogotá
246	Exportadora 982	3936194318	Calle 31 #50-68, Cali
247	Exportadora 884	3846396450	Calle 60 #1-53, Bucaramanga
248	Exportadora 558	3993618178	Calle 3 #48-90, Cali
249	Distribuciones 874	3481397509	Calle 51 #18-30, Barranquilla
250	Importadora 444	3340513609	Calle 83 #38-87, Cartagena
251	Importadora 260	3326813368	Calle 54 #23-51, Cartagena
252	Exportadora 124	3541820123	Calle 5 #35-90, Medellín
253	Distribuciones 252	3267205955	Calle 4 #19-62, Medellín
254	Proveedora 897	3252086849	Calle 54 #23-51, Barranquilla
255	Exportadora 260	3718130218	Calle 45 #34-14, Medellín
256	Importadora 934	3119359124	Calle 23 #48-65, Cali
257	Distribuciones 463	3235362388	Calle 41 #9-52, Cartagena
258	Importadora 271	3917434165	Calle 21 #11-14, Cartagena
259	Importadora 135	3422862150	Calle 46 #48-58, Cartagena
260	Distribuciones 479	3483370487	Calle 49 #6-48, Bogotá
261	Distribuciones 411	3745121491	Calle 99 #12-73, Bucaramanga
262	Comercializadora 711	3254345172	Calle 20 #21-20, Barranquilla
263	Distribuciones 566	3767585493	Calle 84 #43-83, Cali
264	Comercializadora 975	3104278132	Calle 19 #11-56, Bogotá
265	Importadora 869	3600072224	Calle 22 #27-91, Cartagena
266	Suministros 262	3108967059	Calle 90 #27-93, Cali
267	Proveedora 612	3747281192	Calle 47 #35-44, Medellín
268	Exportadora 468	3926468422	Calle 50 #22-85, Barranquilla
269	Proveedora 431	3294736594	Calle 42 #7-85, Medellín
270	Suministros 977	3221355709	Calle 93 #34-26, Bogotá
271	Comercializadora 635	3464373021	Calle 40 #49-67, Cali
272	Proveedora 214	3639729324	Calle 6 #43-28, Barranquilla
273	Proveedora 211	3227017634	Calle 32 #50-16, Cali
274	Proveedora 984	3621842122	Calle 71 #23-53, Barranquilla
275	Distribuciones 783	3152794634	Calle 37 #48-61, Barranquilla
276	Distribuciones 263	3948978608	Calle 84 #43-83, Barranquilla
277	Suministros 828	3884112406	Calle 89 #50-45, Barranquilla
278	Distribuciones 395	3882499263	Calle 67 #10-12, Bucaramanga
279	Suministros 171	3123260208	Calle 97 #17-25, Barranquilla
280	Comercializadora 169	3543876333	Calle 89 #50-45, Medellín
281	Exportadora 304	3748714241	Calle 78 #50-36, Bucaramanga
282	Distribuciones 829	3833078213	Calle 66 #48-33, Barranquilla
283	Importadora 594	3484078706	Calle 82 #26-20, Barranquilla
284	Distribuciones 152	3477758973	Calle 72 #27-78, Cali
285	Proveedora 430	3580454724	Calle 16 #19-32, Bucaramanga
286	Distribuciones 364	3705575321	Calle 34 #8-80, Bogotá
287	Importadora 206	3534067766	Calle 99 #12-73, Barranquilla
288	Proveedora 476	3630103503	Calle 66 #48-33, Cali
289	Distribuciones 474	3194340283	Calle 82 #26-20, Bucaramanga
290	Proveedora 382	3611973237	Calle 17 #1-71, Medellín
291	Importadora 204	3222480368	Calle 74 #29-90, Medellín
292	Proveedora 556	3244007949	Calle 21 #11-14, Cartagena
293	Suministros 895	3359338527	Calle 24 #14-46, Medellín
294	Importadora 665	3941837482	Calle 53 #1-21, Cartagena
295	Comercializadora 536	3368809737	Calle 57 #32-41, Bucaramanga
296	Distribuciones 293	3977201781	Calle 75 #37-33, Bogotá
297	Exportadora 354	3500890323	Calle 34 #8-80, Cartagena
298	Proveedora 361	3354590732	Calle 33 #8-9, Medellín
299	Proveedora 132	3603925944	Calle 50 #22-85, Bogotá
300	Suministros 918	3664444335	Calle 95 #10-47, Cali
301	Suministros 485	3234765286	Calle 3 #48-90, Bucaramanga
302	Comercializadora 504	3570009135	Calle 42 #7-85, Cartagena
303	Exportadora 503	3301700540	Calle 5 #35-90, Bogotá
304	Distribuciones 773	3445498719	Calle 12 #16-50, Bucaramanga
305	Proveedora 685	3307040787	Calle 46 #48-58, Barranquilla
306	Proveedora 601	3565643508	Calle 8 #26-54, Cali
307	Proveedora 632	3100599289	Calle 68 #27-36, Cartagena
308	Importadora 403	3927487198	Calle 82 #26-20, Cali
309	Suministros 566	3441982604	Calle 34 #8-80, Cartagena
310	Importadora 766	3287031102	Calle 75 #37-33, Cali
311	Distribuciones 558	3101274399	Calle 84 #43-83, Bucaramanga
312	Distribuciones 600	3816178116	Calle 86 #36-18, Bogotá
313	Exportadora 842	3266226686	Calle 4 #19-62, Medellín
314	Proveedora 190	3566068672	Calle 76 #13-34, Cali
315	Exportadora 364	3728675319	Calle 49 #6-48, Cartagena
316	Suministros 999	3850159431	Calle 78 #50-36, Bogotá
317	Importadora 735	3746313507	Calle 91 #31-30, Bucaramanga
318	Distribuciones 305	3470789415	Calle 19 #11-56, Cali
319	Comercializadora 631	3236930352	Calle 94 #28-86, Medellín
320	Exportadora 748	3343070922	Calle 6 #43-28, Medellín
321	Suministros 332	3287647111	Calle 94 #28-86, Cartagena
322	Comercializadora 524	3735809646	Calle 85 #15-62, Bogotá
323	Distribuciones 843	3805260972	Calle 12 #16-50, Bucaramanga
324	Proveedora 630	3423444152	Calle 86 #36-18, Barranquilla
325	Comercializadora 353	3962060825	Calle 26 #33-65, Medellín
326	Comercializadora 117	3267275170	Calle 58 #14-41, Bucaramanga
327	Comercializadora 696	3391681425	Calle 55 #29-48, Barranquilla
328	Comercializadora 933	3708062190	Calle 20 #21-20, Medellín
329	Exportadora 724	3931296502	Calle 15 #48-98, Medellín
330	Importadora 524	3370699698	Calle 20 #21-20, Bogotá
331	Suministros 548	3309360959	Calle 60 #1-53, Barranquilla
332	Distribuciones 928	3611360412	Calle 79 #9-90, Barranquilla
333	Suministros 228	3198186192	Calle 85 #15-62, Bucaramanga
334	Exportadora 989	3810786537	Calle 53 #1-21, Bogotá
335	Importadora 435	3492031432	Calle 85 #15-62, Medellín
336	Suministros 562	3235400534	Calle 33 #8-9, Barranquilla
337	Distribuciones 587	3797898279	Calle 16 #19-32, Bogotá
338	Suministros 574	3919673922	Calle 17 #1-71, Barranquilla
339	Comercializadora 462	3111459341	Calle 69 #31-89, Medellín
340	Proveedora 514	3536756737	Calle 20 #21-20, Bogotá
341	Comercializadora 170	3633157611	Calle 52 #18-6, Barranquilla
342	Importadora 808	3961420551	Calle 58 #14-41, Bogotá
343	Proveedora 277	3697721588	Calle 44 #23-97, Bucaramanga
344	Proveedora 614	3271764244	Calle 10 #46-61, Cartagena
345	Distribuciones 648	3773598532	Calle 36 #38-91, Cartagena
346	Comercializadora 122	3930166765	Calle 61 #33-32, Bogotá
347	Importadora 738	3783776574	Calle 24 #14-46, Barranquilla
348	Exportadora 824	3977054121	Calle 62 #31-18, Barranquilla
349	Comercializadora 213	3438845729	Calle 7 #3-52, Medellín
350	Comercializadora 468	3217786866	Calle 88 #43-7, Bogotá
351	Exportadora 845	3926950255	Calle 7 #3-52, Barranquilla
352	Distribuciones 388	3304497334	Calle 93 #34-26, Barranquilla
353	Distribuciones 161	3929082433	Calle 78 #50-36, Bucaramanga
354	Comercializadora 458	3577608225	Calle 71 #23-53, Bogotá
355	Comercializadora 814	3623330575	Calle 43 #10-60, Cali
356	Suministros 490	3754726527	Calle 84 #43-83, Medellín
357	Distribuciones 911	3105853333	Calle 29 #44-79, Barranquilla
358	Distribuciones 646	3267823930	Calle 71 #23-53, Medellín
359	Importadora 703	3690163278	Calle 23 #48-65, Bogotá
360	Proveedora 565	3985228546	Calle 35 #48-28, Medellín
361	Importadora 350	3510970579	Calle 43 #10-60, Cartagena
362	Suministros 426	3103793751	Calle 66 #48-33, Bogotá
363	Suministros 820	3735591274	Calle 38 #28-61, Medellín
364	Distribuciones 814	3633910399	Calle 52 #18-6, Medellín
365	Suministros 342	3612257676	Calle 83 #38-87, Bogotá
366	Importadora 738	3596259919	Calle 44 #23-97, Barranquilla
367	Importadora 315	3442714629	Calle 30 #12-94, Cartagena
368	Exportadora 942	3721777607	Calle 74 #29-90, Bucaramanga
369	Comercializadora 333	3310919951	Calle 87 #6-69, Cali
370	Proveedora 463	3427913666	Calle 52 #18-6, Medellín
371	Proveedora 692	3912962889	Calle 45 #34-14, Cali
372	Suministros 907	3983304655	Calle 11 #46-67, Cartagena
373	Comercializadora 360	3561395627	Calle 20 #21-20, Barranquilla
374	Proveedora 575	3754438694	Calle 2 #44-59, Barranquilla
375	Suministros 606	3424831714	Calle 32 #50-16, Cali
376	Importadora 404	3695467672	Calle 50 #22-85, Bucaramanga
377	Importadora 542	3864519753	Calle 24 #14-46, Bucaramanga
378	Importadora 866	3643063039	Calle 48 #30-56, Bogotá
379	Proveedora 583	3862586203	Calle 30 #12-94, Cartagena
380	Importadora 225	3259185588	Calle 83 #38-87, Barranquilla
381	Distribuciones 421	3883067525	Calle 55 #29-48, Medellín
382	Suministros 827	3793808716	Calle 7 #3-52, Bucaramanga
383	Proveedora 321	3472561940	Calle 51 #18-30, Cartagena
384	Distribuciones 752	3606810114	Calle 10 #46-61, Bucaramanga
385	Comercializadora 874	3274169489	Calle 66 #48-33, Bogotá
386	Suministros 986	3480364666	Calle 33 #8-9, Barranquilla
387	Suministros 569	3454583066	Calle 78 #50-36, Cartagena
388	Proveedora 218	3184521282	Calle 69 #31-89, Medellín
389	Comercializadora 245	3164015214	Calle 18 #13-53, Cartagena
390	Importadora 494	3848973568	Calle 61 #33-32, Cartagena
391	Exportadora 703	3176270742	Calle 8 #26-54, Cali
392	Importadora 475	3997860419	Calle 9 #45-38, Cartagena
393	Suministros 784	3396245546	Calle 26 #33-65, Cali
394	Comercializadora 645	3911246512	Calle 62 #31-18, Cartagena
395	Proveedora 316	3710794064	Calle 56 #12-23, Bucaramanga
396	Importadora 511	3807324386	Calle 22 #27-91, Cartagena
397	Suministros 193	3599453120	Calle 3 #48-90, Cali
398	Suministros 991	3957592485	Calle 90 #27-93, Barranquilla
399	Suministros 667	3705619676	Calle 86 #36-18, Bucaramanga
400	Suministros 213	3338580370	Calle 87 #6-69, Bogotá
401	Suministros 470	3927022120	Calle 86 #36-18, Barranquilla
402	Proveedora 749	3456669333	Calle 87 #6-69, Cali
403	Exportadora 937	3617858721	Calle 51 #18-30, Cali
404	Importadora 863	3752677160	Calle 72 #27-78, Bucaramanga
405	Importadora 415	3444036315	Calle 98 #17-90, Bucaramanga
406	Comercializadora 971	3926996589	Calle 13 #13-26, Bogotá
407	Comercializadora 982	3584632842	Calle 34 #8-80, Cali
408	Proveedora 466	3882855993	Calle 33 #8-9, Cali
409	Suministros 234	3728334937	Calle 11 #46-67, Cartagena
410	Importadora 115	3946577914	Calle 78 #50-36, Bucaramanga
411	Distribuciones 467	3221159120	Calle 7 #3-52, Bogotá
412	Comercializadora 165	3308066680	Calle 35 #48-28, Cali
413	Distribuciones 143	3809359837	Calle 32 #50-16, Barranquilla
414	Distribuciones 388	3651721411	Calle 47 #35-44, Cartagena
415	Suministros 921	3515747731	Calle 10 #46-61, Cali
416	Distribuciones 781	3512209695	Calle 99 #12-73, Barranquilla
417	Exportadora 531	3347354487	Calle 93 #34-26, Bogotá
418	Proveedora 392	3261255241	Calle 30 #12-94, Bogotá
419	Importadora 763	3473905558	Calle 23 #48-65, Cartagena
420	Exportadora 367	3404979413	Calle 30 #12-94, Medellín
421	Exportadora 123	3497588258	Calle 91 #31-30, Medellín
422	Importadora 315	3339323320	Calle 83 #38-87, Bucaramanga
423	Exportadora 248	3313874455	Calle 98 #17-90, Bucaramanga
424	Proveedora 514	3703428587	Calle 44 #23-97, Cali
425	Suministros 253	3123949094	Calle 45 #34-14, Bogotá
426	Suministros 905	3896803787	Calle 5 #35-90, Barranquilla
427	Comercializadora 471	3858772508	Calle 18 #13-53, Medellín
428	Importadora 810	3503299316	Calle 82 #26-20, Cartagena
429	Proveedora 157	3483708759	Calle 49 #6-48, Bucaramanga
430	Suministros 891	3363633578	Calle 8 #26-54, Cali
431	Comercializadora 281	3116075939	Calle 56 #12-23, Medellín
432	Comercializadora 844	3310969538	Calle 79 #9-90, Medellín
433	Comercializadora 798	3487785369	Calle 85 #15-62, Cartagena
434	Distribuciones 338	3685528409	Calle 50 #22-85, Cartagena
435	Importadora 563	3526694330	Calle 79 #9-90, Cartagena
436	Distribuciones 702	3148685556	Calle 91 #31-30, Medellín
437	Distribuciones 136	3526782428	Calle 1 #41-54, Bogotá
438	Suministros 161	3661587928	Calle 59 #49-44, Bucaramanga
439	Exportadora 354	3270266060	Calle 52 #18-6, Medellín
440	Comercializadora 612	3849472108	Calle 94 #28-86, Medellín
441	Suministros 166	3704151245	Calle 95 #10-47, Barranquilla
442	Exportadora 787	3499262959	Calle 33 #8-9, Barranquilla
443	Proveedora 349	3383569131	Calle 95 #10-47, Medellín
444	Distribuciones 839	3379775754	Calle 22 #27-91, Bucaramanga
445	Suministros 972	3397701928	Calle 12 #16-50, Cali
446	Suministros 336	3786267822	Calle 55 #29-48, Bogotá
447	Proveedora 775	3874912182	Calle 7 #3-52, Cartagena
448	Importadora 877	3283324044	Calle 25 #10-77, Bogotá
449	Proveedora 627	3454466111	Calle 92 #44-13, Bucaramanga
450	Exportadora 153	3848817350	Calle 46 #48-58, Cartagena
451	Proveedora 798	3371839708	Calle 96 #3-46, Bucaramanga
452	Importadora 617	3576977633	Calle 81 #11-1, Cartagena
453	Exportadora 555	3120691987	Calle 99 #12-73, Bucaramanga
454	Suministros 313	3364892532	Calle 29 #44-79, Bucaramanga
455	Proveedora 358	3539206669	Calle 18 #13-53, Cartagena
456	Distribuciones 371	3263476708	Calle 45 #34-14, Cali
457	Exportadora 442	3635533348	Calle 20 #21-20, Barranquilla
458	Comercializadora 105	3802185977	Calle 7 #3-52, Bogotá
459	Suministros 477	3396426113	Calle 67 #10-12, Barranquilla
460	Exportadora 607	3847650275	Calle 61 #33-32, Cali
461	Suministros 694	3272348704	Calle 89 #50-45, Medellín
462	Importadora 635	3347733241	Calle 31 #50-68, Bogotá
463	Exportadora 673	3781303664	Calle 43 #10-60, Bogotá
464	Distribuciones 909	3430875908	Calle 44 #23-97, Bucaramanga
465	Comercializadora 435	3564658696	Calle 39 #44-90, Cali
466	Comercializadora 640	3985909684	Calle 92 #44-13, Bogotá
467	Exportadora 547	3715270835	Calle 92 #44-13, Bucaramanga
468	Distribuciones 493	3781805175	Calle 15 #48-98, Cali
469	Importadora 737	3292109376	Calle 51 #18-30, Barranquilla
470	Proveedora 714	3193373976	Calle 86 #36-18, Medellín
471	Suministros 835	3482672681	Calle 35 #48-28, Bogotá
472	Importadora 626	3268815444	Calle 85 #15-62, Medellín
473	Proveedora 528	3785886751	Calle 51 #18-30, Medellín
474	Distribuciones 357	3301432513	Calle 21 #11-14, Barranquilla
475	Proveedora 472	3384684257	Calle 59 #49-44, Medellín
476	Distribuciones 806	3746019159	Calle 61 #33-32, Bogotá
477	Comercializadora 719	3464771863	Calle 92 #44-13, Medellín
478	Suministros 898	3519017133	Calle 81 #11-1, Bogotá
479	Distribuciones 459	3483611315	Calle 72 #27-78, Bogotá
480	Suministros 393	3676707585	Calle 31 #50-68, Cartagena
481	Distribuciones 815	3806276904	Calle 11 #46-67, Cartagena
482	Importadora 620	3323097075	Calle 12 #16-50, Bucaramanga
483	Proveedora 936	3136585892	Calle 80 #38-35, Cali
484	Importadora 156	3179332001	Calle 64 #18-14, Cartagena
485	Importadora 946	3818190708	Calle 99 #12-73, Cartagena
486	Comercializadora 726	3960985450	Calle 91 #31-30, Bucaramanga
487	Proveedora 557	3111386067	Calle 10 #46-61, Medellín
488	Distribuciones 757	3421495476	Calle 45 #34-14, Barranquilla
489	Distribuciones 767	3737351943	Calle 59 #49-44, Cartagena
490	Importadora 851	3550942052	Calle 61 #33-32, Bogotá
491	Proveedora 718	3825763218	Calle 94 #28-86, Cali
492	Proveedora 565	3155146685	Calle 85 #15-62, Bucaramanga
493	Exportadora 939	3103787543	Calle 1 #41-54, Cali
494	Importadora 958	3875591823	Calle 77 #31-33, Cali
495	Importadora 375	3493136219	Calle 71 #23-53, Barranquilla
496	Proveedora 769	3964761569	Calle 13 #13-26, Bogotá
497	Distribuciones 459	3827436968	Calle 85 #15-62, Barranquilla
498	Exportadora 751	3412221841	Calle 47 #35-44, Cali
499	Comercializadora 444	3265218883	Calle 31 #50-68, Cartagena
500	Suministros 796	3426599202	Calle 50 #22-85, Barranquilla
501	Comercializadora 516	3751636388	Calle 75 #37-33, Cali
502	Suministros 787	3544421892	Calle 30 #12-94, Medellín
503	Proveedora 180	3165274283	Calle 26 #33-65, Medellín
504	Importadora 775	3627278992	Calle 91 #31-30, Bucaramanga
505	Exportadora 659	3379047121	Calle 76 #13-34, Barranquilla
506	Proveedora 110	3410239723	Calle 3 #48-90, Barranquilla
507	Comercializadora 867	3461421169	Calle 48 #30-56, Cartagena
508	Proveedora 145	3127346151	Calle 45 #34-14, Bucaramanga
509	Suministros 560	3621407607	Calle 70 #37-27, Cartagena
510	Proveedora 791	3631090364	Calle 82 #26-20, Barranquilla
511	Suministros 847	3351043565	Calle 62 #31-18, Bogotá
\.


--
-- TOC entry 4955 (class 0 OID 0)
-- Dependencies: 262
-- Name: client_id_seq; Type: SEQUENCE SET; Schema: proyecto; Owner: postgres
--

SELECT pg_catalog.setval('proyecto.client_id_seq', 900, true);


--
-- TOC entry 4956 (class 0 OID 0)
-- Dependencies: 249
-- Name: devolution_id_seq; Type: SEQUENCE SET; Schema: proyecto; Owner: postgres
--

SELECT pg_catalog.setval('proyecto.devolution_id_seq', 350, true);


--
-- TOC entry 4957 (class 0 OID 0)
-- Dependencies: 252
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: proyecto; Owner: postgres
--

SELECT pg_catalog.setval('proyecto.product_id_seq', 1031, true);


--
-- TOC entry 4958 (class 0 OID 0)
-- Dependencies: 257
-- Name: purchase_detail_id_seq; Type: SEQUENCE SET; Schema: proyecto; Owner: postgres
--

SELECT pg_catalog.setval('proyecto.purchase_detail_id_seq', 700, true);


--
-- TOC entry 4959 (class 0 OID 0)
-- Dependencies: 255
-- Name: purchase_id_seq; Type: SEQUENCE SET; Schema: proyecto; Owner: postgres
--

SELECT pg_catalog.setval('proyecto.purchase_id_seq', 997, true);


--
-- TOC entry 4960 (class 0 OID 0)
-- Dependencies: 259
-- Name: supplier_id_seq; Type: SEQUENCE SET; Schema: proyecto; Owner: postgres
--

SELECT pg_catalog.setval('proyecto.supplier_id_seq', 511, true);


--
-- TOC entry 4781 (class 2606 OID 34381)
-- Name: city city_pkey; Type: CONSTRAINT; Schema: proyecto; Owner: postgres
--

ALTER TABLE ONLY proyecto.city
    ADD CONSTRAINT city_pkey PRIMARY KEY (id);


--
-- TOC entry 4779 (class 2606 OID 34355)
-- Name: client client_pkey; Type: CONSTRAINT; Schema: proyecto; Owner: postgres
--

ALTER TABLE ONLY proyecto.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (id);


--
-- TOC entry 4777 (class 2606 OID 34366)
-- Name: departament departament_pkey; Type: CONSTRAINT; Schema: proyecto; Owner: postgres
--

ALTER TABLE ONLY proyecto.departament
    ADD CONSTRAINT departament_pkey PRIMARY KEY (id);


--
-- TOC entry 4761 (class 2606 OID 34217)
-- Name: devolution devolution_pkey; Type: CONSTRAINT; Schema: proyecto; Owner: postgres
--

ALTER TABLE ONLY proyecto.devolution
    ADD CONSTRAINT devolution_pkey PRIMARY KEY (id);


--
-- TOC entry 4763 (class 2606 OID 34222)
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: proyecto; Owner: postgres
--

ALTER TABLE ONLY proyecto.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (id);


--
-- TOC entry 4759 (class 2606 OID 34177)
-- Name: product_category product_category_pkey; Type: CONSTRAINT; Schema: proyecto; Owner: postgres
--

ALTER TABLE ONLY proyecto.product_category
    ADD CONSTRAINT product_category_pkey PRIMARY KEY (id);


--
-- TOC entry 4765 (class 2606 OID 34229)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: proyecto; Owner: postgres
--

ALTER TABLE ONLY proyecto.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- TOC entry 4767 (class 2606 OID 34239)
-- Name: product_supplier product_supplier_pkey; Type: CONSTRAINT; Schema: proyecto; Owner: postgres
--

ALTER TABLE ONLY proyecto.product_supplier
    ADD CONSTRAINT product_supplier_pkey PRIMARY KEY (product_id, supplier_id);


--
-- TOC entry 4771 (class 2606 OID 34255)
-- Name: purchase_detail purchase_detail_id_purchase_id_key; Type: CONSTRAINT; Schema: proyecto; Owner: postgres
--

ALTER TABLE ONLY proyecto.purchase_detail
    ADD CONSTRAINT purchase_detail_id_purchase_id_key UNIQUE (id, purchase_id);


--
-- TOC entry 4773 (class 2606 OID 34253)
-- Name: purchase_detail purchase_detail_pkey; Type: CONSTRAINT; Schema: proyecto; Owner: postgres
--

ALTER TABLE ONLY proyecto.purchase_detail
    ADD CONSTRAINT purchase_detail_pkey PRIMARY KEY (id);


--
-- TOC entry 4769 (class 2606 OID 34246)
-- Name: purchase purchase_pkey; Type: CONSTRAINT; Schema: proyecto; Owner: postgres
--

ALTER TABLE ONLY proyecto.purchase
    ADD CONSTRAINT purchase_pkey PRIMARY KEY (id);


--
-- TOC entry 4775 (class 2606 OID 34262)
-- Name: supplier supplier_pkey; Type: CONSTRAINT; Schema: proyecto; Owner: postgres
--

ALTER TABLE ONLY proyecto.supplier
    ADD CONSTRAINT supplier_pkey PRIMARY KEY (id);


--
-- TOC entry 4783 (class 2606 OID 34382)
-- Name: city city_departament_id_fkey; Type: FK CONSTRAINT; Schema: proyecto; Owner: postgres
--

ALTER TABLE ONLY proyecto.city
    ADD CONSTRAINT city_departament_id_fkey FOREIGN KEY (departament_id) REFERENCES proyecto.departament(id);


--
-- TOC entry 4782 (class 2606 OID 34230)
-- Name: product product_product_category_id_fkey; Type: FK CONSTRAINT; Schema: proyecto; Owner: postgres
--

ALTER TABLE ONLY proyecto.product
    ADD CONSTRAINT product_product_category_id_fkey FOREIGN KEY (product_category_id) REFERENCES proyecto.product_category(id);


-- Completed on 2025-05-14 22:36:32

--
-- PostgreSQL database dump complete
--

