package com.gabrielbarbosa.nba_predictor.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gabrielbarbosa.nba_predictor.model.ChampionScore;
import com.gabrielbarbosa.nba_predictor.model.Player;
import com.gabrielbarbosa.nba_predictor.model.PredictionResponse;
import com.gabrielbarbosa.nba_predictor.model.TeamStats;
import com.gabrielbarbosa.nba_predictor.repository.PlayerRepository;
import com.gabrielbarbosa.nba_predictor.repository.TeamStatsRepository;

@Service
public class PredictionService {

    @Autowired
    private TeamStatsRepository teamStatsRepository;

    @Autowired
    private PlayerRepository playerRepository;

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

        double homeScore = calculateMatchupScore(home);
        double awayScore = calculateMatchupScore(away);

        double diff = homeScore - awayScore;
        double homeProbability = (1 / (1 + Math.exp(-K * diff))) * 100;
        double awayProbability = 100 - homeProbability;

        return new PredictionResponse(home.getTeamName(), away.getTeamName(), homeProbability, awayProbability);
    }

    private double calculateMatchupScore(TeamStats stats) {
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
            List<Player> activeRoster = playerRepository.findByTeamIdAndIsInjuredFalse(team.getTeamId());

            double avgAllNba = 0;
            double avgPlayoffGames = 0;

            if (!activeRoster.isEmpty()) {
                avgAllNba = activeRoster.stream().mapToDouble(Player::getMvpShares).average().orElse(0);
                avgPlayoffGames = activeRoster.stream().mapToInt(Player::getPlayoffGames).average().orElse(0);
            }

            // avgPlayoffGames is scaled down (÷50) to bring it into a comparable range
            // to the other factors, which are all roughly in the -10 to 1 range.
            double score = (team.getNetRating() * 0.35)
                    + (team.getWinPct() * 0.2)
                    + (team.getEfgPct() * 0.15)
                    + (avgAllNba * 0.2)
                    + ((avgPlayoffGames / 50) * 0.1);

            ranking.add(new ChampionScore(
                    team.getTeamName(), score, team.getWinPct(), team.getNetRating(),
                    team.getEfgPct(), avgAllNba, avgPlayoffGames
            ));
        }

        ranking.sort((a, b) -> Double.compare(b.getScore(), a.getScore()));

        return ranking;
    }
}