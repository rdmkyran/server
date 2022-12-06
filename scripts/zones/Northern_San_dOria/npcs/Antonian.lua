-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Antonian
-- Regional Marchant NPC
-- Only sells when San d'Oria controlls Aragoneu.
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
    if GetRegionOwner(xi.region.ARAGONEU) ~= xi.nation.SANDORIA then
        player:showText(npc, ID.text.ANTONIAN_CLOSED_DIALOG)
    else
        local stock =
        {
            xi.items.BAG_OF_HORO_FLOUR,           36,
            xi.items.EAR_OF_MILLIONCORN,          44,
            xi.items.EAR_OF_ROASTED_CORN,       114,
            xi.items.HANDFUL_OF_SUNFLOWER_SEEDS,  92,
            xi.items.YAGUDO_FEATHER,              36,
        }

        player:showText(npc, ID.text.ANTONIAN_OPEN_DIALOG)
        xi.shop.general(player, stock, xi.quest.fame_area.SANDORIA)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
