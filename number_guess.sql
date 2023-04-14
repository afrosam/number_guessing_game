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
    username character varying(22) NOT NULL,
    games_played integer NOT NULL,
    best_game integer DEFAULT 0
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES ('user_1681354007166', 2, 102);
INSERT INTO public.users VALUES ('user_1681354007167', 5, 43);
INSERT INTO public.users VALUES ('user_1681354694406', 2, 88);
INSERT INTO public.users VALUES ('user_1681354017993', 2, 284);
INSERT INTO public.users VALUES ('user_1681354694407', 5, 303);
INSERT INTO public.users VALUES ('user_1681354017994', 5, 428);
INSERT INTO public.users VALUES ('user_1681354043122', 2, 125);
INSERT INTO public.users VALUES ('user_1681354746034', 2, 489);
INSERT INTO public.users VALUES ('user_1681354043123', 5, 294);
INSERT INTO public.users VALUES ('user_1681354083626', 2, 757);
INSERT INTO public.users VALUES ('user_1681354746035', 5, 224);
INSERT INTO public.users VALUES ('user_1681354083627', 5, 84);
INSERT INTO public.users VALUES ('user_1681354963157', 2, 650);
INSERT INTO public.users VALUES ('user_1681354173741', 2, 327);
INSERT INTO public.users VALUES ('user_1681354173742', 5, 169);
INSERT INTO public.users VALUES ('user_1681354963158', 5, 581);
INSERT INTO public.users VALUES ('user_1681354443123', 2, 444);
INSERT INTO public.users VALUES ('user_1681354443124', 5, 5);
INSERT INTO public.users VALUES ('user_1681354604725', 2, 977);
INSERT INTO public.users VALUES ('user_1681355348137', 2, 806);
INSERT INTO public.users VALUES ('user_1681354604726', 5, 167);
INSERT INTO public.users VALUES ('user_1681355348138', 5, 75);
INSERT INTO public.users VALUES ('happyday', 7, 1);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

