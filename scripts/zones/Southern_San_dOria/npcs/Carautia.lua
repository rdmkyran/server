-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Carautia
-- Standard Merchant NPC
-- !pos 70 0 39 230
-----------------------------------
local ID = require("scripts/zones/Southern_San_dOria/IDs")
require("scripts/globals/items")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.CHAIN_HOSE,                11340, 1,
        xi.items.GREAVES,                    6966, 1,
        xi.items.KITE_SHIELD,               10281, 1,
        xi.items.MAHOGANY_SHIELD,            4482, 2,
        xi.items.STUDDED_TROUSERS,          16552, 2,
        xi.items.STUDDED_BOOTS,             10054, 2,
        xi.items.LAUAN_SHIELD,                110, 3,
        xi.items.MAPLE_SHIELD,                544, 3,
        xi.items.BRONZE_SUBLIGAR,             187, 3,
        xi.items.BRASS_SUBLIGAR,             1800, 3,
        xi.items.LEATHER_TROUSERS,            482, 3,
        xi.items.BRONZE_LEGGINGS,             115, 3,
        xi.items.BRASS_LEGGINGS,             1116, 3,
        xi.items.LEATHER_HIGHBOOTS,           302, 3,
    }

    player:showText(npc, ID.text.CARAUTIA_SHOP_DIALOG)
    xi.shop.nation(player, stock, xi.nation.SANDORIA)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
