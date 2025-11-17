# GuerreRP – Base FiveM Publique (ESX Legacy)

> **Auteur : _Ducratif_**  
> **Documentation principale :** <https://guerrerp.ducratif.com>  
> **Discord support & retours :** <https://discord.gg/kpD8pQBBWm>

[![GitHub Release](https://img.shields.io/github/v/release/Ducratif/guerrerp_base)](https://github.com/Ducratif/guerrerp_base/releases)
[![License](https://img.shields.io/badge/license-Custom-blue)](#-bonnes-pratiques--limites-dutilisation)
[![ESX Legacy](https://img.shields.io/badge/framework-ESX_Legacy-green)](#)


---

![banner](https://dummyimage.com/1200x260/000000/ffffff&text=GuerreRP+Public+Base+by+Ducratif)

<p align="center">
  <b>Base complète ESX Legacy, prête à l’emploi, pensée pour la guerre de territoires, le RP hardcore et les events scriptés.</b><br>
  Tout est structuré, documenté et modulaire pour vous permettre de créer VOTRE serveur sans repartir de zéro.
</p>

---

## ⬇️ Téléchargement de la base GuerreRP

> ⚠️⚠️ **IMPORTANT – NE PAS UTILISER “CODE → DOWNLOAD ZIP” SUR GITHUB** ⚠️⚠️  
> Ce dépôt GitHub ne contient **PAS** l’intégralité de la base.  
> Les fichiers présents ici servent surtout de **visuel global** et de **documentation** (scripts légers, structure, aperçu).  
> Pour récupérer une base **jouable et complète**, utilisez **uniquement les liens de téléchargement ci-dessous**.

---

### 📁 1. Base principale “légère” (sans mappings ni véhicules)

Cette version contient :

- Tous les scripts essentiels, ESX, OX, systèmes, jobs, etc.
- **Aucun mapping** et **aucun véhicule** pour garder un poids léger.
- Idéal pour :
  - comprendre la structure GuerreRP,
  - démarrer un serveur et ajouter vos propres mappings/véhicules,
  - faire des tests / dev.

👉 **Téléchargement :**  
**Base sans mappings & véhicules :**  
<https://drive.google.com/drive/folders/1dPMY4ocJEvMO5sPrAI4BYtF6reJZcoHI?usp=drive_link>

---

### 🚗 2. Pack véhicules

Ce dossier contient les **véhicules de la base GuerreRP**, organisés par catégories (police, EMS, mécano, armée, VIP, etc.).

> ⚠️ Certains véhicules peuvent être **non debadge** (logos/marques réelles).  
> Pour un usage public ou monétisé, pensez à :
> - vérifier vos contraintes légales,
> - remplacer les modèles sensibles par des versions debadgées / lore-friendly.

👉 **Téléchargement :**  
**Pack véhicules :**  
<https://drive.google.com/drive/folders/1Z0k1z98X-GJrKpFUmkktxl_UBx6207B4?usp=sharing>

---

### 🗺️ 3. Pack mappings & véhicules supplémentaires

Ce dossier contient :

- Les **mappings** de la base (bases militaires, HQ, intérieurs, labs, etc.).
- Certains **véhicules supplémentaires** liés à ces mappings ou à des usages spécifiques.

Ces ressources complètent la base pour recréer l’environnement visuel et RP de **GuerreRP**.

👉 **Téléchargement :**  
**Mappings & véhicules supplémentaires :**  
<https://drive.google.com/drive/folders/1m0j3W3MfX0doyN_-znewmHWl_zb8bPzV?usp=drive_link>

---

### 📌 Résumé important

- ✅ **Pour tester, développer ou comprendre la structure** → Base légère (sans mappings ni véhicules).  
- ✅ **Pour recréer l’expérience GuerreRP complète** → Base légère **+** pack véhicules **+** pack mappings.  
- ⚠️ **ATTENTION:** → Si vous utilisez pas les mappings/Véhicules, retirer les ensures dans le fichier ressource.cfg
- 🚫 **Ne téléchargez pas la base via le bouton GitHub “Download ZIP”** :  
  vous n’aurez **pas tout** et certains scripts/mappings sont volontairement absents ou allégés ici.

> Pour toute question, support ou retour :  
> **Discord :** <https://discord.gg/kpD8pQBBWm>


---

## 🗄️ Importation du fichier SQL (Base de donnée)

Ce projet est livré avec un fichier SQL contenant toute la structure + les données nécessaires.

### 1️⃣ Création de la base de données

1. Connectez-vous à votre **phpMyAdmin**.
2. Cliquez sur **Nouvelle base de données**.
3. Donnez un nom à la base, par exemple : `guerrerp`.
4. Choisissez le jeu de caractères **utf8mb4_general_ci**.
5. Validez la création.

> 💡 Gardez précieusement le nom de la base (`guerrerp`) :  
> il devra être renseigné dans votre configuration MySQL (server.cfg, .env, etc.).

---

### 2️⃣ Import du fichier `guerrerp.sql`

1. Dans le menu de gauche, **cliquez sur la base** que vous venez de créer.
2. Allez dans l’onglet **Importer**.
3. Cliquez sur **Choisir un fichier** et sélectionnez le fichier :  
   `guerrerp.sql`
4. Laissez le format sur **SQL**.
5. Cliquez sur **Exécuter** et attendez la fin du processus.

Si tout se passe bien, phpMyAdmin affichera un message de succès et les tables apparaîtront dans le menu de gauche.

---

### 3️⃣ ⚠️ À propos des erreurs “Unexpected character”

Si vous collez le contenu du fichier dans l’onglet **SQL** puis cliquez sur **Analyser**,  
phpMyAdmin peut afficher des erreurs du type :

```text
Unexpected character (near "[" at position XXX)
```

C’est normal : il s’agit de l’analyse statique de phpMyAdmin qui n’aime pas certains champs
(stockage de tags / JSON en texte), mais MySQL accepte parfaitement le script.

✅ Pour éviter ces faux positifs, utilisez uniquement l’onglet Importer
ou le bouton Exécuter sans passer par l’analyse statique.

![Crée la base](img/create_base.png)

![Importer la base](img/import.png)

![Base crée](img/create.png)


---

## ✨ Features principales

- 🔹 **Framework : ESX Legacy** (avec toutes les dépendances de base)
- 🔹 **Écosystème OX** : `ox_lib`, `ox_inventory`, `ox_target`
- 🔹 **Organisation des ressources** par “paliers” : `[1_essential]`, `[2_test]`, `[3_ESX]`, `[5_visual]`, `[6_voice]`, `[7_script]`, etc.
- 🔹 **Scripts Ducratif exclusifs** : jobs, events, systèmes illégaux, outils staff, mapping personnalisé.
- 🔹 **Pack mapping** (bases militaires, zones gang, hôpitaux, pillbox, postes de police, etc.)
- 🔹 **Pack véhicules** (police, medical, mécano, VIP, armée…)  
  ⚠️ Certains véhicules ne sont **pas débadgés** → voir section dédiée.
- 🔹 **Support Discord & Webhooks intégrés** (logs, admin, gameplay…)

> Cette base est pensée comme un **starter premium** : tu la lances, tu configures 2–3 choses, et tu es déjà en train de jouer.

---

## 🧱 Structure globale de la base

Arborescence simplifiée des ressources (dossier `resources/`) :

```text
resources/
├── [extended]/
├── [system]/
│   ├── async/
│   ├── cron/
│   ├── memorygame/
│   ├── progress/
│   ├── sd_lib/
│   └── vSync/
├── oxmysql/
├── [1_essential]/
│   ├── [10_ducratif]/
│   └── [ox]/        (ox_inventory, ox_lib, ox_target)
├── [2_test]/
│   ├── [1_framework]/  (screenshot-basic, xsound, …)
│   ├── [3_ESX]/        (tous les scripts ESX de base)
│   ├── [5_visual]/     (HUD, loading screen, chat…)
│   ├── [6_voice]/      (mumble-voip, pma-voice, ac_radio…)
│   ├── [7_script]/     (gros pack de scripts RP & QoL)
│   ├── [8_admin]/      (menus admins)
│   ├── [11_car]/       (véhicules)
│   └── [mapping]/      (mappings & intérieurs)
└── [dev] / [gameplay] / [local] / [managers] / [system] / [test] …
```

> 📌 **Important :**  
> Pour chaque script listé ci-dessous, **si un lien de dépôt GitHub est indiqué à côté**, cela signifie qu’il existe une **documentation dédiée** sur ce dépôt.  
> Le présent README sert de **vue d’ensemble** et de guide d’installation/configuration.

---

## ⚙️ Prérequis & stack technique

- **FXServer / txAdmin** dernière version recommandée
- **MySQL / MariaDB**
- **oxmysql** (fourni dans `resources/oxmysql`)
- **ESX Legacy**
- OS conseillé : Linux (Debian / Ubuntu) ou Windows Server

Dans `server.cfg`, assure-toi de configurer au minimum :

```cfg
set mysql_connection_string "mysql://user:password@host/database?charset=utf8mb4"
set sv_licenseKey "TA_CLE_FIVEM"
set steam_webApiKey "TA_STEAM_API_KEY"
set onesync on
sets locale "fr-FR"
```

Dans `ressources.cfg`

### Si vous avez télécharger les packs de véhicule & mapping penser a retiré les `#` devant
Dans: `# -----MAPPING-----` & `#------VOITURE------` & `#--------------Voiture concess------------`


---

## 🚀 Installation rapide

1. **Cloner le dépôt :**

```bash
git clone https://github.com/Ducratif/guerrerp_base.git
```

2. **Copier la base sur ton serveur FXServer / txAdmin**

   Place le contenu dans ton dossier serveur (là où se trouve `server.cfg`).

3. **Importer la base de données :**

   - Fichier SQL principal : `guerrerp.sql`  
   - Import dans ta base via phpMyAdmin / Adminer / CLI MySQL.

4. **Configurer `server.cfg` :**

   - Ajoute/ajuste les lignes `ensure` pour les ressources (voir plus bas).
   - Vérifie la config de `oxmysql`, `es_extended`, etc.

5. **Configurer les placeholders (webhooks / tokens / clés)** :

   Ouvre VS Code à la racine du serveur, puis :

   - **Webhook Discord générique**  
     Chercher **dans tout le dossier `resources/`** :

     ```text
     TON_WEBHOOK_DUCRATIF
     ```

     ➜ Remplace par un **webhook Discord valide** pour recevoir les logs / infos des scripts concernés.

   - **Token de bot Discord**  

     ```text
     TOKEN_BOT_DISCORD
     ```

     ➜ Remplace par le **token de ton bot Discord** (scripts qui communiquent avec un bot).

   - **Steam API key / FiveManage / Luxu Admin**  

     Dans les scripts liés à Luxu Admin / gestion staff, chercher :

     ```text
     STEAM_API_KEY_DUCRATIF
     ```

     ➜ Remplace par ta **Steam API Key**.  
     Pense aussi à configurer :
     - L’ID de ton serveur Discord
     - L’ID de ton application FiveManage (le cas échéant)

6. **Lancer le serveur :**

   - Via txAdmin ou `run.sh` / `FXServer.exe`
   - Vérifie la console : aucun `error` bloquant, pas de `couldn't start resource` critique.

---

## 📦 Détail des ressources & scripts

> ⚠️ La liste ci-dessous reprend les **grands ensembles** et les scripts visibles dans l’arborescence.  
> Pour la liste exhaustive et les fichiers, se référer directement au dépôt GitHub.

### 🧬 1. Noyau & système

#### `[extended]`, `[system]`, `oxmysql`

| Script / dossier | Type         | Rôle principal                                 | Docs |
|------------------|-------------|-----------------------------------------------|------|
| `async`          | Core        | Gestion asynchrone ESX                        | –    |
| `cron`           | Core        | Tâches programmées ESX                        | –    |
| `memorygame`     | Mini-jeu    | Memory game (utilisé dans divers scripts)     | –    |
| `progress`       | Utilitaire  | Barre de progression                          | –    |
| `sd_lib`         | Lib         | Lib utilitaire interne                        | –    |
| `vSync`          | Sync        | Gestion météo / temps                         | –    |
| `oxmysql`        | DB          | Bridge MySQL ↔ FiveM (performant)             | [GitHub](https://github.com/overextended/oxmysql) |

---

### 🔑 2. Essentiels & écosystème OX – `[1_essential]`

#### `[10_ducratif]` – Scripts maison GuerreRP

Quelques exemples (liste non exhaustive) :

| Script                    | Type             | Description rapide                                          | Docs |
|---------------------------|------------------|--------------------------------------------------------------|------|
| `mapping_ducratif`        | Mapping helper   | Gestion spécifique de mappings Ducratif                      | –    |
| `ducratif_atmrob`         | Illégal          | Braquage d’ATM, logique custom                              | –    |
| `ducratif_handsup`        | Animation / RP   | Gestion des mains en l’air                                  | –    |
| `ducratif_mask_toggle`    | QoL              | Gestion du masque (toggle rapide)                           | –    |
| `ducratif_territoire`     | Gameplay         | Script de territoires (guerre de zones)                     | –    |
| `go_fast`                 | Illégal          | Système de Go-Fast en plusieurs étapes                      | –    |
| `job_transport_pl`        | Job              | Job de transport avec gestion de remorque / spawn sécurisé  | –    |
| `menu_facturation`        | Interface        | Menu de facturation custom                                  | –    |
| `PowerEvent`              | Event            | Gestion d’events dynamiques / power events                  | –    |
| `stimulant_guerreRP`      | Item / Effet     | Items stimulants avec effets spécifiques                    | –    |

> Ces scripts forment l’ADN gameplay de GuerreRP.  
> Ils sont pensés pour travailler ensemble autour de la **guerre de territoires** et du **RP action**.

#### `[ox]` – écosystème Overextended

| Script        | Type            | Rôle                                      | Docs |
|---------------|-----------------|-------------------------------------------|------|
| `ox_inventory`| Inventaire      | Inventaire avancé                         | [GitHub](https://github.com/overextended/ox_inventory) |
| `ox_lib`      | Lib UI & utils  | Menus, notifications, callbacks, etc.     | [GitHub](https://github.com/overextended/ox_lib) |
| `ox_target`   | Interaction     | Système de “target” 3D                    | [GitHub](https://github.com/overextended/ox_target) |

---

### 🧪 3. Framework & ESX – `[2_test]/[1_framework]` & `[3_ESX]`

#### `[1_framework]`

| Script             | Type        | Description                         |
|--------------------|------------|-------------------------------------|
| `screenshot-basic` | Utilitaire | Capture d’écran côté client        |
| `xsound`           | Audio      | Gestion de sons côté client        |

#### `[3_ESX]` – ESX Legacy & modules RP

Exemples (liste non exhaustive) :

- `esx_addonaccount`
- `esx_addoninventory`
- `esx_ambulancejob`
- `esx_banking`
- `esx_basicsneeds`
- `esx_context`
- `esx_datastore`
- `esx_identity`
- `esx_instance`
- `esx_job_creator`
- `esx_license`
- `esx_menu_default`
- `esx_menu_dialog`
- `esx_menu_list`
- `esx_notify`
- `esx_policejob`
- `esx_progressbar`
- `esx_skin`
- `esx_society`
- `esx_status`
- `esx_textui`
- `esx_vehicleshop`
- `LegacyFuel`

> 📝 **Note :** La plupart de ces scripts sont open-source.  
> Si un lien GitHub est mentionné dans les sources ou à côté du script, se référer à ce dépôt pour une documentation détaillée.

---

### 🎨 4. Visuels / HUD / UI – `[5_visual]`

| Script             | Type         | Description                                 |
|--------------------|-------------|---------------------------------------------|
| `ak4y_loadingscreen` | Loading    | Écran de chargement custom                  |
| `kurlie_chat`      | Chat        | Interface de chat retravaillée              |
| `mHud`             | HUD         | HUD custom (statuts, info joueur, etc.)     |

---

### 🎙️ 5. Voix – `[6_voice]`

| Script        | Type     | Description                          | Docs |
|---------------|----------|--------------------------------------|------|
| `ac_radio`    | Radio    | Système de radio                     | –    |
| `mumble-voip` | Voix     | Voix en jeu via Mumble              | –    |
| `pma-voice`   | Voix     | Système de voix performant (PMA)    | [GitHub](https://github.com/AvarianKnight/pma-voice) |

---

### 🧩 6. Gameplay & QoL – `[7_script]`

> Dossier très riche contenant de nombreux scripts RP, métiers, systèmes, etc.  
> Voici quelques exemples significatifs (liste non exhaustive) :

- `[farming]` – systèmes agricoles / récoltes
- `[FranceTravail]` – logique d’emploi / pôle emploi RP
- `[Gouvernement]` – scripts gouvernementaux / administration
- `[mechanic]` – scripts liés aux mécanos
- `[property]` – gestion des propriétés
- `0crafting0` – systèmes de craft
- `AFK` – gestion de l’AFK
- `ato_bossmenu` – menu boss
- `barbershop` – coiffure
- `BlipCreator` – création de blips dynamiques
- `custom_impound` – fourrière custom
- `discord_rich` – Rich Presence Discord
- `DoorsBuilder` – système de portes
- `elevator` – ascenseurs
- `eponge` – mécanique liée au nettoyage
- `esx_emotemenu` – menu d’emotes
- `esx_advanced_drugs` – système de drogues avancé
- `esx_rp_skinshop_v2` – magasin de vêtements / apparence
- `esx_property`, `esx_tattooshops`, `esx_vehiclespawner`, etc.
- `Fishing-Job` – job de pêche
- `FiveM-vetement` – vêtements
- `gacha_boombox` – boombox / musique
- `garage` – système de garages
- `hydroplaning-spacedrout` – mécanique de conduite spécifique
- `illenium-appearance` – système d’apparence avancé
- `interact` – interactions
- `item_maps` – items de type carte
- `lg-radiocar` – véhicule radio spécifique
- `Medical_System` – système médical
- `MugShotBase64` – mugshots
- `owlsen_satmap` – carte satellite
- `ox_sit` – s’asseoir sur des objets
- `pausemenuOPEN` – menu pause custom
- `Point-finger` – pointer du doigt
- `RemoveAllNPCs` – suppression des PNJ
- `reviews` – système d’avis
- `tracker_gps` – trackers GPS
- `uniq_garbage` / `Var-Garbagelob` – système de poubelles / ordures
- `vms_documents` – gestion de documents
- `xRadar` – radar

> Pour certains de ces scripts, des docs externes existent (dépôts GitHub originaux).  
> Si un lien est indiqué dans les fichiers ou à côté du script dans ce README, **c’est là que se trouve la doc détaillée.**

---

### 🛠️ 7. Admin – `[8_admin]`

| Script       | Type   | Rôle                                  |
|--------------|--------|----------------------------------------|
| `adminmenu`  | Admin  | Menu admin principal                  |
| `VVelvAdmin` | Admin  | Outil admin complémentaire / alternatif|

Certains de ces outils peuvent s’interfacer avec :

- **Steam API** (`STEAM_API_KEY_DUCRATIF`)
- **FiveManage**
- **Bot Discord** (logs staff, sanctions, etc.)

---

### 🚓 8. Véhicules – `[11_car]`

Dossier contenant les différents **packs véhicules** (police, EMS, mécano, VIP, armée, etc.) :

Exemples de sous-dossiers :

- `[bateau_army]`
- `[car_army]`
- `[police1]`
- `[vip]`
- `baga`
- `barati`
- `brosche`
- `DLVanillaEMS`
- `FamPharmCar`
- `harmoney`
- `mechanic`
- `medical`
- `motoraeder`
- `police`
- `rs6_debadge`
- `special`
- …

> ⚠️ **Attention :**  
> Une partie de ces véhicules sont **non debadge** (logos constructeurs / marques réelles).  
> Pour une diffusion publique / monétisée, il est **vivement recommandé** de :
> - remplacer ces véhicules par des modèles libres / debadgés,
> - ou vérifier vos contraintes légales en fonction de votre juridiction.

---

### 🗺️ 9. Mapping – `[mapping]`

Pack mapping complet pour GuerreRP. Exemples :

- `[base_militaire_us]`
- `[Bayview_Lodge]`
- `[Cayo]`
- `[Coffee_shop_nord]`
- `[russia]`
- `airport-ls`
- `base_army`
- `borderupgrade`
- `DealerCar`
- `druglabs`
- `eastcustoms`
- `evo_fortzancudo`
- `FOB_Geronimo`
- `gang_hideout`
- `gang_int`
- `mafiasphp`
- `ms_jobs`
- `origen_irish_pub`
- `parasha_flat`
- `pharmacy`
- `pillbox_hopital`
- `police_center`
- `police_formation`
- `PoliceStationV`
- `rojo_trinity_billboard`
- `RondPoint`
- `sandy_airfield`
- …

Ces mappings sont pensés pour :

- La guerre de territoires
- Les jobs légaux (police, EMS, mécano, gouvernement…)
- Les activités illégales (labs, cachettes, HQ de gangs…)

---

## 🧩 Configuration détaillée

### 🔔 Webhooks & logs Discord

Plusieurs scripts envoient des logs vers Discord (sanctions, logs d’events, logs métiers, etc.).

- Placeholders à remplacer :

```text
TON_WEBHOOK_DUCRATIF
```

> Rechercher dans tout le dossier `resources/` avec VS Code, puis remplacer par  
> **un webhook Discord dédié** (idéalement un webhook par catégorie : staff, economy, illegal, etc.).

### 🤖 Tokens de bots Discord

Certains scripts communiquent avec un bot Discord (ex : système d’admin, notifications avancées, intégration FiveManage, etc.).

- Placeholder à remplacer :

```text
TOKEN_BOT_DISCORD
```

> Remplacer par le **token de ton bot**.  
> ⚠️ Ne jamais commit ce token en public, même si tu utilises cette base comme exemple.

### 🔑 Steam API / Luxu / FiveManage

Pour les scripts liés à **Luxu Admin**, **FiveManage** ou d’autres fonctionnalités liées à Steam :

```text
STEAM_API_KEY_DUCRATIF
```

À remplacer par :

- Ta **Steam Web API Key**
- Les IDs nécessaires (serveur Discord, application FiveManage, etc.)
- Les éventuels secrets dans des fichiers `.env` si tu préfères sécuriser.

---

## 🧷 ESX Legacy – Rappel

Cette base tourne sur :

> **ESX Legacy**

Cela implique :

- Des jobs, comptes, inventaires, etc. gérés via ESX et les modules `esx_…`
- Une forte compatibilité avec la plupart des scripts ESX du marché
- Les bonnes pratiques d’utilisation d’ESX Legacy (voir doc officielle).

---

## 📚 Documentation par script

- Ce README te donne la **vue globale** de la base.
- Pour certains scripts (par ex. `ox_*`, `pma-voice`, certains `esx_*`, ou des outils tiers), une **doc officielle** existe.
- **Convention dans ce README :**
  - Si un script a un lien comme `([GitHub](https://...))` à côté de son nom →  
    cela signifie qu’il possède une **documentation détaillée sur ce dépôt**.
  - En cas de doute, se référer a la section “Docs” du tableau correspondant.

---

## 🧑‍💻 Bonnes pratiques & limites d’utilisation

- Merci de **laisser les crédits** présents dans les fichiers (`Ducratif`, liens Discord & GitHub).
- Tu es libre :
  - de modifier la base pour ton serveur,
  - d’ajouter / retirer des scripts,
  - de t’en servir comme fondation technique.
- Tu n’es **pas censé revendre** la base telle quelle comme si tu en étais l’auteur principal.
- Respecte les licences des scripts tiers inclus (ESX, OX, PMA, etc.).

---

### 📜 Crédits détaillés & attribution

- **Base, architecture globale & scripts “Ducratif\_*” :**  
  Développés et intégrés par **Ducratif** pour le projet **GuerreRP**.
- **Framework : ESX Legacy**  
  Projet communautaire maintenu par l’équipe ESX et sa communauté.
- **Suite OX (ox_lib, ox_inventory, ox_target) :**  
  Par l’équipe **Overextended** – voir leurs dépôts GitHub respectifs pour la documentation et les licences.
- **Systèmes de voix (mumble-voip / pma-voice / ac_radio) :**  
  Par leurs auteurs respectifs. pma-voice, par exemple, est maintenu par AvarianKnight et la communauté.
- **Scripts ESX complémentaires (`esx_…`) :**  
  Pack issus de la communauté – chaque ressource dispose souvent de sa propre documentation / licence sur son dépôt d’origine.
- **Mappings & véhicules :**  
  Plusieurs ressources mapping et packs véhicules proviennent de créateurs tiers.  
  Merci de respecter les conditions de diffusion / crédits lorsqu’ils sont indiqués dans les ressources.

> 💡 **Important :**  
> Dans cette base, **lorsqu’un script est listé avec un lien vers un dépôt GitHub à côté de son nom**, cela signifie qu’il existe une **documentation séparée et dédiée** pour ce script.  
> Le présent README sert de **vue d’ensemble** ; pour les options fines / config avancée, reportez-vous toujours au dépôt du script en question.

#### 🔁 Forks, redistributions & modifications

- Vous pouvez **modifier** la base pour votre serveur (privé ou public), adapter les scripts, retirer ou ajouter des fonctionnalités.
- En cas de partage public de votre fork :
  - Gardez les **crédits Ducratif** dans les fichiers et dans la documentation.
  - Ajoutez vos propres mentions si vous développez par-dessus.
  - Ne présentez pas cette base comme une création “from scratch” si vous partez de GuerreRP.
- Pour tout script tiers (ESX, OX, pma-voice, etc.), respectez toujours les **licences d’origine** (MIT, GPL, proprietary, etc.) et les conditions de redistribution éventuelles.

#### ⚠️ Utilisation commerciale / monétisation

- Certains mappings, véhicules et scripts externes peuvent **ne pas être prévus** pour une utilisation commerciale.  
  Avant de vendre un accès ou un pack basé sur cette base :
  - Vérifiez les licences des ressources tierces.
  - Remplacez les véhicules **non debadge** (avec logos / marques réelles) si nécessaire.
  - Assurez-vous d’être conforme aux conditions de FiveM / Cfx.re et aux lois de votre pays.


---


## 🧩 Scripts maison Ducratif (cœur de GuerreRP)

> Ces scripts sont développés spécialement pour **GuerreRP** et constituent l’identité propre de la base.  
> Ils sont pensés pour être modulaires, configurables et interconnectés.

### ⚔️ Gameplay & guerre de territoires

- **`ducratif_territoire`**  
  Système avancé de **territoires** :  
  - Zones configurables (zones neutres, zones contestées, zones possédées).  
  - Conquête / défense de territoire.  
  - Intégration possible avec des events illégaux, gangs, armées ou factions.  
  - Pensé pour du “GuerreRP” : domination de carte, contrôle stratégique, RP de conflit.

- **`PowerEvent`**  
  Gestion d’**événements dynamiques** :
  - Déclenchement d’events spéciaux (loot, attaques, zones à défendre).  
  - Paramètres configurables (difficulté, récompenses, zones).  
  - Peut être utilisé pour créer des “saisons” d’évènements ou des nuits thématiques.

### 💼 Jobs & économie

- **`job_transport_pl`**  
  Job de **transport** avec gestion avancée des remorques :
  - Réservation de points de spawn de remorque pour éviter les conflits entre joueurs.  
  - Vérification côté serveur que le point de spawn est libre.  
  - Parcours configurable, livraisons RP et rémunérations ajustables.

- **`menu_facturation`**  
  Menu de **facturation** custom :
  - Interface propre et simple pour facturer les joueurs.  
  - Intégration ESX (sociétés, jobs, etc.).  
  - Paramétrages possibles pour les jobs autorisés, montants, motifs, etc.

- **`stimulant_guerreRP`**  
  Système d’**items stimulants** :
  - Items consommables avec effets temporaires (statistiques, résistance, etc.).  
  - Pensé pour les contextes de guerre, missions spéciales ou events.

### 🕵️ Activités illégales & risques

- **`ducratif_atmrob`**  
  Braquage d’**ATM** :
  - Braquages scriptés avec étapes, cooldowns, alertes, récompenses.  
  - Intégration possible avec les systèmes de police (dispatch, notifications).

- **`go_fast`**  
  Système de **Go-Fast** :
  - Livraison de cargaisons illégales en plusieurs étapes.  
  - PNJ, mots de passe, temps limite, récompenses variables.  
  - Fait pour créer de vrai stress RP (échec / réussite impactant l’économie).

### 🎭 RP, animations & confort de jeu

- **`ducratif_handsup`**  
  Gestion des **mains en l’air** :
  - Animations clean pour se rendre, se faire fouiller, etc.  
  - Intégration possible avec les scripts de fouille, menottage, etc.

- **`ducratif_mask_toggle`**  
  Gestion du **masque** :
  - Toggle rapide du masque (on/off) avec cohérence RP.  
  - Peut influencer l’identification du joueur (caméras, descriptions RP, etc.).

- **`mapping_ducratif`**  
  Outil / logique liée aux **mappings spécifiques** Ducratif :
  - Gestion d’activation / désactivation de certains mappings.  
  - Peut servir de base pour des événements spécifiques (ouvertures de lieux, changement de décor).

### 🧰 Outils techniques & intégrations

> Plusieurs scripts Ducratif sont pensés pour dialoguer avec des services externes (Discord, FiveManage, Steam, etc.).  
> Pour ces intégrations, pensez à configurer les placeholders suivants **dans tout le dossier `resources/`** :

- **Webhooks Discord (logs, events, admin, etc.)**

➜ À remplacer par un **webhook Discord valide**.
Un webhook dédié par type de logs est recommandé (staff, économie, illégal…).

* **Token du bot Discord**

  ➜ À remplacer par le **token du bot Discord** utilisé par les scripts associés
  (logs automatiques, intégration admin, synchronisation, etc.).

* **Steam API key / Luxu / FiveManage**

  ➜ À remplacer par ta **Steam Web API Key**, plus l’ID de ton serveur Discord et le client ID pour FiveManage si tu utilises ces intégrations.

### 🧾 Licence & respect des crédits Ducratif

* Tous les scripts préfixés `ducratif_` (ainsi que les systèmes Go-Fast, jobs personnalisés, events spécifiques, etc.) sont développés par **Ducratif** pour le projet **GuerreRP**.
* Les **crédits en haut et en bas des fichiers** doivent être conservés si vous :

  * réutilisez ces scripts,
  * modifiez la base,
  * ou publiez un fork.
* Tu peux adapter, optimiser, traduire, rethématiser, **tant que la mention d’origine reste visible**.

> En résumé : tu peux faire **ton** serveur à partir de cette base,
> mais le cœur custom (scripts Ducratif) reste signé. 😈


---

## 🛡️ Disclaimer légal

Ce projet n’est **pas affilié** à Rockstar Games, Take-Two Interactive, ni à FiveM / Cfx.re.

- Tous les noms, marques, et contenus appartenant à leurs propriétaires respectifs.
- Certains mappings, véhicules et scripts externes peuvent être soumis à des licences spécifiques.  
  Vérifie toujours les conditions avant tout usage **commercial** ou **public**.

---

## 🤝 Support & contributions

- 📌 **Issues / bugs / suggestions :** via l’onglet *Issues* du dépôt GitHub.
- 💬 **Support communautaire & annonces :**  
  Rejoins le Discord : <https://discord.gg/kpD8pQBBWm>
- 🛠️ Tu peux proposer :
  - des PR (Pull Requests) pour corriger/améliorer,
  - des traductions,
  - des optimisations (performance, sécurité, QoL).

---

<p align="center">
  Made with ❤️ by <b>Ducratif</b><br>
  <i>“GuerreRP ne disparaîtra jamais. On partage la base, mais l’ADN reste le même.”</i>
</p>
