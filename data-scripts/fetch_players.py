import time
import requests
from datetime import datetime
from nba_api.stats.endpoints import (
    commonteamroster,
    playerawards,
    playercareerstats,
    leaguedashplayerstats,
)

# ---- CONFIG ----
JAVA_API_URL = "http://localhost:8080/api/players/batch"
REQUEST_DELAY = 0.6  # seconds between NBA API calls, to avoid rate limiting
RECENT_SEASONS_WINDOW = 2  # only count All-NBA selections from the last N seasons


def get_current_season_start_year():
    today = datetime.now()
    return today.year if today.month >= 10 else today.year - 1


def get_recent_seasons(n):
    """Same season-string logic used in fetch_team_stats.py, kept in sync."""
    start_year = get_current_season_start_year()
    return [f"{start_year - i}-{str(start_year - i + 1)[-2:]}" for i in range(n)]


RECENT_SEASONS = get_recent_seasons(RECENT_SEASONS_WINDOW)

# Team IDs -> Team Names (official NBA team ids, all 30 teams)
TEAMS = {
    1610612737: "Atlanta Hawks", 1610612738: "Boston Celtics",
    1610612739: "Cleveland Cavaliers", 1610612740: "New Orleans Pelicans",
    1610612741: "Chicago Bulls", 1610612742: "Dallas Mavericks",
    1610612743: "Denver Nuggets", 1610612744: "Golden State Warriors",
    1610612745: "Houston Rockets", 1610612746: "LA Clippers",
    1610612747: "Los Angeles Lakers", 1610612748: "Miami Heat",
    1610612749: "Milwaukee Bucks", 1610612750: "Minnesota Timberwolves",
    1610612751: "Brooklyn Nets", 1610612752: "New York Knicks",
    1610612753: "Orlando Magic", 1610612754: "Indiana Pacers",
    1610612755: "Philadelphia 76ers", 1610612756: "Phoenix Suns",
    1610612757: "Portland Trail Blazers", 1610612758: "Sacramento Kings",
    1610612759: "San Antonio Spurs", 1610612760: "Oklahoma City Thunder",
    1610612761: "Toronto Raptors", 1610612762: "Utah Jazz",
    1610612763: "Memphis Grizzlies", 1610612764: "Washington Wizards",
    1610612765: "Detroit Pistons", 1610612766: "Charlotte Hornets",
}


def get_current_roster(team_id):
    """Returns a list of (player_id, player_name) for a given team's current roster."""
    roster = commonteamroster.CommonTeamRoster(team_id=team_id)
    df = roster.get_data_frames()[0]
    time.sleep(REQUEST_DELAY)
    return list(zip(df["PLAYER_ID"], df["PLAYER"]))


def get_league_player_advanced_stats():
    """Bulk fetch of current-season PIE and NET_RATING for every active player,
    in ONE API call (unlike awards/playoff-games, which need one call per player).

    PIE (Player Impact Estimate) is scaled so both teams in a game sum to 100%,
    meaning a single team's players' PIE values sum to roughly 50% of total
    production. This lets us estimate what share of a team's output a specific
    player represents — used later to scale team stats down when they're injured.

    Returns a dict: {player_id: {"PIE": ..., "NET_RATING": ...}}
    """
    stats = leaguedashplayerstats.LeagueDashPlayerStats(
        season_type_all_star='Regular Season',
        per_mode_detailed='PerGame',
        measure_type_detailed_defense='Advanced'
    )
    df = stats.get_data_frames()[0]
    time.sleep(REQUEST_DELAY)

    expected_cols = {"PLAYER_ID", "PIE", "NET_RATING"}
    missing = expected_cols - set(df.columns)
    if missing:
        print(f"  [!] LeagueDashPlayerStats missing expected columns: {missing}")
        print(f"  Available columns: {list(df.columns)}")
        return {}

    return {
        int(row["PLAYER_ID"]): {"PIE": float(row["PIE"]), "NET_RATING": float(row["NET_RATING"])}
        for _, row in df.iterrows()
    }


def get_all_nba_count(player_id):
    """Counts All-NBA selections limited to the last RECENT_SEASONS_WINDOW seasons.

    This intentionally excludes career-long totals — an aging star with many
    past selections but no recent ones shouldn't inflate a rebuilding team's
    predicted strength. Confirmed via manual inspection that PlayerAwards
    includes a SEASON column formatted like "2024-25", matching the format
    used everywhere else in this project.
    """
    awards = playerawards.PlayerAwards(player_id=player_id)
    df = awards.get_data_frames()[0]
    time.sleep(REQUEST_DELAY)

    if "DESCRIPTION" not in df.columns or "SEASON" not in df.columns:
        print(f"  [!] Unexpected awards format for player {player_id}, columns: {list(df.columns)}")
        return 0

    is_all_nba = df["DESCRIPTION"].astype(str).str.contains("All-NBA", case=False, na=False)
    is_recent = df["SEASON"].astype(str).isin(RECENT_SEASONS)

    return int((is_all_nba & is_recent).sum())


def get_playoff_games(player_id):
    """Returns total career playoff games played (CareerTotalsPostSeason table).

    Confirmed via manual inspection (nba_api 1.11.4) that get_data_frames()[3]
    is the single-row "career totals, postseason" table. If a player has never
    played in the playoffs, this table may be empty or missing GP entirely.
    """
    career = playercareerstats.PlayerCareerStats(player_id=player_id)
    data_frames = career.get_data_frames()
    time.sleep(REQUEST_DELAY)

    if len(data_frames) <= 3:
        return 0

    post_season_df = data_frames[3]

    if post_season_df.empty or "GP" not in post_season_df.columns:
        return 0

    return int(post_season_df["GP"].iloc[0])


def sanity_check(sample_player_id, sample_player_name, advanced_stats):
    """Runs one full fetch for a single known player before committing to the full run."""
    print(f"--- Sanity check: {sample_player_name} ({sample_player_id}) ---")
    print(f"Counting All-NBA selections only for: {RECENT_SEASONS}")
    all_nba = get_all_nba_count(sample_player_id)
    playoff_games = get_playoff_games(sample_player_id)
    player_advanced = advanced_stats.get(sample_player_id, {"PIE": 0, "NET_RATING": 0})
    print(f"Recent All-NBA selections ({RECENT_SEASONS_WINDOW} seasons): {all_nba}")
    print(f"Career playoff games: {playoff_games}")
    print(f"Current-season PIE: {player_advanced['PIE']}")
    print(f"Current-season NET_RATING: {player_advanced['NET_RATING']}")
    print("--- If these numbers look wrong, stop and check the raw dataframe columns before continuing ---\n")


def fetch_all_players(advanced_stats):
    all_players = []

    for team_id, team_name in TEAMS.items():
        print(f"Fetching roster: {team_name}")
        try:
            roster = get_current_roster(team_id)
        except Exception as e:
            print(f"  [!] Failed to fetch roster for {team_name}: {e}")
            continue

        for player_id, player_name in roster:
            try:
                all_nba_count = get_all_nba_count(player_id)
                playoff_games = get_playoff_games(player_id)
                player_advanced = advanced_stats.get(int(player_id), {"PIE": 0, "NET_RATING": 0})

                all_players.append({
                    "PLAYER_ID": int(player_id),
                    "PLAYER_NAME": player_name,
                    "TEAM_ID": team_id,
                    "TEAM_NAME": team_name,
                    "ALL_NBA_COUNT": all_nba_count,
                    "PLAYOFF_GAMES": playoff_games,
                    "PIE": player_advanced["PIE"],
                    "NET_RATING": player_advanced["NET_RATING"],
                })
                print(f"  {player_name}: All-NBA={all_nba_count}, PlayoffGames={playoff_games}, "
                      f"PIE={player_advanced['PIE']}, NetRating={player_advanced['NET_RATING']}")
            except Exception as e:
                print(f"  [!] Failed for {player_name} ({player_id}): {e}")
                continue

    return all_players


def send_batch(players):
    response = requests.post(JAVA_API_URL, json={"players": players})
    print(response.status_code, response.text)


def prune_inactive_players(players):
    """Removes players from the DB who no longer appear in any current roster
    (retired, released, left the league). Only call this after a FULL fetch
    across all 30 teams — a partial player list would wrongly delete active
    players who just weren't included in this run.
    """
    current_ids = [p["PLAYER_ID"] for p in players]
    response = requests.post(f"{JAVA_API_URL.rsplit('/', 1)[0]}/prune", json=current_ids)
    print(response.status_code, response.text)


if __name__ == "__main__":
    # Step 0 — one bulk call for every player's current-season PIE/NET_RATING
    print("Fetching league-wide player advanced stats (one call)...")
    advanced_stats = get_league_player_advanced_stats()
    print(f"Retrieved advanced stats for {len(advanced_stats)} players.\n")

    # Step 1 — sanity check with a known player (LeBron James) before the full run
    sanity_check(2544, "LeBron James", advanced_stats)

    proceed = input("Do the sanity check numbers look correct? (y/n): ")
    if proceed.lower() != "y":
        print("Stopping. Inspect the raw dataframes (df.columns / df.head()) before re-running.")
        exit()

    # Step 2 — full run across all 30 rosters (~450-500 players, ~2 calls each)
    print("\nStarting full fetch. This will take a while due to rate limiting...\n")
    players = fetch_all_players(advanced_stats)

    print(f"\nFetched {len(players)} players. Sending to Java API...")
    send_batch(players)

    print("\nPruning players no longer on any roster...")
    prune_inactive_players(players)