const loading = document.getElementById('loading');
const errorMessage = document.getElementById('error-message');
const rankingList = document.getElementById('ranking-list');

async function loadChampionRanking() {
    try {
        const response = await fetch('/predict/champion');

        if (!response.ok) {
            throw new Error('Failed to load ranking');
        }

        const teams = await response.json();
        renderRanking(teams);
    } catch (err) {
        loading.classList.add('hidden');
        errorMessage.textContent = 'Could not load the champion ranking. Is the backend running?';
        errorMessage.classList.remove('hidden');
    }
}

function renderRanking(teams) {
    loading.classList.add('hidden');
    rankingList.innerHTML = '';

    teams.forEach((team, index) => {
        const rank = index + 1;
        const li = document.createElement('li');
        li.className = 'ranking-item' + (rank === 1 ? ' top' : '');

        li.innerHTML = `
            <span class="rank-number">${rank === 1 ? '<span class="trophy">🏆</span>' : rank}</span>
            <div class="rank-info">
                <div class="rank-team">${team.teamName}</div>
                <div class="rank-stats">
                    Win% ${(team.winPct * 100).toFixed(1)} · Net rating ${team.netRating.toFixed(1)} · eFG% ${(team.efgPct * 100).toFixed(1)}
                </div>
            </div>
            <span class="rank-score">${team.score.toFixed(2)}</span>
        `;

        rankingList.appendChild(li);
    });

    rankingList.classList.remove('hidden');
}

loadChampionRanking();