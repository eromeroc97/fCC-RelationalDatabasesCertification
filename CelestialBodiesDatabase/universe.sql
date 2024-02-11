--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id bigint NOT NULL,
    name character varying(25) NOT NULL,
    diam_ly numeric,
    distance_to_milkway_mly integer,
    shape text NOT NULL,
    groups_id integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: groups; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.groups (
    groups_id bigint NOT NULL,
    name character varying(25) NOT NULL,
    distance_to_local_mly numeric
);


ALTER TABLE public.groups OWNER TO freecodecamp;

--
-- Name: groups_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.groups_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.groups_groups_id_seq OWNER TO freecodecamp;

--
-- Name: groups_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.groups_groups_id_seq OWNED BY public.groups.groups_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id bigint NOT NULL,
    name character varying(25) NOT NULL,
    moon_mass numeric,
    distance_to_planet_km numeric,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id bigint NOT NULL,
    name character varying(25) NOT NULL,
    distance_to_star_mkm numeric,
    isterrestrial boolean,
    isinhabitablearea boolean,
    earth_mass numeric NOT NULL,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id bigint NOT NULL,
    name character varying(25) NOT NULL,
    spectral_type text,
    sun_mass integer,
    color text,
    distance_to_sun_ly numeric,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: groups groups_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.groups ALTER COLUMN groups_id SET DEFAULT nextval('public.groups_groups_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milk Way', 100000, 0, 'Spiral', 1);
INSERT INTO public.galaxy VALUES (2, 'Andromeda (M31)', 220000, 3, 'Barred spiral', 1);
INSERT INTO public.galaxy VALUES (3, 'Triangle (M33)', 60000, 3, 'Spiral', 1);
INSERT INTO public.galaxy VALUES (4, 'Maffei 1', 120000, 10, 'Elliptical', 2);
INSERT INTO public.galaxy VALUES (5, 'IC 342', 45000, 11, 'Spiral', 2);
INSERT INTO public.galaxy VALUES (6, 'Dwingeloo 1', 50000, 10, 'Spiral', 2);
INSERT INTO public.galaxy VALUES (7, 'Sculptor (NGC 253)', 70000, 11, 'Spiral', 3);
INSERT INTO public.galaxy VALUES (8, 'NGC 55', 50000, 8, 'Spiral', 3);
INSERT INTO public.galaxy VALUES (9, 'NGC 247', 70000, 11, 'Spiral', 3);
INSERT INTO public.galaxy VALUES (10, 'Bode (M81)', 90000, 12, 'Spiral', 4);
INSERT INTO public.galaxy VALUES (11, 'Cigar (M82)', 37000, 12, 'Irregular', 4);
INSERT INTO public.galaxy VALUES (12, 'NGC 3077', 25000, 12, 'Irregular', 4);


--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.groups VALUES (1, 'Local Group', 0);
INSERT INTO public.groups VALUES (2, 'Maffei 1 Group', 10.4);
INSERT INTO public.groups VALUES (3, 'Sculptor Group', 11);
INSERT INTO public.groups VALUES (4, 'M81 Group', 11.7);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 384000, 3);
INSERT INTO public.moon VALUES (2, 'Io', 1.22, 421700, 5);
INSERT INTO public.moon VALUES (3, 'Europa', 0.65, 671034, 5);
INSERT INTO public.moon VALUES (4, 'Ganymede', 2.02, 1070412, 5);
INSERT INTO public.moon VALUES (5, 'Callisto', 1.47, 1882709, 5);
INSERT INTO public.moon VALUES (6, 'Titan', 1.83, 1221870, 6);
INSERT INTO public.moon VALUES (7, 'Rhea', 0.031, 527068, 6);
INSERT INTO public.moon VALUES (8, 'Iapetus', 0.024, 3560820, 6);
INSERT INTO public.moon VALUES (9, 'Dione', 0.015, 377396, 6);
INSERT INTO public.moon VALUES (10, 'Titania', 0.06, 435910, 7);
INSERT INTO public.moon VALUES (11, 'Oberon', 0.052, 583520, 7);
INSERT INTO public.moon VALUES (12, 'Umbriel', 0.022, 266300, 7);
INSERT INTO public.moon VALUES (13, 'Ariel', 0.022, 191020, 7);
INSERT INTO public.moon VALUES (14, 'Triton', 0.079, 354800, 8);
INSERT INTO public.moon VALUES (15, 'Proteus', 0.0002, 117647, 8);
INSERT INTO public.moon VALUES (16, 'Nereid', 0.00012, 5513827, 8);
INSERT INTO public.moon VALUES (17, 'Larissa', 0.000016, 73548, 8);
INSERT INTO public.moon VALUES (18, 'Phobos', 0.000000001072, 9378, 4);
INSERT INTO public.moon VALUES (19, 'Deimos', 0.00000000000049, 23460, 4);
INSERT INTO public.moon VALUES (20, 'Tethys', 0.000011, 294619, 6);
INSERT INTO public.moon VALUES (21, 'Enceladus', 0.0000011, 238042, 6);
INSERT INTO public.moon VALUES (22, 'Amalthea', 2.08, 181366, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 57.9, true, false, 0.0553, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 108.2, true, false, 0.815, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 149.6, true, true, 1, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 227.9, true, false, 0.107, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 778.6, false, false, 317.8, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 1433.5, false, false, 95.2, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 2872.5, false, false, 14.6, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 4495.1, false, false, 17.2, 1);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 4.24, true, true, 1.17, 3);
INSERT INTO public.planet VALUES (10, 'Kepler-90b', 0.1, false, false, 0.3, 4);
INSERT INTO public.planet VALUES (11, 'Kepler-90c', 0.17, false, false, 0.9, 4);
INSERT INTO public.planet VALUES (12, 'Kepler-90d', 0.25, false, false, 2.8, 4);
INSERT INTO public.planet VALUES (13, 'Kepler-90e', 0.4, false, false, 2.4, 4);
INSERT INTO public.planet VALUES (14, 'Kepler-90f', 0.5, true, false, 0.9, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G2V', 1, 'White-yellow', 0, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 'A1V', 2, 'White-blue', 8.6, 1);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 'M5.5Ve', 0, 'Red', 4.24, 1);
INSERT INTO public.star VALUES (4, 'Kepler-90', 'G', 1, 'Yellow', 2540, 1);
INSERT INTO public.star VALUES (5, 'Nova Andromeda 1885', 'Cataclysmic variable', 1, 'Variable', 2537000, 2);
INSERT INTO public.star VALUES (6, 'M31 PAndromedae', 'Variable', 5, 'Red', 2537000, 2);
INSERT INTO public.star VALUES (7, 'M33 Var B', 'Variable', 1, 'Variable', 2640000, 3);
INSERT INTO public.star VALUES (8, 'M33 Var A', 'Eclipsing variable', 1, 'Variable', 2640000, 3);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 12, true);


--
-- Name: groups_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.groups_groups_id_seq', 4, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: groups groups_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_name_key UNIQUE (name);


--
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (groups_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy galaxy_groups_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_groups_id_fkey FOREIGN KEY (groups_id) REFERENCES public.groups(groups_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

