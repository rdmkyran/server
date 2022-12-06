-----------------------------------
-- Area: Port Bastok
--  NPC: Vattian
-- Kuzotz Regional Merchant
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
    if GetRegionOwner(xi.region.KUZOTZ) ~= xi.nation.BASTOK then
        player:showText(npc, ID.text.VATTIAN_CLOSED_DIALOG)
    else
        local stock =
        {
            xi.items.CACTUAR_NEEDLE,             855,
            xi.items.THUNDERMELON,              299,
            xi.items.WATERMELON,                184,
        }

        player:showText(npc, ID.text.VATTIAN_OPEN_DIALOG)
        xi.shop.general(player, stock, xi.quest.fame_area.BASTOK)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
