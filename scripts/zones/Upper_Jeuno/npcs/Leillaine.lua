-----------------------------------
-- Area: Upper Jeuno
--  NPC: Leillaine
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Upper_Jeuno/IDs")
require("scripts/globals/items")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.FLASK_OF_DISTILLED_WATER,     10,
        xi.items.FLASK_OF_EYE_DROPS,         2387,
        xi.items.ANTIDOTE,                    290,
        xi.items.FLASK_OF_ECHO_DROPS,         736,
        xi.items.POTION,                      837,
        xi.items.ETHER,                      4445,
        xi.items.REMEDY,                    22400,
    }

    player:showText(npc, ID.text.LEILLAINE_SHOP_DIALOG)
    xi.shop.general(player, stock, xi.quest.fame_area.JEUNO)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
