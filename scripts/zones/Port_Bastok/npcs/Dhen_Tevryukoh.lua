-----------------------------------
-- Area: Port Bastok
--  NPC: Dhen Tevryukoh
-- Elshimo Uplands Regional Merchant
-- !pos 35 -2 2 236
-----------------------------------
local ID = require("scripts/zones/Port_Bastok/IDs")
require("scripts/globals/items")
require("scripts/globals/conquest")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if GetRegionOwner(xi.region.ELSHIMOUPLANDS) ~= xi.nation.BASTOK then
        player:showText(npc, ID.text.DHENTEVRYUKOH_CLOSED_DIALOG)
    else
        local stock =
        {
            xi.items.CATTLEYA,                  1656,
            xi.items.STICK_OF_CINNAMON,           239,
            xi.items.BUNCH_OF_PAMAMAS,            73,
            xi.items.PIECE_OF_RATTAN_LUMBER,      147,
        }

        player:showText(npc, ID.text.DHENTEVRYUKOH_OPEN_DIALOG)
        xi.shop.general(player, stock, xi.quest.fame_area.BASTOK)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
