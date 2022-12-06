-----------------------------------
-- Area: Tavnazian Safehold
--  NPC: Mazuro-Oozuro
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Tavnazian_Safehold/IDs")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.LUFAISE_FLY,                 108,
        xi.items.CLOTHESPOLE,                2640,
        xi.items.ARROWWOOD_LOG,                  20,
        xi.items.ELM_LOG,                      7800,
        -- 2871,  10000,    -- Safehold Waystone (2010 Abyssea)
        -- 4913, 175827,    -- Scroll of Distract II (2014)
        -- 4915, 217000,    -- Scroll of Frazzle II (2014)
    }

    if player:getCurrentMission(xi.mission.log_id.COP) >= xi.mission.id.cop.SHELTERING_DOUBT then
        stock =
        {
            xi.items.LUFAISE_FLY,                 108,
            xi.items.CLOTHESPOLE,                2640,
            xi.items.ARROWWOOD_LOG,                  20,
            xi.items.ELM_LOG,                      7800,
            xi.items.SCROLL_OF_BANISH_III,       66000,
        -- 2871,  10000,    -- Safehold Waystone (2010 Abyssea)
        -- 4913, 175827,    -- Scroll of Distract II (2014)
        -- 4915, 217000,    -- Scroll of Frazzle II (2014)
        }
    end

    player:showText(npc, ID.text.MAZUROOOZURO_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
