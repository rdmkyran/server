-----------------------------------
-- Area: Bastok_Mines
--  NPC: Rodellieux
-- Fauregandi Regional Merchant
-----------------------------------
local ID = require("scripts/zones/Bastok_Mines/IDs")
require("scripts/globals/conquest")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if GetRegionOwner(xi.region.FAUREGANDI) ~= xi.nation.BASTOK then
        player:showText(npc, ID.text.RODELLIEUX_CLOSED_DIALOG)
    else
        local stock =
        {
            xi.items.CLUMP_OF_BEAUGREENS,       90,
            xi.items.FAERIE_APPLE,              39,
            xi.items.MAPLE_LOG,                  54,
        }

        player:showText(npc, ID.text.RODELLIEUX_OPEN_DIALOG)
        xi.shop.general(player, stock, xi.quest.fame_area.BASTOK)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
