-----------------------------------
-- Area: Port Bastok
--  NPC: Melloa
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Port_Bastok/IDs")
require("scripts/globals/items")
require("scripts/globals/shop")
require("scripts/globals/pathfind")
-----------------------------------
local entity = {}

local pathNodes =
{
    { x = -161.608, y = -7.480, z = -0.832 },
    { x = -161.454, z = -0.954, wait = 2000 },
    { x = -161.449, z = -0.919, wait = 5000 },
    { x = -161.454, z = -0.954 },
    { x = -161.716, z = -0.927 },
    { x = -162.779, z = -0.820 },
    { x = -163.727, z = -0.455 },
    { x = -168.236, z = 4.670, wait = 2000 },
    { x = -168.211, z = 4.695, wait = 5000 },
    { x = -163.727, z = -0.455 },
    { x = -162.779, z = -0.820 },
    { x = -161.716, z = -0.927 },
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
        xi.items.LOAF_OF_PUMPERNICKEL,       147, 1,
        xi.items.BOWL_OF_EGG_SOUP,          3036, 1,
        xi.items.BOTTLE_OF_PINEAPPLE_JUICE,  368, 1,
        xi.items.BRETZEL,                     22, 2,
        xi.items.SAUSAGE,                    143, 2,
        xi.items.BOTTLE_OF_MELON_JUICE,     1012, 2,
        xi.items.SLICE_OF_ROAST_MUTTON,      662, 2,
        xi.items.LOAF_OF_IRON_BREAD,          92, 3,
        xi.items.BAKED_POPOTO,               294, 3,
        xi.items.BOWL_OF_PEBBLE_SOUP,        184, 3,
        xi.items.FLASK_OF_DISTILLED_WATER,    10, 3,
    }

    player:showText(npc, ID.text.MELLOA_SHOP_DIALOG)
    xi.shop.nation(player, stock, xi.nation.BASTOK)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
