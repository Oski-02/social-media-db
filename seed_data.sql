--
-- PostgreSQL database dump
--

\restrict kxWkMt2mPZ3TDeqafFpyPf1GgEjmaITUGn7FuoWfUCjNGW5Lr8fZiVEtsiv0kde

-- Dumped from database version 16.14 (Homebrew)
-- Dumped by pg_dump version 16.14 (Homebrew)

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

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: oskarborecki
--

COPY public.users (id, username, email, created_at) FROM stdin;
1	kasia_w	kasia.w@example.com	2026-09-05 15:17:30.188663
2	piotrek99	piotr.nowak@example.com	2026-09-05 15:17:30.188663
3	anna_kod	anna.koduje@example.com	2026-09-05 15:17:30.188663
4	tomasz_dev	tomasz.dev@example.com	2026-09-05 15:17:30.188663
5	gosia_b	gosia.b@example.com	2026-09-05 15:17:30.188663
\.


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: oskarborecki
--

COPY public.posts (id, user_id, content, created_at) FROM stdin;
1	1	Właśnie skończyłem czytać świetną książkę o historii kosmosu.	2026-09-05 15:27:20.919666
2	2	Dzisiaj rano usiadłem do pracy zdalnej w nowej kawiarni w centrum, o której ktoś mi wspominał tydzień temu. Muszę przyznać, że atmosfera jest naprawdę świetna – ciche wnętrze, dobra kawa, wygodne stoliki pod oknem i praktycznie żadnego hałasu poza cichą muzyką w tle. Planuję wracać tam regularnie, zwłaszcza gdy potrzebuję się skupić na dłuższym zadaniu bez rozpraszaczy z domu.	2026-09-05 15:27:20.919666
3	1	Ból mięśni gwarantowany po pierwszej wspinaczce.	2026-09-05 15:27:20.919666
4	3	Mój kot zdecydował dzisiaj, że moja klawiatura to najlepsze miejsce na drzemkę w całym mieszkaniu – oczywiście dokładnie w momencie, gdy próbowałem dokończyć ważnego maila. Trzy razy próbowałem go przesunąć, trzy razy wrócił z uporem godnym lepszej sprawy. Ostatecznie poddałem się i pracowałem z jedną ręką, żeby go nie ruszać.	2026-09-05 15:27:20.919666
5	4	Nowy odcinek mojego ulubionego podcastu o technologii wyszedł dzisiaj rano i szczerze mówiąc, przesłuchałem go już dwa razy z rzędu. Poruszyli temat, który mnie od dawna interesował – jak małe zespoły programistyczne radzą sobie z utrzymaniem dużych, starszych systemów bez całkowitego przepisywania ich od zera. Mnóstwo konkretnych przykładów i naprawdę praktycznych wskazówek.	2026-09-05 15:27:20.919666
6	2	Trzeci nieudany podchod do chleba na zakwasie z rzędu. Zaczynam podejrzewać, że problem nie leży w przepisie.	2026-09-05 15:27:20.919666
7	5	Weekend w górach był dokładnie tym czego potrzebowałem po ciężkim miesiącu w pracy.	2026-09-05 15:27:20.919666
8	1	Czy ktoś inny też ma totalny brak motywacji w poniedziałki, czy to tylko ja?	2026-09-05 15:27:20.919666
9	3	Znalazłam w końcu idealny przepis na wegańskie curry – tak dobre, że nawet moi znajomi mięsożercy prosili o dokładkę. Sekret podobno tkwi w odpowiednich proporcjach mleczka kokosowego do pasty curry, ale jak zwykle najważniejsza była chyba cierpliwość przy duszeniu warzyw na wolnym ogniu przez dobre pół godziny zamiast się spieszyć.	2026-09-05 15:27:20.919666
10	4	Testuję nowy rower od tygodnia – na razie same pozytywne wrażenia, choć siodełko wymaga jeszcze docierania.	2026-09-05 15:27:20.919666
11	5	Uczę się gotować dania kuchni tajskiej. Na razie umiarkowany sukces, ale pad thai wyszedł zaskakująco dobrze jak na pierwszy raz.	2026-09-05 15:27:20.919666
12	2	Zacząłem naukę gry na gitarze dwa tygodnie temu. Palce bolą niemiłosiernie, ale kupiłem już kapo i uczę się pierwszych akordów, więc chyba się nie poddaję tak łatwo jak myślałem, że się poddam po pierwszym tygodniu bólu opuszków.	2026-09-05 15:27:20.919666
13	4	Maraton serialu przez cały weekend – polecam nikomu nie mówić rodzinie, ile odcinków obejrzałem między piątkiem a niedzielą wieczorem.	2026-09-05 15:27:20.919666
14	5	Ogród warzywny w tym roku wyjątkowo obrodził pomidorami – mam ich tyle, że rozdaję sąsiadom i dalej nie nadążam zjeść wszystkiego, zanim się zepsują. Chyba w przyszłym roku posadzę mniej krzaków albo w końcu nauczę się robić przetwory, o czym mówię już od trzech lat i nigdy nie robię.	2026-09-05 15:27:20.919666
15	3	Szukam polecenia dobrego filmu na wieczór, coś lekkiego bez wielkich emocji.	2026-09-05 15:27:20.919666
\.


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: oskarborecki
--

COPY public.comments (id, user_id, post_id, content, created_at) FROM stdin;
1	2	1	Też to czytałem, świetna książka!	2026-09-05 15:51:25.04033
2	3	1	Dodaj do listy polecanych proszę.	2026-09-05 15:51:25.04033
3	1	2	Ta kawiarnia brzmi idealnie.	2026-09-05 15:51:25.04033
4	4	2	Podaj nazwę, muszę tam iść.	2026-09-05 15:51:25.04033
5	5	4	Koty zawsze wiedzą najlepiej.	2026-09-05 15:51:25.04033
6	2	5	Też walczę z klawiaturą i kotem codziennie.	2026-09-05 15:51:25.04033
7	3	6	Zakwas to loteria, trzymam kciuki za kolejny podchod.	2026-09-05 15:51:25.04033
8	1	7	Zazdroszczę, potrzebuję urlopu.	2026-09-05 15:51:25.04033
9	4	7	Góry zawsze pomagają.	2026-09-05 15:51:25.04033
10	5	8	Poniedziałki to plaga ludzkości.	2026-09-05 15:51:25.04033
11	1	9	Przepis proszę!	2026-09-05 15:51:25.04033
12	2	11	Pad thai za pierwszym razem to majstersztyk.	2026-09-05 15:51:25.04033
13	3	12	Ile czasu zajęła nauka pierwszych akordów?	2026-09-05 15:51:25.04033
14	4	14	Też mam nadprodukcję pomidorów, może wymiana?	2026-09-05 15:51:25.04033
15	1	15	Polecam coś z Wesa Andersona na luźny wieczór.	2026-09-05 15:51:25.04033
\.


--
-- Data for Name: followers; Type: TABLE DATA; Schema: public; Owner: oskarborecki
--

COPY public.followers (id, follower_id, followed_id, created_at) FROM stdin;
1	1	3	2026-09-05 15:49:46.892816
2	1	4	2026-09-05 15:49:46.892816
3	1	5	2026-09-05 15:49:46.892816
4	2	1	2026-09-05 15:49:46.892816
5	2	3	2026-09-05 15:49:46.892816
6	3	1	2026-09-05 15:49:46.892816
7	3	2	2026-09-05 15:49:46.892816
8	3	4	2026-09-05 15:49:46.892816
9	3	5	2026-09-05 15:49:46.892816
10	4	1	2026-09-05 15:49:46.892816
11	4	2	2026-09-05 15:49:46.892816
12	5	3	2026-09-05 15:49:46.892816
13	5	4	2026-09-05 15:49:46.892816
\.


--
-- Data for Name: likes; Type: TABLE DATA; Schema: public; Owner: oskarborecki
--

COPY public.likes (id, user_id, post_id, created_at) FROM stdin;
1	2	1	2026-09-05 15:36:29.304484
2	3	1	2026-09-05 15:36:29.304484
3	4	1	2026-09-05 15:36:29.304484
4	5	1	2026-09-05 15:36:29.304484
5	1	2	2026-09-05 15:36:29.304484
6	3	2	2026-09-05 15:36:29.304484
7	2	4	2026-09-05 15:36:29.304484
8	1	5	2026-09-05 15:36:29.304484
9	2	5	2026-09-05 15:36:29.304484
10	3	5	2026-09-05 15:36:29.304484
11	4	6	2026-09-05 15:36:29.304484
12	1	7	2026-09-05 15:36:29.304484
13	2	7	2026-09-05 15:36:29.304484
14	3	7	2026-09-05 15:36:29.304484
15	4	7	2026-09-05 15:36:29.304484
16	5	9	2026-09-05 15:36:29.304484
17	2	10	2026-09-05 15:36:29.304484
18	1	11	2026-09-05 15:36:29.304484
19	5	11	2026-09-05 15:36:29.304484
20	3	12	2026-09-05 15:36:29.304484
21	4	14	2026-09-05 15:36:29.304484
22	5	14	2026-09-05 15:36:29.304484
23	1	15	2026-09-05 15:36:29.304484
24	2	15	2026-09-05 15:36:29.304484
\.


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oskarborecki
--

SELECT pg_catalog.setval('public.comments_id_seq', 15, true);


--
-- Name: followers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oskarborecki
--

SELECT pg_catalog.setval('public.followers_id_seq', 13, true);


--
-- Name: likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oskarborecki
--

SELECT pg_catalog.setval('public.likes_id_seq', 24, true);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oskarborecki
--

SELECT pg_catalog.setval('public.posts_id_seq', 15, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oskarborecki
--

SELECT pg_catalog.setval('public.users_id_seq', 5, true);


--
-- PostgreSQL database dump complete
--

\unrestrict kxWkMt2mPZ3TDeqafFpyPf1GgEjmaITUGn7FuoWfUCjNGW5Lr8fZiVEtsiv0kde

