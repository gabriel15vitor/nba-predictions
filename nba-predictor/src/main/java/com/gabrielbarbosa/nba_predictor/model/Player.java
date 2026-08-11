package com.gabrielbarbosa.nba_predictor.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
public class Player {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "api_player_id", unique = true)
    private Long apiPlayerId;

    @Column(name = "name")
    private String name;

    @Column(name = "team_id")
    private Long teamId;

    @Column(name = "team_name")
    private String teamName;

    @Column(name = "mvp_shares")
    private double mvpShares;

    @Column(name = "playoff_games")
    private int playoffGames;

    @Column(name = "is_injured")
    private boolean isInjured = false;
}