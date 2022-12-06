-----------------------------------
-- Area: Port San d'Oria
--  NPC: Nimia
-- Elshimo Lowlands Regional Merchant
-----------------------------------
local ID = require("scripts/zones/Port_San_dOria/IDs")
require("scripts/globals/items")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if GetRegionOwner(xi.region.ELSHIMOLOWLANDS) ~= xi.nation.SANDORIA then
        player:showText(npc, ID.text.NIMIA_CLOSED_DIALOG)
    else
        local stock =
        {
            xi.items.BUNCH_OF_KAZHAM_PEPPERS,      55,
            xi.items.KAZHAM_PINEAPPLE,            55,
            xi.items.MITHRAN_TOMATO,              36,
            xi.items.PINCH_OF_BLACK_PEPPER,       234,
            xi.items.OGRE_PUMPKIN,                 88,
            xi.items.KUKURU_BEAN,                 110,
            xi.items.PHALAENOPSIS,              1656,
        }

        player:showText(npc, ID.text.NIMIA_OPEN_DIALOG)
        xi.shop.general(player, stock, xi.quest.fame_area.SANDORIA)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
