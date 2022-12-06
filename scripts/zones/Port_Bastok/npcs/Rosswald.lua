-----------------------------------
-- Area: Port Bastok
--  NPC: Rosswald
-- Zulkheim Regional Merchant
-----------------------------------
local ID = require("scripts/zones/Port_Bastok/IDs")
require("scripts/globals/conquest")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if GetRegionOwner(xi.region.ZULKHEIM) ~= xi.nation.BASTOK then
        player:showText(npc, ID.text.ROSSWALD_CLOSED_DIALOG)
    else
        local stock =
        {
            xi.items.SLICE_OF_GIANT_SHEEP_MEAT,   44,
            xi.items.PINCH_OF_DRIED_MARJORAM,      44,
            xi.items.BAG_OF_SAN_DORIAN_FLOUR,      55,
            xi.items.BAG_OF_RYE_FLOUR,             36,
            xi.items.LA_THEINE_CABBAGE,           22,
            xi.items.JUG_OF_SELBINA_MILK,         55,
        }

        local rank = GetNationRank(xi.nation.BASTOK)
        if rank ~= 3 then
            table.insert(stock, 1840) --Semolina
            table.insert(stock, 1840)
        end

        player:showText(npc, ID.text.ROSSWALD_OPEN_DIALOG)
        xi.shop.general(player, stock, xi.quest.fame_area.BASTOK)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
