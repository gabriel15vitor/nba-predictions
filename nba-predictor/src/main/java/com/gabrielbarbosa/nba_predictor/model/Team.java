package com.gabrielbarbosa.nba_predictor.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
public class Team {
    @Id
    private Long id;
    @Column(name = "team_name", nullable=false)
    private String name;
    @Column(name = "abbreviation", nullable=false)
    private String abbreviation;
    @Column(name = "city", nullable=false)
    private String city;
    @Column(name = "conference", nullable=false)
    private String conference;
    @Column(name = "division", nullable=false)
    private String division;
}