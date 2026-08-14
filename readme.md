# NBA win probability predictor

A REST API built with Java and Spring Boot that predicts win probability between two NBA teams and ranks all teams by predicted championship strength, based on real season and player statistics — including the ability to flag injured players and see the effect on predictions in real time. Includes a lightweight web interface for testing predictions interactively.

## Overview

This project ingests NBA team and player statistics from the official NBA stats API, stores them in a PostgreSQL database, and exposes a REST API with two prediction modes:

- **Matchup prediction** — win probability between any two teams, factoring in both team performance and active roster strength
- **Champion prediction** — all teams ranked by predicted championship strength

Both use the most recent season available in the database automatically, and both exclude any player currently flagged as injured from their team's roster strength calculation. A simple frontend lets you pick two teams and see the result visually, browse the full championship ranking, or manage each team's roster and injury flags.

It was built as a portfolio project to demonstrate backend development skills: REST API design, layered architecture, database integration, external data ingestion, and clean separation of concerns.

## Tech stack

- **Java 21** + **Spring Boot 3.5**
- **PostgreSQL** — data persistence
- **Spring Data JPA** — database access
- **Lombok** — reduces boilerplate
- **Python** (`nba_api`) — official NBA stats ingestion scripts
- **Docker / Docker Compose** — containerized runtime, seeded with real data on first startup
- **HTML / CSS / JavaScript** — frontend (no frameworks)

## Architecture

The application follows a standard layered architecture:

```
Controller  → receives HTTP requests, returns JSON
Service     → business logic (win probability & champion score calculation)
Repository  → database access via Spring Data JPA
Model       → entities mapped to PostgreSQL tables
```

Two Python scripts using the official `nba_api` library feed the database:
- `fetch_team_stats.py` — pulls advanced per-season team statistics for the last 3 seasons (calculated automatically from today's date) and posts them in batch
- `fetch_players.py` — pulls current rosters, recent All-NBA selection counts (last 2 seasons), and career playoff games for every active player, upserts them (correctly handling trades), and prunes players who've left the league

> **Note:** balldontlie.io was used for initial team metadata during early development and has since been fully replaced by `nba_api` as the single source of truth. Both ingestion scripts are meant to be run manually or on a schedule outside the app — not triggered from the API itself — keeping data ingestion and API serving as separate concerns.

## Prediction models

### Matchup win probability

Compares two teams using a weighted score fed into a sigmoid function, which keeps the result mathematically bounded between 0–100% regardless of how extreme the input stats are (a plain ratio formula breaks down with negative stats like `net_rating`):

```
teamScore   = (netRating × 0.4) + (winPct × 0.3) + (efgPct × 0.3)
rosterScore = (avgAllNbaCount × 0.6) + ((avgPlayoffGames / 50) × 0.4)
score       = (teamScore × 0.8) + (rosterScore × 0.2)

probability = 1 / (1 + e^(-k × (homeScore - awayScore)))
```

`avgAllNbaCount` and `avgPlayoffGames` are averaged across each team's **non-injured** roster only — marking a player as injured removes them from their team's average, lowering that team's win probability. Team performance stats remain the dominant signal; roster strength is a smaller adjustment layered on top.

### Champion ranking

Ranks all teams in the current season by a championship strength score, inspired by published research on NBA champion prediction models. The research model relied on award-voting shares and individual player data pulled via web scraping; this project adapts the same idea using data reliably available through `nba_api`'s bulk endpoints:

```
championScore = (netRating × 0.35) + (winPct × 0.2) + (efgPct × 0.15)
              + (avgAllNbaCount × 0.2) + ((avgPlayoffGames / 50) × 0.1)
```

Same injury-exclusion logic applies here.

> **Why only the last 2 seasons of All-NBA selections?** Counting a player's full career total would let an aging star with many past selections but a diminished current role inflate a rebuilding team's score. Limiting the count to recent seasons keeps the signal tied to current form rather than reputation.

> **Known limitation:** roster data reflects each player's *current* team, not a historical snapshot per season. This is accurate for the latest season (which the app always uses) but would be inaccurate if querying an older season's odds. Retired/waived players are pruned on each full data refresh; players who are traded are updated in place rather than duplicated.

Both formulas use **advanced team stats** (`NET_RATING`, `EFG_PCT` — pace-adjusted point differential and effective field goal percentage) rather than raw points, since these are stronger predictors of team quality.

## Features

- Fetches and stores NBA advanced team statistics (wins, losses, win percentage, net rating, effective field goal percentage) by season
- Fetches and stores full player rosters with recent All-NBA selection counts and career playoff games
- Manual injury flag per player, factored into both matchup and champion predictions in real time
- Upsert logic correctly handles trades (updates existing player records rather than duplicating); a full data refresh prunes players who've left the league
- Prevents duplicate data on repeated team-stats ingestion (`existsByTeamIdAndSeason` check)
- Automatically detects the most recent season in the database — no hardcoded season strings
- Python ingestion scripts automatically calculate which seasons/rosters to fetch based on the current date
- REST endpoints returning structured JSON
- Simple web UI with three pages: head-to-head matchup predictor, full championship ranking, and roster/injury management
- Fully containerized with Docker Compose, **seeded with real data automatically** on first startup — no manual script run required to try the project

## API endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| `GET` | `/api/team-stats/teams` | Returns all teams available for the current (latest) season |
| `POST` | `/api/team-stats/batch` | Receives a batch of team statistics from the Python script |
| `GET` | `/predict?home={teamId}&away={teamId}` | Returns win probability for a matchup, factoring in active roster strength |
| `GET` | `/predict/champion` | Returns all teams ranked by championship strength score |
| `POST` | `/api/players/batch` | Upserts a batch of player data from the Python script |
| `GET` | `/api/players/team/{teamId}` | Returns the roster for a given team |
| `PATCH` | `/api/players/{playerId}/injury?isInjured={true\|false}` | Marks a player as injured or healthy |
| `POST` | `/api/players/prune` | Removes players not present in the given list of active player IDs (used after a full roster refresh) |

### Example response — `/predict`

```json
{
    "homeTeam": "Los Angeles Lakers",
    "awayTeam": "Golden State Warriors",
    "homeProbability": 45.32,
    "awayProbability": 54.68
}
```

### Example response — `/predict/champion`

```json
[
    {
        "teamName": "Boston Celtics",
        "score": 4.91,
        "winPct": 0.744,
        "netRating": 9.4,
        "efgPct": 0.561,
        "avgAllNbaSelections": 2.3,
        "avgPlayoffGames": 61.4
    }
]
```

## Getting started

### Option A — Docker (recommended)

The fastest way to run the whole project. The database is **seeded automatically** with real team and player data on first startup — no extra steps needed to try it out.

**Prerequisites:** Docker Desktop

```bash
git clone https://github.com/gabriel15vitor/nba-predictor.git
cd nba-predictor
docker compose up --build
```

The API will be available at `http://localhost:8080` and the web interface at `http://localhost:8080/`. PostgreSQL is exposed on `localhost:5432`.

> The seed only runs the first time the database volume is created. To force a fresh reseed later, run `docker compose down -v` before `up --build` again.

### Option B — Run locally

**Prerequisites:**
- Java 21
- Maven
- PostgreSQL
- Python 3.10+ (for the data ingestion scripts)

#### 1. Clone the repository

```bash
git clone https://github.com/gabriel15vitor/nba-predictor.git
cd nba-predictor
```

#### 2. Set up the database

```sql
CREATE DATABASE nba_predictor;
```

#### 3. Configure application properties

Copy the example file and fill in your own credentials:

```bash
cp src/main/resources/application.properties.example src/main/resources/application.properties
```

Edit `application.properties` with your PostgreSQL credentials.

#### 4. Run the application

```bash
./mvnw spring-boot:run
```

The API will be available at `http://localhost:8080` and the web interface at `http://localhost:8080/`.

#### 5. Populate the database

Since Option B doesn't use the seed file, run the ingestion scripts manually (make sure the Java app is running first):

```bash
pip install nba_api requests
python data-scripts/fetch_team_stats.py
python data-scripts/fetch_players.py
```

`fetch_players.py` fetches data for all ~530 active players and can take 10-15 minutes due to NBA API rate limiting. It includes a one-player sanity check before committing to the full run.

### Refreshing data (either option)

Both ingestion scripts are safe to re-run at any time:

```bash
python data-scripts/fetch_team_stats.py
python data-scripts/fetch_players.py
```

- `fetch_team_stats.py` skips seasons/teams already in the database
- `fetch_players.py` updates existing players in place (correctly handling trades) and prunes anyone no longer on any roster

## Managing injuries

Open `http://localhost:8080/roster.html`, pick a team, and toggle the "Injured" checkbox next to any player. The change applies immediately and is reflected the next time you request a matchup or champion prediction — no restart needed.

## Project structure

```
nba-predictor/
├── src/main/java/com/gabrielbarbosa/nba_predictor/
│   ├── controller/     REST endpoints
│   ├── service/        business logic
│   ├── repository/     Spring Data JPA interfaces
│   └── model/          JPA entities and DTOs
├── src/main/resources/
│   ├── application.properties.example
│   ├── application.properties
│   └── static/         frontend (HTML/CSS/JS)
│       ├── index.html      matchup predictor
│       ├── champion.html   championship ranking
│       └── roster.html     roster & injury management
├── Dockerfile
├── docker-compose.yml
├── seed.sql             schema + real data, auto-loaded on first container start
├── .dockerignore
└── data-scripts/
    ├── fetch_team_stats.py
    └── fetch_players.py
```

## Roadmap

- [ ] Series (best-of-7) win probability
- [ ] Conference-level champion prediction
- [ ] Per-season roster snapshots (currently only current rosters are tracked)
- [ ] Historical prediction accuracy tracking
- [ ] Swagger / OpenAPI documentation
- [x] Championship odds across all teams
- [x] Player-level signals (recent All-NBA selections, playoff experience) with injury exclusion
- [x] Injury flagging reflected in matchup predictions, not just champion ranking
- [x] Frontend page for browsing/toggling player injury status
- [x] Dynamic season selection
- [x] Normalize probability output with a sigmoid function
- [x] Containerize with Docker Compose, seeded with real data

## Author

**Gabriel Barbosa** — Systems Analysis and Development student at Fatec Campinas
[GitHub](https://github.com/gabriel15vitor)