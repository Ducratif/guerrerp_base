T# ESX Clothing Items Script

## Overview
This script allows you to dynamically handle multiple clothing items in an ESX-based FiveM server. Players can equip different wearable items such as rings, necklaces, gowns, and casts by triggering corresponding events. The design is scalable and makes it easy for server administrators to add new wearable items through simple configuration.

---

## Features
- **Dynamic Clothing Management:** Automatically handles clothing types defined in the configuration.
- **Gender-Specific Clothing:** Applies different clothing options for male and female characters.
- **Animation Support:** Includes realistic animations when equipping clothing items.
- **Easy Configuration:** Simply define new clothing items without modifying core logic.

---

## Installation
1. **Download the script:** Place the script in your server's `resources` folder.
2. **Add to server configuration:** Ensure the script is started in your server configuration (`server.cfg`):
    ```bash
    ensure clothesitems
    ```
3. **Configuration:** Modify the `Config` table to add or customize clothing items.

---

## Configuration Guide
The configuration (`Config`) table defines all available clothing items.
Here is an example structure:

```lua
Config = {
    Rings = { 
        Male = { chain_1 = 7, chain_2 = 0 },
        Female = { decals_1 = 52, decals_2 = 1 }
    },

    Necklace = { 
        Male = { chain_1 = 129, chain_2 = 4 },
        Female = { chain_1 = 4, chain_2 = 4 }
    },

    -- Add more items as needed
}
```
- **Keys:** The keys (`Rings`, `Necklace`, etc.) represent the item categories.
- **Male/Female:** Separate configurations for male and female characters.
- **Properties:** Define clothing properties such as `chain_1`, `torso_1`, etc.

To add a new item category, simply follow this format:
```lua
Config.RedTop = {
    Male = { torso_1 = 10, torso_2 = 1 },
    Female = { torso_1 = 15, torso_2 = 3 }
}

torso_1: Represents the item, torso_2: Represents the colours.
```

---

## Usage
1. **Triggering Events:** Players can equip items by triggering events. Example:
   ```lua
   TriggerEvent('clothesitems:ring1')
   ```
   Replace `ring1` with the desired item key.

2. **Event Structure:** The event name is `clothesitems:<lowercase_item_name>`. For example, for `Rings`, use:
   ```lua
   TriggerEvent('clothesitems:rings')

   This gets put where your triggerning items would be or "usable items" lua. For example: quasar inventory - You must add the item first in shared > items. Then trigger the event in server > custom > misc > CreateUsableItem file. 
   ```

3. **Important Configuration:** You need to create the item with your own inventory resource AND trigger the event through the inventory and make sure it corresponds with the config. Example for quasar inventory and ox inventory:
   Ox:

   In data>items

   	['ring'] = {
		label = 'Clothing',
        weight = 500,
        stack = false, 
		consume = 0,
	},

   QS:

   In shared>items

    ["ring"] 				 = {
        ["name"] = "ring", 			        
        ["label"] = "Diamond Ring", 			
        ["weight"] = 2, 		
        ["type"] = "item", 		
        ["image"] = "diamond_ring.png", 		    
        ["unique"] = true, 	
        ["useable"] = true, 	
        ["shouldClose"] = true,    
        ["combinable"] = nil,   
        ["description"] = "Expensive."
    },

    In server > custom > misc > CreateUsableItem

    CreateUsableItem('ring', function(source, item)
        local source = source
        local xPlayer = ESX.GetPlayerFromId(source)
        xPlayer.removeInventoryItem("ring", 1)
        TriggerClientEvent('clothesitems:ring1', source, item, 'ring')
    end)

   ```

---

## Development Notes
- **Animation Handling:** The `DoRequestAnimSet` function handles animation requests when players equip clothing.
- **Skin Saving:** The script ensures that changes are saved to the player's skin using the `esx_skin:save` server event.
- **Dynamic Registration:** Events are automatically registered for all configured items.

---

## Example Events
Here are some example events for configured clothing:
- `clothesitems:rings`
- `clothesitems:necklace`
- `clothesitems:neckbrace`
- `clothesitems:gown`

You can add as many as you like as long as you name the item the same in the other files. Better to keep everything named the same to not confuse yourself. Simply trigger these events in-game to equip the respective clothing item.
