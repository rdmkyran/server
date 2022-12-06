-----------------------------------
-- Area: Bastok Mines
--  NPC: Aulavia
-- Vollbow Regional Merchant
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
    if GetRegionOwner(xi.region.VOLLBOW) ~= xi.nation.BASTOK then
        player:showText(npc, ID.text.AULAVIA_CLOSED_DIALOG)
    else
        local stock =
        {
            xi.items.CHAMOMILE,                   119,
            xi.items.HANDFUL_OF_FISH_SCALES,       88,
            xi.items.CHUNK_OF_ROCK_SALT,           14,
            xi.items.SWEET_WILLIAM,             1656,
        }

        player:showText(npc, ID.text.AULAVIA_OPEN_DIALOG)
        xi.shop.general(player, stock, xi.quest.fame_area.BASTOK)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
