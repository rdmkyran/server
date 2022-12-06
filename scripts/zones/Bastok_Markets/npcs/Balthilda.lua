-----------------------------------
-- Area: Bastok Markets
--  NPC: Balthilda
-- Type: Merchant
-- !pos -300 -10 -161 235
-----------------------------------
local ID = require("scripts/zones/Bastok_Markets/IDs")
require("scripts/globals/items")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.POETS_CIRCLET,             1904, 3,
        xi.items.TUNIC,                     1288, 3,
        xi.items.LINEN_ROBE,                2838, 3,
        xi.items.MITTS,                      602, 3,
        xi.items.LINEN_CUFFS,               1605, 3,
        xi.items.SLACKS,                     860, 3,
        xi.items.LINEN_SLOPS,               2318, 3,
        xi.items.SOLEA,                      556, 3,
        xi.items.HOLLY_CLOGS,               1495, 3,
        xi.items.LEATHER_RING,              1150, 3,
    }

    player:showText(npc, ID.text.BALTHILDA_SHOP_DIALOG)
    xi.shop.nation(player, stock, xi.nation.BASTOK)
end

return entity
