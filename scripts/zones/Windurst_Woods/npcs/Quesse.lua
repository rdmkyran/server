-----------------------------------
-- Area: Windurst Woods
--  NPC: Quesse
-- Standard Merchant NPC
-- Confirmed shop stock, August 2013
-----------------------------------
local ID = require("scripts/zones/Windurst_Woods/IDs")
require("scripts/globals/items")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.BLACK_CHOCOBO_FEATHER,       1150,  1,
        xi.items.DART,                      9,     2,
        xi.items.BUNCH_OF_GYSAHL_GREENS,     62,    3,
        xi.items.CHOCOBO_FEATHER,             7,     3,
        xi.items.PET_FOOD_ALPHA_BISCUIT,    11,    3,
        xi.items.PET_FOOD_BETA_BISCUIT,     82,    3,
        xi.items.JUG_OF_CARROT_BROTH,       82,    3,
        xi.items.JUG_OF_BUG_BROTH,          695,   3,
        xi.items.JUG_OF_HERBAL_BROTH,       126,   3,
        xi.items.JUG_OF_CARRION_BROTH,      695,   3,
        xi.items.SCROLL_OF_CHOCOBO_MAZURKA,  50784, 3,
    }

    player:showText(npc, ID.text.QUESSE_SHOP_DIALOG)
    xi.shop.nation(player, stock, xi.nation.WINDURST)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
