-----------------------------------
-- Area: Metalworks
--  NPC: Tomasa
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Metalworks/IDs")
require("scripts/globals/items")
require("scripts/globals/shop")
require("scripts/globals/pathfind")
-----------------------------------
local entity = {}

local pathNodes =
{
    { x = -13, y = -10, z = -19, rotation = 0, wait = 4000 },
    { z = -29, rotation = 0, wait = 4000 },
}

entity.onSpawn = function(npc)
    npc:initNpcAi()
    npc:setPos(xi.path.first(pathNodes))
    npc:pathThrough(pathNodes, xi.path.flag.PATROL)
end

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.SAUSAGE_ROLL,               257, 1,
        xi.items.HARD_BOILED_EGG,             73, 1,
        xi.items.BOWL_OF_EGG_SOUP,          3036, 1,
        xi.items.BOTTLE_OF_PINEAPPLE_JUICE,  368, 1,
        xi.items.BRETZEL,                     22, 2,
        xi.items.SAUSAGE,                    143, 2,
        xi.items.BOTTLE_OF_MELON_JUICE,     1012, 2,
        xi.items.LOAF_OF_IRON_BREAD,          92, 3,
        xi.items.BAKED_POPOTO,               294, 3,
        xi.items.BOWL_OF_PEBBLE_SOUP,        184, 3,
        xi.items.FLASK_OF_DISTILLED_WATER,    10, 3,
    }

    player:showText(npc, ID.text.TOMASA_SHOP_DIALOG)
    xi.shop.nation(player, stock, xi.nation.BASTOK)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
