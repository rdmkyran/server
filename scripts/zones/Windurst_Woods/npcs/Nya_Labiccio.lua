-----------------------------------
-- Area: Windurst Woods
--  NPC: Nya Labiccio
-- Only sells when Windurst controlls Gustaberg Region
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
    local regionOwner = GetRegionOwner(xi.region.GUSTABERG)

    if regionOwner ~= xi.nation.WINDURST then
        player:showText(npc, ID.text.NYALABICCIO_CLOSED_DIALOG)
    else
        player:showText(npc, ID.text.NYALABICCIO_OPEN_DIALOG)

        local stock =
        {
            xi.items.PINCH_OF_SULFUR,            703,
            xi.items.POPOTO,                       43,
            xi.items.BAG_OF_RYE_FLOUR,             36,
            xi.items.EGGPLANT,                    40
        }
        xi.shop.general(player, stock, xi.quest.fame_area.WINDURST)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
