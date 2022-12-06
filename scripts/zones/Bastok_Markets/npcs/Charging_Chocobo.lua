-----------------------------------
-- Area: Bastok Markets
--  NPC: Charging Chocobo
-- Standard Merchant NPC
-- !pos -301.531 -10.319 -157.237 235
-----------------------------------
local ID = require("scripts/zones/Bastok_Markets/IDs")
require("scripts/globals/items")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.BRONZE_SUBLIGAR,             191, 3,
        xi.items.SCALE_CUISSES,              1646, 3,
        xi.items.BRASS_CUISSES,             14131, 2,
        xi.items.CUISSES,                   34776, 2,
        xi.items.BRONZE_LEGGINGS,             117, 3,
        xi.items.SCALE_GREAVES,               998, 3,
        xi.items.BRASS_GREAVES,              8419, 2,
        xi.items.PLATE_LEGGINGS,            21859, 2,
        xi.items.GORGET,                    16891, 2,
        xi.items.LEATHER_BELT,                382, 3,
        xi.items.SILVER_BELT,               10166, 3,
        xi.items.MYTHRIL_CUISSES,           58738, 1,
        xi.items.MYTHRIL_LEGGINGS,          36735, 1,
        xi.items.SWORDBELT,                 20037, 1,
    }

    player:showText(npc, ID.text.CHARGINGCHOCOBO_SHOP_DIALOG)
    xi.shop.nation(player, stock, xi.nation.BASTOK)
end

return entity
