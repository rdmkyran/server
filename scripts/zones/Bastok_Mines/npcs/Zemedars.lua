-----------------------------------
-- Area: Bastok Mines
--  NPC: Zemedars
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Bastok_Mines/IDs")
require("scripts/globals/items")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.IRON_SUBLIGAR,             23316, 1,
        xi.items.LIZARD_TROUSERS,            5003, 1,
        xi.items.LEGGINGS,                  14484, 1,
        xi.items.LIZARD_LEDELSENS,           3162, 1,
        xi.items.BUCKLER,                   31544, 1,
        xi.items.BRASS_SUBLIGAR,             1840, 2,
        xi.items.LEATHER_TROUSERS,            493, 2,
        xi.items.BRASS_LEGGINGS,             1140, 2,
        xi.items.LEATHER_HIGHBOOTS,           309, 2,
        xi.items.TARGE,                     11076, 2,
        xi.items.BRONZE_SUBLIGAR,             191, 3,
        xi.items.CHAIN_HOSE,                11592, 3,
        xi.items.BRONZE_LEGGINGS,             117, 3,
        xi.items.GREAVES,                    7120, 3,
        -- xi.items.MAPLE_SHIELD,                556, 3,
        xi.items.LAUAN_SHIELD,                110, 3,
    }

    player:showText(npc, ID.text.ZEMEDARS_SHOP_DIALOG)
    xi.shop.nation(player, stock, xi.nation.BASTOK)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
