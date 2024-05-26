--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    perihelion_distance numeric NOT NULL,
    orbital_period_years integer NOT NULL,
    last_perihelion date,
    description text,
    is_periodic boolean NOT NULL
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    type character varying(30) NOT NULL,
    distance_from_earth numeric NOT NULL,
    age_in_millions_of_years integer,
    number_of_stars integer NOT NULL,
    description text,
    is_visible boolean NOT NULL
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
    name character varying(40) NOT NULL,
    radius_km integer NOT NULL,
    orbital_period_days numeric NOT NULL,
    has_atmosphere boolean NOT NULL,
    description text,
    planet_id integer
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    planet_type character varying(30) NOT NULL,
    age_in_million_years integer NOT NULL,
    distance_from_nearest_star numeric,
    has_life boolean NOT NULL,
    description text,
    star_id integer,
    size_in_km integer NOT NULL
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
    name character varying(40) NOT NULL,
    distance_from_earth numeric NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    number_of_metals_present integer,
    description text,
    galaxy_id integer,
    is_visible boolean NOT NULL
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


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
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley', 0.586, 75, '1986-02-09', 'The most famous periodic comet', true);
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 0.914, 2533, '1997-04-01', 'One of the brightest comets seen in recent decades', false);
INSERT INTO public.comet VALUES (3, 'Hyakutake', 0.230, 17000, '1996-03-25', 'A comet discovered in 1996, notable for its close approach to Earth', false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 0.0, 13600, 1000000000, 'Our home galaxy', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 2537000, 10000, 1000000000, 'Nearest major galaxy to the Milky Way', true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 3000000, 9500, 40000000, 'Small member of the Local Group', true);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 23000000, 600, 100000000, 'Located in the constellation Canes Venatici', true);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Elliptical', 29000000, 600, 80000000, 'Notable for its bright nucleus', true);
INSERT INTO public.galaxy VALUES (6, 'Cartwheel', 'Lenticular', 500000000, 1000, 5000000, 'Distinguished by its ring-like appearance', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1737, 27.3, false, 'Earths only natural satellite', 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 11, 0.3, false, 'One of the two moons of Mars', 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 6, 1.3, false, 'One of the two moons of Mars', 2);
INSERT INTO public.moon VALUES (4, 'Europa', 1560, 3.5, true, 'One of Jupiters largest moons', 3);
INSERT INTO public.moon VALUES (5, 'Ganymede', 2634, 7.2, true, 'The largest moon in the solar system', 3);
INSERT INTO public.moon VALUES (6, 'Callisto', 2410, 16.7, true, 'One of Jupiters largest moons', 3);
INSERT INTO public.moon VALUES (7, 'Io', 1821, 1.8, true, 'One of Jupiters largest moons', 3);
INSERT INTO public.moon VALUES (8, 'Titan', 2575, 15.9, true, 'The largest moon of Saturn', 4);
INSERT INTO public.moon VALUES (9, 'Rhea', 764, 4.5, false, 'The second-largest moon of Saturn', 4);
INSERT INTO public.moon VALUES (10, 'Iapetus', 735, 79.3, false, 'A moon of Saturn known for its two-tone coloration', 4);
INSERT INTO public.moon VALUES (11, 'Oberon', 761, 13.5, false, 'The second-largest moon of Uranus', 5);
INSERT INTO public.moon VALUES (12, 'Titania', 789, 8.7, false, 'The largest moon of Uranus', 5);
INSERT INTO public.moon VALUES (13, 'Triton', 1353, 5.9, true, 'The largest moon of Neptune', 6);
INSERT INTO public.moon VALUES (14, 'Charon', 606, 6.4, false, 'The largest moon of Pluto', 7);
INSERT INTO public.moon VALUES (15, 'Mimas', 198, 0.9, false, 'A moon of Saturn, known as the Death Star moon', 4);
INSERT INTO public.moon VALUES (16, 'Enceladus', 252, 1.4, true, 'A moon of Saturn known for its geysers', 4);
INSERT INTO public.moon VALUES (17, 'Dione', 561, 2.7, false, 'A moon of Saturn', 4);
INSERT INTO public.moon VALUES (18, 'Tethys', 533, 1.9, false, 'A moon of Saturn', 4);
INSERT INTO public.moon VALUES (19, 'Ariel', 578, 2.5, false, 'A moon of Uranus', 5);
INSERT INTO public.moon VALUES (20, 'Umbriel', 584, 4.1, false, 'A moon of Uranus', 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Terrestrial', 4500, 0.0000158, true, 'The only planet known to support life', 1, 12742);
INSERT INTO public.planet VALUES (2, 'Mars', 'Terrestrial', 4500, 0.0000158, false, 'Known as the Red Planet', 1, 6779);
INSERT INTO public.planet VALUES (3, 'Venus', 'Terrestrial', 4500, 0.0000158, false, 'Second planet from the Sun', 1, 12104);
INSERT INTO public.planet VALUES (4, 'Proxima b', 'Exoplanet', 4500, 0.000022, false, 'Orbits within the habitable zone of Proxima Centauri', 2, 11900);
INSERT INTO public.planet VALUES (5, 'Sirius b', 'White Dwarf', 120, 8.6, false, 'A faint white dwarf companion to Sirius', 3, 12000);
INSERT INTO public.planet VALUES (6, 'Betelgeuse b', 'Exoplanet', 10, 642.5, false, 'Orbits the red supergiant star Betelgeuse', 4, 14000);
INSERT INTO public.planet VALUES (7, 'Rigel b', 'Exoplanet', 9, 860, false, 'A planet orbiting the blue supergiant star Rigel', 5, 12500);
INSERT INTO public.planet VALUES (8, 'Vega b', 'Exoplanet', 455, 25.04, false, 'A planet orbiting the star Vega', 6, 12800);
INSERT INTO public.planet VALUES (9, 'Alpha Centauri Bb', 'Exoplanet', 4500, 4.37, false, 'Orbits Alpha Centauri B', 2, 13800);
INSERT INTO public.planet VALUES (10, 'Gliese 581d', 'Exoplanet', 1000, 20.3, false, 'Potentially habitable exoplanet', 2, 14900);
INSERT INTO public.planet VALUES (11, 'Kepler-22b', 'Exoplanet', 600, 587, false, 'Orbits in the habitable zone of its star', 3, 15200);
INSERT INTO public.planet VALUES (12, 'HD 209458 b', 'Hot Jupiter', 1000, 150, false, 'First exoplanet to be observed transiting its star', 2, 15300);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 0.0, 4600, 62, 'The star at the center of our solar system', 1, true);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 4.24, 4500, 41, 'The closest known star to the Sun', 2, true);
INSERT INTO public.star VALUES (3, 'Sirius', 8.6, 300, 67, 'The brightest star in the night sky', 2, true);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 642.5, 10, 40, 'A red supergiant star in the constellation Orion', 3, true);
INSERT INTO public.star VALUES (5, 'Rigel', 860, 9, 55, 'A blue supergiant star in the constellation Orion', 3, true);
INSERT INTO public.star VALUES (6, 'Vega', 25.04, 455, 45, 'The fifth-brightest star in the night sky', 4, true);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


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