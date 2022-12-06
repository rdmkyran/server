-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Miogique
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Southern_San_dOria/IDs")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.CHAINMAIL,                 14256, 1,
        xi.items.CHAIN_MITTENS,              7783, 1,
        xi.items.GAUNTLETS,                 23846, 1,
        xi.items.IRON_MASK,                  9439, 1,
        xi.items.STUDDED_BANDANA,           13179, 2,
        xi.items.STUDDED_GLOVES,            11012, 2,
        xi.items.STUDDED_VEST,              20976, 2,
        xi.items.BRASS_CAP,                  1504, 3,
        xi.items.BRASS_HARNESS,              2286, 3,
        xi.items.BRASS_MITTENS,              1255, 3,
        xi.items.BRONZE_CAP,                  154, 3,
        xi.items.BRONZE_HARNESS,              576, 3,
        xi.items.BRONZE_MITTENS,              128, 3,
        xi.items.LEATHER_BANDANA,             396, 3,
        xi.items.LEATHER_GLOVES,              331, 3,
        xi.items.LEATHER_VEST,                618, 3,
    }

    player:showText(npc, ID.text.RAIMBROYS_SHOP_DIALOG + 1)
    xi.shop.nation(player, stock, xi.nation.SANDORIA)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
