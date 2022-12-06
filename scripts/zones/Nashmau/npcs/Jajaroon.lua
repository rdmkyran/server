-----------------------------------
-- Area: Nashmau
--  NPC: Jajaroon
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Nashmau/IDs")
require("scripts/globals/items")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.FIRE_CARD,                    48,
        xi.items.ICE_CARD,                     48,
        xi.items.WIND_CARD,                    48,
        xi.items.EARTH_CARD,                   48,
        xi.items.THUNDER_CARD,                 48,
        xi.items.WATER_CARD,                   48,
        xi.items.LIGHT_CARD,                   48,
        xi.items.DARK_CARD,                    48,
        xi.items.TRUMP_CARD_CASE,           10000,
        xi.items.SAMURAI_DIE,               35200,
        xi.items.NINJA_DIE,                   600,
        xi.items.DRAGOON_DIE,                9216,
        xi.items.SUMMONER_DIE,              40000,
        xi.items.BLUE_MAGE_DIE,              3525,
        xi.items.CORSAIR_DIE,                 316,
        xi.items.PUPPETMASTER_DIE,          82500
    }

    player:showText(npc, ID.text.JAJAROON_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
