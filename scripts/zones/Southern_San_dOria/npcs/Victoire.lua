-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Victoire
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Southern_San_dOria/IDs")
require("scripts/globals/items")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.FACEGUARD,                 1450,
        xi.items.HEADGEAR,                  1936,
        xi.items.SCALE_MAIL,                2230,
        xi.items.DOUBLET,                   2745,
        xi.items.SCALE_FINGER_GAUNTLETS,    1190,
        xi.items.GLOVES,                    1515,
        xi.items.SCALE_CUISSES,             1790,
        xi.items.BRAIS,                     2110,
        xi.items.SCALE_GREAVES,             1085,
        xi.items.GAITERS,                   1410,
    }

    player:showText(npc, ID.text.CARAUTIA_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
