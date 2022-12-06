-----------------------------------
-- Area: Port Bastok
--  NPC: Galvin
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Port_Bastok/IDs")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.ETHER,                     4445, 1,
        xi.items.FLASK_OF_ECHO_DROPS,        736, 2,
        xi.items.POTION,                     837, 2,
        xi.items.WOODEN_ARROW,                3, 2,
        xi.items.FLASK_OF_EYE_DROPS,        2387, 3,
        xi.items.ANTIDOTE,                   290, 3,
        xi.items.IRON_ARROW,                  7, 3,
        xi.items.CROSSBOW_BOLT,               5, 3,
    }

    player:showText(npc, ID.text.GALVIN_SHOP_DIALOG)
    xi.shop.nation(player, stock, xi.nation.BASTOK)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
