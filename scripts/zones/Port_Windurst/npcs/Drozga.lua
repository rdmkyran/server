-----------------------------------
-- Area: Port Windurst
--  NPC: Drozga
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Port_Windurst/IDs")
require("scripts/globals/items")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.FACEGUARD,                 1493,
        xi.items.SCALE_MAIL,                2296,
        xi.items.SCALE_FINGER_GAUNTLETS,    1225,
        xi.items.SCALE_CUISSES,             1843,
        xi.items.SCALE_GREAVES,             1117,
        xi.items.LEATHER_BELT,               437,
        xi.items.SILVER_EARRING,            1287,
        xi.items.LEATHER_RING,              1287,
    }

    player:showText(npc, ID.text.DROZGA_SHOP_DIALOG)
    xi.shop.general(player, stock, xi.quest.fame_area.WINDURST)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
