-----------------------------------
-- Area: Windurst_Woods
--  NPC: Bin Stejihna
-- Only sells when Windurst controlls Zulkheim Region
-- Confirmed shop stock, August 2013
-----------------------------------
local ID = require("scripts/zones/Windurst_Woods/IDs")
require("scripts/globals/items")
require("scripts/globals/shop")
require("scripts/globals/zone")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local regionOwner = GetRegionOwner(xi.region.ZULKHEIM)

    if regionOwner ~= xi.nation.WINDURST then
        player:showText(npc, ID.text.BIN_STEJIHNA_CLOSED_DIALOG)
    else
        player:showText(npc, ID.text.BIN_STEJIHNA_OPEN_DIALOG)

        local stock =
        {
            xi.items.BAG_OF_SEMOLINA,            1840,
            xi.items.SLICE_OF_GIANT_SHEEP_MEAT,    44,
            xi.items.PINCH_OF_DRIED_MARJORAM,       44,
            xi.items.BAG_OF_SAN_DORIAN_FLOUR,       55,
            xi.items.BAG_OF_RYE_FLOUR,              36,
            xi.items.LA_THEINE_CABBAGE,            22,
            xi.items.JUG_OF_SELBINA_MILK,          55
        }

        local rank = GetNationRank(xi.nation.WINDURST)
        if rank ~= 3 then
            table.insert(stock, 1840) --Semolina
            table.insert(stock, 1840)
        end

        xi.shop.general(player, stock, xi.quest.fame_area.WINDURST)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
