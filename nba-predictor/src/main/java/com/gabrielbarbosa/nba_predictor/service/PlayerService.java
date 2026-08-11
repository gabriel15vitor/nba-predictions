package com.gabrielbarbosa.nba_predictor.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gabrielbarbosa.nba_predictor.model.Player;
import com.gabrielbarbosa.nba_predictor.model.PlayerBatchRequest;
import com.gabrielbarbosa.nba_predictor.model.PlayerData;
import com.gabrielbarbosa.nba_predictor.repository.PlayerRepository;

@Service
public class PlayerService {

    @Autowired
    private PlayerRepository playerRepository;

    public void savePlayers(PlayerBatchRequest request) {
        for (PlayerData playerData : request.getPlayers()) {
            if (!playerRepository.existsByApiPlayerId(playerData.getPlayerId())) {
                Player player = new Player();
                player.setApiPlayerId(playerData.getPlayerId());
                player.setName(playerData.getPlayerName());
                player.setTeamId(playerData.getTeamId());
                player.setTeamName(playerData.getTeamName());
                player.setMvpShares(playerData.getMvpShares());
                player.setPlayoffGames(playerData.getPlayoffGames());

                playerRepository.save(player);
            }
        }
    }

    public void toggleInjury(Long playerId, boolean isInjured) {
        Player player = playerRepository.findByApiPlayerId(playerId);

        if (player == null) {
            throw new IllegalArgumentException("Player not found");
        }

        player.setInjured(isInjured);
        playerRepository.save(player);
    }
}