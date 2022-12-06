-----------------------------------
-- Area: Kazham
--  NPC: Nuh Celodehki
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Kazham/IDs")
require("scripts/globals/items")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.FISH_MITHKABOB,             993,
        xi.items.BLACKENED_FROG,            3133,
        xi.items.ROAST_MUSHROOM,             316,
        xi.items.EEL_KABOB,                 2700,
    }

    player:showText(npc, ID.text.NUHCELODENKI_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
