import time
import requests
from nba_api.stats.endpoints import (
    commonteamroster,
    playerawards,
    playercareerstats,
)

# ---- CONFIG ----
JAVA_API_URL = "http://localhost:8080/api/players/batch"
REQUEST_DELAY = 0.4  # seconds between NBA API calls, to avoid rate limiting

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


def get_all_nba_count(player_id):
    """Counts how many times a player has been selected to an All-NBA team."""
    awards = playerawards.PlayerAwards(player_id=player_id)
    df = awards.get_data_frames()[0]
    time.sleep(REQUEST_DELAY)

    if "DESCRIPTION" not in df.columns:
        print(f"  [!] Unexpected awards format for player {player_id}, columns: {list(df.columns)}")
        return 0

    return int(df["DESCRIPTION"].astype(str).str.contains("All-NBA", case=False, na=False).sum())


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


def sanity_check(sample_player_id, sample_player_name):
    """Runs one full fetch for a single known player before committing to the full run."""
    print(f"--- Sanity check: {sample_player_name} ({sample_player_id}) ---")
    all_nba = get_all_nba_count(sample_player_id)
    playoff_games = get_playoff_games(sample_player_id)
    print(f"All-NBA selections: {all_nba}")
    print(f"Career playoff games: {playoff_games}")
    print("--- If these numbers look wrong, stop and check the raw dataframe columns before continuing ---\n")


def fetch_all_players():
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

                all_players.append({
                    "PLAYER_ID": int(player_id),
                    "PLAYER_NAME": player_name,
                    "TEAM_ID": team_id,
                    "TEAM_NAME": team_name,
                    "MVP_SHARES": all_nba_count,  # reused field name: All-NBA selection count
                    "PLAYOFF_GAMES": playoff_games,
                })
                print(f"  {player_name}: All-NBA={all_nba_count}, PlayoffGames={playoff_games}")
            except Exception as e:
                print(f"  [!] Failed for {player_name} ({player_id}): {e}")
                continue

    return all_players


def send_batch(players):
    response = requests.post(JAVA_API_URL, json={"players": players})
    print(response.status_code, response.text)


if __name__ == "__main__":
    # Step 1 — sanity check with a known player (LeBron James) before the full run
    sanity_check(2544, "LeBron James")

    proceed = input("Do the sanity check numbers look correct? (y/n): ")
    if proceed.lower() != "y":
        print("Stopping. Inspect the raw dataframes (df.columns / df.head()) before re-running.")
        exit()

    # Step 2 — full run across all 30 rosters (~450-500 players, ~2 calls each)
    print("\nStarting full fetch. This will take a while due to rate limiting...\n")
    players = fetch_all_players()

    print(f"\nFetched {len(players)} players. Sending to Java API...")
    send_batch(players)
