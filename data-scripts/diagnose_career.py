from nba_api.stats.endpoints import playercareerstats

career = playercareerstats.PlayerCareerStats(player_id=2544)
data_frames = career.get_data_frames()

# Print the name and shape of every returned table, plus its columns
for i, df in enumerate(data_frames):
    print(f"\n=== Table index {i} ===")
    print(f"Rows: {len(df)}, Columns: {list(df.columns)}")
    if "GP" in df.columns:
        print(df[["GP"] + ([c for c in ["SEASON_ID", "PLAYER_ID"] if c in df.columns])].to_string())
