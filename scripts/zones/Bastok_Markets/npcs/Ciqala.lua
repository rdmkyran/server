-----------------------------------
-- Area: Bastok Markets
--  NPC: Ciqala
-- Type: Merchant
-- !pos -283.147 -11.319 -143.680 235
-----------------------------------
local ID = require("scripts/zones/Bastok_Markets/IDs")
require("scripts/globals/items")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.METAL_KNUCKLES,            4818, 1,
        xi.items.WARHAMMER,                 6033, 1,
        xi.items.BRONZE_KNUCKLES,            224, 3,
        xi.items.BRASS_KNUCKLES,             828, 3,
        xi.items.CESTI,                      129, 3,
        xi.items.BRASS_BAGHNAKHS,           1521, 3,
        xi.items.CAT_BAGHNAKHS,              104, 3,
        xi.items.BRONZE_HAMMER,              312, 3,
        xi.items.BRASS_HAMMER,              2083, 3,
        xi.items.MAPLE_WAND,                  47, 3,
        xi.items.ASH_CLUB,                    66, 3,
        xi.items.BRONZE_ROD,                  90, 3,
        xi.items.BRASS_ROD,                  621, 3,
        xi.items.ASH_STAFF,                   57, 3,
        xi.items.ASH_POLE,                   386, 3,
    }

    player:showText(npc, ID.text.CIQALA_SHOP_DIALOG)
    xi.shop.nation(player, stock, xi.nation.BASTOK)
end

return entity
