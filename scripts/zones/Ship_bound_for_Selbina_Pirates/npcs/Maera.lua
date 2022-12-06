-----------------------------------
-- Area: Ship bound for Selbina Pirates
--  NPC: Maera
-- Type: Standard Merchant NPC
-- !pos -1.139 -2.101 -9.000 220
-----------------------------------
local ID = require("scripts/zones/Ship_bound_for_Selbina_Pirates/IDs")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.POTION,                     910,
        xi.items.ETHER,                     4832,
        xi.items.ANTIDOTE,                   316,
        xi.items.FLASK_OF_EYE_DROPS,        2595,
        xi.items.FLASK_OF_ECHO_DROPS,        800,
    }

    player:showText(npc, ID.text.MAERA_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
