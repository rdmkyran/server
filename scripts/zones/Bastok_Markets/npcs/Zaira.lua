-----------------------------------
-- Area: Batok Markets
--  NPC: Zaira
-- Standard Merchant NPC
-- !pos -217.316 -2.824 49.235 235
-----------------------------------
local ID = require("scripts/zones/Bastok_Markets/IDs")
require("scripts/globals/items")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.SCROLL_OF_BLIND,            111, 1,
        xi.items.SCROLL_OF_BIO,              360, 2,
        xi.items.SCROLL_OF_POISON,            82, 2,
        xi.items.SCROLL_OF_SLEEP,           2250, 2,
        xi.items.SCROLL_OF_STONE,             61, 3,
        xi.items.SCROLL_OF_WATER,            140, 3,
        xi.items.SCROLL_OF_AERO,             324, 3,
        xi.items.SCROLL_OF_FIRE,             837, 3,
        xi.items.SCROLL_OF_BLIZZARD,        1584, 3,
        xi.items.SCROLL_OF_THUNDER,         3261, 3,
        xi.items.SCROLL_OF_SHOCK,           1363, 3,
        xi.items.SCROLL_OF_RASP,            1827, 3,
        xi.items.SCROLL_OF_CHOKE,           2250, 3,
        xi.items.SCROLL_OF_FROST,           3688, 3,
        xi.items.SCROLL_OF_BURN,            4644, 3,
        xi.items.SCROLL_OF_DROWN,           6366, 3,
    }

    player:showText(npc, ID.text.ZAIRA_SHOP_DIALOG)
    xi.shop.nation(player, stock, xi.nation.BASTOK)
end

return entity
