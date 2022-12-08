-----------------------------------
-- Area: Windurst Waters
--  NPC: Shohrun-Tuhrun
-- Standard Merchant NPC
-- Confirmed shop stock, August 2013
-----------------------------------
require("scripts/globals/shop")
require("scripts/globals/items")
local ID = require("scripts/zones/Windurst_Waters/IDs")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    player:showText(npc, ID.text.SHOHRUNTUHRUN_SHOP_DIALOG)

    local stock =
    {
        xi.items.SCROLL_OF_HASTE,           18000, 1,
        xi.items.SCROLL_OF_RAISE,            5178, 2,
        xi.items.SCROLL_OF_DIA_II,          10080, 2,
        xi.items.SCROLL_OF_BANISH_II,        8100, 2,
        xi.items.SCROLL_OF_PROTECT_II,       6366, 2,
        xi.items.SCROLL_OF_SHELL_II,        15840, 2,
        xi.items.SCROLL_OF_ENFIRE,           4644, 2,
        xi.items.SCROLL_OF_ENBLIZZARD,       3688, 2,
        xi.items.SCROLL_OF_ENAERO,           2250, 2,
        xi.items.SCROLL_OF_ENSTONE,          1827, 2,
        xi.items.SCROLL_OF_ENTHUNDER,        1363, 2,
        xi.items.SCROLL_OF_ENWATER,          6366, 2,
        xi.items.SCROLL_OF_CURE_III,         3261, 3,
        xi.items.SCROLL_OF_PROTECT_IV,      78200, 3,
        xi.items.SCROLL_OF_PROTECTRA_IV,    74520, 3,
        xi.items.SCROLL_OF_DISPEL,          64400, 3,
    }

    xi.shop.nation(player, stock, xi.nation.WINDURST)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
