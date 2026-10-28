--
-- PostgreSQL database dump
--

\restrict hFKpoXbL4eZFkKlaNUrOrcwhqQAXNdkT3PNRkIpndjEYAYzRujvZHytBwyOFSxo

-- Dumped from database version 18.6
-- Dumped by pg_dump version 18.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: berths; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.berths (
    berth_id integer NOT NULL,
    port_id integer,
    berth_name text,
    max_draft_m numeric,
    max_loa_m numeric,
    max_beam_m numeric,
    verification_status text,
    source_id integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: berths_berth_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.berths_berth_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: berths_berth_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.berths_berth_id_seq OWNED BY public.berths.berth_id;


--
-- Name: data_sources; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.data_sources (
    source_id integer NOT NULL,
    source_name text,
    publisher text,
    source_url text,
    data_category text,
    provenance_notes text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: data_sources_source_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.data_sources_source_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: data_sources_source_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.data_sources_source_id_seq OWNED BY public.data_sources.source_id;


--
-- Name: freight_observations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.freight_observations (
    assessment_date date NOT NULL,
    record_id text NOT NULL,
    lane_id integer,
    freight_rate_usd_per_tonne numeric,
    route_distance_nm numeric,
    bdi_proxy_value numeric,
    bpi_proxy_value numeric,
    data_type text,
    source_id integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: lane_distances; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.lane_distances (
    distance_id integer NOT NULL,
    lane_id integer,
    distance_nm numeric,
    method text,
    source_url text,
    verification_notes text,
    source_id integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: lane_distances_distance_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.lane_distances_distance_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: lane_distances_distance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.lane_distances_distance_id_seq OWNED BY public.lane_distances.distance_id;


--
-- Name: market_observations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.market_observations (
    observed_at date NOT NULL,
    source_id integer NOT NULL,
    indicator_code text NOT NULL,
    indicator_name text,
    value numeric,
    unit text,
    data_type text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: ports; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ports (
    port_id integer NOT NULL,
    port_name text,
    country text,
    region text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: ports_port_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ports_port_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ports_port_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ports_port_id_seq OWNED BY public.ports.port_id;


--
-- Name: trade_lanes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trade_lanes (
    lane_id integer NOT NULL,
    route_id text,
    origin_port_id integer,
    destination_port_id integer,
    commodity text,
    vessel_class text,
    source_id integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: trade_lanes_lane_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.trade_lanes_lane_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: trade_lanes_lane_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.trade_lanes_lane_id_seq OWNED BY public.trade_lanes.lane_id;


--
-- Name: berths berth_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.berths ALTER COLUMN berth_id SET DEFAULT nextval('public.berths_berth_id_seq'::regclass);


--
-- Name: data_sources source_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.data_sources ALTER COLUMN source_id SET DEFAULT nextval('public.data_sources_source_id_seq'::regclass);


--
-- Name: lane_distances distance_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lane_distances ALTER COLUMN distance_id SET DEFAULT nextval('public.lane_distances_distance_id_seq'::regclass);


--
-- Name: ports port_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ports ALTER COLUMN port_id SET DEFAULT nextval('public.ports_port_id_seq'::regclass);


--
-- Name: trade_lanes lane_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trade_lanes ALTER COLUMN lane_id SET DEFAULT nextval('public.trade_lanes_lane_id_seq'::regclass);


--
-- Data for Name: berths; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.berths (berth_id, port_id, berth_name, max_draft_m, max_loa_m, max_beam_m, verification_status, source_id, created_at) FROM stdin;
\.


--
-- Data for Name: data_sources; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.data_sources (source_id, source_name, publisher, source_url, data_category, provenance_notes, created_at) FROM stdin;
\.


--
-- Data for Name: freight_observations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.freight_observations (assessment_date, record_id, lane_id, freight_rate_usd_per_tonne, route_distance_nm, bdi_proxy_value, bpi_proxy_value, data_type, source_id, created_at) FROM stdin;
\.


--
-- Data for Name: lane_distances; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.lane_distances (distance_id, lane_id, distance_nm, method, source_url, verification_notes, source_id, created_at) FROM stdin;
\.


--
-- Data for Name: market_observations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.market_observations (observed_at, source_id, indicator_code, indicator_name, value, unit, data_type, created_at) FROM stdin;
\.


--
-- Data for Name: ports; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ports (port_id, port_name, country, region, created_at) FROM stdin;
\.


--
-- Data for Name: trade_lanes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.trade_lanes (lane_id, route_id, origin_port_id, destination_port_id, commodity, vessel_class, source_id, created_at) FROM stdin;
\.


--
-- Name: berths_berth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.berths_berth_id_seq', 1, false);


--
-- Name: data_sources_source_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.data_sources_source_id_seq', 1, false);


--
-- Name: lane_distances_distance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.lane_distances_distance_id_seq', 1, false);


--
-- Name: ports_port_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ports_port_id_seq', 1, false);


--
-- Name: trade_lanes_lane_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.trade_lanes_lane_id_seq', 1, false);


--
-- Name: berths berths_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.berths
    ADD CONSTRAINT berths_pkey PRIMARY KEY (berth_id);


--
-- Name: data_sources data_sources_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.data_sources
    ADD CONSTRAINT data_sources_pkey PRIMARY KEY (source_id);


--
-- Name: freight_observations freight_observations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.freight_observations
    ADD CONSTRAINT freight_observations_pkey PRIMARY KEY (assessment_date, record_id);


--
-- Name: lane_distances lane_distances_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lane_distances
    ADD CONSTRAINT lane_distances_pkey PRIMARY KEY (distance_id);


--
-- Name: market_observations market_observations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.market_observations
    ADD CONSTRAINT market_observations_pkey PRIMARY KEY (observed_at, source_id, indicator_code);


--
-- Name: ports ports_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ports
    ADD CONSTRAINT ports_pkey PRIMARY KEY (port_id);


--
-- Name: trade_lanes trade_lanes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trade_lanes
    ADD CONSTRAINT trade_lanes_pkey PRIMARY KEY (lane_id);


--
-- Name: trade_lanes trade_lanes_route_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trade_lanes
    ADD CONSTRAINT trade_lanes_route_id_key UNIQUE (route_id);


--
-- Name: berths berths_port_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.berths
    ADD CONSTRAINT berths_port_id_fkey FOREIGN KEY (port_id) REFERENCES public.ports(port_id);


--
-- Name: berths berths_source_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.berths
    ADD CONSTRAINT berths_source_id_fkey FOREIGN KEY (source_id) REFERENCES public.data_sources(source_id);


--
-- Name: freight_observations freight_observations_lane_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.freight_observations
    ADD CONSTRAINT freight_observations_lane_id_fkey FOREIGN KEY (lane_id) REFERENCES public.trade_lanes(lane_id);


--
-- Name: freight_observations freight_observations_source_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.freight_observations
    ADD CONSTRAINT freight_observations_source_id_fkey FOREIGN KEY (source_id) REFERENCES public.data_sources(source_id);


--
-- Name: lane_distances lane_distances_lane_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lane_distances
    ADD CONSTRAINT lane_distances_lane_id_fkey FOREIGN KEY (lane_id) REFERENCES public.trade_lanes(lane_id);


--
-- Name: lane_distances lane_distances_source_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lane_distances
    ADD CONSTRAINT lane_distances_source_id_fkey FOREIGN KEY (source_id) REFERENCES public.data_sources(source_id);


--
-- Name: market_observations market_observations_source_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.market_observations
    ADD CONSTRAINT market_observations_source_id_fkey FOREIGN KEY (source_id) REFERENCES public.data_sources(source_id);


--
-- Name: trade_lanes trade_lanes_destination_port_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trade_lanes
    ADD CONSTRAINT trade_lanes_destination_port_id_fkey FOREIGN KEY (destination_port_id) REFERENCES public.ports(port_id);


--
-- Name: trade_lanes trade_lanes_origin_port_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trade_lanes
    ADD CONSTRAINT trade_lanes_origin_port_id_fkey FOREIGN KEY (origin_port_id) REFERENCES public.ports(port_id);


--
-- Name: trade_lanes trade_lanes_source_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trade_lanes
    ADD CONSTRAINT trade_lanes_source_id_fkey FOREIGN KEY (source_id) REFERENCES public.data_sources(source_id);


--
-- PostgreSQL database dump complete
--

\unrestrict hFKpoXbL4eZFkKlaNUrOrcwhqQAXNdkT3PNRkIpndjEYAYzRujvZHytBwyOFSxo

