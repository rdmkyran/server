-----------------------------------
-- Area: Port Windurst
--  NPC: Ryan
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Port_Windurst/IDs")
require("scripts/globals/items")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.BRONZE_AXE,                 290,
        xi.items.BRONZE_SWORD,               246,
        xi.items.CROSSBOW_BOLT,                5,
        xi.items.BRONZE_HARNESS,             235,
        xi.items.BRASS_HARNESS,             2286,
        xi.items.BRONZE_MITTENS,             128,
        xi.items.BRASS_MITTENS,             1255,
        xi.items.BRONZE_SUBLIGAR,            191,
        xi.items.BRASS_SUBLIGAR,            1840,
        xi.items.BRONZE_LEGGINGS,            117,
        xi.items.BRASS_LEGGINGS,            1140,
        xi.items.KENPOGI,                   1145,
        xi.items.TEKKO,                      630,
        xi.items.SITABAKI,                   915,
        xi.items.KYAHAN,                     584,
    }

    player:showText(npc, ID.text.RYAN_SHOP_DIALOG)
    xi.shop.general(player, stock, xi.quest.fame_area.WINDURST)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
