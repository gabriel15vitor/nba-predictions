import requests
from datetime import datetime
from nba_api.stats.endpoints import leaguedashteamstats

def get_current_season_start_year():
    today = datetime.now()
    if today.month >= 10:
        return today.year
    else:
        return today.year - 1

def get_last_n_seasons(n):
    start_year = get_current_season_start_year()
    seasons = []
    for i in range(n):
        year = start_year - i
        season_str = f"{year}-{str(year + 1)[-2:]}"
        seasons.append(season_str)
    return seasons

def fetch_and_send(season: str):
    stats = leaguedashteamstats.LeagueDashTeamStats(
        season=season,
        season_type_all_star='Regular Season',
        per_mode_detailed='PerGame',
        measure_type_detailed_defense='Advanced'
    )
    df = stats.get_data_frames()[0]
    records = df.to_dict(orient='records')

    response = requests.post(
        'http://localhost:8080/api/team-stats/batch',
        json={"season": season, "stats": records}
    )
    print(response.status_code, response.text)

seasons = get_last_n_seasons(3)
print(f"Fetching seasons: {seasons}")

for season in seasons:
    fetch_and_send(season)