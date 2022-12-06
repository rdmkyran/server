-----------------------------------
-- Area: Port Windurst
--  NPC: Aroro
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Port_Windurst/IDs")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.SCROLL_OF_BLIND,            114, 1,
        xi.items.SCROLL_OF_POISON,            84, 2,
        xi.items.SCROLL_OF_BIO,              368, 2,
        xi.items.SCROLL_OF_SLEEP,           2300, 2,
        xi.items.SCROLL_OF_STONE,             62, 3,
        xi.items.SCROLL_OF_WATER,            143, 3,
        xi.items.SCROLL_OF_AERO,             331, 3,
        xi.items.SCROLL_OF_FIRE,             855, 3,
        xi.items.SCROLL_OF_BLIZZARD,        1619, 3,
        xi.items.SCROLL_OF_THUNDER,         3334, 3,
        xi.items.SCROLL_OF_BURN,            4747, 3,
        xi.items.SCROLL_OF_FROST,           3770, 3,
        xi.items.SCROLL_OF_CHOKE,           2300, 3,
        xi.items.SCROLL_OF_RASP,            1867, 3,
        xi.items.SCROLL_OF_SHOCK,           1393, 3,
        xi.items.SCROLL_OF_DROWN,           6508, 3,
    }

    player:showText(npc, ID.text.ARORO_SHOP_DIALOG)
    xi.shop.nation(player, stock, xi.nation.WINDURST)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
