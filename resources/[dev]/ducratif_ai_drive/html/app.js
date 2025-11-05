// === Changelog / Mises à jour ===
// Tu ajoutes ici de nouvelles entrées (ordre libre).
// id doit être unique, date au format YYYY-MM-DD (sert pour "non lu").

//Exemple d'update:
//{
//    id: "2025-09-01A",                                                  --ID UNIQUE, VRAIMENT UNIQUE !!!!!!!
//    date: "2025-09-01",                                                 --Bien mettre la date en YYYY-MM-DD (Elle sera automatiquement trié en DD-MM-YYY)
//    title: "Régulateur & Limitateur — nouveau comportement",            --Tout est dis dans la const
//    tags: ["Amélioration"],                                             --Nouveau / Amélioration / Correctif
//    items: [
//      "Activation/désactivation .",
//      "Coiffe moteur via Limitateur + consigne Régulateur synchronisée.",
//      "Compat police / zones interdites inchangée."                         --Une ligne = Bah une ligne MDR
//    ],
//    important: true                                                         --Met en valeur
//  },

const IA_UPDATES = [
//=================================================================================
  {
    id: "2025-09-01-V1",
    date: "2025-09-01",
    title: "Déploiement V1 — Système de conduite assistée",
    tags: ["Nouveau", "Important"],
    items: [
      "Activation auprès du technicien puis calibrage en 3 points autour de l’atelier.",
      "Modes de conduite disponibles : Souple, Rapide, Violente.",
      "Limitateur et Régulateur installables ; réglages enregistrés par véhicule.",
      "Évitement de collisions : freinage d’urgence à courte distance.",
      "Favoris de destination et historique des trajets automatiques.",
      "Arrêt de sécurité possible sur demande des patrouilles (sirènes actives).",
      "Zones restreintes : l’IA se coupe automatiquement à l’entrée.",
      "Durabilité des modules : utilisez des Modules IA pour restaurer leurs performances."
    ],
    important: true
  },
  {
    id: "2025-09-01-NOTES",
    date: "2025-09-01",
    title: "Consignes d’utilisation",
    tags: ["Nouveau"],
    items: [
      "Placez un point GPS ou choisissez un favori pour lancer un trajet.",
      "Limitateur actif si une vitesse > 0 est enregistrée ; 0 = désactivé.",
      "Régulateur maintient la vitesse choisie pendant la conduite IA.",
      "Commande /ia_stop pour reprendre immédiatement le contrôle du véhicule."
    ]
  }
//=================================================================================
];


//////////////////////////////////////////////////////////////////////
let currentPlate = null;
let npcMode = false;
let state = null;
let brand = 'IA Drive';
let theme = '#00ffc8';

// helper pour lire des flags renvoyés en 1 / "1" / true
const isTrue = (v) => v === true || v === 1 || v === '1';

window.addEventListener('message', (e) => {
  const data = e.data;
  if (data.type === 'panel:open') {
    npcMode = false;
    currentPlate = data.plate;
    state = data.state;
    brand = data.brand || brand;
    theme = data.theme || theme;
    openUI();
  } else if (data.type === 'panel:launchAnimation') {
    showBigAnim();
    document.getElementById('app').classList.add('hidden');
    document.body.classList.remove('nui-dark');
  } else if (data.type === 'purchase:ok') {
    toast('Achat confirmé.');
    if (data.option === 'driving_mode') {
      const selected = document.querySelector('input[name="drivemode"]:checked');
      if (selected) state.driving_mode = selected.value;
    } else if (data.option === 'limiter') {
      state.limiter_installed = 1; // installé
    } else if (data.option === 'cruise') {
      state.cruise_installed = 1;  // installé
    } else if (data.option === 'collision_avoid') {
      state.collision_avoid_enabled = 1;
    } else if (data.option === 'lawless') {
      state.lawless_enabled = 1;
    }
    renderOptions();
    refreshHistory();
    } else if (data.type === 'purchase:fail') {
      const r = data.reason || 'inconnu';
      const map = {
        money: "Fonds insuffisants.",
        not_calibrated: "Calibrage requis avant l'achat.",
        already: "Déjà acheté pour ce véhicule.",
        not_owner: "Ce véhicule ne vous appartient pas.",
        no_ai_row: "Activez d'abord l'IA chez le PNJ."
      };
      toast('Achat refusé : ' + (map[r] || r));
  } else if (data.type === 'npc:open') {
    npcMode = true;
    currentPlate = data.plate;
    state = data.state || {};
    brand = data.brand || brand;
    theme = data.theme || theme;
    openUI();
    renderNPC();
    activateTab('npc');
  }

});


function openUI() {
  document.body.classList.add('nui-dark');
  document.getElementById('brand').innerText = brand;
  document.body.style.setProperty('--theme', theme);
  document.getElementById('app').classList.remove('hidden');
  document.querySelectorAll('.tab').forEach(b=>b.classList.remove('active'));
  document.querySelectorAll('.tab-content').forEach(c=>c.classList.remove('active'));
  document.querySelector('[data-tab="panel"]').classList.add('active');
  document.getElementById('tab-panel').classList.add('active');
  renderOptions();
  renderUpdates();
  refreshHistory();
}

document.getElementById('btn-close').addEventListener('click', () => {
  document.getElementById('app').classList.add('hidden');
  document.body.classList.remove('nui-dark');
  fetchNUI('close');
});

document.querySelectorAll('.tab').forEach(btn=>{
  btn.addEventListener('click', () => {
    const tab = btn.dataset.tab;
    document.querySelectorAll('.tab').forEach(b=>b.classList.remove('active'));
    document.querySelectorAll('.tab-content').forEach(c=>c.classList.remove('active'));
    btn.classList.add('active');
    document.getElementById('tab-'+tab).classList.add('active');
  });
});

document.getElementById('btn-start').addEventListener('click', () => {
  fetchNUI('startAI', {});
});

document.getElementById('btn-save').addEventListener('click', () => {
  const selectedMode   = document.querySelector('input[name="drivemode"]:checked');
  const limiterEnabled = document.getElementById('limiter-enabled').checked;
  const limiterSpeed   = parseInt(document.getElementById('limiter-speed').value || '0', 10);
  const cruiseEnabled  = document.getElementById('cruise-enabled').checked;
  const cruiseSpeed    = parseInt(document.getElementById('cruise-speed').value || '0', 10);
  const lawlessActive = document.getElementById('lawless-enabled')?.checked || false;

  fetchNUI('saveSettings', {
    plate: currentPlate,
    settings: {
      driving_mode:    selectedMode ? selectedMode.value : 'souple',
      limiter_enabled: limiterEnabled,
      limiter_speed_kmh: limiterSpeed,
      cruise_enabled:  cruiseEnabled,
      cruise_speed_kmh: cruiseSpeed,
      lawless_active: lawlessActive
    }
  });

  // MAJ immédiate de l'état local (le serveur forcera à 0 si non acheté)
  if (state) {
    if (state.driving_mode) { state.driving_mode = selectedMode ? selectedMode.value : state.driving_mode; }
    if (isTrue(state.limiter_enabled)) { state.limiter_speed_kmh = limiterEnabled ? limiterSpeed : 0; }
    if (isTrue(state.cruise_enabled))  { state.cruise_speed_kmh  = cruiseEnabled  ? cruiseSpeed  : 0; }
  }

  renderOptions();
  toast('Options sauvegardées.');
});


document.querySelectorAll('.buy').forEach(btn => {
  //console.log('BUY CLICK', btn.dataset.option);
  btn.addEventListener('click', () => {
    // sécurité au moment du clic (ET PAS avant d'attacher le listener)
    if (btn.disabled || btn.classList.contains('bought')) return;

    const calibrated = isTrue(state && state.calibrated);
    if (!calibrated && btn.dataset.option !== 'fav_slot') {
      toast("Calibrez l'IA avant d'acheter des options.");
      return;
    }

    const opt = btn.dataset.option;

    if (opt === 'driving_mode') {
      const selectedMode = document.querySelector('input[name="drivemode"]:checked');
      if (!selectedMode) return toast('Choisissez un mode.');
      fetchNUI('purchaseOption', { plate: currentPlate, optionKey: 'driving_mode', args: { mode: selectedMode.value } });
    } else if (opt === 'limiter') {
      fetchNUI('purchaseOption', { plate: currentPlate, optionKey: 'limiter' });
    } else if (opt === 'cruise') {
      fetchNUI('purchaseOption', { plate: currentPlate, optionKey: 'cruise' });
    } else if (opt === 'collision_avoid') {
      fetchNUI('purchaseOption', { plate: currentPlate, optionKey: 'collision_avoid' });
    } else if (opt === 'fav_slot') {
      fetchNUI('purchaseOption', { optionKey: 'fav_slot' });
     } else if (opt === 'lawless') {
      fetchNUI('purchaseOption', { plate: currentPlate, optionKey: 'lawless' });
    }
  });
});



function renderOptions() {
  const calibrated = isTrue(state && state.calibrated);

  // mode affiché (visuel)
  const currentMode = (state && state.driving_mode) ? state.driving_mode : 'souple';
  const dmInput = document.querySelector('input[name="drivemode"][value="'+currentMode+'"]');
  if (dmInput) dmInput.checked = true;

  // installé (acheté) ?
  const limiterInstalled = isTrue(state && (state.limiter_installed ?? state.limiter_enabled));
  const cruiseInstalled  = isTrue(state && (state.cruise_installed  ?? state.cruise_enabled));
  const collUnlocked     = isTrue(state && state.collision_avoid_enabled);
  const dmPurchased      = !!(state && state.driving_mode);

  // actif = installé ET speed > 0
  const limSpeed = state ? (state.limiter_speed_kmh || 0) : 0;
  const cruSpeed = state ? (state.cruise_speed_kmh  || 0) : 0;

  document.getElementById('limiter-enabled').checked = limiterInstalled && (limSpeed > 0);
  document.getElementById('limiter-speed').value     = limSpeed;

  document.getElementById('cruise-enabled').checked  = cruiseInstalled && (cruSpeed > 0);
  document.getElementById('cruise-speed').value      = cruSpeed;

  const btnDM   = document.querySelector('.buy[data-option="driving_mode"]');
  const btnLim  = document.querySelector('.buy[data-option="limiter"]');
  const btnCru  = document.querySelector('.buy[data-option="cruise"]');
  const btnColl = document.querySelector('.buy[data-option="collision_avoid"]');

  const lawlessInstalled = isTrue(state && state.lawless_enabled);
  const lawlessActive    = isTrue(state && state.lawless_active);

  const lawlessToggle = document.getElementById('lawless-enabled');
  if (lawlessToggle) {
    lawlessToggle.checked  = lawlessInstalled && lawlessActive;
    lawlessToggle.disabled = !lawlessInstalled;
  }


  if (btnDM)   btnDM.disabled   = !calibrated || dmPurchased;
  if (btnLim)  btnLim.disabled  = !calibrated || limiterInstalled;
  if (btnCru)  btnCru.disabled  = !calibrated || cruiseInstalled;
  if (btnColl) btnColl.disabled = !calibrated || collUnlocked;

  updateBuyButtons();
}




function updateBuyButtons() {
  const calibrated = isTrue(state && state.calibrated);

  const bDriving = document.querySelector('.buy[data-option="driving_mode"]');
  const bLimiter = document.querySelector('.buy[data-option="limiter"]');
  const bCruise  = document.querySelector('.buy[data-option="cruise"]');
  const bCollide = document.querySelector('.buy[data-option="collision_avoid"]');
  const bLawless = document.querySelector('.buy[data-option="lawless"]');

  function setBtn(btn, bought, gateDisabled, labelReady, labelBought) {
    if (!btn) return;
    btn.disabled = gateDisabled || bought;
    btn.classList.toggle('bought', !!bought);
    btn.textContent = bought ? (labelBought || 'Déjà acheté') : (labelReady || btn.textContent);
  }

  function setBtn(btn, bought, gateDisabled, labelReady, labelBought) {
    if (!btn) return;
    btn.disabled = gateDisabled || bought;
    btn.classList.toggle('bought', !!bought);
    btn.textContent = bought ? (labelBought || 'Déjà acheté') : (labelReady || btn.textContent);
  }

  // état “acheté” par véhicule
  const drivingBought = !!(state && state.driving_mode);
  const limiterBought = isTrue(state && (state.limiter_installed ?? state.limiter_enabled));
  const cruiseBought  = isTrue(state && (state.cruise_installed  ?? state.cruise_enabled));
  const collideBought = isTrue(state && state.collision_avoid_enabled);
  const lawlessBought = isTrue(state && state.lawless_enabled);

  // gate = non calibré → tout grisé (sauf favoris qui n’est pas ici)
  const gate = !calibrated;

  setBtn(bDriving, drivingBought, gate, 'Acheter ce mode (350 000$)', 'Déjà acheté');
  setBtn(bLimiter, limiterBought, gate, 'Acheter Limitateur (200 000$)', 'Déjà acheté');
  setBtn(bCruise,  cruiseBought,  gate, 'Acheter Régulateur (250 000$)', 'Déjà acheté');
  setBtn(bCollide, collideBought, gate, 'Acheter (350 000$)', 'Déjà acheté');
  setBtn(bLawless, lawlessBought, !calibrated, 'Acheter Conduite hors code (350 000$)', 'Déjà acheté');

  // désactiver les contrôles si non achetés
  const elLE = document.getElementById('limiter-enabled');
  const elLS = document.getElementById('limiter-speed');
  const elCE = document.getElementById('cruise-enabled');
  const elCS = document.getElementById('cruise-speed');

  if (elLE) elLE.disabled = !limiterBought;
  if (elLS) elLS.disabled = !limiterBought;
  if (elCE) elCE.disabled = !cruiseBought;
  if (elCS) elCS.disabled = !cruiseBought;
}


function renderNPC() {
  const stateBox = document.getElementById('npc-state');

  // tolère number 1 ou string "1"
  const enabled    = state && (state.enabled === 1 || state.enabled === '1');
  const calibrated = state && (state.calibrated === 1 || state.calibrated === '1');

  stateBox.innerHTML = `
    <div class="item"><span>PLAQUE</span><b>${currentPlate||'?'}</b></div>
    <div class="item"><span>IA</span><b>${enabled ? 'Activée' : 'Désactivée'}</b></div>
    <div class="item"><span>Calibration</span><b>${calibrated ? 'OK' : 'À faire'}</b></div>
  `;
  document.getElementById('npc-enable').disabled  = enabled;
  document.getElementById('npc-disable').disabled = !enabled;
}


function refreshHistory() {
  fetchNUI('getHistory', {}).then(data => {
    // history
    const list = document.getElementById('history-list');
    list.innerHTML = '';
    (data.history || []).forEach(h => {
      const el = document.createElement('div');
      el.className = 'item';
      el.innerHTML = `<div><b>${h.from_label||'Point A'}</b> → <b>${h.to_label||'Point B'}</b></div>
                      <div>${new Date(h.created_at).toLocaleDateString('fr-FR', {
                        day: '2-digit',
                        month: '2-digit',
                        year: 'numeric',
                        hour: '2-digit',
                        minute: '2-digit',
                        second: '2-digit'
                      })}</div>
                      `;
      list.appendChild(el);
    });

    // favorites
    document.getElementById('fav-meta').innerText = `Slots: ${(data.favorites||[]).length}/${data.slots}`;
    const fav = document.getElementById('fav-list');
    fav.innerHTML = '';
    (data.favorites||[]).forEach(fv => {
      const el = document.createElement('div');
      el.className = 'item';

      el.innerHTML = `
        <div><b>${fv.label}</b> <span>(${fv.x.toFixed(1)}, ${fv.y.toFixed(1)})</span></div>
        <div>
          <button class="primary" data-action="go">Aller</button>
          <button class="danger"  data-action="del">Supprimer</button>
        </div>`;

      // Aller -> démarre l'IA vers le favori
      el.querySelector('button[data-action="go"]').addEventListener('click', () => {
        fetchNUI('startAITo', {
          plate: currentPlate,                    // utile côté client si besoin
          target: { x: fv.x, y: fv.y, z: fv.z }, // coords exactes
          to_label: fv.label                      // (on s’en servira + tard pour l’historique)
        });
      });

      // Supprimer -> inchangé
      el.querySelector('button[data-action="del"]').addEventListener('click', () => {
        fetchNUI('fav:remove', { id: fv.id }).then(() => refreshHistory());
      });

      fav.appendChild(el);
    });
  });
}


document.getElementById('npc-enable').addEventListener('click', ()=>{
  fetchNUI('npc:enable', { plate: currentPlate });
});
document.getElementById('npc-disable').addEventListener('click', ()=>{
  fetchNUI('npc:disable', { plate: currentPlate });
});

function fetchNUI(name, data) {
  return fetch(`https://${GetParentResourceName()}/${name}`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json; charset=UTF-8' },
    body: JSON.stringify(data || {})
  }).then(r=>r.json()).catch(()=>({}));
}

function toast(msg) {
  const t = document.getElementById('toast');
  t.innerText = msg;
  t.classList.remove('hidden');
  t.style.opacity = 1;
  t.style.transform = 'translateY(0)';
  setTimeout(()=>{
    t.style.opacity = 0;
    t.style.transform = 'translateY(8px)';
    setTimeout(()=>t.classList.add('hidden'), 250);
  }, 1800);
}

function showBigAnim() {
  const el = document.getElementById('big-anim');
  el.classList.remove('hidden');
  setTimeout(()=>el.classList.add('hidden'), 1200);
}


window.addEventListener('keydown', (e) => {
  if (e.key === 'Escape') {
    document.getElementById('app').classList.add('hidden');
    document.body.classList.remove('nui-dark');
    fetchNUI('close');
  }
});


function activateTab(name) {
  document.querySelectorAll('.tab').forEach(b=>b.classList.remove('active'));
  document.querySelectorAll('.tab-content').forEach(c=>c.classList.remove('active'));
  const btn = document.querySelector(`.tab[data-tab="${name}"]`);
  const pane = document.getElementById(`tab-${name}`);
  if (btn) btn.classList.add('active');
  if (pane) pane.classList.add('active');
}

////////////////////////////////////////////////////
// Affichage FR "DD-MM-YYYY" sans conversions de fuseau
function formatDateFR(iso) {
  if (!iso || typeof iso !== 'string') return '';
  const [y, m, d] = iso.split('-');
  return `${d.padStart(2,'0')}-${m.padStart(2,'0')}-${y}`;
}

// rend le panneau "Mises à jour"
function renderUpdates() {
  const list = document.getElementById('updates-list');
  if (!list) return;

  const lastSeen = localStorage.getItem('ia_updates_last_seen') || "1970-01-01";
  const unseen = IA_UPDATES.some(u => u.date > lastSeen);
  const badge = document.getElementById('updates-badge');
  if (badge) badge.classList.toggle('hidden', !unseen);

  const activeChip = document.querySelector('.chip.active');
  const filter = activeChip ? activeChip.dataset.filter : "Tous";

  const frag = document.createDocumentFragment();
  IA_UPDATES
    .sort((a, b) => (a.date < b.date ? 1 : -1))
    .forEach(u => {
      if (filter !== "Tous" && !(u.tags || []).includes(filter)) return;

      const card = document.createElement('div');
      card.className = 'update-card';
      card.dataset.id = u.id;

      const tagsHTML = (u.tags || []).map(t => {
        const cls = t === "Correctif" ? "tag fix" : t === "Amélioration" ? "tag improve" : "tag new";
        return `<span class="${cls}">${t}</span>`;
      }).join('');

      card.innerHTML = `
        <div class="update-head">
          <div>
            <div class="update-title">${u.title}</div>
            <div class="update-meta">${formatDateFR(u.date)} ${tagsHTML}</div>
          </div>
          <button class="update-toggle" aria-expanded="false">Détails</button>
        </div>
        <div class="update-body">
          <div class="update-items">
            <ul>${(u.items || []).map(i => `<li>${i}</li>`).join('')}</ul>
          </div>
        </div>
      `;
      frag.appendChild(card);
    });

  list.innerHTML = '';
  list.appendChild(frag);
}

// interactions (toggle / filtres / tout lu)
document.addEventListener('click', (e) => {
  // Toggle d'une carte
  const toggle = e.target.closest('.update-toggle');
  if (toggle) {
    const card = toggle.closest('.update-card');
    const open = card.classList.toggle('open');
    toggle.setAttribute('aria-expanded', open ? 'true' : 'false');
  }

  // Filtres
  const chip = e.target.closest('.chip');
  if (chip && chip.dataset.filter) {
    document.querySelectorAll('.chip').forEach(c=>c.classList.remove('active'));
    chip.classList.add('active');
    renderUpdates();
  }

  // Tout marquer comme lu
  if (e.target && e.target.id === 'btn-mark-read') {
    // on prend la date la plus récente
    const latest = IA_UPDATES.reduce((acc,u)=> u.date > acc ? u.date : acc, "1970-01-01");
    localStorage.setItem('ia_updates_last_seen', latest);
    const badge = document.getElementById('updates-badge');
    if (badge) badge.classList.add('hidden');
  }
});
