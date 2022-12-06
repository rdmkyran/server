-----------------------------------
-- Area: Bastok Markets
--  NPC: Oggodett
-- Aragoneu Regional Goods
-----------------------------------
local ID = require("scripts/zones/Bastok_Markets/IDs")
require("scripts/globals/items")
require("scripts/globals/conquest")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if GetRegionOwner(xi.region.ARAGONEU) ~= xi.nation.BASTOK then
        player:showText(npc, ID.text.OGGODETT_CLOSED_DIALOG)
    else
        local stock =
        {
            xi.items.BAG_OF_HORO_FLOUR,           36,
            xi.items.EAR_OF_MILLIONCORN,          44,
            xi.items.EAR_OF_ROASTED_CORN,       114,
            xi.items.HANDFUL_OF_SUNFLOWER_SEEDS,  92,
            xi.items.YAGUDO_FEATHER,              36,
        }

        player:showText(npc, ID.text.OGGODETT_OPEN_DIALOG)
        xi.shop.general(player, stock, xi.quest.fame_area.BASTOK)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
