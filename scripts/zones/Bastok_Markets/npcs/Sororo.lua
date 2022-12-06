-----------------------------------
-- Area: Bastok Markets
--  NPC: Sororo
-- Standard Merchant NPC
-- !pos -220.217 -2.824 51.542 235
-----------------------------------
local ID = require("scripts/zones/Bastok_Markets/IDs")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.SCROLL_OF_DIAGA,            1165, 1,
        xi.items.SCROLL_OF_STONESKIN,        7025, 1,
        xi.items.SCROLL_OF_SLOW,              837, 1,
        xi.items.SCROLL_OF_CURE_II,           585, 2,
        xi.items.SCROLL_OF_BANISH,            140, 2,
        xi.items.SCROLL_OF_BANISHGA,         1165, 2,
        xi.items.SCROLL_OF_BLINK,            2097, 2,
        xi.items.SCROLL_OF_CURE,               61, 3,
        xi.items.SCROLL_OF_CURAGA,           1363, 3,
        xi.items.SCROLL_OF_POISONA,           180, 3,
        xi.items.SCROLL_OF_PARALYNA,          324, 3,
        xi.items.SCROLL_OF_BLINDNA,           990, 3,
        xi.items.SCROLL_OF_DIA,                82, 3,
        xi.items.SCROLL_OF_PROTECT,           219, 3,
        xi.items.SCROLL_OF_SHELL,            1584, 3,
        xi.items.SCROLL_OF_REPOSE,          29700, 3,
    }

    player:showText(npc, ID.text.SORORO_SHOP_DIALOG)
    xi.shop.nation(player, stock, xi.nation.BASTOK)
end

return entity
