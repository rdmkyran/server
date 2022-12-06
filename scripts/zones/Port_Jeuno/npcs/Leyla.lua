-----------------------------------
-- Area: Port Jeuno
--  NPC: Leyla
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
        xi.items.HAWKEYE,                    55,
        xi.items.IRON_ARROW,                  7,
        xi.items.CROSSBOW_BOLT,               5,
        xi.items.FLASK_OF_DISTILLED_WATER,    10,
        xi.items.SCROLL_OF_ENCHANTING_ETUDE, 1000,
        xi.items.SCROLL_OF_SPIRITED_ETUDE,  1265,
        xi.items.SCROLL_OF_LEARNED_ETUDE,   1567,
        xi.items.SCROLL_OF_QUICK_ETUDE,     1913,
        xi.items.SCROLL_OF_VIVACIOUS_ETUDE, 2208,
        xi.items.SCROLL_OF_DEXTROUS_ETUDE,  2815,
        xi.items.SCROLL_OF_SINEWY_ETUDE,    3146,
    }

    player:showText(npc, ID.text.DUTY_FREE_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
