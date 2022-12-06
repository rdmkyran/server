-----------------------------------
-- Area: Southern SandOria [S]
--  NPC: Geltpix
-- !pos 154 -2 103 80
-----------------------------------
local ID = require("scripts/zones/Southern_San_dOria_[S]/IDs")
require("scripts/globals/items")
require("scripts/globals/shop")
-----------------------------------

local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.HI_POTION,                 4500,
        xi.items.HI_ETHER,                  28000,
        xi.items.HATCHET,                   500,
        xi.items.ASPHODEL,                  100,
    }

    player:showText(npc, ID.text.DONT_HURT_GELTPIX)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
