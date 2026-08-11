package com.gabrielbarbosa.nba_predictor.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ChampionScore {
    private String teamName;
    private double score;
    private double winPct;
    private double netRating;
    private double efgPct;
    private double avgAllNbaSelections;
    private double avgPlayoffGames;

    public ChampionScore(String teamName, double score, double winPct, double netRating,
                          double efgPct, double avgAllNbaSelections, double avgPlayoffGames) {
        this.teamName = teamName;
        this.score = score;
        this.winPct = winPct;
        this.netRating = netRating;
        this.efgPct = efgPct;
        this.avgAllNbaSelections = avgAllNbaSelections;
        this.avgPlayoffGames = avgPlayoffGames;
    }
}