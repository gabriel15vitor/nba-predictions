package com.gabrielbarbosa.nba_predictor.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.gabrielbarbosa.nba_predictor.model.Team;

@Repository
public interface TeamRepository extends JpaRepository<Team, Long> {
    Team findByName(String team_name);
}
