package com.gabrielbarbosa.nba_predictor.model;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TeamResponse {
    @JsonProperty("data")
    List<TeamData> teamData;
}