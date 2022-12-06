-----------------------------------
-- Area: Port San d'Oria
--  NPC: Bonmaurieut
-- Elshimo Uplands Regional Merchant
-----------------------------------
local ID = require("scripts/zones/Port_San_dOria/IDs")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if GetRegionOwner(xi.region.ELSHIMOUPLANDS) ~= xi.nation.SANDORIA then
        player:showText(npc, ID.text.BONMAURIEUT_CLOSED_DIALOG)
    else
        local stock =
        {
            xi.items.CATTLEYA,                  1656,
            xi.items.STICK_OF_CINNAMON,           239,
            xi.items.BUNCH_OF_PAMAMAS,            73,
            xi.items.PIECE_OF_RATTAN_LUMBER,      147,
        }

        player:showText(npc, ID.text.BONMAURIEUT_OPEN_DIALOG)
        xi.shop.general(player, stock, xi.quest.fame_area.SANDORIA)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
