-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Capucine
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Southern_San_dOria/IDs")
require("scripts/globals/items")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.POETS_CIRCLET,             1904,
        xi.items.TUNIC,                     1288,
        xi.items.LINEN_ROBE,                2838,
        xi.items.MITTS,                      602,
        xi.items.LINEN_CUFFS,               1605,
        xi.items.SLACKS,                     860,
        xi.items.LINEN_SLOPS,               2318,
        xi.items.SOLEA,                      556,
        xi.items.HOLLY_CLOGS,               1495,
    }

    player:showText(npc, ID.text.CAPUCINE_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
