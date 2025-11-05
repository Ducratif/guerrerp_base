// Overlay CHOC DÉTECTÉ — contrôle et compteur
(() => {
  const overlay = document.getElementById('crash-overlay');
  const secsEl  = document.getElementById('crash-secs');
  const ringEl  = document.getElementById('crash-ring');

  let timer = null;
  let running = false;

  // Sécurité au chargement : bien caché
  if (overlay) {
    overlay.classList.remove('crash-show');
    overlay.style.display = 'none';
    overlay.setAttribute('aria-hidden', 'true');
  }

  const CIRC = 2 * Math.PI * 54; // 339.292

  function show(seconds = 10) {
    if (!overlay || running) return;
    running = true;

    // Affiche l’overlay
    overlay.classList.add('crash-show');   // correspond au CSS (#crash-overlay.crash-show { display:flex; })
    overlay.style.display = 'flex';        // ce style inline bat toute règle résiduelle
    overlay.setAttribute('aria-hidden', 'false');

    // init du cercle
    ringEl.style.strokeDasharray  = `${CIRC} ${CIRC}`;
    ringEl.style.strokeDashoffset = '0';

    let t = Math.max(0, Math.floor(seconds));
    secsEl.textContent = t;

    const started = Date.now();
    const durMs   = t * 1000;

    const tick = () => {
      const elapsed = Date.now() - started;
      const remain  = Math.max(0, Math.ceil((durMs - elapsed)/1000));
      secsEl.textContent = remain;

      const ratio = Math.min(1, elapsed / durMs);
      ringEl.style.strokeDashoffset = String(CIRC * ratio);

      if (remain <= 0) { end(); return; }
      timer = setTimeout(tick, 100);
    };
    tick();
  }

  function end() {
    if (!running) return;
    running = false;
    if (timer) { clearTimeout(timer); timer = null; }

    // Cache l’overlay
    overlay.classList.remove('crash-show');
    overlay.style.display = 'none';
    overlay.setAttribute('aria-hidden', 'true');

    // Notifie le client (Lua) de fin
    fetch(`https://${GetParentResourceName()}/crash:done`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: '{}'
    }).catch(() => {});
  }

  // Messages NUI
  window.addEventListener('message', (e) => {
    const d = e.data || {};
    if (d.type === 'crash:open')  show(Number(d.seconds) || 10);
    if (d.type === 'crash:close') end();
  });

  // (Optionnel) Bloquer interactions clavier quand l’overlay est visible
  window.addEventListener('keydown', (e) => {
    if (!running) return;
    e.preventDefault();
    e.stopPropagation();
  }, true);
})();
