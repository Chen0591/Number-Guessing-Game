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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer DEFAULT 1001,
    last_played timestamp without time zone DEFAULT now()
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO freecodecamp;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (2, 'user_1709022230254', 2, 2, '2024-02-27 08:23:50.552205');
INSERT INTO public.users VALUES (1, 'user_1709022230255', 5, 6, '2024-02-27 08:23:50.305894');
INSERT INTO public.users VALUES (4, 'user_1709022325379', 2, 1, '2024-02-27 08:25:25.61973');
INSERT INTO public.users VALUES (3, 'user_1709022325380', 5, 3, '2024-02-27 08:25:25.424218');
INSERT INTO public.users VALUES (6, 'user_1709022450074', 2, 3, '2024-02-27 08:27:30.430418');
INSERT INTO public.users VALUES (5, 'user_1709022450075', 5, 1, '2024-02-27 08:27:30.126604');
INSERT INTO public.users VALUES (7, 'user_1709022647705', 0, 1001, '2024-02-27 08:30:47.755394');
INSERT INTO public.users VALUES (8, 'user_1709022647704', 0, 1001, '2024-02-27 08:30:48.036193');
INSERT INTO public.users VALUES (10, 'user_1709022897546', 2, 676, '2024-02-27 08:34:57.808352');
INSERT INTO public.users VALUES (9, 'user_1709022897547', 5, 25, '2024-02-27 08:34:57.600772');
INSERT INTO public.users VALUES (12, 'user_1709022950209', 2, 38, '2024-02-27 08:35:50.469783');
INSERT INTO public.users VALUES (11, 'user_1709022950210', 5, 393, '2024-02-27 08:35:50.261826');
INSERT INTO public.users VALUES (14, 'user_1709023036683', 2, 612, '2024-02-27 08:37:16.946458');
INSERT INTO public.users VALUES (13, 'user_1709023036684', 5, 2, '2024-02-27 08:37:16.733321');
INSERT INTO public.users VALUES (16, 'user_1709023094697', 2, 37, '2024-02-27 08:38:14.938814');
INSERT INTO public.users VALUES (15, 'user_1709023094698', 5, 24, '2024-02-27 08:38:14.743706');


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_id_seq', 16, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

