package com.gabrielbarbosa.nba_predictor.model;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TeamStatsData {
    @JsonProperty("TEAM_ID")
    private long teamId;
    @JsonProperty("TEAM_NAME")
    private String teamName;
    @JsonProperty("W")
    private int w;
    @JsonProperty("L")
    private int l;
    @JsonProperty("W_PCT")
    private double wPct;
    @JsonProperty("NET_RATING")
    private double netRating;
    @JsonProperty("EFG_PCT")
    private double efgPct;
}