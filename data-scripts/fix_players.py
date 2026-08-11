import time
import requests
from nba_api.stats.endpoints import playerawards, playercareerstats

JAVA_API_URL = "http://localhost:8080/api/players/batch"
REQUEST_DELAY = 0.6

# (player_id, player_name, team_id, team_name)
PLAYERS_TO_FIX = [
    (2544, "LeBron James", 1610612747, "Los Angeles Lakers"),
    (201939, "Stephen Curry", 1610612744, "Golden State Warriors"),
]


def get_all_nba_count(player_id):
    awards = playerawards.PlayerAwards(player_id=player_id)
    df = awards.get_data_frames()[0]
    time.sleep(REQUEST_DELAY)

    if "DESCRIPTION" not in df.columns:
        print(f"  [!] Unexpected awards format for player {player_id}, columns: {list(df.columns)}")
        return 0

    return int(df["DESCRIPTION"].astype(str).str.contains("All-NBA", case=False, na=False).sum())


def get_playoff_games(player_id):
    career = playercareerstats.PlayerCareerStats(player_id=player_id)
    data_frames = career.get_data_frames()
    time.sleep(REQUEST_DELAY)

    if len(data_frames) <= 3:
        return 0

    post_season_df = data_frames[3]

    if post_season_df.empty or "GP" not in post_season_df.columns:
        return 0

    return int(post_season_df["GP"].iloc[0])


def fetch_and_send():
    players = []

    for player_id, player_name, team_id, team_name in PLAYERS_TO_FIX:
        all_nba_count = get_all_nba_count(player_id)
        playoff_games = get_playoff_games(player_id)

        players.append({
            "PLAYER_ID": player_id,
            "PLAYER_NAME": player_name,
            "TEAM_ID": team_id,
            "TEAM_NAME": team_name,
            "MVP_SHARES": all_nba_count,
            "PLAYOFF_GAMES": playoff_games,
        })
        print(f"{player_name}: All-NBA={all_nba_count}, PlayoffGames={playoff_games}")

    response = requests.post(JAVA_API_URL, json={"players": players})
    print(response.status_code, response.text)


if __name__ == "__main__":
    fetch_and_send()
