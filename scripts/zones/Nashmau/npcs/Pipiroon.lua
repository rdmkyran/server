-----------------------------------
-- Area: Nashmau
--  NPC: Pipiroon
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Nashmau/IDs")
require("scripts/globals/items")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.GRENADE,                   1204,
        xi.items.RIOT_GRENADE,              6000,
        xi.items.PINCH_OF_BOMB_ASH,            515,
        xi.items.NASHMAU_WAYSTONE,          10000,
    }

    player:showText(npc, ID.text.PIPIROON_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
