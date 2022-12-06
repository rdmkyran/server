-----------------------------------
-- Area: Port Bastok
--  NPC: Evelyn
-- Gustaberg Regional Merchant
-----------------------------------
local ID = require("scripts/zones/Port_Bastok/IDs")
require("scripts/globals/conquest")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if GetRegionOwner(xi.region.GUSTABERG) ~= xi.nation.BASTOK then
        player:showText(npc, ID.text.EVELYN_CLOSED_DIALOG)
    else
        local stock =
        {
            xi.items.PINCH_OF_SULFUR,           703,
            xi.items.POPOTO,                      43,
            xi.items.BAG_OF_RYE_FLOUR,            36,
            xi.items.EGGPLANT,                   40,
        }

        player:showText(npc, ID.text.EVELYN_OPEN_DIALOG)
        xi.shop.general(player, stock, xi.quest.fame_area.BASTOK)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
