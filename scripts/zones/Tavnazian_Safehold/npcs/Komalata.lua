-----------------------------------
-- Area: Tavnazian Safehold
--  NPC: Komalata
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Tavnazian_Safehold/IDs")
require("scripts/globals/missions")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.STRIP_OF_MEAT_JERKY,       110,
        xi.items.CHUNK_OF_ROCK_SALT,          14,
        xi.items.BAG_OF_RYE_FLOUR,            36,
        xi.items.FLASK_OF_DISTILLED_WATER,   10,
    }

    if player:getCurrentMission(xi.mission.log_id.COP) >= xi.mission.id.cop.SHELTERING_DOUBT then
        stock =
        {
            xi.items.BOTTLE_OF_APPLE_VINEGAR,     88,
            xi.items.LOAF_OF_BLACK_BREAD,       120,
            xi.items.STRIP_OF_MEAT_JERKY,       120,
            xi.items.CHUNK_OF_ROCK_SALT,          16,
            xi.items.BAG_OF_RYE_FLOUR,            40,
            xi.items.BAG_OF_SAN_DORIAN_FLOUR,     60,
            xi.items.SAN_DORIAN_CARROT,          32,
            xi.items.EAR_OF_MILLIONCORN,          48,
            xi.items.SPRIG_OF_APPLE_MINT,       316,
            xi.items.FLASK_OF_DISTILLED_WATER,   12,
        }
    end

    player:showText(npc, ID.text.KOMALATA_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
