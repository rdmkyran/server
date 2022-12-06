-----------------------------------
-- Area: Port Windurst
--  NPC: Guruna-Maguruna
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Port_Windurst/IDs")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.COTTON_DOUBLET,            12355, 2,
        xi.items.COTTON_GLOVES,              6696, 2,
        xi.items.HEMP_GORGET,                 972, 3,
        xi.items.DOUBLET,                    2470, 3,
        xi.items.ROBE,                        216, 3,
        xi.items.LEATHER_VEST,                604, 3,
        xi.items.TUNIC,                      1260, 3,
        xi.items.LINEN_ROBE,                 2776, 3,
        xi.items.GLOVES,                     1363, 3,
        xi.items.CUFFS,                       118, 3,
        xi.items.LEATHER_GLOVES,              324, 3,
        xi.items.MITTS,                       589, 3,
        xi.items.LINEN_CUFFS,                1570, 3,
    }

    player:showText(npc, ID.text.GURUNAMAGURUNA_SHOP_DIALOG)
    xi.shop.nation(player, stock, xi.nation.WINDURST)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
