-----------------------------------
-- Area: Port Windurst
--  NPC: Kususu
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Port_Windurst/IDs")
require("scripts/globals/items")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.SCROLL_OF_DIAGA,           1165, 1,
        xi.items.SCROLL_OF_STONESKIN,       7025, 1,
        xi.items.SCROLL_OF_SLOW,             837, 1,
        xi.items.SCROLL_OF_CURE_II,          585, 2,
        xi.items.SCROLL_OF_BANISH,           140, 2,
        xi.items.SCROLL_OF_BANISHGA,        1165, 2,
        xi.items.SCROLL_OF_BLINK,           2097, 2,
        xi.items.SCROLL_OF_CURE,              61, 3,
        xi.items.SCROLL_OF_CURAGA,          1363, 3,
        xi.items.SCROLL_OF_POISONA,          180, 3,
        xi.items.SCROLL_OF_PARALYNA,         324, 3,
        xi.items.SCROLL_OF_BLINDNA,          990, 3,
        xi.items.SCROLL_OF_DIA,               82, 3,
        xi.items.SCROLL_OF_PROTECT,          219, 3,
        xi.items.SCROLL_OF_SHELL,           1584, 3,
        xi.items.SCROLL_OF_AQUAVEIL,         360, 3,
    }

    player:showText(npc, ID.text.KUSUSU_SHOP_DIALOG)
    xi.shop.nation(player, stock, xi.nation.WINDURST)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
