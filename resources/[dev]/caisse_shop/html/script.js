const resourceName = GetParentResourceName();
// ========== script.js (joueur) ==========

let adminMode = false;
let allBoxes = [];
// NE PAS ouvrir la boutique par défaut
//document.getElementById('container').style.display = 'none';
//document.getElementById('reward-page').classList.add('hidden');


// 🔒 On ferme toutes les sections possibles
    document.getElementById('container').style.display = 'none';
    document.getElementById('box-detail').classList.add('hidden');
    document.getElementById('reward-page').classList.add('hidden');
    document.getElementById('categoryFilter').style.display = 'none';
    document.getElementById('sortFilter').style.display = 'none';
    document.body.style.backgroundColor = 'transparent';



    // 🔄 Reset optionnel : vider contenu & filtres
    document.getElementById('box-list').innerHTML = '';
    document.getElementById('categoryFilter').selectedIndex = 0;
    document.getElementById('sortFilter').selectedIndex = 0;


document.getElementById('closeBtn').addEventListener('click', () => {
    fetch(`https://${GetParentResourceName()}/closeLootboxShop`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: '{}'
    });

    // 🔒 On ferme toutes les sections possibles
    document.getElementById('container').style.display = 'none';
    document.getElementById('box-detail').classList.add('hidden');
    document.getElementById('reward-page').classList.add('hidden');
    document.getElementById('categoryFilter').style.display = 'none';
    document.getElementById('sortFilter').style.display = 'none';
    document.body.style.backgroundColor = 'transparent';


    // 🔄 Reset optionnel : vider contenu & filtres
    document.getElementById('box-list').innerHTML = '';
    document.getElementById('categoryFilter').selectedIndex = 0;
    document.getElementById('sortFilter').selectedIndex = 0;
});

document.getElementById('backBtn').addEventListener('click', () => {
    document.getElementById('box-detail').classList.add('hidden');
    document.getElementById('box-list').style.display = 'flex';
});

function renderBoxList(boxes) {
    if (!boxes || !Array.isArray(boxes)) return;

    const boxList = document.getElementById('box-list');
    boxList.innerHTML = '';

    boxes.forEach(box => {
        const card = document.createElement('div');
        card.className = 'box-card';

        let html = `
            <img src="${box.image_url}" alt="Box image">
            <h3>${box.name}</h3>
            <p>${box.short_description}</p>
        `;

        if (box.tags && box.tags.length > 0) {
            html += `<div class="tags">${box.tags.map(t => `<span class="tag">${t}</span>`).join(' ')}</div>`;
        }

        card.innerHTML = html;
        card.addEventListener('click', () => showBoxDetails(box));
        boxList.appendChild(card);
    });
}


let selectedBox = null;

function showBoxDetails(box) {
    if (document.getElementById('container').style.display === 'none') return; // sécurité
    selectedBox = box;

    // ... (déjà présent)
    document.getElementById('detail-name').textContent = box.name;
    document.getElementById('detail-description').textContent = box.long_description;

    // Items
    const itemList = document.getElementById('detail-items');
    itemList.innerHTML = '';
    box.contents?.forEach(item => {
        const li = document.createElement('li');
        li.textContent = `${item.item_name} x${item.amount} (${item.rarity})`;
        itemList.appendChild(li);
    });

    // Paiements
    const payments = document.getElementById('detail-payments');
    payments.innerHTML = '<strong>Prix :</strong><br>';
    box.payments.forEach(pay => {
        let label = '';
        switch (pay.payment_type) {
            case 'money': label = `💸 $${pay.payment_value}`; break;
            case 'item': label = `🔑 Item : ${pay.payment_value}`; break;
            case 'team_points': label = `🎯 Points équipe : ${pay.payment_value}`; break;
            case 'player_points': label = `🎖️ Points perso : ${pay.payment_value}`; break;
        }
        payments.innerHTML += `<div>${label}</div>`;
    });

    // 👇 A AJOUTER
    document.getElementById('box-list').style.display = 'none';
    document.getElementById('box-detail').classList.remove('hidden');
}


document.getElementById('buyBtn').addEventListener('click', () => {
    if (!selectedBox) return;

    fetch(`https://${GetParentResourceName()}/buyLootbox`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ boxId: selectedBox.id })
    }).then(() => {
        fetch(`https://${GetParentResourceName()}/closeUI`, {
            method: 'POST',
            body: '{}'
        });

        // On ferme toutes les sections
        document.getElementById('container').style.display = 'none';
        document.getElementById('box-detail').classList.add('hidden');
        document.getElementById('reward-page').classList.add('hidden');
        document.getElementById('categoryFilter').style.display = 'none';
        document.getElementById('sortFilter').style.display = 'none';
        document.getElementById('box-list').innerHTML = '';
        document.body.style.backgroundColor = 'transparent';
        fetch(`https://${GetParentResourceName()}/disableNuiFocus`, {// ✅ on enlève le focus !
            method: 'POST',
            body: '{}'
        });
 

        if (window.lib?.notify) {
            lib.notify({
                title: "🎁 Caisse ouverte",
                description: `Tu viens d'ouvrir la caisse ${selectedBox.name}`,
                type: "success",
                duration: 10000
            });
        }
    });

});


//REWARD LIST
document.getElementById('rewardBtn').addEventListener('click', () => {
    fetch(`https://${GetParentResourceName()}/getRewards`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: '{}'
    })
    .then(res => res.json())
    .then(data => {
        renderRewards(data);
        document.getElementById('container').style.display = 'none';
        document.getElementById('reward-page').classList.remove('hidden');
    });
});

document.getElementById('rewardBackBtn').addEventListener('click', () => {
    document.getElementById('reward-page').classList.add('hidden');
    document.getElementById('container').style.display = 'block';
});

function renderRewards(rewards) {
    const list = document.getElementById('reward-list');
    list.innerHTML = '';

    if (rewards.length === 0) {
        list.innerHTML = '<p>Tu n’as aucune récompense non réclamée.</p>';
        return;
    }

    rewards.forEach(reward => {
        const card = document.createElement('div');
        card.className = 'reward-card';

        card.innerHTML = `
            <h3>${reward.name}</h3>
            <p>${reward.short_description}</p>
            <button onclick="claimReward(${reward.reward_id})">Récupérer</button>
        `;

        list.appendChild(card);
    });
}



function initFilters(boxes) {
    const catSet = new Set();
    boxes.forEach(box => catSet.add(box.category || 'Autre'));

    const catSelect = document.getElementById('categoryFilter');
    catSelect.innerHTML = `<option value="all">Toutes les catégories</option>`;
    [...catSet].forEach(cat => {
        catSelect.innerHTML += `<option value="${cat}">${cat}</option>`;
    });
}

function filterBoxes() {
    const category = document.getElementById('categoryFilter').value;
    const sort = document.getElementById('sortFilter').value;

    let filtered = [...allBoxes];

    if (category !== 'all') {
        filtered = filtered.filter(b => (b.category || 'Autre') === category);
    }

    if (sort === 'name') {
        filtered.sort((a, b) => a.name.localeCompare(b.name));
    } else if (sort === 'price') {
        filtered.sort((a, b) => {
            const pa = getMoneyPrice(a);
            const pb = getMoneyPrice(b);
            return pa - pb;
        });
    }

    renderBoxList(filtered);
}

function getMoneyPrice(box) {
    const price = box.payments.find(p => p.payment_type === 'money');
    return price ? parseInt(price.payment_value) : 9999999;
}




// ========== admin.js (admin intégré) ==========

document.addEventListener('DOMContentLoaded', () => {
    if (typeof GetParentResourceName !== 'function') {
        alert("Ce fichier ne doit être ouvert que via le jeu (FiveM).");
        return;
    }

    window.addEventListener('message', function (event) {
        const data = event.data;
        //console.log('[NUI] Message reçu:', data);

        if (data.action === 'openAdmin') {
            document.getElementById('container').style.display = 'none';
            document.getElementById('admin-page').classList.remove('hidden');
            fetchAllBoxes();
        }

        if (data.action === 'openLootboxShopDucratifs') {
            adminMode = false;

            document.getElementById('admin-page')?.classList.add('hidden');
            document.getElementById('container').style.display = 'block';
            document.getElementById('box-detail').classList.add('hidden');
            document.getElementById('reward-page').classList.add('hidden');
            document.getElementById('box-list').style.display = 'flex';
            document.body.style.backgroundColor = '#10131a';
            document.getElementById('categoryFilter').style.display = 'inline-block';
            document.getElementById('sortFilter').style.display = 'inline-block';

            allBoxes = data.boxes;
            initFilters(allBoxes);
            renderBoxList(allBoxes);
        }


    });

    window.closeAdmin = function() {
        fetch(`https://${GetParentResourceName()}/closeAdmin`, {
            method: 'POST',
            body: '{}'
        });
    }

    window.toggleBox = function(id, state) {
        fetch(`https://${GetParentResourceName()}/adminToggleBox`, {
            method: 'POST',
            body: JSON.stringify({ id: id, state: state })
        }).then(fetchAllBoxes);
    }

    window.deleteBox = function(id) {
        fetch(`https://${GetParentResourceName()}/adminDeleteBox`, {
            method: 'POST',
            body: JSON.stringify({ id: id })
        }).then(fetchAllBoxes);
    }

    window.fetchLogs = function() {
        const player = document.getElementById('filter-player').value;
        const team = document.getElementById('filter-team').value;

        fetch(`https://${GetParentResourceName()}/adminGetLogs`, {
            method: 'POST',
            body: JSON.stringify({ player: player, team: team })
        })
        .then(res => res.json())
        .then(logs => {
            document.getElementById('admin-logs').classList.remove('hidden');
            const tbody = document.querySelector('#logs-table tbody');
            tbody.innerHTML = '';
            logs.forEach(log => {
                const row = document.createElement('tr');
                row.innerHTML = `
                    <td>${log.bought_at}</td>
                    <td>${log.buyer_identifier}</td>
                    <td>${log.box_name}</td>
                    <td>${log.payment_type}</td>
                    <td>${log.items_given}</td>
                `;
                tbody.appendChild(row);
            });
        });
    }

    window.addBoxContent = function(name = '', amount = 1, rarity = 'common') {
        const container = document.getElementById('box-contents');
        const div = document.createElement('div');
        div.innerHTML = `
            <input placeholder="item_name" value="${name}">
            <input type="number" placeholder="amount" value="${amount}">
            <select>
                <option value="common" ${rarity === 'common' ? 'selected' : ''}>Commun</option>
                <option value="rare" ${rarity === 'rare' ? 'selected' : ''}>Rare</option>
                <option value="epic" ${rarity === 'epic' ? 'selected' : ''}>Épique</option>
            </select>
            <button onclick="this.parentNode.remove()">❌</button>
        `;
        container.appendChild(div);
    }

    window.addBoxPayment = function(type = 'money', value = '') {
        const container = document.getElementById('box-payments');
        const div = document.createElement('div');
        div.innerHTML = `
            <select>
                <option value="money" ${type === 'money' ? 'selected' : ''}>Argent</option>
                <option value="item" ${type === 'item' ? 'selected' : ''}>Item</option>
                <option value="player_points" ${type === 'player_points' ? 'selected' : ''}>Points perso</option>
                <option value="team_points" ${type === 'team_points' ? 'selected' : ''}>Points team</option>
            </select>
            <input placeholder="valeur (ex: 10000 ou nom d'item)" value="${value}">
            <button onclick="this.parentNode.remove()">❌</button>
        `;
        container.appendChild(div);
    }

    window.saveBox = function() {
        const id = document.getElementById('box-id').value;
        const name = document.getElementById('box-name').value;
        const category = document.getElementById('box-category').value;
        const tags = document.getElementById('box-tags').value;
        const short = document.getElementById('box-short').value;
        const long = document.getElementById('box-long').value;
        const image = document.getElementById('box-image').value;
        const isActive = document.getElementById('box-active').checked;
        const isRandom = document.getElementById('box-random').checked;

        const contents = [];
        document.querySelectorAll('#box-contents > div').forEach(div => {
            const [item, amount, rarity] = div.querySelectorAll('input, select');
            contents.push({
                item_name: item.value,
                amount: parseInt(amount.value),
                rarity: rarity.value
            });
        });

        const payments = [];
        document.querySelectorAll('#box-payments > div').forEach(div => {
            const [type, value] = div.querySelectorAll('select, input');
            payments.push({
                payment_type: type.value,
                payment_value: value.value
            });
        });

        fetch(`https://${GetParentResourceName()}/adminSaveBox`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({
                id: id !== '' ? parseInt(id) : null,
                name,
                short_description: short,
                long_description: long,
                image_url: image,
                is_active: isActive ? 1 : 0,
                is_random: isRandom ? 1 : 0,
                category,
                tags,
                contents,
                payments
            })
        }).then(() => {
            fetchAllBoxes();
            document.getElementById('box-id').value = '';
            document.getElementById('box-name').value = '';
            document.getElementById('box-short').value = '';
            document.getElementById('box-long').value = '';
            document.getElementById('box-image').value = '';
            document.getElementById('box-category').value = '';
            document.getElementById('box-tags').value = '';
            document.getElementById('box-active').checked = false;
            document.getElementById('box-random').checked = false;
            document.getElementById('box-contents').innerHTML = '';
            document.getElementById('box-payments').innerHTML = '';
            updateImagePreview();
        });
    }

    window.editBox = function(id) {
        fetch(`https://${GetParentResourceName()}/adminGetBoxDetails`, {
            method: 'POST',
            body: JSON.stringify({ id: id })
        })
        .then(res => res.json())
        .then(data => {
            const box = data.box;
            const contents = data.contents;
            const payments = data.payments;

            document.getElementById('box-id').value = box.id;
            document.getElementById('box-name').value = box.name;
            document.getElementById('box-category').value = box.category || '';
            let tags = [];
            try {
                tags = typeof box.tags === 'string' ? JSON.parse(box.tags) : box.tags || [];
            } catch (e) {
                tags = [];
            }
            document.getElementById('box-tags').value = tags.join(',');

            document.getElementById('box-short').value = box.short_description;
            document.getElementById('box-long').value = box.long_description;
            document.getElementById('box-image').value = box.image_url;
            updateImagePreview();
            document.getElementById('box-active').checked = box.is_active === 1;
            document.getElementById('box-random').checked = box.is_random === 1;

            const contentDiv = document.getElementById('box-contents');
            contentDiv.innerHTML = '';
            contents.forEach(c => {
                addBoxContent(c.item_name, c.amount, c.rarity);
            });

            const payDiv = document.getElementById('box-payments');
            payDiv.innerHTML = '';
            payments.forEach(p => {
                addBoxPayment(p.payment_type, p.payment_value);
            });
        });
    }

    window.duplicateBox = function(id) {
        fetch(`https://${GetParentResourceName()}/adminDuplicateBox`, {
            method: 'POST',
            body: JSON.stringify({ id: id })
        })
        .then(res => res.json())
        .then(data => {
            if (!data.success) return;

            const box = data.box;
            const contents = data.contents;
            const payments = data.payments;

            document.getElementById('box-id').value = box.id;
            document.getElementById('box-name').value = box.name + ' (copie)';
            document.getElementById('box-category').value = box.category || '';
            document.getElementById('box-tags').value = (box.tags || []).join(',');
            document.getElementById('box-short').value = box.short_description;
            document.getElementById('box-long').value = box.long_description;
            document.getElementById('box-image').value = box.image_url;
            updateImagePreview();
            document.getElementById('box-active').checked = false;
            document.getElementById('box-random').checked = box.is_random === 1;

            const contentDiv = document.getElementById('box-contents');
            contentDiv.innerHTML = '';
            contents.forEach(c => addBoxContent(c.item_name, c.amount, c.rarity));

            const payDiv = document.getElementById('box-payments');
            payDiv.innerHTML = '';
            payments.forEach(p => addBoxPayment(p.payment_type, p.payment_value));

            lib.notify && lib.notify({ description: 'Caisse dupliquée avec succès', type: 'inform' });
        });
    }

    window.updateImagePreview = function() {
        const url = document.getElementById('box-image').value;
        const preview = document.getElementById('box-image-preview');

        if (!url) {
            preview.innerHTML = '';
            return;
        }

        preview.innerHTML = `<img src="${url}" alt="Preview" style="max-width: 200px; border-radius: 10px; border: 1px solid #444;">`;
    }
});

//-------------------
// Page historique!

let historyPage = 1;
let allHistoryData = [];
let isOwnHistory = false;



function openHistory() {
    document.getElementById('container').style.display = 'none';
    document.getElementById('reward-page').classList.add('hidden');
    document.getElementById('history-page').classList.remove('hidden');
    fetchHistory();
}

function historyBack() {
    document.getElementById('history-page').classList.add('hidden');
    document.getElementById('container').style.display = 'block';
}

function fetchHistory() {
    fetch(`https://${GetParentResourceName()}/ducratif_lootbox:getLootboxHistory`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ page: historyPage, ownOnly: isOwnHistory })
    })
    .then(async res => {
        const text = await res.text();
        try {
            const data = JSON.parse(text);
            allHistoryData = data;
            renderHistory(data);
        } catch (e) {
            console.error("Réponse invalide de getLootboxHistory:", text);
        }
    });

}

function renderHistory(data) {
    const list = document.getElementById('history-list');
    list.innerHTML = '';

    if (data.length === 0) {
        list.innerHTML = '<p class="no-reward-msg">Aucun résultat.</p>';
        return;
    }

    data.forEach(entry => {
        const card = document.createElement('div');
        card.className = 'reward-card';
        card.innerHTML = `
            <h3>${entry.box_name}</h3>
            <p>👤 ${entry.firstname}</p>
            <p>🕒 ${entry.formatted_date}</p>
        `;
        list.appendChild(card);
    });
}

function changeHistoryPage(dir) {
    historyPage += dir;
    if (historyPage < 1) historyPage = 1;
    fetchHistory();
}

function filterHistory() {
    const input = document.getElementById('history-search').value.toLowerCase();
    const filtered = allHistoryData.filter(e =>
        e.firstname.toLowerCase().includes(input) ||
        e.box_name.toLowerCase().includes(input) ||
        e.formatted_date.toLowerCase().includes(input)
    );
    renderHistory(filtered);
}

function toggleOwnHistory() {
    isOwnHistory = !isOwnHistory;
    const btn = document.getElementById('toggle-own-history');
    btn.innerText = isOwnHistory ? "📜 Voir tout l'historique" : "👤 Voir mon historique";
    fetchHistory();
}


function fetchTopBuyers() {
    fetch(`https://${GetParentResourceName()}/ducratif_lootbox:getTopBuyers`, {
        method: 'POST'
    })
    .then(res => res.json())
    .then(data => {
        const list = document.getElementById('history-list');
        list.innerHTML = '';

        if (data.length === 0) {
            list.innerHTML = '<p class="no-reward-msg">Aucun acheteur trouvé.</p>';
            return;
        }

        data.forEach(entry => {
            const card = document.createElement('div');
            card.className = 'reward-card';
            card.innerHTML = `
                <h3>👑 ${entry.firstname}</h3>
                <p>🎁 ${entry.total} caisses achetées</p>
            `;
            list.appendChild(card);
        });
    });
}

//----------------------------------
//-----PAGE SAISON PASSE-----------


function openSaisonPasse() {
    document.getElementById('container').style.display = 'none'; // Cache la boutique
    document.getElementById('saisonpasse-page').style.display = 'block'; // Affiche la page saison passe
    fetchSaisonPasse();
}

function closeSaisonPasse() {
    document.getElementById('saisonpasse-page').style.display = 'none'; // Cache la page saison passe
    document.getElementById('container').style.display = 'block'; // Réaffiche la boutique
}

function closeSaisonPasseReward() {
    // Ferme toutes les sections de la page saison passe
    document.getElementById('saisonpasse-page').style.display = 'none';
    document.getElementById('container').style.display = 'none';
    document.getElementById('box-detail').classList.add('hidden');
    document.getElementById('reward-page').classList.add('hidden');
    document.getElementById('categoryFilter').style.display = 'none';
    document.getElementById('sortFilter').style.display = 'none';
    document.body.style.backgroundColor = 'transparent';

    // Reset optionnel
    document.getElementById('box-list').innerHTML = '';
    document.getElementById('categoryFilter').selectedIndex = 0;
    document.getElementById('sortFilter').selectedIndex = 0;

    // Demande côté Lua de retirer le focus NUI et de reset la logique d'ouverture
    fetch(`https://${GetParentResourceName()}/closeUI`, {
        method: 'POST',
        body: '{}'
    });
}






//Réclamation niveau saison passe:
function claimReward(level) {
  fetch(`https://${GetParentResourceName()}/ducratif_lootbox:claimSaisonReward`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ level: level }) // ✅ bien structuré
  })
  .then(res => res.json())
  .then(success => {
    if (success) {
      if (window.lib?.notify) {
        lib.notify({
          title: "🎁 Récompense réclamée !",
          description: `Récompense de niveau récupérée`,
          type: "success",
          duration: 10000
        });
      }
    } else {
      if (window.lib?.notify) {
        lib.notify({
          title: "❌ Réclamation impossible",
          description: `Tu n'as pas encore débloqué cette récompense !`,
          type: "error",
          duration: 10000
        });
      }
    }
  })
  .catch(err => {
    console.error("❌ Erreur lors de la réclamation :", err);
  });
  closeSaisonPasseReward(); // ✅ Ferme tout
}




function fetchSaisonPasse() {
  const resource = GetParentResourceName();

  fetch(`https://${resource}/ducratif_lootbox:getSaisonPasse`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: '{}'
  })
    .then(res => res.json())
    .then(data => {
      const infoDiv = document.getElementById('saisonpasse-info');
      const rewardsDiv = document.getElementById('saisonpasse-rewards');
      infoDiv.innerHTML = '';
      rewardsDiv.innerHTML = '';

      if (!data || typeof data !== 'object') {
        console.error("❌ Erreur : données saison passe nulles ou invalides !");
        infoDiv.innerHTML = `<p>Erreur de chargement du saison passe.</p>`;
        return;
      }

      if (!data.active) {
        const readableDate = data.next_date ? new Date(data.next_date).toLocaleDateString('fr-FR') : null;
        infoDiv.innerHTML = `<p>Aucun saison passe actif. ${readableDate ? 'Prochain saison passe le : ' + readableDate : 'Un nouveau saison passe arrive bientôt !'}</p>`;
        return;
      }

      const saison = data.saison;
      infoDiv.innerHTML = `
        <h3>${saison.name}</h3>
        <p>${saison.description}</p>
        <p>📅 Du ${new Date(saison.start_date).toLocaleDateString('fr-FR')} au ${new Date(saison.end_date).toLocaleDateString('fr-FR')}</p>
        <p>🔓 Niveau actuel : ${data.user_level}</p>
      `;

      for (const reward of data.rewards) {
        const claimed = data.claims.includes(reward.level);
        const canClaim = data.next_claimable === reward.level;
        const locked = reward.level > data.user_level;

        const card = document.createElement('div');
        card.className = 'reward-card';
        if (locked || claimed) card.classList.add('reward-locked');

        card.innerHTML = `
          <h4>Niveau ${reward.level}</h4>
          <img id="reward-img-${reward.level}" src="" alt="${reward.reward_value}">
          <p>${reward.label}</p>
          <p>Défi : ${reward.challenge_label}</p>
          ${canClaim && !claimed ? `<button onclick="claimReward(${reward.level})">🎁 Réclamer</button>` : claimed ? '<p>✔️ Réclamé</p>' : ''}
        `;

        const img = card.querySelector(`#reward-img-${reward.level}`);
        const imagePath = `nui://${resource}/html/img/${reward.reward_value}.png`;
        img.src = imagePath;

        img.onerror = () => {
          if (!img.dataset.fallback) {
            img.dataset.fallback = 'true';
            img.src = `nui://${resource}/html/img/default.png`;
            console.warn(`❌ Image manquante pour ${reward.reward_value}, fallback activé.`);
          }
        };

        //console.log(`🔍 Image reward: ${img.src}`);
        rewardsDiv.appendChild(card);
      }
    })
    .catch(err => {
      console.error("❌ Erreur lors du fetch saison passe :", err);
      document.getElementById('saisonpasse-info').innerHTML = `<p>Erreur de communication avec le serveur.</p>`;
    });
}




