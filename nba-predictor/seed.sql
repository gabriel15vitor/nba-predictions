--
-- PostgreSQL database dump
--

\restrict 4dKzR4PxKecaSYqra5Cghn4JBT9vxf58vsfD1hyBn8cPuEO0Qo3eCCvr4bFtD9H

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

--
-- Data for Name: player; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.player (id, api_player_id, is_injured, mvp_shares, name, playoff_games, team_id, team_name) FROM stdin;
52	1642933	f	0	Keshon Gilbert	0	1610612737	Atlanta Hawks
53	1642484	f	0	RayJ Dennis	0	1610612737	Atlanta Hawks
54	1630228	f	0	Jonathan Kuminga	40	1610612737	Atlanta Hawks
55	1630552	f	1	Jalen Johnson	14	1610612737	Atlanta Hawks
56	1630811	f	0	Keaton Wallace	3	1610612737	Atlanta Hawks
57	203468	f	0	CJ McCollum	73	1610612737	Atlanta Hawks
58	1629216	f	0	Gabe Vincent	60	1610612737	Atlanta Hawks
59	1630700	f	0	Dyson Daniels	9	1610612737	Atlanta Hawks
60	1629638	f	0	Nickeil Alexander-Walker	43	1610612737	Atlanta Hawks
61	1627741	f	0	Buddy Hield	18	1610612737	Atlanta Hawks
62	1642258	f	0	Zaccharie Risacher	3	1610612737	Atlanta Hawks
63	1631132	f	0	Christian Koloko	0	1610612737	Atlanta Hawks
64	1628396	f	0	Tony Bradley	24	1610612737	Atlanta Hawks
65	1642854	f	0	Asa Newell	2	1610612737	Atlanta Hawks
66	1630168	f	0	Onyeka Okongwu	35	1610612737	Atlanta Hawks
67	1631243	f	0	Mouhamed Gueye	6	1610612737	Atlanta Hawks
68	1630557	f	0	Corey Kispert	5	1610612737	Atlanta Hawks
69	1629111	f	0	Jock Landale	8	1610612737	Atlanta Hawks
70	1628369	f	5	Jayson Tatum	127	1610612738	Boston Celtics
71	202696	f	0	Nikola Vučević	22	1610612738	Boston Celtics
72	1627759	f	2	Jaylen Brown	142	1610612738	Boston Celtics
73	1642910	f	0	John Tonje	0	1610612738	Boston Celtics
74	1628401	f	0	Derrick White	90	1610612738	Boston Celtics
75	1630202	f	0	Payton Pritchard	76	1610612738	Boston Celtics
76	1631199	f	0	Ron Harper Jr.	6	1610612738	Boston Celtics
77	1641775	f	0	Jordan Walsh	15	1610612738	Boston Celtics
78	1642864	f	0	Hugo González	4	1610612738	Boston Celtics
79	1630573	f	0	Sam Hauser	56	1610612738	Boston Celtics
80	1642917	f	0	Max Shulga	2	1610612738	Boston Celtics
81	1630625	f	0	Dalano Banton	6	1610612738	Boston Celtics
82	1630568	f	0	Luka Garza	19	1610612738	Boston Celtics
83	1631248	f	0	Baylor Scheierman	11	1610612738	Boston Celtics
84	1642873	f	0	Amari Williams	1	1610612738	Boston Celtics
85	1629674	f	0	Neemias Queta	14	1610612738	Boston Celtics
86	201935	f	8	James Harden	191	1610612739	Cleveland Cavaliers
87	1629622	f	0	Max Strus	82	1610612739	Cleveland Cavaliers
88	1628418	f	0	Thomas Bryant	32	1610612739	Cleveland Cavaliers
89	1630596	f	1	Evan Mobley	43	1610612739	Cleveland Cavaliers
90	1630241	f	0	Sam Merrill	43	1610612739	Cleveland Cavaliers
91	203471	f	0	Dennis Schröder	91	1610612739	Cleveland Cavaliers
92	1641854	f	0	Craig Porter Jr.	13	1610612739	Cleveland Cavaliers
93	1642434	f	0	Riley Minix	0	1610612739	Cleveland Cavaliers
94	1631165	f	0	Keon Ellis	12	1610612739	Cleveland Cavaliers
95	1642281	f	0	Jaylon Tyson	21	1610612739	Cleveland Cavaliers
96	1642400	f	0	Tristan Enaruna	0	1610612739	Cleveland Cavaliers
97	1626204	f	0	Larry Nance Jr.	32	1610612739	Cleveland Cavaliers
98	1642878	f	0	Tyrese Proctor	4	1610612739	Cleveland Cavaliers
99	1628386	f	0	Jarrett Allen	45	1610612739	Cleveland Cavaliers
100	1629731	f	0	Dean Wade	32	1610612739	Cleveland Cavaliers
101	1630846	f	0	Olivier Sarr	0	1610612739	Cleveland Cavaliers
102	1641772	f	0	Nae'Qwan Tomlin	7	1610612739	Cleveland Cavaliers
103	1628378	f	3	Donovan Mitchell	81	1610612739	Cleveland Cavaliers
104	1642490	f	0	Josh Oduro	0	1610612740	New Orleans Pelicans
105	1642847	f	0	Jeremiah Fears	0	1610612740	New Orleans Pelicans
106	1629627	f	0	Zion Williamson	0	1610612740	New Orleans Pelicans
107	1630529	f	0	Herbert Jones	10	1610612740	New Orleans Pelicans
108	1629673	f	0	Jordan Poole	35	1610612740	New Orleans Pelicans
109	1630621	f	0	Hunter Dickinson	0	1610612740	New Orleans Pelicans
110	1627749	f	0	Dejounte Murray	21	1610612740	New Orleans Pelicans
111	201599	f	3	DeAndre Jordan	73	1610612740	New Orleans Pelicans
112	1631121	f	0	Bryce McGowens	0	1610612740	New Orleans Pelicans
113	1642877	f	0	Micah Peavy	0	1610612740	New Orleans Pelicans
114	1631255	f	0	Karlo Matković	0	1610612740	New Orleans Pelicans
115	1642274	f	0	Yves Missi	0	1610612740	New Orleans Pelicans
116	1642852	f	0	Derik Queen	0	1610612740	New Orleans Pelicans
117	1641725	f	0	Trey Alexander	0	1610612740	New Orleans Pelicans
118	1641722	f	0	Jordan Hawkins	3	1610612740	New Orleans Pelicans
119	1630530	f	0	Trey Murphy III	10	1610612740	New Orleans Pelicans
120	1630180	f	0	Saddiq Bey	6	1610612740	New Orleans Pelicans
121	1626172	f	0	Kevon Looney	89	1610612740	New Orleans Pelicans
122	1629012	f	0	Collin Sexton	0	1610612741	Chicago Bulls
123	1630581	f	0	Josh Giddey	10	1610612741	Chicago Bulls
124	1630644	f	0	Mac McClung	0	1610612741	Chicago Bulls
125	1642265	f	0	Rob Dillingham	3	1610612741	Chicago Bulls
126	1642530	f	0	Yuki Kawamura	0	1610612741	Chicago Bulls
127	1631159	f	0	Leonard Miller	6	1610612741	Chicago Bulls
128	1628380	f	0	Zach Collins	20	1610612741	Chicago Bulls
129	1630208	f	0	Nick Richards	0	1610612741	Chicago Bulls
130	1641824	f	0	Matas Buzelis	0	1610612741	Chicago Bulls
131	1631338	f	0	Mouhamadou Gueye	0	1610612741	Chicago Bulls
132	1629014	f	0	Anfernee Simons	15	1610612741	Chicago Bulls
133	1642855	f	0	Noa Essengue	0	1610612741	Chicago Bulls
134	1630188	f	0	Jalen Smith	13	1610612741	Chicago Bulls
135	1627824	f	0	Guerschon Yabusele	16	1610612741	Chicago Bulls
136	1630200	f	0	Tre Jones	0	1610612741	Chicago Bulls
137	1630171	f	0	Isaac Okoro	26	1610612741	Chicago Bulls
138	1630172	f	0	Patrick Williams	5	1610612741	Chicago Bulls
139	1642950	f	0	Lachlan Olbrich	0	1610612741	Chicago Bulls
140	1642967	f	0	John Poulakidas	0	1610612742	Dallas Mavericks
141	1631108	f	0	Max Christie	9	1610612742	Dallas Mavericks
142	1641726	f	0	Dereck Lively II	21	1610612742	Dallas Mavericks
143	203939	f	0	Dwight Powell	44	1610612742	Dallas Mavericks
144	1642358	f	0	AJ Johnson	0	1610612742	Dallas Mavericks
145	1642948	f	0	Ryan Nembhard	0	1610612742	Dallas Mavericks
146	1630314	f	0	Brandon Williams	0	1610612742	Dallas Mavericks
147	202681	f	3	Kyrie Irving	96	1610612742	Dallas Mavericks
148	1630230	f	0	Naji Marshall	10	1610612742	Dallas Mavericks
149	1628997	f	0	Caleb Martin	45	1610612742	Dallas Mavericks
150	203114	f	0	Khris Middleton	80	1610612742	Dallas Mavericks
151	1629655	f	0	Daniel Gafford	27	1610612742	Dallas Mavericks
152	1641890	f	0	Tyler Smith	0	1610612742	Dallas Mavericks
153	1629023	f	0	P.J. Washington	22	1610612742	Dallas Mavericks
154	1630619	f	0	Moussa Cisse	0	1610612742	Dallas Mavericks
155	202691	f	2	Klay Thompson	158	1610612742	Dallas Mavericks
156	1642843	f	0	Cooper Flagg	0	1610612742	Dallas Mavericks
157	1628963	f	0	Marvin Bagley III	2	1610612742	Dallas Mavericks
158	1631128	f	0	Christian Braun	51	1610612743	Denver Nuggets
159	1642938	f	0	Curtis Jones	0	1610612743	Denver Nuggets
160	1631124	f	0	Julian Strawther	14	1610612743	Denver Nuggets
161	1626145	f	0	Tyus Jones	30	1610612743	Denver Nuggets
162	1631212	f	0	Peyton Watson	29	1610612743	Denver Nuggets
163	203501	f	0	Tim Hardaway Jr.	54	1610612743	Denver Nuggets
164	1628971	f	0	Bruce Brown	46	1610612743	Denver Nuggets
165	1641747	f	0	DaRon Holmes II	2	1610612743	Denver Nuggets
166	203999	f	8	Nikola Jokić	100	1610612743	Denver Nuggets
167	202685	f	0	Jonas Valančiūnas	62	1610612743	Denver Nuggets
168	1642461	f	0	Spencer Jones	6	1610612743	Denver Nuggets
169	1630192	f	0	Zeke Nnaji	23	1610612743	Denver Nuggets
170	1629661	f	0	Cameron Johnson	44	1610612743	Denver Nuggets
171	1629618	f	0	Jalen Pickett	13	1610612743	Denver Nuggets
172	1642354	f	0	KJ Simpson	0	1610612743	Denver Nuggets
173	1627750	f	1	Jamal Murray	85	1610612743	Denver Nuggets
174	203932	f	0	Aaron Gordon	69	1610612743	Denver Nuggets
175	1631223	f	0	David Roddy	8	1610612743	Denver Nuggets
176	1627780	f	0	Gary Payton II	35	1610612744	Golden State Warriors
177	1641764	f	0	Brandin Podziemski	12	1610612744	Golden State Warriors
178	1642954	f	0	Will Richard	0	1610612744	Golden State Warriors
179	1630541	f	0	Moses Moody	37	1610612744	Golden State Warriors
180	204001	f	0	Kristaps Porziņģis	28	1610612744	Golden State Warriors
181	1629001	f	0	De'Anthony Melton	27	1610612744	Golden State Warriors
182	202710	f	5	Jimmy Butler III	130	1610612744	Golden State Warriors
183	1630611	f	0	Gui Santos	10	1610612744	Golden State Warriors
184	1643018	f	0	LJ Cryer	0	1610612744	Golden State Warriors
185	1631466	f	0	Nate Williams	3	1610612744	Golden State Warriors
186	201143	f	1	Al Horford	197	1610612744	Golden State Warriors
187	1642366	f	0	Quinten Post	12	1610612744	Golden State Warriors
188	203110	f	2	Draymond Green	169	1610612744	Golden State Warriors
189	1629646	f	0	Charles Bassey	3	1610612744	Golden State Warriors
190	203552	f	0	Seth Curry	41	1610612744	Golden State Warriors
191	1642502	f	0	Malevy Leons	0	1610612744	Golden State Warriors
192	1630311	f	0	Pat Spencer	8	1610612744	Golden State Warriors
193	1628988	f	0	Aaron Holiday	23	1610612745	Houston Rockets
194	1641708	f	0	Amen Thompson	13	1610612745	Houston Rockets
195	1627827	f	0	Dorian Finney-Smith	44	1610612745	Houston Rockets
196	1631120	f	0	JD Davison	6	1610612745	Houston Rockets
197	1627832	f	0	Fred VanVleet	59	1610612745	Houston Rockets
198	201142	f	12	Kevin Durant	171	1610612745	Houston Rockets
199	1630256	f	0	Jae'Sean Tate	5	1610612745	Houston Rockets
200	1631095	f	0	Jabari Smith Jr.	13	1610612745	Houston Rockets
201	203500	f	0	Steven Adams	73	1610612745	Houston Rockets
202	1641803	f	0	Tristen Newton	0	1610612745	Houston Rockets
203	1642263	f	0	Reed Sheppard	9	1610612745	Houston Rockets
204	1631106	f	0	Tari Eason	13	1610612745	Houston Rockets
205	1629006	f	0	Josh Okogie	21	1610612745	Houston Rockets
206	1642384	f	0	Isaiah Crawford	0	1610612745	Houston Rockets
207	1630578	f	0	Alperen Sengun	13	1610612745	Houston Rockets
208	203991	f	0	Clint Capela	91	1610612745	Houston Rockets
209	201145	f	0	Jeff Green	108	1610612745	Houston Rockets
210	1641807	f	0	Norchad Omier	0	1610612746	LA Clippers
211	1642951	f	0	Sean Pedulla	0	1610612746	LA Clippers
212	203078	f	1	Bradley Beal	49	1610612746	LA Clippers
213	202695	f	7	Kawhi Leonard	146	1610612746	LA Clippers
214	1642920	f	0	Kobe Sanders	0	1610612746	LA Clippers
215	1627884	f	0	Derrick Jones Jr.	51	1610612746	LA Clippers
216	203992	f	0	Bogdan Bogdanović	35	1610612746	LA Clippers
217	1627739	f	0	Kris Dunn	12	1610612746	LA Clippers
218	1631097	f	0	Bennedict Mathurin	22	1610612746	LA Clippers
219	1629636	f	0	Darius Garland	22	1610612746	LA Clippers
220	201572	f	0	Brook Lopez	89	1610612746	LA Clippers
221	1642353	f	0	Cam Christie	3	1610612746	LA Clippers
222	1631102	f	0	TyTy Washington Jr.	0	1610612746	LA Clippers
223	1642949	f	0	Yanic Konan Niederhäuser	0	1610612746	LA Clippers
224	1628381	f	0	John Collins	29	1610612746	LA Clippers
225	1641757	f	0	Jordan Miller	3	1610612746	LA Clippers
226	1630543	f	0	Isaiah Jackson	15	1610612746	LA Clippers
227	201587	f	0	Nicolas Batum	76	1610612746	LA Clippers
228	1642876	f	0	Adou Thiero	6	1610612747	Los Angeles Lakers
229	1629020	f	0	Jarred Vanderbilt	36	1610612747	Los Angeles Lakers
230	1642261	f	0	Dalton Knecht	7	1610612747	Los Angeles Lakers
231	1629028	f	0	Deandre Ayton	55	1610612747	Los Angeles Lakers
232	1642355	f	0	Bronny James	10	1610612747	Los Angeles Lakers
233	1628379	f	0	Luke Kennard	38	1610612747	Los Angeles Lakers
234	1629637	f	0	Jaxson Hayes	24	1610612747	Los Angeles Lakers
235	1631222	f	0	Jake LaRavia	8	1610612747	Los Angeles Lakers
236	1628467	f	0	Maxi Kleber	0	1610612747	Los Angeles Lakers
237	1630559	f	0	Austin Reaves	32	1610612747	Los Angeles Lakers
238	1631166	f	0	Drew Timme	0	1610612747	Los Angeles Lakers
239	1641733	f	0	Nick Smith Jr.	6	1610612747	Los Angeles Lakers
240	1629060	f	0	Rui Hachimura	41	1610612747	Los Angeles Lakers
241	1643024	f	0	Chris Mañon	0	1610612747	Los Angeles Lakers
242	203935	f	0	Marcus Smart	118	1610612747	Los Angeles Lakers
243	1629029	f	6	Luka Dončić	55	1610612747	Los Angeles Lakers
244	1631323	f	0	Simone Fontecchio	0	1610612748	Miami Heat
245	1631211	f	0	Trevor Keels	0	1610612748	Miami Heat
246	1631107	f	0	Nikola Jović	16	1610612748	Miami Heat
247	1642276	f	0	Kel'el Ware	4	1610612748	Miami Heat
248	1641796	f	0	Pelle Larsson	4	1610612748	Miami Heat
249	1631170	f	0	Jaime Jaquez Jr.	7	1610612748	Miami Heat
250	1630696	f	0	Dru Smith	0	1610612748	Miami Heat
251	1628389	f	0	Bam Adebayo	78	1610612748	Miami Heat
252	1629639	f	0	Tyler Herro	50	1610612748	Miami Heat
253	1642066	f	0	Myron Gardner	0	1610612748	Miami Heat
254	1642352	f	0	Keshad Johnson	2	1610612748	Miami Heat
255	1642443	f	0	Jahmir Young	0	1610612748	Miami Heat
256	203952	f	0	Andrew Wiggins	44	1610612748	Miami Heat
257	1626181	f	0	Norman Powell	91	1610612748	Miami Heat
258	1642857	f	0	Kasparas Jakučionis	0	1610612748	Miami Heat
259	1630558	f	0	Davion Mitchell	11	1610612748	Miami Heat
260	1642884	f	0	Vladislav Goldin	0	1610612748	Miami Heat
261	1630579	f	0	Jericho Sims	10	1610612749	Milwaukee Bucks
262	1626167	f	0	Myles Turner	66	1610612749	Milwaukee Bucks
263	1629018	f	0	Gary Trent Jr.	16	1610612749	Milwaukee Bucks
264	1629645	f	0	Kevin Porter Jr.	5	1610612749	Milwaukee Bucks
265	1626171	f	0	Bobby Portis	54	1610612749	Milwaukee Bucks
266	203914	f	0	Gary Harris	39	1610612749	Milwaukee Bucks
267	1627752	f	0	Taurean Prince	26	1610612749	Milwaukee Bucks
268	1631157	f	0	Ryan Rollins	3	1610612749	Milwaukee Bucks
269	1628398	f	0	Kyle Kuzma	32	1610612749	Milwaukee Bucks
270	1631260	f	0	AJ Green	11	1610612749	Milwaukee Bucks
271	1631172	f	0	Ousmane Dieng	13	1610612749	Milwaukee Bucks
272	1630828	f	0	Alex Antetokounmpo	0	1610612749	Milwaukee Bucks
273	1642504	f	0	Cormac Ryan	0	1610612749	Milwaukee Bucks
274	203507	f	9	Giannis Antetokounmpo	84	1610612749	Milwaukee Bucks
275	1631250	f	0	Pete Nance	0	1610612749	Milwaukee Bucks
276	203648	f	0	Thanasis Antetokounmpo	25	1610612749	Milwaukee Bucks
277	1641748	f	0	Andre Jackson Jr.	7	1610612749	Milwaukee Bucks
278	1628978	f	0	Donte DiVincenzo	58	1610612750	Minnesota Timberwolves
279	1630545	f	0	Terrence Shannon Jr.	18	1610612750	Minnesota Timberwolves
280	1630183	f	0	Jaden McDaniels	49	1610612750	Minnesota Timberwolves
281	1641763	f	0	Julian Phillips	5	1610612750	Minnesota Timberwolves
282	1630162	f	2	Anthony Edwards	52	1610612750	Minnesota Timberwolves
283	204060	f	0	Joe Ingles	60	1610612750	Minnesota Timberwolves
284	1630538	f	0	Bones Hyland	23	1610612750	Minnesota Timberwolves
285	201144	f	0	Mike Conley	120	1610612750	Minnesota Timberwolves
286	1629675	f	0	Naz Reid	48	1610612750	Minnesota Timberwolves
287	203937	f	0	Kyle Anderson	76	1610612750	Minnesota Timberwolves
288	1630245	f	0	Ayo Dosunmu	15	1610612750	Minnesota Timberwolves
289	1642389	f	0	Zyon Pullin	0	1610612750	Minnesota Timberwolves
290	1642866	f	0	Joan Beringer	5	1610612750	Minnesota Timberwolves
291	1641740	f	0	Jaylen Clark	11	1610612750	Minnesota Timberwolves
292	1642402	f	0	Enrique Freeman	0	1610612750	Minnesota Timberwolves
293	203497	f	4	Rudy Gobert	96	1610612750	Minnesota Timberwolves
294	203944	f	2	Julius Randle	42	1610612750	Minnesota Timberwolves
295	1642911	f	0	Rocco Zikarsky	0	1610612750	Minnesota Timberwolves
296	1631169	f	0	Josh Minott	11	1610612751	Brooklyn Nets
297	1630533	f	0	Ziaire Williams	14	1610612751	Brooklyn Nets
298	1642874	f	0	Danny Wolf	0	1610612751	Brooklyn Nets
299	1642962	f	0	Drake Powell	0	1610612751	Brooklyn Nets
300	1642856	f	0	Egor Dëmin	0	1610612751	Brooklyn Nets
301	1630604	f	0	E.J. Liddell	1	1610612751	Brooklyn Nets
302	1630623	f	0	Tyson Etienne	0	1610612751	Brooklyn Nets
303	1629611	f	0	Terance Mann	43	1610612751	Brooklyn Nets
304	1629008	f	0	Michael Porter Jr.	75	1610612751	Brooklyn Nets
305	1641869	f	0	Malachi Smith	0	1610612751	Brooklyn Nets
306	1630549	f	0	Day'Ron Sharpe	3	1610612751	Brooklyn Nets
307	1641730	f	0	Noah Clowney	0	1610612751	Brooklyn Nets
308	1630592	f	0	Jalen Wilson	0	1610612751	Brooklyn Nets
309	1630534	f	0	Ochai Agbaji	0	1610612751	Brooklyn Nets
310	1643052	f	0	Chaney Johnson	0	1610612751	Brooklyn Nets
311	1629651	f	0	Nic Claxton	20	1610612751	Brooklyn Nets
312	1642879	f	0	Ben Saraf	0	1610612751	Brooklyn Nets
313	1642849	f	0	Nolan Traore	0	1610612751	Brooklyn Nets
314	203903	f	0	Jordan Clarkson	61	1610612752	New York Knicks
315	1641794	f	0	Dillon Jones	10	1610612752	New York Knicks
316	1630540	f	0	Miles McBride	58	1610612752	New York Knicks
317	1628404	f	0	Josh Hart	61	1610612752	New York Knicks
318	1642359	f	0	Pacôme Dadiet	9	1610612752	New York Knicks
319	1630631	f	0	Jose Alvarado	28	1610612752	New York Knicks
320	1628384	f	0	OG Anunoby	71	1610612752	New York Knicks
321	1641755	f	0	Kevin McCullar Jr.	0	1610612752	New York Knicks
322	1628973	f	3	Jalen Brunson	86	1610612752	New York Knicks
323	1642278	f	0	Tyler Kolek	11	1610612752	New York Knicks
324	1631110	f	0	Jeremy Sochan	8	1610612752	New York Knicks
325	1629011	f	0	Mitchell Robinson	53	1610612752	New York Knicks
326	1628969	f	0	Mikal Bridges	76	1610612752	New York Knicks
327	1626157	f	3	Karl-Anthony Towns	69	1610612752	New York Knicks
328	1629013	f	0	Landry Shamet	83	1610612752	New York Knicks
329	1641998	f	0	Trey Jemison III	0	1610612752	New York Knicks
330	1642885	f	0	Mohamed Diawara	6	1610612752	New York Knicks
331	1630574	f	0	Ariel Hukporti	13	1610612752	New York Knicks
332	1631457	f	0	Alex Morales	0	1610612753	Orlando Magic
333	1641710	f	0	Anthony Black	14	1610612753	Orlando Magic
334	1628371	f	0	Jonathan Isaac	17	1610612753	Orlando Magic
335	1628975	f	0	Jevon Carter	25	1610612753	Orlando Magic
336	1630217	f	0	Desmond Bane	34	1610612753	Orlando Magic
337	1630591	f	0	Jalen Suggs	14	1610612753	Orlando Magic
338	1631094	f	0	Paolo Banchero	19	1610612753	Orlando Magic
339	1631288	f	0	Jamal Cain	7	1610612753	Orlando Magic
340	1642859	f	0	Jase Richardson	1	1610612753	Orlando Magic
341	1641724	f	0	Jett Howard	4	1610612753	Orlando Magic
342	1630658	f	0	Colin Castleton	0	1610612753	Orlando Magic
343	1629021	f	0	Moritz Wagner	9	1610612753	Orlando Magic
344	1630532	f	0	Franz Wagner	16	1610612753	Orlando Magic
345	1641783	f	0	Tristan da Silva	9	1610612753	Orlando Magic
346	1628976	f	0	Wendell Carter Jr.	19	1610612753	Orlando Magic
347	1629048	f	0	Goga Bitadze	11	1610612753	Orlando Magic
348	1642869	f	0	Noah Penda	1	1610612753	Orlando Magic
349	1630169	f	2	Tyrese Haliburton	38	1610612754	Indiana Pacers
350	1630167	f	0	Obi Toppin	56	1610612754	Indiana Pacers
351	1629614	f	0	Andrew Nembhard	40	1610612754	Indiana Pacers
352	1643007	f	0	Taelon Peter	0	1610612754	Indiana Pacers
353	1641716	f	0	Jarace Walker	21	1610612754	Indiana Pacers
354	1642880	f	0	Kam Jones	0	1610612754	Indiana Pacers
355	204456	f	0	T.J. McConnell	62	1610612754	Indiana Pacers
356	1630695	f	0	Micah Potter	0	1610612754	Indiana Pacers
357	1642277	f	0	Johnny Furphy	11	1610612754	Indiana Pacers
358	1641771	f	0	Jalen Slawson	0	1610612754	Indiana Pacers
359	1630174	f	0	Aaron Nesmith	60	1610612754	Indiana Pacers
360	1641738	f	0	Kobe Brown	6	1610612754	Indiana Pacers
361	1641767	f	0	Ben Sheppard	38	1610612754	Indiana Pacers
362	1631245	f	0	Quenton Jackson	0	1610612754	Indiana Pacers
363	1630643	f	0	Jay Huff	2	1610612754	Indiana Pacers
364	1627826	f	0	Ivica Zubac	52	1610612754	Indiana Pacers
365	1627783	f	2	Pascal Siakam	93	1610612754	Indiana Pacers
366	1630679	f	0	Ethan Thompson	0	1610612754	Indiana Pacers
367	1630178	f	1	Tyrese Maxey	52	1610612755	Philadelphia 76ers
368	203083	f	1	Andre Drummond	28	1610612755	Philadelphia 76ers
369	1629656	f	0	Quentin Grimes	20	1610612755	Philadelphia 76ers
370	200768	f	1	Kyle Lowry	138	1610612755	Philadelphia 76ers
371	202331	f	6	Paul George	125	1610612755	Philadelphia 76ers
372	1626162	f	0	Kelly Oubre Jr.	35	1610612755	Philadelphia 76ers
373	1642348	f	0	Justin Edwards	9	1610612755	Philadelphia 76ers
374	1630570	f	0	Trendon Watford	7	1610612755	Philadelphia 76ers
375	1631207	f	0	Dalen Terry	7	1610612755	Philadelphia 76ers
376	1630699	f	0	MarJon Beauchamp	6	1610612755	Philadelphia 76ers
377	203954	f	5	Joel Embiid	66	1610612755	Philadelphia 76ers
378	1641780	f	0	Johni Broome	2	1610612755	Philadelphia 76ers
379	1631213	f	0	Tyrese Martin	0	1610612755	Philadelphia 76ers
380	1631230	f	0	Dominick Barlow	9	1610612755	Philadelphia 76ers
381	1641737	f	0	Adem Bona	10	1610612755	Philadelphia 76ers
382	1631133	f	0	Jabari Walker	6	1610612755	Philadelphia 76ers
383	1642845	f	0	VJ Edgecombe	11	1610612755	Philadelphia 76ers
384	1626220	f	0	Royce O'Neale	52	1610612756	Phoenix Suns
385	1642346	f	0	Ryan Dunn	4	1610612756	Phoenix Suns
386	1626164	f	2	Devin Booker	51	1610612756	Phoenix Suns
387	1629599	f	0	Amir Coffey	24	1610612756	Phoenix Suns
388	1628415	f	0	Dillon Brooks	33	1610612756	Phoenix Suns
389	1630224	f	0	Jalen Green	11	1610612756	Phoenix Suns
390	1629312	f	0	Haywood Highsmith	37	1610612756	Phoenix Suns
391	1628960	f	0	Grayson Allen	28	1610612756	Phoenix Suns
392	1642863	f	0	Khaman Maluach	4	1610612756	Phoenix Suns
393	1642345	f	0	Oso Ighodaro	4	1610612756	Phoenix Suns
394	1631221	f	0	Collin Gillespie	4	1610612756	Phoenix Suns
395	1642886	f	0	Koby Brea	0	1610612756	Phoenix Suns
396	1631109	f	0	Mark Williams	0	1610612756	Phoenix Suns
397	1631123	f	0	Jamaree Bouyea	4	1610612756	Phoenix Suns
398	1630587	f	0	Isaiah Livers	0	1610612756	Phoenix Suns
399	1642853	f	0	Rasheer Fleming	4	1610612756	Phoenix Suns
400	1643047	f	0	CJ Huntley	0	1610612756	Phoenix Suns
401	1630692	f	0	Jordan Goodwin	5	1610612756	Phoenix Suns
402	1643257	f	0	Jayson Kent	0	1610612757	Portland Trail Blazers
403	1630703	f	0	Scoot Henderson	5	1610612757	Portland Trail Blazers
404	203081	f	7	Damian Lillard	68	1610612757	Portland Trail Blazers
405	1631104	f	0	Blake Wesley	4	1610612757	Portland Trail Blazers
406	1631126	f	0	Caleb Love	0	1610612757	Portland Trail Blazers
407	1642959	f	0	Chris Youngblood	0	1610612757	Portland Trail Blazers
408	1629680	f	0	Matisse Thybulle	29	1610612757	Portland Trail Blazers
409	201950	f	0	Jrue Holiday	102	1610612757	Portland Trail Blazers
410	1630166	f	0	Deni Avdija	5	1610612757	Portland Trail Blazers
411	203924	f	0	Jerami Grant	40	1610612757	Portland Trail Blazers
412	1642905	f	0	Yang Hansen	4	1610612757	Portland Trail Blazers
413	1631101	f	0	Shaedon Sharpe	5	1610612757	Portland Trail Blazers
414	1642270	f	0	Donovan Clingan	5	1610612757	Portland Trail Blazers
415	1631200	f	0	Kris Murray	5	1610612757	Portland Trail Blazers
416	1630249	f	0	Vít Krejčí	4	1610612757	Portland Trail Blazers
417	1641739	f	0	Toumani Camara	5	1610612757	Portland Trail Blazers
418	1629057	f	0	Robert Williams III	61	1610612757	Portland Trail Blazers
419	1631321	f	0	Sidy Cissoko	4	1610612757	Portland Trail Blazers
420	1628370	f	0	Malik Monk	7	1610612758	Sacramento Kings
421	1642363	f	0	Nique Clifford	0	1610612758	Sacramento Kings
422	1630165	f	0	Killian Hayes	0	1610612758	Sacramento Kings
423	203926	f	0	Doug McDermott	25	1610612758	Sacramento Kings
424	203897	f	0	Zach LaVine	4	1610612758	Sacramento Kings
425	1630173	f	0	Precious Achiuwa	26	1610612758	Sacramento Kings
426	201942	f	3	DeMar DeRozan	63	1610612758	Sacramento Kings
427	1627734	f	2	Domantas Sabonis	20	1610612758	Sacramento Kings
428	1631099	f	0	Keegan Murray	7	1610612758	Sacramento Kings
429	1629631	f	0	De'Andre Hunter	24	1610612758	Sacramento Kings
430	201566	f	9	Russell Westbrook	135	1610612758	Sacramento Kings
431	1629234	f	0	Drew Eubanks	6	1610612758	Sacramento Kings
432	1642269	f	0	Devin Carter	0	1610612758	Sacramento Kings
433	1631116	f	0	Patrick Baldwin Jr.	3	1610612758	Sacramento Kings
434	1641815	f	0	Isaiah Stevens	0	1610612758	Sacramento Kings
435	1631342	f	0	Daeqwon Plowden	0	1610612758	Sacramento Kings
436	1642928	f	0	Dylan Cardwell	0	1610612758	Sacramento Kings
437	1642875	f	0	Maxime Raynaud	0	1610612758	Sacramento Kings
438	1629162	f	0	Jordan McLaughlin	23	1610612759	San Antonio Spurs
439	1641705	f	1	Victor Wembanyama	22	1610612759	San Antonio Spurs
440	1642844	f	0	Dylan Harper	23	1610612759	San Antonio Spurs
441	1629640	f	0	Keldon Johnson	23	1610612759	San Antonio Spurs
442	1628368	f	1	De'Aaron Fox	28	1610612759	San Antonio Spurs
443	1642264	f	0	Stephon Castle	23	1610612759	San Antonio Spurs
444	1628436	f	0	Luke Kornet	66	1610612759	San Antonio Spurs
445	203482	f	0	Kelly Olynyk	57	1610612759	San Antonio Spurs
446	1642868	f	0	Carter Bryant	22	1610612759	San Antonio Spurs
447	1641801	f	0	Emanuel Miller	0	1610612759	San Antonio Spurs
448	202687	f	0	Bismack Biyombo	49	1610612759	San Antonio Spurs
449	1630170	f	0	Devin Vassell	23	1610612759	San Antonio Spurs
450	1642357	f	0	David Jones Garcia	0	1610612759	San Antonio Spurs
451	1630577	f	0	Julian Champagnie	23	1610612759	San Antonio Spurs
452	203084	f	0	Harrison Barnes	91	1610612759	San Antonio Spurs
453	1630322	f	0	Lindy Waters III	12	1610612759	San Antonio Spurs
454	203486	f	0	Mason Plumlee	77	1610612759	San Antonio Spurs
455	1631127	f	0	Harrison Ingram	0	1610612759	San Antonio Spurs
457	1642272	f	0	Jared McCain	15	1610612760	Oklahoma City Thunder
458	1629652	f	0	Luguentz Dort	54	1610612760	Oklahoma City Thunder
459	1631119	f	0	Jaylin Williams	42	1610612760	Oklahoma City Thunder
460	1631096	f	1	Chet Holmgren	48	1610612760	Oklahoma City Thunder
461	1631114	f	1	Jalen Williams	38	1610612760	Oklahoma City Thunder
462	1627936	f	0	Alex Caruso	69	1610612760	Oklahoma City Thunder
463	1630198	f	0	Isaiah Joe	55	1610612760	Oklahoma City Thunder
464	1642850	f	0	Thomas Sorber	0	1610612760	Oklahoma City Thunder
465	1642362	f	0	Payton Sandfort	0	1610612760	Oklahoma City Thunder
466	1642382	f	0	Branden Carlson	0	1610612760	Oklahoma City Thunder
467	1630598	f	0	Aaron Wiggins	45	1610612760	Oklahoma City Thunder
468	1641717	f	0	Cason Wallace	48	1610612760	Oklahoma City Thunder
469	1642964	f	0	Brooks Barnhizer	0	1610612760	Oklahoma City Thunder
470	1642349	f	0	Ajay Mitchell	23	1610612760	Oklahoma City Thunder
471	1629026	f	0	Kenrich Williams	34	1610612760	Oklahoma City Thunder
472	1642260	f	0	Nikola Topić	9	1610612760	Oklahoma City Thunder
473	1628392	f	0	Isaiah Hartenstein	64	1610612760	Oklahoma City Thunder
474	1630639	f	0	A.J. Lawson	17	1610612761	Toronto Raptors
475	1641711	f	0	Gradey Dick	3	1610612761	Toronto Raptors
476	1642367	f	0	Jonathan Mogbo	3	1610612761	Toronto Raptors
477	1627742	f	0	Brandon Ingram	15	1610612761	Toronto Raptors
478	1630567	f	0	Scottie Barnes	11	1610612761	Toronto Raptors
479	1630193	f	0	Immanuel Quickley	13	1610612761	Toronto Raptors
480	1629628	f	0	RJ Barrett	23	1610612761	Toronto Raptors
481	1642867	f	0	Collin Murray-Boyles	7	1610612761	Toronto Raptors
482	1642266	f	0	Ja'Kobe Walter	7	1610612761	Toronto Raptors
483	202066	f	0	Garrett Temple	33	1610612761	Toronto Raptors
484	1627751	f	0	Jakob Poeltl	29	1610612761	Toronto Raptors
485	1642347	f	0	Jamal Shead	7	1610612761	Toronto Raptors
486	1642935	f	0	Chucky Hepburn	0	1610612761	Toronto Raptors
487	1631218	f	0	Trayce Jackson-Davis	12	1610612761	Toronto Raptors
488	1630572	f	0	Sandro Mamukelashvili	7	1610612761	Toronto Raptors
489	1642918	f	0	Alijah Martin	0	1610612761	Toronto Raptors
490	1642419	f	0	Jamison Battle	6	1610612761	Toronto Raptors
491	1643060	f	0	Hayden Gray	0	1610612762	Utah Jazz
492	1642396	f	0	Blake Hinson	0	1610612762	Utah Jazz
493	1641718	f	0	Keyonte George	0	1610612762	Utah Jazz
494	1642262	f	0	Cody Williams	0	1610612762	Utah Jazz
495	1642268	f	0	Isaiah Collier	0	1610612762	Utah Jazz
496	1629004	f	0	Svi Mykhailiuk	11	1610612762	Utah Jazz
497	1641989	f	0	Elijah Harkless	0	1610612762	Utah Jazz
498	1642846	f	0	Ace Bailey	0	1610612762	Utah Jazz
499	1628991	f	0	Jaren Jackson Jr.	27	1610612762	Utah Jazz
500	1643016	f	0	Bez Mbeng	0	1610612762	Utah Jazz
501	1642271	f	0	Kyle Filipowski	0	1610612762	Utah Jazz
502	1628374	f	0	Lauri Markkanen	0	1610612762	Utah Jazz
503	1631117	f	0	Walker Kessler	0	1610612762	Utah Jazz
504	1641729	f	0	Brice Sensabaugh	0	1610612762	Utah Jazz
505	203994	f	0	Jusuf Nurkić	20	1610612762	Utah Jazz
506	1631131	f	0	Oscar Tshiebwe	0	1610612762	Utah Jazz
507	201567	f	2	Kevin Love	88	1610612762	Utah Jazz
508	1629723	f	0	John Konchar	18	1610612762	Utah Jazz
509	1642942	f	0	Jahmai Mashack	0	1610612763	Memphis Grizzlies
510	1642377	f	0	Jaylen Wells	0	1610612763	Memphis Grizzlies
511	1630590	f	0	Scotty Pippen Jr.	4	1610612763	Memphis Grizzlies
512	1629660	f	0	Ty Jerome	9	1610612763	Memphis Grizzlies
513	203484	f	0	Kentavious Caldwell-Pope	67	1610612763	Memphis Grizzlies
514	1642383	f	0	Walter Clayton Jr.	0	1610612763	Memphis Grizzlies
515	1630583	f	0	Santi Aldama	10	1610612763	Memphis Grizzlies
516	1642914	f	0	Javon Small	0	1610612763	Memphis Grizzlies
517	1629630	f	1	Ja Morant	22	1610612763	Memphis Grizzlies
518	1641744	f	0	Zach Edey	4	1610612763	Memphis Grizzlies
519	1629634	f	0	Brandon Clarke	14	1610612763	Memphis Grizzlies
520	1641765	f	0	Olivier-Maxence Prosper	3	1610612763	Memphis Grizzlies
521	1641712	f	0	Rayan Rupert	0	1610612763	Memphis Grizzlies
522	1641707	f	0	Taylor Hendricks	0	1610612763	Memphis Grizzlies
523	1642907	f	0	Cedric Coward	0	1610612763	Memphis Grizzlies
524	1642285	f	0	Cam Spencer	0	1610612763	Memphis Grizzlies
525	1641713	f	0	GG Jackson	0	1610612763	Memphis Grizzlies
526	201959	f	0	Taj Gibson	71	1610612763	Memphis Grizzlies
527	1642882	f	0	Julian Reese	0	1610612764	Washington Wizards
528	1641731	f	0	Bilal Coulibaly	0	1610612764	Washington Wizards
529	1641774	f	0	Tristan Vukcevic	0	1610612764	Washington Wizards
530	1641715	f	0	Cam Whitmore	3	1610612764	Washington Wizards
531	1629027	f	1	Trae Young	27	1610612764	Washington Wizards
532	1626156	f	0	D'Angelo Russell	32	1610612764	Washington Wizards
533	1642364	f	0	Jamir Watkins	0	1610612764	Washington Wizards
534	1642267	f	0	Bub Carrington	0	1610612764	Washington Wizards
535	1630702	f	0	Jaden Hardy	19	1610612764	Washington Wizards
536	1630551	f	0	Justin Champagnie	4	1610612764	Washington Wizards
537	1642848	f	0	Tre Johnson	0	1610612764	Washington Wizards
538	1641778	f	0	Leaky Black	0	1610612764	Washington Wizards
539	1630536	f	0	Sharife Cooper	0	1610612764	Washington Wizards
540	1630264	f	0	Anthony Gill	4	1610612764	Washington Wizards
541	1642273	f	0	Kyshawn George	0	1610612764	Washington Wizards
542	1642259	f	0	Alex Sarr	0	1610612764	Washington Wizards
543	203076	f	5	Anthony Davis	60	1610612764	Washington Wizards
544	1642860	f	0	Will Riley	0	1610612764	Washington Wizards
545	1631105	f	1	Jalen Duren	20	1610612765	Detroit Pistons
546	1630595	f	2	Cade Cunningham	20	1610612765	Detroit Pistons
547	1642403	f	0	Isaac Jones	0	1610612765	Detroit Pistons
548	1641842	f	0	Ronald Holland II	14	1610612765	Detroit Pistons
549	1630194	f	0	Paul Reed	46	1610612765	Detroit Pistons
550	1627747	f	0	Caris LeVert	38	1610612765	Detroit Pistons
551	1641709	f	0	Ausar Thompson	20	1610612765	Detroit Pistons
552	202699	f	0	Tobias Harris	81	1610612765	Detroit Pistons
553	1631111	f	0	Wendell Moore Jr.	7	1610612765	Detroit Pistons
554	1642404	f	0	Chaz Lanier	3	1610612765	Detroit Pistons
555	1642450	f	0	Daniss Jenkins	14	1610612765	Detroit Pistons
556	1631204	f	0	Marcus Sasser	6	1610612765	Detroit Pistons
557	1628989	f	0	Kevin Huerter	35	1610612765	Detroit Pistons
558	1630191	f	0	Isaiah Stewart	15	1610612765	Detroit Pistons
559	1629750	f	0	Javonte Green	23	1610612765	Detroit Pistons
560	1642449	f	0	Tolu Smith	3	1610612765	Detroit Pistons
561	1629130	f	0	Duncan Robinson	83	1610612765	Detroit Pistons
562	1628970	f	0	Miles Bridges	0	1610612766	Charlotte Hornets
563	1630163	f	0	LaMelo Ball	0	1610612766	Charlotte Hornets
564	1629684	f	0	Grant Williams	61	1610612766	Charlotte Hornets
565	1629632	f	0	Coby White	5	1610612766	Charlotte Hornets
566	1642883	f	0	Sion James	0	1610612766	Charlotte Hornets
567	1642851	f	0	Kon Knueppel	0	1610612766	Charlotte Hornets
568	1630182	f	0	Josh Green	39	1610612766	Charlotte Hornets
569	1641750	f	0	Ryan Kalkbrenner	0	1610612766	Charlotte Hornets
570	1641810	f	0	Antonio Reeves	0	1610612766	Charlotte Hornets
571	1631217	f	0	Moussa Diabaté	0	1610612766	Charlotte Hornets
572	1641790	f	0	PJ Hall	0	1610612766	Charlotte Hornets
573	1641787	f	0	Tosan Evbuomwan	0	1610612766	Charlotte Hornets
574	1626192	f	0	Pat Connaughton	86	1610612766	Charlotte Hornets
575	1630544	f	0	Tre Mann	0	1610612766	Charlotte Hornets
576	1641706	f	0	Brandon Miller	0	1610612766	Charlotte Hornets
577	1630214	f	0	Xavier Tillman	27	1610612766	Charlotte Hornets
578	1642275	f	0	Tidjane Salaün	0	1610612766	Charlotte Hornets
579	1642862	f	0	Liam McNeeley	0	1610612766	Charlotte Hornets
580	2544	f	21	LeBron James	302	1610612747	Los Angeles Lakers
581	201939	f	11	Stephen Curry	155	1610612744	Golden State Warriors
456	1628983	f	4	Shai Gilgeous-Alexander	61	1610612760	Oklahoma City Thunder
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
-- PostgreSQL database dump complete
--

\unrestrict 4dKzR4PxKecaSYqra5Cghn4JBT9vxf58vsfD1hyBn8cPuEO0Qo3eCCvr4bFtD9H

