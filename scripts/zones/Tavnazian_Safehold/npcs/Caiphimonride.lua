-----------------------------------
-- Area: Tavnazian Safehold
--  NPC: Caiphimonride
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Tavnazian_Safehold/IDs")
require("scripts/globals/items")
require("scripts/globals/missions")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.DAGGER,                    2030,
        xi.items.LONGSWORD,                 9216,
        xi.items.RUSTY_BOLT,                   4,
    }

    if player:getCurrentMission(xi.mission.log_id.COP) >= xi.mission.id.cop.SHELTERING_DOUBT then
        stock =
        {
            xi.items.DAGGER,                     2030,
            xi.items.LONGSWORD,                  9216,
            xi.items.RUSTY_BOLT,                    4,
            xi.items.FALX,                      37296,
            xi.items.VOULGE,                    20762,
        }
    end

    player:showText(npc, ID.text.CAIPHIMONRIDE_SHOP_DIALOG) -- 10908 with only 3 items available, may change
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
