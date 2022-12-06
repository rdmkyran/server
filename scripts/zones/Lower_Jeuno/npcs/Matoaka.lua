-----------------------------------
-- Area: Lower Jeuno
--  NPC: Matoaka
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Lower_Jeuno/IDs")
require("scripts/globals/items")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.SILVER_EARRING,            1250,
        xi.items.SILVER_RING,               1250,
        xi.items.MYTHRIL_EARRING,           4140,
    }

    player:showText(npc, ID.text.GEMS_BY_KSHAMA_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
