-----------------------------------
-- Area: Nashmau
--  NPC: Poporoon
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Nashmau/IDs")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.LEATHER_HIGHBOOTS,           336,
        xi.items.LIZARD_LEDELSENS,           3438,
        xi.items.STUDDED_BOOTS,             11172,
        xi.items.CUIR_HIGHBOOTS,            20532,
    }

    player:showText(npc, ID.text.POPOROON_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
