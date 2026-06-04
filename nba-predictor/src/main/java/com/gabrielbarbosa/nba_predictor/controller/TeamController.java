package com.gabrielbarbosa.nba_predictor.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gabrielbarbosa.nba_predictor.model.Team;
import com.gabrielbarbosa.nba_predictor.repository.TeamRepository;

@RestController
@RequestMapping("/teams")
public class TeamController {

    @Autowired
    private TeamRepository teamRepository;

    @GetMapping
    public List<Team> getAllTeams() {
        return teamRepository.findAll();
    }
}