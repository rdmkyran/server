-----------------------------------
-- Area: Port Windurst
--  NPC: Uli Pehkowa
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
        xi.items.CHUNK_OF_MYTHRIL_ORE,      1840, 1,
        xi.items.FLAX_FLOWER,                230, 1,
        xi.items.OAK_LOG,                   5814, 1,
        xi.items.ASH_LOG,                     87, 2,
        xi.items.CHESTNUT_LOG,              2599, 2,
        xi.items.CHUNK_OF_COPPER_ORE,         11, 2,
        xi.items.CHUNK_OF_IRON_ORE,          828, 2,
        xi.items.BIRD_EGG,                   51, 2,
        xi.items.CLUMP_OF_MOKO_GRASS,         18, 3,
        xi.items.MY_FIRST_MAGIC_KIT,        1840, 3,
    }

    player:showText(npc, ID.text.ULIPEHKOWA_SHOP_DIALOG)
    if player:hasKeyItem(xi.ki.AIRSHIP_PASS) then
        xi.shop.nation(player, stock, xi.nation.WINDURST)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
