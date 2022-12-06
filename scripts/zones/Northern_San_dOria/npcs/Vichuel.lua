-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Vichuel
-- Only sells when San d'Oria controlls Fauregandi Region
-----------------------------------
local ID = require("scripts/zones/Northern_San_dOria/IDs")
require("scripts/globals/events/harvest_festivals")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    onHalloweenTrade(player, trade, npc)
end

entity.onTrigger = function(player, npc)
    if GetRegionOwner(xi.region.FAUREGANDI) ~= xi.nation.SANDORIA then
        player:showText(npc, ID.text.VICHUEL_CLOSED_DIALOG)
    else
        local stock =
        {
            xi.items.CLUMP_OF_BEAUGREENS,       90,
            xi.items.FAERIE_APPLE,              39,
            xi.items.MAPLE_LOG,                  54,
        }

        player:showText(npc, ID.text.VICHUEL_OPEN_DIALOG)
        xi.shop.general(player, stock, xi.quest.fame_area.SANDORIA)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
