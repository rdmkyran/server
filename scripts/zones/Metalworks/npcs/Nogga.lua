-----------------------------------
-- Area: Metalworks
--  NPC: Nogga
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
        xi.items.PINCH_OF_SOOT,               579, 1,
        xi.items.BOMB_ARM,                   675, 2,
        xi.items.GRENADE,                   1083, 3,
        xi.items.FLASQUE_OF_CATALYTIC_OIL,     92, 3,
    }

    player:showText(npc, ID.text.NOGGA_SHOP_DIALOG)
    xi.shop.nation(player, stock, xi.nation.BASTOK)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
