package com.gabrielbarbosa.nba_predictor.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gabrielbarbosa.nba_predictor.model.TeamStats;
import com.gabrielbarbosa.nba_predictor.model.TeamStatsBatchRequest;
import com.gabrielbarbosa.nba_predictor.model.TeamStatsData;
import com.gabrielbarbosa.nba_predictor.repository.TeamStatsRepository;

@Service
public class TeamStatsService {
    @Autowired
    private TeamStatsRepository teamStatsRepository;

    public void saveTeamStats(TeamStatsBatchRequest request){
        for (TeamStatsData statsData : request.getStats()) {
            if (!teamStatsRepository.existsByTeamIdAndSeason(statsData.getTeamId(), request.getSeason())) {
                TeamStats teamStats = new TeamStats();
                teamStats.setTeamId(statsData.getTeamId());
                teamStats.setSeason(request.getSeason());
                teamStats.setTeamName(statsData.getTeamName());
                teamStats.setWins(statsData.getW());
                teamStats.setLosses(statsData.getL());
                teamStats.setWinPct(statsData.getWPct());
                teamStats.setNetRating(statsData.getNetRating());
                teamStats.setEfgPct(statsData.getEfgPct());

                teamStatsRepository.save(teamStats);
            }
        }
    }
}