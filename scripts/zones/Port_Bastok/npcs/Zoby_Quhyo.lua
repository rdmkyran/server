-----------------------------------
-- Area: Port Bastok
--  NPC: Zoby Quhyo
-- Elshimo Lowlands Regional Merchant
-----------------------------------
local ID = require("scripts/zones/Port_Bastok/IDs")
require("scripts/globals/conquest")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if GetRegionOwner(xi.region.ELSHIMOLOWLANDS) ~= xi.nation.BASTOK then
        player:showText(npc, ID.text.ZOBYQUHYO_CLOSED_DIALOG)
    else
        local stock =
        {
            xi.items.PINCH_OF_BLACK_PEPPER,       234,
            xi.items.BUNCH_OF_KAZHAM_PEPPERS,      55,
            xi.items.KAZHAM_PINEAPPLE,            55,
            xi.items.KUKURU_BEAN,                 110,
            xi.items.MITHRAN_TOMATO,              36,
            xi.items.OGRE_PUMPKIN,                 88,
            xi.items.PHALAENOPSIS,              1656,
        }

        player:showText(npc, ID.text.ZOBYQUHYO_OPEN_DIALOG)
        xi.shop.general(player, stock, xi.quest.fame_area.BASTOK)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
