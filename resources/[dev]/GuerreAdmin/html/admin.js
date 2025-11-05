window.addEventListener('message', function(event) {
    if (event.data.action === "open") {
        document.getElementById('admin-menu').style.display = 'flex';
        loadStaffInfos();
    }
});
document.getElementById('closebtn').onclick = () => {
    fetch(`https://${GetParentResourceName()}/close`, {method: "POST"});
    document.getElementById('admin-menu').style.display = 'none';
};
document.querySelectorAll('nav li').forEach(li => {
    li.onclick = () => {
        document.querySelectorAll('nav li').forEach(l => l.classList.remove('active'));
        li.classList.add('active');
        showTab(li.getAttribute('data-tab'));
    };
});

// Fermeture via touche ECHAP
document.addEventListener('keydown', function(event) {
    if (event.key === 'Escape' && document.getElementById('admin-menu').style.display !== 'none') {
        fetch(`https://${GetParentResourceName()}/close`, {method: "POST"});
        document.getElementById('admin-menu').style.display = 'none';
    }
});

function showTab(tab) {
    document.getElementById('main-panel').innerHTML = '<h2>Chargement...</h2>';
    if(tab === 'staff') showStaffTab();
    if(tab === 'player') showPlayersTab();
    if(tab === 'vehicle') showVehiclesTab();
    if(tab === 'grades') showGradesTab();
    if(tab === 'settings') showSettingsTab();
    if(tab === 'reports') showReportsTab();
}
function loadStaffInfos() {
    fetch(`https://${GetParentResourceName()}/adminmenu/getStaffInfos`, {method: "POST"})
        .then(r => r.json())
        .then(data => {
            if(!data.success) {
                document.getElementById('main-panel').innerHTML = `<h2>${data.msg}</h2>`;
            } else {
                document.getElementById('main-panel').innerHTML = `<h2>Bienvenue ${data.grade.label}</h2>`;
            }
        });
}
// Pour chaque showTab ajoute ton JS dynamique CRUD/actions ici selon module
