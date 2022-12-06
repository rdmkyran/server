-----------------------------------
-- Area: Windurst Waters
--  NPC: Fomina
-- Only sells when Windurst controlls Elshimo Lowlands
-- Confirmed shop stock, August 2013
-----------------------------------
local ID = require("scripts/zones/Windurst_Waters/IDs")
require("scripts/globals/items")
require("scripts/globals/conquest")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local regionOwner = GetRegionOwner(xi.region.ELSHIMOLOWLANDS)

    if regionOwner ~= xi.nation.WINDURST then
        player:showText(npc, ID.text.FOMINA_CLOSED_DIALOG)
    else
        player:showText(npc, ID.text.FOMINA_OPEN_DIALOG)

        local stock =
        {
            xi.items.BUNCH_OF_KAZHAM_PEPPERS,       55,
            xi.items.KAZHAM_PINEAPPLE,             55,
            xi.items.MITHRAN_TOMATO,               36,
            xi.items.PINCH_OF_BLACK_PEPPER,        234,
            xi.items.OGRE_PUMPKIN,                  88,
            xi.items.KUKURU_BEAN,                  110,
            xi.items.PHALAENOPSIS,               1656
        }
        xi.shop.general(player, stock, xi.quest.fame_area.WINDURST)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
