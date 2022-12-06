-----------------------------------
-- Area: Lower Jeuno
--  NPC: Stinknix
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Lower_Jeuno/IDs")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.PINCH_OF_POISON_DUST,         294,
        xi.items.PINCH_OF_VENOM_DUST,         1035,
        xi.items.PINCH_OF_PARALYSIS_DUST,     2000,
        xi.items.IRON_ARROW,                   7,
        xi.items.CROSSBOW_BOLT,                5,
        xi.items.GRENADE,                   1107,
        xi.items.DUCHY_WAYSTONE,            10000,
    }

    player:showText(npc, ID.text.JUNK_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
