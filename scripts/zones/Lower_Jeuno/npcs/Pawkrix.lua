-----------------------------------
-- Area: Lower Jeuno
--  NPC: Pawkrix
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Lower_Jeuno/IDs")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.BAG_OF_HORO_FLOUR,            36,
        xi.items.LOAF_OF_GOBLIN_BREAD,       276,
        xi.items.GOBLIN_PIE,                 650,
        xi.items.CHUNK_OF_GOBLIN_CHOCOLATE,   35,
        xi.items.GOBLIN_MUSHPOT,            1140,
        xi.items.BAG_OF_POISON_FLOUR,         515,
        xi.items.GOBLIN_DOLL,                490,
    }

    player:showText(npc, ID.text.PAWKRIX_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
