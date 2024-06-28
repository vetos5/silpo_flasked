--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

-- Started on 2024-06-28 18:01:45

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
-- TOC entry 216 (class 1259 OID 16453)
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    price double precision,
    quantity integer,
    image_url character varying(100) NOT NULL
);


ALTER TABLE public.product OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16452)
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_id_seq OWNER TO postgres;

--
-- TOC entry 4790 (class 0 OID 0)
-- Dependencies: 215
-- Name: product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;


--
-- TOC entry 4637 (class 2604 OID 16456)
-- Name: product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);


--
-- TOC entry 4784 (class 0 OID 16453)
-- Dependencies: 216
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (id, name, price, quantity, image_url) FROM stdin;
2	Blueberry	148.72	3	https://images.silpo.ua/products/1600x1600/59705cdf-3f83-4306-99a3-a795c35e4e68.png
3	Sweet potato	13.9	30	https://images.silpo.ua/products/1600x1600/2b45e359-dde6-4719-b6fa-4f58ba0807d4.png
4	Barni with choco flavour	57	40	https://images.silpo.ua/products/1600x1600/webp/f1ed8269-474a-48fe-bb85-f511d8b6f633.png
5	Zaini extra dark chocolate	99	400	https://images.silpo.ua/products/1600x1600/webp/33dfe7b8-3100-4995-aedd-35feba730892.png
7	Salo v speciyah	23.9	400	https://images.silpo.ua/products/1600x1600/webp/e4fa0fc8-fca8-45cd-9477-c16d4da5e339.png
8	Paska	74.99	200	https://images.silpo.ua/products/1600x1600/webp/8d0652fe-80e7-4a93-a7fa-e852b9512d0f.png
6	Zbroya peremogy	339	4500	https://images.silpo.ua/products/1600x1600/webp/8f4f801d-750a-47c6-9b7d-cc2f3fd90b86.png
1	Orange	2139	4	https://images.silpo.ua/products/1600x1600/7774efde-6f1a-4ea6-821f-1ecb3b4d34fb.png
\.


--
-- TOC entry 4791 (class 0 OID 0)
-- Dependencies: 215
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_id_seq', 12, true);


--
-- TOC entry 4639 (class 2606 OID 16458)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


-- Completed on 2024-06-28 18:01:45

--
-- PostgreSQL database dump complete
--

