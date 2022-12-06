-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Ferdoulemiont
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Southern_San_dOria/IDs")
require("scripts/globals/shop")
require("scripts/globals/pathfind")
-----------------------------------
local entity = {}

local pathNodes =
{
    { x = 10.886, y = 2.200, z = -95.739, rotation = 224, wait = 8000 },
    { rotation = 0, wait = 8000 },
    { rotation = 224, wait = 8000 },
    { rotation = 192, wait = 8000 },
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
        xi.items.BLACK_CHOCOBO_FEATHER,       1125, 1,
        xi.items.DART,                         9, 2,
        xi.items.JUG_OF_BUG_BROTH,           680, 3,
        xi.items.JUG_OF_CARRION_BROTH,       680, 3,
        xi.items.JUG_OF_CARROT_BROTH,         81, 3,
        xi.items.JUG_OF_HERBAL_BROTH,        124, 3,
        xi.items.CHOCOBO_FEATHER,                7, 3,
        xi.items.BUNCH_OF_GYSAHL_GREENS,       61, 3,
        xi.items.PET_FOOD_ALPHA_BISCUIT,      10, 3,
        xi.items.PET_FOOD_BETA_BISCUIT,       81, 3,
        xi.items.SCROLL_OF_CHOCOBO_MAZURKA, 49680, 3,
        xi.items.SCROLL_OF_KNIGHTS_MINNE,      16, 3,
        xi.items.SCROLL_OF_KNIGHTS_MINNE_II,   864, 3,
        xi.items.SCROLL_OF_KNIGHTS_MINNE_III,  5148, 3,
        xi.items.SCROLL_OF_KNIGHTS_MINNE_V, 50692, 3,
        xi.items.LA_THEINE_MILLET,           1984, 3,
    }

    player:showText(npc, ID.text.FERDOULEMIONT_SHOP_DIALOG)
    xi.shop.nation(player, stock, xi.nation.SANDORIA)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
