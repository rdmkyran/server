-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Gavrie
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Aht_Urhgan_Whitegate/IDs")
require("scripts/globals/items")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.FLASK_OF_EYE_DROPS,         2595,
        xi.items.ANTIDOTE,                    316,
        xi.items.FLASK_OF_ECHO_DROPS,         800,
        xi.items.POTION,                      910,
        xi.items.ETHER,                      4832,
        xi.items.REMEDY,                     3360,
        xi.items.FLASK_OF_DISTILLED_WATER,     12,
        xi.items.CAN_OF_AUTOMATON_OIL,        50,
        xi.items.CAN_OF_AUTOMATON_OIL_P1,    250,
        xi.items.CAN_OF_AUTOMATON_OIL_P2,    500,
        xi.items.CAN_OF_AUTOMATON_OIL_P3,   1000
    }

    player:showText(npc, ID.text.GAVRIE_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
