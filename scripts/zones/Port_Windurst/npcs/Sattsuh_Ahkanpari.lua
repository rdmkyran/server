-----------------------------------
-- Area: Port Windurst
--  NPC: Sattsuh Ahkanpari
-- Elshimo Uplands Regional Merchant
-----------------------------------
local ID = require("scripts/zones/Port_Windurst/IDs")
require("scripts/globals/conquest")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if GetRegionOwner(xi.region.ELSHIMOUPLANDS) ~= xi.nation.WINDURST then
        player:showText(npc, ID.text.SATTSUHAHKANPARI_CLOSED_DIALOG)
    else
        local stock =
        {
            xi.items.CATTLEYA,                  1656,
            xi.items.STICK_OF_CINNAMON,           239,
            xi.items.BUNCH_OF_PAMAMAS,            73,
            xi.items.PIECE_OF_RATTAN_LUMBER,      147,
        }

        player:showText(npc, ID.text.SATTSUHAHKANPARI_OPEN_DIALOG)
        xi.shop.general(player, stock, xi.quest.fame_area.WINDURST)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
