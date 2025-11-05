# ducratif_playerid

Third-eye player identification (ox_target) for ESX Legacy + ox_lib + oxmysql.
Lets a player target another player via the 3ᵉ œil and:
- See their **Unique ID** (configurable field).
- **Copy** to clipboard.
- **Send to staff** via Discord **webhook** (optional).
- **Save to database** (optional).

## Requirements
- ESX Legacy
- [ox_lib] (ensure `@ox_lib/init.lua`)
- [ox_target]
- [oxmysql]

## Install
1. Drop the folder `ducratif_playerid` into your `resources/`.
2. Import SQL: `sql/ducratif_playerid.sql` into your database.
3. Configure `config.lua`:
   - `Config.UniqueIdSource`: one of `identifier`, `license`, `steam`, `discord`, `fivem`, `ip`, `serverid`.
   - Enable/disable webhook and DB.
   - Put your Discord webhook URL if used.
4. Add to your `server.cfg` **after** ox_lib, es_extended, ox_target, oxmysql:
   ```
   ensure ducratif_playerid
   ```

## Usage (in-game)
- Look at a player and use **ox_target** (third eye). Pick **"ID Unique"**.
- A small menu appears with actions (copy/webhook/DB) according to your config.

## Testing solo
- Set `Config.Debug.allowSelfTarget = true` (default) to allow targeting yourself.
- Or use the client command: `/idunique [serverId]` (press **F6** by default).

## Notes
- All server-side verifications recompute the ID to prevent spoofing.
- Webhook payload includes both requester and target info.
- Database saves basic info for later audit.
- Simple anti-spam is included (Config.RateLimitSeconds).
