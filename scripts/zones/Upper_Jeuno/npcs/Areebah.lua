-----------------------------------
-- Area: Upper Jeuno
--  NPC: Areebah
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Upper_Jeuno/IDs")
require("scripts/globals/items")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.CHAMOMILE,                  119,
        xi.items.WIJNRUIT,                   110,
        xi.items.CARNATION,                   60,
        xi.items.RED_ROSE,                    80,
        xi.items.RAIN_LILY,                   96,
        xi.items.LILAC,                      120,
        xi.items.AMARYLLIS,                  120,
        xi.items.MARGUERITE,                 120,
        xi.items.BAG_OF_FLOWER_SEEDS,       520,
    }

    player:showText(npc, ID.text.MP_SHOP_DIALOG)
    xi.shop.general(player, stock, xi.quest.fame_area.JEUNO)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
