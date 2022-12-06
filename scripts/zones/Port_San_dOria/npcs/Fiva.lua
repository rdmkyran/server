-----------------------------------
-- Area: Port San d'Oria
--  NPC: Fiva
-- Kolshushu Regional Merchant
-----------------------------------
local ID = require("scripts/zones/Port_San_dOria/IDs")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if GetRegionOwner(xi.region.KOLSHUSHU) ~= xi.nation.SANDORIA then
        player:showText(npc, ID.text.FIVA_CLOSED_DIALOG)
    else
        local stock =
        {
            xi.items.BUNCH_OF_BUBURIMU_GRAPES,   184,
            xi.items.CASABLANCA,                1620,
            xi.items.SLICE_OF_DHALMEL_MEAT,      220,
            xi.items.BULB_OF_MHAURA_GARLIC,        72,
            xi.items.YAGUDO_CHERRY,               40,
        }

        player:showText(npc, ID.text.FIVA_OPEN_DIALOG)
        xi.shop.general(player, stock, xi.quest.fame_area.SANDORIA)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
