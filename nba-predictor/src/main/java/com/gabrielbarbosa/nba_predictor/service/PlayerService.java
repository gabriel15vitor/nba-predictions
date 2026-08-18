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
            // Upsert: update the player if they already exist (handles trades/team
            // changes correctly), otherwise create a new record. isInjured is left
            // untouched on existing players so a data refresh doesn't silently
            // clear a manually-set injury flag.
            Player player = playerRepository.findByApiPlayerId(playerData.getPlayerId());

            if (player == null) {
                player = new Player();
                player.setApiPlayerId(playerData.getPlayerId());
            }

            player.setName(playerData.getPlayerName());
            player.setTeamId(playerData.getTeamId());
            player.setTeamName(playerData.getTeamName());
            player.setAllNbaCount(playerData.getAllNbaCount());
            player.setPlayoffGames(playerData.getPlayoffGames());
            player.setPie(playerData.getPie());
            player.setNetRating(playerData.getNetRating());

            playerRepository.save(player);
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

    /**
     * Removes players who no longer appear in any current team roster (retired,
     * released, left the league). Only safe to call after a FULL fetch across
     * all 30 teams — currentApiPlayerIds must represent the complete active
     * player pool, or active players would be incorrectly deleted.
     */
    public int pruneInactivePlayers(java.util.List<Long> currentApiPlayerIds) {
        long beforeCount = playerRepository.count();
        playerRepository.deleteByApiPlayerIdNotIn(currentApiPlayerIds);
        long afterCount = playerRepository.count();
        return (int) (beforeCount - afterCount);
    }
}