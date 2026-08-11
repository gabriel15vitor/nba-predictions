package com.gabrielbarbosa.nba_predictor.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.gabrielbarbosa.nba_predictor.model.Player;
import com.gabrielbarbosa.nba_predictor.model.PlayerBatchRequest;
import com.gabrielbarbosa.nba_predictor.repository.PlayerRepository;
import com.gabrielbarbosa.nba_predictor.service.PlayerService;

@RestController
@RequestMapping("/api/players")
public class PlayerController {

    @Autowired
    private PlayerService playerService;

    @Autowired
    private PlayerRepository playerRepository;

    @PostMapping("/batch")
    public String savePlayers(@RequestBody PlayerBatchRequest request) {
        playerService.savePlayers(request);
        return "Players saved successfully";
    }

    @GetMapping("/team/{teamId}")
    public List<Player> getPlayersByTeam(@PathVariable Long teamId) {
        return playerRepository.findByTeamId(teamId);
    }

    @PatchMapping("/{playerId}/injury")
    public String setInjuryStatus(@PathVariable Long playerId, @RequestParam boolean isInjured) {
        playerService.toggleInjury(playerId, isInjured);
        return "Injury status updated";
    }
}