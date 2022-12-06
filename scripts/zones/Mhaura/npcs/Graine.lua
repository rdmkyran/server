-----------------------------------
-- Area: Mhaura
--  NPC: Graine
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Mhaura/IDs")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.LEATHER_BANDANA,            457,
        xi.items.BRONZE_CAP,                 174,
        xi.items.BRASS_CAP,                 1700,
        xi.items.LEATHER_VEST,               698,
        xi.items.BRONZE_HARNESS,             235,
        xi.items.BRASS_HARNESS,             2286,
        xi.items.LEATHER_GLOVES,             374,
        xi.items.BRONZE_MITTENS,             128,
        xi.items.BRASS_MITTENS,             1255,
        xi.items.LEATHER_TROUSERS,           557,
        xi.items.BRONZE_SUBLIGAR,            191,
        xi.items.BRASS_SUBLIGAR,            1840,
        xi.items.LEATHER_HIGHBOOTS,          349,
        xi.items.BRONZE_LEGGINGS,            117,
        xi.items.BRASS_LEGGINGS,            1140,
    }

    player:showText(npc, ID.text.GRAINE_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
