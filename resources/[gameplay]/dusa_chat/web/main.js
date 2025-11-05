
setTimeout(() => {
    fetch("https://dusa_chat/getName", {
        method: "POST",
        headers: {
            "Content-Type": "application/json; charset=UTF-8",
        },
        body: JSON.stringify({}),
    }).then(resp => resp.json())
    .then(data => {
        if (data !== false) {
            setTimeout(() => {
                app.playerName = data
            }, 100)
        }
    })
}, "2000");

window.addEventListener("message", function (event) {
    var item = event.data;
    switch (item.type) {
        case "openChat":
            app.chatVisible = true;
            app.chatInput = true;
            app.focusMessage();
            break;
        case "closeChat":
            app.chatVisible = false;
            break;
        case "clearAll":
            app.clearChat();
            break;
        case "positionInGameMeDo":
            app.positionInGameMeDo(item.id, item.x, item.y)
            break;
        case "emote":
            app.emote(item.x, item.y, item.emote, item.message, item.id, item.name)
            break;
        case "game":
            app.emote(item.x, item.y, item.game, "", item.id, "", item.picked)
            break;
        case "deleteEmote":
            app.deleteInGameMeDo(item.id)
            break;
        case "onMessage":
            app.sendCustomMessage(item.message.args);
            break;
        case "addSuggestion":
            app.addCustomCommand(item.suggestion);
            break;
        case "notify":
            // announcement, warning, info, success
            app.notify(item.notifyType, item.header, item.message);
            break;
        case "sendMessage":
            var command = item.message.split(" ")[0];
            app.sendMessage("error", item.message, command, true);
            break;
        case "syncChatList":
            var command = item.message.split(" ")[0];
            // const message = item.message.split(" ").slice(1).join(" ");
            // app.playerName = item.name
            app.addToMessageList(item.message, item.emote, command, true, item.name)
            if (app.chatNotify) {
                app.chatVisible = true;
            } else {
                app.chatVisible = false;
            }
            break;
        case "addCommands":
            let commandData = [];
            let defaultData = [];
            app.commandList = [];
            app.defaultCommands = [];
            item.commands.forEach(e => {
                if (e.quick) {
                    defaultData.push({
                        command: e.name
                    })
                }
                commandData.push({
                    command: e.name
                })
            })
            app.commandList = commandData;
            app.defaultCommands = defaultData;
            break;
    }
});

const app = new Vue({
    el: '#app',
    data: {
        info: {
            me: "ME",
            do: "DO",
            ooc: "OOC",
            admin: "ADMIN",
            charinfo: "CHARINFO",
            ems: "EMS",
            police: "POLICE",
            error: "ERROR",
            whisper: "WHISPER",
            yellowpages: "YELLOW PAGE",
            gang: "GANG",
            announcement: "ANNOUNCEMENT",
            errorMessage: "There is no such command",
            settings: "SETTINGS",
            position: "POSITION",
            positionDec: "Position of the chat window",
            color: "COLOR",
            colorDec: "Color of the chat window",
            colorPalette: "COLOR PALETTE",
            notify: "NOTIFY",
            notifyDec: "Notification of new messages",
            sounds: "SOUNDS",
            soundsDec: "Sound of typing messages",
            on: "ON",
            off: "OFF",
            defaultSettings: "RESET ALL SETTINGS",
            warning: "WARNING",
            info: "INFO",
            success: "SUCCESS",
        },
        notifyDelay: 5000,
        chatVisible: false,
        chatInput: false,
        chatNotify: true,
        chatAnimation: false,
        emojiPicker: false,
        typingEffect: false,
        chatPosition: false,
        gameMeDo: true,
        chatSettings: false,
        noftiySound: true,
        showName: true,
        playerName: 'Dusa asda',
        playerCitizen: "123456789",
        ingameMeDoDelay: 5000,
        messageIndex: 0,
        showGame: false,
        commandList: [
            // { command: "/me" },
        ],
        defaultCommands: [
            // { command: "/me" },
        ],
        inGameMeDoList: [
        ],
        messageList: [

        ],
        newMessage: "",
    },
    mounted() {
        document.querySelector('emoji-picker')
            .addEventListener('emoji-click', event => this.selectEmoji(event.detail.unicode));
        if (this.chatPosition) {
            $(".chat-inner").draggable({
                addClasses: false,
                scroll: false,
            });
        }

        window.addEventListener("keydown", (e) => {
            if (e.key == "ArrowUp") {
                this.getPastMessage(e);
            } else if (e.key == "ArrowDown") {
                this.getPastMessage(e);
            }
        })

        // let datas = [
        //     "/zone",
        //     "Zone control",
        //     [
        //         { name: "zoneType" },
        //         { name: "Cordinat"  }
        //     ]
        // ]

        // this.addCustomCommand(datas);
        // Notifylar

        // this.notify("announcement", "This is a test announcement");
        // this.notify("warning", "This is a test warning");
        // this.notify("info", "This is a test info");
        // this.notify("success", "This is a test success");

    },
    methods: {
        getMessageType: function (type) {
            return this.info[type];
        },
        sendMessage: function (type, message, command, visible, title) {
            fetch("https://dusa_chat/getName", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json; charset=UTF-8",
                },
                body: JSON.stringify({}),
            }).then(resp => resp.json())
                .then(data => {
                    if (data !== false) {
                        if (this.showName) {
                            this.addToMessageList(message, type, command, visible, data, title)
                        } else {
                            this.addToMessageList(message, type, command, visible, undefined, title)
                        }
                        $.post('http://dusa_chat/sendmessage', JSON.stringify({ message: this.newMessage }));
                        this.newMessage = "";
                        setTimeout(() => {
                            // this.chatNotify CHATBOXUN AKTİFLİĞİNİ TEMSİL EDER, NOTİFY AÇIKSA CHATBOX GÖZÜKÜR KAPALIYSA GÖZÜKMEMESİ GEREKİR
                            if (this.chatNotify) { // chati göster
                                app.emojiPicker = false
                                app.chatInput = false
                                $.post('http://dusa_chat/closeFocus', JSON.stringify({}));
                            } else { // chati gösterme
                                app.emojiPicker = false
                                app.chatInput = false
                                $.post('http://dusa_chat/close', JSON.stringify({}));
                            }
                        }, 100)
                    }
                })
        },
        sendCustomMessage: function (args) {
            let title = args[0]
            let message = "";
            args.forEach((element, index) => {
                if (index != 0) {
                    message += (args.length - 1 == index ? element : element + "-")
                }
            });
            setTimeout(() => {
                this.sendMessage("whisper", message, "", true, title);
            }, 150)
        },
        addCustomCommand: function (args) {
            let command = args[0];
            let description = args[1];
            let param = [];
            if (args[2]) {
                args[2].forEach((element, index) => {
                    param.push({ name: element.name });
                });
            }

            this.commandList.push({ command: command, description: description, param: param });
        },
        addToMessageList: function (message, type, command, visible, name, title) {
            let date = new Date();
            let day = date.getDate();
            let month = date.getMonth() + 1;
            let year = date.getFullYear();
            let hour = date.getHours();
            let minute = date.getMinutes();
            let second = date.getSeconds();
            let time = hour + ":" + minute + ":" + second;
            let showTime = hour + ":" + minute;
            let fullDate = `${year}-${month.toString().padStart(2, "0")}-${day
                .toString()
                .padStart(2, "0")}`;
            this.messageList.push({
                user: name,
                message: message,
                date: fullDate,
                time: time,
                showTime: showTime,
                citizen: this.playerCitizen,
                type: (type === "ambulance") ? "ems" : type,
                command: command,
                visible: visible,
                title: (title ? title : undefined),
                past: (name === this.playerName) ? true : false,
            });
        },
        inGameMeDo: function (x, y, type, message, id, picked) {
            let cont = document.querySelector(".in-game-me-do");
            if (type == "me") {
                cont.insertAdjacentHTML("beforeend", `
                <div class="in-game-me" id="in-game-${id}" style="left: ${x}%; top: ${y}%;">
                <div class="message-border"></div>
                <div class="background-svg">
                    <svg xmlns="http://www.w3.org/2000/svg" width="221" height="40" viewBox="0 0 221 40" fill="none">
                    <g filter="url(#filter0_f_117_2)">
                    <path d="M49.4382 20.236C49.3305 17.7847 48.637 15.3948 47.4158 13.2666C46.1946 11.1384 44.4813 9.33374 42.4193 8.00382C40.3572 6.6739 38.0066 5.85742 35.5641 5.62275C33.1216 5.38808 30.6585 5.74205 28.381 6.65502C26.7677 5.39129 24.9177 4.46324 22.9401 3.92554C20.9626 3.38785 18.8974 3.25139 16.8663 3.5242C14.8351 3.79701 12.8792 4.47358 11.1136 5.51405C9.34798 6.55451 7.80848 7.93782 6.58579 9.58248C5.36309 11.2271 4.48193 13.0999 3.99422 15.0904C3.50651 17.0808 3.42211 19.1488 3.746 21.1724C4.06989 23.196 4.79551 25.1343 5.88012 26.8732C6.96472 28.612 8.38638 30.1161 10.0613 31.297L11.2449 36.5191C11.3511 36.9861 11.5801 37.4163 11.9084 37.7651C12.2366 38.1139 12.652 38.3686 13.1118 38.503C13.5715 38.6373 14.0587 38.6464 14.5231 38.5292C14.9875 38.412 15.4121 38.1729 15.7531 37.8365L19.5624 34.0735C21.2915 33.9962 22.9951 33.6277 24.6016 32.9836C26.2419 34.2733 28.1279 35.2152 30.1443 35.7518C32.1608 36.2884 34.2654 36.4085 36.3298 36.1046C38.3942 35.8008 40.3751 35.0795 42.1514 33.9848C43.9278 32.89 45.4625 31.4447 46.6617 29.7371L51.8838 28.5535C52.3508 28.4473 52.781 28.2183 53.1298 27.8901C53.4786 27.5619 53.7333 27.1464 53.8677 26.6867C54.002 26.227 54.0111 25.7397 53.8939 25.2753C53.7767 24.8109 53.5376 24.3863 53.2012 24.0453L49.4382 20.236ZM46.8241 21.9611L50.5308 25.7115L45.3878 26.8758C44.9969 26.9661 44.6568 27.2058 44.4403 27.5436C42.6972 30.2544 39.9597 32.1726 36.8166 32.8855C33.6736 33.5984 30.3763 33.0489 27.6343 31.3553C29.3735 30.153 30.8455 28.6043 31.9579 26.8062C33.0702 25.0081 33.799 22.9996 34.0985 20.9066C34.3979 18.8136 34.2616 16.6813 33.698 14.6434C33.1345 12.6056 32.1558 10.7062 30.8235 9.06445C32.6459 8.5608 34.5599 8.48454 36.4166 8.84159C38.2733 9.19865 40.0225 9.9794 41.528 11.123C43.0336 12.2667 44.255 13.7424 45.0969 15.4352C45.9389 17.1281 46.3789 18.9924 46.3825 20.8831C46.3824 21.2865 46.541 21.6737 46.8241 21.9611Z" fill="#EB34AD" fill-opacity="0.13"/>
                    <path d="M231.381 20.236C231.273 17.7847 230.579 15.3948 229.358 13.2666C228.137 11.1384 226.424 9.33374 224.362 8.00382C222.3 6.6739 219.949 5.85742 217.506 5.62275C215.064 5.38808 212.601 5.74205 210.323 6.65502C208.71 5.39129 206.86 4.46324 204.882 3.92554C202.905 3.38785 200.84 3.25139 198.809 3.5242C196.777 3.79701 194.822 4.47358 193.056 5.51404C191.29 6.55451 189.751 7.93782 188.528 9.58248C187.305 11.2271 186.424 13.0999 185.937 15.0904C185.449 17.0808 185.364 19.1488 185.688 21.1724C186.012 23.196 186.738 25.1343 187.822 26.8732C188.907 28.612 190.329 30.1161 192.004 31.297L193.187 36.5191C193.293 36.9861 193.522 37.4163 193.851 37.7651C194.179 38.1139 194.594 38.3686 195.054 38.503C195.514 38.6373 196.001 38.6464 196.465 38.5292C196.93 38.412 197.354 38.1729 197.695 37.8365L201.505 34.0735C203.234 33.9962 204.937 33.6277 206.544 32.9836C208.184 34.2732 210.07 35.2152 212.087 35.7518C214.103 36.2884 216.208 36.4085 218.272 36.1046C220.337 35.8008 222.317 35.0795 224.094 33.9848C225.87 32.89 227.405 31.4447 228.604 29.7371L233.826 28.5535C234.293 28.4473 234.723 28.2183 235.072 27.8901C235.421 27.5619 235.676 27.1464 235.81 26.6867C235.944 26.227 235.953 25.7397 235.836 25.2753C235.719 24.8109 235.48 24.3863 235.144 24.0453L231.381 20.236ZM228.766 21.9611L232.473 25.7115L227.33 26.8758C226.939 26.9661 226.599 27.2058 226.383 27.5436C224.64 30.2544 221.902 32.1726 218.759 32.8855C215.616 33.5984 212.319 33.0489 209.577 31.3553C211.316 30.153 212.788 28.6043 213.9 26.8062C215.013 25.0081 215.741 22.9996 216.041 20.9066C216.34 18.8136 216.204 16.6813 215.64 14.6434C215.077 12.6056 214.098 10.7062 212.766 9.06445C214.588 8.5608 216.502 8.48454 218.359 8.84159C220.216 9.19865 221.965 9.9794 223.47 11.123C224.976 12.2667 226.197 13.7424 227.039 15.4352C227.881 17.1281 228.321 18.9924 228.325 20.8831C228.325 21.2865 228.483 21.6737 228.766 21.9611Z" fill="#21161D"/>
                    </g>
                    <defs>
                    <filter id="filter0_f_117_2" x="0.174289" y="0.00881553" width="239.122" height="41.9808" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
                    <feFlood flood-opacity="0" result="BackgroundImageFix"/>
                    <feBlend mode="normal" in="SourceGraphic" in2="BackgroundImageFix" result="shape"/>
                    <feGaussianBlur stdDeviation="1.68935" result="effect1_foregroundBlur_117_2"/>
                    </filter>
                    </defs>
                    </svg>
                </div>
                <p> ${message} </p>
            </div>
                `);
                this.inGameMeDoList.push({ type: "me", message: message, x: x, y: y, id: id });
                let item = document.getElementById("in-game-" + id);
                setTimeout(() => {
                    item.remove();
                    this.inGameMeDoList.forEach((element, index) => {
                        if (element.id == id) {
                            this.inGameMeDoList.splice(index, 1);
                        }
                    });
                }, this.ingameMeDoDelay);
            } else if (type == "do") {
                cont.insertAdjacentHTML("beforeend", `
                <div class="in-game-do" id="in-game-${id}" style="left: ${x}%; top: ${y}%;">
                <div class="message-border"></div>
                <div class="background-svg">
                    <svg xmlns="http://www.w3.org/2000/svg" width="221" height="40" viewBox="0 0 221 40" fill="none">
                    <g filter="url(#filter0_f_117_3)">
                    <path d="M49.4382 20.236C49.3305 17.7847 48.637 15.3948 47.4158 13.2666C46.1946 11.1384 44.4813 9.33373 42.4193 8.00381C40.3572 6.67389 38.0066 5.8574 35.5641 5.62273C33.1216 5.38806 30.6585 5.74203 28.381 6.65501C26.7677 5.39128 24.9177 4.46322 22.9401 3.92553C20.9626 3.38783 18.8974 3.25137 16.8663 3.52418C14.8351 3.797 12.8792 4.47357 11.1136 5.51403C9.34798 6.55449 7.80848 7.9378 6.58579 9.58246C5.36309 11.2271 4.48193 13.0999 3.99422 15.0903C3.50651 17.0808 3.42211 19.1488 3.746 21.1724C4.06989 23.196 4.79551 25.1343 5.88012 26.8731C6.96472 28.612 8.38638 30.1161 10.0613 31.297L11.2449 36.5191C11.3511 36.9861 11.5801 37.4163 11.9084 37.7651C12.2366 38.1139 12.652 38.3686 13.1118 38.503C13.5715 38.6373 14.0587 38.6464 14.5231 38.5292C14.9875 38.412 15.4122 38.1729 15.7531 37.8365L19.5624 34.0735C21.2915 33.9962 22.9951 33.6277 24.6016 32.9835C26.2419 34.2732 28.1279 35.2151 30.1443 35.7518C32.1608 36.2884 34.2654 36.4084 36.3298 36.1046C38.3942 35.8008 40.3751 35.0795 42.1514 33.9848C43.9278 32.89 45.4625 31.4447 46.6617 29.7371L51.8838 28.5535C52.3508 28.4473 52.781 28.2183 53.1298 27.8901C53.4786 27.5618 53.7333 27.1464 53.8677 26.6867C54.002 26.2269 54.0111 25.7397 53.8939 25.2753C53.7767 24.8109 53.5376 24.3863 53.2012 24.0453L49.4382 20.236ZM46.8241 21.9611L50.5308 25.7115L45.3879 26.8758C44.9969 26.9661 44.6568 27.2058 44.4403 27.5436C42.6972 30.2544 39.9597 32.1726 36.8166 32.8855C33.6736 33.5983 30.3763 33.0489 27.6343 31.3553C29.3735 30.153 30.8455 28.6042 31.9579 26.8062C33.0702 25.0081 33.799 22.9996 34.0985 20.9066C34.3979 18.8136 34.2616 16.6812 33.698 14.6434C33.1345 12.6056 32.1558 10.7062 30.8235 9.06443C32.6459 8.56079 34.5599 8.48452 36.4166 8.84158C38.2733 9.19864 40.0225 9.97938 41.528 11.123C43.0336 12.2667 44.255 13.7424 45.0969 15.4352C45.9389 17.1281 46.3789 18.9924 46.3825 20.8831C46.3824 21.2865 46.541 21.6737 46.8241 21.9611Z" fill="#347DEB" fill-opacity="0.13"/>
                    <path d="M231.381 20.236C231.273 17.7847 230.579 15.3948 229.358 13.2666C228.137 11.1384 226.424 9.33373 224.362 8.00381C222.3 6.67389 219.949 5.8574 217.506 5.62273C215.064 5.38806 212.601 5.74203 210.323 6.65501C208.71 5.39128 206.86 4.46322 204.882 3.92553C202.905 3.38783 200.84 3.25137 198.809 3.52418C196.777 3.797 194.822 4.47357 193.056 5.51403C191.29 6.55449 189.751 7.9378 188.528 9.58246C187.305 11.2271 186.424 13.0999 185.937 15.0903C185.449 17.0808 185.364 19.1488 185.688 21.1724C186.012 23.196 186.738 25.1343 187.822 26.8731C188.907 28.612 190.329 30.1161 192.004 31.297L193.187 36.5191C193.293 36.9861 193.522 37.4163 193.851 37.7651C194.179 38.1139 194.594 38.3686 195.054 38.503C195.514 38.6373 196.001 38.6464 196.465 38.5292C196.93 38.412 197.354 38.1729 197.695 37.8365L201.505 34.0735C203.234 33.9962 204.937 33.6277 206.544 32.9835C208.184 34.2732 210.07 35.2151 212.087 35.7518C214.103 36.2884 216.208 36.4084 218.272 36.1046C220.337 35.8008 222.317 35.0795 224.094 33.9848C225.87 32.89 227.405 31.4447 228.604 29.7371L233.826 28.5535C234.293 28.4473 234.723 28.2183 235.072 27.8901C235.421 27.5618 235.676 27.1464 235.81 26.6867C235.944 26.2269 235.953 25.7397 235.836 25.2753C235.719 24.8109 235.48 24.3863 235.144 24.0453L231.381 20.236ZM228.766 21.9611L232.473 25.7115L227.33 26.8758C226.939 26.9661 226.599 27.2058 226.383 27.5436C224.64 30.2544 221.902 32.1726 218.759 32.8855C215.616 33.5983 212.319 33.0489 209.577 31.3553C211.316 30.153 212.788 28.6042 213.9 26.8062C215.013 25.0081 215.741 22.9996 216.041 20.9066C216.34 18.8136 216.204 16.6812 215.64 14.6434C215.077 12.6056 214.098 10.7062 212.766 9.06443C214.588 8.56079 216.502 8.48452 218.359 8.84158C220.216 9.19863 221.965 9.97938 223.47 11.123C224.976 12.2667 226.197 13.7424 227.039 15.4352C227.881 17.1281 228.321 18.9924 228.325 20.8831C228.325 21.2865 228.483 21.6737 228.766 21.9611Z" fill="#13181C"/>
                    </g>
                    <defs>
                    <filter id="filter0_f_117_3" x="0.174289" y="0.00880027" width="239.122" height="41.9808" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
                    <feFlood flood-opacity="0" result="BackgroundImageFix"/>
                    <feBlend mode="normal" in="SourceGraphic" in2="BackgroundImageFix" result="shape"/>
                    <feGaussianBlur stdDeviation="1.68935" result="effect1_foregroundBlur_117_3"/>
                    </filter>
                    </defs>
                    </svg>
                </div>
                <p> ${message} </p>
            </div>
                `);
                this.inGameMeDoList.push({ type: "do", message: message, x: x, y: y, id: id });
                let item = document.getElementById("in-game-" + id);
                setTimeout(() => {
                    item.remove();
                    this.inGameMeDoList.forEach((element, index) => {
                        if (element.id == id) {
                            this.inGameMeDoList.splice(index, 1);
                        }
                    });
                }, this.ingameMeDoDelay);
            } else if (type == "dice") {
                // var diceNumber = Math.floor((Math.random() * 12) + 1);
                var diceNumber = picked
                cont.insertAdjacentHTML("beforeend", `
                <div class="in-game-dice" id="in-game-${id}" style="left: ${x}%; top: ${y}%;">
                    <img src="assets/img/dice.svg" alt="dice">
                    <h2> ${diceNumber} </h2>
                </div>
                `);
                this.inGameMeDoList.push({ type: "dice", message: message, x: x, y: y, id: id });
                let item = document.getElementById("in-game-" + id);
                setTimeout(() => {
                    item.remove();
                    this.inGameMeDoList.forEach((element, index) => {
                        if (element.id == id) {
                            this.inGameMeDoList.splice(index, 1);
                        }
                    });
                }, this.ingameMeDoDelay);
            } else if (type == "rps") {
                let game = ["paper", "rock", "scissors"];
                // var gameNumber = Math.floor((Math.random() * 3));
                var gameNumber = picked
                cont.insertAdjacentHTML("beforeend", `
                <div class="in-game-rock-paper-scissors" id="in-game-${id}" style="left: ${x}%; top: ${y}%;">
                    <img src="assets/img/${game[gameNumber]}.svg" alt="game">
                </div>
                `);
                this.inGameMeDoList.push({ type: "game", message: message, x: x, y: y, id: id });
                let item = document.getElementById("in-game-" + id);
                setTimeout(() => {
                    item.remove();
                    this.inGameMeDoList.forEach((element, index) => {
                        if (element.id == id) {
                            this.inGameMeDoList.splice(index, 1);
                        }
                    });
                }, this.ingameMeDoDelay);
            }
        },
        playRock: function () {
            $.post('http://dusa_chat/playGame', JSON.stringify({ game: 'rps' }));
        },
        playDice: function () {
            $.post('http://dusa_chat/playGame', JSON.stringify({ game: 'dice' }));
        },
        playGame: function () {
            this.showGame = !this.showGame;
        },
        positionInGameMeDo: function (id, x, y) {
            if (id == undefined) return;
            let item = document.getElementById("in-game-" + id);
            if (item == undefined) return;
            item.style.left = x + "%";
            item.style.top = y + "%";
        },
        deleteInGameMeDo: function (id) {
            if (id == undefined) return;
            let item = document.getElementById("in-game-" + id);
            if (item == undefined) return;
            item.style.opacity = 0;
        },
        emote: function (x, y, type, message, id, name, picked) {
            this.inGameMeDo(x, y, type, message, id, picked);
        },
        clearChat: function () {
            this.messageList = [];
            this.newMessage = "";
            setTimeout(() => {
                // this.chatNotify CHATBOXUN AKTİFLİĞİNİ TEMSİL EDER, NOTİFY AÇIKSA CHATBOX GÖZÜKÜR KAPALIYSA GÖZÜKMEMESİ GEREKİR
                if (this.chatNotify) { // chati göster
                    this.emojiPicker = false
                    this.chatInput = false
                    $.post('http://dusa_chat/closeFocus', JSON.stringify({}));
                } else { // chati gösterme
                    this.emojiPicker = false
                    this.chatInput = false
                    $.post('http://dusa_chat/close', JSON.stringify({}));
                }
            }, 100)
        },
        fillCommand: function (command) {
            this.newMessage = command + " ";
            this.focusMessage();
        },
        focusMessage: function () {
            const messageInput = document.querySelector(".input input");
            // this.chatNotify = true;
            setTimeout(() => {
                messageInput.focus();
            }, 200)
        },
        checkMessage: function () {
            const command = this.newMessage.split(" ")[0];
            const message = this.newMessage.split(" ").slice(1).join(" ");
            switch (command) {
                case "/me":
                    this.sendMessage("me", message, command, true, undefined);
                    break;
                case "/do":
                    this.sendMessage("do", message, command, true, '');
                    break;
                case "/ooc":
                    this.sendMessage("ooc", message, command, true);
                    break;
                case "/adminchat":
                    this.sendMessage("admin", message, command, true);
                    break;
                case "/charinfo":
                    this.sendMessage("charinfo", message, command, true);
                    break;
                case "/ambulance":
                    fetch(`https://dusa_chat/checkJob`, {
                        method: "POST",
                        headers: {
                            "Content-Type": "application/json; charset=UTF-8",
                        },
                        body: JSON.stringify({
                            type: 'ambulance'
                        }),
                    })
                        .then((job) => job.json())
                        .then((job) => {
                            if (job === false) {
                                this.sendMessage("error", "You dont have permission to use this", command, true);
                                return;
                            }
                            if (job) {
                                this.sendMessage("ems", message, command, true);
                            }
                        });
                    break;
                case "/police":
                    fetch(`https://dusa_chat/checkJob`, {
                        method: "POST",
                        headers: {
                            "Content-Type": "application/json; charset=UTF-8",
                        },
                        body: JSON.stringify({
                            type: 'police'
                        }),
                    })
                        .then((job) => job.json())
                        .then((job) => {
                            if (job === false) {
                                this.sendMessage("error", "You dont have permission to use this", command, true);
                                return;
                            }
                            if (job) {
                                this.sendMessage("police", message, command, true);
                            }
                        });
                    break;
                case "/error":
                    this.sendMessage("error", message, command, true);
                    break;
                case "/whisper":
                    this.sendMessage("whisper", message, command, true);
                    break;
                case "/yellowpages":
                    this.sendMessage("yellowpages", message, command, true);
                    break;
                case "/gang":
                    this.sendMessage("gang", message, command, true);
                    break;
                case "/announcement":
                    this.sendMessage("announcement", message, command, true);
                    break;
                case "/clear":
                    this.clearChat();
                    break;
                default:
                    this.sendMessage("default", message, command, false);
                    break;
            }
        },
        getPastMessage: function (e) {
            if (!this.chatInput) return;
            if (this.messageList.length == 0) return;
            if (e.key == "ArrowUp") {
                if (this.messageIndex == 0) {
                    if (this.messageList[this.messageIndex].user === this.playerName) this.messageIndex = this.messageList.length - 1;
                } else {
                    this.messageIndex--;
                }
                if (this.messageList[this.messageIndex].command == undefined) {
                    if (this.messageList[this.messageIndex].user === this.playerName) this.newMessage = this.messageList[this.messageIndex].message;
                } else {
                    if (this.messageList[this.messageIndex].user === this.playerName) this.newMessage = this.messageList[this.messageIndex].command + " " + this.messageList[this.messageIndex].message;
                }
            } else if (e.key == "ArrowDown") {
                if (this.messageIndex == this.messageList.length - 1) {
                    this.messageIndex = 0;
                }
                else if (this.messageIndex == this.messageList.length) {
                    this.messageIndex = 0;
                } else {
                    this.messageIndex++;
                }
                if (this.messageList[this.messageIndex].command == undefined) {
                    if (this.messageList[this.messageIndex].user === this.playerName) this.newMessage = this.messageList[this.messageIndex].message;
                } else {
                    if (this.messageList[this.messageIndex].user === this.playerName) this.newMessage = this.messageList[this.messageIndex].command + " " + this.messageList[this.messageIndex].message;
                }
            }

        },
        selectEmoji: function (emoji) {
            this.newMessage += emoji;
        },
        offNotify: function () {
            if (this.chatAnimation) return;
            this.chatAnimation = true;
            this.chatNotify = !this.chatNotify;
            this.chatAnimation = false;
        },
        openEmoji: function () {
            this.emojiPicker = !this.emojiPicker;
        },
        typingSound: function () {
            if (!this.typingEffect) return;
            const typingSound = new Audio("./assets/sound/keyboard.mp3");
            typingSound.volume = 0.6;
            typingSound.play();
        },
        positionChat: function () {
            if (!this.chatPosition) {
                $(".chat-inner").draggable({
                    disabled: false,
                });
                this.chatPosition = true;
            } else {
                $(".chat-inner").draggable({
                    disabled: true,
                });
                this.chatPosition = false;
            }
        },
        offSound: function () {
            this.typingEffect = !this.typingEffect;
        },
        offNoftiySound: function () {
            this.noftiySound = !this.noftiySound;
        },
        offGameMeDo: function () {
            this.gameMeDo = !this.gameMeDo;
        },
        deffaultSettings: function () {
            this.chatNotify = true;
            this.offNotify();
            this.typingEffect = false;
            this.chatPosition = false;
            this.gameMeDo = true;
            gsap.to("body",
                {
                    "--me": "linear-gradient(91deg, #290A1B 1.21%, rgba(7, 7, 7, 0.96) 50.4%, rgba(7, 7, 7, 0.72) 99.59%)",
                    duration: 0.5
                }
            )
            gsap.to("body",
                {
                    "--do": "linear-gradient(91deg, #0B1525 1.21%, rgba(7, 7, 7, 0.96) 50.4%, rgba(7, 7, 7, 0.72) 99.59%)",
                    duration: 0.5
                }
            )
            gsap.to("body",
                {
                    "--ooc": "linear-gradient(91deg, #241B0A 1.21%, rgba(7, 7, 7, 0.96) 50.4%, rgba(7, 7, 7, 0.72) 99.59%)",
                    duration: 0.5
                }
            )
            gsap.to("body",
                {
                    "--admin": "linear-gradient(91deg, #220909 1.21%, rgba(7, 7, 7, 0.96) 50.4%, rgba(7, 7, 7, 0.72) 99.59%)",
                    duration: 0.5
                }
            )
            gsap.to("body",
                {
                    "--char-info": "linear-gradient(91deg, #150923 1.21%, rgba(7, 7, 7, 0.96) 50.4%, rgba(7, 7, 7, 0.72) 99.59%)",
                    duration: 0.5
                }
            )
            gsap.to("body",
                {
                    "--ems": "linear-gradient(91deg, #150923 1.21%, rgba(7, 7, 7, 0.96) 50.4%, rgba(7, 7, 7, 0.72) 99.59%)",
                    duration: 0.5
                }
            )
            gsap.to("body",
                {
                    "--police": "linear-gradient(91deg, #0B0F28 1.21%, rgba(7, 7, 7, 0.96) 50.4%, rgba(7, 7, 7, 0.72) 99.59%)",
                    duration: 0.5
                }
            )
            gsap.to("body",
                {
                    "--whisper": "linear-gradient(91deg, #091922 1.21%, rgba(7, 7, 7, 0.96) 50.4%, rgba(7, 7, 7, 0.72) 99.59%)",
                    duration: 0.5
                }
            )
            gsap.to("body",
                {
                    "--yellow-page": "linear-gradient(91deg, #24230A 1.21%, rgba(7, 7, 7, 0.96) 50.4%, rgba(7, 7, 7, 0.72) 99.59%)",
                    duration: 0.5
                }
            )
            gsap.to("body",
                {
                    "--gang": "linear-gradient(91deg, #092312 1.21%, rgba(7, 7, 7, 0.96) 50.4%, rgba(7, 7, 7, 0.72) 99.59%)",
                    duration: 0.5
                }
            )
            gsap.to("body",
                {
                    "--announcement": "linear-gradient(91deg, #241B0A 1.21%, rgba(7, 7, 7, 0.96) 50.4%, rgba(7, 7, 7, 0.72) 99.59%)",
                    duration: 0.5
                }
            )
        },
        notify: function (type, header, text) {
            let notify = document.querySelector(".notify-cont");
            let delayA = (this.notifyDelay / 1000) - 1;
            if (type === "announcement") {
                // div append innerhtml
                var number = Math.floor((Math.random() * 1000) + 1);
                notify.insertAdjacentHTML("beforeend", `
                    <div class="notify announcement" id="notify-${number}">
                    <div class="notify-inner">
                        <div class="left-svg border-svg">
                            <svg xmlns="http://www.w3.org/2000/svg" width="10" height="10" viewBox="0 0 10 10" fill="none">
                                <path d="M9.5 0.89679H2.67242C2.04395 0.89679 1.53448 1.40626 1.53448 2.03472V10.0002"
                                    stroke="#ECBF1F" stroke-width="1.13793" />
                            </svg>
                        </div>
                        <div class="right-svg border-svg">
                            <svg xmlns="http://www.w3.org/2000/svg" width="11" height="9" viewBox="0 0 11 9" fill="none">
                                <path
                                    d="M9.48279 8.56922L9.48279 1.74163C9.48279 1.11317 8.97332 0.603699 8.34486 0.603699L0.37934 0.603698"
                                    stroke="#ECBF1F" stroke-width="1.13793" />
                            </svg>
                        </div>
                        <div class="bottom-left-svg border-svg">
                            <svg xmlns="http://www.w3.org/2000/svg" width="11" height="10" viewBox="0 0 11 10" fill="none">
                                <path
                                    d="M0.965515 0.77606L0.965515 7.60365C0.965515 8.23211 1.47498 8.74158 2.10345 8.74158L10.069 8.74158"
                                    stroke="#ECBF1F" stroke-width="1.13793" />
                            </svg>
                        </div>
                        <div class="bottom-right-svg border-svg">
                            <svg xmlns="http://www.w3.org/2000/svg" width="10" height="10" viewBox="0 0 10 10" fill="none">
                                <path
                                    d="M0.948301 9.31055L7.77589 9.31055C8.40435 9.31055 8.91382 8.80108 8.91382 8.17262L8.91382 0.207099"
                                    stroke="#ECBF1F" stroke-width="1.13793" />
                            </svg>
                        </div>
                        <div class="notify-icon">
                            <svg xmlns="http://www.w3.org/2000/svg" width="56" height="57" viewBox="0 0 56 57" fill="none">
                                <path
                                    d="M55.9282 28.3625C55.9282 43.6427 43.5412 56.0297 28.261 56.0297C12.9809 56.0297 0.593842 43.6427 0.593842 28.3625C0.593842 13.0823 12.9809 0.695312 28.261 0.695312C43.5412 0.695312 55.9282 13.0823 55.9282 28.3625ZM2.67279 28.3625C2.67279 42.4945 14.129 53.9508 28.261 53.9508C42.393 53.9508 53.8493 42.4945 53.8493 28.3625C53.8493 14.2305 42.393 2.77426 28.261 2.77426C14.129 2.77426 2.67279 14.2305 2.67279 28.3625Z"
                                    fill="#1FEC65" fill-opacity="0.14" />
                                <path
                                    d="M55.9282 28.3625C55.9282 23.522 54.6583 18.7662 52.2453 14.5701C49.8322 10.3739 46.3605 6.88428 42.1768 4.44965C37.9932 2.01502 33.244 0.720606 28.4035 0.695679C23.5631 0.670753 18.8008 1.91618 14.5923 4.3076L15.6194 6.11511C19.5117 3.9034 23.9161 2.75155 28.3928 2.7746C32.8695 2.79765 37.2619 3.9948 41.1312 6.24649C45.0005 8.49818 48.2113 11.7256 50.4431 15.6064C52.6748 19.4873 53.8493 23.8857 53.8493 28.3625H55.9282Z"
                                    fill="#1FEC65" />
                                <circle cx="28.261" cy="28.3625" r="23.056" fill="#1FEC65" fill-opacity="0.16" />
                                <path
                                    d="M20.0468 24.9523L36.1292 20.0196C36.3469 19.9562 36.5764 19.9442 36.7995 19.9847C37.0226 20.0252 37.2332 20.117 37.4147 20.2529C37.5961 20.3889 37.7435 20.5652 37.8451 20.7679C37.9467 20.9706 37.9997 21.1942 38 21.4209V34.5747C38 34.9624 37.846 35.3341 37.5719 35.6082C37.2978 35.8823 36.9261 36.0363 36.5385 36.0363C36.3987 36.0363 36.2597 36.0163 36.1256 35.9769L28.5 33.6366V34.5747C28.5 34.9624 28.346 35.3341 28.0719 35.6082C27.7978 35.8823 27.4261 36.0363 27.0385 36.0363H24.1154C23.7278 36.0363 23.356 35.8823 23.0819 35.6082C22.8078 35.3341 22.6538 34.9624 22.6538 34.5747V31.8435L20.0468 31.0442C19.7451 30.9536 19.4805 30.7683 19.292 30.5159C19.1035 30.2634 19.0012 29.9571 19 29.642V26.3536C19.0014 26.0387 19.1038 25.7326 19.2923 25.4803C19.4807 25.228 19.7453 25.0429 20.0468 24.9523ZM24.1154 34.5747H27.0385V33.1881L24.1154 32.2911V34.5747ZM20.4615 29.642H20.4716L27.0385 31.659V24.3357L20.4716 26.3536H20.4615V29.642Z"
                                    fill="#1FEC65" />
                            </svg>
                        </div>
                        <div class="notify-text">
                            <h2> ${header !== undefined ? header : this.info.announcement} </h2>
                            <p> ${text} </p>
                        </div>
                    </div>
                </div>
                `);
                // Delete İtem And Anim
                let item = document.getElementById("notify-" + number);
                gsap.to(item, { left: "-2vw", duration: 0.5, ease: "power2.out" })
                gsap.to(item, { left: "20vw", duration: 0.5, ease: "power2.out", delay: delayA })
                if (this.noftiySound) {
                    const announcement = new Audio("./assets/sound/announcement.mp3");
                    announcement.volume = 0.5;
                    announcement.play();
                }
                setTimeout(() => {
                    item.remove();
                }, this.notifyDelay);
            } else if (type === "warning") {
                var number = Math.floor((Math.random() * 1000) + 1);
                notify.insertAdjacentHTML("beforeend", `
                <div class="notify warning" id="notify-${number}">
                <div class="notify-inner">
                    <div class="left-svg border-svg">
                        <svg xmlns="http://www.w3.org/2000/svg" width="10" height="10" viewBox="0 0 10 10" fill="none">
                            <path d="M9.5 0.89679H2.67242C2.04395 0.89679 1.53448 1.40626 1.53448 2.03472V10.0002"
                                stroke="#ECBF1F" stroke-width="1.13793" />
                        </svg>
                    </div>
                    <div class="right-svg border-svg">
                        <svg xmlns="http://www.w3.org/2000/svg" width="11" height="9" viewBox="0 0 11 9" fill="none">
                            <path
                                d="M9.48279 8.56922L9.48279 1.74163C9.48279 1.11317 8.97332 0.603699 8.34486 0.603699L0.37934 0.603698"
                                stroke="#ECBF1F" stroke-width="1.13793" />
                        </svg>
                    </div>
                    <div class="bottom-left-svg border-svg">
                        <svg xmlns="http://www.w3.org/2000/svg" width="11" height="10" viewBox="0 0 11 10" fill="none">
                            <path
                                d="M0.965515 0.77606L0.965515 7.60365C0.965515 8.23211 1.47498 8.74158 2.10345 8.74158L10.069 8.74158"
                                stroke="#ECBF1F" stroke-width="1.13793" />
                        </svg>
                    </div>
                    <div class="bottom-right-svg border-svg">
                        <svg xmlns="http://www.w3.org/2000/svg" width="10" height="10" viewBox="0 0 10 10" fill="none">
                            <path
                                d="M0.948301 9.31055L7.77589 9.31055C8.40435 9.31055 8.91382 8.80108 8.91382 8.17262L8.91382 0.207099"
                                stroke="#ECBF1F" stroke-width="1.13793" />
                        </svg>
                    </div>
                    <div class="notify-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="56" height="57" viewBox="0 0 56 57" fill="none">
                            <path
                                d="M55.3344 28.5347C55.3344 43.8149 42.9474 56.2019 27.6672 56.2019C12.387 56.2019 0 43.8149 0 28.5347C0 13.2545 12.387 0.867493 27.6672 0.867493C42.9474 0.867493 55.3344 13.2545 55.3344 28.5347ZM2.07895 28.5347C2.07895 42.6667 13.5352 54.1229 27.6672 54.1229C41.7992 54.1229 53.2555 42.6667 53.2555 28.5347C53.2555 14.4027 41.7992 2.94644 27.6672 2.94644C13.5352 2.94644 2.07895 14.4027 2.07895 28.5347Z"
                                fill="#EC811F" fill-opacity="0.14" />
                            <path
                                d="M55.3344 28.5347C55.3344 23.6942 54.0645 18.9384 51.6514 14.7422C49.2384 10.5461 45.7666 7.05646 41.583 4.62183C37.3993 2.1872 32.6501 0.892786 27.8097 0.86786C22.9692 0.842933 18.207 2.08836 13.9984 4.47978L15.0255 6.28729C18.9178 4.07558 23.3222 2.92373 27.799 2.94678C32.2757 2.96983 36.668 4.16698 40.5373 6.41867C44.4066 8.67036 47.6175 11.8978 49.8492 15.7786C52.0809 19.6595 53.2555 24.0579 53.2555 28.5347H55.3344Z"
                                fill="#EC811F" />
                            <circle cx="27.6672" cy="28.5347" r="23.056" fill="#EC811F" fill-opacity="0.16" />
                            <path
                                d="M38.9502 34.7531L30.0218 19.2477C29.7987 18.8678 29.4802 18.5528 29.0979 18.334C28.7155 18.1151 28.2826 18 27.8421 18C27.4015 18 26.9686 18.1151 26.5863 18.334C26.2039 18.5528 25.8854 18.8678 25.6623 19.2477L16.734 34.7531C16.5193 35.1205 16.4062 35.5384 16.4062 35.9639C16.4062 36.3895 16.5193 36.8074 16.734 37.1748C16.9542 37.557 17.2722 37.8737 17.6552 38.0924C18.0383 38.3111 18.4726 38.4239 18.9137 38.4194H36.7704C37.2111 38.4236 37.6451 38.3106 38.0277 38.0919C38.4104 37.8732 38.728 37.5567 38.9481 37.1748C39.1631 36.8076 39.2766 36.3898 39.2769 35.9642C39.2773 35.5387 39.1645 35.1207 38.9502 34.7531ZM27.0253 26.1678C27.0253 25.9512 27.1113 25.7434 27.2645 25.5902C27.4177 25.4371 27.6254 25.351 27.8421 25.351C28.0587 25.351 28.2664 25.4371 28.4196 25.5902C28.5728 25.7434 28.6588 25.9512 28.6588 26.1678V30.2516C28.6588 30.4683 28.5728 30.676 28.4196 30.8292C28.2664 30.9824 28.0587 31.0684 27.8421 31.0684C27.6254 31.0684 27.4177 30.9824 27.2645 30.8292C27.1113 30.676 27.0253 30.4683 27.0253 30.2516V26.1678ZM27.8421 35.1523C27.5997 35.1523 27.3629 35.0804 27.1614 34.9458C26.9599 34.8112 26.8029 34.6198 26.7102 34.396C26.6174 34.1721 26.5932 33.9258 26.6404 33.6881C26.6877 33.4504 26.8044 33.2321 26.9757 33.0608C27.1471 32.8895 27.3654 32.7728 27.603 32.7255C27.8407 32.6782 28.087 32.7025 28.3109 32.7952C28.5348 32.888 28.7261 33.045 28.8607 33.2465C28.9954 33.4479 29.0672 33.6848 29.0672 33.9271C29.0672 34.2521 28.9381 34.5637 28.7084 34.7934C28.4786 35.0232 28.167 35.1523 27.8421 35.1523Z"
                                fill="#EC811F" />
                        </svg>
                    </div>
                    <div class="notify-text">
                        <h2> ${header !== undefined ? header : this.info.warning} </h2>
                        <p> ${text}</p>
                    </div>
                </div>
            </div>
                `);
                // Delete İtem And Anim
                let item = document.getElementById("notify-" + number);
                gsap.to(item, { left: "-2vw", duration: 0.5, ease: "power2.out" })
                gsap.to(item, { left: "20vw", duration: 0.5, ease: "power2.out", delay: delayA })
                if (this.noftiySound) {
                    const warning = new Audio("./assets/sound/warning.mp3");
                    warning.volume = 0.5;
                    warning.play();
                }
                setTimeout(() => {
                    item.remove();
                }, this.notifyDelay);
            } else if (type === "info") {
                var number = Math.floor((Math.random() * 1000) + 1);
                notify.insertAdjacentHTML("beforeend", `
                <div class="notify info" id="notify-${number}">
                <div class="notify-inner">
                    <div class="left-svg border-svg">
                        <svg xmlns="http://www.w3.org/2000/svg" width="10" height="10" viewBox="0 0 10 10" fill="none">
                            <path d="M9.5 0.89679H2.67242C2.04395 0.89679 1.53448 1.40626 1.53448 2.03472V10.0002"
                                stroke="#ECBF1F" stroke-width="1.13793" />
                        </svg>
                    </div>
                    <div class="right-svg border-svg">
                        <svg xmlns="http://www.w3.org/2000/svg" width="11" height="9" viewBox="0 0 11 9" fill="none">
                            <path
                                d="M9.48279 8.56922L9.48279 1.74163C9.48279 1.11317 8.97332 0.603699 8.34486 0.603699L0.37934 0.603698"
                                stroke="#ECBF1F" stroke-width="1.13793" />
                        </svg>
                    </div>
                    <div class="bottom-left-svg border-svg">
                        <svg xmlns="http://www.w3.org/2000/svg" width="11" height="10" viewBox="0 0 11 10" fill="none">
                            <path
                                d="M0.965515 0.77606L0.965515 7.60365C0.965515 8.23211 1.47498 8.74158 2.10345 8.74158L10.069 8.74158"
                                stroke="#ECBF1F" stroke-width="1.13793" />
                        </svg>
                    </div>
                    <div class="bottom-right-svg border-svg">
                        <svg xmlns="http://www.w3.org/2000/svg" width="10" height="10" viewBox="0 0 10 10" fill="none">
                            <path
                                d="M0.948301 9.31055L7.77589 9.31055C8.40435 9.31055 8.91382 8.80108 8.91382 8.17262L8.91382 0.207099"
                                stroke="#ECBF1F" stroke-width="1.13793" />
                        </svg>
                    </div>
                    <div class="notify-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="56" height="57" viewBox="0 0 56 57" fill="none">
                            <path
                                d="M55.3344 28.4315C55.3344 43.7117 42.9474 56.0987 27.6672 56.0987C12.387 56.0987 0 43.7117 0 28.4315C0 13.1513 12.387 0.764282 27.6672 0.764282C42.9474 0.764282 55.3344 13.1513 55.3344 28.4315ZM2.07895 28.4315C2.07895 42.5635 13.5352 54.0197 27.6672 54.0197C41.7992 54.0197 53.2555 42.5635 53.2555 28.4315C53.2555 14.2995 41.7992 2.84323 27.6672 2.84323C13.5352 2.84323 2.07895 14.2995 2.07895 28.4315Z"
                                fill="#1FE0EC" fill-opacity="0.14" />
                            <path
                                d="M55.3344 28.4315C55.3344 23.591 54.0645 18.8352 51.6514 14.639C49.2384 10.4429 45.7666 6.95325 41.583 4.51862C37.3993 2.08399 32.6501 0.789576 27.8097 0.764649C22.9692 0.739722 18.207 1.98515 13.9984 4.37657L15.0255 6.18408C18.9178 3.97237 23.3222 2.82052 27.799 2.84357C32.2757 2.86662 36.668 4.06377 40.5373 6.31546C44.4066 8.56715 47.6175 11.7946 49.8492 15.6754C52.0809 19.5563 53.2555 23.9547 53.2555 28.4315H55.3344Z"
                                fill="#1FE0EC" />
                            <circle cx="27.6672" cy="28.4314" r="23.056" fill="#1FE0EC" fill-opacity="0.16" />
                            <path
                                d="M27.6672 17.8257C25.4784 17.8257 23.3387 18.4748 21.5188 19.6909C19.6988 20.9069 18.2804 22.6353 17.4427 24.6575C16.6051 26.6797 16.3859 28.9049 16.813 31.0517C17.24 33.1984 18.294 35.1704 19.8417 36.7181C21.3895 38.2658 23.3614 39.3198 25.5082 39.7469C27.6549 40.1739 29.8801 39.9547 31.9023 39.1171C33.9245 38.2795 35.6529 36.861 36.869 35.0411C38.085 33.2211 38.7341 31.0814 38.7341 28.8926C38.731 25.9585 37.564 23.1454 35.4892 21.0706C33.4145 18.9958 30.6014 17.8288 27.6672 17.8257ZM27.2415 22.9335C27.4941 22.9335 27.741 23.0084 27.951 23.1487C28.161 23.2891 28.3246 23.4885 28.4213 23.7218C28.5179 23.9551 28.5432 24.2119 28.494 24.4596C28.4447 24.7073 28.3231 24.9348 28.1445 25.1134C27.9659 25.292 27.7384 25.4136 27.4907 25.4629C27.243 25.5122 26.9862 25.4869 26.7529 25.3902C26.5195 25.2936 26.3201 25.1299 26.1798 24.9199C26.0395 24.7099 25.9646 24.463 25.9646 24.2105C25.9646 23.8718 26.0991 23.547 26.3386 23.3075C26.5781 23.0681 26.9029 22.9335 27.2415 22.9335ZM28.5185 34.8517C28.0669 34.8517 27.6339 34.6723 27.3146 34.353C26.9953 34.0337 26.8159 33.6007 26.8159 33.1491V28.8926C26.5901 28.8926 26.3736 28.8029 26.2139 28.6433C26.0543 28.4836 25.9646 28.2671 25.9646 28.0413C25.9646 27.8155 26.0543 27.599 26.2139 27.4394C26.3736 27.2797 26.5901 27.19 26.8159 27.19C27.2675 27.19 27.7005 27.3694 28.0198 27.6887C28.3391 28.008 28.5185 28.4411 28.5185 28.8926V33.1491C28.7443 33.1491 28.9608 33.2388 29.1205 33.3985C29.2801 33.5581 29.3698 33.7746 29.3698 34.0004C29.3698 34.2262 29.2801 34.4427 29.1205 34.6024C28.9608 34.762 28.7443 34.8517 28.5185 34.8517Z"
                                fill="#1FE0EC" />
                        </svg>
                    </div>
                    <div class="notify-text">
                        <h2> ${header !== undefined ? header : this.info.info} </h2>
                        <p> ${text} </p>
                    </div>
                </div>
            </div>
                `);
                // Delete İtem And Anim
                let item = document.getElementById("notify-" + number);
                gsap.to(item, { left: "-2vw", duration: 0.5, ease: "power2.out" })
                gsap.to(item, { left: "20vw", duration: 0.5, ease: "power2.out", delay: delayA })
                if (this.noftiySound) {
                    const information = new Audio("./assets/sound/information.mp3");
                    information.volume = 0.5;
                    information.play();
                }
                setTimeout(() => {
                    item.remove();
                }, this.notifyDelay);
            } else if (type === "success") {
                var number = Math.floor((Math.random() * 1000) + 1);
                notify.insertAdjacentHTML("beforeend", `
                <div class="notify success" id="notify-${number}">
                <div class="notify-inner">
                    <div class="left-svg border-svg">
                        <svg xmlns="http://www.w3.org/2000/svg" width="10" height="10" viewBox="0 0 10 10" fill="none">
                            <path d="M9.5 0.89679H2.67242C2.04395 0.89679 1.53448 1.40626 1.53448 2.03472V10.0002"
                                stroke="#ECBF1F" stroke-width="1.13793" />
                        </svg>
                    </div>
                    <div class="right-svg border-svg">
                        <svg xmlns="http://www.w3.org/2000/svg" width="11" height="9" viewBox="0 0 11 9" fill="none">
                            <path
                                d="M9.48279 8.56922L9.48279 1.74163C9.48279 1.11317 8.97332 0.603699 8.34486 0.603699L0.37934 0.603698"
                                stroke="#ECBF1F" stroke-width="1.13793" />
                        </svg>
                    </div>
                    <div class="bottom-left-svg border-svg">
                        <svg xmlns="http://www.w3.org/2000/svg" width="11" height="10" viewBox="0 0 11 10" fill="none">
                            <path
                                d="M0.965515 0.77606L0.965515 7.60365C0.965515 8.23211 1.47498 8.74158 2.10345 8.74158L10.069 8.74158"
                                stroke="#ECBF1F" stroke-width="1.13793" />
                        </svg>
                    </div>
                    <div class="bottom-right-svg border-svg">
                        <svg xmlns="http://www.w3.org/2000/svg" width="10" height="10" viewBox="0 0 10 10" fill="none">
                            <path
                                d="M0.948301 9.31055L7.77589 9.31055C8.40435 9.31055 8.91382 8.80108 8.91382 8.17262L8.91382 0.207099"
                                stroke="#ECBF1F" stroke-width="1.13793" />
                        </svg>
                    </div>
                    <div class="notify-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="56" height="57" viewBox="0 0 56 57" fill="none">
                            <path d="M55.9282 28.397C55.9282 43.6772 43.5412 56.0642 28.261 56.0642C12.9809 56.0642 0.593842 43.6772 0.593842 28.397C0.593842 13.1168 12.9809 0.729797 28.261 0.729797C43.5412 0.729797 55.9282 13.1168 55.9282 28.397ZM2.67279 28.397C2.67279 42.529 14.129 53.9853 28.261 53.9853C42.393 53.9853 53.8493 42.529 53.8493 28.397C53.8493 14.265 42.393 2.80875 28.261 2.80875C14.129 2.80875 2.67279 14.265 2.67279 28.397Z" fill="#ECBF1F" fill-opacity="0.14"/>
                            <path d="M55.9282 28.397C55.9282 23.5565 54.6583 18.8007 52.2453 14.6045C49.8322 10.4084 46.3605 6.91876 42.1768 4.48413C37.9932 2.0495 33.244 0.755091 28.4035 0.730164C23.5631 0.705238 18.8008 1.95067 14.5923 4.34208L15.6194 6.1496C19.5117 3.93788 23.9161 2.78603 28.3928 2.80909C32.8695 2.83214 37.2619 4.02929 41.1312 6.28098C45.0005 8.53266 48.2113 11.7601 50.4431 15.6409C52.6748 19.5218 53.8493 23.9202 53.8493 28.397H55.9282Z" fill="#ECBF1F"/>
                            <circle cx="28.261" cy="28.3969" r="23.056" fill="#ECBF1F" fill-opacity="0.16"/>
                            <path d="M37.8843 24.0627C37.6685 23.8182 37.4031 23.6223 37.1058 23.4882C36.8085 23.3541 36.4861 23.2848 36.1599 23.2848H30.7951V21.752C30.7951 20.7357 30.3914 19.761 29.6728 19.0424C28.9541 18.3238 27.9795 17.92 26.9631 17.92C26.8208 17.9199 26.6812 17.9595 26.56 18.0343C26.4389 18.1091 26.3409 18.2161 26.2772 18.3435L22.6579 25.584H18.5328C18.1263 25.584 17.7364 25.7455 17.4489 26.0329C17.1615 26.3204 17 26.7103 17 27.1168V35.5472C17 35.9537 17.1615 36.3435 17.4489 36.631C17.7364 36.9185 18.1263 37.0799 18.5328 37.0799H35.0103C35.5705 37.0801 36.1114 36.8758 36.5316 36.5054C36.9517 36.135 37.2222 35.6239 37.2923 35.0682L38.4418 25.8714C38.4826 25.5476 38.4539 25.2189 38.3578 24.907C38.2617 24.5952 38.1003 24.3074 37.8843 24.0627ZM18.5328 27.1168H22.3648V35.5472H18.5328V27.1168Z" fill="#ECBF1F"/>
                          </svg>
                    </div>
                    <div class="notify-text">
                        <h2> ${header !== undefined ? header : this.info.success} </h2>
                        <p> ${text} </p>
                    </div>
                </div>
            </div>
                `);
                // Delete İtem And Anim
                let item = document.getElementById("notify-" + number);
                gsap.to(item, { left: "-2vw", duration: 0.5, ease: "power2.out" })
                gsap.to(item, { left: "20vw", duration: 0.5, ease: "power2.out", delay: delayA })
                if (this.noftiySound) {
                    const Success = new Audio("./assets/sound/Success.mp3");
                    Success.volume = 0.5;
                    Success.play();
                }
                setTimeout(() => {
                    item.remove();
                }, this.notifyDelay);
            }
        },

    },
    computed: {
        sortedMessageList: function () {
            return this.messageList.slice().sort((a, b) => {
                const dateA = new Date(a.date + " " + a.time).getTime();
                const dateB = new Date(b.date + " " + b.time).getTime();

                return dateA - dateB; // Compare timestamps in reverse order
            });
        },
        matchingCommands: function () {
            let input = this.newMessage
            let commands = this.commandList
            let matchingCommands = commands.filter(command => command.command.startsWith(input))
            if (matchingCommands.length > 4) {
                return this.defaultCommands
            } else {
                return matchingCommands
            }
        },
    },
    watch: {
        messageList: function () {
            const messageList = document.querySelector(".message-cont");
            // Scroll bottom
            setTimeout(() => {
                this.messageIndex = this.messageList.length;
                messageList.scrollTop = messageList.scrollHeight;
            }, 100);
        },
        newMessage: function () {
            // Max one "/" in message delete more
            if (this.newMessage.split("/").length > 2) {
                // replace last "/" in message
                this.newMessage = this.newMessage.replace(/\/([^\/]*)$/, "$1");
            }
        },
    },
});

document.onkeyup = function (data) {
    if (data.which == 27) {
        app.emojiPicker = false
        app.chatSettings = false
        app.chatInput = false
        if (app.chatNotify) { // chati göster
            $.post('http://dusa_chat/closeFocus', JSON.stringify({}));
        } else { // chati gösterme
            $.post('http://dusa_chat/close', JSON.stringify({}));
        }
    }
}