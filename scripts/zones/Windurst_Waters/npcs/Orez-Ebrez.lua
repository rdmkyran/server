-----------------------------------
-- Area: Windurst Waters
--  NPC: Orez-Ebrez
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
    player:showText(npc, ID.text.OREZEBREZ_SHOP_DIALOG)

    local stock =
    {
        xi.items.RED_CAP,                   20000, 1,
        xi.items.SOIL_HACHIMAKI,             8972, 1,
        xi.items.BEETLE_MASK,                7026, 1,
        xi.items.CIRCLET,                     144, 2,
        xi.items.COTTON_HEADGEAR,            8024, 2,
        xi.items.LEATHER_BANDANA,             396, 2,
        xi.items.POETS_CIRCLET,              1863, 2,
        xi.items.FLAX_HEADBAND,             14400, 2,
        xi.items.COTTON_HACHIMAKI,           3272, 2,
        xi.items.WOOL_HAT,                  10924, 2,
        xi.items.HEADGEAR,                   1742, 3,
        xi.items.HACHIMAKI,                   552, 3,
        xi.items.COTTON_HEADBAND,            1800, 3,
        xi.items.BRONZE_CAP,                  151, 3,
        xi.items.BRASS_CAP,                  1471, 3,
        xi.items.WINDSHEAR_HAT,               690, 3,
    }

    xi.shop.nation(player, stock, xi.nation.WINDURST)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
