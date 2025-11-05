# ducratif_ai_drive

**Conduite autonome par IA** pour ESX Legacy + ox\_* (ox_lib, ox_target, ox_inventory, oxmysql).  
Pensé pour *GuerreRP* : achat/activation chez un PNJ, panneau NUI en véhicule, options premium, favoris, historique, zones interdites, sécurité, entretien par items, logs & webhook.

## Dépendances
- ESX Legacy
- `ox_lib`
- `ox_target`
- `ox_inventory`
- `oxmysql`

## Installation
1. Déposez le dossier `ducratif_ai_drive_v1` dans votre répertoire `resources/` et renommez-le en `ducratif_ai_drive` si besoin.
2. Importez **les tables** via `sql/schema.sql` et **les items** via `sql/items.sql`.
3. Ajoutez les icônes d'items `chip1.png, chip2.png, chip3.png` dans `html/assets/` (déjà présents).
4. Configurez `server.cfg` :
   ```cfg
   ensure oxmysql
   ensure ox_lib
   ensure ox_target
   ensure ox_inventory
   ensure ducratif_ai_drive
   ```
5. Ouvrez `config.lua` et adaptez :
   - `Config.NPC.coords` (position du PNJ)
   - `Config.WebhookURL` (logs Discord)
   - `Config.OwnedVehicles*` si vos colonnes diffèrent
   - `Config.ForbiddenZones`, `Config.Blacklist*`, `Config.PoliceJobs`, etc.

6. Mettre les item dans ox_inventory:
`ox_inventory/data/items.lua`
& les images
`ox_inventory/web/images/`

## Utilisation
- Allez voir le **PNJ IA** (ox_target). Votre véhicule doit être à ≤ **25m**.
- Activez l’IA (**1 000 000$**) ou désactivez-la (**200 000$**). Une **calibration** (mini tutoriel) démarre après activation.
- En véhicule (conducteur), appuyez sur **N** pour ouvrir le **panel IA** :
  - **Conduite** → bouton *Lancer l’IA vers mon GPS* (utilise le waypoint du jeu).
  - **Options** → achat/activation de : mode de conduite, limitateur, régulateur, évitement de collisions, slots favoris.
  - **Historique** → derniers trajets (50 derniers).
  - **Favoris** → gestion et suppression (slots extensibles jusqu’à 30).
- **Commandes** :
  - `/ia_stop` : arrêt d’urgence et retour des contrôles.
  - `/ia_fav` : ajouter le **waypoint** courant aux favoris (demande un nom).

## Sécurité & RP
- **Pneu crevé** : alerte + limite **40 km/h** tant que non réparé.
- **Sirènes police** : si un véhicule avec sirène est à ≤ **20 m** pendant **10s**, le conducteur police reçoit une **prompt** pour demander l’arrêt de l’IA (anti-spam intégré).
- **Anomalies** (moteur HS, feu, choc fort) : **stop IA** et notification.
- **Zones interdites** (config) : démarrage impossible dedans ; si l’IA entre dans la zone → arrêt et message.

## Entretien IA (items `ox_inventory`)
- **Module IA** : restaure **100%** d’une option au choix.
- **Module IA Premium** : restaure **50%** de **toutes** les options.
- **Module IA Platine** : restaure **100%** de **toutes** les options.
- Mode de consommation **configurable** (`time` en minutes ou `distance` en km).

## Logs
- Table `ai_logs` (toutes actions importantes).
- Webhook Discord (si `Config.WebhookURL` défini).

## Remarques
- L’IA utilise les natives de conduite GTA ; ce n’est **pas un GPS parfait**. Le script réassigne périodiquement la tâche et freine si obstacle détecté (option collision_avoid).
- L’aperçu “carte” dans l’UI est **visuel** : la destination vient du **waypoint** du jeu.

## Support
- Config par `config.lua`
- Code : `client.lua`, `server.lua`, `html/`
- Documentation détaillée : voir `/docs/index.html`

Bonne route ✨
