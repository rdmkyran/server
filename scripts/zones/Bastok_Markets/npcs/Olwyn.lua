-----------------------------------
-- Area: Bastok Markets
--  NPC: Olwyn
-- Standard Merchant NPC
-- !pos -322.123 -10.319 -169.418 235
-----------------------------------
require("scripts/globals/events/harvest_festivals")
local ID = require("scripts/zones/Bastok_Markets/IDs")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    onHalloweenTrade(player, trade, npc)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.ETHER,                     4445, 1,
        xi.items.FLASK_OF_ECHO_DROPS,        736, 2,
        xi.items.POTION,                     837, 2,
        xi.items.FLASK_OF_EYE_DROPS,        2387, 3,
        xi.items.ANTIDOTE,                   290, 3,
    }

    player:showText(npc, ID.text.OLWYN_SHOP_DIALOG)
    xi.shop.nation(player, stock, xi.nation.BASTOK)
end

return entity
