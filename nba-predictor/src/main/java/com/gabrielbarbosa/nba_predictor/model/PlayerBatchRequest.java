package com.gabrielbarbosa.nba_predictor.model;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PlayerBatchRequest {
    private List<PlayerData> players;
}