package com.gabrielbarbosa.nba_predictor.model;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TeamStatsBatchRequest{
    private String season;
    private List<TeamStatsData> stats;
}
