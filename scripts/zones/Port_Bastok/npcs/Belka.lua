-----------------------------------
-- Area: Port Bastok
--  NPC: Belka
-- Derfland Regional Merchant
-----------------------------------
local ID = require("scripts/zones/Port_Bastok/IDs")
require("scripts/globals/conquest")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if GetRegionOwner(xi.region.DERFLAND) ~= xi.nation.BASTOK then
        player:showText(npc, ID.text.BELKA_CLOSED_DIALOG)
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

        player:showText(npc, ID.text.BELKA_OPEN_DIALOG)
        xi.shop.general(player, stock, xi.quest.fame_area.BASTOK)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
