-----------------------------------
-- Area: Bastok_Mines
--  NPC: Faustin
-- Ronfaure Regional Merchant
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
    if GetRegionOwner(xi.region.RONFAURE) ~= xi.nation.BASTOK then
        player:showText(npc, ID.text.FAUSTIN_CLOSED_DIALOG)
    else
        local stock =
        {
            xi.items.RONFAURE_CHESTNUT,         110,
            xi.items.SAN_DORIAN_CARROT,         29,
            xi.items.BAG_OF_SAN_DORIAN_FLOUR,    55,
            xi.items.BUNCH_OF_SAN_DORIAN_GRAPES, 69,
        }

        player:showText(npc, ID.text.FAUSTIN_OPEN_DIALOG)
        xi.shop.general(player, stock, xi.quest.fame_area.BASTOK)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
