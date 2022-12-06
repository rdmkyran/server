-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Corua
-- Ronfaure Regional Merchant
-- !pos -66 2 -11 230
-----------------------------------
local ID = require("scripts/zones/Southern_San_dOria/IDs")
require("scripts/globals/items")
require("scripts/globals/events/harvest_festivals")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    onHalloweenTrade(player, trade, npc)
end

entity.onTrigger = function(player, npc)
    if GetRegionOwner(xi.region.RONFAURE) ~= xi.nation.SANDORIA then
        player:showText(npc, ID.text.CORUA_CLOSED_DIALOG)
    else
        local stock =
        {
            xi.items.SAN_DORIAN_CARROT,          29,
            xi.items.BUNCH_OF_SAN_DORIAN_GRAPES,  69,
            xi.items.RONFAURE_CHESTNUT,          110,
            xi.items.BAG_OF_SAN_DORIAN_FLOUR,     55,
        }

        player:showText(npc, ID.text.CORUA_OPEN_DIALOG)
        xi.shop.general(player, stock, xi.quest.fame_area.SANDORIA)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
