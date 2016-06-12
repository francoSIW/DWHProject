--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.1
-- Dumped by pg_dump version 9.5.2

-- Started on 2016-06-12 16:16:35 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 7 (class 2615 OID 16969)
-- Name: ava; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA ava;


ALTER SCHEMA ava OWNER TO postgres;

SET search_path = ava, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 182 (class 1259 OID 16970)
-- Name: anno_accademico; Type: TABLE; Schema: ava; Owner: postgres
--

CREATE TABLE anno_accademico (
    codice_anno integer NOT NULL,
    nome_anno_x numeric,
    "nome_anno_x-1" numeric,
    "nome_anno_x-1/x" text,
    "from" date,
    "to" date,
    iscrizione_from date,
    iscrizione_to date
);


ALTER TABLE anno_accademico OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 16976)
-- Name: anno_accademico_codice_anno_seq; Type: SEQUENCE; Schema: ava; Owner: postgres
--

CREATE SEQUENCE anno_accademico_codice_anno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE anno_accademico_codice_anno_seq OWNER TO postgres;

--
-- TOC entry 2454 (class 0 OID 0)
-- Dependencies: 183
-- Name: anno_accademico_codice_anno_seq; Type: SEQUENCE OWNED BY; Schema: ava; Owner: postgres
--

ALTER SEQUENCE anno_accademico_codice_anno_seq OWNED BY anno_accademico.codice_anno;


--
-- TOC entry 184 (class 1259 OID 16978)
-- Name: corso; Type: TABLE; Schema: ava; Owner: postgres
--

CREATE TABLE corso (
    k_corso integer NOT NULL,
    nome text,
    numero_cfu numeric,
    ssd text,
    "tipo_attività" text,
    codice_corso numeric
);


ALTER TABLE corso OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 16984)
-- Name: corso_di_studi; Type: TABLE; Schema: ava; Owner: postgres
--

CREATE TABLE corso_di_studi (
    k_cds integer NOT NULL,
    data_inizio_validita date,
    data_fine_validita date,
    nome_cds text,
    tipo_cds text,
    nome_dipartimento text,
    codice_dipartimento numeric,
    codice_cds numeric,
    durata_legale numeric,
    codice_ateneo text
);


ALTER TABLE corso_di_studi OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 16990)
-- Name: corso_di_studi_k_cds_seq; Type: SEQUENCE; Schema: ava; Owner: postgres
--

CREATE SEQUENCE corso_di_studi_k_cds_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE corso_di_studi_k_cds_seq OWNER TO postgres;

--
-- TOC entry 2455 (class 0 OID 0)
-- Dependencies: 186
-- Name: corso_di_studi_k_cds_seq; Type: SEQUENCE OWNED BY; Schema: ava; Owner: postgres
--

ALTER SEQUENCE corso_di_studi_k_cds_seq OWNED BY corso_di_studi.k_cds;


--
-- TOC entry 187 (class 1259 OID 16992)
-- Name: corso_k_corso_seq; Type: SEQUENCE; Schema: ava; Owner: postgres
--

CREATE SEQUENCE corso_k_corso_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE corso_k_corso_seq OWNER TO postgres;

--
-- TOC entry 2456 (class 0 OID 0)
-- Dependencies: 187
-- Name: corso_k_corso_seq; Type: SEQUENCE OWNED BY; Schema: ava; Owner: postgres
--

ALTER SEQUENCE corso_k_corso_seq OWNED BY corso.k_corso;


--
-- TOC entry 188 (class 1259 OID 16994)
-- Name: data; Type: TABLE; Schema: ava; Owner: postgres
--

CREATE TABLE data (
    k_data integer NOT NULL,
    giorno numeric NOT NULL,
    mese numeric NOT NULL,
    anno numeric NOT NULL
);


ALTER TABLE data OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 17000)
-- Name: data_k_data_seq; Type: SEQUENCE; Schema: ava; Owner: postgres
--

CREATE SEQUENCE data_k_data_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE data_k_data_seq OWNER TO postgres;

--
-- TOC entry 2457 (class 0 OID 0)
-- Dependencies: 189
-- Name: data_k_data_seq; Type: SEQUENCE OWNED BY; Schema: ava; Owner: postgres
--

ALTER SEQUENCE data_k_data_seq OWNED BY data.k_data;


--
-- TOC entry 190 (class 1259 OID 17002)
-- Name: esami; Type: TABLE; Schema: ava; Owner: postgres
--

CREATE TABLE esami (
    k_anno_accademico integer NOT NULL,
    k_studente integer NOT NULL,
    k_cds_studente integer NOT NULL,
    k_data integer NOT NULL,
    k_corso integer NOT NULL,
    voto_esame numeric,
    cfu_esame numeric
);


ALTER TABLE esami OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 17008)
-- Name: ingressi; Type: TABLE; Schema: ava; Owner: postgres
--

CREATE TABLE ingressi (
    k_anno_accademico integer NOT NULL,
    k_corso_di_studi integer NOT NULL,
    k_studente integer NOT NULL,
    k_data integer NOT NULL,
    k_tipo_immatricolazione integer NOT NULL,
    punteggio_test_ammissione numeric,
    immatricolato integer
);


ALTER TABLE ingressi OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 17014)
-- Name: lauree; Type: TABLE; Schema: ava; Owner: postgres
--

CREATE TABLE lauree (
    k_anno_accademico integer NOT NULL,
    k_studente integer NOT NULL,
    k_cds integer NOT NULL,
    k_data integer NOT NULL,
    voto_laurea integer
);


ALTER TABLE lauree OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 17017)
-- Name: studente; Type: TABLE; Schema: ava; Owner: postgres
--

CREATE TABLE studente (
    k_studente integer NOT NULL,
    data_di_nascita date,
    coorte numeric,
    titolo_di_studio text,
    sesso text,
    regione_residenza text,
    provincia_residenza text,
    comune_residenza text,
    stato_residenza text,
    cittadinanza text,
    cf text,
    voto_scuola_media_superiore text,
    nazione_diploma text,
    tipo_scuola_media_superiore text,
    istituto_scuola_media_superiore text,
    anno_conseguimento_titolo_scuola_media_superiore numeric
);


ALTER TABLE studente OWNER TO postgres;

--
-- TOC entry 194 (class 1259 OID 17023)
-- Name: studente_k_studente_seq; Type: SEQUENCE; Schema: ava; Owner: postgres
--

CREATE SEQUENCE studente_k_studente_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE studente_k_studente_seq OWNER TO postgres;

--
-- TOC entry 2458 (class 0 OID 0)
-- Dependencies: 194
-- Name: studente_k_studente_seq; Type: SEQUENCE OWNED BY; Schema: ava; Owner: postgres
--

ALTER SEQUENCE studente_k_studente_seq OWNED BY studente.k_studente;


--
-- TOC entry 195 (class 1259 OID 17025)
-- Name: tipo_immatricolazione; Type: TABLE; Schema: ava; Owner: postgres
--

CREATE TABLE tipo_immatricolazione (
    k_tipo_immatricolazione integer NOT NULL,
    id_tipo_immatricolazione text,
    tipo_immatricolazione text
);


ALTER TABLE tipo_immatricolazione OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 17031)
-- Name: tipo_immatricolazione_k_tipo_immatricolazione_seq; Type: SEQUENCE; Schema: ava; Owner: postgres
--

CREATE SEQUENCE tipo_immatricolazione_k_tipo_immatricolazione_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tipo_immatricolazione_k_tipo_immatricolazione_seq OWNER TO postgres;

--
-- TOC entry 2459 (class 0 OID 0)
-- Dependencies: 196
-- Name: tipo_immatricolazione_k_tipo_immatricolazione_seq; Type: SEQUENCE OWNED BY; Schema: ava; Owner: postgres
--

ALTER SEQUENCE tipo_immatricolazione_k_tipo_immatricolazione_seq OWNED BY tipo_immatricolazione.k_tipo_immatricolazione;


--
-- TOC entry 2298 (class 2604 OID 17033)
-- Name: codice_anno; Type: DEFAULT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY anno_accademico ALTER COLUMN codice_anno SET DEFAULT nextval('anno_accademico_codice_anno_seq'::regclass);


--
-- TOC entry 2299 (class 2604 OID 17034)
-- Name: k_corso; Type: DEFAULT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY corso ALTER COLUMN k_corso SET DEFAULT nextval('corso_k_corso_seq'::regclass);


--
-- TOC entry 2300 (class 2604 OID 17035)
-- Name: k_cds; Type: DEFAULT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY corso_di_studi ALTER COLUMN k_cds SET DEFAULT nextval('corso_di_studi_k_cds_seq'::regclass);


--
-- TOC entry 2301 (class 2604 OID 17036)
-- Name: k_data; Type: DEFAULT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY data ALTER COLUMN k_data SET DEFAULT nextval('data_k_data_seq'::regclass);


--
-- TOC entry 2302 (class 2604 OID 17037)
-- Name: k_studente; Type: DEFAULT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY studente ALTER COLUMN k_studente SET DEFAULT nextval('studente_k_studente_seq'::regclass);


--
-- TOC entry 2303 (class 2604 OID 17038)
-- Name: k_tipo_immatricolazione; Type: DEFAULT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY tipo_immatricolazione ALTER COLUMN k_tipo_immatricolazione SET DEFAULT nextval('tipo_immatricolazione_k_tipo_immatricolazione_seq'::regclass);


--
-- TOC entry 2305 (class 2606 OID 17040)
-- Name: anno_accademico_pkey; Type: CONSTRAINT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY anno_accademico
    ADD CONSTRAINT anno_accademico_pkey PRIMARY KEY (codice_anno);


--
-- TOC entry 2309 (class 2606 OID 17042)
-- Name: cds_pkey; Type: CONSTRAINT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY corso_di_studi
    ADD CONSTRAINT cds_pkey PRIMARY KEY (k_cds);


--
-- TOC entry 2307 (class 2606 OID 17044)
-- Name: corso_pkey; Type: CONSTRAINT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY corso
    ADD CONSTRAINT corso_pkey PRIMARY KEY (k_corso);


--
-- TOC entry 2311 (class 2606 OID 17046)
-- Name: data_pkey; Type: CONSTRAINT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY data
    ADD CONSTRAINT data_pkey PRIMARY KEY (k_data);


--
-- TOC entry 2313 (class 2606 OID 17048)
-- Name: esami_pkey; Type: CONSTRAINT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY esami
    ADD CONSTRAINT esami_pkey PRIMARY KEY (k_anno_accademico, k_studente, k_cds_studente, k_data, k_corso);


--
-- TOC entry 2315 (class 2606 OID 17050)
-- Name: ingressi_pkey; Type: CONSTRAINT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY ingressi
    ADD CONSTRAINT ingressi_pkey PRIMARY KEY (k_anno_accademico, k_corso_di_studi, k_studente, k_data, k_tipo_immatricolazione);


--
-- TOC entry 2317 (class 2606 OID 17052)
-- Name: lauree_pkey; Type: CONSTRAINT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY lauree
    ADD CONSTRAINT lauree_pkey PRIMARY KEY (k_anno_accademico, k_studente, k_cds, k_data);


--
-- TOC entry 2319 (class 2606 OID 17054)
-- Name: student_pkey; Type: CONSTRAINT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY studente
    ADD CONSTRAINT student_pkey PRIMARY KEY (k_studente);


--
-- TOC entry 2321 (class 2606 OID 17056)
-- Name: tipo_immatricolazione_pkey; Type: CONSTRAINT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY tipo_immatricolazione
    ADD CONSTRAINT tipo_immatricolazione_pkey PRIMARY KEY (k_tipo_immatricolazione);


--
-- TOC entry 2322 (class 2606 OID 17057)
-- Name: esami_k_anno_accademico_fkey; Type: FK CONSTRAINT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY esami
    ADD CONSTRAINT esami_k_anno_accademico_fkey FOREIGN KEY (k_anno_accademico) REFERENCES anno_accademico(codice_anno);


--
-- TOC entry 2323 (class 2606 OID 17062)
-- Name: esami_k_cds_studente_fkey; Type: FK CONSTRAINT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY esami
    ADD CONSTRAINT esami_k_cds_studente_fkey FOREIGN KEY (k_cds_studente) REFERENCES corso_di_studi(k_cds);


--
-- TOC entry 2324 (class 2606 OID 17067)
-- Name: esami_k_corso_fkey; Type: FK CONSTRAINT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY esami
    ADD CONSTRAINT esami_k_corso_fkey FOREIGN KEY (k_corso) REFERENCES corso(k_corso);


--
-- TOC entry 2325 (class 2606 OID 17072)
-- Name: esami_k_data_fkey; Type: FK CONSTRAINT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY esami
    ADD CONSTRAINT esami_k_data_fkey FOREIGN KEY (k_data) REFERENCES data(k_data);


--
-- TOC entry 2326 (class 2606 OID 17077)
-- Name: esami_k_studente_fkey; Type: FK CONSTRAINT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY esami
    ADD CONSTRAINT esami_k_studente_fkey FOREIGN KEY (k_studente) REFERENCES studente(k_studente);


--
-- TOC entry 2327 (class 2606 OID 17082)
-- Name: ingressi_k_anno_accademico_fkey; Type: FK CONSTRAINT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY ingressi
    ADD CONSTRAINT ingressi_k_anno_accademico_fkey FOREIGN KEY (k_anno_accademico) REFERENCES anno_accademico(codice_anno);


--
-- TOC entry 2328 (class 2606 OID 17087)
-- Name: ingressi_k_corso_di_studi_fkey; Type: FK CONSTRAINT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY ingressi
    ADD CONSTRAINT ingressi_k_corso_di_studi_fkey FOREIGN KEY (k_corso_di_studi) REFERENCES corso_di_studi(k_cds);


--
-- TOC entry 2329 (class 2606 OID 17092)
-- Name: ingressi_k_data_fkey; Type: FK CONSTRAINT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY ingressi
    ADD CONSTRAINT ingressi_k_data_fkey FOREIGN KEY (k_data) REFERENCES data(k_data);


--
-- TOC entry 2330 (class 2606 OID 17097)
-- Name: ingressi_k_studente_fkey; Type: FK CONSTRAINT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY ingressi
    ADD CONSTRAINT ingressi_k_studente_fkey FOREIGN KEY (k_studente) REFERENCES studente(k_studente);


--
-- TOC entry 2331 (class 2606 OID 17102)
-- Name: ingressi_k_tipo_immatricolazione_fkey; Type: FK CONSTRAINT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY ingressi
    ADD CONSTRAINT ingressi_k_tipo_immatricolazione_fkey FOREIGN KEY (k_tipo_immatricolazione) REFERENCES tipo_immatricolazione(k_tipo_immatricolazione);


--
-- TOC entry 2332 (class 2606 OID 17107)
-- Name: lauree_k_anno_accademico_fkey; Type: FK CONSTRAINT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY lauree
    ADD CONSTRAINT lauree_k_anno_accademico_fkey FOREIGN KEY (k_anno_accademico) REFERENCES anno_accademico(codice_anno);


--
-- TOC entry 2333 (class 2606 OID 17112)
-- Name: lauree_k_cds_fkey; Type: FK CONSTRAINT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY lauree
    ADD CONSTRAINT lauree_k_cds_fkey FOREIGN KEY (k_cds) REFERENCES corso_di_studi(k_cds);


--
-- TOC entry 2334 (class 2606 OID 17117)
-- Name: lauree_k_data_fkey; Type: FK CONSTRAINT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY lauree
    ADD CONSTRAINT lauree_k_data_fkey FOREIGN KEY (k_data) REFERENCES data(k_data);


--
-- TOC entry 2335 (class 2606 OID 17122)
-- Name: lauree_k_studente_fkey; Type: FK CONSTRAINT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY lauree
    ADD CONSTRAINT lauree_k_studente_fkey FOREIGN KEY (k_studente) REFERENCES studente(k_studente);


-- Completed on 2016-06-12 16:16:36 CEST

--
-- PostgreSQL database dump complete
--

