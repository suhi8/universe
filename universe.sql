--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(50) NOT NULL,
    abbreviation character varying(3) NOT NULL,
    area_sq_degrees integer,
    brightest_star character varying(50)
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_type character varying(30) NOT NULL,
    distance_from_earth_mly numeric(10,2),
    age_in_millions_of_years integer,
    is_spiral boolean NOT NULL,
    description text
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
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    diameter_km integer,
    discovered_year integer,
    is_spherical boolean NOT NULL,
    description text
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
    name character varying(50) NOT NULL,
    star_id integer NOT NULL,
    planet_type character varying(30),
    diameter_km integer,
    orbital_period_days numeric(12,2),
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    description text
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
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL,
    spectral_type character varying(10),
    age_in_millions_of_years integer,
    distance_from_earth_ly numeric(14,2),
    is_visible_naked_eye boolean NOT NULL
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Orion', 'Ori', 594, 'Rigel');
INSERT INTO public.constellation VALUES (2, 'Canis Major', 'CMa', 380, 'Sirius');
INSERT INTO public.constellation VALUES (3, 'Centaurus', 'Cen', 1060, 'Alpha Centauri');
INSERT INTO public.constellation VALUES (4, 'Ursa Major', 'UMa', 1280, 'Alioth');
INSERT INTO public.constellation VALUES (5, 'Andromeda', 'And', 722, 'Alpheratz');
INSERT INTO public.constellation VALUES (6, 'Scorpius', 'Sco', 497, 'Antares');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred spiral', 0.00, 13600, true, 'Our home galaxy.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Barred spiral', 2.54, 10000, true, 'Nearest large galaxy to the Milky Way.');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 2.73, 10000, true, 'Third largest member of the Local Group.');
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'Irregular', 0.16, 13000, false, 'Satellite galaxy of the Milky Way.');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral', 31.00, 400, true, 'Interacting grand-design spiral galaxy.');
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'Unbarred spiral', 29.00, 13250, false, 'Has a bright nucleus and a large central bulge.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 3474, NULL, true, 'Earth''s only natural satellite.');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 22, 1877, false, 'Larger and closer moon of Mars.');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 12, 1877, false, 'Smaller, outer moon of Mars.');
INSERT INTO public.moon VALUES (4, 'Io', 5, 3643, 1610, true, 'Most volcanically active body in the Solar System.');
INSERT INTO public.moon VALUES (5, 'Europa', 5, 3122, 1610, true, 'Icy moon with a subsurface ocean.');
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 5268, 1610, true, 'Largest moon in the Solar System.');
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 4821, 1610, true, 'Heavily cratered moon of Jupiter.');
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, 167, 1892, false, 'Irregularly shaped inner moon of Jupiter.');
INSERT INTO public.moon VALUES (9, 'Titan', 6, 5149, 1655, true, 'Has a dense atmosphere and methane lakes.');
INSERT INTO public.moon VALUES (10, 'Enceladus', 6, 504, 1789, true, 'Icy moon with water geysers.');
INSERT INTO public.moon VALUES (11, 'Mimas', 6, 396, 1789, true, 'Has the large Herschel crater.');
INSERT INTO public.moon VALUES (12, 'Rhea', 6, 1527, 1672, true, 'Second largest moon of Saturn.');
INSERT INTO public.moon VALUES (13, 'Iapetus', 6, 1469, 1671, true, 'Two-toned moon of Saturn.');
INSERT INTO public.moon VALUES (14, 'Dione', 6, 1123, 1684, true, 'Icy moon of Saturn.');
INSERT INTO public.moon VALUES (15, 'Tethys', 6, 1062, 1684, true, 'Mostly water ice moon of Saturn.');
INSERT INTO public.moon VALUES (16, 'Titania', 7, 1578, 1787, true, 'Largest moon of Uranus.');
INSERT INTO public.moon VALUES (17, 'Oberon', 7, 1523, 1787, true, 'Outermost major moon of Uranus.');
INSERT INTO public.moon VALUES (18, 'Umbriel', 7, 1169, 1851, true, 'Dark moon of Uranus.');
INSERT INTO public.moon VALUES (19, 'Ariel', 7, 1158, 1851, true, 'Brightest moon of Uranus.');
INSERT INTO public.moon VALUES (20, 'Miranda', 7, 472, 1948, true, 'Has extreme and varied terrain.');
INSERT INTO public.moon VALUES (21, 'Triton', 8, 2707, 1846, true, 'Largest moon of Neptune, orbits retrograde.');
INSERT INTO public.moon VALUES (22, 'Nereid', 8, 340, 1949, false, 'Moon of Neptune with a highly eccentric orbit.');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Terrestrial', 4879, 88.00, false, true, 'Smallest planet and closest to the Sun.');
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Terrestrial', 12104, 224.70, false, true, 'Hottest planet with a thick atmosphere.');
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Terrestrial', 12742, 365.25, true, true, 'The only known planet with life.');
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Terrestrial', 6779, 687.00, false, true, 'The red planet.');
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Gas giant', 139820, 4333.00, false, true, 'Largest planet in the Solar System.');
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Gas giant', 116460, 10759.00, false, true, 'Famous for its ring system.');
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Ice giant', 50724, 30687.00, false, true, 'Rotates on its side.');
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Ice giant', 49244, 60190.00, false, true, 'Farthest known major planet from the Sun.');
INSERT INTO public.planet VALUES (9, 'Proxima b', 3, 'Terrestrial', 14000, 11.20, false, true, 'Exoplanet in the habitable zone of Proxima Centauri.');
INSERT INTO public.planet VALUES (10, 'Proxima c', 3, 'Super-Earth', 24000, 1928.00, false, true, 'Candidate super-Earth orbiting Proxima Centauri.');
INSERT INTO public.planet VALUES (11, 'Proxima d', 3, 'Terrestrial', 8000, 5.12, false, true, 'Candidate sub-Earth close to Proxima Centauri.');
INSERT INTO public.planet VALUES (12, 'Sirius Alpha', 2, 'Hypothetical', 10000, 400.00, false, true, 'Hypothetical placeholder planet around Sirius.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G2V', 4600, 0.00, true);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 'A1V', 242, 8.60, true);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 1, 'M5.5Ve', 4850, 4.24, false);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 'M1-2', 10, 548.00, true);
INSERT INTO public.star VALUES (5, 'V1 Andromedae', 2, 'F', 100, 2537000.00, false);
INSERT INTO public.star VALUES (6, 'S Doradus', 4, 'B8', 5, 169000.00, false);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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

