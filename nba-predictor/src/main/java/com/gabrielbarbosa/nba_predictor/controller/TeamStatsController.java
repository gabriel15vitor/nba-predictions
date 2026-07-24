package com.gabrielbarbosa.nba_predictor.controller;
import java.util.ArrayList;
import java.util.List;
import org.springframework.web.bind.annotation.GetMapping;
import com.gabrielbarbosa.nba_predictor.model.TeamOption;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gabrielbarbosa.nba_predictor.model.TeamStatsBatchRequest;
import com.gabrielbarbosa.nba_predictor.service.TeamStatsService;
import com.gabrielbarbosa.nba_predictor.repository.TeamStatsRepository;


@RestController
@RequestMapping("/api/team-stats")
public class TeamStatsController {
    @Autowired
    private TeamStatsService teamStatsService;
    @Autowired
    private TeamStatsRepository teamStatsRepository;

    @PostMapping("/batch")
    public String saveTeamStats(@RequestBody TeamStatsBatchRequest request) {
        teamStatsService.saveTeamStats(request);
        return "Stats saved successfully";
    }

    @GetMapping("/teams")
    public List<TeamOption> getTeamOptions() {
        List<Object[]> results = teamStatsRepository.findDistinctTeams("2024-25");
        List<TeamOption> teams = new ArrayList<>();
        for (Object[] row : results) {
            teams.add(new TeamOption((Long) row[0], (String) row[1]));
        }
        return teams;
    }
}
