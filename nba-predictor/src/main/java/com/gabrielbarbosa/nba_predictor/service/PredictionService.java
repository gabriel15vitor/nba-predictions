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

    /**
     * Estimates what fraction of a team's total production remains once
     * injured players are excluded, using PIE (Player Impact Estimate).
     *
     * PIE is scaled so both teams in a single game sum to 100% — meaning one
     * team's players' PIE values sum to roughly 50% of that game's total
     * production. Comparing the SUM of PIE across the active (non-injured)
     * roster to the sum across the FULL roster gives a real, data-driven
     * estimate of "what share of this team's output is still on the floor."
     *
     * This is a genuine attempt at "team stats without the injured players,"
     * as opposed to a proxy metric like award counts — it directly reflects
     * measured on-court production share, at the cost of depending on
     * current-season PIE data being fresh and complete for every player.
     */
    private double calculatePieAdjustmentFactor(Long teamId) {
        List<Player> fullRoster = playerRepository.findByTeamId(teamId);

        if (fullRoster.isEmpty()) {
            return 1.0; // no player data yet — don't penalize the team for missing data
        }

        double fullRosterPieSum = fullRoster.stream().mapToDouble(Player::getPie).sum();

        if (fullRosterPieSum <= 0) {
            return 1.0; // guard against divide-by-zero / missing PIE data
        }

        double activeRosterPieSum = fullRoster.stream()
                .filter(p -> !p.isInjured())
                .mapToDouble(Player::getPie)
                .sum();

        return activeRosterPieSum / fullRosterPieSum;
    }

    /**
     * Blends team-level advanced stats (scaled down by the PIE-based injury
     * impact) with active-roster star power (All-NBA selections, playoff
     * experience — summed, not averaged, so losing a single star isn't
     * diluted by the rest of the roster).
     */
    private double calculateMatchupScore(TeamStats stats) {
        double teamScore = (stats.getNetRating() * 0.4) + (stats.getWinPct() * 0.3) + (stats.getEfgPct() * 0.3);

        double pieAdjustment = calculatePieAdjustmentFactor(stats.getTeamId());
        double adjustedTeamScore = teamScore * pieAdjustment;

        List<Player> activeRoster = playerRepository.findByTeamIdAndIsInjuredFalse(stats.getTeamId());
        double allNbaTotal = activeRoster.stream().mapToInt(Player::getAllNbaCount).sum();
        double playoffGamesTotal = activeRoster.stream().mapToInt(Player::getPlayoffGames).sum();

        double rosterScore = ((allNbaTotal / 3) * 0.6) + ((playoffGamesTotal / 300) * 0.4);

        return (adjustedTeamScore * 0.7) + (rosterScore * 0.3);
    }

    public List<ChampionScore> predictChampionRanking() {
        String currentSeason = teamStatsRepository.findLatestSeason();

        if (currentSeason == null) {
            throw new IllegalStateException("No season data available in the database");
        }

        List<TeamStats> allTeams = teamStatsRepository.findBySeason(currentSeason);

        List<ChampionScore> ranking = new ArrayList<>();
        for (TeamStats team : allTeams) {
            double teamScore = (team.getNetRating() * 0.3) + (team.getWinPct() * 0.15) + (team.getEfgPct() * 0.1);

            double pieAdjustment = calculatePieAdjustmentFactor(team.getTeamId());
            double adjustedTeamScore = teamScore * pieAdjustment;

            List<Player> activeRoster = playerRepository.findByTeamIdAndIsInjuredFalse(team.getTeamId());
            double allNbaTotal = activeRoster.stream().mapToInt(Player::getAllNbaCount).sum();
            double playoffGamesTotal = activeRoster.stream().mapToInt(Player::getPlayoffGames).sum();

            double score = adjustedTeamScore + ((allNbaTotal / 3) * 0.3) + ((playoffGamesTotal / 300) * 0.15);

            ranking.add(new ChampionScore(
                    team.getTeamName(), score, team.getWinPct(), team.getNetRating(),
                    team.getEfgPct(), allNbaTotal, playoffGamesTotal
            ));
        }

        ranking.sort((a, b) -> Double.compare(b.getScore(), a.getScore()));

        return ranking;
    }
}