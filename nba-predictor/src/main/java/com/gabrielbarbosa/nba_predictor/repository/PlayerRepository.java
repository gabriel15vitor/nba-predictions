package com.gabrielbarbosa.nba_predictor.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.gabrielbarbosa.nba_predictor.model.Player;

@Repository
public interface PlayerRepository extends JpaRepository<Player, Long> {
    boolean existsByApiPlayerId(Long apiPlayerId);
    Player findByApiPlayerId(Long apiPlayerId);
    java.util.List<Player> findByTeamId(Long teamId);
    java.util.List<Player> findByTeamIdAndIsInjuredFalse(Long teamId);
}