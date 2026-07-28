# NBA win probability predictor

A REST API built with Java and Spring Boot that predicts the win probability between two NBA teams, based on real season statistics. Includes a lightweight web interface for testing predictions interactively.

## Overview

This project ingests NBA team statistics from two sources, stores them in a PostgreSQL database, and exposes a REST API that calculates win probability between any two teams for the current season. A simple frontend lets you pick two teams and see the result visually.

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
Service     → business logic (win probability calculation)
Repository  → database access via Spring Data JPA
Model       → entities mapped to PostgreSQL tables
```

Two independent data sources feed the database:
- A Python script using the official `nba_api` library pulls per-season team statistics and posts them to the Java API in batch
- (Legacy) balldontlie.io was used for initial team metadata during early development, later replaced by `nba_api` as the single source of truth

## Features

- Fetches and stores NBA team statistics (wins, losses, win percentage, points per game, plus/minus) by season
- Prevents duplicate data on repeated ingestion (`existsByTeamIdAndSeason` check)
- Calculates win probability between two teams using a weighted formula:
  - Plus/minus: 50%
  - Win percentage: 30%
  - Points per game: 20%
- REST endpoints returning structured JSON
- Simple web UI to select two teams and visualize the predicted win probability
- Fully containerized with Docker Compose — one command to run the API and database together

## API endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| `GET` | `/api/team-stats/teams` | Returns all teams available for the current season |
| `POST` | `/api/team-stats/batch` | Receives a batch of team statistics from the Python script |
| `GET` | `/predict?home={teamId}&away={teamId}` | Returns win probability for a matchup |

### Example response — `/predict`

```json
{
    "homeTeam": "Los Angeles Lakers",
    "awayTeam": "Golden State Warriors",
    "homeProbability": 45.32,
    "awayProbability": 54.68
}
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

### 4. Run the application

```bash
./mvnw spring-boot:run
```

The API will be available at `http://localhost:8080` and the web interface at `http://localhost:8080/`.

### 5. Populate the database

Install the Python dependencies:

```bash
pip install nba_api requests
```

Run the ingestion script (make sure the Java app is running first, whether via Docker or locally):

```bash
python data-scripts/fetch_team_stats.py
```

This fetches per-game team statistics for the configured seasons and sends them to the API.

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
│   └── static/         frontend (HTML/CSS/JS)
├── Dockerfile
├── docker-compose.yml
├── .dockerignore
└── data-scripts/
    └── fetch_team_stats.py
```

## Roadmap

- [ ] Series (best-of-7) win probability
- [ ] Championship odds across all teams
- [ ] Normalize stats to avoid skewed probabilities from extreme plus/minus values
- [ ] Dynamic season selection (currently hardcoded to 2024-25)
- [ ] Historical prediction accuracy tracking
- [ ] Swagger / OpenAPI documentation
- [ ] Docker Compose setup for one-command startup

## Author

**Gabriel Barbosa** — Systems Analysis and Development student at Fatec Campinas
[GitHub](https://github.com/gabriel15vitor)