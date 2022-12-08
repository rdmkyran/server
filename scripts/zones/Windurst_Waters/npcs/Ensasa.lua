-----------------------------------
-- Area: Windurst Waters
--  NPC: Ensasa
-- Standard Merchant NPC
-- Confirmed shop stock, August 2013
-----------------------------------
require("scripts/globals/events/harvest_festivals")
require("scripts/globals/items")
require("scripts/globals/shop")
local ID = require("scripts/zones/Windurst_Waters/IDs")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    onHalloweenTrade(player, trade, npc)
end

entity.onTrigger = function(player, npc)
    player:showText(npc, ID.text.ENSASA_SHOP_DIALOG)

    local stock =
    {
        xi.items.TARUTARU_FOLDING_SCREEN,     3881, 1,
        xi.items.CROSSBOW_BOLT,                5, 2,
        xi.items.WOODEN_ARROW,                 3, 2,
        xi.items.YELLOW_JAR,                   456, 2,
        xi.items.BONE_ARROW,                   4, 3,
        xi.items.EARTHEN_FLOWERPOT,            920, 3,
        xi.items.LITTLE_WORM,                  3, 3,
        xi.items.LUGWORM,                      9, 3,
        xi.items.BUNDLE_OF_RIVER_FOLIAGE,     576, 3,
        xi.items.SCROLL_OF_EARTH_THRENODY,    283, 3,
        xi.items.SCROLL_OF_FIRE_THRENODY,     644, 3,
        xi.items.BUNDLE_OF_SEA_FOLIAGE,       576, 3,
        xi.items.TARUTARU_STOOL,                905, 3,
        xi.items.WHITE_JAR,                   4744, 3,
    }

    xi.shop.nation(player, stock, xi.nation.WINDURST)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
