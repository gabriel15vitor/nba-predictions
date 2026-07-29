# NBA win probability predictor

A REST API built with Java and Spring Boot that predicts win probability between two NBA teams and ranks all teams by predicted championship strength, based on real season statistics. Includes a lightweight web interface for testing predictions interactively.

## Overview

This project ingests NBA team statistics from the official NBA stats API, stores them in a PostgreSQL database, and exposes a REST API with two prediction modes:

- **Matchup prediction** — win probability between any two teams
- **Champion prediction** — all teams ranked by predicted championship strength

Both use the most recent season available in the database automatically. A simple frontend lets you pick two teams and see the result visually, or browse the full championship ranking.

It was built as a portfolio project to demonstrate backend development skills: REST API design, layered architecture, database integration, external data ingestion, and clean separation of concerns.

## Tech stack

- **Java 21** + **Spring Boot 3.5**
- **PostgreSQL** — data persistence
- **Spring Data JPA** — database access
- **Lombok** — reduces boilerplate
- **Python** (`nba_api`) — official NBA stats ingestion script
- **Docker / Docker Compose** — containerized runtime for the API and database
- **HTML / CSS / JavaScript** — frontend (no frameworks)

## Architecture

The application follows a standard layered architecture:

```
Controller  → receives HTTP requests, returns JSON
Service     → business logic (win probability & champion score calculation)
Repository  → database access via Spring Data JPA
Model       → entities mapped to PostgreSQL tables
```

A Python script using the official `nba_api` library pulls advanced per-season team statistics and posts them to the Java API in batch. It automatically calculates and fetches the last 3 seasons relative to the current date, so it never needs manual updates.

> **Note:** balldontlie.io was used for initial team metadata during early development and has since been fully replaced by `nba_api` as the single source of truth.

## Prediction models

### Matchup win probability

Compares two teams using a weighted score fed into a sigmoid function, which keeps the result mathematically bounded between 0–100% regardless of how extreme the input stats are (a plain ratio formula breaks down with negative stats like `net_rating`):

```
score = (netRating × 0.4) + (winPct × 0.3) + (efgPct × 0.3)
probability = 1 / (1 + e^(-k × (homeScore - awayScore)))
```

### Champion ranking

Ranks all teams in the current season by a championship strength score, inspired by published research on NBA champion prediction models (adapted here to use team-level stats only — see [Roadmap](#roadmap) for planned player-level signals):

```
championScore = (netRating × 0.5) + (winPct × 0.3) + (efgPct × 0.2)
```

Both formulas use **advanced stats** (`NET_RATING`, `EFG_PCT` — pace-adjusted point differential and effective field goal percentage) rather than raw points, since these are stronger predictors of team quality.

## Features

- Fetches and stores NBA advanced team statistics (wins, losses, win percentage, net rating, effective field goal percentage) by season
- Prevents duplicate data on repeated ingestion (`existsByTeamIdAndSeason` check)
- Automatically detects the most recent season in the database — no hardcoded season strings
- Python ingestion script automatically calculates which seasons to fetch based on the current date
- REST endpoints returning structured JSON
- Simple web UI with two pages: head-to-head matchup predictor and full championship ranking
- Fully containerized with Docker Compose — one command to run the API and database together

## API endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| `GET` | `/api/team-stats/teams` | Returns all teams available for the current (latest) season |
| `POST` | `/api/team-stats/batch` | Receives a batch of team statistics from the Python script |
| `GET` | `/predict?home={teamId}&away={teamId}` | Returns win probability for a matchup |
| `GET` | `/predict/champion` | Returns all teams ranked by championship strength score |

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
        "efgPct": 0.561
    },
    {
        "teamName": "Charlotte Hornets",
        "score": -3.42,
        "winPct": 0.232,
        "netRating": -9.1,
        "efgPct": 0.503
    }
]
```

## Getting started

### Option A — Docker (recommended)

The fastest way to run the whole project — API and database — with one command.

**Prerequisites:** Docker Desktop

```bash
git clone https://github.com/gabriel15vitor/nba-predictor.git
cd nba-predictor
docker compose up --build
```

The API will be available at `http://localhost:8080` and the web interface at `http://localhost:8080/`. PostgreSQL is exposed on `localhost:5432`.

Then populate the database (see [Populate the database](#populate-the-database) below).

### Option B — Run locally

**Prerequisites:**
- Java 21
- Maven
- PostgreSQL
- Python 3.10+ (for the data ingestion script)

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

### Populate the database

Install the Python dependencies:

```bash
pip install nba_api requests
```

Run the ingestion script (make sure the Java app is running first, whether via Docker or locally):

```bash
python data-scripts/fetch_team_stats.py
```

This automatically fetches advanced per-game team statistics for the last 3 seasons (relative to today's date) and sends them to the API. Running it again is safe — existing season/team combinations are skipped.

> Note: this script is intended to be run manually/on a schedule outside the app, not triggered from the API itself — keeping data ingestion and API serving as separate concerns.

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
├── .dockerignore
└── data-scripts/
    └── fetch_team_stats.py
```

## Roadmap

- [ ] Series (best-of-7) win probability
- [ ] Conference-level champion prediction
- [ ] Player-level signals (roster talent, MVP-caliber players, injury impact) — would require a new `Player` entity and additional data ingestion
- [ ] Historical prediction accuracy tracking
- [ ] Swagger / OpenAPI documentation
- [x] Championship odds across all teams
- [x] Dynamic season selection
- [x] Normalize probability output with a sigmoid function
- [x] Containerize with Docker Compose

## Author

**Gabriel Barbosa** — Systems Analysis and Development student at Fatec Campinas
[GitHub](https://github.com/gabriel15vitor)