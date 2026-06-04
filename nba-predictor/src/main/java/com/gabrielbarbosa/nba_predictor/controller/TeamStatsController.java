package com.gabrielbarbosa.nba_predictor.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gabrielbarbosa.nba_predictor.model.TeamStatsBatchRequest;
import com.gabrielbarbosa.nba_predictor.service.TeamStatsService;

@RestController
@RequestMapping("/api/team-stats")
public class TeamStatsController {
    @Autowired
    private TeamStatsService teamStatsService;

    @PostMapping("/batch")
    public String saveTeamStats(@RequestBody TeamStatsBatchRequest request) {
        teamStatsService.saveTeamStats(request);
        return "Stats saved successfully";
    }
}
