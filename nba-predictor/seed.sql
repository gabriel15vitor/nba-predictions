--
-- PostgreSQL database dump
--

\restrict 3WgLvRNYG9a0J2vbX2DCeWDAcqeZ9r23Albieda6YmecdgPKGvz7ufMLVCGnq7e

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
    team_name character varying(255)
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

COPY public.player (id, api_player_id, is_injured, mvp_shares, name, playoff_games, team_id, team_name) FROM stdin;
1	1642933	f	0	Keshon Gilbert	0	1610612737	Atlanta Hawks
2	1642484	f	0	RayJ Dennis	0	1610612737	Atlanta Hawks
3	1630228	f	0	Jonathan Kuminga	40	1610612737	Atlanta Hawks
4	1630552	f	1	Jalen Johnson	14	1610612737	Atlanta Hawks
5	1630811	f	0	Keaton Wallace	3	1610612737	Atlanta Hawks
6	203468	f	0	CJ McCollum	73	1610612737	Atlanta Hawks
7	1629216	f	0	Gabe Vincent	60	1610612737	Atlanta Hawks
8	1630700	f	0	Dyson Daniels	9	1610612737	Atlanta Hawks
9	1629638	f	0	Nickeil Alexander-Walker	43	1610612737	Atlanta Hawks
10	1627741	f	0	Buddy Hield	18	1610612737	Atlanta Hawks
11	1642258	f	0	Zaccharie Risacher	3	1610612737	Atlanta Hawks
12	1631132	f	0	Christian Koloko	0	1610612737	Atlanta Hawks
13	1628396	f	0	Tony Bradley	24	1610612737	Atlanta Hawks
14	1642854	f	0	Asa Newell	2	1610612737	Atlanta Hawks
15	1630168	f	0	Onyeka Okongwu	35	1610612737	Atlanta Hawks
16	1631243	f	0	Mouhamed Gueye	6	1610612737	Atlanta Hawks
17	1630557	f	0	Corey Kispert	5	1610612737	Atlanta Hawks
18	1629111	f	0	Jock Landale	8	1610612737	Atlanta Hawks
19	1628369	f	5	Jayson Tatum	127	1610612738	Boston Celtics
20	202696	f	0	Nikola Vučević	22	1610612738	Boston Celtics
21	1627759	f	2	Jaylen Brown	142	1610612738	Boston Celtics
22	1642910	f	0	John Tonje	0	1610612738	Boston Celtics
23	1628401	f	0	Derrick White	90	1610612738	Boston Celtics
24	1630202	f	0	Payton Pritchard	76	1610612738	Boston Celtics
25	1631199	f	0	Ron Harper Jr.	6	1610612738	Boston Celtics
26	1641775	f	0	Jordan Walsh	15	1610612738	Boston Celtics
27	1642864	f	0	Hugo González	4	1610612738	Boston Celtics
28	1630573	f	0	Sam Hauser	56	1610612738	Boston Celtics
29	1642917	f	0	Max Shulga	2	1610612738	Boston Celtics
30	1630625	f	0	Dalano Banton	6	1610612738	Boston Celtics
31	1630568	f	0	Luka Garza	19	1610612738	Boston Celtics
32	1631248	f	0	Baylor Scheierman	11	1610612738	Boston Celtics
33	1642873	f	0	Amari Williams	1	1610612738	Boston Celtics
34	1629674	f	0	Neemias Queta	14	1610612738	Boston Celtics
35	201935	f	8	James Harden	191	1610612739	Cleveland Cavaliers
36	1629622	f	0	Max Strus	82	1610612739	Cleveland Cavaliers
37	1628418	f	0	Thomas Bryant	32	1610612739	Cleveland Cavaliers
38	1630596	f	1	Evan Mobley	43	1610612739	Cleveland Cavaliers
39	1630241	f	0	Sam Merrill	43	1610612739	Cleveland Cavaliers
40	203471	f	0	Dennis Schröder	91	1610612739	Cleveland Cavaliers
41	1641854	f	0	Craig Porter Jr.	13	1610612739	Cleveland Cavaliers
42	1642434	f	0	Riley Minix	0	1610612739	Cleveland Cavaliers
43	1631165	f	0	Keon Ellis	12	1610612739	Cleveland Cavaliers
44	1642281	f	0	Jaylon Tyson	21	1610612739	Cleveland Cavaliers
45	1642400	f	0	Tristan Enaruna	0	1610612739	Cleveland Cavaliers
46	1626204	f	0	Larry Nance Jr.	32	1610612739	Cleveland Cavaliers
47	1642878	f	0	Tyrese Proctor	4	1610612739	Cleveland Cavaliers
48	1628386	f	0	Jarrett Allen	45	1610612739	Cleveland Cavaliers
49	1629731	f	0	Dean Wade	32	1610612739	Cleveland Cavaliers
50	1630846	f	0	Olivier Sarr	0	1610612739	Cleveland Cavaliers
51	1641772	f	0	Nae'Qwan Tomlin	7	1610612739	Cleveland Cavaliers
52	1628378	f	3	Donovan Mitchell	81	1610612739	Cleveland Cavaliers
53	1642490	f	0	Josh Oduro	0	1610612740	New Orleans Pelicans
54	1642847	f	0	Jeremiah Fears	0	1610612740	New Orleans Pelicans
55	1629627	f	0	Zion Williamson	0	1610612740	New Orleans Pelicans
56	1630529	f	0	Herbert Jones	10	1610612740	New Orleans Pelicans
57	1629673	f	0	Jordan Poole	35	1610612740	New Orleans Pelicans
58	1630621	f	0	Hunter Dickinson	0	1610612740	New Orleans Pelicans
59	1627749	f	0	Dejounte Murray	21	1610612740	New Orleans Pelicans
60	201599	f	3	DeAndre Jordan	73	1610612740	New Orleans Pelicans
61	1631121	f	0	Bryce McGowens	0	1610612740	New Orleans Pelicans
62	1642877	f	0	Micah Peavy	0	1610612740	New Orleans Pelicans
63	1631255	f	0	Karlo Matković	0	1610612740	New Orleans Pelicans
64	1642274	f	0	Yves Missi	0	1610612740	New Orleans Pelicans
65	1642852	f	0	Derik Queen	0	1610612740	New Orleans Pelicans
66	1641725	f	0	Trey Alexander	0	1610612740	New Orleans Pelicans
67	1641722	f	0	Jordan Hawkins	3	1610612740	New Orleans Pelicans
68	1630530	f	0	Trey Murphy III	10	1610612740	New Orleans Pelicans
69	1630180	f	0	Saddiq Bey	6	1610612740	New Orleans Pelicans
70	1626172	f	0	Kevon Looney	89	1610612740	New Orleans Pelicans
71	1629012	f	0	Collin Sexton	0	1610612741	Chicago Bulls
72	1630581	f	0	Josh Giddey	10	1610612741	Chicago Bulls
73	1630644	f	0	Mac McClung	0	1610612741	Chicago Bulls
74	1642265	f	0	Rob Dillingham	3	1610612741	Chicago Bulls
75	1642530	f	0	Yuki Kawamura	0	1610612741	Chicago Bulls
76	1631159	f	0	Leonard Miller	6	1610612741	Chicago Bulls
77	1628380	f	0	Zach Collins	20	1610612741	Chicago Bulls
78	1630208	f	0	Nick Richards	0	1610612741	Chicago Bulls
79	1641824	f	0	Matas Buzelis	0	1610612741	Chicago Bulls
80	1631338	f	0	Mouhamadou Gueye	0	1610612741	Chicago Bulls
81	1629014	f	0	Anfernee Simons	15	1610612741	Chicago Bulls
82	1642855	f	0	Noa Essengue	0	1610612741	Chicago Bulls
83	1630188	f	0	Jalen Smith	13	1610612741	Chicago Bulls
84	1627824	f	0	Guerschon Yabusele	16	1610612741	Chicago Bulls
85	1630200	f	0	Tre Jones	0	1610612741	Chicago Bulls
86	1630171	f	0	Isaac Okoro	26	1610612741	Chicago Bulls
87	1630172	f	0	Patrick Williams	5	1610612741	Chicago Bulls
88	1642950	f	0	Lachlan Olbrich	0	1610612741	Chicago Bulls
89	1642967	f	0	John Poulakidas	0	1610612742	Dallas Mavericks
90	1631108	f	0	Max Christie	9	1610612742	Dallas Mavericks
91	1641726	f	0	Dereck Lively II	21	1610612742	Dallas Mavericks
92	203939	f	0	Dwight Powell	44	1610612742	Dallas Mavericks
93	1642358	f	0	AJ Johnson	0	1610612742	Dallas Mavericks
94	1642948	f	0	Ryan Nembhard	0	1610612742	Dallas Mavericks
95	1630314	f	0	Brandon Williams	0	1610612742	Dallas Mavericks
96	202681	f	3	Kyrie Irving	96	1610612742	Dallas Mavericks
97	1630230	f	0	Naji Marshall	10	1610612742	Dallas Mavericks
98	1628997	f	0	Caleb Martin	45	1610612742	Dallas Mavericks
99	203114	f	0	Khris Middleton	80	1610612742	Dallas Mavericks
100	1629655	f	0	Daniel Gafford	27	1610612742	Dallas Mavericks
101	1641890	f	0	Tyler Smith	0	1610612742	Dallas Mavericks
102	1629023	f	0	P.J. Washington	22	1610612742	Dallas Mavericks
103	1630619	f	0	Moussa Cisse	0	1610612742	Dallas Mavericks
104	202691	f	2	Klay Thompson	158	1610612742	Dallas Mavericks
105	1642843	f	0	Cooper Flagg	0	1610612742	Dallas Mavericks
106	1628963	f	0	Marvin Bagley III	2	1610612742	Dallas Mavericks
107	1631128	f	0	Christian Braun	51	1610612743	Denver Nuggets
108	1642938	f	0	Curtis Jones	0	1610612743	Denver Nuggets
109	1631124	f	0	Julian Strawther	14	1610612743	Denver Nuggets
110	1626145	f	0	Tyus Jones	30	1610612743	Denver Nuggets
111	1631212	f	0	Peyton Watson	29	1610612743	Denver Nuggets
112	203501	f	0	Tim Hardaway Jr.	54	1610612743	Denver Nuggets
113	1628971	f	0	Bruce Brown	46	1610612743	Denver Nuggets
114	1641747	f	0	DaRon Holmes II	2	1610612743	Denver Nuggets
115	203999	f	8	Nikola Jokić	100	1610612743	Denver Nuggets
116	202685	f	0	Jonas Valančiūnas	62	1610612743	Denver Nuggets
117	1642461	f	0	Spencer Jones	6	1610612743	Denver Nuggets
118	1630192	f	0	Zeke Nnaji	23	1610612743	Denver Nuggets
119	1629661	f	0	Cameron Johnson	44	1610612743	Denver Nuggets
120	1629618	f	0	Jalen Pickett	13	1610612743	Denver Nuggets
121	1642354	f	0	KJ Simpson	0	1610612743	Denver Nuggets
122	1627750	f	1	Jamal Murray	85	1610612743	Denver Nuggets
123	203932	f	0	Aaron Gordon	69	1610612743	Denver Nuggets
124	1631223	f	0	David Roddy	8	1610612743	Denver Nuggets
125	1627780	f	0	Gary Payton II	35	1610612744	Golden State Warriors
126	1641764	f	0	Brandin Podziemski	12	1610612744	Golden State Warriors
127	1642954	f	0	Will Richard	0	1610612744	Golden State Warriors
128	1630541	f	0	Moses Moody	37	1610612744	Golden State Warriors
129	204001	f	0	Kristaps Porziņģis	28	1610612744	Golden State Warriors
130	1629001	f	0	De'Anthony Melton	27	1610612744	Golden State Warriors
131	202710	f	5	Jimmy Butler III	130	1610612744	Golden State Warriors
132	1630611	f	0	Gui Santos	10	1610612744	Golden State Warriors
133	1643018	f	0	LJ Cryer	0	1610612744	Golden State Warriors
134	1631466	f	0	Nate Williams	3	1610612744	Golden State Warriors
135	201143	f	1	Al Horford	197	1610612744	Golden State Warriors
136	1642366	f	0	Quinten Post	12	1610612744	Golden State Warriors
137	203110	f	2	Draymond Green	169	1610612744	Golden State Warriors
138	1629646	f	0	Charles Bassey	3	1610612744	Golden State Warriors
139	201939	f	11	Stephen Curry	155	1610612744	Golden State Warriors
140	203552	f	0	Seth Curry	41	1610612744	Golden State Warriors
141	1642502	f	0	Malevy Leons	0	1610612744	Golden State Warriors
142	1630311	f	0	Pat Spencer	8	1610612744	Golden State Warriors
143	1628988	f	0	Aaron Holiday	23	1610612745	Houston Rockets
144	1641708	f	0	Amen Thompson	13	1610612745	Houston Rockets
145	1627827	f	0	Dorian Finney-Smith	44	1610612745	Houston Rockets
146	1631120	f	0	JD Davison	6	1610612745	Houston Rockets
147	1627832	f	0	Fred VanVleet	59	1610612745	Houston Rockets
148	201142	f	12	Kevin Durant	171	1610612745	Houston Rockets
149	1630256	f	0	Jae'Sean Tate	5	1610612745	Houston Rockets
150	1631095	f	0	Jabari Smith Jr.	13	1610612745	Houston Rockets
151	203500	f	0	Steven Adams	73	1610612745	Houston Rockets
152	1641803	f	0	Tristen Newton	0	1610612745	Houston Rockets
153	1642263	f	0	Reed Sheppard	9	1610612745	Houston Rockets
154	1631106	f	0	Tari Eason	13	1610612745	Houston Rockets
155	1629006	f	0	Josh Okogie	21	1610612745	Houston Rockets
156	1642384	f	0	Isaiah Crawford	0	1610612745	Houston Rockets
157	1630578	f	0	Alperen Sengun	13	1610612745	Houston Rockets
158	203991	f	0	Clint Capela	91	1610612745	Houston Rockets
159	201145	f	0	Jeff Green	108	1610612745	Houston Rockets
160	1641807	f	0	Norchad Omier	0	1610612746	LA Clippers
161	1642951	f	0	Sean Pedulla	0	1610612746	LA Clippers
162	203078	f	1	Bradley Beal	49	1610612746	LA Clippers
163	202695	f	7	Kawhi Leonard	146	1610612746	LA Clippers
164	1642920	f	0	Kobe Sanders	0	1610612746	LA Clippers
165	1627884	f	0	Derrick Jones Jr.	51	1610612746	LA Clippers
166	203992	f	0	Bogdan Bogdanović	35	1610612746	LA Clippers
167	1627739	f	0	Kris Dunn	12	1610612746	LA Clippers
168	1631097	f	0	Bennedict Mathurin	22	1610612746	LA Clippers
169	1629636	f	0	Darius Garland	22	1610612746	LA Clippers
170	201572	f	0	Brook Lopez	89	1610612746	LA Clippers
171	1642353	f	0	Cam Christie	3	1610612746	LA Clippers
172	1631102	f	0	TyTy Washington Jr.	0	1610612746	LA Clippers
173	1642949	f	0	Yanic Konan Niederhäuser	0	1610612746	LA Clippers
174	1628381	f	0	John Collins	29	1610612746	LA Clippers
175	1641757	f	0	Jordan Miller	3	1610612746	LA Clippers
176	1630543	f	0	Isaiah Jackson	15	1610612746	LA Clippers
177	201587	f	0	Nicolas Batum	76	1610612746	LA Clippers
178	1642876	f	0	Adou Thiero	6	1610612747	Los Angeles Lakers
179	1629020	f	0	Jarred Vanderbilt	36	1610612747	Los Angeles Lakers
180	1642261	f	0	Dalton Knecht	7	1610612747	Los Angeles Lakers
181	1629028	f	0	Deandre Ayton	55	1610612747	Los Angeles Lakers
182	1642355	f	0	Bronny James	10	1610612747	Los Angeles Lakers
183	1628379	f	0	Luke Kennard	38	1610612747	Los Angeles Lakers
184	1629637	f	0	Jaxson Hayes	24	1610612747	Los Angeles Lakers
185	1631222	f	0	Jake LaRavia	8	1610612747	Los Angeles Lakers
186	1628467	f	0	Maxi Kleber	0	1610612747	Los Angeles Lakers
187	1630559	f	0	Austin Reaves	32	1610612747	Los Angeles Lakers
188	1631166	f	0	Drew Timme	0	1610612747	Los Angeles Lakers
189	1641733	f	0	Nick Smith Jr.	6	1610612747	Los Angeles Lakers
190	2544	f	21	LeBron James	302	1610612747	Los Angeles Lakers
191	1629060	f	0	Rui Hachimura	41	1610612747	Los Angeles Lakers
192	1643024	f	0	Chris Mañon	0	1610612747	Los Angeles Lakers
193	203935	f	0	Marcus Smart	118	1610612747	Los Angeles Lakers
194	1629029	f	6	Luka Dončić	55	1610612747	Los Angeles Lakers
195	1631323	f	0	Simone Fontecchio	0	1610612748	Miami Heat
196	1631211	f	0	Trevor Keels	0	1610612748	Miami Heat
197	1631107	f	0	Nikola Jović	16	1610612748	Miami Heat
198	1642276	f	0	Kel'el Ware	4	1610612748	Miami Heat
199	1641796	f	0	Pelle Larsson	4	1610612748	Miami Heat
200	1631170	f	0	Jaime Jaquez Jr.	7	1610612748	Miami Heat
201	1630696	f	0	Dru Smith	0	1610612748	Miami Heat
202	1628389	f	0	Bam Adebayo	78	1610612748	Miami Heat
203	1629639	f	0	Tyler Herro	50	1610612748	Miami Heat
204	1642066	f	0	Myron Gardner	0	1610612748	Miami Heat
205	1642352	f	0	Keshad Johnson	2	1610612748	Miami Heat
206	1642443	f	0	Jahmir Young	0	1610612748	Miami Heat
207	203952	f	0	Andrew Wiggins	44	1610612748	Miami Heat
208	1626181	f	0	Norman Powell	91	1610612748	Miami Heat
209	1642857	f	0	Kasparas Jakučionis	0	1610612748	Miami Heat
210	1630558	f	0	Davion Mitchell	11	1610612748	Miami Heat
211	1642884	f	0	Vladislav Goldin	0	1610612748	Miami Heat
212	1630579	f	0	Jericho Sims	10	1610612749	Milwaukee Bucks
213	1626167	f	0	Myles Turner	66	1610612749	Milwaukee Bucks
214	1629018	f	0	Gary Trent Jr.	16	1610612749	Milwaukee Bucks
215	1629645	f	0	Kevin Porter Jr.	5	1610612749	Milwaukee Bucks
216	1626171	f	0	Bobby Portis	54	1610612749	Milwaukee Bucks
217	203914	f	0	Gary Harris	39	1610612749	Milwaukee Bucks
218	1627752	f	0	Taurean Prince	26	1610612749	Milwaukee Bucks
219	1631157	f	0	Ryan Rollins	3	1610612749	Milwaukee Bucks
220	1628398	f	0	Kyle Kuzma	32	1610612749	Milwaukee Bucks
221	1631260	f	0	AJ Green	11	1610612749	Milwaukee Bucks
222	1631172	f	0	Ousmane Dieng	13	1610612749	Milwaukee Bucks
223	1630828	f	0	Alex Antetokounmpo	0	1610612749	Milwaukee Bucks
224	1642504	f	0	Cormac Ryan	0	1610612749	Milwaukee Bucks
225	203507	f	9	Giannis Antetokounmpo	84	1610612749	Milwaukee Bucks
226	1631250	f	0	Pete Nance	0	1610612749	Milwaukee Bucks
227	203648	f	0	Thanasis Antetokounmpo	25	1610612749	Milwaukee Bucks
228	1641748	f	0	Andre Jackson Jr.	7	1610612749	Milwaukee Bucks
229	1628978	f	0	Donte DiVincenzo	58	1610612750	Minnesota Timberwolves
230	1630545	f	0	Terrence Shannon Jr.	18	1610612750	Minnesota Timberwolves
231	1630183	f	0	Jaden McDaniels	49	1610612750	Minnesota Timberwolves
232	1641763	f	0	Julian Phillips	5	1610612750	Minnesota Timberwolves
233	1630162	f	2	Anthony Edwards	52	1610612750	Minnesota Timberwolves
234	204060	f	0	Joe Ingles	60	1610612750	Minnesota Timberwolves
235	1630538	f	0	Bones Hyland	23	1610612750	Minnesota Timberwolves
236	201144	f	0	Mike Conley	120	1610612750	Minnesota Timberwolves
237	1629675	f	0	Naz Reid	48	1610612750	Minnesota Timberwolves
238	203937	f	0	Kyle Anderson	76	1610612750	Minnesota Timberwolves
239	1630245	f	0	Ayo Dosunmu	15	1610612750	Minnesota Timberwolves
240	1642389	f	0	Zyon Pullin	0	1610612750	Minnesota Timberwolves
241	1642866	f	0	Joan Beringer	5	1610612750	Minnesota Timberwolves
242	1641740	f	0	Jaylen Clark	11	1610612750	Minnesota Timberwolves
243	1642402	f	0	Enrique Freeman	0	1610612750	Minnesota Timberwolves
244	203497	f	4	Rudy Gobert	96	1610612750	Minnesota Timberwolves
245	203944	f	2	Julius Randle	42	1610612750	Minnesota Timberwolves
246	1642911	f	0	Rocco Zikarsky	0	1610612750	Minnesota Timberwolves
247	1631169	f	0	Josh Minott	11	1610612751	Brooklyn Nets
248	1630533	f	0	Ziaire Williams	14	1610612751	Brooklyn Nets
249	1642874	f	0	Danny Wolf	0	1610612751	Brooklyn Nets
250	1642962	f	0	Drake Powell	0	1610612751	Brooklyn Nets
251	1642856	f	0	Egor Dëmin	0	1610612751	Brooklyn Nets
252	1630604	f	0	E.J. Liddell	1	1610612751	Brooklyn Nets
253	1630623	f	0	Tyson Etienne	0	1610612751	Brooklyn Nets
254	1629611	f	0	Terance Mann	43	1610612751	Brooklyn Nets
255	1629008	f	0	Michael Porter Jr.	75	1610612751	Brooklyn Nets
256	1641869	f	0	Malachi Smith	0	1610612751	Brooklyn Nets
257	1630549	f	0	Day'Ron Sharpe	3	1610612751	Brooklyn Nets
258	1641730	f	0	Noah Clowney	0	1610612751	Brooklyn Nets
259	1630592	f	0	Jalen Wilson	0	1610612751	Brooklyn Nets
260	1630534	f	0	Ochai Agbaji	0	1610612751	Brooklyn Nets
261	1643052	f	0	Chaney Johnson	0	1610612751	Brooklyn Nets
262	1629651	f	0	Nic Claxton	20	1610612751	Brooklyn Nets
263	1642879	f	0	Ben Saraf	0	1610612751	Brooklyn Nets
264	1642849	f	0	Nolan Traore	0	1610612751	Brooklyn Nets
265	203903	f	0	Jordan Clarkson	61	1610612752	New York Knicks
266	1641794	f	0	Dillon Jones	10	1610612752	New York Knicks
267	1630540	f	0	Miles McBride	58	1610612752	New York Knicks
268	1628404	f	0	Josh Hart	61	1610612752	New York Knicks
269	1642359	f	0	Pacôme Dadiet	9	1610612752	New York Knicks
270	1630631	f	0	Jose Alvarado	28	1610612752	New York Knicks
271	1628384	f	0	OG Anunoby	71	1610612752	New York Knicks
272	1641755	f	0	Kevin McCullar Jr.	0	1610612752	New York Knicks
273	1628973	f	3	Jalen Brunson	86	1610612752	New York Knicks
274	1642278	f	0	Tyler Kolek	11	1610612752	New York Knicks
275	1631110	f	0	Jeremy Sochan	8	1610612752	New York Knicks
276	1629011	f	0	Mitchell Robinson	53	1610612752	New York Knicks
277	1628969	f	0	Mikal Bridges	76	1610612752	New York Knicks
278	1626157	f	3	Karl-Anthony Towns	69	1610612752	New York Knicks
279	1629013	f	0	Landry Shamet	83	1610612752	New York Knicks
280	1641998	f	0	Trey Jemison III	0	1610612752	New York Knicks
281	1642885	f	0	Mohamed Diawara	6	1610612752	New York Knicks
282	1630574	f	0	Ariel Hukporti	13	1610612752	New York Knicks
283	1631457	f	0	Alex Morales	0	1610612753	Orlando Magic
284	1641710	f	0	Anthony Black	14	1610612753	Orlando Magic
285	1628371	f	0	Jonathan Isaac	17	1610612753	Orlando Magic
286	1628975	f	0	Jevon Carter	25	1610612753	Orlando Magic
287	1630217	f	0	Desmond Bane	34	1610612753	Orlando Magic
288	1630591	f	0	Jalen Suggs	14	1610612753	Orlando Magic
289	1631094	f	0	Paolo Banchero	19	1610612753	Orlando Magic
290	1631288	f	0	Jamal Cain	7	1610612753	Orlando Magic
291	1642859	f	0	Jase Richardson	1	1610612753	Orlando Magic
292	1641724	f	0	Jett Howard	4	1610612753	Orlando Magic
293	1630658	f	0	Colin Castleton	0	1610612753	Orlando Magic
294	1629021	f	0	Moritz Wagner	9	1610612753	Orlando Magic
295	1630532	f	0	Franz Wagner	16	1610612753	Orlando Magic
296	1641783	f	0	Tristan da Silva	9	1610612753	Orlando Magic
297	1628976	f	0	Wendell Carter Jr.	19	1610612753	Orlando Magic
298	1629048	f	0	Goga Bitadze	11	1610612753	Orlando Magic
299	1642869	f	0	Noah Penda	1	1610612753	Orlando Magic
300	1630169	f	2	Tyrese Haliburton	38	1610612754	Indiana Pacers
301	1630167	f	0	Obi Toppin	56	1610612754	Indiana Pacers
302	1629614	f	0	Andrew Nembhard	40	1610612754	Indiana Pacers
303	1643007	f	0	Taelon Peter	0	1610612754	Indiana Pacers
304	1641716	f	0	Jarace Walker	21	1610612754	Indiana Pacers
305	1642880	f	0	Kam Jones	0	1610612754	Indiana Pacers
306	204456	f	0	T.J. McConnell	62	1610612754	Indiana Pacers
307	1630695	f	0	Micah Potter	0	1610612754	Indiana Pacers
308	1642277	f	0	Johnny Furphy	11	1610612754	Indiana Pacers
309	1641771	f	0	Jalen Slawson	0	1610612754	Indiana Pacers
310	1630174	f	0	Aaron Nesmith	60	1610612754	Indiana Pacers
311	1641738	f	0	Kobe Brown	6	1610612754	Indiana Pacers
312	1641767	f	0	Ben Sheppard	38	1610612754	Indiana Pacers
313	1631245	f	0	Quenton Jackson	0	1610612754	Indiana Pacers
314	1630643	f	0	Jay Huff	2	1610612754	Indiana Pacers
315	1627826	f	0	Ivica Zubac	52	1610612754	Indiana Pacers
316	1627783	f	2	Pascal Siakam	93	1610612754	Indiana Pacers
317	1630679	f	0	Ethan Thompson	0	1610612754	Indiana Pacers
318	1630178	f	1	Tyrese Maxey	52	1610612755	Philadelphia 76ers
319	203083	f	1	Andre Drummond	28	1610612755	Philadelphia 76ers
320	1629656	f	0	Quentin Grimes	20	1610612755	Philadelphia 76ers
321	200768	f	1	Kyle Lowry	138	1610612755	Philadelphia 76ers
322	202331	f	6	Paul George	125	1610612755	Philadelphia 76ers
323	1626162	f	0	Kelly Oubre Jr.	35	1610612755	Philadelphia 76ers
324	1642348	f	0	Justin Edwards	9	1610612755	Philadelphia 76ers
325	1630570	f	0	Trendon Watford	7	1610612755	Philadelphia 76ers
326	1631207	f	0	Dalen Terry	7	1610612755	Philadelphia 76ers
327	1630699	f	0	MarJon Beauchamp	6	1610612755	Philadelphia 76ers
328	203954	f	5	Joel Embiid	66	1610612755	Philadelphia 76ers
329	1641780	f	0	Johni Broome	2	1610612755	Philadelphia 76ers
330	1631213	f	0	Tyrese Martin	0	1610612755	Philadelphia 76ers
331	1631230	f	0	Dominick Barlow	9	1610612755	Philadelphia 76ers
332	1641737	f	0	Adem Bona	10	1610612755	Philadelphia 76ers
333	1631133	f	0	Jabari Walker	6	1610612755	Philadelphia 76ers
334	1642845	f	0	VJ Edgecombe	11	1610612755	Philadelphia 76ers
335	1626220	f	0	Royce O'Neale	52	1610612756	Phoenix Suns
336	1642346	f	0	Ryan Dunn	4	1610612756	Phoenix Suns
337	1626164	f	2	Devin Booker	51	1610612756	Phoenix Suns
338	1629599	f	0	Amir Coffey	24	1610612756	Phoenix Suns
339	1628415	f	0	Dillon Brooks	33	1610612756	Phoenix Suns
340	1630224	f	0	Jalen Green	11	1610612756	Phoenix Suns
341	1629312	f	0	Haywood Highsmith	37	1610612756	Phoenix Suns
342	1628960	f	0	Grayson Allen	28	1610612756	Phoenix Suns
343	1642863	f	0	Khaman Maluach	4	1610612756	Phoenix Suns
344	1642345	f	0	Oso Ighodaro	4	1610612756	Phoenix Suns
345	1631221	f	0	Collin Gillespie	4	1610612756	Phoenix Suns
346	1642886	f	0	Koby Brea	0	1610612756	Phoenix Suns
347	1631109	f	0	Mark Williams	0	1610612756	Phoenix Suns
348	1631123	f	0	Jamaree Bouyea	4	1610612756	Phoenix Suns
349	1630587	f	0	Isaiah Livers	0	1610612756	Phoenix Suns
350	1642853	f	0	Rasheer Fleming	4	1610612756	Phoenix Suns
351	1643047	f	0	CJ Huntley	0	1610612756	Phoenix Suns
352	1630692	f	0	Jordan Goodwin	5	1610612756	Phoenix Suns
353	1643257	f	0	Jayson Kent	0	1610612757	Portland Trail Blazers
354	1630703	f	0	Scoot Henderson	5	1610612757	Portland Trail Blazers
355	203081	f	7	Damian Lillard	68	1610612757	Portland Trail Blazers
356	1631104	f	0	Blake Wesley	4	1610612757	Portland Trail Blazers
357	1631126	f	0	Caleb Love	0	1610612757	Portland Trail Blazers
358	1642959	f	0	Chris Youngblood	0	1610612757	Portland Trail Blazers
359	1629680	f	0	Matisse Thybulle	29	1610612757	Portland Trail Blazers
360	201950	f	0	Jrue Holiday	102	1610612757	Portland Trail Blazers
361	1630166	f	0	Deni Avdija	5	1610612757	Portland Trail Blazers
362	203924	f	0	Jerami Grant	40	1610612757	Portland Trail Blazers
363	1642905	f	0	Yang Hansen	4	1610612757	Portland Trail Blazers
364	1631101	f	0	Shaedon Sharpe	5	1610612757	Portland Trail Blazers
365	1642270	f	0	Donovan Clingan	5	1610612757	Portland Trail Blazers
366	1631200	f	0	Kris Murray	5	1610612757	Portland Trail Blazers
367	1630249	f	0	Vít Krejčí	4	1610612757	Portland Trail Blazers
368	1641739	f	0	Toumani Camara	5	1610612757	Portland Trail Blazers
369	1629057	f	0	Robert Williams III	61	1610612757	Portland Trail Blazers
370	1631321	f	0	Sidy Cissoko	4	1610612757	Portland Trail Blazers
371	1628370	f	0	Malik Monk	7	1610612758	Sacramento Kings
372	1642363	f	0	Nique Clifford	0	1610612758	Sacramento Kings
373	1630165	f	0	Killian Hayes	0	1610612758	Sacramento Kings
374	203926	f	0	Doug McDermott	25	1610612758	Sacramento Kings
375	203897	f	0	Zach LaVine	4	1610612758	Sacramento Kings
376	1630173	f	0	Precious Achiuwa	26	1610612758	Sacramento Kings
377	201942	f	3	DeMar DeRozan	63	1610612758	Sacramento Kings
378	1627734	f	2	Domantas Sabonis	20	1610612758	Sacramento Kings
379	1631099	f	0	Keegan Murray	7	1610612758	Sacramento Kings
380	1629631	f	0	De'Andre Hunter	24	1610612758	Sacramento Kings
381	201566	f	9	Russell Westbrook	135	1610612758	Sacramento Kings
382	1629234	f	0	Drew Eubanks	6	1610612758	Sacramento Kings
383	1642269	f	0	Devin Carter	0	1610612758	Sacramento Kings
384	1631116	f	0	Patrick Baldwin Jr.	3	1610612758	Sacramento Kings
385	1641815	f	0	Isaiah Stevens	0	1610612758	Sacramento Kings
386	1631342	f	0	Daeqwon Plowden	0	1610612758	Sacramento Kings
387	1642928	f	0	Dylan Cardwell	0	1610612758	Sacramento Kings
388	1642875	f	0	Maxime Raynaud	0	1610612758	Sacramento Kings
389	1629162	f	0	Jordan McLaughlin	23	1610612759	San Antonio Spurs
390	1641705	f	1	Victor Wembanyama	22	1610612759	San Antonio Spurs
391	1642844	f	0	Dylan Harper	23	1610612759	San Antonio Spurs
392	1629640	f	0	Keldon Johnson	23	1610612759	San Antonio Spurs
393	1628368	f	1	De'Aaron Fox	28	1610612759	San Antonio Spurs
394	1642264	f	0	Stephon Castle	23	1610612759	San Antonio Spurs
395	1628436	f	0	Luke Kornet	66	1610612759	San Antonio Spurs
396	203482	f	0	Kelly Olynyk	57	1610612759	San Antonio Spurs
397	1642868	f	0	Carter Bryant	22	1610612759	San Antonio Spurs
398	1641801	f	0	Emanuel Miller	0	1610612759	San Antonio Spurs
399	202687	f	0	Bismack Biyombo	49	1610612759	San Antonio Spurs
400	1630170	f	0	Devin Vassell	23	1610612759	San Antonio Spurs
401	1642357	f	0	David Jones Garcia	0	1610612759	San Antonio Spurs
402	1630577	f	0	Julian Champagnie	23	1610612759	San Antonio Spurs
403	203084	f	0	Harrison Barnes	91	1610612759	San Antonio Spurs
404	1630322	f	0	Lindy Waters III	12	1610612759	San Antonio Spurs
405	203486	f	0	Mason Plumlee	77	1610612759	San Antonio Spurs
406	1631127	f	0	Harrison Ingram	0	1610612759	San Antonio Spurs
407	1628983	f	4	Shai Gilgeous-Alexander	61	1610612760	Oklahoma City Thunder
408	1642272	f	0	Jared McCain	15	1610612760	Oklahoma City Thunder
409	1629652	f	0	Luguentz Dort	54	1610612760	Oklahoma City Thunder
410	1631119	f	0	Jaylin Williams	42	1610612760	Oklahoma City Thunder
411	1631096	f	1	Chet Holmgren	48	1610612760	Oklahoma City Thunder
412	1631114	f	1	Jalen Williams	38	1610612760	Oklahoma City Thunder
413	1627936	f	0	Alex Caruso	69	1610612760	Oklahoma City Thunder
414	1630198	f	0	Isaiah Joe	55	1610612760	Oklahoma City Thunder
415	1642850	f	0	Thomas Sorber	0	1610612760	Oklahoma City Thunder
416	1642362	f	0	Payton Sandfort	0	1610612760	Oklahoma City Thunder
417	1642382	f	0	Branden Carlson	0	1610612760	Oklahoma City Thunder
418	1630598	f	0	Aaron Wiggins	45	1610612760	Oklahoma City Thunder
419	1641717	f	0	Cason Wallace	48	1610612760	Oklahoma City Thunder
420	1642964	f	0	Brooks Barnhizer	0	1610612760	Oklahoma City Thunder
421	1642349	f	0	Ajay Mitchell	23	1610612760	Oklahoma City Thunder
422	1629026	f	0	Kenrich Williams	34	1610612760	Oklahoma City Thunder
423	1642260	f	0	Nikola Topić	9	1610612760	Oklahoma City Thunder
424	1628392	f	0	Isaiah Hartenstein	64	1610612760	Oklahoma City Thunder
425	1630639	f	0	A.J. Lawson	17	1610612761	Toronto Raptors
426	1641711	f	0	Gradey Dick	3	1610612761	Toronto Raptors
427	1642367	f	0	Jonathan Mogbo	3	1610612761	Toronto Raptors
428	1627742	f	0	Brandon Ingram	15	1610612761	Toronto Raptors
429	1630567	f	0	Scottie Barnes	11	1610612761	Toronto Raptors
430	1630193	f	0	Immanuel Quickley	13	1610612761	Toronto Raptors
431	1629628	f	0	RJ Barrett	23	1610612761	Toronto Raptors
432	1642867	f	0	Collin Murray-Boyles	7	1610612761	Toronto Raptors
433	1642266	f	0	Ja'Kobe Walter	7	1610612761	Toronto Raptors
434	202066	f	0	Garrett Temple	33	1610612761	Toronto Raptors
435	1627751	f	0	Jakob Poeltl	29	1610612761	Toronto Raptors
436	1642347	f	0	Jamal Shead	7	1610612761	Toronto Raptors
437	1642935	f	0	Chucky Hepburn	0	1610612761	Toronto Raptors
438	1631218	f	0	Trayce Jackson-Davis	12	1610612761	Toronto Raptors
439	1630572	f	0	Sandro Mamukelashvili	7	1610612761	Toronto Raptors
440	1642918	f	0	Alijah Martin	0	1610612761	Toronto Raptors
441	1642419	f	0	Jamison Battle	6	1610612761	Toronto Raptors
442	1643060	f	0	Hayden Gray	0	1610612762	Utah Jazz
443	1642396	f	0	Blake Hinson	0	1610612762	Utah Jazz
444	1641718	f	0	Keyonte George	0	1610612762	Utah Jazz
445	1642262	f	0	Cody Williams	0	1610612762	Utah Jazz
446	1642268	f	0	Isaiah Collier	0	1610612762	Utah Jazz
447	1629004	f	0	Svi Mykhailiuk	11	1610612762	Utah Jazz
448	1641989	f	0	Elijah Harkless	0	1610612762	Utah Jazz
449	1642846	f	0	Ace Bailey	0	1610612762	Utah Jazz
450	1628991	f	0	Jaren Jackson Jr.	27	1610612762	Utah Jazz
451	1643016	f	0	Bez Mbeng	0	1610612762	Utah Jazz
452	1642271	f	0	Kyle Filipowski	0	1610612762	Utah Jazz
453	1628374	f	0	Lauri Markkanen	0	1610612762	Utah Jazz
454	1631117	f	0	Walker Kessler	0	1610612762	Utah Jazz
455	1641729	f	0	Brice Sensabaugh	0	1610612762	Utah Jazz
456	203994	f	0	Jusuf Nurkić	20	1610612762	Utah Jazz
457	1631131	f	0	Oscar Tshiebwe	0	1610612762	Utah Jazz
458	201567	f	2	Kevin Love	88	1610612762	Utah Jazz
459	1629723	f	0	John Konchar	18	1610612762	Utah Jazz
460	1642942	f	0	Jahmai Mashack	0	1610612763	Memphis Grizzlies
461	1642377	f	0	Jaylen Wells	0	1610612763	Memphis Grizzlies
462	1630590	f	0	Scotty Pippen Jr.	4	1610612763	Memphis Grizzlies
463	1629660	f	0	Ty Jerome	9	1610612763	Memphis Grizzlies
464	203484	f	0	Kentavious Caldwell-Pope	67	1610612763	Memphis Grizzlies
465	1642383	f	0	Walter Clayton Jr.	0	1610612763	Memphis Grizzlies
466	1630583	f	0	Santi Aldama	10	1610612763	Memphis Grizzlies
467	1642914	f	0	Javon Small	0	1610612763	Memphis Grizzlies
468	1629630	f	1	Ja Morant	22	1610612763	Memphis Grizzlies
469	1641744	f	0	Zach Edey	4	1610612763	Memphis Grizzlies
470	1629634	f	0	Brandon Clarke	14	1610612763	Memphis Grizzlies
471	1641765	f	0	Olivier-Maxence Prosper	3	1610612763	Memphis Grizzlies
472	1641712	f	0	Rayan Rupert	0	1610612763	Memphis Grizzlies
473	1641707	f	0	Taylor Hendricks	0	1610612763	Memphis Grizzlies
474	1642907	f	0	Cedric Coward	0	1610612763	Memphis Grizzlies
475	1642285	f	0	Cam Spencer	0	1610612763	Memphis Grizzlies
476	1641713	f	0	GG Jackson	0	1610612763	Memphis Grizzlies
477	201959	f	0	Taj Gibson	71	1610612763	Memphis Grizzlies
478	1642882	f	0	Julian Reese	0	1610612764	Washington Wizards
479	1641731	f	0	Bilal Coulibaly	0	1610612764	Washington Wizards
480	1641774	f	0	Tristan Vukcevic	0	1610612764	Washington Wizards
481	1641715	f	0	Cam Whitmore	3	1610612764	Washington Wizards
482	1629027	f	1	Trae Young	27	1610612764	Washington Wizards
483	1626156	f	0	D'Angelo Russell	32	1610612764	Washington Wizards
484	1642364	f	0	Jamir Watkins	0	1610612764	Washington Wizards
485	1642267	f	0	Bub Carrington	0	1610612764	Washington Wizards
486	1630702	f	0	Jaden Hardy	19	1610612764	Washington Wizards
487	1630551	f	0	Justin Champagnie	4	1610612764	Washington Wizards
488	1642848	f	0	Tre Johnson	0	1610612764	Washington Wizards
489	1641778	f	0	Leaky Black	0	1610612764	Washington Wizards
490	1630536	f	0	Sharife Cooper	0	1610612764	Washington Wizards
491	1630264	f	0	Anthony Gill	4	1610612764	Washington Wizards
492	1642273	f	0	Kyshawn George	0	1610612764	Washington Wizards
493	1642259	f	0	Alex Sarr	0	1610612764	Washington Wizards
494	203076	f	5	Anthony Davis	60	1610612764	Washington Wizards
495	1642860	f	0	Will Riley	0	1610612764	Washington Wizards
496	1631105	f	1	Jalen Duren	20	1610612765	Detroit Pistons
497	1630595	f	2	Cade Cunningham	20	1610612765	Detroit Pistons
498	1642403	f	0	Isaac Jones	0	1610612765	Detroit Pistons
499	1641842	f	0	Ronald Holland II	14	1610612765	Detroit Pistons
500	1630194	f	0	Paul Reed	46	1610612765	Detroit Pistons
501	1627747	f	0	Caris LeVert	38	1610612765	Detroit Pistons
502	1641709	f	0	Ausar Thompson	20	1610612765	Detroit Pistons
503	202699	f	0	Tobias Harris	81	1610612765	Detroit Pistons
504	1631111	f	0	Wendell Moore Jr.	7	1610612765	Detroit Pistons
505	1642404	f	0	Chaz Lanier	3	1610612765	Detroit Pistons
506	1642450	f	0	Daniss Jenkins	14	1610612765	Detroit Pistons
507	1631204	f	0	Marcus Sasser	6	1610612765	Detroit Pistons
508	1628989	f	0	Kevin Huerter	35	1610612765	Detroit Pistons
509	1630191	f	0	Isaiah Stewart	15	1610612765	Detroit Pistons
510	1629750	f	0	Javonte Green	23	1610612765	Detroit Pistons
511	1642449	f	0	Tolu Smith	3	1610612765	Detroit Pistons
512	1629130	f	0	Duncan Robinson	83	1610612765	Detroit Pistons
513	1628970	f	0	Miles Bridges	0	1610612766	Charlotte Hornets
514	1630163	f	0	LaMelo Ball	0	1610612766	Charlotte Hornets
515	1629684	f	0	Grant Williams	61	1610612766	Charlotte Hornets
516	1629632	f	0	Coby White	5	1610612766	Charlotte Hornets
517	1642883	f	0	Sion James	0	1610612766	Charlotte Hornets
518	1642851	f	0	Kon Knueppel	0	1610612766	Charlotte Hornets
519	1630182	f	0	Josh Green	39	1610612766	Charlotte Hornets
520	1641750	f	0	Ryan Kalkbrenner	0	1610612766	Charlotte Hornets
521	1641810	f	0	Antonio Reeves	0	1610612766	Charlotte Hornets
522	1631217	f	0	Moussa Diabaté	0	1610612766	Charlotte Hornets
523	1641790	f	0	PJ Hall	0	1610612766	Charlotte Hornets
524	1641787	f	0	Tosan Evbuomwan	0	1610612766	Charlotte Hornets
525	1626192	f	0	Pat Connaughton	86	1610612766	Charlotte Hornets
526	1630544	f	0	Tre Mann	0	1610612766	Charlotte Hornets
527	1641706	f	0	Brandon Miller	0	1610612766	Charlotte Hornets
528	1630214	f	0	Xavier Tillman	27	1610612766	Charlotte Hornets
529	1642275	f	0	Tidjane Salaün	0	1610612766	Charlotte Hornets
530	1642862	f	0	Liam McNeeley	0	1610612766	Charlotte Hornets
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

\unrestrict 3WgLvRNYG9a0J2vbX2DCeWDAcqeZ9r23Albieda6YmecdgPKGvz7ufMLVCGnq7e

