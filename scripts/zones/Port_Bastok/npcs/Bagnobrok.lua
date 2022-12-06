-----------------------------------
-- Area: Port Bastok
--  NPC: Bagnobrok
-- Movalpolos Regional Merchant
-----------------------------------
local ID = require("scripts/zones/Port_Bastok/IDs")
require("scripts/globals/conquest")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if GetRegionOwner(xi.region.MOVALPOLOS) ~= xi.nation.BASTOK then
        player:showText(npc, ID.text.BAGNOBROK_CLOSED_DIALOG)
    else
        local stock =
        {
            xi.items.CHUNK_OF_COPPER_ORE,          11,
            xi.items.CORAL_FUNGUS,               694,
            xi.items.DANCESHROOM,               4032,
            xi.items.CHUNK_OF_KOPPARNICKEL_ORE, 6500,
            xi.items.BOTTLE_OF_MOVALPOLOS_WATER,  736,
        }

        player:showText(npc, ID.text.BAGNOBROK_OPEN_DIALOG)
        xi.shop.general(player, stock, xi.quest.fame_area.BASTOK)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
