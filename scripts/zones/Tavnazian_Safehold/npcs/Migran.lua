-----------------------------------
-- Area: Tavnasian Safehold
--  NPC: Migran
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
        xi.items.BRASS_HARNESS,             2485,
        xi.items.HOLLY_CLOGS,               1625,
    }

    if player:getCurrentMission(xi.mission.log_id.COP) >= xi.mission.id.cop.SHELTERING_DOUBT then
        stock =
        {
            xi.items.BARONE_COSCIALES,          4042200,
            xi.items.BARONE_GAMBIERAS,          25210200,
            xi.items.BARONE_MANOPOLAS,          7276200,
            xi.items.BRASS_HARNESS,             2485,
            xi.items.HOLLY_CLOGS,               1625,
            xi.items.VIR_SUBLIGAR,              8000000,
            xi.items.FEMINA_SUBLIGAR,           8000000,

        }
    end

    player:showText(npc, ID.text.MIGRAN_SHOP_DIALOG) -- 10914 with 2 items available, may change
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
