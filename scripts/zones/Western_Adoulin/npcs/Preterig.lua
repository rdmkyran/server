-----------------------------------
-- Area: Western Adoulin
--  NPC: Preterig
-- Type: Shop NPC
-- !pos 6 0 -53 256
-----------------------------------
require("scripts/globals/shop")
require("scripts/globals/items")
local ID = require("scripts/zones/Western_Adoulin/IDs")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    -- Standard shop
    player:showText(npc, ID.text.PRETERIG_SHOP_TEXT)
    local stock =
    {
        xi.items.BOTTLE_OF_APPLE_JUICE,     300,
        xi.items.BOTTLE_OF_FRONTIER_SODA,   125,
        xi.items.MELON_PIE,                 1560,
        xi.items.BOTTLE_OF_ORANGE_JUICE,    200,
    }
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
