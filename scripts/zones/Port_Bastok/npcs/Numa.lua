-----------------------------------
-- Area: Port Bastok
--  NPC: Numa
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Port_Bastok/IDs")
require("scripts/globals/items")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.COTTON_HACHIMAKI,          5079, 1,
        xi.items.COTTON_DOGI,               7654, 1,
        xi.items.COTTON_TEKKO,              4212, 1,
        xi.items.COTTON_SITABAKI,           6133, 1,
        xi.items.COTTON_KYAHAN,             3924, 1,
        xi.items.SILVER_OBI,                3825, 1,
        xi.items.HACHIMAKI,                  759, 2,
        xi.items.KENPOGI,                   1145, 2,
        xi.items.TEKKO,                      630, 2,
        xi.items.SITABAKI,                   915, 2,
        xi.items.KYAHAN,                     584, 2,
        xi.items.BAMBOO_STICK,                 132, 2,
        xi.items.PICKAXE,                      180, 3,
        xi.items.TOOLBAG_(INOSHISHINOFUDA,  13500, 3,
        xi.items.TOOLBAG_(SHIKANOFUDA,      18000, 3,
        xi.items.TOOLBAG_(CHONOFUDA,        18000, 3,
    }

    player:showText(npc, ID.text.NUMA_SHOP_DIALOG)
    xi.shop.nation(player, stock, xi.nation.BASTOK)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
