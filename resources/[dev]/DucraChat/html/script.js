let myId = null
let currentConv = null
let conversations = []
let messages = []
let delay = 600
let userOptions = {};
let myIdentifier = null;

// Gère la notification visuelle NUI
function showNotif(message, type = "info") {
    let emoji = { success: "✅", error: "❌", info: "ℹ️" }[type] || "";
    let notif = document.createElement("div");
    notif.className = "ducrachat-notif " + type;
    notif.innerHTML = emoji + " " + message;

    document.body.appendChild(notif);

    setTimeout(() => {
        notif.classList.add("hide");
        setTimeout(() => notif.remove(), 800);
    }, 2500); // 2.5s affiché puis animé
}


function closeModal() {
    document.getElementById('options-modal').style.display = 'none'
    
}

function openModal() {
    fetchNui('getOptions').then(opts => {
        userOptions = opts || {};
        renderOptionsModal();
        document.getElementById('options-modal').style.display = 'flex';
    });
}

function openModal() {
    fetchNui('getOptions').then(opts => {
        userOptions = opts || {};
        renderOptionsModal();
        document.getElementById('options-modal').style.display = 'flex';
    });
}

function closeModal() {
    document.getElementById('options-modal').style.display = 'none';
}


function renderOptionsModal() {
    const delay = typeof userOptions.delay_override === "number" ? userOptions.delay_override : 600;
    let html = `<h2>Options DucraChat</h2><ul>`;

    // Accusé de lecture
    if (!userOptions.can_read) {
        html += `<li>
            <b>Accusé de lecture</b> — <span class="option-price">$50,000</span>
            <button class="buy-opt" data-opt="read">Acheter</button>
        </li>`;
    }

    // Afficher la réduction SEULEMENT si delay > 60 (sinon aucun bouton à proposer)
    if (delay > 60) {
        html += `<li><b>Réduction du délai de réception</b><div class="delay-options">`;
        for (let min = 1; min <= 9; min++) {
            if (delay > 60 * min) {
                let price = [10000,20000,28000,35000,45000,50000,55000,65000,70000][min-1];
                html += `<button class="buy-opt" data-opt="delay" data-min="${min}">-${min}min <span>$${price.toLocaleString()}</span></button>`;
            }
        }
        html += `</div>
            <div class="note">
                (-10% sur le prix de base à partir de 3min, -15% à 4min, etc.)<br>
                <b>Attention :</b> tu ne peux pas acheter plus que ton délai restant.
            </div>
        </li>`;
    }

    // Afficher envoi instantané UNIQUEMENT si delay > 0
    if (delay > 0) {
        html += `<li>
            <b>Envoi instantané</b> — <span class="option-price">$80,000</span>
            <button class="buy-opt" data-opt="instant">Acheter</button>
            <div class="note red">⚠️ Cette offre disparaît si tu achètes une réduction avant !</div>
        </li>`;
    }

    // Changement d’ID (toujours dispo)
    html += `<li>
        <b>Changer mon ID</b> — <span class="option-price">$200,000</span>
        <button class="buy-opt" data-opt="changeid">Acheter</button>
        <div class="note">Tu perdras TOUTES tes conversations actuelles.</div>
    </li>
    </ul>
    <button id="close-options">Fermer</button>`;

    document.querySelector('.modal-content').innerHTML = html;

    // Event sur le bouton de fermeture
    document.getElementById('close-options').onclick = closeModal;

    // Event sur tous les boutons d’achat
    for (let btn of document.querySelectorAll('.buy-opt')) {
        btn.onclick = function() {
            let opt = this.getAttribute('data-opt');
            let min = this.getAttribute('data-min') || null;
            fetchNui('buyOption', { option: opt, value: min });
            closeModal();
            setTimeout(() => openModal(), 750); // Rafraîchir après achat
        };
    }
}




function showPopup(msg) {
    document.getElementById('alert-popup').style.display = 'flex'
    document.getElementById('popup-message').innerText = msg
}
function closePopup() {
    document.getElementById('alert-popup').style.display = 'none'
}

window.addEventListener('message', (event) => {
    const data = event.data
    if (data.action === 'open') {
        document.getElementById('app').style.display = 'flex'
        initChat()
    }
    if (data.action === 'invalidId') {
        showPopup("❌ Cet ID n’existe pas, la conversation est supprimée !")
        setTimeout(closePopup, 4000)
    }
    if (data.action === 'changedId') {
        myId = data.newid
        document.getElementById('my-id').innerText = myId
        showPopup("✅ Nouvel ID appliqué. Toutes tes conversations ont été supprimées !")
    }
    if (data.action === 'messageSent') {
        delay = data.delay
        document.getElementById('status-info').innerText = `Ton message sera délivré dans ${Math.ceil(delay/60)} minutes !`
        setTimeout(() => document.getElementById('status-info').innerText = '', 3000)
    }
    if (data.action === 'showNotif') {
        showNotif(data.message, data.type);
    }
})

function initChat() {
    fetchNui('getOrCreateId').then(data => {
        myId = data.id_telegram; // toujours pour l'affichage
        myIdentifier = data.identifier; // pour les comparaisons messages
        document.getElementById('my-id').innerText = myId
    })
    refreshConversations()
    currentConv = null
    document.getElementById('messages').innerHTML = ''
    document.getElementById('conv-title').innerText = 'Sélectionne ou recherche une conversation'
}


function refreshConversations() {
    fetchNui('getConversations').then(convos => {
        conversations = convos || []
        renderConversations()
    })
}

function renderConversations() {
    const el = document.getElementById('conversations')
    el.innerHTML = ''
    for (let c of conversations) {
        let conv = document.createElement('div')
        conv.className = 'conversation'
        conv.onclick = () => openConversation(c.id_telegram)
        if (currentConv && currentConv === c.id_telegram) conv.classList.add('active')
        conv.innerHTML = `
            <span class="user-id">${c.id_telegram||'ID?'}</span>
            <span class="preview">${c.last_message ? c.last_message.substr(0, 48) : 'Nouveau...'}</span>
            <div>
                <span class="date">${formatDate(c.last_time)}</span>
                ${c.unread > 0 ? `<span class="unread">${c.unread}</span>` : ''}
            </div>
        `
        el.appendChild(conv)
    }
}

function openConversation(id_telegram) {
    fetchNui('getMessages', { id_telegram }).then(msgs => {
        // NE PAS faire .reverse() ici !
        messages = msgs // PAS de .reverse()
        currentConv = id_telegram || []
        renderMessages()
        document.getElementById('conv-title').innerText = 'Conversation avec ' + id_telegram
    })
}

function renderMessages() {
    const el = document.getElementById('messages')
    el.innerHTML = ''
    for (let msg of messages) {
        // debug
        console.log('msg.sender:', msg.sender, 'myIdentifier:', myIdentifier);
        
        let senderLabel = (msg.sender && myIdentifier && msg.sender.toString().trim() === myIdentifier.toString().trim())
            ? '<span class="msg-expediteur moi">Moi</span>'
            : '<span class="msg-expediteur autre">Lui</span>';
        let m = document.createElement('div');
        m.className = 'message' + ((msg.sender && myIdentifier && msg.sender.toString().trim() === myIdentifier.toString().trim()) ? ' self' : '');
        m.innerHTML = `
            ${senderLabel}
            <div class="content">${msg.message}</div>
            <div class="meta">${formatDate(msg.timestamp)}</div>
        `;
        el.appendChild(m);
    }
    el.scrollTop = el.scrollHeight
}


function sendMessage() {
    const input = document.getElementById('message-input')
    let msg = input.value.trim()
    if (!msg || !currentConv) return
    fetchNui('sendMessage', { id_telegram: currentConv, message: msg })
    input.value = ''
    setTimeout(() => openConversation(currentConv), 800) // Simule l’update de la conv
}

function searchConv() {
    const val = document.getElementById('search-id').value.trim().toUpperCase()
    if (!val || val === myId) return
    fetchNui('searchId', { searchId: val }).then(exists => {
        if (!exists) {
            showPopup("❌ Aucun utilisateur trouvé pour cet ID !")
            return
        }
        openConversation(val)
    })
}

function copyMyId() {
    if (myId) {
        if (navigator.clipboard && window.isSecureContext) {
            navigator.clipboard.writeText(myId)
                .then(() => showPopup("Copié ! Donne-le à tes potes pour chatter."))
                .catch(() => fallbackCopy(myId));
        } else {
            fallbackCopy(myId);
        }
    }
}

function fallbackCopy(text) {
    // Fallback: input caché + execCommand
    let input = document.createElement("input");
    input.style.position = "fixed";
    input.style.opacity = 0;
    input.value = text;
    document.body.appendChild(input);
    input.select();
    try {
        document.execCommand("copy");
        showPopup("Copié ! Donne-le à tes potes pour chatter.");
    } catch (e) {
        showPopup("Impossible de copier (sandbox)");
    }
    document.body.removeChild(input);
}


document.getElementById('send-message').onclick = sendMessage
document.getElementById('btn-search').onclick = searchConv
document.getElementById('copy-id').onclick = copyMyId
document.getElementById('open-options').onclick = openModal
document.getElementById('close-popup').onclick = closePopup
document.getElementById('message-input').onkeydown = (e) => { if (e.key === "Enter") sendMessage() }
document.getElementById('search-id').onkeydown = (e) => { if (e.key === "Enter") searchConv() }

window.onkeyup = function(e) {
    if (e.key === "Escape") {
        closeModal()
        closePopup()
        fetchNui('close')
        document.getElementById('app').style.display = 'none'
    }
}

// Helpers
function formatDate(d) {
    if (!d) return ''
    let date = new Date(d)
    return date.toLocaleString('fr-FR').replace(/:\d\d$/, '')
}
function fetchNui(event, data) {
    return fetch(`https://${GetParentResourceName()}/${event}`, {
        method: 'POST',
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: data ? JSON.stringify(data) : '{}'
    }).then(res => res.json())
}


