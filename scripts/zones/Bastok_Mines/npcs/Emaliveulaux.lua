-----------------------------------
-- Area: Bastok Mines
--  NPC: Emaliveulaux
-- Tavnazian Archipelago Regional Merchant
-----------------------------------
local ID = require("scripts/zones/Bastok_Mines/IDs")
require("scripts/globals/items")
require("scripts/globals/events/harvest_festivals")
require("scripts/globals/conquest")
require("scripts/globals/missions")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    onHalloweenTrade(player, trade, npc)
end

entity.onTrigger = function(player, npc)
    if player:getCurrentMission(xi.mission.log_id.COP) >= xi.mission.id.cop.THE_SAVAGE then
        if GetRegionOwner(xi.region.TAVNAZIANARCH) ~= xi.nation.BASTOK then
            player:showText(npc, ID.text.EMALIVEULAUX_CLOSED_DIALOG)
        else
            local stock =
            {
                xi.items.SPRIG_OF_APPLE_MINT,        290,
                xi.items.JAR_OF_GROUND_WASABI,      1945,
                xi.items.LUFAISE_FLY,                99,
                xi.items.SPRIG_OF_MISAREAUX_PARSLEY,  233,
                xi.items.BUNCH_OF_HABANERO_PEPPERS,  920,
            }

            player:showText(npc, ID.text.EMALIVEULAUX_OPEN_DIALOG)
            xi.shop.general(player, stock, xi.quest.fame_area.BASTOK)
        end
    else
        player:showText(npc, ID.text.EMALIVEULAUX_COP_NOT_COMPLETED)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
