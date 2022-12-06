-----------------------------------
-- Area: Lower Jeuno
--  NPC: Rhimonne
-----------------------------------
local ID = require("scripts/zones/Lower_Jeuno/IDs")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.BUNCH_OF_GYSAHL_GREENS,    62,
        xi.items.CHOCOBO_FEATHER,             7,
        xi.items.DART,                      9,
    }

    player:showText(npc, ID.text.RHIMONNE_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
