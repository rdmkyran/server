-----------------------------------
-- Area: Windurst_Woods
--  NPC: Nhobi Zalkia
-- Only sells when Windurst controlls Kuzotz Region
-- Confirmed shop stock, August 2013
-----------------------------------
local ID = require("scripts/zones/Windurst_Woods/IDs")
require("scripts/globals/items")
require("scripts/globals/events/harvest_festivals")
require("scripts/globals/shop")
require("scripts/globals/zone")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    onHalloweenTrade(player, trade, npc)
end

entity.onTrigger = function(player, npc)
    local regionOwner = GetRegionOwner(xi.region.KUZOTZ)

    if regionOwner ~= xi.nation.WINDURST then
        player:showText(npc, ID.text.NHOBI_ZALKIA_CLOSED_DIALOG)
    else
        player:showText(npc, ID.text.NHOBI_ZALKIA_OPEN_DIALOG)

        local stock =
        {
            xi.items.CACTUAR_NEEDLE,              855,
            xi.items.THUNDERMELON,               299,
            xi.items.WATERMELON,                 184
        }
        xi.shop.general(player, stock, xi.quest.fame_area.WINDURST)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
