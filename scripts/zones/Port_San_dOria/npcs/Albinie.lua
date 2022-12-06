-----------------------------------
-- Area: Port San d'Oria
--  NPC: Albinie
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Port_San_dOria/IDs")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.OAK_LOG,                   5688, 1,
        xi.items.CHUNK_OF_MYTHRIL_ORE,      1800, 1,
        xi.items.FLAX_FLOWER,                225, 1,
        xi.items.CHESTNUT_LOG,              2543, 2,
        xi.items.CHUNK_OF_COPPER_ORE,         10, 2,
        xi.items.CHUNK_OF_IRON_ORE,          810, 2,
        xi.items.CLUMP_OF_MOKO_GRASS,         18, 2,
        xi.items.BIRD_EGG,                   50, 2,
        xi.items.ASH_LOG,                     86, 3,
        xi.items.PILE_OF_CHOCOBO_BEDDING,     1800, 3,
    }

    player:showText(npc, ID.text.ALBINIE_SHOP_DIALOG)
    if player:hasKeyItem(xi.ki.AIRSHIP_PASS) then
        xi.shop.nation(player, stock, xi.nation.SANDORIA)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
