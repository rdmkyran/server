-----------------------------------
-- Area: Port Windurst
--  NPC: Lebondur
-- Vollbow Regional Merchant
-----------------------------------
local ID = require("scripts/zones/Port_Windurst/IDs")
require("scripts/globals/conquest")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if GetRegionOwner(xi.region.VOLLBOW) ~= xi.nation.WINDURST then
        player:showText(npc, ID.text.LEBONDUR_CLOSED_DIALOG)
    else
        local stock =
        {
            xi.items.CHAMOMILE,                   119,
            xi.items.HANDFUL_OF_FISH_SCALES,       88,
            xi.items.CHUNK_OF_ROCK_SALT,           14,
            xi.items.SWEET_WILLIAM,             1656,
        }

        player:showText(npc, ID.text.LEBONDUR_OPEN_DIALOG)
        xi.shop.general(player, stock, xi.quest.fame_area.WINDURST)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
