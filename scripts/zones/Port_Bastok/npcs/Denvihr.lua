-----------------------------------
-- Area: Port Bastok
--  NPC: Denvihr
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Port_Bastok/IDs")
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
        xi.items.ASH_LOG,                     86, 2,
        xi.items.CHESTNUT_LOG,              2543, 2,
        xi.items.CHUNK_OF_IRON_ORE,          810, 2,
        xi.items.CLUMP_OF_MOKO_GRASS,         18, 2,
        xi.items.BIRD_EGG,                   50, 2,
        xi.items.CHUNK_OF_COPPER_ORE,         10, 3,
        xi.items.SET_OF_KAISERIN_COSMETICS, 1800, 3,
    }

    player:showText(npc, ID.text.DENVIHR_SHOP_DIALOG)
    if player:hasKeyItem(xi.ki.AIRSHIP_PASS) then
        xi.shop.nation(player, stock, xi.nation.BASTOK)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
