# ducratif_atmrob
Braquage d'ATM pour ESX Legacy + ox_lib + ox_inventory + ox_target

## Dépendances
- ESX Legacy
- ox_lib
- ox_inventory
- oxmysql
- ox_target

## Installation
1. Placez le dossier `ducratif_atmrob` dans votre répertoire `resources/`.
2. Importez `sql/atm_robbery.sql` dans votre base de données.
3. Assurez-vous d'avoir l'item requis (par défaut `atm_kit`) déclaré dans votre `items` d'ox_inventory:
```
['atm_kit'] = {
    label = 'Kit de braquage ATM',
    weight = 500,       -- ajuste selon ton équilibrage
    stack = true,
    close = true,
    description = "Outils pour forcer l'accès d'un ATM."
},
```
4. Ajoutez au `server.cfg`:
   ```
   ensure oxmysql
   ensure ox_lib
   ensure ox_inventory
   ensure ox_target
   ensure ducratif_atmrob
   ```
5. Modifiez `config.lua` selon vos besoins (rang requis, item, durée, récompense, cooldown, animations, etc.).

## Utilisation
- Approchez-vous d'un ATM et utilisez le 3e œil (ox_target) -> **Braquer l'ATM**.
- Si les conditions sont remplies, une animation puis une progressbar se lancent.
- Ensuite, un mini-jeu de **liaison de câbles** s'ouvre (aléatoire à chaque fois).  
  - **Succès**: vous recevez l'argent sale configuré (par défaut 5000$).  
  - **Échec**: l'ATM est **verrouillé** pendant `Config.FailCooldownMinutes` (par défaut 10 minutes).
- Toutes les actions sont **loggées** en base (`atm_robbery_logs`).

## Notes
- Le rang est lu dans `users.rp_rank`. Par défaut, `Config.MinRank = 10` et `Config.RequireRank = true`.
- Si `Config.RequireItem = true`, le script vérifie la possession de l'item et le **consomme** en cas de réussite si `Config.ConsumeItem = true`.
- Les modèles d'ATM sont configurables dans `config.lua` (prop_atm_01, prop_atm_02, prop_atm_03, prop_fleeca_atm).
- Le mini-jeu est en NUI (HTML/CSS/JS) et ne nécessite pas de dépendance supplémentaire.
