package com.gabrielbarbosa.nba_predictor.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.gabrielbarbosa.nba_predictor.model.TeamStats;

@Repository
public interface TeamStatsRepository extends JpaRepository<TeamStats, Long> {
    boolean existsByTeamIdAndSeason(Long teamId, String season);
    TeamStats findByTeamIdAndSeason(Long teamId, String season);

    @Query("SELECT DISTINCT t.teamId, t.teamName FROM TeamStats t WHERE t.season = :season ORDER BY t.teamName")
    List<Object[]> findDistinctTeams(@Param("season") String season);

    @Query("SELECT MAX(t.season) FROM TeamStats t")
    String findLatestSeason();

    List<TeamStats> findBySeason(String season);
}
