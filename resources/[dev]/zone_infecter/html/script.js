//window.addEventListener('message', function(event) {
//    if (event.data.type === "playApproche") {
//        const audio = document.getElementById('approcheSound');
//        if (audio) {
//            audio.volume = 0.5;
//            audio.play();
//        }
//    }
//
//    if (event.data.type === "playEntre") {
//        const audio = document.getElementById('entreSound');
//        if (audio) {
//            audio.volume = 0.5;
//            audio.play();
//        }
//    }
//});

let approachAudio = new Audio();
let zoneAudio = new Audio();

approachAudio.volume = 0.5;
zoneAudio.volume = 0.5;

function fadeOut(audio, callback) {
    let fade = setInterval(() => {
        if (audio.volume > 0.05) {
            audio.volume -= 0.05;
        } else {
            audio.pause();
            audio.currentTime = 0;
            audio.volume = 0.5;
            clearInterval(fade);
            if (callback) callback();
        }
    }, 100);
}

window.addEventListener('message', function (event) {
    const data = event.data;
    //console.log("NUI message received:", data);

    if (data.action === 'playApproach') {
        if (!approachAudio.paused) return; // déjà joué
        fadeOut(zoneAudio); // stop zone si active
        approachAudio.src = data.url;
        approachAudio.loop = false;
        approachAudio.play();
    }

    if (data.action === 'playEnter') {
        fadeOut(approachAudio, () => {
            zoneAudio.src = data.url;
            zoneAudio.loop = false;
            zoneAudio.play();
        });
    }

    if (data.action === 'stopAll') {
        fadeOut(approachAudio);
        fadeOut(zoneAudio);
    }
});

