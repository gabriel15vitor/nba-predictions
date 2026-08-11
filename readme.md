# NBA win probability predictor

A REST API built with Java and Spring Boot that predicts win probability between two NBA teams and ranks all teams by predicted championship strength, based on real season and player statistics. Includes a lightweight web interface for testing predictions interactively.

## Overview

This project ingests NBA team and player statistics from the official NBA stats API, stores them in a PostgreSQL database, and exposes a REST API with two prediction modes:

- **Matchup prediction** — win probability between any two teams
- **Champion prediction** — all teams ranked by predicted championship strength, factoring in team performance and active roster strength (injured players are excluded)

Both use the most recent season available in the database automatically. A simple frontend lets you pick two teams and see the result visually, or browse the full championship ranking.

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
- `fetch_players.py` — pulls current rosters, All-NBA selection counts, and career playoff games for every player in the league, and posts them in batch

> **Note:** balldontlie.io was used for initial team metadata during early development and has since been fully replaced by `nba_api` as the single source of truth.

## Prediction models

### Matchup win probability

Compares two teams using a weighted score fed into a sigmoid function, which keeps the result mathematically bounded between 0–100% regardless of how extreme the input stats are (a plain ratio formula breaks down with negative stats like `net_rating`):

```
score = (netRating × 0.4) + (winPct × 0.3) + (efgPct × 0.3)
probability = 1 / (1 + e^(-k × (homeScore - awayScore)))
```

### Champion ranking

Ranks all teams in the current season by a championship strength score, inspired by published research on NBA champion prediction models. The research model relied on award-voting shares and individual player data pulled via web scraping; this project adapts the same idea using data reliably available through `nba_api`'s bulk endpoints — team advanced stats plus each active player's All-NBA selection count and career playoff games, averaged across the team's **non-injured** roster:

```
championScore = (netRating × 0.35) + (winPct × 0.2) + (efgPct × 0.15)
              + (avgAllNbaSelections × 0.2) + ((avgPlayoffGames / 50) × 0.1)
```

Marking a player as injured removes them from their team's roster average, lowering that team's predicted championship strength — a simple stand-in for the real-world effect of losing a key player.

> **Known limitation:** roster data reflects each player's *current* team, not a historical snapshot per season. This is accurate for the latest season (which the app always uses) but would be inaccurate if querying an older season's championship odds.

Both formulas use **advanced stats** (`NET_RATING`, `EFG_PCT` — pace-adjusted point differential and effective field goal percentage) rather than raw points, since these are stronger predictors of team quality.

## Features

- Fetches and stores NBA advanced team statistics (wins, losses, win percentage, net rating, effective field goal percentage) by season
- Fetches and stores full player rosters with All-NBA selection counts and career playoff games
- Manual injury flag per player (`PATCH /api/players/{id}/injury`), factored into the champion ranking
- Prevents duplicate data on repeated ingestion (`existsByTeamIdAndSeason`, `existsByApiPlayerId` checks)
- Automatically detects the most recent season in the database — no hardcoded season strings
- Python ingestion scripts automatically calculate which seasons/rosters to fetch based on the current date
- REST endpoints returning structured JSON
- Simple web UI with two pages: head-to-head matchup predictor and full championship ranking
- Fully containerized with Docker Compose, **seeded with real data automatically** on first startup — no manual script run required to try the project

## API endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| `GET` | `/api/team-stats/teams` | Returns all teams available for the current (latest) season |
| `POST` | `/api/team-stats/batch` | Receives a batch of team statistics from the Python script |
| `GET` | `/predict?home={teamId}&away={teamId}` | Returns win probability for a matchup |
| `GET` | `/predict/champion` | Returns all teams ranked by championship strength score |
| `POST` | `/api/players/batch` | Receives a batch of player data from the Python script |
| `GET` | `/api/players/team/{teamId}` | Returns the roster for a given team |
| `PATCH` | `/api/players/{playerId}/injury?isInjured={true\|false}` | Marks a player as injured or healthy |

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

`fetch_players.py` fetches data for all ~530 active players and can take 10-15 minutes due to NBA API rate limiting.

### Refreshing data (either option)

Both ingestion scripts are safe to re-run at any time — existing records are skipped, only new data is inserted:

```bash
python data-scripts/fetch_team_stats.py
python data-scripts/fetch_players.py
```

> These scripts are intended to be run manually or on a schedule outside the app, not triggered from the API itself — keeping data ingestion and API serving as separate concerns.

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
│       └── champion.html   championship ranking
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
- [ ] Frontend page for browsing/toggling player injury status
- [ ] Per-season roster snapshots (currently only current rosters are tracked)
- [ ] Historical prediction accuracy tracking
- [ ] Swagger / OpenAPI documentation
- [x] Championship odds across all teams
- [x] Player-level signals (All-NBA selections, playoff experience) with injury exclusion
- [x] Dynamic season selection
- [x] Normalize probability output with a sigmoid function
- [x] Containerize with Docker Compose, seeded with real data

## Author

**Gabriel Barbosa** — Systems Analysis and Development student at Fatec Campinas
[GitHub](https://github.com/gabriel15vitor)