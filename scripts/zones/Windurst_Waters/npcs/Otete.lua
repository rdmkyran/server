-----------------------------------
-- Area: Windurst_Waters
--  NPC: Otete
-- Only sells when Windurst controlls Li'Telor Region
-- Confirmed shop stock, August 2013
-----------------------------------
local ID = require("scripts/zones/Windurst_Waters/IDs")
require("scripts/globals/items")
require("scripts/globals/conquest")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local regionOwner = GetRegionOwner(xi.region.LITELOR)

    if regionOwner ~= xi.nation.WINDURST then
        player:showText(npc, ID.text.OTETE_CLOSED_DIALOG)
    else
        player:showText(npc, ID.text.OTETE_OPEN_DIALOG)

        local stock =
        {
            xi.items.HANDFUL_OF_BAY_LEAVES,        119,
            xi.items.FLASK_OF_HOLY_WATER,        6440
        }
        xi.shop.general(player, stock, xi.quest.fame_area.WINDURST)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
