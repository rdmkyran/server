-----------------------------------
-- Area: Port San d'Oria
--  NPC: Coullave
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Port_San_dOria/IDs")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.ETHER,                      4445, 1,
        xi.items.GRENADE,                   1107, 1,
        xi.items.POTION,                      837, 1,
        xi.items.BAMBOO_STICK,                  96, 2,
        xi.items.FLASK_OF_ECHO_DROPS,         736, 2,
        xi.items.HACHIMAKI,                  552, 2,
        xi.items.KENPOGI,                    833, 2,
        xi.items.KYAHAN,                     424, 2,
        xi.items.SILVER_EARRING,            1125, 2,
        xi.items.SITABAKI,                   666, 2,
        xi.items.TEKKO,                      458, 2,
        xi.items.ANTIDOTE,                    290, 3,
        xi.items.FLASK_OF_EYE_DROPS,         2387, 3,
        xi.items.LEATHER_RING,              1150, 3,
    }

    player:showText(npc, ID.text.COULLAVE_SHOP_DIALOG)
    xi.shop.nation(player, stock, xi.nation.SANDORIA)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
