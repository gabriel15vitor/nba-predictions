package com.gabrielbarbosa.nba_predictor.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gabrielbarbosa.nba_predictor.model.ChampionScore;
import com.gabrielbarbosa.nba_predictor.model.PredictionResponse;
import com.gabrielbarbosa.nba_predictor.model.TeamStats;
import com.gabrielbarbosa.nba_predictor.repository.TeamStatsRepository;

import java.util.ArrayList;
import java.util.List;
import com.gabrielbarbosa.nba_predictor.model.ChampionScore;

@Service
public class PredictionService {

    @Autowired
    private TeamStatsRepository teamStatsRepository;

    private static final double K = 0.5;

    public PredictionResponse predictWinProbability(Long homeTeamId, Long awayTeamId) {
        String currentSeason = teamStatsRepository.findLatestSeason();

        if (currentSeason == null) {
            throw new IllegalStateException("No season data available in the database");
        }

        TeamStats home = teamStatsRepository.findByTeamIdAndSeason(homeTeamId, currentSeason);
        TeamStats away = teamStatsRepository.findByTeamIdAndSeason(awayTeamId, currentSeason);

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

    public List<ChampionScore> predictChampionRanking() {
        String currentSeason = teamStatsRepository.findLatestSeason();

        if (currentSeason == null) {
            throw new IllegalStateException("No season data available in the database");
        }

        List<TeamStats> allTeams = teamStatsRepository.findBySeason(currentSeason);

        List<ChampionScore> ranking = new ArrayList<>();
        for (TeamStats team : allTeams) {
            double score = (team.getNetRating() * 0.5) + (team.getWinPct() * 0.3) + (team.getEfgPct() * 0.2);
            ranking.add(new ChampionScore(team.getTeamName(), score, team.getWinPct(), team.getNetRating(), team.getEfgPct()));
        }

        ranking.sort((a, b) -> Double.compare(b.getScore(), a.getScore()));

        return ranking;
    }
}