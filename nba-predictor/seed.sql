--
-- PostgreSQL database dump
--

\restrict AX7Z3JKEId5awPJdlMMt2b2iiO5Lwt09Vjw2OR8Y86XDwgO2dVlSK12c9WfAi3w

-- Dumped from database version 16.14
-- Dumped by pg_dump version 16.14

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
-- Name: player; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.player (
    id bigint NOT NULL,
    api_player_id bigint,
    is_injured boolean,
    mvp_shares double precision,
    name character varying(255),
    playoff_games integer,
    team_id bigint,
    team_name character varying(255),
    all_nba_count integer,
    player_net_rating double precision,
    pie double precision
);


ALTER TABLE public.player OWNER TO postgres;

--
-- Name: team_stats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.team_stats (
    id bigint NOT NULL,
    efg_pct double precision,
    losses integer,
    net_rating double precision,
    season character varying(255),
    team_id bigint,
    team_name character varying(255),
    win_pct double precision,
    wins integer
);


ALTER TABLE public.team_stats OWNER TO postgres;

--
-- Data for Name: player; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.player (id, api_player_id, is_injured, mvp_shares, name, playoff_games, team_id, team_name, all_nba_count, player_net_rating, pie) FROM stdin;
1	1642933	f	\N	Keshon Gilbert	0	1610612737	Atlanta Hawks	0	-38.1	0.049
2	1642484	f	\N	RayJ Dennis	0	1610612737	Atlanta Hawks	0	-14.2	0.051
3	1630228	f	\N	Jonathan Kuminga	40	1610612737	Atlanta Hawks	0	4.1	0.111
4	1630552	f	\N	Jalen Johnson	14	1610612737	Atlanta Hawks	1	3.2	0.161
5	1630811	f	\N	Keaton Wallace	3	1610612737	Atlanta Hawks	0	-8.6	0.077
6	203468	f	\N	CJ McCollum	73	1610612737	Atlanta Hawks	0	1.5	0.105
7	1629216	f	\N	Gabe Vincent	60	1610612737	Atlanta Hawks	0	1.3	0.033
8	1630700	f	\N	Dyson Daniels	9	1610612737	Atlanta Hawks	0	6.2	0.106
9	1629638	f	\N	Nickeil Alexander-Walker	43	1610612737	Atlanta Hawks	0	4	0.105
10	1627741	f	\N	Buddy Hield	18	1610612737	Atlanta Hawks	0	-4.9	0.085
11	1642258	f	\N	Zaccharie Risacher	3	1610612737	Atlanta Hawks	0	0.2	0.07
12	1631132	f	\N	Christian Koloko	0	1610612737	Atlanta Hawks	0	-1.3	0.046
13	1628396	f	\N	Tony Bradley	24	1610612737	Atlanta Hawks	0	-14.2	0.074
14	1642854	f	\N	Asa Newell	2	1610612737	Atlanta Hawks	0	-3.8	0.074
15	1630168	f	\N	Onyeka Okongwu	35	1610612737	Atlanta Hawks	0	2.1	0.104
16	1631243	f	\N	Mouhamed Gueye	6	1610612737	Atlanta Hawks	0	2.3	0.075
17	1630557	f	\N	Corey Kispert	5	1610612737	Atlanta Hawks	0	-7	0.088
18	1629111	f	\N	Jock Landale	8	1610612737	Atlanta Hawks	0	-2.2	0.098
19	1628369	f	\N	Jayson Tatum	127	1610612738	Boston Celtics	1	10.5	0.159
20	202696	f	\N	Nikola Vučević	22	1610612738	Boston Celtics	0	-1.7	0.127
21	1627759	f	\N	Jaylen Brown	142	1610612738	Boston Celtics	1	6.5	0.152
22	1642910	f	\N	John Tonje	0	1610612738	Boston Celtics	0	-1.8	0.061
23	1628401	f	\N	Derrick White	90	1610612738	Boston Celtics	0	11.3	0.109
24	1630202	f	\N	Payton Pritchard	76	1610612738	Boston Celtics	0	8	0.12
25	1631199	f	\N	Ron Harper Jr.	6	1610612738	Boston Celtics	0	2.7	0.086
26	1641775	f	\N	Jordan Walsh	15	1610612738	Boston Celtics	0	5.1	0.08
27	1642864	f	\N	Hugo González	4	1610612738	Boston Celtics	0	11.9	0.067
28	1630573	f	\N	Sam Hauser	56	1610612738	Boston Celtics	0	8.8	0.08
29	1642917	f	\N	Max Shulga	2	1610612738	Boston Celtics	0	-7.6	-0.038
30	1630625	f	\N	Dalano Banton	6	1610612738	Boston Celtics	0	-4.3	0.051
31	1630568	f	\N	Luka Garza	19	1610612738	Boston Celtics	0	5.8	0.103
32	1631248	f	\N	Baylor Scheierman	11	1610612738	Boston Celtics	0	7.3	0.085
33	1642873	f	\N	Amari Williams	1	1610612738	Boston Celtics	0	-17.4	0.079
34	1629674	f	\N	Neemias Queta	14	1610612738	Boston Celtics	0	13.2	0.13
35	201935	f	\N	James Harden	191	1610612739	Cleveland Cavaliers	1	1.8	0.143
36	1629622	f	\N	Max Strus	82	1610612739	Cleveland Cavaliers	0	0.3	0.088
37	1628418	f	\N	Thomas Bryant	32	1610612739	Cleveland Cavaliers	0	3.6	0.115
38	1630596	f	\N	Evan Mobley	43	1610612739	Cleveland Cavaliers	1	5.7	0.135
39	1630241	f	\N	Sam Merrill	43	1610612739	Cleveland Cavaliers	0	7.7	0.081
40	203471	f	\N	Dennis Schröder	91	1610612739	Cleveland Cavaliers	0	-6.2	0.094
41	1641854	f	\N	Craig Porter Jr.	13	1610612739	Cleveland Cavaliers	0	4.6	0.092
42	1642434	f	\N	Riley Minix	0	1610612739	Cleveland Cavaliers	0	20.8	0.114
43	1631165	f	\N	Keon Ellis	12	1610612739	Cleveland Cavaliers	0	-4.8	0.058
44	1642281	f	\N	Jaylon Tyson	21	1610612739	Cleveland Cavaliers	0	3.6	0.092
45	1642400	f	\N	Tristan Enaruna	0	1610612739	Cleveland Cavaliers	0	21.7	0.105
46	1626204	f	\N	Larry Nance Jr.	32	1610612739	Cleveland Cavaliers	0	-2.9	0.062
47	1642878	f	\N	Tyrese Proctor	4	1610612739	Cleveland Cavaliers	0	-0.3	0.087
48	1628386	f	\N	Jarrett Allen	45	1610612739	Cleveland Cavaliers	0	6.4	0.143
49	1629731	f	\N	Dean Wade	32	1610612739	Cleveland Cavaliers	0	6.2	0.074
50	1630846	f	\N	Olivier Sarr	0	1610612739	Cleveland Cavaliers	0	26.5	0.088
51	1641772	f	\N	Nae'Qwan Tomlin	7	1610612739	Cleveland Cavaliers	0	3.6	0.069
52	1628378	f	\N	Donovan Mitchell	81	1610612739	Cleveland Cavaliers	2	7.2	0.152
53	1642490	f	\N	Josh Oduro	0	1610612740	New Orleans Pelicans	0	3.2	0.05
54	1642847	f	\N	Jeremiah Fears	0	1610612740	New Orleans Pelicans	0	-6.4	0.093
55	1629627	f	\N	Zion Williamson	0	1610612740	New Orleans Pelicans	0	-1.9	0.141
56	1630529	f	\N	Herbert Jones	10	1610612740	New Orleans Pelicans	0	-0.9	0.053
57	1629673	f	\N	Jordan Poole	35	1610612740	New Orleans Pelicans	0	-7.9	0.073
58	1630621	f	\N	Hunter Dickinson	0	1610612740	New Orleans Pelicans	0	-35.7	0.01
59	1627749	f	\N	Dejounte Murray	21	1610612740	New Orleans Pelicans	0	1.3	0.138
60	201599	f	\N	DeAndre Jordan	73	1610612740	New Orleans Pelicans	0	-2.4	0.119
61	1631121	f	\N	Bryce McGowens	0	1610612740	New Orleans Pelicans	0	-3.6	0.067
62	1642877	f	\N	Micah Peavy	0	1610612740	New Orleans Pelicans	0	-4.1	0.044
63	1631255	f	\N	Karlo Matković	0	1610612740	New Orleans Pelicans	0	-4.4	0.108
64	1642274	f	\N	Yves Missi	0	1610612740	New Orleans Pelicans	0	-1.3	0.087
65	1642852	f	\N	Derik Queen	0	1610612740	New Orleans Pelicans	0	-6.7	0.109
66	1641725	f	\N	Trey Alexander	0	1610612740	New Orleans Pelicans	0	-7	0.078
67	1641722	f	\N	Jordan Hawkins	3	1610612740	New Orleans Pelicans	0	-9.8	0.055
68	1630530	f	\N	Trey Murphy III	10	1610612740	New Orleans Pelicans	0	-3.6	0.122
69	1630180	f	\N	Saddiq Bey	6	1610612740	New Orleans Pelicans	0	-3.6	0.112
70	1626172	f	\N	Kevon Looney	89	1610612740	New Orleans Pelicans	0	-10.4	0.093
71	1629012	f	\N	Collin Sexton	0	1610612741	Chicago Bulls	0	-3	0.113
72	1630581	f	\N	Josh Giddey	10	1610612741	Chicago Bulls	0	-5	0.142
73	1630644	f	\N	Mac McClung	0	1610612741	Chicago Bulls	0	-9.4	0.047
74	1642265	f	\N	Rob Dillingham	3	1610612741	Chicago Bulls	0	-7.4	0.06
75	1642530	f	\N	Yuki Kawamura	0	1610612741	Chicago Bulls	0	-2.3	0.082
76	1631159	f	\N	Leonard Miller	6	1610612741	Chicago Bulls	0	-2.5	0.104
77	1628380	f	\N	Zach Collins	20	1610612741	Chicago Bulls	0	3.4	0.123
78	1630208	f	\N	Nick Richards	0	1610612741	Chicago Bulls	0	-8.4	0.079
79	1641824	f	\N	Matas Buzelis	0	1610612741	Chicago Bulls	0	-6.3	0.097
80	1631338	f	\N	Mouhamadou Gueye	0	1610612741	Chicago Bulls	0	-17.3	0.073
81	1629014	f	\N	Anfernee Simons	15	1610612741	Chicago Bulls	0	3	0.096
82	1642855	f	\N	Noa Essengue	0	1610612741	Chicago Bulls	0	-111.4	-0.095
83	1630188	f	\N	Jalen Smith	13	1610612741	Chicago Bulls	0	3.4	0.109
84	1627824	f	\N	Guerschon Yabusele	16	1610612741	Chicago Bulls	0	-7.9	0.077
85	1630200	f	\N	Tre Jones	0	1610612741	Chicago Bulls	0	-3.8	0.126
86	1630171	f	\N	Isaac Okoro	26	1610612741	Chicago Bulls	0	-8.5	0.05
87	1630172	f	\N	Patrick Williams	5	1610612741	Chicago Bulls	0	-11	0.057
88	1642950	f	\N	Lachlan Olbrich	0	1610612741	Chicago Bulls	0	2.3	0.074
89	1642967	f	\N	John Poulakidas	0	1610612742	Dallas Mavericks	0	-2.3	0.069
90	1631108	f	\N	Max Christie	9	1610612742	Dallas Mavericks	0	-6.9	0.079
91	1641726	f	\N	Dereck Lively II	21	1610612742	Dallas Mavericks	0	6.3	0.094
92	203939	f	\N	Dwight Powell	44	1610612742	Dallas Mavericks	0	-0.5	0.073
93	1642358	f	\N	AJ Johnson	0	1610612742	Dallas Mavericks	0	-6.4	0.045
94	1642948	f	\N	Ryan Nembhard	0	1610612742	Dallas Mavericks	0	-1.9	0.087
95	1630314	f	\N	Brandon Williams	0	1610612742	Dallas Mavericks	0	-4.4	0.115
96	202681	f	\N	Kyrie Irving	96	1610612742	Dallas Mavericks	0	0	0
97	1630230	f	\N	Naji Marshall	10	1610612742	Dallas Mavericks	0	-4.6	0.106
98	1628997	f	\N	Caleb Martin	45	1610612742	Dallas Mavericks	0	-9.2	0.063
99	203114	f	\N	Khris Middleton	80	1610612742	Dallas Mavericks	0	-11.1	0.073
100	1629655	f	\N	Daniel Gafford	27	1610612742	Dallas Mavericks	0	-7.1	0.114
101	1641890	f	\N	Tyler Smith	0	1610612742	Dallas Mavericks	0	-4.1	0.059
102	1629023	f	\N	P.J. Washington	22	1610612742	Dallas Mavericks	0	-7.3	0.093
103	1630619	f	\N	Moussa Cisse	0	1610612742	Dallas Mavericks	0	0.5	0.087
104	202691	f	\N	Klay Thompson	158	1610612742	Dallas Mavericks	0	-4.7	0.077
105	1642843	f	\N	Cooper Flagg	0	1610612742	Dallas Mavericks	0	-5.2	0.128
106	1628963	f	\N	Marvin Bagley III	2	1610612742	Dallas Mavericks	0	-9.1	0.123
107	1631128	f	\N	Christian Braun	51	1610612743	Denver Nuggets	0	10.1	0.076
108	1642938	f	\N	Curtis Jones	0	1610612743	Denver Nuggets	0	13.6	0.075
109	1631124	f	\N	Julian Strawther	14	1610612743	Denver Nuggets	0	1.5	0.082
110	1626145	f	\N	Tyus Jones	30	1610612743	Denver Nuggets	0	-6.1	0.065
111	1631212	f	\N	Peyton Watson	29	1610612743	Denver Nuggets	0	6.2	0.087
112	203501	f	\N	Tim Hardaway Jr.	54	1610612743	Denver Nuggets	0	4.5	0.085
113	1628971	f	\N	Bruce Brown	46	1610612743	Denver Nuggets	0	-1	0.069
114	1641747	f	\N	DaRon Holmes II	2	1610612743	Denver Nuggets	0	-3	0.095
115	203999	f	\N	Nikola Jokić	100	1610612743	Denver Nuggets	2	10.8	0.213
116	202685	f	\N	Jonas Valančiūnas	62	1610612743	Denver Nuggets	0	-2	0.15
117	1642461	f	\N	Spencer Jones	6	1610612743	Denver Nuggets	0	1.6	0.045
118	1630192	f	\N	Zeke Nnaji	23	1610612743	Denver Nuggets	0	-6.6	0.07
119	1629661	f	\N	Cameron Johnson	44	1610612743	Denver Nuggets	0	9.5	0.075
120	1629618	f	\N	Jalen Pickett	13	1610612743	Denver Nuggets	0	-0.4	0.084
121	1642354	f	\N	KJ Simpson	0	1610612743	Denver Nuggets	0	0	0.065
122	1627750	f	\N	Jamal Murray	85	1610612743	Denver Nuggets	1	6.8	0.142
123	203932	f	\N	Aaron Gordon	69	1610612743	Denver Nuggets	0	12.7	0.117
124	1631223	f	\N	David Roddy	8	1610612743	Denver Nuggets	0	3.1	0.128
125	1627780	f	\N	Gary Payton II	35	1610612744	Golden State Warriors	0	-2.3	0.114
126	1641764	f	\N	Brandin Podziemski	12	1610612744	Golden State Warriors	0	-0.1	0.114
127	1642954	f	\N	Will Richard	0	1610612744	Golden State Warriors	0	-3.3	0.063
128	1630541	f	\N	Moses Moody	37	1610612744	Golden State Warriors	0	2.2	0.083
129	204001	f	\N	Kristaps Porziņģis	28	1610612744	Golden State Warriors	0	3	0.124
130	1629001	f	\N	De'Anthony Melton	27	1610612744	Golden State Warriors	0	3.9	0.09
131	202710	f	\N	Jimmy Butler III	130	1610612744	Golden State Warriors	0	7.3	0.155
132	1630611	f	\N	Gui Santos	10	1610612744	Golden State Warriors	0	1	0.097
133	1643018	f	\N	LJ Cryer	0	1610612744	Golden State Warriors	0	-0.4	0.07
134	1631466	f	\N	Nate Williams	3	1610612744	Golden State Warriors	0	-15.1	0.056
135	201143	f	\N	Al Horford	197	1610612744	Golden State Warriors	0	-0.9	0.104
136	1642366	f	\N	Quinten Post	12	1610612744	Golden State Warriors	0	2.3	0.089
137	203110	f	\N	Draymond Green	169	1610612744	Golden State Warriors	0	-4.3	0.084
138	1629646	f	\N	Charles Bassey	3	1610612744	Golden State Warriors	0	-13	0.136
139	201939	f	\N	Stephen Curry	155	1610612744	Golden State Warriors	1	2.8	0.146
140	203552	f	\N	Seth Curry	41	1610612744	Golden State Warriors	0	-3	0.093
141	1642502	f	\N	Malevy Leons	0	1610612744	Golden State Warriors	0	-10.6	0.062
142	1630311	f	\N	Pat Spencer	8	1610612744	Golden State Warriors	0	-3.4	0.087
143	1628988	f	\N	Aaron Holiday	23	1610612745	Houston Rockets	0	8.3	0.063
144	1641708	f	\N	Amen Thompson	13	1610612745	Houston Rockets	0	6.6	0.128
145	1627827	f	\N	Dorian Finney-Smith	44	1610612745	Houston Rockets	0	1.8	0.034
146	1631120	f	\N	JD Davison	6	1610612745	Houston Rockets	0	2.6	0.09
147	1627832	f	\N	Fred VanVleet	59	1610612745	Houston Rockets	0	0	0
148	201142	f	\N	Kevin Durant	171	1610612745	Houston Rockets	1	5.5	0.15
149	1630256	f	\N	Jae'Sean Tate	5	1610612745	Houston Rockets	0	-3.3	0.067
150	1631095	f	\N	Jabari Smith Jr.	13	1610612745	Houston Rockets	0	5	0.093
151	203500	f	\N	Steven Adams	73	1610612745	Houston Rockets	0	11.8	0.1
152	1641803	f	\N	Tristen Newton	0	1610612745	Houston Rockets	0	8	0.149
153	1642263	f	\N	Reed Sheppard	9	1610612745	Houston Rockets	0	4.3	0.102
154	1631106	f	\N	Tari Eason	13	1610612745	Houston Rockets	0	6.5	0.083
155	1629006	f	\N	Josh Okogie	21	1610612745	Houston Rockets	0	5.6	0.056
156	1642384	f	\N	Isaiah Crawford	0	1610612745	Houston Rockets	0	-5.9	0.087
157	1630578	f	\N	Alperen Sengun	13	1610612745	Houston Rockets	0	3.4	0.142
158	203991	f	\N	Clint Capela	91	1610612745	Houston Rockets	0	8	0.11
159	201145	f	\N	Jeff Green	108	1610612745	Houston Rockets	0	-8.1	0.061
160	1641807	f	\N	Norchad Omier	0	1610612746	LA Clippers	0	-54.8	0.16
161	1642951	f	\N	Sean Pedulla	0	1610612746	LA Clippers	0	-30	0.05
162	203078	f	\N	Bradley Beal	49	1610612746	LA Clippers	0	-9.3	0.018
163	202695	f	\N	Kawhi Leonard	146	1610612746	LA Clippers	1	7.5	0.185
164	1642920	f	\N	Kobe Sanders	0	1610612746	LA Clippers	0	0.2	0.062
165	1627884	f	\N	Derrick Jones Jr.	51	1610612746	LA Clippers	0	4	0.072
166	203992	f	\N	Bogdan Bogdanović	35	1610612746	LA Clippers	0	-4.4	0.069
167	1627739	f	\N	Kris Dunn	12	1610612746	LA Clippers	0	0.5	0.074
168	1631097	f	\N	Bennedict Mathurin	22	1610612746	LA Clippers	0	-3.9	0.105
169	1629636	f	\N	Darius Garland	22	1610612746	LA Clippers	0	2.6	0.112
170	201572	f	\N	Brook Lopez	89	1610612746	LA Clippers	0	1.2	0.076
171	1642353	f	\N	Cam Christie	3	1610612746	LA Clippers	0	-0.6	0.071
172	1631102	f	\N	TyTy Washington Jr.	0	1610612746	LA Clippers	0	-18.1	0.082
173	1642949	f	\N	Yanic Konan Niederhäuser	0	1610612746	LA Clippers	0	4.5	0.098
174	1628381	f	\N	John Collins	29	1610612746	LA Clippers	0	-1.2	0.098
175	1641757	f	\N	Jordan Miller	3	1610612746	LA Clippers	0	-0.4	0.106
176	1630543	f	\N	Isaiah Jackson	15	1610612746	LA Clippers	0	-2.9	0.104
177	201587	f	\N	Nicolas Batum	76	1610612746	LA Clippers	0	-0.5	0.058
178	1642876	f	\N	Adou Thiero	6	1610612747	Los Angeles Lakers	0	-13.2	0.054
179	1629020	f	\N	Jarred Vanderbilt	36	1610612747	Los Angeles Lakers	0	0.2	0.08
180	1642261	f	\N	Dalton Knecht	7	1610612747	Los Angeles Lakers	0	-8.5	0.069
181	1629028	f	\N	Deandre Ayton	55	1610612747	Los Angeles Lakers	0	0.1	0.117
182	1642355	f	\N	Bronny James	10	1610612747	Los Angeles Lakers	0	-8	0.058
183	1628379	f	\N	Luke Kennard	38	1610612747	Los Angeles Lakers	0	0.5	0.089
184	1629637	f	\N	Jaxson Hayes	24	1610612747	Los Angeles Lakers	0	2.4	0.109
185	1631222	f	\N	Jake LaRavia	8	1610612747	Los Angeles Lakers	0	0	0.067
186	1628467	f	\N	Maxi Kleber	0	1610612747	Los Angeles Lakers	0	3.1	0.038
187	1630559	f	\N	Austin Reaves	32	1610612747	Los Angeles Lakers	0	5	0.137
188	1631166	f	\N	Drew Timme	0	1610612747	Los Angeles Lakers	0	-6.9	0.084
189	1641733	f	\N	Nick Smith Jr.	6	1610612747	Los Angeles Lakers	0	-1.1	0.067
190	2544	f	\N	LeBron James	302	1610612747	Los Angeles Lakers	1	2.6	0.154
191	1629060	f	\N	Rui Hachimura	41	1610612747	Los Angeles Lakers	0	2	0.073
192	1643024	f	\N	Chris Mañon	0	1610612747	Los Angeles Lakers	0	-3.3	0.086
193	203935	f	\N	Marcus Smart	118	1610612747	Los Angeles Lakers	0	6.8	0.059
194	1629029	f	\N	Luka Dončić	55	1610612747	Los Angeles Lakers	1	3.8	0.188
195	1631323	f	\N	Simone Fontecchio	0	1610612748	Miami Heat	0	3.3	0.09
196	1631211	f	\N	Trevor Keels	0	1610612748	Miami Heat	0	17.7	0.039
197	1631107	f	\N	Nikola Jović	16	1610612748	Miami Heat	0	-0.8	0.073
198	1642276	f	\N	Kel'el Ware	4	1610612748	Miami Heat	0	-1	0.137
199	1641796	f	\N	Pelle Larsson	4	1610612748	Miami Heat	0	2.4	0.084
200	1631170	f	\N	Jaime Jaquez Jr.	7	1610612748	Miami Heat	0	2.9	0.113
201	1630696	f	\N	Dru Smith	0	1610612748	Miami Heat	0	-3.2	0.091
202	1628389	f	\N	Bam Adebayo	78	1610612748	Miami Heat	0	6.1	0.138
203	1629639	f	\N	Tyler Herro	50	1610612748	Miami Heat	0	-2	0.122
204	1642066	f	\N	Myron Gardner	0	1610612748	Miami Heat	0	8.4	0.093
205	1642352	f	\N	Keshad Johnson	2	1610612748	Miami Heat	0	13	0.083
206	1642443	f	\N	Jahmir Young	0	1610612748	Miami Heat	0	5.6	0.048
207	203952	f	\N	Andrew Wiggins	44	1610612748	Miami Heat	0	-0.1	0.092
208	1626181	f	\N	Norman Powell	91	1610612748	Miami Heat	0	0.6	0.113
209	1642857	f	\N	Kasparas Jakučionis	0	1610612748	Miami Heat	0	3	0.073
210	1630558	f	\N	Davion Mitchell	11	1610612748	Miami Heat	0	4.2	0.083
211	1642884	f	\N	Vladislav Goldin	0	1610612748	Miami Heat	0	16.3	0.105
212	1630579	f	\N	Jericho Sims	10	1610612749	Milwaukee Bucks	0	-10.1	0.083
213	1626167	f	\N	Myles Turner	66	1610612749	Milwaukee Bucks	0	-6.2	0.086
214	1629018	f	\N	Gary Trent Jr.	16	1610612749	Milwaukee Bucks	0	-12.4	0.047
215	1629645	f	\N	Kevin Porter Jr.	5	1610612749	Milwaukee Bucks	0	-4.7	0.132
216	1626171	f	\N	Bobby Portis	54	1610612749	Milwaukee Bucks	0	-8.2	0.122
217	203914	f	\N	Gary Harris	39	1610612749	Milwaukee Bucks	0	-9.6	0.048
218	1627752	f	\N	Taurean Prince	26	1610612749	Milwaukee Bucks	0	-3.8	0.073
219	1631157	f	\N	Ryan Rollins	3	1610612749	Milwaukee Bucks	0	-3.2	0.111
220	1628398	f	\N	Kyle Kuzma	32	1610612749	Milwaukee Bucks	0	-6.6	0.096
221	1631260	f	\N	AJ Green	11	1610612749	Milwaukee Bucks	0	-3.6	0.058
222	1631172	f	\N	Ousmane Dieng	13	1610612749	Milwaukee Bucks	0	-8.6	0.075
223	1630828	f	\N	Alex Antetokounmpo	0	1610612749	Milwaukee Bucks	0	12.8	0.196
224	1642504	f	\N	Cormac Ryan	0	1610612749	Milwaukee Bucks	0	-3.1	0.104
225	203507	f	\N	Giannis Antetokounmpo	84	1610612749	Milwaukee Bucks	1	4.4	0.213
226	1631250	f	\N	Pete Nance	0	1610612749	Milwaukee Bucks	0	-5.2	0.078
227	203648	f	\N	Thanasis Antetokounmpo	25	1610612749	Milwaukee Bucks	0	3.1	0.094
228	1641748	f	\N	Andre Jackson Jr.	7	1610612749	Milwaukee Bucks	0	-7.5	0.044
229	1628978	f	\N	Donte DiVincenzo	58	1610612750	Minnesota Timberwolves	0	6.2	0.084
230	1630545	f	\N	Terrence Shannon Jr.	18	1610612750	Minnesota Timberwolves	0	-8.5	0.069
231	1630183	f	\N	Jaden McDaniels	49	1610612750	Minnesota Timberwolves	0	3.1	0.088
232	1641763	f	\N	Julian Phillips	5	1610612750	Minnesota Timberwolves	0	-2.9	0.046
233	1630162	f	\N	Anthony Edwards	52	1610612750	Minnesota Timberwolves	1	3.5	0.145
234	204060	f	\N	Joe Ingles	60	1610612750	Minnesota Timberwolves	0	-5.8	0.096
235	1630538	f	\N	Bones Hyland	23	1610612750	Minnesota Timberwolves	0	5.2	0.101
236	201144	f	\N	Mike Conley	120	1610612750	Minnesota Timberwolves	0	0.2	0.061
237	1629675	f	\N	Naz Reid	48	1610612750	Minnesota Timberwolves	0	3.2	0.112
238	203937	f	\N	Kyle Anderson	76	1610612750	Minnesota Timberwolves	0	-4.2	0.095
239	1630245	f	\N	Ayo Dosunmu	15	1610612750	Minnesota Timberwolves	0	-1.5	0.114
240	1642389	f	\N	Zyon Pullin	0	1610612750	Minnesota Timberwolves	0	2.5	0.11
241	1642866	f	\N	Joan Beringer	5	1610612750	Minnesota Timberwolves	0	2.3	0.107
242	1641740	f	\N	Jaylen Clark	11	1610612750	Minnesota Timberwolves	0	4.1	0.054
243	1642402	f	\N	Enrique Freeman	0	1610612750	Minnesota Timberwolves	0	24.2	0.091
244	203497	f	\N	Rudy Gobert	96	1610612750	Minnesota Timberwolves	0	5	0.121
245	203944	f	\N	Julius Randle	42	1610612750	Minnesota Timberwolves	0	4	0.128
246	1642911	f	\N	Rocco Zikarsky	0	1610612750	Minnesota Timberwolves	0	6.2	0.151
247	1631169	f	\N	Josh Minott	11	1610612751	Brooklyn Nets	0	-0.1	0.104
248	1630533	f	\N	Ziaire Williams	14	1610612751	Brooklyn Nets	0	-10.1	0.079
249	1642874	f	\N	Danny Wolf	0	1610612751	Brooklyn Nets	0	-9	0.096
250	1642962	f	\N	Drake Powell	0	1610612751	Brooklyn Nets	0	-16.1	0.053
251	1642856	f	\N	Egor Dëmin	0	1610612751	Brooklyn Nets	0	-5.9	0.081
252	1630604	f	\N	E.J. Liddell	1	1610612751	Brooklyn Nets	0	-6.5	0.087
253	1630623	f	\N	Tyson Etienne	0	1610612751	Brooklyn Nets	0	-12.2	0.071
254	1629611	f	\N	Terance Mann	43	1610612751	Brooklyn Nets	0	-8.2	0.066
255	1629008	f	\N	Michael Porter Jr.	75	1610612751	Brooklyn Nets	0	-6.6	0.141
256	1641869	f	\N	Malachi Smith	0	1610612751	Brooklyn Nets	0	-13.2	0.102
257	1630549	f	\N	Day'Ron Sharpe	3	1610612751	Brooklyn Nets	0	-4.3	0.141
258	1641730	f	\N	Noah Clowney	0	1610612751	Brooklyn Nets	0	-8.7	0.072
259	1630592	f	\N	Jalen Wilson	0	1610612751	Brooklyn Nets	0	-10.9	0.061
260	1630534	f	\N	Ochai Agbaji	0	1610612751	Brooklyn Nets	0	-2.7	0.057
261	1643052	f	\N	Chaney Johnson	0	1610612751	Brooklyn Nets	0	-9	0.099
262	1629651	f	\N	Nic Claxton	20	1610612751	Brooklyn Nets	0	-12.9	0.117
263	1642879	f	\N	Ben Saraf	0	1610612751	Brooklyn Nets	0	-12.5	0.06
264	1642849	f	\N	Nolan Traore	0	1610612751	Brooklyn Nets	0	-10.5	0.056
265	203903	f	\N	Jordan Clarkson	61	1610612752	New York Knicks	0	3.7	0.068
266	1641794	f	\N	Dillon Jones	10	1610612752	New York Knicks	0	4.2	0.053
267	1630540	f	\N	Miles McBride	58	1610612752	New York Knicks	0	9.5	0.085
268	1628404	f	\N	Josh Hart	61	1610612752	New York Knicks	0	5.5	0.118
269	1642359	f	\N	Pacôme Dadiet	9	1610612752	New York Knicks	0	-1.7	0.085
270	1630631	f	\N	Jose Alvarado	28	1610612752	New York Knicks	0	1.3	0.088
271	1628384	f	\N	OG Anunoby	71	1610612752	New York Knicks	0	9.2	0.099
272	1641755	f	\N	Kevin McCullar Jr.	0	1610612752	New York Knicks	0	-12.1	0.062
273	1628973	f	\N	Jalen Brunson	86	1610612752	New York Knicks	2	6.1	0.135
274	1642278	f	\N	Tyler Kolek	11	1610612752	New York Knicks	0	6	0.101
275	1631110	f	\N	Jeremy Sochan	8	1610612752	New York Knicks	0	-3.9	0.081
276	1629011	f	\N	Mitchell Robinson	53	1610612752	New York Knicks	0	7.8	0.124
277	1628969	f	\N	Mikal Bridges	76	1610612752	New York Knicks	0	6	0.099
278	1626157	f	\N	Karl-Anthony Towns	69	1610612752	New York Knicks	1	7	0.154
279	1629013	f	\N	Landry Shamet	83	1610612752	New York Knicks	0	8.1	0.07
280	1641998	f	\N	Trey Jemison III	0	1610612752	New York Knicks	0	-16.8	0.027
281	1642885	f	\N	Mohamed Diawara	6	1610612752	New York Knicks	0	5.3	0.076
282	1630574	f	\N	Ariel Hukporti	13	1610612752	New York Knicks	0	3.1	0.084
283	1631457	f	\N	Alex Morales	0	1610612753	Orlando Magic	0	16.3	-0.006
284	1641710	f	\N	Anthony Black	14	1610612753	Orlando Magic	0	0.2	0.09
285	1628371	f	\N	Jonathan Isaac	17	1610612753	Orlando Magic	0	-1.3	0.078
286	1628975	f	\N	Jevon Carter	25	1610612753	Orlando Magic	0	-5.7	0.074
287	1630217	f	\N	Desmond Bane	34	1610612753	Orlando Magic	0	2.2	0.111
288	1630591	f	\N	Jalen Suggs	14	1610612753	Orlando Magic	0	5.2	0.11
289	1631094	f	\N	Paolo Banchero	19	1610612753	Orlando Magic	0	-0.2	0.138
290	1631288	f	\N	Jamal Cain	7	1610612753	Orlando Magic	0	4.5	0.081
291	1642859	f	\N	Jase Richardson	1	1610612753	Orlando Magic	0	-0.8	0.074
292	1641724	f	\N	Jett Howard	4	1610612753	Orlando Magic	0	-5.5	0.07
293	1630658	f	\N	Colin Castleton	0	1610612753	Orlando Magic	0	14	0.098
294	1629021	f	\N	Moritz Wagner	9	1610612753	Orlando Magic	0	-10	0.106
295	1630532	f	\N	Franz Wagner	16	1610612753	Orlando Magic	0	3.6	0.134
296	1641783	f	\N	Tristan da Silva	9	1610612753	Orlando Magic	0	1.6	0.085
297	1628976	f	\N	Wendell Carter Jr.	19	1610612753	Orlando Magic	0	2.2	0.096
298	1629048	f	\N	Goga Bitadze	11	1610612753	Orlando Magic	0	1.6	0.122
299	1642869	f	\N	Noah Penda	1	1610612753	Orlando Magic	0	-3	0.076
300	1630169	f	\N	Tyrese Haliburton	38	1610612754	Indiana Pacers	1	0	0
301	1630167	f	\N	Obi Toppin	56	1610612754	Indiana Pacers	0	-3.6	0.143
302	1629614	f	\N	Andrew Nembhard	40	1610612754	Indiana Pacers	0	-10	0.111
303	1643007	f	\N	Taelon Peter	0	1610612754	Indiana Pacers	0	-8.7	0.057
304	1641716	f	\N	Jarace Walker	21	1610612754	Indiana Pacers	0	-11.1	0.09
305	1642880	f	\N	Kam Jones	0	1610612754	Indiana Pacers	0	-10	0.061
306	204456	f	\N	T.J. McConnell	62	1610612754	Indiana Pacers	0	-7.6	0.15
307	1630695	f	\N	Micah Potter	0	1610612754	Indiana Pacers	0	-6.4	0.114
308	1642277	f	\N	Johnny Furphy	11	1610612754	Indiana Pacers	0	-4.6	0.066
309	1641771	f	\N	Jalen Slawson	0	1610612754	Indiana Pacers	0	-4.3	0.09
310	1630174	f	\N	Aaron Nesmith	60	1610612754	Indiana Pacers	0	-7.3	0.067
311	1641738	f	\N	Kobe Brown	6	1610612754	Indiana Pacers	0	-10.5	0.078
312	1641767	f	\N	Ben Sheppard	38	1610612754	Indiana Pacers	0	-8.8	0.066
313	1631245	f	\N	Quenton Jackson	0	1610612754	Indiana Pacers	0	-3.8	0.096
314	1630643	f	\N	Jay Huff	2	1610612754	Indiana Pacers	0	-6.3	0.092
315	1627826	f	\N	Ivica Zubac	52	1610612754	Indiana Pacers	0	-2.4	0.13
316	1627783	f	\N	Pascal Siakam	93	1610612754	Indiana Pacers	0	-5.6	0.13
317	1630679	f	\N	Ethan Thompson	0	1610612754	Indiana Pacers	0	-0.1	0.051
318	1630178	f	\N	Tyrese Maxey	52	1610612755	Philadelphia 76ers	1	1.5	0.15
319	203083	f	\N	Andre Drummond	28	1610612755	Philadelphia 76ers	0	-3.2	0.113
320	1629656	f	\N	Quentin Grimes	20	1610612755	Philadelphia 76ers	0	-0.1	0.092
321	200768	f	\N	Kyle Lowry	138	1610612755	Philadelphia 76ers	0	-18	0.013
322	202331	f	\N	Paul George	125	1610612755	Philadelphia 76ers	0	3.6	0.117
323	1626162	f	\N	Kelly Oubre Jr.	35	1610612755	Philadelphia 76ers	0	-1.9	0.083
324	1642348	f	\N	Justin Edwards	9	1610612755	Philadelphia 76ers	0	-3.4	0.068
325	1630570	f	\N	Trendon Watford	7	1610612755	Philadelphia 76ers	0	-9.1	0.093
326	1631207	f	\N	Dalen Terry	7	1610612755	Philadelphia 76ers	0	-2.9	0.076
327	1630699	f	\N	MarJon Beauchamp	6	1610612755	Philadelphia 76ers	0	-4	0.087
328	203954	f	\N	Joel Embiid	66	1610612755	Philadelphia 76ers	0	5.8	0.163
329	1641780	f	\N	Johni Broome	2	1610612755	Philadelphia 76ers	0	-13.6	-0.02
330	1631213	f	\N	Tyrese Martin	0	1610612755	Philadelphia 76ers	0	-10.9	0.077
331	1631230	f	\N	Dominick Barlow	9	1610612755	Philadelphia 76ers	0	0.8	0.078
332	1641737	f	\N	Adem Bona	10	1610612755	Philadelphia 76ers	0	0.3	0.069
333	1631133	f	\N	Jabari Walker	6	1610612755	Philadelphia 76ers	0	0	0.073
334	1642845	f	\N	VJ Edgecombe	11	1610612755	Philadelphia 76ers	0	0.9	0.092
335	1626220	f	\N	Royce O'Neale	52	1610612756	Phoenix Suns	0	-3.6	0.082
336	1642346	f	\N	Ryan Dunn	4	1610612756	Phoenix Suns	0	1.7	0.081
337	1626164	f	\N	Devin Booker	51	1610612756	Phoenix Suns	0	3.9	0.142
338	1629599	f	\N	Amir Coffey	24	1610612756	Phoenix Suns	0	-2.2	0.068
339	1628415	f	\N	Dillon Brooks	33	1610612756	Phoenix Suns	0	-1.1	0.088
340	1630224	f	\N	Jalen Green	11	1610612756	Phoenix Suns	0	0.7	0.106
341	1629312	f	\N	Haywood Highsmith	37	1610612756	Phoenix Suns	0	1.7	0.107
342	1628960	f	\N	Grayson Allen	28	1610612756	Phoenix Suns	0	0.1	0.105
343	1642863	f	\N	Khaman Maluach	4	1610612756	Phoenix Suns	0	2.5	0.098
344	1642345	f	\N	Oso Ighodaro	4	1610612756	Phoenix Suns	0	5.1	0.09
345	1631221	f	\N	Collin Gillespie	4	1610612756	Phoenix Suns	0	3.7	0.108
346	1642886	f	\N	Koby Brea	0	1610612756	Phoenix Suns	0	-4.2	0.101
347	1631109	f	\N	Mark Williams	0	1610612756	Phoenix Suns	0	-2	0.141
348	1631123	f	\N	Jamaree Bouyea	4	1610612756	Phoenix Suns	0	1.4	0.103
349	1630587	f	\N	Isaiah Livers	0	1610612756	Phoenix Suns	0	1.1	0.05
350	1642853	f	\N	Rasheer Fleming	4	1610612756	Phoenix Suns	0	6.1	0.056
351	1643047	f	\N	CJ Huntley	0	1610612756	Phoenix Suns	0	17.6	0.061
352	1630692	f	\N	Jordan Goodwin	5	1610612756	Phoenix Suns	0	3.3	0.098
353	1643257	f	\N	Jayson Kent	0	1610612757	Portland Trail Blazers	0	-2.7	0.245
354	1630703	f	\N	Scoot Henderson	5	1610612757	Portland Trail Blazers	0	3.2	0.086
355	203081	f	\N	Damian Lillard	68	1610612757	Portland Trail Blazers	0	0	0
356	1631104	f	\N	Blake Wesley	4	1610612757	Portland Trail Blazers	0	-8.6	0.075
357	1631126	f	\N	Caleb Love	0	1610612757	Portland Trail Blazers	0	-6.3	0.079
358	1642959	f	\N	Chris Youngblood	0	1610612757	Portland Trail Blazers	0	2.3	0.059
359	1629680	f	\N	Matisse Thybulle	29	1610612757	Portland Trail Blazers	0	9	0.093
360	201950	f	\N	Jrue Holiday	102	1610612757	Portland Trail Blazers	0	6.1	0.124
361	1630166	f	\N	Deni Avdija	5	1610612757	Portland Trail Blazers	0	0.3	0.149
362	203924	f	\N	Jerami Grant	40	1610612757	Portland Trail Blazers	0	-0.3	0.094
363	1642905	f	\N	Yang Hansen	4	1610612757	Portland Trail Blazers	0	-15.1	0.027
364	1631101	f	\N	Shaedon Sharpe	5	1610612757	Portland Trail Blazers	0	-1.3	0.108
365	1642270	f	\N	Donovan Clingan	5	1610612757	Portland Trail Blazers	0	0.1	0.139
366	1631200	f	\N	Kris Murray	5	1610612757	Portland Trail Blazers	0	1.5	0.063
367	1630249	f	\N	Vít Krejčí	4	1610612757	Portland Trail Blazers	0	-1.1	0.068
368	1641739	f	\N	Toumani Camara	5	1610612757	Portland Trail Blazers	0	1.3	0.073
369	1629057	f	\N	Robert Williams III	61	1610612757	Portland Trail Blazers	0	3.4	0.163
370	1631321	f	\N	Sidy Cissoko	4	1610612757	Portland Trail Blazers	0	-1.7	0.036
371	1628370	f	\N	Malik Monk	7	1610612758	Sacramento Kings	0	-8.3	0.094
372	1642363	f	\N	Nique Clifford	0	1610612758	Sacramento Kings	0	-4.5	0.062
373	1630165	f	\N	Killian Hayes	0	1610612758	Sacramento Kings	0	-2.8	0.071
374	203926	f	\N	Doug McDermott	25	1610612758	Sacramento Kings	0	-11.1	0.055
375	203897	f	\N	Zach LaVine	4	1610612758	Sacramento Kings	0	-12.6	0.096
376	1630173	f	\N	Precious Achiuwa	26	1610612758	Sacramento Kings	0	-7.2	0.102
377	201942	f	\N	DeMar DeRozan	63	1610612758	Sacramento Kings	0	-11.7	0.111
378	1627734	f	\N	Domantas Sabonis	20	1610612758	Sacramento Kings	0	-13.9	0.131
379	1631099	f	\N	Keegan Murray	7	1610612758	Sacramento Kings	0	-10.7	0.078
380	1629631	f	\N	De'Andre Hunter	24	1610612758	Sacramento Kings	0	-0.9	0.077
381	201566	f	\N	Russell Westbrook	135	1610612758	Sacramento Kings	0	-12.1	0.105
382	1629234	f	\N	Drew Eubanks	6	1610612758	Sacramento Kings	0	-11.4	0.082
383	1642269	f	\N	Devin Carter	0	1610612758	Sacramento Kings	0	-7.3	0.094
384	1631116	f	\N	Patrick Baldwin Jr.	3	1610612758	Sacramento Kings	0	-17.2	0.052
385	1641815	f	\N	Isaiah Stevens	0	1610612758	Sacramento Kings	0	-13	0.093
386	1631342	f	\N	Daeqwon Plowden	0	1610612758	Sacramento Kings	0	-10.9	0.057
387	1642928	f	\N	Dylan Cardwell	0	1610612758	Sacramento Kings	0	-2.5	0.089
388	1642875	f	\N	Maxime Raynaud	0	1610612758	Sacramento Kings	0	-10.9	0.109
389	1629162	f	\N	Jordan McLaughlin	23	1610612759	San Antonio Spurs	0	-11.5	0.091
390	1641705	f	\N	Victor Wembanyama	22	1610612759	San Antonio Spurs	1	17	0.209
391	1642844	f	\N	Dylan Harper	23	1610612759	San Antonio Spurs	0	9.5	0.113
392	1629640	f	\N	Keldon Johnson	23	1610612759	San Antonio Spurs	0	7.8	0.118
393	1628368	f	\N	De'Aaron Fox	28	1610612759	San Antonio Spurs	0	9.9	0.117
394	1642264	f	\N	Stephon Castle	23	1610612759	San Antonio Spurs	0	9.8	0.117
395	1628436	f	\N	Luke Kornet	66	1610612759	San Antonio Spurs	0	3.9	0.109
396	203482	f	\N	Kelly Olynyk	57	1610612759	San Antonio Spurs	0	-6.9	0.096
397	1642868	f	\N	Carter Bryant	22	1610612759	San Antonio Spurs	0	0.8	0.071
398	1641801	f	\N	Emanuel Miller	0	1610612759	San Antonio Spurs	0	-28	0.093
399	202687	f	\N	Bismack Biyombo	49	1610612759	San Antonio Spurs	0	-32.9	0.024
400	1630170	f	\N	Devin Vassell	23	1610612759	San Antonio Spurs	0	11.4	0.087
401	1642357	f	\N	David Jones Garcia	0	1610612759	San Antonio Spurs	0	23.1	0.133
402	1630577	f	\N	Julian Champagnie	23	1610612759	San Antonio Spurs	0	12.4	0.091
403	203084	f	\N	Harrison Barnes	91	1610612759	San Antonio Spurs	0	7.8	0.075
404	1630322	f	\N	Lindy Waters III	12	1610612759	San Antonio Spurs	0	-1.6	0.052
405	203486	f	\N	Mason Plumlee	77	1610612759	San Antonio Spurs	0	-2.2	0.084
406	1631127	f	\N	Harrison Ingram	0	1610612759	San Antonio Spurs	0	-12.6	0.086
407	1628983	f	\N	Shai Gilgeous-Alexander	61	1610612760	Oklahoma City Thunder	2	16.3	0.207
408	1642272	f	\N	Jared McCain	15	1610612760	Oklahoma City Thunder	0	4.6	0.079
409	1629652	f	\N	Luguentz Dort	54	1610612760	Oklahoma City Thunder	0	8	0.049
410	1631119	f	\N	Jaylin Williams	42	1610612760	Oklahoma City Thunder	0	11.5	0.115
411	1631096	f	\N	Chet Holmgren	48	1610612760	Oklahoma City Thunder	1	16.1	0.154
412	1631114	f	\N	Jalen Williams	38	1610612760	Oklahoma City Thunder	1	11.7	0.135
413	1627936	f	\N	Alex Caruso	69	1610612760	Oklahoma City Thunder	0	17.6	0.093
414	1630198	f	\N	Isaiah Joe	55	1610612760	Oklahoma City Thunder	0	11.7	0.099
415	1642850	f	\N	Thomas Sorber	0	1610612760	Oklahoma City Thunder	0	0	0
416	1642362	f	\N	Payton Sandfort	0	1610612760	Oklahoma City Thunder	0	-14	0.066
417	1642382	f	\N	Branden Carlson	0	1610612760	Oklahoma City Thunder	0	-2	0.109
418	1630598	f	\N	Aaron Wiggins	45	1610612760	Oklahoma City Thunder	0	6.2	0.082
419	1641717	f	\N	Cason Wallace	48	1610612760	Oklahoma City Thunder	0	12.4	0.076
420	1642964	f	\N	Brooks Barnhizer	0	1610612760	Oklahoma City Thunder	0	-14.5	0.062
421	1642349	f	\N	Ajay Mitchell	23	1610612760	Oklahoma City Thunder	0	15.6	0.116
422	1629026	f	\N	Kenrich Williams	34	1610612760	Oklahoma City Thunder	0	3.1	0.098
423	1642260	f	\N	Nikola Topić	9	1610612760	Oklahoma City Thunder	0	-13.7	0.063
424	1628392	f	\N	Isaiah Hartenstein	64	1610612760	Oklahoma City Thunder	0	15.6	0.143
425	1630639	f	\N	A.J. Lawson	17	1610612761	Toronto Raptors	0	-3.1	0.091
426	1641711	f	\N	Gradey Dick	3	1610612761	Toronto Raptors	0	4.1	0.07
427	1642367	f	\N	Jonathan Mogbo	3	1610612761	Toronto Raptors	0	-10.2	0.101
428	1627742	f	\N	Brandon Ingram	15	1610612761	Toronto Raptors	0	1	0.121
429	1630567	f	\N	Scottie Barnes	11	1610612761	Toronto Raptors	0	4.6	0.139
430	1630193	f	\N	Immanuel Quickley	13	1610612761	Toronto Raptors	0	2.9	0.118
431	1629628	f	\N	RJ Barrett	23	1610612761	Toronto Raptors	0	4.9	0.112
432	1642867	f	\N	Collin Murray-Boyles	7	1610612761	Toronto Raptors	0	2.6	0.098
433	1642266	f	\N	Ja'Kobe Walter	7	1610612761	Toronto Raptors	0	0.9	0.069
434	202066	f	\N	Garrett Temple	33	1610612761	Toronto Raptors	0	-1.8	0.051
435	1627751	f	\N	Jakob Poeltl	29	1610612761	Toronto Raptors	0	2	0.115
436	1642347	f	\N	Jamal Shead	7	1610612761	Toronto Raptors	0	5.8	0.078
437	1642935	f	\N	Chucky Hepburn	0	1610612761	Toronto Raptors	0	-47.6	-0.1
438	1631218	f	\N	Trayce Jackson-Davis	12	1610612761	Toronto Raptors	0	-7.6	0.1
439	1630572	f	\N	Sandro Mamukelashvili	7	1610612761	Toronto Raptors	0	5.3	0.123
440	1642918	f	\N	Alijah Martin	0	1610612761	Toronto Raptors	0	-5.8	0.062
441	1642419	f	\N	Jamison Battle	6	1610612761	Toronto Raptors	0	6.7	0.079
442	1643060	f	\N	Hayden Gray	0	1610612762	Utah Jazz	0	-29	0.05
443	1642396	f	\N	Blake Hinson	0	1610612762	Utah Jazz	0	6.7	0.101
444	1641718	f	\N	Keyonte George	0	1610612762	Utah Jazz	0	-8.6	0.122
445	1642262	f	\N	Cody Williams	0	1610612762	Utah Jazz	0	-10.6	0.057
446	1642268	f	\N	Isaiah Collier	0	1610612762	Utah Jazz	0	-13.2	0.102
447	1629004	f	\N	Svi Mykhailiuk	11	1610612762	Utah Jazz	0	-3	0.074
448	1641989	f	\N	Elijah Harkless	0	1610612762	Utah Jazz	0	-2.5	0.055
449	1642846	f	\N	Ace Bailey	0	1610612762	Utah Jazz	0	-10.7	0.069
450	1628991	f	\N	Jaren Jackson Jr.	27	1610612762	Utah Jazz	0	-2	0.107
451	1643016	f	\N	Bez Mbeng	0	1610612762	Utah Jazz	0	-13.2	0.06
452	1642271	f	\N	Kyle Filipowski	0	1610612762	Utah Jazz	0	-6.6	0.106
453	1628374	f	\N	Lauri Markkanen	0	1610612762	Utah Jazz	0	-1.5	0.139
454	1631117	f	\N	Walker Kessler	0	1610612762	Utah Jazz	0	4.8	0.138
455	1641729	f	\N	Brice Sensabaugh	0	1610612762	Utah Jazz	0	-9.4	0.09
456	203994	f	\N	Jusuf Nurkić	20	1610612762	Utah Jazz	0	-7.9	0.121
457	1631131	f	\N	Oscar Tshiebwe	0	1610612762	Utah Jazz	0	-8	0.125
458	201567	f	\N	Kevin Love	88	1610612762	Utah Jazz	0	-6.7	0.103
459	1629723	f	\N	John Konchar	18	1610612762	Utah Jazz	0	-5.9	0.09
460	1642942	f	\N	Jahmai Mashack	0	1610612763	Memphis Grizzlies	0	-14.5	0.041
461	1642377	f	\N	Jaylen Wells	0	1610612763	Memphis Grizzlies	0	-4.4	0.069
462	1630590	f	\N	Scotty Pippen Jr.	4	1610612763	Memphis Grizzlies	0	-11.5	0.086
463	1629660	f	\N	Ty Jerome	9	1610612763	Memphis Grizzlies	0	-5	0.162
464	203484	f	\N	Kentavious Caldwell-Pope	67	1610612763	Memphis Grizzlies	0	-4.5	0.083
465	1642383	f	\N	Walter Clayton Jr.	0	1610612763	Memphis Grizzlies	0	-9.6	0.073
466	1630583	f	\N	Santi Aldama	10	1610612763	Memphis Grizzlies	0	-2.4	0.115
467	1642914	f	\N	Javon Small	0	1610612763	Memphis Grizzlies	0	-5.7	0.109
468	1629630	f	\N	Ja Morant	22	1610612763	Memphis Grizzlies	0	-4.4	0.128
469	1641744	f	\N	Zach Edey	4	1610612763	Memphis Grizzlies	0	18.3	0.157
470	1629634	f	\N	Brandon Clarke	14	1610612763	Memphis Grizzlies	0	-22.2	0.023
471	1641765	f	\N	Olivier-Maxence Prosper	3	1610612763	Memphis Grizzlies	0	-9.7	0.103
472	1641712	f	\N	Rayan Rupert	0	1610612763	Memphis Grizzlies	0	-13.6	0.055
473	1641707	f	\N	Taylor Hendricks	0	1610612763	Memphis Grizzlies	0	-10.7	0.077
474	1642907	f	\N	Cedric Coward	0	1610612763	Memphis Grizzlies	0	0.3	0.11
475	1642285	f	\N	Cam Spencer	0	1610612763	Memphis Grizzlies	0	-3.6	0.12
476	1641713	f	\N	GG Jackson	0	1610612763	Memphis Grizzlies	0	-3.5	0.108
477	201959	f	\N	Taj Gibson	71	1610612763	Memphis Grizzlies	0	-4.7	0.081
478	1642882	f	\N	Julian Reese	0	1610612764	Washington Wizards	0	-11.8	0.092
479	1641731	f	\N	Bilal Coulibaly	0	1610612764	Washington Wizards	0	-12.8	0.082
480	1641774	f	\N	Tristan Vukcevic	0	1610612764	Washington Wizards	0	-15.1	0.11
481	1641715	f	\N	Cam Whitmore	3	1610612764	Washington Wizards	0	-19.6	0.082
482	1629027	f	\N	Trae Young	27	1610612764	Washington Wizards	0	-8.1	0.128
483	1626156	f	\N	D'Angelo Russell	32	1610612764	Washington Wizards	0	-3.4	0.098
484	1642364	f	\N	Jamir Watkins	0	1610612764	Washington Wizards	0	-6.4	0.069
485	1642267	f	\N	Bub Carrington	0	1610612764	Washington Wizards	0	-15.3	0.072
486	1630702	f	\N	Jaden Hardy	19	1610612764	Washington Wizards	0	-4.4	0.066
487	1630551	f	\N	Justin Champagnie	4	1610612764	Washington Wizards	0	-9.4	0.106
488	1642848	f	\N	Tre Johnson	0	1610612764	Washington Wizards	0	-11.2	0.068
489	1641778	f	\N	Leaky Black	0	1610612764	Washington Wizards	0	-9.9	0.051
490	1630536	f	\N	Sharife Cooper	0	1610612764	Washington Wizards	0	-11.7	0.094
491	1630264	f	\N	Anthony Gill	4	1610612764	Washington Wizards	0	-14.4	0.08
492	1642273	f	\N	Kyshawn George	0	1610612764	Washington Wizards	0	-11.5	0.09
493	1642259	f	\N	Alex Sarr	0	1610612764	Washington Wizards	0	-12.4	0.121
494	203076	f	\N	Anthony Davis	60	1610612764	Washington Wizards	0	-4.6	0.151
495	1642860	f	\N	Will Riley	0	1610612764	Washington Wizards	0	-14.1	0.08
496	1631105	f	\N	Jalen Duren	20	1610612765	Detroit Pistons	1	11.8	0.177
497	1630595	f	\N	Cade Cunningham	20	1610612765	Detroit Pistons	2	11.4	0.159
498	1642403	f	\N	Isaac Jones	0	1610612765	Detroit Pistons	0	-37.9	0.036
499	1641842	f	\N	Ronald Holland II	14	1610612765	Detroit Pistons	0	5.7	0.085
500	1630194	f	\N	Paul Reed	46	1610612765	Detroit Pistons	0	8.1	0.153
501	1627747	f	\N	Caris LeVert	38	1610612765	Detroit Pistons	0	0.8	0.081
502	1641709	f	\N	Ausar Thompson	20	1610612765	Detroit Pistons	0	11.6	0.101
503	202699	f	\N	Tobias Harris	81	1610612765	Detroit Pistons	0	10	0.112
504	1631111	f	\N	Wendell Moore Jr.	7	1610612765	Detroit Pistons	0	34.6	0.063
505	1642404	f	\N	Chaz Lanier	3	1610612765	Detroit Pistons	0	2	0.045
506	1642450	f	\N	Daniss Jenkins	14	1610612765	Detroit Pistons	0	6.6	0.1
507	1631204	f	\N	Marcus Sasser	6	1610612765	Detroit Pistons	0	13.4	0.078
508	1628989	f	\N	Kevin Huerter	35	1610612765	Detroit Pistons	0	2.3	0.093
509	1630191	f	\N	Isaiah Stewart	15	1610612765	Detroit Pistons	0	1.8	0.095
510	1629750	f	\N	Javonte Green	23	1610612765	Detroit Pistons	0	7.6	0.095
511	1642449	f	\N	Tolu Smith	3	1610612765	Detroit Pistons	0	2.3	0.117
512	1629130	f	\N	Duncan Robinson	83	1610612765	Detroit Pistons	0	11.3	0.078
513	1628970	f	\N	Miles Bridges	0	1610612766	Charlotte Hornets	0	3.5	0.114
514	1630163	f	\N	LaMelo Ball	0	1610612766	Charlotte Hornets	0	9.1	0.134
515	1629684	f	\N	Grant Williams	61	1610612766	Charlotte Hornets	0	12.9	0.089
516	1629632	f	\N	Coby White	5	1610612766	Charlotte Hornets	0	3.2	0.112
517	1642883	f	\N	Sion James	0	1610612766	Charlotte Hornets	0	3.3	0.062
518	1642851	f	\N	Kon Knueppel	0	1610612766	Charlotte Hornets	0	6.2	0.115
519	1630182	f	\N	Josh Green	39	1610612766	Charlotte Hornets	0	12.5	0.059
520	1641750	f	\N	Ryan Kalkbrenner	0	1610612766	Charlotte Hornets	0	1.1	0.108
521	1641810	f	\N	Antonio Reeves	0	1610612766	Charlotte Hornets	0	19.7	0.099
522	1631217	f	\N	Moussa Diabaté	0	1610612766	Charlotte Hornets	0	10.5	0.108
523	1641790	f	\N	PJ Hall	0	1610612766	Charlotte Hornets	0	-5.4	0.098
524	1641787	f	\N	Tosan Evbuomwan	0	1610612766	Charlotte Hornets	0	-50	-0.043
525	1626192	f	\N	Pat Connaughton	86	1610612766	Charlotte Hornets	0	-4.3	0.117
526	1630544	f	\N	Tre Mann	0	1610612766	Charlotte Hornets	0	-10.1	0.062
527	1641706	f	\N	Brandon Miller	0	1610612766	Charlotte Hornets	0	8.5	0.113
528	1630214	f	\N	Xavier Tillman	27	1610612766	Charlotte Hornets	0	-4.9	0.069
529	1642275	f	\N	Tidjane Salaün	0	1610612766	Charlotte Hornets	0	2.1	0.102
530	1642862	f	\N	Liam McNeeley	0	1610612766	Charlotte Hornets	0	1.6	0.079
\.


--
-- Data for Name: team_stats; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.team_stats (id, efg_pct, losses, net_rating, season, team_id, team_name, win_pct, wins) FROM stdin;
1	0.554	36	2.2	2025-26	1610612737	Atlanta Hawks	0.561	46
2	0.553	26	8.3	2025-26	1610612738	Boston Celtics	0.683	56
3	0.52	62	-10	2025-26	1610612751	Brooklyn Nets	0.244	20
4	0.552	38	4.9	2025-26	1610612766	Charlotte Hornets	0.537	44
5	0.547	51	-5.3	2025-26	1610612741	Chicago Bulls	0.378	31
6	0.561	30	4.1	2025-26	1610612739	Cleveland Cavaliers	0.634	52
7	0.527	56	-5.2	2025-26	1610612742	Dallas Mavericks	0.317	26
8	0.577	28	5.2	2025-26	1610612743	Denver Nuggets	0.659	54
9	0.546	22	8.4	2025-26	1610612765	Detroit Pistons	0.732	60
10	0.549	45	-0.5	2025-26	1610612744	Golden State Warriors	0.451	37
11	0.542	30	5.4	2025-26	1610612745	Houston Rockets	0.634	52
12	0.533	63	-7.8	2025-26	1610612754	Indiana Pacers	0.232	19
13	0.559	40	1.1	2025-26	1610612746	LA Clippers	0.512	42
14	0.573	29	1.5	2025-26	1610612747	Los Angeles Lakers	0.646	53
15	0.533	57	-6	2025-26	1610612763	Memphis Grizzlies	0.305	25
16	0.542	39	2.1	2025-26	1610612748	Miami Heat	0.524	43
17	0.565	50	-6.1	2025-26	1610612749	Milwaukee Bucks	0.39	32
18	0.559	33	3.1	2025-26	1610612750	Minnesota Timberwolves	0.598	49
19	0.527	56	-4.4	2025-26	1610612740	New Orleans Pelicans	0.317	26
20	0.557	29	6.4	2025-26	1610612752	New York Knicks	0.646	53
21	0.561	18	11.1	2025-26	1610612760	Oklahoma City Thunder	0.78	64
22	0.531	37	0.6	2025-26	1610612753	Orlando Magic	0.549	45
23	0.53	37	-0.1	2025-26	1610612755	Philadelphia 76ers	0.549	45
24	0.537	37	1.4	2025-26	1610612756	Phoenix Suns	0.549	45
25	0.534	40	-0.4	2025-26	1610612757	Portland Trail Blazers	0.512	42
26	0.525	60	-9.7	2025-26	1610612758	Sacramento Kings	0.268	22
27	0.559	20	8.4	2025-26	1610612759	San Antonio Spurs	0.756	62
28	0.546	36	2.9	2025-26	1610612761	Toronto Raptors	0.561	46
29	0.536	60	-8.2	2025-26	1610612762	Utah Jazz	0.268	22
30	0.535	65	-11.8	2025-26	1610612764	Washington Wizards	0.207	17
31	0.546	42	-1.1	2024-25	1610612737	Atlanta Hawks	0.488	40
32	0.561	21	9.4	2024-25	1610612738	Boston Celtics	0.744	61
33	0.516	56	-7.3	2024-25	1610612751	Brooklyn Nets	0.317	26
34	0.503	63	-9.1	2024-25	1610612766	Charlotte Hornets	0.232	19
35	0.553	43	-1.6	2024-25	1610612741	Chicago Bulls	0.476	39
36	0.578	18	9.2	2024-25	1610612739	Cleveland Cavaliers	0.78	64
37	0.549	43	-1.3	2024-25	1610612742	Dallas Mavericks	0.476	39
38	0.573	32	3.8	2024-25	1610612743	Denver Nuggets	0.61	50
39	0.547	38	2.1	2024-25	1610612765	Detroit Pistons	0.537	44
40	0.536	34	3.2	2024-25	1610612744	Golden State Warriors	0.585	48
41	0.523	30	4.6	2024-25	1610612745	Houston Rockets	0.634	52
42	0.562	32	2.1	2024-25	1610612754	Indiana Pacers	0.61	50
43	0.554	32	4.9	2024-25	1610612746	LA Clippers	0.61	50
44	0.557	32	1.2	2024-25	1610612747	Los Angeles Lakers	0.61	50
45	0.554	34	4.7	2024-25	1610612763	Memphis Grizzlies	0.585	48
46	0.544	45	0.4	2024-25	1610612748	Miami Heat	0.451	37
47	0.568	34	2.4	2024-25	1610612749	Milwaukee Bucks	0.585	48
48	0.554	33	5	2024-25	1610612750	Minnesota Timberwolves	0.598	49
49	0.519	61	-9.4	2024-25	1610612740	New Orleans Pelicans	0.256	21
50	0.556	31	4	2024-25	1610612752	New York Knicks	0.622	51
51	0.56	14	12.7	2024-25	1610612760	Oklahoma City Thunder	0.829	68
52	0.51	41	-0.2	2024-25	1610612753	Orlando Magic	0.5	41
53	0.527	58	-6.3	2024-25	1610612755	Philadelphia 76ers	0.293	24
54	0.561	46	-3	2024-25	1610612756	Phoenix Suns	0.439	36
55	0.521	46	-2.7	2024-25	1610612757	Portland Trail Blazers	0.439	36
56	0.548	42	0.6	2024-25	1610612758	Sacramento Kings	0.488	40
57	0.544	48	-2.8	2024-25	1610612759	San Antonio Spurs	0.415	34
58	0.522	52	-4.1	2024-25	1610612761	Toronto Raptors	0.366	30
59	0.533	65	-9.2	2024-25	1610612762	Utah Jazz	0.207	17
60	0.512	64	-12.2	2024-25	1610612764	Washington Wizards	0.22	18
61	0.539	46	-2	2023-24	1610612737	Atlanta Hawks	0.439	36
62	0.578	18	11.7	2023-24	1610612738	Boston Celtics	0.78	64
63	0.531	50	-2.9	2023-24	1610612751	Brooklyn Nets	0.39	32
64	0.529	61	-10.6	2023-24	1610612766	Charlotte Hornets	0.256	21
65	0.534	43	-1.7	2023-24	1610612741	Chicago Bulls	0.476	39
66	0.557	34	2.5	2023-24	1610612739	Cleveland Cavaliers	0.585	48
67	0.562	32	2.1	2023-24	1610612742	Dallas Mavericks	0.61	50
68	0.562	25	5.5	2023-24	1610612743	Denver Nuggets	0.695	57
69	0.526	68	-9	2023-24	1610612765	Detroit Pistons	0.171	14
70	0.557	36	2.4	2023-24	1610612744	Golden State Warriors	0.561	46
71	0.529	41	0.9	2023-24	1610612745	Houston Rockets	0.5	41
72	0.578	35	2.9	2023-24	1610612754	Indiana Pacers	0.573	47
73	0.561	31	3.4	2023-24	1610612746	LA Clippers	0.622	51
74	0.566	35	0.6	2023-24	1610612747	Los Angeles Lakers	0.573	47
75	0.509	55	-6.9	2023-24	1610612763	Memphis Grizzlies	0.329	27
76	0.538	36	1.8	2023-24	1610612748	Miami Heat	0.561	46
77	0.568	33	2.6	2023-24	1610612749	Milwaukee Bucks	0.598	49
78	0.559	26	6.3	2023-24	1610612750	Minnesota Timberwolves	0.683	56
79	0.558	33	4.6	2023-24	1610612740	New Orleans Pelicans	0.598	49
80	0.54	32	4.9	2023-24	1610612752	New York Knicks	0.61	50
81	0.573	25	7.3	2023-24	1610612760	Oklahoma City Thunder	0.695	57
82	0.541	35	2.2	2023-24	1610612753	Orlando Magic	0.573	47
83	0.532	35	3.1	2023-24	1610612755	Philadelphia 76ers	0.573	47
84	0.565	33	3.1	2023-24	1610612756	Phoenix Suns	0.598	49
85	0.503	61	-9	2023-24	1610612757	Portland Trail Blazers	0.256	21
86	0.556	36	1.8	2023-24	1610612758	Sacramento Kings	0.561	46
87	0.532	60	-6.4	2023-24	1610612759	San Antonio Spurs	0.268	22
88	0.535	57	-6.3	2023-24	1610612761	Toronto Raptors	0.305	25
89	0.539	51	-5.1	2023-24	1610612762	Utah Jazz	0.378	31
90	0.538	67	-8.7	2023-24	1610612764	Washington Wizards	0.183	15
\.


--
-- Name: player player_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player
    ADD CONSTRAINT player_pkey PRIMARY KEY (id);


--
-- Name: team_stats team_stats_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team_stats
    ADD CONSTRAINT team_stats_pkey PRIMARY KEY (id);


--
-- Name: player ukatib1l10rajb1dq5eri98un02; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player
    ADD CONSTRAINT ukatib1l10rajb1dq5eri98un02 UNIQUE (api_player_id);


--
-- PostgreSQL database dump complete
--

\unrestrict AX7Z3JKEId5awPJdlMMt2b2iiO5Lwt09Vjw2OR8Y86XDwgO2dVlSK12c9WfAi3w

