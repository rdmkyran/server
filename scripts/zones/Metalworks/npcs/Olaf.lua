-----------------------------------
-- Area: Metalworks
--  NPC: Olaf
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Metalworks/IDs")
require("scripts/globals/items")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.ARQUEBUS,                  46836, 2,
        xi.items.BULLET,                       90, 3,
        xi.items.PINCH_OF_BOMB_ASH,             463, 3,
    }

    player:showText(npc, ID.text.OLAF_SHOP_DIALOG)
    xi.shop.nation(player, stock, xi.nation.BASTOK)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
