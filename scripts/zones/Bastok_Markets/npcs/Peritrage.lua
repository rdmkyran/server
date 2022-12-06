-----------------------------------
-- Area: Bastok Markets
--  NPC: Peritrage
-- Standard Merchant NPC
-- !pos -286.985 -10.319 -142.586 235
-----------------------------------
local ID = require("scripts/zones/Bastok_Markets/IDs")
require("scripts/globals/items")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.BATTLEAXE,                 11285, 1,
        xi.items.KUKRI,                      5713, 1,
        xi.items.BRONZE_AXE,                  290, 3,
        xi.items.BRASS_AXE,                  1435, 3,
        xi.items.BUTTERFLY_AXE,               618, 3,
        xi.items.GREATAXE,                   4186, 3,
        xi.items.BRONZE_KNIFE,                150, 3,
        xi.items.KNIFE,                      2231, 3,
        xi.items.BRONZE_DAGGER,               143, 3,
        xi.items.BRASS_DAGGER,                855, 3,
        xi.items.DAGGER,                     1867, 3,
    }

    player:showText(npc, ID.text.PERITRAGE_SHOP_DIALOG)
    xi.shop.nation(player, stock, xi.nation.BASTOK)
end

return entity
