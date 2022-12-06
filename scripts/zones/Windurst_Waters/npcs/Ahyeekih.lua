-----------------------------------
-- Area: Windurst Waters
--  NPC: Ahyeekih
-- Only sells when Windurst controls Kolshushu
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
    local regionOwner = GetRegionOwner(xi.region.KOLSHUSHU)

    if regionOwner ~= xi.nation.WINDURST then
        player:showText(npc, ID.text.AHYEEKIH_CLOSED_DIALOG)
    else
        player:showText(npc, ID.text.AHYEEKIH_OPEN_DIALOG)

        local stock =
        {
            xi.items.BUNCH_OF_BUBURIMU_GRAPES,    184,
            xi.items.CASABLANCA,                 1620,
            xi.items.SLICE_OF_DHALMEL_MEAT,       220,
            xi.items.BULB_OF_MHAURA_GARLIC,         72,
            xi.items.YAGUDO_CHERRY,                40
        }
        xi.shop.general(player, stock, xi.quest.fame_area.WINDURST)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
