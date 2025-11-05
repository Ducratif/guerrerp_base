const colors = ['#ff4d4d', '#4da6ff', '#49e66c', '#ffd24d']; // red, blue, green, yellow
const names  = ['Rouge', 'Bleu', 'Vert', 'Jaune'];

let state = {
  timeLimit: 20000,
  start: 0,
  timerId: null,
  leftNodes: [],
  rightNodes: [],
  connections: [],
  selectedLeft: null,
  map: {}, // color index -> right index
  done: 0
};

function $(sel){ return document.querySelector(sel); }

function show(val){
  $('#app').classList.toggle('hidden', !val);
}

function shuffle(arr){
  let a = arr.slice();
  for(let i=a.length-1;i>0;i--){
    const j = Math.floor(Math.random()*(i+1));
    [a[i],a[j]] = [a[j],a[i]];
  }
  return a;
}

function buildNodes(){
  const left = $('#left'); const right = $('#right');
  left.innerHTML = ''; right.innerHTML = '';
  state.leftNodes = []; state.rightNodes = []; state.connections = [];
  state.selectedLeft = null; state.done = 0;

  const order = shuffle([0,1,2,3]);
  state.map = {0:order[0],1:order[1],2:order[2],3:order[3]};

  for(let i=0;i<4;i++){
    let n = document.createElement('div');
    n.className = 'node'; n.style.borderColor = colors[i];
    n.dataset.index = i;
    let lab = document.createElement('div'); lab.className='label'; lab.innerText = names[i];
    n.appendChild(lab);
    n.addEventListener('click', () => selectLeft(i, n));
    left.appendChild(n);
    state.leftNodes.push(n);
  }
  for(let i=0;i<4;i++){
    let idx = order[i];
    let n = document.createElement('div');
    n.className = 'node'; n.style.borderColor = colors[idx];
    n.dataset.index = i; // right position index
    let lab = document.createElement('div'); lab.className='label'; lab.style.left='-90px'; lab.innerText = names[idx];
    n.appendChild(lab);
    n.addEventListener('click', () => selectRight(i, n));
    right.appendChild(n);
    state.rightNodes.push(n);
  }
  drawLines();
}

function selectLeft(i, el){
  state.leftNodes.forEach(n=>n.classList.remove('pulse'));
  state.selectedLeft = i;
  el.classList.add('pulse');
}
function selectRight(i, el){
  if(state.selectedLeft === null) return;
  // Is this the right match?
  const expectedRightIdx = state.map[state.selectedLeft];
  if(i === expectedRightIdx){
    // correct
    connect(state.selectedLeft, i);
    state.selectedLeft = null;
    state.leftNodes.forEach(n=>n.classList.remove('pulse'));
    state.done++;
    if(state.done >= 4){
      finish(true);
    }
  } else {
    // wrong -> instant fail
    finish(false);
  }
}

function connect(li, ri){
  const panel = document.querySelector('.panel');
  const pb = panel.getBoundingClientRect();

  const l = state.leftNodes[li].getBoundingClientRect();
  const r = state.rightNodes[ri].getBoundingClientRect();

  const svg = document.querySelector('#lines svg');
  const x1 = (l.left - pb.left) + l.width/2;
  const y1 = (l.top  - pb.top)  + l.height/2;
  const x2 = (r.left - pb.left) + r.width/2;
  const y2 = (r.top  - pb.top)  + r.height/2;

  const path = document.createElementNS('http://www.w3.org/2000/svg','line');
  path.setAttribute('x1', x1);
  path.setAttribute('y1', y1);
  path.setAttribute('x2', x2);
  path.setAttribute('y2', y2);
  path.setAttribute('stroke', colors[li]);
  path.setAttribute('stroke-width', '4');
  svg.appendChild(path);
}


function drawLines(){
  const lines = document.getElementById('lines');
  const panel = document.querySelector('.panel');
  lines.innerHTML = '';
  const svg = document.createElementNS('http://www.w3.org/2000/svg','svg');
  svg.setAttribute('width', panel.clientWidth);
  svg.setAttribute('height', panel.clientHeight);
  lines.appendChild(svg);
}


function tick(){
  const t = Date.now() - state.start;
  const left = Math.max(0, state.timeLimit - t);
  $('#timer').innerText = (left/1000).toFixed(1);
  if(left <= 0){
    finish(false);
  }
}

function start(timeLimit){
  state.timeLimit = timeLimit || 20000;
  buildNodes();
  state.start = Date.now();
  if(state.timerId) clearInterval(state.timerId);
  state.timerId = setInterval(tick, 50);
  show(true);
}

function finish(success){
  if(state.timerId) clearInterval(state.timerId);
  show(false);
  fetch(`https://${GetParentResourceName()}/minigame:end`, {
    method: 'POST',
    headers: {'Content-Type': 'application/json'},
    body: JSON.stringify({ success })
  });
}

window.addEventListener('message', (e) => {
  const data = e.data || {};
  if(data.action === 'open'){
    start(data.timeLimit || 20000);
  }
});

document.getElementById('cancel').addEventListener('click', () => finish(false));
