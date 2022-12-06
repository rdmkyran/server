-----------------------------------
-- Area: Selbina
--  NPC: Falgima
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Selbina/IDs")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.SCROLL_OF_INVISIBLE,        5351,
        xi.items.SCROLL_OF_SNEAK,            2325,
        xi.items.SCROLL_OF_DEODORIZE,        1204,
        xi.items.SCROLL_OF_FLURRY,          30360,
    }

    player:showText(npc, ID.text.FALGIMA_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
