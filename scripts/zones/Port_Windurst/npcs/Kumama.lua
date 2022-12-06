-----------------------------------
-- Area: Port Windurst
--  NPC: Kumama
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Port_Windurst/IDs")
require("scripts/globals/items")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.COTTON_BRAIS,              9936, 2,
        xi.items.COTTON_GAITERS,            6633, 2,
        xi.items.BRAIS,                     1899, 3,
        xi.items.SLOPS,                      172, 3,
        xi.items.LEATHER_TROUSERS,           482, 3,
        xi.items.SLACKS,                     860, 3,
        xi.items.LINEN_SLOPS,               2268, 3,
        xi.items.GAITERS,                   1269, 3,
        xi.items.ASH_CLOGS,                  111, 3,
        xi.items.LEATHER_HIGHBOOTS,          309, 3,
        xi.items.SOLEA,                      544, 3,
        xi.items.HOLLY_CLOGS,               1462, 3,
        xi.items.LAUAN_SHIELD,               110, 3,
        xi.items.MAPLE_SHIELD,               556, 3,
    }

    player:showText(npc, ID.text.KUMAMA_SHOP_DIALOG)
    xi.shop.nation(player, stock, xi.nation.WINDURST)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
