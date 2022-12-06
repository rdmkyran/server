-----------------------------------
-- Area: Bastok Markets
--  NPC: Harmodios
-- Standard Merchant NPC
-- !pos -79.928 -4.824 -135.114 235
-----------------------------------
local ID = require("scripts/zones/Bastok_Markets/IDs")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.PICCOLO,                     990, 1,
        xi.items.CORNETTE,                    219, 2,
        xi.items.MAPLE_HARP,                   43, 2,
        xi.items.SCROLL_OF_VITAL_ETUDE,      69120, 2,
        xi.items.SCROLL_OF_SWIFT_ETUDE,      66240, 2,
        xi.items.SCROLL_OF_SAGE_ETUDE,       63360, 2,
        xi.items.SCROLL_OF_LOGICAL_ETUDE,    56700, 2,
        xi.items.SCROLL_OF_HERCULEAN_ETUDE,  79560, 2,
        xi.items.SCROLL_OF_UNCANNY_ETUDE,    76500, 2,
        xi.items.GEMSHORN,                   4644, 3,
        xi.items.FLUTE,                        43, 3,
        xi.items.SCROLL_OF_BEWITCHING_ETUDE,  54000, 3,
    }

    player:showText(npc, ID.text.HARMODIOS_SHOP_DIALOG)
    xi.shop.nation(player, stock, xi.nation.BASTOK)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
