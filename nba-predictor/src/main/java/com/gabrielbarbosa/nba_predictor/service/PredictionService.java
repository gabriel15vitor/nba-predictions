package com.gabrielbarbosa.nba_predictor.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gabrielbarbosa.nba_predictor.model.PredictionResponse;
import com.gabrielbarbosa.nba_predictor.model.TeamStats;
import com.gabrielbarbosa.nba_predictor.repository.TeamStatsRepository;

@Service
public class PredictionService {

    @Autowired
    private TeamStatsRepository teamStatsRepository;

    private static final String CURRENT_SEASON = "2024-25";
    private static final double K = 0.5;

    public PredictionResponse predictWinProbability(Long homeTeamId, Long awayTeamId) {
        TeamStats home = teamStatsRepository.findByTeamIdAndSeason(homeTeamId, CURRENT_SEASON);
        TeamStats away = teamStatsRepository.findByTeamIdAndSeason(awayTeamId, CURRENT_SEASON);

        if (home == null || away == null) {
            throw new IllegalArgumentException("Team stats not found for the given season");
        }

        double homeScore = calculateScore(home);
        double awayScore = calculateScore(away);

        double diff = homeScore - awayScore;
        double homeProbability = (1 / (1 + Math.exp(-K * diff))) * 100;
        double awayProbability = 100 - homeProbability;

        return new PredictionResponse(home.getTeamName(), away.getTeamName(), homeProbability, awayProbability);
    }

    private double calculateScore(TeamStats stats) {
        return (stats.getNetRating() * 0.4) + (stats.getWinPct() * 0.3) + (stats.getEfgPct() * 0.3);
    }
}