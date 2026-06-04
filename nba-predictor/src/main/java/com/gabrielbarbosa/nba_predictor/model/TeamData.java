package com.gabrielbarbosa.nba_predictor.model;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TeamData{
    @JsonProperty("id")
    private Long id;
    @JsonProperty("name")
    private String name;
    @JsonProperty("abbreviation")
    private String abbreviation;
    @JsonProperty("city")
    private String city;
    @JsonProperty("conference")
    private String conference;
    @JsonProperty("division")
    private String division;
}
