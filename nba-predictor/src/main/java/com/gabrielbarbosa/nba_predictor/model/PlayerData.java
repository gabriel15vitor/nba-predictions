package com.gabrielbarbosa.nba_predictor.model;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PlayerData {
    @JsonProperty("PLAYER_ID")
    private Long playerId;
    @JsonProperty("PLAYER_NAME")
    private String playerName;
    @JsonProperty("TEAM_ID")
    private Long teamId;
    @JsonProperty("TEAM_NAME")
    private String teamName;
    @JsonProperty("MVP_SHARES")
    private double mvpShares;
    @JsonProperty("PLAYOFF_GAMES")
    private int playoffGames;
}