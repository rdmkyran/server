-----------------------------------
-- Area: Windurst Waters
--  NPC: Taajiji
-- Standard Merchant NPC
-- Confirmed shop stock, August 2013
-----------------------------------
require("scripts/globals/shop")
require("scripts/globals/items")
local ID = require("scripts/zones/Windurst_Waters/IDs")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    player:showText(npc, ID.text.TAAJIJI_SHOP_DIALOG)

    local stock =
    {
        xi.items.DHALMEL_PIE,                 756, 1,
        xi.items.PLATE_OF_MUSHROOM_RISOTTO,  5050, 1,
        xi.items.SERVING_OF_SHALLOPS_TROPICALE, 12762, 1,
        xi.items.ORANGE_KUCHEN,               984, 1,
        xi.items.MUTTON_TORTILLA,            5216, 2,
        xi.items.BOWL_OF_WHITEFISH_STEW,     6064, 2,
        xi.items.SERVING_OF_BEAUGREEN_SAUTE,  1669, 2,
        xi.items.BOTTLE_OF_ORANGE_JUICE,      184, 2,
        xi.items.DHALMEL_STEAK,              1324, 2,
        xi.items.TORTILLA,                    128, 3,
        xi.items.BOWL_OF_PULS,                552, 3,
        xi.items.BOWL_OF_DHALMEL_STEW,       2387, 3,
        xi.items.FLASK_OF_DISTILLED_WATER,     10, 3,
        xi.items.CUP_OF_WINDURSTIAN_TEA,      184, 3,
        xi.items.WINDURST_SALAD,             1711, 3,
    }

    xi.shop.nation(player, stock, xi.nation.WINDURST)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
