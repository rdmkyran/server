-----------------------------------
-- Area: Bastok_Mines
--  NPC: Mille
-- Norvallen Regional Merchant
-----------------------------------
local ID = require("scripts/zones/Bastok_Mines/IDs")
require("scripts/globals/items")
require("scripts/globals/events/harvest_festivals")
require("scripts/globals/conquest")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    onHalloweenTrade(player, trade, npc)
end

entity.onTrigger = function(player, npc)
    if GetRegionOwner(xi.region.NORVALLEN) ~= xi.nation.BASTOK then
        player:showText(npc, ID.text.MILLE_CLOSED_DIALOG)
    else
        local stock =
        {
            xi.items.ARROWWOOD_LOG,             18,
            xi.items.ASH_LOG,                   88,
            xi.items.BLUE_PEAS,                 25,
            xi.items.POT_OF_CRYING_MUSTARD,     25,
        }

        player:showText(npc, ID.text.MILLE_OPEN_DIALOG)
        xi.shop.general(player, stock, xi.quest.fame_area.BASTOK)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
