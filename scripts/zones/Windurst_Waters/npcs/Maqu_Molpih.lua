-----------------------------------
-- Area: Windurst Waters
--  NPC: Maqu Molpih
-- Only sells when Windurst controlls Aragoneu Region
-- Confirmed shop stock, August 2013
-----------------------------------
require("scripts/globals/events/harvest_festivals")
require("scripts/globals/items")
local ID = require("scripts/zones/Windurst_Waters/IDs")
require("scripts/globals/conquest")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    onHalloweenTrade(player, trade, npc)
end

entity.onTrigger = function(player, npc)
    local regionOwner = GetRegionOwner(xi.region.ARAGONEU)

    if regionOwner ~= xi.nation.WINDURST then
        player:showText(npc, ID.text.MAQUMOLPIH_CLOSED_DIALOG)
    else
        player:showText(npc, ID.text.MAQUMOLPIH_OPEN_DIALOG)

        local stock =
        {
            xi.items.BAG_OF_HORO_FLOUR,           36,
            xi.items.EAR_OF_MILLIONCORN,          44,
            xi.items.EAR_OF_ROASTED_CORN,       114,
            xi.items.HANDFUL_OF_SUNFLOWER_SEEDS,  92,
            xi.items.YAGUDO_FEATHER,              36,
        }
        xi.shop.general(player, stock, xi.quest.fame_area.WINDURST)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
