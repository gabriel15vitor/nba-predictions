const homeSelect = document.getElementById('home-team');
const awaySelect = document.getElementById('away-team');
const predictBtn = document.getElementById('predict-btn');
const errorMessage = document.getElementById('error-message');
const resultBox = document.getElementById('result');

async function loadTeams() {
    try {
        const response = await fetch('/api/team-stats/teams');
        const teams = await response.json();

        homeSelect.innerHTML = '<option value="">Select team</option>';
        awaySelect.innerHTML = '<option value="">Select team</option>';

        teams.forEach(team => {
            const homeOption = document.createElement('option');
            homeOption.value = team.teamId;
            homeOption.textContent = team.teamName;
            homeSelect.appendChild(homeOption);

            const awayOption = document.createElement('option');
            awayOption.value = team.teamId;
            awayOption.textContent = team.teamName;
            awaySelect.appendChild(awayOption);
        });
    } catch (err) {
        errorMessage.textContent = 'Could not load teams. Is the backend running?';
        errorMessage.classList.remove('hidden');
    }
}

async function predict() {
    const home = homeSelect.value;
    const away = awaySelect.value;

    errorMessage.classList.add('hidden');
    resultBox.classList.add('hidden');

    if (!home || !away) {
        errorMessage.textContent = 'Select both a home team and an away team.';
        errorMessage.classList.remove('hidden');
        return;
    }

    if (home === away) {
        errorMessage.textContent = 'Select two different teams.';
        errorMessage.classList.remove('hidden');
        return;
    }

    try {
        const response = await fetch(`/predict?home=${home}&away=${away}`);

        if (!response.ok) {
            throw new Error('Prediction failed');
        }

        const data = await response.json();
        showResult(data);
    } catch (err) {
        errorMessage.textContent = 'Could not calculate prediction. Try again.';
        errorMessage.classList.remove('hidden');
    }
}

function showResult(data) {
    document.getElementById('home-name').textContent = data.homeTeam;
    document.getElementById('away-name').textContent = data.awayTeam;
    document.getElementById('home-percent').textContent = data.homeProbability.toFixed(1) + '%';
    document.getElementById('away-percent').textContent = data.awayProbability.toFixed(1) + '%';
    document.getElementById('home-bar').style.width = data.homeProbability + '%';

    resultBox.classList.remove('hidden');
}

predictBtn.addEventListener('click', predict);
loadTeams();