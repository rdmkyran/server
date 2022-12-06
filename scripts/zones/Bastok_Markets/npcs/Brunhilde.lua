-----------------------------------
-- Area: Bastok Markets
--  NPC: Brunhilde
-- Standard Merchant NPC
-- !pos -305.775 -10.319 -152.173 235
-----------------------------------
local ID = require("scripts/zones/Bastok_Markets/IDs")
require("scripts/globals/items")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.BRONZE_CAP,                  154, 3,
        xi.items.FACEGUARD,                  1334, 3,
        xi.items.BRASS_MASK,                11776, 2,
        xi.items.SALLET,                    29311, 2,
        xi.items.BRONZE_HARNESS,              235, 3,
        xi.items.SCALE_MAIL,                 2051, 3,
        xi.items.BRASS_SCALE_MAIL,          17928, 2,
        xi.items.BRONZE_MITTENS,              128, 3,
        xi.items.SCALE_FINGER_GAUNTLETS,     1094, 3,
        xi.items.BRASS_FINGER_GAUNTLETS,     9479, 2,
        xi.items.MYTHRIL_SALLET,            52289, 1,
        xi.items.BREASTPLATE,               45208, 1,
        xi.items.GAUNTLETS,                 23846, 1,
    }

    player:showText(npc, ID.text.BRUNHILDE_SHOP_DIALOG)
    xi.shop.nation(player, stock, xi.nation.BASTOK)
end

return entity
