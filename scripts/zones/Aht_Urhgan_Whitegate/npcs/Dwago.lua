-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Dwago
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Aht_Urhgan_Whitegate/IDs")
require("scripts/globals/items")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.LUGWORM,                    9,
        xi.items.LITTLE_WORM,                3,
        xi.items.PET_FOOD_ALPHA_BISCUIT,    11,
        xi.items.PET_FOOD_BETA_BISCUIT,     82,
        xi.items.JUG_OF_BUG_BROTH,          98
    }

    player:showText(npc, ID.text.DWAGO_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
