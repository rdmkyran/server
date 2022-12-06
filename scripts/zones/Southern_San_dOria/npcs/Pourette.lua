-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Pourette
-- Derfland Regional Merchant
-----------------------------------
local ID = require("scripts/zones/Southern_San_dOria/IDs")
require("scripts/globals/items")
require("scripts/globals/events/harvest_festivals")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    onHalloweenTrade(player, trade, npc)
end

entity.onTrigger = function(player, npc)
    if GetRegionOwner(xi.region.DERFLAND) ~= xi.nation.SANDORIA then
        player:showText(npc, ID.text.POURETTE_CLOSED_DIALOG)
    else
        local stock =
        {
            xi.items.DERFLAND_PEAR,              128,
            xi.items.GINGER_ROOT,                 142,
            xi.items.BUNCH_OF_GYSAHL_GREENS,      62,
            xi.items.OLIVE_FLOWER,              1656,
            xi.items.FLASK_OF_OLIVE_OIL,           14,
            xi.items.WIJNRUIT,                    110,
        }

        player:showText(npc, ID.text.POURETTE_OPEN_DIALOG)
        xi.shop.general(player, stock, xi.quest.fame_area.SANDORIA)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
