--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2023-04-10 22:11:24

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
-- TOC entry 215 (class 1259 OID 37012)
-- Name: client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client (
    client_id bigint NOT NULL,
    name character varying(100) NOT NULL,
    address character varying(100)
);


ALTER TABLE public.client OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 37011)
-- Name: client_client_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.client_client_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.client_client_id_seq OWNER TO postgres;

--
-- TOC entry 3370 (class 0 OID 0)
-- Dependencies: 214
-- Name: client_client_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.client_client_id_seq OWNED BY public.client.client_id;


--
-- TOC entry 221 (class 1259 OID 37043)
-- Name: nomenclature; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nomenclature (
    nomenclature_id bigint NOT NULL,
    product_categories_id bigint NOT NULL,
    name_of_product character varying(100) NOT NULL,
    amount bigint,
    price numeric(9,2)
);


ALTER TABLE public.nomenclature OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 37042)
-- Name: nomenclature_nomenclature_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.nomenclature_nomenclature_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nomenclature_nomenclature_id_seq OWNER TO postgres;

--
-- TOC entry 3371 (class 0 OID 0)
-- Dependencies: 220
-- Name: nomenclature_nomenclature_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.nomenclature_nomenclature_id_seq OWNED BY public.nomenclature.nomenclature_id;


--
-- TOC entry 217 (class 1259 OID 37019)
-- Name: order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."order" (
    order_id bigint NOT NULL,
    date date,
    client_id bigint NOT NULL,
    cost numeric(12,2)
);


ALTER TABLE public."order" OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 37055)
-- Name: order_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_details (
    order_details_id bigint NOT NULL,
    order_id bigint NOT NULL,
    nomenclature_id bigint NOT NULL,
    amount bigint
);


ALTER TABLE public.order_details OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 37054)
-- Name: order_details_order_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_details_order_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_details_order_details_id_seq OWNER TO postgres;

--
-- TOC entry 3372 (class 0 OID 0)
-- Dependencies: 222
-- Name: order_details_order_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_details_order_details_id_seq OWNED BY public.order_details.order_details_id;


--
-- TOC entry 216 (class 1259 OID 37018)
-- Name: order_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_order_id_seq OWNER TO postgres;

--
-- TOC entry 3373 (class 0 OID 0)
-- Dependencies: 216
-- Name: order_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_order_id_seq OWNED BY public."order".order_id;


--
-- TOC entry 219 (class 1259 OID 37031)
-- Name: product_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_categories (
    product_categories_id bigint NOT NULL,
    category character varying(100) NOT NULL,
    parent_category bigint
);


ALTER TABLE public.product_categories OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 37030)
-- Name: product_categories_product_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_categories_product_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_categories_product_categories_id_seq OWNER TO postgres;

--
-- TOC entry 3374 (class 0 OID 0)
-- Dependencies: 218
-- Name: product_categories_product_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_categories_product_categories_id_seq OWNED BY public.product_categories.product_categories_id;


--
-- TOC entry 3193 (class 2604 OID 37015)
-- Name: client client_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client ALTER COLUMN client_id SET DEFAULT nextval('public.client_client_id_seq'::regclass);


--
-- TOC entry 3196 (class 2604 OID 37046)
-- Name: nomenclature nomenclature_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nomenclature ALTER COLUMN nomenclature_id SET DEFAULT nextval('public.nomenclature_nomenclature_id_seq'::regclass);


--
-- TOC entry 3194 (class 2604 OID 37022)
-- Name: order order_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order" ALTER COLUMN order_id SET DEFAULT nextval('public.order_order_id_seq'::regclass);


--
-- TOC entry 3197 (class 2604 OID 37058)
-- Name: order_details order_details_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_details ALTER COLUMN order_details_id SET DEFAULT nextval('public.order_details_order_details_id_seq'::regclass);


--
-- TOC entry 3195 (class 2604 OID 37034)
-- Name: product_categories product_categories_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_categories ALTER COLUMN product_categories_id SET DEFAULT nextval('public.product_categories_product_categories_id_seq'::regclass);


--
-- TOC entry 3356 (class 0 OID 37012)
-- Dependencies: 215
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.client VALUES (1, 'Иванов Евгений', 'Земляной вал 41, кв. 6');
INSERT INTO public.client VALUES (2, 'Петров Александр', 'Б. Грузинская ул. 70, кв. 19');
INSERT INTO public.client VALUES (3, 'Смирнова София', 'Комсомольский пр. 98, кв. 70');
INSERT INTO public.client VALUES (4, 'Васильев Максим', 'ул. Клары Цеткин 33, кв. 9');
INSERT INTO public.client VALUES (5, 'Рыжикова Арина', 'ул. Широкая 6, кв. 105');
INSERT INTO public.client VALUES (6, 'Волкова Анна', '2-я Прогонная ул. 10, кв. 14');
INSERT INTO public.client VALUES (7, 'Новикова Алиса', 'ул. Гарибальди 4, кв. 44');


--
-- TOC entry 3362 (class 0 OID 37043)
-- Dependencies: 221
-- Data for Name: nomenclature; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.nomenclature VALUES (1, 2, 'Haier HWQ90B416FWB-RU', 19, 69999.00);
INSERT INTO public.nomenclature VALUES (2, 2, 'Hansa WHE1408BI', 17, 44999.00);
INSERT INTO public.nomenclature VALUES (3, 2, 'Candy CBD 485TWM/1-07', 3, 56999.00);
INSERT INTO public.nomenclature VALUES (4, 4, 'Indesit ITS 4180 W', 6, 27999.00);
INSERT INTO public.nomenclature VALUES (5, 5, 'Gorenje NRK6202AW4', 3, 41999.00);
INSERT INTO public.nomenclature VALUES (6, 6, 'LG 43NANO776QA', 1, 51999.00);
INSERT INTO public.nomenclature VALUES (7, 6, 'Sharp 32DB2E', 4, 9999.00);
INSERT INTO public.nomenclature VALUES (8, 9, 'Xiaomi RedmiBook 15 JYU4525RU', 7, 34999.00);
INSERT INTO public.nomenclature VALUES (9, 9, 'ASUS TUF Gaming A15 FA506IHR-US51 90NR07G6-M004F0', 8, 59999.00);
INSERT INTO public.nomenclature VALUES (10, 10, 'MSI Katana GF76 11UE-426RU', 8, 95999.00);
INSERT INTO public.nomenclature VALUES (11, 11, 'HP 24-df1062ny Bundle PC', 7, 52999.00);
INSERT INTO public.nomenclature VALUES (12, 11, 'Irbis MB2385', 34, 58999.00);


--
-- TOC entry 3358 (class 0 OID 37019)
-- Dependencies: 217
-- Data for Name: order; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."order" VALUES (2, '2023-02-12', 2, 8267856.00);
INSERT INTO public."order" VALUES (3, '2023-01-19', 3, 1140975.00);
INSERT INTO public."order" VALUES (5, '2023-03-30', 5, 60319984.00);
INSERT INTO public."order" VALUES (4, '2023-03-17', 4, 0.00);
INSERT INTO public."order" VALUES (6, '2023-01-20', 6, 775976.00);
INSERT INTO public."order" VALUES (7, '2023-02-28', 7, 21138610.00);
INSERT INTO public."order" VALUES (1, '2023-04-12', 1, 6409890.00);


--
-- TOC entry 3364 (class 0 OID 37055)
-- Dependencies: 223
-- Data for Name: order_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.order_details VALUES (1, 1, 1, 19);
INSERT INTO public.order_details VALUES (2, 1, 1, 17);
INSERT INTO public.order_details VALUES (3, 1, 2, 3);
INSERT INTO public.order_details VALUES (4, 2, 3, 6);
INSERT INTO public.order_details VALUES (5, 2, 4, 3);
INSERT INTO public.order_details VALUES (6, 2, 4, 1);
INSERT INTO public.order_details VALUES (7, 3, 4, 4);
INSERT INTO public.order_details VALUES (8, 3, 5, 7);
INSERT INTO public.order_details VALUES (9, 5, 6, 8);
INSERT INTO public.order_details VALUES (10, 5, 7, 8);
INSERT INTO public.order_details VALUES (11, 5, 8, 7);
INSERT INTO public.order_details VALUES (12, 5, 9, 34);
INSERT INTO public.order_details VALUES (13, 3, 8, 7);
INSERT INTO public.order_details VALUES (14, 6, 7, 8);
INSERT INTO public.order_details VALUES (15, 6, 6, 8);
INSERT INTO public.order_details VALUES (16, 2, 12, 85);
INSERT INTO public.order_details VALUES (17, 1, 11, 63);
INSERT INTO public.order_details VALUES (18, 3, 1, 7);
INSERT INTO public.order_details VALUES (19, 2, 2, 8);
INSERT INTO public.order_details VALUES (20, 1, 6, 8);
INSERT INTO public.order_details VALUES (21, 7, 5, 7);
INSERT INTO public.order_details VALUES (22, 7, 4, 34);
INSERT INTO public.order_details VALUES (23, 7, 3, 349);
INSERT INTO public.order_details VALUES (24, 6, 8, 8);
INSERT INTO public.order_details VALUES (25, 5, 9, 959);
INSERT INTO public.order_details VALUES (26, 2, 3, 7);
INSERT INTO public.order_details VALUES (27, 2, 9, 34);


--
-- TOC entry 3360 (class 0 OID 37031)
-- Dependencies: 219
-- Data for Name: product_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product_categories VALUES (1, 'Бытовая техника', NULL);
INSERT INTO public.product_categories VALUES (2, 'Стиральные машины', 1);
INSERT INTO public.product_categories VALUES (3, 'Холодильники', 1);
INSERT INTO public.product_categories VALUES (4, 'Однокамерные', 3);
INSERT INTO public.product_categories VALUES (5, 'Двухкамерные', 3);
INSERT INTO public.product_categories VALUES (6, 'Телевизоры', 1);
INSERT INTO public.product_categories VALUES (7, 'Компьютеры', NULL);
INSERT INTO public.product_categories VALUES (8, 'Ноутбуки', 7);
INSERT INTO public.product_categories VALUES (9, '17"', 8);
INSERT INTO public.product_categories VALUES (10, '19"', 8);
INSERT INTO public.product_categories VALUES (11, 'Моноблоки', 7);


--
-- TOC entry 3375 (class 0 OID 0)
-- Dependencies: 214
-- Name: client_client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.client_client_id_seq', 7, true);


--
-- TOC entry 3376 (class 0 OID 0)
-- Dependencies: 220
-- Name: nomenclature_nomenclature_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.nomenclature_nomenclature_id_seq', 12, true);


--
-- TOC entry 3377 (class 0 OID 0)
-- Dependencies: 222
-- Name: order_details_order_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_details_order_details_id_seq', 27, true);


--
-- TOC entry 3378 (class 0 OID 0)
-- Dependencies: 216
-- Name: order_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_order_id_seq', 7, true);


--
-- TOC entry 3379 (class 0 OID 0)
-- Dependencies: 218
-- Name: product_categories_product_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_categories_product_categories_id_seq', 11, true);


--
-- TOC entry 3199 (class 2606 OID 37017)
-- Name: client client_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (client_id);


--
-- TOC entry 3205 (class 2606 OID 37048)
-- Name: nomenclature nomenclature_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nomenclature
    ADD CONSTRAINT nomenclature_pkey PRIMARY KEY (nomenclature_id);


--
-- TOC entry 3207 (class 2606 OID 37060)
-- Name: order_details order_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT order_details_pkey PRIMARY KEY (order_details_id);


--
-- TOC entry 3201 (class 2606 OID 37024)
-- Name: order order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_pkey PRIMARY KEY (order_id);


--
-- TOC entry 3203 (class 2606 OID 37036)
-- Name: product_categories product_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_categories
    ADD CONSTRAINT product_categories_pkey PRIMARY KEY (product_categories_id);


--
-- TOC entry 3210 (class 2606 OID 37049)
-- Name: nomenclature nomenclature_product_categories_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nomenclature
    ADD CONSTRAINT nomenclature_product_categories_id_fkey FOREIGN KEY (product_categories_id) REFERENCES public.product_categories(product_categories_id);


--
-- TOC entry 3208 (class 2606 OID 37025)
-- Name: order order_client_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.client(client_id);


--
-- TOC entry 3211 (class 2606 OID 37066)
-- Name: order_details order_details_nomenclature_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT order_details_nomenclature_id_fkey FOREIGN KEY (nomenclature_id) REFERENCES public.nomenclature(nomenclature_id);


--
-- TOC entry 3212 (class 2606 OID 37061)
-- Name: order_details order_details_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT order_details_order_id_fkey FOREIGN KEY (order_id) REFERENCES public."order"(order_id);


--
-- TOC entry 3209 (class 2606 OID 37037)
-- Name: product_categories product_categories_parent_category_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_categories
    ADD CONSTRAINT product_categories_parent_category_fkey FOREIGN KEY (parent_category) REFERENCES public.product_categories(product_categories_id);


-- Completed on 2023-04-10 22:11:24

--
-- PostgreSQL database dump complete
--

