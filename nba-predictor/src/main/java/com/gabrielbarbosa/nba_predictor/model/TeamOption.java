package com.gabrielbarbosa.nba_predictor.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TeamOption {
    private Long teamId;
    private String teamName;

    public TeamOption(Long teamId, String teamName) {
        this.teamId = teamId;
        this.teamName = teamName;
    }
}