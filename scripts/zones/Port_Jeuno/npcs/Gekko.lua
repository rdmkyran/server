-----------------------------------
-- Area: Port Jeuno
--  NPC: Gekko
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Port_Jeuno/IDs")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.FLASK_OF_EYE_DROPS,         2387,
        xi.items.ANTIDOTE,                    290,
        xi.items.FLASK_OF_ECHO_DROPS,         736,
        xi.items.POTION,                      837,
        xi.items.ETHER,                      4445,
        xi.items.ROLANBERRY,                  120,
        xi.items.COPY_OF_AUTUMNS_END_IN_GUSTABERG,  36000,
        xi.items.COPY_OF_ACOLYTES_GRIEF,     31224,
        xi.items.SCROLL_OF_REGEN_IV,        50400,
    }

    player:showText(npc, ID.text.DUTY_FREE_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
