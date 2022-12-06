-----------------------------------
-- Area: Upper Jeuno
--  NPC: Champalpieu
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Upper_Jeuno/IDs")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.ROLANBERRY,                120,
        xi.items.IRON_ARROW,                 7,
        xi.items.CROSSBOW_BOLT,              5,
        xi.items.PICKAXE,                    180,
        xi.items.SCROLL_OF_WIND_THRENODY,   567,
        xi.items.SCROLL_OF_WATER_THRENODY,  420,
    }

    player:showText(npc, ID.text.MP_SHOP_DIALOG)
    xi.shop.general(player, stock, xi.quest.fame_area.JEUNO)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
