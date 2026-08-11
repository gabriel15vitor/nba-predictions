# NBA Predictor

A Spring Boot application that predicts NBA matchup outcomes and championship odds using team performance plus player-level roster signals. The project combines Java APIs, PostgreSQL persistence, and Python data scripts for ingestion and cleanup.

## Overview

This project stores NBA team statistics and player data in a PostgreSQL database, then exposes a REST API for:

- head-to-head matchup win probability
- championship ranking based on team and roster strength
- player roster management and injury status updates

The app is designed as a portfolio project to demonstrate backend development, data ingestion pipelines, and business logic around sports prediction.

## Tech stack

- Java 21
- Spring Boot 3.x
- Spring Data JPA
- PostgreSQL
- Lombok
- Python 3
- Docker / Docker Compose
- HTML, CSS, JavaScript

## Current architecture

The project is organized in a standard layered structure:

```
Controller → HTTP endpoints and request handling
Service    → prediction logic and business rules
Repository → JPA queries against PostgreSQL
Model      → entities and DTOs
Data scripts → Python import/repair utilities
```

## Data model

The current system uses two main data sources:

- Team statistics: wins, losses, win percentage, net rating, and effective field goal percentage
- Player data: team affiliation, MVP shares, playoff games, and injury flag

This allows the champion model to consider not only team efficiency, but also the strength of the active roster.

## Prediction logic

### Matchup probability

The win probability model compares two teams using a weighted score and a sigmoid function to keep the result bounded between 0 and 100%:

```
score = (netRating × 0.4) + (winPct × 0.3) + (efgPct × 0.3)
probability = 1 / (1 + e^(-k × (homeScore - awayScore)))
```

### Champion ranking

The championship model combines team stats with player roster indicators from active players:

```
score = (netRating × 0.35)
      + (winPct × 0.2)
      + (efgPct × 0.15)
      + (avgAllNba × 0.2)
      + ((avgPlayoffGames / 50) × 0.1)
```

Where:

- `avgAllNba` is the average MVP-share value across healthy players on the roster
- `avgPlayoffGames` is the average playoff experience of active players

## Features

- Team statistics ingestion from NBA data sources
- Player roster ingestion and updates
- Active-player filtering for injury-aware predictions
- Dynamic latest-season detection from the database
- RESTful endpoints for both team and player workflows
- Simple frontend for matchup and champion prediction
- Dockerized setup for backend and database

## API endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| `POST` | `/api/team-stats/batch` | Saves team statistics in bulk |
| `GET` | `/api/team-stats/teams` | Lists teams for the latest season |
| `POST` | `/api/players/batch` | Saves player data in bulk |
| `GET` | `/api/players/team/{teamId}` | Lists players for a given team |
| `PATCH` | `/api/players/{playerId}/injury?isInjured=true|false` | Updates a player's injury state |
| `GET` | `/predict?home={teamId}&away={teamId}` | Returns matchup win probability |
| `GET` | `/predict/champion` | Returns all teams ranked by championship score |

## Example responses

### Matchup prediction

```json
{
  "homeTeam": "Los Angeles Lakers",
  "awayTeam": "Golden State Warriors",
  "homeProbability": 45.32,
  "awayProbability": 54.68
}
```

### Champion ranking

```json
[
  {
    "teamName": "Boston Celtics",
    "score": 4.91,
    "winPct": 0.744,
    "netRating": 9.4,
    "efgPct": 0.561,
    "avgAllNba": 0.38,
    "avgPlayoffGames": 48.2
  }
]
```

## Data scripts

The repository includes Python helpers for collecting and fixing data:

- `data-scripts/fetch_team_stats.py` — fetches team statistics and posts them to the API
- `data-scripts/fetch_players.py` — fetches player data for each roster
- `data-scripts/diagnose_career.py` — inspects player career data and anomalies
- `data-scripts/fix_players.py` — cleans or repairs player records after ingestion
- `data-scripts/requirements.txt` — Python dependency list

## Getting started

### Option A — Docker

```bash
docker compose up --build
```

Then open:

- API: `http://localhost:8080`
- PostgreSQL: `localhost:5432`

### Option B — Local run

**Prerequisites:** Java 21, Maven, PostgreSQL, Python 3

1. Start PostgreSQL and create the database:

```sql
CREATE DATABASE nba_predictor;
```

2. Run the Spring Boot app:

```bash
cd nba-predictor
./mvnw spring-boot:run
```

3. Populate the database with the Python scripts:

```bash
cd ..
pip install -r data-scripts/requirements.txt
python data-scripts/fetch_team_stats.py
python data-scripts/fetch_players.py
```

## Project structure

```text
nba-predictions/
├── readme.md
├── data-scripts/
│   ├── diagnose_career.py
│   ├── fetch_players.py
│   ├── fetch_team_stats.py
│   ├── fix_players.py
│   └── requirements.txt
├── nba-predictor/
│   ├── Dockerfile
│   ├── docker-compose.yml
│   ├── mvnw
│   ├── pom.xml
│   ├── seed.sql
│   └── src/
│       ├── main/
│       │   ├── java/
│       │   └── resources/
│       └── test/
└── plan.txt
```

## Roadmap

- [ ] Add historical accuracy tracking
- [ ] Improve model calibration and threshold tuning
- [ ] Add player roster weighting beyond MVP shares and playoff games
- [ ] Expand API documentation and Swagger support
- [x] Add player-based champion scoring
- [x] Add injury-aware player filtering
- [x] Add Docker setup for local execution

## Author

Gabriel Barbosa
GitHub: https://github.com/gabriel15vitor