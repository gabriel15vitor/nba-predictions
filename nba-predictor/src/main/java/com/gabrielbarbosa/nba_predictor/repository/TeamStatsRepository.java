package com.gabrielbarbosa.nba_predictor.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.gabrielbarbosa.nba_predictor.model.TeamStats;

@Repository
public interface TeamStatsRepository extends JpaRepository<TeamStats, Long>{
    boolean existsByTeamIdAndSeason(Long teamId, String season);
}