import requests
from nba_api.stats.endpoints import leaguedashteamstats

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

seasons = ['2024-25', '2023-24', '2022-23', '2021-22', '2020-21']

for season in seasons:
    fetch_and_send(season)