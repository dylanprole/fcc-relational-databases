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
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    galaxy_type character varying(30) NOT NULL,
    diameter_in_thousand_lightyears integer,
    distance_from_milkyway_in_thousand_lightyears integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying NOT NULL,
    planet_id integer NOT NULL,
    radius_in_thousand_km numeric(10,3),
    perigee_in_thousand_km numeric(10,3),
    apogee_in_thousand_km numeric(10,3)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
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
-- Name: mountain; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.mountain (
    mountain_id integer NOT NULL,
    name character varying NOT NULL,
    planet_id integer NOT NULL,
    height_in_km numeric(10,3),
    climbed_by_humans boolean
);


ALTER TABLE public.mountain OWNER TO freecodecamp;

--
-- Name: mountain_mountain_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.mountain_mountain_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mountain_mountain_id_seq OWNER TO freecodecamp;

--
-- Name: mountain_mountain_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.mountain_mountain_id_seq OWNED BY public.mountain.mountain_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying NOT NULL,
    star_id integer NOT NULL,
    has_life boolean NOT NULL,
    home_to text
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
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
    star_id integer NOT NULL,
    name character varying NOT NULL,
    galaxy_id integer NOT NULL,
    lightyears_from_sun numeric(10,3),
    orbiting_planets_count integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
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
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: mountain mountain_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mountain ALTER COLUMN mountain_id SET DEFAULT nextval('public.mountain_mountain_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'milky way', 'barred spiral', 0, 0);
INSERT INTO public.galaxy VALUES (2, 'lmc', 'satellite', 14, 158);
INSERT INTO public.galaxy VALUES (3, 'andromeda', 'barred spiral', 220, 2500);
INSERT INTO public.galaxy VALUES (4, 'cigar galaxy', 'starburst', 37, 11500);
INSERT INTO public.galaxy VALUES (5, 'pinwheel galaxy', 'spiral', 170, 20870);
INSERT INTO public.galaxy VALUES (6, 'sombrero galaxy', 'UNDEFINED', 50, 29350);
INSERT INTO public.galaxy VALUES (7, 'whirlpool galaxy', 'spiral', 60, 30000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon', 3, 1.740, 362.600, 405.400);
INSERT INTO public.moon VALUES (2, 'phobos', 4, 0.010, 9.200, 9.500);
INSERT INTO public.moon VALUES (3, 'deimos', 4, 0.006, 22.500, 23.500);
INSERT INTO public.moon VALUES (4, 'europa', 5, 1.561, 664.900, 676.900);
INSERT INTO public.moon VALUES (5, 'io', 5, 1.822, 420.000, 423.400);
INSERT INTO public.moon VALUES (6, 'ganymede', 5, 2.634, 1069.200, 1071.600);
INSERT INTO public.moon VALUES (7, 'callisto', 5, 2.410, 1869.000, 1897.000);
INSERT INTO public.moon VALUES (8, 'mimas', 6, 0.416, 181.900, 189.200);
INSERT INTO public.moon VALUES (9, 'titan', 6, 2.574, 1186.700, 1257.100);
INSERT INTO public.moon VALUES (10, 'lapetus', 6, 0.735, 3560.800, 3560.800);
INSERT INTO public.moon VALUES (11, 'rhea', 6, 0.764, 527.100, 527.100);
INSERT INTO public.moon VALUES (12, 'dione', 6, 0.561, 377.400, 377.400);
INSERT INTO public.moon VALUES (13, 'tethys', 6, 0.531, 294.600, 294.600);
INSERT INTO public.moon VALUES (14, 'encladeus', 6, 0.252, 237.900, 237.900);
INSERT INTO public.moon VALUES (15, 'oberon', 7, 0.761, 583.500, 583.500);
INSERT INTO public.moon VALUES (16, 'puck', 7, 0.081, 86.000, 86.000);
INSERT INTO public.moon VALUES (17, 'miranda', 7, 0.236, 129.400, 129.400);
INSERT INTO public.moon VALUES (18, 'ariel', 7, 0.579, 191.000, 191.000);
INSERT INTO public.moon VALUES (19, 'umbriel', 7, 0.585, 266.000, 266.000);
INSERT INTO public.moon VALUES (20, 'triton', 8, 1.353, 354.800, 354.800);


--
-- Data for Name: mountain; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.mountain VALUES (1, 'mount everest', 3, 8.800, true);
INSERT INTO public.mountain VALUES (2, 'k2', 3, 8.600, true);
INSERT INTO public.mountain VALUES (3, 'mount fuji', 3, 3.800, true);
INSERT INTO public.mountain VALUES (4, 'mount cook', 3, 3.700, true);
INSERT INTO public.mountain VALUES (5, 'olympus mons', 4, 21.900, true);
INSERT INTO public.mountain VALUES (6, 'elysium mons', 4, 12.600, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'mercury', 1, false, NULL);
INSERT INTO public.planet VALUES (2, 'venus', 1, false, NULL);
INSERT INTO public.planet VALUES (3, 'earth', 1, true, 'humans');
INSERT INTO public.planet VALUES (4, 'mars', 1, false, NULL);
INSERT INTO public.planet VALUES (5, 'jupiter', 1, false, NULL);
INSERT INTO public.planet VALUES (6, 'saturn', 1, false, NULL);
INSERT INTO public.planet VALUES (7, 'uranus', 1, false, NULL);
INSERT INTO public.planet VALUES (8, 'neptune', 1, false, NULL);
INSERT INTO public.planet VALUES (9, 'tau ceti g', 3, false, NULL);
INSERT INTO public.planet VALUES (10, 'tau ceti h', 3, false, NULL);
INSERT INTO public.planet VALUES (11, 'tau ceti e', 3, false, NULL);
INSERT INTO public.planet VALUES (12, 'kapetyn c', 4, false, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'sol', 1, 0.000, 7);
INSERT INTO public.star VALUES (2, 'alpha centauri b', 1, 4.200, 0);
INSERT INTO public.star VALUES (3, 'tau ceti', 1, 11.900, 5);
INSERT INTO public.star VALUES (4, 'kapteyn', 1, 12.800, 2);
INSERT INTO public.star VALUES (5, 'wolf', 1, 14.000, 3);
INSERT INTO public.star VALUES (6, 'gliese 687', 1, 14.700, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: mountain_mountain_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.mountain_mountain_id_seq', 6, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: mountain mountain_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mountain
    ADD CONSTRAINT mountain_name_key UNIQUE (name);


--
-- Name: mountain mountain_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mountain
    ADD CONSTRAINT mountain_pkey PRIMARY KEY (mountain_id);


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
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: mountain mountain_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mountain
    ADD CONSTRAINT mountain_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

