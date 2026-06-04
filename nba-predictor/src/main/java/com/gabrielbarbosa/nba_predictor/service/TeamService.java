package com.gabrielbarbosa.nba_predictor.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.gabrielbarbosa.nba_predictor.model.Team;
import com.gabrielbarbosa.nba_predictor.model.TeamData;
import com.gabrielbarbosa.nba_predictor.model.TeamResponse;
import com.gabrielbarbosa.nba_predictor.repository.TeamRepository;

@Service
public class TeamService {

    @Autowired
    private TeamRepository teamRepository;

    @Value("${balldontlie.api.key}")
    private String apiKey;

    private final RestTemplate restTemplate = new RestTemplate();
    
    public List<TeamData> fetchTeams() {
        String url = "https://api.balldontlie.io/v1/teams";

        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", apiKey);

        HttpEntity<String> entity = new HttpEntity<>(headers);

        ResponseEntity<TeamResponse> response = restTemplate.exchange(
            url,
            HttpMethod.GET,
            entity,
            TeamResponse.class
        );

        return response.getBody().getTeamData();
    }

    public void saveTeams() {
        List<TeamData> teams = fetchTeams();
        
        for (TeamData teamData : teams) {
            Team team = new Team();
            if(teamData.getCity() != null){
                team.setId(teamData.getId());
                team.setName(teamData.getName());
                team.setAbbreviation(teamData.getAbbreviation());
                team.setCity(teamData.getCity());
                team.setConference(teamData.getConference());
                team.setDivision(teamData.getDivision());
                
                //se o time existe o substitui pelo valor novo
                if (!teamRepository.existsById(teamData.getId())) {
                    teamRepository.save(team);
                }
            }
        }
    }
}