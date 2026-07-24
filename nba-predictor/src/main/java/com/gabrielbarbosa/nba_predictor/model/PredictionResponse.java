package com.gabrielbarbosa.nba_predictor.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PredictionResponse {
    private String homeTeam;
    private String awayTeam;
    private double homeProbability;
    private double awayProbability;

    public PredictionResponse(String homeTeam, String awayTeam, double homeProbability, double awayProbability) {
        this.homeTeam = homeTeam;
        this.awayTeam = awayTeam;
        this.homeProbability = homeProbability;
        this.awayProbability = awayProbability;
    }
}