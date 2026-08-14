const teamPicker = document.getElementById('team-picker');
const loading = document.getElementById('loading');
const errorMessage = document.getElementById('error-message');
const rosterList = document.getElementById('roster-list');

async function loadTeams() {
    try {
        const response = await fetch('/api/team-stats/teams');
        const teams = await response.json();

        teamPicker.innerHTML = '<option value="">Select a team</option>';
        teams.forEach(team => {
            const option = document.createElement('option');
            option.value = team.teamId;
            option.textContent = team.teamName;
            teamPicker.appendChild(option);
        });
    } catch (err) {
        errorMessage.textContent = 'Could not load teams. Is the backend running?';
        errorMessage.classList.remove('hidden');
    }
}

async function loadRoster(teamId) {
    errorMessage.classList.add('hidden');
    rosterList.classList.add('hidden');
    loading.classList.remove('hidden');

    try {
        const response = await fetch(`/api/players/team/${teamId}`);

        if (!response.ok) {
            throw new Error('Failed to load roster');
        }

        const players = await response.json();
        renderRoster(players);
    } catch (err) {
        loading.classList.add('hidden');
        errorMessage.textContent = 'Could not load the roster for this team.';
        errorMessage.classList.remove('hidden');
    }
}

function renderRoster(players) {
    loading.classList.add('hidden');
    rosterList.innerHTML = '';

    if (players.length === 0) {
        errorMessage.textContent = 'No players found for this team yet. Run the data ingestion script.';
        errorMessage.classList.remove('hidden');
        return;
    }

    players.forEach(player => {
        const li = document.createElement('li');
        li.className = 'roster-item' + (player.injured ? ' injured' : '');

        li.innerHTML = `
            <div class="roster-player-info">
                <span class="roster-player-name">
                    ${player.name}${player.injured ? ' <span class="injury-label">Injured</span>' : ''}
                </span>
                <span class="roster-player-stats">
                    Recent All-NBA: ${player.allNbaCount} · Career playoff games: ${player.playoffGames}
                </span>
            </div>
            <label class="injury-toggle">
                Injured
                <input type="checkbox" data-player-id="${player.apiPlayerId}" ${player.injured ? 'checked' : ''}>
            </label>
        `;

        rosterList.appendChild(li);
    });

    rosterList.classList.remove('hidden');

    document.querySelectorAll('.injury-toggle input').forEach(checkbox => {
        checkbox.addEventListener('change', handleInjuryToggle);
    });
}

async function handleInjuryToggle(event) {
    const checkbox = event.target;
    const playerId = checkbox.dataset.playerId;
    const isInjured = checkbox.checked;

    checkbox.disabled = true;

    try {
        const response = await fetch(`/api/players/${playerId}/injury?isInjured=${isInjured}`, {
            method: 'PATCH'
        });

        if (!response.ok) {
            throw new Error('Failed to update injury status');
        }

        const listItem = checkbox.closest('.roster-item');
        listItem.classList.toggle('injured', isInjured);

        const nameSpan = listItem.querySelector('.roster-player-name');
        const baseName = nameSpan.textContent.replace('Injured', '').trim();
        nameSpan.innerHTML = isInjured
            ? `${baseName} <span class="injury-label">Injured</span>`
            : baseName;
    } catch (err) {
        checkbox.checked = !isInjured;
        errorMessage.textContent = 'Could not update injury status. Try again.';
        errorMessage.classList.remove('hidden');
    } finally {
        checkbox.disabled = false;
    }
}

teamPicker.addEventListener('change', () => {
    const teamId = teamPicker.value;
    if (teamId) {
        loadRoster(teamId);
    } else {
        rosterList.classList.add('hidden');
    }
});

loadTeams();
