-----------------------------------
-- Area: Windurst Woods
--  NPC: Wije Tiren
-- Standard Merchant NPC
-- Confirmed shop stock, August 2013
-----------------------------------
local ID = require("scripts/zones/Windurst_Woods/IDs")
require("scripts/globals/items")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    player:showText(npc, ID.text.WIJETIREN_SHOP_DIALOG)

    local stock =
    {
        xi.items.ANTIDOTE,                        290,
        xi.items.FLASK_OF_DISTILLED_WATER,         10,
        xi.items.FLASK_OF_ECHO_DROPS,             728,
        xi.items.ETHER,                          4445,
        xi.items.FLASK_OF_EYE_DROPS,             2387,
        xi.items.POTION,                          837,
        xi.items.SCROLL_OF_HERB_PASTORAL,          98,
        xi.items.FEDERATION_WAYSTONE,            9200
    }
    xi.shop.general(player, stock, xi.quest.fame_area.WINDURST)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
