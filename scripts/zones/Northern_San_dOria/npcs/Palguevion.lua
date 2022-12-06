-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Palguevion
-- Only sells when San d'Oria controlls Valdeaunia Region
-----------------------------------
local ID = require("scripts/zones/Northern_San_dOria/IDs")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if GetRegionOwner(xi.region.VALDEAUNIA) ~= xi.nation.SANDORIA then
        player:showText(npc, ID.text.PALGUEVION_CLOSED_DIALOG)
    else
        local stock =
        {
            xi.items.FROST_TURNIP,               29,
            xi.items.SPRIG_OF_SAGE,              170,
        }

        player:showText(npc, ID.text.PALGUEVION_OPEN_DIALOG)
        xi.shop.general(player, stock, xi.quest.fame_area.SANDORIA)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
